const assert = require("node:assert/strict");
const { deflateRawSync } = require("node:zlib");
const { test } = require("node:test");
const { extractIpaResources } = require("../web/ipa.js");

function crc32(bytes) {
  let crc = 0xffffffff;
  for (const byte of bytes) {
    crc ^= byte;
    for (let bit = 0; bit < 8; bit++)
      crc = (crc & 1) ? (0xedb88320 ^ (crc >>> 1)) : (crc >>> 1);
  }
  return (crc ^ 0xffffffff) >>> 0;
}

function makeZip(files) {
  const localRecords = [];
  const centralRecords = [];
  let localOffset = 0;

  for (const file of files) {
    const name = Buffer.from(file.path);
    const bytes = Buffer.from(file.bytes);
    const method = file.method || 0;
    const compressed = method === 8 ? deflateRawSync(bytes) : bytes;
    const checksum = crc32(bytes);

    const local = Buffer.alloc(30);
    local.writeUInt32LE(0x04034b50, 0);
    local.writeUInt16LE(20, 4);
    local.writeUInt16LE(0x0800, 6);
    local.writeUInt16LE(method, 8);
    local.writeUInt32LE(checksum, 14);
    local.writeUInt32LE(compressed.length, 18);
    local.writeUInt32LE(bytes.length, 22);
    local.writeUInt16LE(name.length, 26);
    localRecords.push(local, name, compressed);

    const central = Buffer.alloc(46);
    central.writeUInt32LE(0x02014b50, 0);
    central.writeUInt16LE(20, 4);
    central.writeUInt16LE(20, 6);
    central.writeUInt16LE(0x0800, 8);
    central.writeUInt16LE(method, 10);
    central.writeUInt32LE(checksum, 16);
    central.writeUInt32LE(compressed.length, 20);
    central.writeUInt32LE(bytes.length, 24);
    central.writeUInt16LE(name.length, 28);
    central.writeUInt32LE(localOffset, 42);
    centralRecords.push(central, name);

    localOffset += local.length + name.length + compressed.length;
  }

  const centralDirectory = Buffer.concat(centralRecords);
  const end = Buffer.alloc(22);
  end.writeUInt32LE(0x06054b50, 0);
  end.writeUInt16LE(files.length, 8);
  end.writeUInt16LE(files.length, 10);
  end.writeUInt32LE(centralDirectory.length, 12);
  end.writeUInt32LE(localOffset, 16);

  return new Blob([...localRecords, centralDirectory, end]);
}

test("extracts stored and deflated app resources, excluding other IPA files", async () => {
  const ipa = makeZip([
    { path: "Payload/UMK3.app/res/raw.dat", bytes: "stored" },
    { path: "Payload/UMK3.app/res/text/menu.txt", bytes: "deflated", method: 8 },
    { path: "Payload/UMK3.app/Info.plist", bytes: "not a resource" }
  ]);

  const files = await extractIpaResources(ipa);
  const result = Object.fromEntries(
    files.map(file => [file.path, Buffer.from(file.bytes).toString()])
  );

  assert.deepEqual(result, {
    "res/raw.dat": "stored",
    "res/text/menu.txt": "deflated",
    "Info.plist": "not a resource"
  });
});

test("streams extracted resources without retaining them in the result", async () => {
  const ipa = makeZip([
    { path: "Payload/UMK3.app/res/a.dat", bytes: "first" },
    { path: "Payload/UMK3.app/res/b.dat", bytes: "second", method: 8 }
  ]);
  const streamed = [];
  const validated = [];

  const result = await extractIpaResources(
    ipa,
    null,
    async entry => streamed.push({
      path: entry.path,
      bytes: Buffer.from(entry.bytes).toString()
    }),
    async info => validated.push(info)
  );

  assert.deepEqual(result, []);
  assert.deepEqual(validated, [{ files: 2, resources: 2 }]);
  assert.deepEqual(streamed, [
    { path: "res/a.dat", bytes: "first" },
    { path: "res/b.dat", bytes: "second" }
  ]);
});

test("rejects an archive without an app resource directory", async () => {
  const ipa = makeZip([
    { path: "Payload/UMK3.app/Info.plist", bytes: "no res directory" }
  ]);
  await assert.rejects(extractIpaResources(ipa), /No se encontró Payload/);
});

test("rejects malformed ZIP input", async () => {
  await assert.rejects(extractIpaResources(new Blob(["not a ZIP"])),
                       /No se encontró el directorio ZIP/);
});

test("rejects paths that escape the resource directory", async () => {
  const ipa = makeZip([
    { path: "Payload/UMK3.app/res/../outside.bin", bytes: "unsafe" }
  ]);
  await assert.rejects(extractIpaResources(ipa), /Ruta de recurso ZIP inválida/);
});

test("reads resources from an extracted app directory without its executable", async () => {
  const files = [
    new File(["sprite data"], "fight.png"),
    new File(["version"], "Info.plist"),
    new File(["app executable"], "UMK3")
  ];
  Object.defineProperty(files[0], "webkitRelativePath", {
    value: "UMK3.app/res/sprites/fight.png"
  });
  Object.defineProperty(files[1], "webkitRelativePath", {
    value: "UMK3.app/Info.plist"
  });
  Object.defineProperty(files[2], "webkitRelativePath", {
    value: "UMK3.app/UMK3"
  });

  const result = await require("../web/ipa.js").readAppDirectory(files);
  assert.deepEqual(result.map(file => file.path), [
    "res/sprites/fight.png",
    "Info.plist"
  ]);
  assert.equal(Buffer.from(result[0].bytes).toString(), "sprite data");
});

test("accepts the resource directory itself", async () => {
  const file = new File(["frame data"], "scorpionframes.txt");
  Object.defineProperty(file, "webkitRelativePath", {
    value: "framelists/scorpionframes.txt"
  });

  const result = await require("../web/ipa.js").readAppDirectory([file]);
  assert.deepEqual(result.map(entry => entry.path), [
    "res/framelists/scorpionframes.txt"
  ]);
});

test("streams extracted directory resources without retaining them", async () => {
  const file = new File(["frame data"], "frame.dat");
  Object.defineProperty(file, "webkitRelativePath", {
    value: "UMK3.app/res/framelists/frame.dat"
  });
  const streamed = [];

  const result = await require("../web/ipa.js").readAppDirectory(
    [file],
    null,
    async entry => streamed.push({
      path: entry.path,
      bytes: Buffer.from(entry.bytes).toString()
    })
  );

  assert.deepEqual(result, []);
  assert.deepEqual(streamed, [
    { path: "res/framelists/frame.dat", bytes: "frame data" }
  ]);
});

test("restores saved directory resources incrementally", async () => {
  const streamed = [];
  const progress = [];
  await require("../web/ipa.js").readSavedAssets([
    { path: "res/one.dat", blob: new Blob(["one"]) },
    { path: "Info.plist", blob: new Blob(["plist"]) }
  ], item => progress.push(item), async entry => {
    streamed.push({ path: entry.path, bytes: Buffer.from(entry.bytes).toString() });
  });

  assert.deepEqual(streamed, [
    { path: "res/one.dat", bytes: "one" },
    { path: "Info.plist", bytes: "plist" }
  ]);
  assert.deepEqual(progress.map(item => item.done), [1, 2]);
});

test("rejects unsafe paths in saved directory resources", async () => {
  await assert.rejects(
    require("../web/ipa.js").readSavedAssets([
      { path: "res/../escape", blob: new Blob(["unsafe"]) }
    ]),
    /Ruta inválida/
  );
});
