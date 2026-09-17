#!/bin/sh
# landfn.sh -- compile a file, then verify the named functions against the
# binary. The loop this project should have had from the start.
#
#   sh tools/landfn.sh mkreact t_block2 t_cc_punch ...
#
# The first argument is the file's stem; the rest are the functions just
# written. A function that does not come back OK is not landed, whatever the
# compiler said: compiling proves the C is C, not that it is the same C.
set -e
STEM="$1"
shift
SRC="E:/umk3repo/decomp/gamecode/logic/$STEM.c"
REC="/tmp/rc_$STEM.c/recompiled.c"
[ -d "/tmp/rc_$STEM.c" ] || REC="/tmp/rc_$STEM/recompiled.c"

cd "E:/umk3repo/decomp/gamecode/logic"
gcc -fsyntax-only -Wall -I. "$STEM.c" || exit 1
echo "compila."

cd "E:/umk3repo/tools"
bad=0
for f in "$@"; do
    out=$(python factdiff.py "$REC" "$SRC" "$f" 2>&1)
    case "$out" in
        *"1 coinciden"*) echo "  OK    $f" ;;
        *)               echo "  FALLA $f"
                         echo "$out" | sed -n '2,8p'
                         bad=$((bad + 1)) ;;
    esac
done
echo
if [ "$bad" -gt 0 ]; then
    echo "$bad sin verificar -- no estan landed"
    exit 1
fi
echo "todas verificadas contra el binario"
