/* Finds the game folder (the release/repository root) that holds
 * launcher\build_game.ps1, umk3-game.exe, res\ and umk3.ini.
 *
 * The packaged launcher is a portable single .exe: Windows extracts it to a
 * temp folder, so "the exe's folder" is NOT the game folder.  The player
 * double-clicks the launcher inside the game folder, so process.cwd() it is,
 * with the exe dir and a UMK3_ROOT override as fallbacks.
 */
'use strict';

const fs = require('fs');
const path = require('path');

function looksLikeRoot(dir) {
    return fs.existsSync(path.join(dir, 'launcher', 'build_game.ps1'))
        || fs.existsSync(path.join(dir, 'umk3-game.exe'));
}

function walkUp(start) {
    let dir = path.resolve(start);
    for (;;) {
        if (looksLikeRoot(dir))
            return dir;
        const parent = path.dirname(dir);
        if (parent === dir)
            return null;
        dir = parent;
    }
}

function findRoot(candidates) {
    for (const c of candidates) {
        if (!c)
            continue;
        const hit = walkUp(c);
        if (hit)
            return hit;
    }
    return candidates[0] ? path.resolve(candidates[0]) : null;
}

module.exports = { findRoot, looksLikeRoot };