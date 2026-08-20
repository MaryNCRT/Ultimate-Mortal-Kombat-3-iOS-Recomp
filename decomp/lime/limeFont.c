/*
 * lime/common/limeFont.cpp -- text measurement.
 *
 * Recovered from the armv6 slice. Addresses below are armv6.
 *
 * ---------------------------------------------------------------------------
 * The engine's strings are UTF-16, and it detects that from a BOM
 *
 * Every function here begins by testing the first two bytes against -1 and -2
 * -- `0xFF 0xFE`, the **UTF-16 little-endian byte order mark**. When it is
 * present the string is walked two bytes at a time and terminated by a pair of
 * zeros; when it is absent the string is treated as bytes.
 *
 * So a single `const char *` may be either encoding and the engine decides at
 * runtime, per string. That is worth knowing before writing any text handling
 * for the port: passing UTF-16 to something expecting bytes stops at the first
 * character, and passing bytes to something expecting UTF-16 reads past the
 * end.
 *
 * It also fills a gap. The `.lproj` bundles contain nothing but a `dummy.txt`,
 * so the localised strings are not where iOS would normally put them -- and
 * this is the machinery that reads them wherever they are.
 *
 * ---------------------------------------------------------------------------
 * FONT, as far as these functions reveal it
 *
 *      +0x0c   glyph table pointer
 *      +0x14   float, multiplied into the final width
 *      +0x18   uint16 glyph count (sign-extended, then doubled -- so the
 *              entries are 2 bytes, or it indexes a paired table)
 *      +0x48   a second table, consulted inside the per-glyph search
 *
 * Those offsets are read off the code and are certain. What the tables contain
 * is not, and is left alone below rather than guessed at.
 */

#include "lime.h"


/* --------------------------------------------------------- limeFontStrLen
 *
 * armv6 0x000aed3c, 68 bytes.  **Complete** -- every instruction accounted for.
 *
 * Length in *characters*, not bytes, for a string that may or may not carry a
 * UTF-16 BOM.
 *
 * Two details worth keeping:
 *
 *  - A NULL argument returns the argument unchanged rather than a constant.
 *    For a length that is the same value, but a caller testing for a sentinel
 *    will not find one.
 *  - Strings of one byte or less short-circuit **before** the BOM test, since
 *    a BOM needs two bytes and `strlen` of a lone `0xFF` is 1.
 */
int limeFontStrLen(const char *s)
{
    int len;
    int i;

    if (s == NULL)
        return 0;

    len = (int)strlen(s);
    if (len <= 1)
        return len;

    /* 0xFF 0xFE -- UTF-16 LE. Read as signed bytes, that is -1 then -2. */
    if (!((signed char)s[0] == -1 && (signed char)s[1] == -2))
        return len;                     /* plain bytes */

    /* past the BOM, count 16-bit units until a zero pair */
    for (i = 0; ; i += 2) {
        if (s[i + 2] == 0 && s[i + 3] == 0)
            break;
    }
    return i / 2;
}


/* ------------------------------------------------------ limeGetStringWidth
 *
 * armv6 0x000aeae4, 400 bytes.  **Not fully decompiled** -- see below.
 *
 * Measured width of a string in a font, returned as a float.
 *
 * What is established:
 *
 *  - the same BOM test as limeFontStrLen chooses between byte and UTF-16
 *    traversal;
 *  - a NULL string loads a literal and returns immediately, so it is a width
 *    of nothing rather than an error;
 *  - the only function it calls is `strlen`. **There is no per-glyph helper**
 *    -- the table search is inline, over FONT+0x0c with a count at FONT+0x18
 *    and a second table at FONT+0x48;
 *  - the accumulated value is multiplied by the float at **FONT+0x14** once,
 *    at the end (`vldr s15,[r4,#0x14]` / `vmul.f32 s15,s14,s15` at 0xaec88).
 *
 * What is not established is the layout of those tables, and therefore what
 * the loop accumulates per character. Writing a body here would mean inventing
 * it, so the body is deliberately absent. An earlier draft of this file did
 * invent a `limeFontAdvance()` helper and `tools/symcheck.py` rejected it --
 * which is the whole reason that check exists.
 */
float limeGetStringWidth(FONT *font, const char *s);      /* body not recovered */


/* --------------------------------------------- limeGetStringWidthUCNoHeader
 *
 * armv6 0x000ae8ec, 312 bytes.  **Not fully decompiled**, same reason.
 *
 * The same measurement for a string that is **known** to be UTF-16 and has no
 * BOM -- "UC" for Unicode, "NoHeader" for the missing mark. It walks pairs
 * from offset zero and stops on a zero pair, with no detection step at all.
 *
 * The pair exists because a BOM is a property of how a string was *stored*,
 * not of the string: text assembled at runtime has no reason to carry one.
 */
float limeGetStringWidthUCNoHeader(FONT *font, const char *s);
