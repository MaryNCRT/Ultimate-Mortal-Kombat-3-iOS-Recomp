const assert = require("node:assert/strict");
const { test } = require("node:test");

const stores = new Map();

function makeRequest() {
  return { result: null, onsuccess: null, onerror: null, onblocked: null };
}

function makeDatabase() {
  return {
    objectStoreNames: { contains: name => stores.has(name) },
    createObjectStore(name) { stores.set(name, new Map()); },
    close() {},
    transaction() {
      const tx = {
        oncomplete: null,
        onerror: null,
        onabort: null,
        objectStore(name) {
          const records = stores.get(name);
          return {
            get(key) {
              const request = makeRequest();
              queueMicrotask(() => {
                request.result = records.get(key);
                request.onsuccess();
                tx.oncomplete && tx.oncomplete();
              });
              return request;
            },
            getAll() {
              const request = makeRequest();
              queueMicrotask(() => {
                request.result = [...records.values()];
                request.onsuccess();
                queueMicrotask(() => tx.oncomplete && tx.oncomplete());
              });
              return request;
            },
            put(record) {
              queueMicrotask(() => {
                records.set(record.key, record);
                tx.oncomplete && tx.oncomplete();
              });
            },
            delete(key) {
              queueMicrotask(() => {
                records.delete(key);
                tx.oncomplete && tx.oncomplete();
              });
            },
            clear() {
              queueMicrotask(() => {
                records.clear();
                tx.oncomplete && tx.oncomplete();
              });
            }
          };
        }
      };
      return tx;
    }
  };
}

globalThis.indexedDB = {
  open() {
    const request = makeRequest();
    queueMicrotask(() => {
      request.result = makeDatabase();
      if (!stores.has("files"))
        request.onupgradeneeded();
      request.onsuccess();
    });
    return request;
  }
};

require("../web/ipa_store.js");
const store = globalThis.UMK3IPAStore;

test("persists an IPA blob and restores its filename", async () => {
  const source = new Blob(["user IPA data"], { type: "application/zip" });
  source.name = "UMK3.ipa";
  await store.saveIpa(source);

  const saved = await store.getSavedIpa();
  assert.equal(saved.name, "UMK3.ipa");
  assert.equal(saved.blob.type, "application/zip");
  assert.equal(await saved.blob.text(), "user IPA data");
});

test("persists selected directory resources and restores their paths", async () => {
  await store.saveAssets([
    {
      path: "res/framelists/scorpion.txt",
      file: new Blob(["frame data"], { type: "text/plain" })
    },
    {
      path: "Info.plist",
      file: new Blob(["bundle metadata"], { type: "application/xml" })
    }
  ]);

  const restored = await store.getSavedAssets();
  assert.equal(restored.length, 2);
  assert.deepEqual(restored.map(entry => entry.path), [
    "res/framelists/scorpion.txt",
    "Info.plist"
  ]);
  assert.equal(await restored[0].blob.text(), "frame data");
  assert.equal(await store.getSavedIpa(), undefined);
});

test("uses only a complete IPA asset cache and marks it ready at the end", async () => {
  await store.beginIpaAssetCache(2);
  await store.saveIpaAsset(0, {
    path: "res/one.dat",
    bytes: new Uint8Array([1, 2])
  });

  assert.equal(await store.getSavedAssets(), null);

  await store.saveIpaAsset(1, {
    path: "Info.plist",
    bytes: new Uint8Array([3, 4])
  });
  await store.finishIpaAssetCache();

  const cached = await store.getSavedAssets();
  assert.equal(cached.length, 2);
  assert.deepEqual([...new Uint8Array(await cached[0].blob.arrayBuffer())], [1, 2]);
  assert.deepEqual([...new Uint8Array(await cached[1].blob.arrayBuffer())], [3, 4]);
});

test("does not mark an incomplete IPA asset cache as ready", async () => {
  await store.beginIpaAssetCache(2);
  await store.saveIpaAsset(0, {
    path: "res/one.dat",
    bytes: new Uint8Array([1])
  });

  await assert.rejects(store.finishIpaAssetCache(), /incompleta/);
  assert.equal(await store.getSavedAssets(), null);
});

test("rejects an IPA cache with missing resource indexes", async () => {
  await store.beginIpaAssetCache(2);
  await store.saveIpaAsset(1, {
    path: "res/one.dat",
    bytes: new Uint8Array([1])
  });
  await store.saveIpaAsset(2, {
    path: "res/two.dat",
    bytes: new Uint8Array([2])
  });

  await assert.rejects(store.finishIpaAssetCache(), /incompleta/);
  assert.equal(await store.getSavedAssets(), null);
});

test("replacing a saved directory with an IPA clears the old directory copy", async () => {
  await store.saveAssets([
    { path: "res/frame.dat", file: new Blob(["frame data"]) },
    { path: "Info.plist", file: new Blob(["bundle metadata"]) }
  ]);
  assert.equal((await store.getSavedAssets()).length, 2);
  const ipa = new Blob(["new IPA"], { type: "application/zip" });
  ipa.name = "new.ipa";
  await store.saveIpa(ipa);

  assert.equal((await store.getSavedIpa()).name, "new.ipa");
  assert.equal(await store.getSavedAssets(), null);
});

test("rejects unsafe paths before replacing a saved directory", async () => {
  const ipa = new Blob(["new IPA"], { type: "application/zip" });
  ipa.name = "new.ipa";
  await store.saveIpa(ipa);
  await assert.rejects(
    store.saveAssets([{
      path: "res/../escape",
      file: new Blob(["unsafe"])
    }]),
    /Ruta inválida/
  );
  assert.equal((await store.getSavedIpa()).name, "new.ipa");
});

test("clears saved IPA and directory resources together", async () => {
  await store.saveAssets([
    { path: "res/frame.dat", file: new Blob(["frame data"]) }
  ]);
  await store.clearSavedFiles();
  assert.equal(await store.getSavedIpa(), undefined);
  assert.equal(await store.getSavedAssets(), null);
});
