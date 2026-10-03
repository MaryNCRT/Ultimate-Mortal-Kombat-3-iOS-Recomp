Module.preRun = Module.preRun || [];
let resolveAssetMountReady;
Module.umk3AssetMountReady = new Promise(resolve => {
  resolveAssetMountReady = resolve;
});
Module.preRun.push(function() {
  const dependency = "umk3-user-assets";
  let mounted = false;
  addRunDependency(dependency);

  function requireFilesystem() {
    if (typeof FS === "undefined" || typeof FS.mkdirTree !== "function" ||
        typeof FS.writeFile !== "function")
      throw new Error("Emscripten no incluyó las funciones requeridas del filesystem.");
  }

  Module.umk3MountAsset = function(entry) {
    if (mounted)
      throw new Error("Los recursos ya se montaron.");
    try {
      requireFilesystem();
      const path = "/assets/" + entry.path;
      const slash = path.lastIndexOf("/");
      FS.mkdirTree(path.slice(0, slash));
      FS.writeFile(path, entry.bytes);
      entry.bytes = null;
    } catch (error) {
      const detail = error && error.message ? error.message : String(error);
      const message = "No se pudo montar " + entry.path + ": " + detail;
      Module.printErr(message + "\n" + (error && error.stack ? error.stack : ""));
      const status = document.getElementById("status");
      if (status)
        status.textContent = "Falló la carga a la memoria virtual: " + message;
      const picker = document.getElementById("pick-ipa");
      const folderPicker = document.getElementById("pick-folder");
      if (picker)
        picker.disabled = false;
      if (folderPicker)
        folderPicker.disabled = false;
      throw new Error(message, { cause: error });
    }
  };

  Module.umk3FinishAssetMount = function() {
    if (mounted)
      return;
    mounted = true;
    Module.umk3Files = null;
    removeRunDependency(dependency);
  };

  Module.umk3MountAssets = function(entries) {
    if (mounted || !entries)
      return;
    try {
      for (const entry of entries)
        Module.umk3MountAsset(entry);
      Module.umk3FinishAssetMount();
    } catch (error) {
      return;
    }
  };

  resolveAssetMountReady({
    umk3MountAsset: Module.umk3MountAsset,
    umk3FinishAssetMount: Module.umk3FinishAssetMount
  });
  if (Module.umk3Files)
    Module.umk3MountAssets(Module.umk3Files);
});
