(function(root) {
  "use strict";

  const DATABASE = "umk3-browser-assets";
  const STORE = "files";
  const ASSET_STORE = "directory-assets";
  const IPA_KEY = "selected-ipa";
  const ASSET_META_KEY = "directory-meta";

  function openDatabase() {
    return new Promise((resolve, reject) => {
      if (!root.indexedDB)
        return reject(new Error("Este navegador no permite almacenamiento local IndexedDB."));

      const request = root.indexedDB.open(DATABASE, 2);
      request.onupgradeneeded = () => {
        const db = request.result;
        if (!db.objectStoreNames.contains(STORE))
          db.createObjectStore(STORE, { keyPath: "key" });
        if (!db.objectStoreNames.contains(ASSET_STORE))
          db.createObjectStore(ASSET_STORE, { keyPath: "key" });
      };
      request.onsuccess = () => resolve(request.result);
      request.onerror = () => reject(request.error ||
        new Error("No se pudo abrir el almacenamiento local del navegador."));
      request.onblocked = () => reject(
        new Error("El almacenamiento está bloqueado por otra pestaña de UMK3.")
      );
    });
  }

  async function beginIpaAssetCache(count) {
    if (!Number.isSafeInteger(count) || count <= 0)
      throw new Error("La cantidad de recursos IPA no es válida.");
    const db = await openDatabase();
    try {
      const tx = db.transaction(ASSET_STORE, "readwrite");
      const files = tx.objectStore(ASSET_STORE);
      files.clear();
      files.put({
        key: ASSET_META_KEY,
        count,
        complete: false,
        savedAt: Date.now()
      });
      await new Promise((resolve, reject) => {
        tx.oncomplete = resolve;
        tx.onerror = () => reject(tx.error ||
          new Error("No se pudo preparar la caché local del IPA."));
        tx.onabort = () => reject(tx.error ||
          new Error("El navegador canceló la preparación de la caché del IPA."));
      });
    } finally {
      db.close();
    }
  }

  async function saveIpaAsset(index, entry) {
    if (!Number.isSafeInteger(index) || index < 0 ||
        !entry || typeof entry.path !== "string" ||
        !(entry.bytes instanceof Uint8Array))
      throw new Error("El recurso extraído del IPA no es válido.");
    const parts = entry.path.split("/");
    if (parts.some(part => !part || part === "." || part === ".." ||
        part.includes("\\") || part.includes("\0")))
      throw new Error("Ruta inválida en la caché del IPA: " + entry.path);

    const db = await openDatabase();
    try {
      const tx = db.transaction(ASSET_STORE, "readwrite");
      tx.objectStore(ASSET_STORE).put({
        key: "asset-" + index,
        path: entry.path,
        blob: new Blob([entry.bytes])
      });
      await new Promise((resolve, reject) => {
        tx.oncomplete = resolve;
        tx.onerror = () => reject(tx.error ||
          new Error("No se pudo guardar el recurso " + entry.path + "."));
        tx.onabort = () => reject(tx.error ||
          new Error("El navegador canceló el guardado de " + entry.path + "."));
      });
    } finally {
      db.close();
    }
  }

  async function finishIpaAssetCache() {
    const db = await openDatabase();
    try {
      const tx = db.transaction(ASSET_STORE, "readwrite");
      const files = tx.objectStore(ASSET_STORE);
      const request = files.getAll();
      await new Promise((resolve, reject) => {
        tx.oncomplete = resolve;
        tx.onerror = () => reject(tx.error ||
          new Error("No se pudo finalizar la caché local del IPA."));
        tx.onabort = () => reject(tx.error ||
          new Error("La caché local del IPA quedó incompleta."));
        request.onerror = () => reject(request.error ||
          new Error("No se pudo verificar la caché local del IPA."));
        request.onsuccess = () => {
          const records = request.result;
          const metadata = records.find(record => record.key === ASSET_META_KEY);
          const assets = records.filter(record =>
            record.key.startsWith("asset-"));
          const keys = new Set(assets.map(record => record.key));
          let complete = !!metadata &&
            Number.isSafeInteger(metadata.count) &&
            metadata.count === assets.length;
          for (let i = 0; complete && i < metadata.count; i++)
            complete = keys.has("asset-" + i);
          if (!complete) {
            reject(new Error("La caché local del IPA está incompleta."));
            return;
          }
          metadata.complete = true;
          files.put(metadata);
        };
      });
    } finally {
      db.close();
    }
  }

  function requestResult(request) {
    return new Promise((resolve, reject) => {
      request.onsuccess = () => resolve(request.result);
      request.onerror = () => reject(request.error ||
        new Error("Falló una operación del almacenamiento local."));
    });
  }

  async function getSavedIpa() {
    const db = await openDatabase();
    try {
      const tx = db.transaction(STORE, "readonly");
      return await requestResult(tx.objectStore(STORE).get(IPA_KEY));
    } finally {
      db.close();
    }
  }

  async function saveIpa(file) {
    const db = await openDatabase();
    try {
      const tx = db.transaction([STORE, ASSET_STORE], "readwrite");
      tx.objectStore(ASSET_STORE).clear();
      tx.objectStore(STORE).put({
        key: IPA_KEY,
        name: file.name || "UMK3.ipa",
        blob: file.slice(0, file.size, file.type || "application/octet-stream"),
        savedAt: Date.now()
      });
      await new Promise((resolve, reject) => {
        tx.oncomplete = resolve;
        tx.onerror = () => reject(tx.error ||
          new Error("No se pudo guardar el IPA en el navegador."));
        tx.onabort = () => reject(tx.error ||
          new Error("El navegador canceló el guardado del IPA."));
      });
    } finally {
      db.close();
    }

    const saved = await getSavedIpa();
    if (!saved || !saved.blob || saved.blob.size !== file.size ||
        saved.name !== (file.name || "UMK3.ipa"))
      throw new Error("La verificación de la copia guardada no coincide.");
  }

  async function saveAssets(entries) {
    if (!Array.isArray(entries) || entries.length === 0)
      throw new Error("No hay recursos válidos para guardar.");
    for (const entry of entries) {
      if (!entry || typeof entry.path !== "string" ||
          !entry.file || typeof entry.file.slice !== "function" ||
          !Number.isSafeInteger(entry.file.size))
        throw new Error("La selección contiene un archivo que no se puede guardar.");
      const parts = entry.path.split("/");
      if (parts.some(part => !part || part === "." || part === ".." ||
          part.includes("\\") || part.includes("\0")))
        throw new Error("Ruta inválida en los recursos seleccionados: " + entry.path);
    }

    const db = await openDatabase();
    try {
      const tx = db.transaction([STORE, ASSET_STORE], "readwrite");
      const files = tx.objectStore(ASSET_STORE);
      files.clear();
      for (let i = 0; i < entries.length; i++) {
        const { path, file } = entries[i];
        files.put({
          key: "asset-" + i,
          path,
          blob: file.slice(0, file.size, file.type || "application/octet-stream")
        });
      }
      files.put({
        key: ASSET_META_KEY,
        count: entries.length,
        complete: true,
        savedAt: Date.now()
      });
      tx.objectStore(STORE).delete(IPA_KEY);
      await new Promise((resolve, reject) => {
        tx.oncomplete = resolve;
        tx.onerror = () => reject(tx.error ||
          new Error("No se pudieron guardar los recursos en el navegador."));
        tx.onabort = () => reject(tx.error ||
          new Error("El navegador canceló el guardado de los recursos."));
      });
    } finally {
      db.close();
    }
  }

  async function getSavedAssets() {
    const db = await openDatabase();
    try {
      const tx = db.transaction(ASSET_STORE, "readonly");
      const records = await requestResult(tx.objectStore(ASSET_STORE).getAll());
      const metadata = records.find(record => record.key === ASSET_META_KEY);
      if (!metadata || metadata.complete === false)
        return null;
      const entries = records
        .filter(record => record.key.startsWith("asset-"))
        .sort((left, right) =>
          Number(left.key.slice(6)) - Number(right.key.slice(6)));
      if (entries.length !== metadata.count)
        throw new Error("La copia guardada de la carpeta está incompleta.");
      return entries.map(record => ({ path: record.path, blob: record.blob }));
    } finally {
      db.close();
    }
  }

  async function clearSavedFiles() {
    const db = await openDatabase();
    try {
      const tx = db.transaction([STORE, ASSET_STORE], "readwrite");
      tx.objectStore(STORE).delete(IPA_KEY);
      tx.objectStore(ASSET_STORE).clear();
      await new Promise((resolve, reject) => {
        tx.oncomplete = resolve;
        tx.onerror = () => reject(tx.error ||
          new Error("No se pudieron borrar los recursos guardados."));
        tx.onabort = () => reject(tx.error ||
          new Error("El navegador canceló el borrado de los recursos."));
      });
    } finally {
      db.close();
    }
  }

  async function clearSavedIpa() {
    const db = await openDatabase();
    try {
      const tx = db.transaction(STORE, "readwrite");
      tx.objectStore(STORE).delete(IPA_KEY);
      await new Promise((resolve, reject) => {
        tx.oncomplete = resolve;
        tx.onerror = () => reject(tx.error ||
          new Error("No se pudo borrar el IPA guardado."));
        tx.onabort = () => reject(tx.error ||
          new Error("El navegador canceló el borrado del IPA."));
      });
    } finally {
      db.close();
    }
  }

  root.UMK3IPAStore = {
    getSavedIpa,
    saveIpa,
    clearSavedIpa,
    saveAssets,
    getSavedAssets,
    beginIpaAssetCache,
    saveIpaAsset,
    finishIpaAssetCache,
    clearSavedFiles
  };
})(globalThis);
