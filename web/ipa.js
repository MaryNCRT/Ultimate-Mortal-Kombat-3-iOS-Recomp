(function(root) {
  "use strict";

  const EOCD_SIGNATURE = 0x06054b50;
  const CENTRAL_SIGNATURE = 0x02014b50;
  const LOCAL_SIGNATURE = 0x04034b50;
  const decoder = new TextDecoder("utf-8", { fatal: true });
  const crcTable = new Uint32Array(256);

  for (let i = 0; i < crcTable.length; i++) {
    let crc = i;
    for (let bit = 0; bit < 8; bit++)
      crc = (crc & 1) ? (0xedb88320 ^ (crc >>> 1)) : (crc >>> 1);
    crcTable[i] = crc >>> 0;
  }

  function readU16(view, offset, label) {
    if (offset < 0 || offset + 2 > view.byteLength)
      throw new Error("ZIP truncado al leer " + label + ".");
    return view.getUint16(offset, true);
  }

  function readU32(view, offset, label) {
    if (offset < 0 || offset + 4 > view.byteLength)
      throw new Error("ZIP truncado al leer " + label + ".");
    return view.getUint32(offset, true);
  }

  function crc32(bytes) {
    let crc = 0xffffffff;
    for (const byte of bytes)
      crc = crcTable[(crc ^ byte) & 0xff] ^ (crc >>> 8);
    return (crc ^ 0xffffffff) >>> 0;
  }

  async function inflateRaw(blob) {
    if (typeof DecompressionStream !== "function")
      throw new Error("Este navegador no ofrece descompresión ZIP deflate.");
    let stream;
    try {
      stream = blob.stream().pipeThrough(new DecompressionStream("deflate-raw"));
    } catch (error) {
      throw new Error("No se pudo iniciar la descompresión ZIP: " + error.message);
    }
    return new Uint8Array(await new Response(stream).arrayBuffer());
  }

  async function extractIpaResources(file, onProgress, onEntry, onValidated) {
    if (!file || typeof file.slice !== "function" || !Number.isSafeInteger(file.size))
      throw new Error("El archivo seleccionado no se puede leer como ZIP.");

    const tailLength = Math.min(file.size, 65557);
    const tailOffset = file.size - tailLength;
    const tail = new DataView(await file.slice(tailOffset).arrayBuffer());
    let eocd = -1;

    for (let pos = tail.byteLength - 22; pos >= 0; pos--) {
      if (readU32(tail, pos, "fin del ZIP") !== EOCD_SIGNATURE)
        continue;
      if (pos + 22 + readU16(tail, pos + 20, "comentario del ZIP") === tail.byteLength) {
        eocd = pos;
        break;
      }
    }
    if (eocd < 0)
      throw new Error("No se encontró el directorio ZIP del IPA.");

    const disk = readU16(tail, eocd + 4, "disco ZIP");
    const centralDisk = readU16(tail, eocd + 6, "disco del directorio");
    const diskEntries = readU16(tail, eocd + 8, "entradas del disco");
    const entryCount = readU16(tail, eocd + 10, "cantidad de entradas");
    const centralSize = readU32(tail, eocd + 12, "tamaño del directorio");
    const centralOffset = readU32(tail, eocd + 16, "posición del directorio");

    if (disk !== 0 || centralDisk !== 0 || diskEntries !== entryCount)
      throw new Error("No se admiten archivos ZIP divididos en varios discos.");
    if (entryCount === 0xffff || centralSize === 0xffffffff ||
        centralOffset === 0xffffffff)
      throw new Error("Los IPA ZIP64 aún no están admitidos.");
    if (centralOffset + centralSize > file.size)
      throw new Error("El directorio del ZIP apunta fuera del archivo.");

    const central = new DataView(
      await file.slice(centralOffset, centralOffset + centralSize).arrayBuffer()
    );
    const candidates = new Map();
    let pos = 0;

    for (let index = 0; index < entryCount; index++) {
      if (readU32(central, pos, "firma de entrada") !== CENTRAL_SIGNATURE)
        throw new Error("Entrada inválida en el directorio ZIP.");

      const flags = readU16(central, pos + 8, "banderas");
      const method = readU16(central, pos + 10, "método de compresión");
      const checksum = readU32(central, pos + 16, "CRC");
      const compressedSize = readU32(central, pos + 20, "tamaño comprimido");
      const size = readU32(central, pos + 24, "tamaño original");
      const nameLength = readU16(central, pos + 28, "nombre");
      const extraLength = readU16(central, pos + 30, "datos extra");
      const commentLength = readU16(central, pos + 32, "comentario");
      const localOffset = readU32(central, pos + 42, "posición de entrada");
      const nameStart = pos + 46;
      const next = nameStart + nameLength + extraLength + commentLength;

      if (next > central.byteLength)
        throw new Error("Nombre o metadatos ZIP truncados.");
      const name = decoder.decode(
        new Uint8Array(central.buffer, central.byteOffset + nameStart, nameLength)
      );
      const resourceMatch = /^Payload\/([^/]+\.app)\/res\/(.+)$/i.exec(name);
      const bundleMatch = /^Payload\/([^/]+\.app)\/([^/]+)$/i.exec(name);
      const appName = (resourceMatch || bundleMatch || [])[1];
      const bundleExecutable = bundleMatch &&
        bundleMatch[2].toLowerCase() === appName.slice(0, -4).toLowerCase();

      if ((resourceMatch || (bundleMatch && !bundleExecutable)) && !name.endsWith("/")) {
        if (flags & 1)
          throw new Error("Los archivos del IPA están cifrados dentro del ZIP.");
        if (compressedSize === 0xffffffff || size === 0xffffffff ||
            localOffset === 0xffffffff)
          throw new Error("Una entrada ZIP64 de recursos aún no está admitida.");
        if (method !== 0 && method !== 8)
          throw new Error("Método ZIP no admitido para " + name + ".");

        if (!candidates.has(appName))
          candidates.set(appName, { resources: [], bundle: [] });
        const candidate = candidates.get(appName);

        if (resourceMatch) {
          const relativePath = resourceMatch[2];
          const parts = relativePath.split("/");
          if (parts.some(part => !part || part === "." || part === ".." ||
              part.includes("\\") || part.includes("\0")))
            throw new Error("Ruta de recurso ZIP inválida: " + relativePath);
          candidate.resources.push({
            path: "res/" + relativePath,
            method,
            checksum,
            compressedSize,
            size,
            localOffset
          });
        } else {
          const basename = bundleMatch[2];
          if (basename === "." || basename === ".." || basename.includes("\\") ||
              basename.includes("\0"))
            throw new Error("Nombre de archivo ZIP inválido: " + basename);
          candidate.bundle.push({
            path: basename,
            method,
            checksum,
            compressedSize,
            size,
            localOffset
          });
        }
      }
      pos = next;
    }

    let selected = null;
    for (const candidate of candidates.values()) {
      if (!selected || candidate.resources.length > selected.resources.length)
        selected = candidate;
    }
    if (!selected || selected.resources.length === 0)
      throw new Error("No se encontró Payload/*.app/res/ dentro del IPA.");

    const files = selected.resources.concat(selected.bundle);
    if (onValidated)
      await onValidated({ files: files.length, resources: selected.resources.length });
    const extracted = [];
    for (let i = 0; i < files.length; i++) {
      const entry = files[i];
      const header = new DataView(
        await file.slice(entry.localOffset, entry.localOffset + 30).arrayBuffer()
      );
      if (readU32(header, 0, "cabecera local") !== LOCAL_SIGNATURE)
        throw new Error("Cabecera ZIP local inválida para " + entry.path + ".");
      const localNameLength = readU16(header, 26, "nombre local");
      const localExtraLength = readU16(header, 28, "datos extra locales");
      const dataOffset = entry.localOffset + 30 + localNameLength + localExtraLength;
      const dataEnd = dataOffset + entry.compressedSize;
      if (dataEnd > file.size)
        throw new Error("Datos ZIP truncados para " + entry.path + ".");

      const compressed = file.slice(dataOffset, dataEnd);
      const bytes = entry.method === 0
        ? new Uint8Array(await compressed.arrayBuffer())
        : await inflateRaw(compressed);
      if (bytes.byteLength !== entry.size)
        throw new Error("Tamaño extraído incorrecto para " + entry.path + ".");
      if (crc32(bytes) !== entry.checksum)
        throw new Error("CRC incorrecto para " + entry.path + ".");

      const extractedEntry = { path: entry.path, bytes };
      if (onEntry)
        await onEntry(extractedEntry);
      else
        extracted.push(extractedEntry);
      if (onProgress)
        onProgress({ done: i + 1, total: files.length, path: entry.path });
    }
    return extracted;
  }

  async function readAppDirectory(fileList, onProgress, onEntry, onSelected) {
    const files = Array.from(fileList || []);
    if (files.length === 0)
      throw new Error("La carpeta seleccionada no contiene archivos.");

    const candidates = new Map();
    for (const file of files) {
      const relativePath = file.webkitRelativePath || file.name;
      const parts = relativePath.split("/");
      if (!relativePath || parts.some(part => !part || part === "." ||
          part === ".." || part.includes("\\") || part.includes("\0")))
        throw new Error("Ruta inválida en la carpeta seleccionada: " + relativePath);

      const resIndex = parts.findIndex(part => part.toLowerCase() === "res");
      if (resIndex < 0 || resIndex === parts.length - 1)
        continue;

      let appIndex = -1;
      for (let i = 0; i < resIndex; i++) {
        if (parts[i].toLowerCase().endsWith(".app"))
          appIndex = i;
      }
      const rootParts = appIndex >= 0 ? parts.slice(0, appIndex + 1)
                                      : parts.slice(0, resIndex);
      const rootPath = rootParts.join("/");
      if (!candidates.has(rootPath))
        candidates.set(rootPath, { resources: [], bundle: [] });
      const candidate = candidates.get(rootPath);
      candidate.resources.push({
        file,
        path: "res/" + parts.slice(resIndex + 1).join("/")
      });
    }

    let selected = null;
    let selectedRoot = "";
    for (const [rootPath, candidate] of candidates) {
      if (!selected || candidate.resources.length > selected.resources.length) {
        selected = candidate;
        selectedRoot = rootPath;
      }
    }

    if (!selected) {
      selected = { resources: [], bundle: [] };
      for (const file of files) {
        const relativePath = file.webkitRelativePath || file.name;
        const parts = relativePath.split("/");
        if (parts.some(part => !part || part === "." || part === ".." ||
            part.includes("\\") || part.includes("\0")))
          throw new Error("Ruta inválida en la carpeta seleccionada: " + relativePath);
        selected.resources.push({ file, path: "res/" + parts.join("/") });
      }
    } else {
      for (const file of files) {
        const relativePath = file.webkitRelativePath || file.name;
        const parts = relativePath.split("/");
        const rootParts = selectedRoot ? selectedRoot.split("/") : [];
        const isDirectBundleFile = parts.length === rootParts.length + 1 &&
          rootParts.every((part, index) => parts[index] === part);
        const name = parts[parts.length - 1].toLowerCase();
        if (isDirectBundleFile && (name === "info.plist" || name === "pkginfo"))
          selected.bundle.push({ file, path: parts[parts.length - 1] });
      }
    }

    const entries = selected.resources.concat(selected.bundle);
    if (onSelected)
      await onSelected(entries);
    const extracted = [];
    for (let i = 0; i < entries.length; i++) {
      const entry = entries[i];
      const extractedEntry = {
        path: entry.path,
        bytes: new Uint8Array(await entry.file.arrayBuffer())
      };
      if (onEntry)
        await onEntry(extractedEntry);
      else
        extracted.push(extractedEntry);
      if (onProgress)
        onProgress({ done: i + 1, total: entries.length, path: entry.path });
    }
    return extracted;
  }

  async function readSavedAssets(savedEntries, onProgress, onEntry) {
    if (!Array.isArray(savedEntries) || savedEntries.length === 0)
      throw new Error("No hay una carpeta guardada para cargar.");

    for (let i = 0; i < savedEntries.length; i++) {
      const entry = savedEntries[i];
      if (!entry || typeof entry.path !== "string" ||
          !entry.blob || typeof entry.blob.arrayBuffer !== "function")
        throw new Error("La copia guardada contiene un recurso inválido.");
      const parts = entry.path.split("/");
      if (parts.some(part => !part || part === "." || part === ".." ||
          part.includes("\\") || part.includes("\0")))
        throw new Error("Ruta inválida en los recursos guardados: " + entry.path);

      const extractedEntry = {
        path: entry.path,
        bytes: new Uint8Array(await entry.blob.arrayBuffer())
      };
      if (onEntry)
        await onEntry(extractedEntry);
      if (onProgress)
        onProgress({ done: i + 1, total: savedEntries.length, path: entry.path });
    }
  }

  const api = { extractIpaResources, readAppDirectory, readSavedAssets };
  root.UMK3IPA = api;
  if (typeof module !== "undefined" && module.exports)
    module.exports = api;
})(globalThis);
