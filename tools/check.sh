#!/bin/sh
# check.sh -- syntax-check every C file in the tree, the way it is really built.
#
# A naive `for f in $(find . -name '*.c')` sweep is WRONG here and reported a
# phantom error for a while: it compiled the Linux backend on Windows without
# SDL2 and called the missing header a defect. CMake never builds that file on
# Windows. So this script picks the backend the way CMakeLists.txt does.
#
# The off-platform backend is then linted separately rather than skipped,
# because a file nobody compiles is a file where a typo lives forever. It uses
# a real SDL2 when one is installed and tests/sdl2-lint/SDL.h when not -- and
# says which, because only the first of those is a real check.
#
#   sh tools/check.sh
#
# Exit status is the number of errors, so CI can use it directly.

cd "$(dirname "$0")/.." || exit 99
CC=${CC:-gcc}
FLAGS="-std=c99 -Wall -Wextra -fsyntax-only -I runtime -I decomp/lime"

case "$(uname -s)" in
    MINGW*|MSYS*|CYGWIN*) NATIVE=win32_gl.c ; OTHER=sdl_gl.c   ;;
    *)                    NATIVE=sdl_gl.c   ; OTHER=win32_gl.c ;;
esac

errors=0
warnings=0

check_one() {
    out=$("$CC" $FLAGS $2 "$1" 2>&1)
    e=$(printf '%s' "$out" | grep -c 'error:')
    w=$(printf '%s' "$out" | grep -c 'warning:')
    errors=$((errors + e))
    warnings=$((warnings + w))
    [ "$e" -gt 0 ] && printf '%s\n' "$out" | grep 'error:'
    return 0
}

echo "=== tree ==="
for dir in decomp/lime decomp/gamecode runtime; do
    de=$errors ; dw=$warnings
    for f in $(find "$dir" -name '*.c' | grep -v '/platform/'); do
        check_one "$f" ""
    done
    printf '  %-18s %d errors, %d warnings\n' \
           "$dir" "$((errors - de))" "$((warnings - dw))"
done

echo
echo "=== platform backend (native: $NATIVE) ==="
pe=$errors
check_one "runtime/platform/$NATIVE" ""
printf '  %-18s %d errors\n' "$NATIVE" "$((errors - pe))"

echo
echo "=== platform backend (off-platform: $OTHER) ==="
if [ "$OTHER" = "sdl_gl.c" ]; then
    inc=$(pkg-config --cflags sdl2 2>/dev/null)
    if [ -n "$inc" ]; then
        echo "  using REAL SDL2 -- this is a full check"
        extra="$inc"
    else
        echo "  SDL2 not installed: using tests/sdl2-lint/SDL.h"
        echo "  REDUCED CHECK -- catches our own mistakes, cannot prove the"
        echo "  declarations match real SDL2. Install SDL2 to close that gap."
        extra="-DUMK3_SDL2_LINT -I tests/sdl2-lint"
    fi
else
    echo "  win32 backend needs the Windows SDK headers; skipped on this host"
    extra=""
    OTHER=""
fi

if [ -n "$OTHER" ]; then
    oe=$errors
    check_one "runtime/platform/$OTHER" "$extra"
    printf '  %-18s %d errors\n' "$OTHER" "$((errors - oe))"
fi

echo
echo "TOTAL: $errors errors, $warnings warnings"
exit $errors
