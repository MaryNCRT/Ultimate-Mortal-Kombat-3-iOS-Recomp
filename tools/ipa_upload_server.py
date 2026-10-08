#!/usr/bin/env python3
"""Receive one user-selected IPA into the repository's ignored IPA/ folder."""

import argparse
import hmac
import json
import os
from pathlib import Path
import re
import secrets
import sys
import threading
import tempfile
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib.parse import parse_qs, urlsplit
import zipfile


ROOT = Path(__file__).resolve().parents[1]
PAGE = ROOT / "web" / "upload.html"
DEST_DIR = ROOT / "IPA"
DESTINATION = DEST_DIR / "UMK3.ipa"
MAX_UPLOAD_SIZE = 2 * 1024 * 1024 * 1024
MAX_CHUNK_SIZE = 1024 * 1024
TOKEN = secrets.token_urlsafe(32)
RESOURCE_PATH = re.compile(r"^Payload/[^/]+\.app/res/.+$", re.IGNORECASE)
UPLOAD_ID = re.compile(r"^[A-Za-z0-9_-]{32}$")
UPLOADS = {}
UPLOADS_LOCK = threading.Lock()


class UploadHandler(BaseHTTPRequestHandler):
    server_version = "UMK3-Local-Upload"

    def _reply(self, status, payload, content_type="application/json; charset=utf-8"):
        body = payload if isinstance(payload, bytes) else json.dumps(payload).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", content_type)
        self.send_header("Content-Length", str(len(body)))
        self.send_header("Cache-Control", "no-store")
        self.send_header("X-Content-Type-Options", "nosniff")
        self.send_header("Referrer-Policy", "no-referrer")
        self.send_header(
            "Content-Security-Policy",
            "default-src 'none'; script-src 'unsafe-inline'; style-src 'unsafe-inline'; "
            "connect-src 'self'; base-uri 'none'; form-action 'none'"
        )
        self.end_headers()
        self.wfile.write(body)

    def do_GET(self):
        request = urlsplit(self.path)
        if request.path == "/health":
            self._reply(200, {"ok": True})
            return
        if request.path != "/":
            self._reply(404, {"error": "Ruta no encontrada."})
            return

        supplied = parse_qs(request.query).get("token", [""])[0]
        if not hmac.compare_digest(supplied, TOKEN):
            self._reply(403, {"error": "Enlace de carga no válido."})
            return
        try:
            html = PAGE.read_text(encoding="utf-8").replace("__UPLOAD_TOKEN__", TOKEN)
        except OSError as error:
            self._reply(500, {"error": "No se pudo leer la página: " + str(error)})
            return
        self._reply(200, html.encode("utf-8"), "text/html; charset=utf-8")

    def do_POST(self):
        path = urlsplit(self.path).path
        if path == "/upload/start":
            self._start_upload()
        elif path == "/upload/chunk":
            self._write_chunk()
        elif path == "/upload/finish":
            self._finish_upload()
        else:
            self._reply(404, {"error": "Ruta no encontrada."})

    def _authorized(self):
        supplied = self.headers.get("X-Upload-Token", "")
        if not hmac.compare_digest(supplied, TOKEN):
            self._reply(403, {"error": "Autorización inválida."})
            return False
        return True

    def _content_length(self, maximum):
        try:
            length = int(self.headers.get("Content-Length", ""))
        except ValueError:
            self._reply(411, {"error": "Falta Content-Length válido."})
            return None
        if length < 0 or length > maximum:
            self._reply(413, {"error": "Tamaño de archivo no admitido."})
            return None
        return length

    def _start_upload(self):
        if not self._authorized():
            return
        if self.headers.get_content_type() != "application/json":
            self._reply(415, {"error": "Se esperaba JSON con el tamaño del archivo."})
            return
        length = self._content_length(4096)
        if length is None:
            return
        try:
            metadata = json.loads(self.rfile.read(length))
            total = metadata.get("bytes")
        except (json.JSONDecodeError, UnicodeDecodeError, AttributeError):
            self._reply(400, {"error": "Metadatos de carga inválidos."})
            return
        if not isinstance(total, int) or isinstance(total, bool) or not 4 <= total <= MAX_UPLOAD_SIZE:
            self._reply(413, {"error": "Tamaño de archivo no admitido."})
            return
        if DEST_DIR.is_symlink() or DEST_DIR.parent.resolve() != ROOT:
            self._reply(500, {"error": "La carpeta de destino no es segura."})
            return
        if DESTINATION.exists():
            self._reply(409, {"error": "Ya hay un IPA en IPA/UMK3.ipa; no se sobrescribió."})
            return

        DEST_DIR.mkdir(parents=True, exist_ok=True)
        try:
            output = tempfile.NamedTemporaryFile(
                mode="wb", prefix=".umk3-upload-", suffix=".part",
                dir=DEST_DIR, delete=False)
            temporary_path = Path(output.name)
            output.close()
            upload_id = secrets.token_urlsafe(24)
            with UPLOADS_LOCK:
                UPLOADS[upload_id] = {"path": temporary_path, "total": total, "received": 0}
            self._reply(201, {"ok": True, "upload_id": upload_id, "chunk_bytes": MAX_CHUNK_SIZE})
        except OSError as error:
            self._reply(500, {"error": "No se pudo preparar la carga: " + str(error)})

    def _write_chunk(self):
        if not self._authorized():
            return
        if self.headers.get_content_type() != "application/octet-stream":
            self._reply(415, {"error": "Se esperaba un bloque binario."})
            return
        length = self._content_length(MAX_CHUNK_SIZE)
        if length is None or length == 0:
            if length == 0:
                self._reply(400, {"error": "El bloque está vacío."})
            return
        upload_id = self.headers.get("X-Upload-ID", "")
        if not UPLOAD_ID.fullmatch(upload_id):
            self._reply(400, {"error": "Identificador de carga inválido."})
            return
        try:
            offset = int(self.headers.get("X-Upload-Offset", ""))
        except ValueError:
            self._reply(400, {"error": "Posición del bloque inválida."})
            return

        with UPLOADS_LOCK:
            upload = UPLOADS.get(upload_id)
            if upload is None:
                self._reply(404, {"error": "No existe esa carga o ya expiró."})
                return
            if offset != upload["received"] or offset + length > upload["total"]:
                self._reply(409, {"error": "El bloque no coincide con la posición esperada."})
                return
            try:
                with upload["path"].open("ab") as output:
                    remaining = length
                    while remaining:
                        chunk = self.rfile.read(min(65536, remaining))
                        if not chunk:
                            self._reply(400, {"error": "El bloque llegó incompleto."})
                            return
                        output.write(chunk)
                        remaining -= len(chunk)
                    output.flush()
                upload["received"] += length
                received = upload["received"]
            except OSError as error:
                self._reply(500, {"error": "Error guardando el bloque: " + str(error)})
                return
        self._reply(200, {"ok": True, "received": received, "total": upload["total"]})

    def _finish_upload(self):
        if not self._authorized():
            return
        upload_id = self.headers.get("X-Upload-ID", "")
        if not UPLOAD_ID.fullmatch(upload_id):
            self._reply(400, {"error": "Identificador de carga inválido."})
            return
        with UPLOADS_LOCK:
            upload = UPLOADS.get(upload_id)
            if upload is None:
                self._reply(404, {"error": "No existe esa carga o ya expiró."})
                return
            if upload["received"] != upload["total"]:
                self._reply(409, {"error": "La carga está incompleta."})
                return

            path = upload["path"]
            try:
                with path.open("rb") as source:
                    signature = source.read(4)
                if signature not in (b"PK\x03\x04", b"PK\x05\x06"):
                    raise ValueError("El archivo no parece ser un IPA ZIP.")
                try:
                    with zipfile.ZipFile(path) as archive:
                        has_resources = any(
                            RESOURCE_PATH.match(name) for name in archive.namelist()
                        )
                except (zipfile.BadZipFile, OSError) as error:
                    raise ValueError("IPA ZIP inválido: " + str(error)) from error
                if not has_resources:
                    raise ValueError("El IPA no contiene Payload/*.app/res/.")
                try:
                    os.link(path, DESTINATION)
                except FileExistsError:
                    self._reply(409, {"error": "Ya hay un IPA en IPA/UMK3.ipa; no se sobrescribió."})
                    return
                size = upload["total"]
                path.unlink()
                del UPLOADS[upload_id]
            except ValueError as error:
                self._reply(400, {"error": str(error)})
                return
            except OSError as error:
                self._reply(500, {"error": "Error guardando el IPA: " + str(error)})
                return
        self._reply(201, {"ok": True, "path": "IPA/UMK3.ipa", "bytes": size})

    def log_message(self, format_string, *args):
        print("upload-server:", format_string % args)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--bind", default="127.0.0.1",
                        help="interface to bind (use 0.0.0.0 for a forwarded workspace port)")
    parser.add_argument("--port", type=int, default=8765)
    args = parser.parse_args()

    server = ThreadingHTTPServer((args.bind, args.port), UploadHandler)
    server.daemon_threads = True
    print(f"Listening on {args.bind}:{args.port}")
    print(f"Open this one-time upload link: http://127.0.0.1:{args.port}/?token={TOKEN}")
    print("The received file is saved only at IPA/UMK3.ipa; Ctrl-C stops the server.")
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()


if __name__ == "__main__":
    main()
