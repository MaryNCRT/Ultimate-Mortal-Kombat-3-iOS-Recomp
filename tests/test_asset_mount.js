const assert = require("node:assert/strict");
const fs = require("node:fs");
const vm = require("node:vm");
const { test } = require("node:test");

function setupMount(writeError, thenableModule = false) {
  const directories = new Set(["/"]);
  const files = new Map();
  const dependencies = new Set();
  const errors = [];
  const status = { textContent: "" };
  const Module = {
    printErr(message) { errors.push(message); },
    preRun: []
  };
  if (thenableModule) {
    Module.then = resolve => resolve(undefined);
  }
  const FS = {
    mkdir(path) {
      if (directories.has(path)) {
        const error = new Error("directory already exists");
        error.code = "EEXIST";
        throw error;
      }
      const parent = path.slice(0, path.lastIndexOf("/")) || "/";
      if (!directories.has(parent)) {
        const error = new Error("parent directory does not exist");
        error.code = "ENOENT";
        throw error;
      }
      directories.add(path);
    },
    mkdirTree(path) {
      let current = "";
      for (const part of path.split("/")) {
        if (!part)
          continue;
        current += "/" + part;
        if (!directories.has(current))
          this.mkdir(current);
      }
    },
    writeFile(path, bytes) {
      if (writeError)
        throw writeError;
      files.set(path, Buffer.from(bytes));
    }
  };
  const context = {
    Module,
    FS,
    document: { getElementById: () => status },
    addRunDependency(name) { dependencies.add(name); },
    removeRunDependency(name) { dependencies.delete(name); }
  };

  vm.runInNewContext(
    fs.readFileSync(require.resolve("../web/asset_mount.js"), "utf8"),
    context
  );
  Module.preRun[0]();
  return { Module, files, dependencies, errors, status };
}

test("mounts nested files with the public Emscripten filesystem API", () => {
  const mount = setupMount();
  const entries = [
    { path: "res/a/b.dat", bytes: new Uint8Array([1, 2, 3]) },
    { path: "res/a/c.dat", bytes: new Uint8Array([4, 5]) }
  ];

  mount.Module.umk3MountAssets(entries);

  assert.deepEqual([...mount.dependencies], []);
  assert.deepEqual([...mount.files.get("/assets/res/a/b.dat")], [1, 2, 3]);
  assert.deepEqual([...mount.files.get("/assets/res/a/c.dat")], [4, 5]);
  assert.equal(entries[0].bytes, null);
  assert.deepEqual(mount.errors, []);
});

test("keeps the runtime dependency and reports filesystem failures", () => {
  const mount = setupMount(new Error("disk full"));
  mount.Module.umk3MountAssets([
    { path: "res/a/file.dat", bytes: new Uint8Array([1]) }
  ]);

  assert.deepEqual([...mount.dependencies], ["umk3-user-assets"]);
  assert.match(mount.status.textContent, /res\/a\/file\.dat: disk full/);
  assert.equal(mount.errors.length, 1);
});

test("mounts streamed entries until the caller finishes the asset set", async () => {
  const mount = setupMount();
  const assetMount = await mount.Module.umk3AssetMountReady;
  const entry = { path: "res/a.dat", bytes: new Uint8Array([7, 8]) };

  assert.notEqual(assetMount, mount.Module);
  assert.equal(typeof assetMount.umk3MountAsset, "function");
  assert.equal(typeof assetMount.umk3FinishAssetMount, "function");
  assetMount.umk3MountAsset(entry);
  assert.deepEqual([...mount.dependencies], ["umk3-user-assets"]);
  assert.equal(entry.bytes, null);

  assetMount.umk3FinishAssetMount();
  assert.deepEqual([...mount.dependencies], []);
  assert.deepEqual([...mount.files.get("/assets/res/a.dat")], [7, 8]);
});

test("resolves the asset API without assimilating Emscripten's Module thenable", async () => {
  const mount = setupMount(null, true);
  const assetMount = await mount.Module.umk3AssetMountReady;

  assert.notEqual(assetMount, undefined);
  assert.notEqual(assetMount, mount.Module);
  assert.equal(typeof assetMount.umk3MountAsset, "function");
  assert.equal(typeof assetMount.umk3FinishAssetMount, "function");
});
