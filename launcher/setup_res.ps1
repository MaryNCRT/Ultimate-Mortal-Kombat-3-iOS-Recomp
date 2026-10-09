# Builds the game's own `res` folder from the user's .ipa.
#
# The port reads nothing outside the `res` folder beside umk3-game.exe. This
# copies Payload/UMK3.app/res/* out of the .ipa into it, plus Info.plist (which
# sits beside res/ in the bundle and holds the language-file mapping). No game
# data ships with the port: every player supplies their own .ipa.
#
#   powershell -ExecutionPolicy Bypass -File setup_res.ps1 [-Ipa x.ipa] [-Dest folder]
#
# With no -Ipa, the first *.ipa beside the script is used. -Dest defaults to
# the script's folder, so in a release folder a double-click on
# the launcher calls it after compiling.
param(
    [string]$Ipa,
    [string]$Dest = $PSScriptRoot
)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem

if (-not $Ipa) {
    $found = Get-ChildItem -Path $PSScriptRoot -Filter *.ipa | Select-Object -First 1
    if (-not $found) {
        Write-Host "No .ipa found. Put your UMK3 .ipa beside this script or pass -Ipa <path>."
        exit 1
    }
    $Ipa = $found.FullName
}
$Ipa = (Resolve-Path $Ipa).Path
$res = Join-Path $Dest 'res'

# A junction or link left by an older setup would make res depend on another
# folder; replace it with a real one.
if (Test-Path $res) {
    $item = Get-Item $res -Force
    if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
        cmd /c rmdir "$res" | Out-Null
    }
}
New-Item -ItemType Directory -Force -Path $res | Out-Null

$zip = [IO.Compression.ZipFile]::OpenRead($Ipa)
try {
    $prefix = $null
    foreach ($e in $zip.Entries) {
        if ($e.FullName -match '^(Payload/[^/]+\.app/)res/') { $prefix = $Matches[1]; break }
    }
    if (-not $prefix) {
        Write-Host "$Ipa has no Payload/*.app/res folder; is it the UMK3 .ipa?"
        exit 1
    }
    $n = 0
    foreach ($e in $zip.Entries) {
        $name = $e.FullName
        if ($name.EndsWith('/')) { continue }
        if ($name.StartsWith($prefix + 'res/')) {
            $rel = $name.Substring(($prefix + 'res/').Length)
        } elseif ($name -eq $prefix + 'Info.plist') {
            $rel = 'Info.plist'
        } else {
            continue
        }
        $out = Join-Path $res ($rel -replace '/', '\')
        New-Item -ItemType Directory -Force -Path (Split-Path $out) | Out-Null
        [IO.Compression.ZipFileExtensions]::ExtractToFile($e, $out, $true)
        $n++
    }
} finally {
    $zip.Dispose()
}

if (-not (Test-Path (Join-Path $res 'framelists\scorpionframes.txt'))) {
    Write-Host "Copied $n files, but res\framelists\scorpionframes.txt is missing."
    exit 1
}
Write-Host "res ready: $n files in $res"
