import io
import json
from pathlib import Path
import sys
import tempfile
import threading
import unittest
from urllib.error import HTTPError
from urllib.request import Request, urlopen
import zipfile

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from tools import ipa_upload_server


def make_ipa():
    data = io.BytesIO()
    with zipfile.ZipFile(data, "w", zipfile.ZIP_DEFLATED) as archive:
        archive.writestr("Payload/UMK3.app/res/framelists/test.txt", b"assets")
    return data.getvalue()


class IpaUploadTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.old_root = ipa_upload_server.ROOT
        self.old_dest_dir = ipa_upload_server.DEST_DIR
        self.old_destination = ipa_upload_server.DESTINATION
        self.old_token = ipa_upload_server.TOKEN

        ipa_upload_server.ROOT = Path(self.temp.name)
        ipa_upload_server.DEST_DIR = Path(self.temp.name) / "IPA"
        ipa_upload_server.DESTINATION = ipa_upload_server.DEST_DIR / "UMK3.ipa"
        ipa_upload_server.TOKEN = "test-token"
        self.httpd = ipa_upload_server.ThreadingHTTPServer(
            ("127.0.0.1", 0), ipa_upload_server.UploadHandler
        )
        self.thread = threading.Thread(target=self.httpd.serve_forever)
        self.thread.start()
        self.url = f"http://127.0.0.1:{self.httpd.server_port}"

    def tearDown(self):
        self.httpd.shutdown()
        self.thread.join()
        self.httpd.server_close()
        ipa_upload_server.ROOT = self.old_root
        ipa_upload_server.DEST_DIR = self.old_dest_dir
        ipa_upload_server.DESTINATION = self.old_destination
        ipa_upload_server.TOKEN = self.old_token
        self.temp.cleanup()

    def post(self, path, data, token="test-token", headers=None):
        request_headers = {
            "Content-Type": "application/octet-stream",
            "X-Upload-Token": token
        }
        if headers:
            request_headers.update(headers)
        request = Request(
            self.url + path,
            data=data,
            headers=request_headers,
            method="POST"
        )
        return urlopen(request)

    def upload(self, data, token="test-token"):
        start_request = Request(
            self.url + "/upload/start",
            data=json.dumps({"bytes": len(data)}).encode(),
            headers={
                "Content-Type": "application/json",
                "X-Upload-Token": token
            },
            method="POST"
        )
        with urlopen(start_request) as response:
            started = json.load(response)
        upload_id = started["upload_id"]
        for offset in range(0, len(data), started["chunk_bytes"]):
            chunk = data[offset:offset + started["chunk_bytes"]]
            with self.post(
                "/upload/chunk", chunk, token,
                {"X-Upload-ID": upload_id, "X-Upload-Offset": str(offset)}
            ) as response:
                json.load(response)
        return self.post(
            "/upload/finish", b"", token,
            {"X-Upload-ID": upload_id}
        )

    def test_saves_valid_ipa_into_destination(self):
        data = make_ipa()
        with self.upload(data) as response:
            result = json.load(response)
            self.assertEqual(response.status, 201)
        self.assertEqual(result["path"], "IPA/UMK3.ipa")
        self.assertEqual(ipa_upload_server.DESTINATION.read_bytes(), data)

    def test_rejects_wrong_upload_token(self):
        with self.assertRaises(HTTPError) as error:
            self.upload(make_ipa(), token="wrong")
        self.assertEqual(error.exception.code, 403)
        error.exception.close()
        self.assertFalse(ipa_upload_server.DESTINATION.exists())

    def test_does_not_overwrite_existing_ipa(self):
        ipa_upload_server.DEST_DIR.mkdir()
        ipa_upload_server.DESTINATION.write_bytes(b"keep")
        with self.assertRaises(HTTPError) as error:
            self.upload(make_ipa())
        self.assertEqual(error.exception.code, 409)
        error.exception.close()
        self.assertEqual(ipa_upload_server.DESTINATION.read_bytes(), b"keep")

    def test_rejects_non_ipa_zip(self):
        data = io.BytesIO()
        with zipfile.ZipFile(data, "w") as archive:
            archive.writestr("Payload/UMK3.app/Info.plist", b"no resources")
        with self.assertRaises(HTTPError) as error:
            self.upload(data.getvalue())
        self.assertEqual(error.exception.code, 400)
        error.exception.close()
        self.assertFalse(ipa_upload_server.DESTINATION.exists())


if __name__ == "__main__":
    unittest.main()
