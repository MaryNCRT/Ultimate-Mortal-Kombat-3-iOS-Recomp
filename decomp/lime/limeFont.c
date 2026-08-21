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

#include <math.h>
#include <string.h>
#include <stdio.h>
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
/* The body is still not written -- see the fuller note further down this file,
 * which records what limeCreateFONT since established about the surrounding
 * format. One correction to the paragraph above: the array the loop accumulates
 * is at **FONT+0x24**, not FONT+0x0c. `ldr r1, [r4, #0x24]` at 0xaec48 is the
 * read, and it is the third of the three planar metric arrays limeCreateFONT
 * fills. FONT+0x0c is a separate field copied straight from the caller. */


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


/* ------------------------------------------------------------ limeCreateFONT
 *
 * armv6 0x000af83c, 756 bytes.  **Complete, and it decodes the font format.**
 *
 * Builds a FONT from up to two texture atlases and one metrics file. This is
 * the function that unblocks this whole file: every other routine here indexes
 * tables that only this one fills in.
 *
 * ## The metrics file
 *
 * A three-byte header, then planar arrays. No magic number, no version.
 *
 * ```
 *   byte 0   glyph count, low 8 bits
 *   byte 1   bit 0      -- the SIMPLE flag, stored INVERTED at FONT+0x04
 *            bits 1..7  -- glyph count, high bits, read SIGNED then >> 1
 *   byte 2   -> FONT+0x08
 *   byte 3.. numGlyphs character codes, one byte each
 * ```
 *
 * The count is reassembled as `byte0 + ((int8_t)byte1 >> 1) << 8`, so the low
 * bit of byte 1 is stolen for the flag and the rest is the high byte of a
 * signed 15-bit count. Reading byte 1 unsigned gives a count that is wrong
 * only for fonts past 128 glyphs, which is the kind of bug that survives
 * testing on a Latin character set and breaks on Korean.
 *
 * ## Two shapes after the header
 *
 * The character codes are always read, into `FONT+0x48` as bytes and widened
 * into `FONT+0x4c` as `{code, 0}` pairs -- that is, **the same codes as
 * 16-bit values**, which is what the UTF-16 path in limeGetStringWidth
 * searches. One table, two widths, built once at load.
 *
 * Then the flag decides:
 *
 *  - **simple** -- one more byte, a single fallback advance, into `FONT+0x2c`.
 *    Every glyph is that wide.
 *  - **not simple** -- three more planar arrays of `numGlyphs` entries each,
 *    read in order into `FONT+0x1c`, `FONT+0x20` and `FONT+0x24`, and always
 *    stored as `int16` regardless of how they were read.
 *
 * ## The `wide` argument
 *
 * The metric arrays are read as **signed bytes or as halfwords** depending on
 * an argument, with the file cursor advancing by 1 or 2 to match:
 *
 *      ldrsbeq  r3, [r5, r6]       ; narrow: signed byte
 *      ldrhne   r1, [r5, r6]       ; wide:   halfword
 *      addeq    r6, r6, #1
 *      addne    r6, r6, #2
 *
 * So **the file does not say how wide its own metrics are** -- the caller
 * does. Load a font with the wrong flag and it parses without error and
 * produces garbage. Any tool reading these files needs the flag from the call
 * site, not from the data.
 *
 * ## What the third array is
 *
 * `FONT+0x24` is the **advance width**: it is the only one of the three that
 * limeGetStringWidth accumulates. The other two are recorded by offset and not
 * named here -- for a texture-atlas font they are most likely the glyph
 * position and size, but this function does not use them and naming them on a
 * guess would be worse than leaving them numbered.
 *
 * `FONT+0x10` is set to the constant **8** before anything is read, and
 * limeGetStringWidth falls back to it when the glyph count is zero. So a font
 * that fails to load still measures text, at 8 units per character, instead of
 * returning zero and collapsing every layout to a point.
 *
 * The file buffer is freed before returning.
 */
void limeCreateFONT(const char *tex0, const char *tex1, const char *metrics,
                    FONT *font, int arg4, int height, int width,
                    int wide, int arg8)
{
    const uint8_t *data;
    int i, n, cursor;

    font->field14 = arg8;               /* +0x14, the scale applied at the end */
    font->field0c = arg4;               /* +0x0c */
    font->fallbackAdvance = 8;          /* +0x10, used when nothing loaded */
    font->simple = 0;                   /* +0x04 */
    font->height = (float)height;       /* +0x34, int -> float */
    font->width  = (float)width;        /* +0x38, int -> float */

    font->texture0 = limeLoadTexture(tex0, 0, 2);       /* +0x50 */
    if (tex1 != NULL)
        font->texture1 = limeLoadTexture(tex1, 0, 2);   /* +0x54 */

    data = limeLoadFile(metrics);
    if (data == NULL)
        return;

    n = data[0] + (((int8_t)data[1] >> 1) << 8);        /* 15-bit, packed */
    font->simple = ((data[1] & 1) != 0) ? 0 : 1;        /* stored inverted */
    font->numGlyphs = (int16_t)n;                       /* +0x18 */
    font->field08 = data[2];                            /* +0x08 */

    font->codes  = limeMalloc("font", n);               /* +0x48, bytes */
    font->codesW = limeMalloc("font", n * 2);           /* +0x4c, int16 */

    cursor = 3;
    for (i = 0; i < n; i++) {
        font->codes[i] = data[cursor++];
        font->codesW[i] = font->codes[i];               /* {code, 0} */
    }

    if (font->simple) {
        font->defaultAdvance = (int8_t)data[cursor];    /* +0x2c */
        limeFree((void *)data);
        return;
    }

    font->metricA = limeMalloc("font", n * 2);          /* +0x1c */
    font->metricB = limeMalloc("font", n * 2);          /* +0x20 */
    font->advance = limeMalloc("font", n * 2);          /* +0x24 */

    /* Three planar passes, filling +0x1c, +0x20 and +0x24 in that order.
     *
     * The THIRD one is the advance width. limeGetStringWidth reads
     * `ldr r1, [r4, #0x24]` at 0xaec48 and that is the array it accumulates --
     * which is what names it, and what an earlier version of this file got
     * backwards by assuming the middle array was the interesting one. */
    for (i = 0; i < n; i++) {
        font->metricA[i] = wide ? (int16_t)*(const uint16_t *)(data + cursor)
                                : (int16_t)(int8_t)data[cursor];
        cursor += wide ? 2 : 1;
    }
    for (i = 0; i < n; i++) {
        font->metricB[i] = wide ? (int16_t)*(const uint16_t *)(data + cursor)
                                : (int16_t)(int8_t)data[cursor];
        cursor += wide ? 2 : 1;
    }
    for (i = 0; i < n; i++) {
        font->advance[i] = wide ? (int16_t)*(const uint16_t *)(data + cursor)
                                : (int16_t)(int8_t)data[cursor];
        cursor += wide ? 2 : 1;
    }

    limeFree((void *)data);
}


/* -------------------------------------------------------- limeGetStringWidth
 *
 * armv6 0x000aeae4, 600 bytes.  **Partially decompiled -- see below.**
 *
 * Measures a string in the font.
 *
 * Three things are established and worth having even without the body.
 *
 * **It detects UTF-16 from a byte-order mark.** The first two bytes are read
 * signed and compared against -1 and -2, which is `0xFF 0xFE` -- a little-
 * endian BOM. When it matches, the cursor skips two bytes and a flag switches
 * the whole loop to 16-bit characters:
 *
 *      ldrsb    r3, [sl]
 *      cmn      r3, #1              ; == 0xFF ?
 *      ldrsbeq  r3, [sl, #1]
 *      cmneq    r3, #2              ; == 0xFE ?
 *
 * This is the same runtime detection the project already documented for game
 * text, now confirmed inside the font code itself. Both encodings travel as
 * `const char *`, so a port cannot decide the encoding from the type.
 *
 * **`FONT+0x24` is the advance width.** Of the three metric arrays
 * limeCreateFONT fills, this is the only one this function reads, and it is
 * what accumulates. That is what names the field.
 *
 * **The total is scaled, not summed.** The accumulated integer is converted to
 * float and multiplied by `FONT+0x14`, the value passed to limeCreateFONT:
 *
 *      vcvt.f32.s32 s14, s15
 *      vldr         s15, [r4, #0x14]
 *      vmul.f32     s15, s14, s15
 *
 * So metrics are stored in whatever units the font was authored in and scaled
 * at measure time. A port must apply the same scale or every layout drifts.
 *
 * The glyph lookup itself -- the search through `FONT+0x48` / `FONT+0x4c` that
 * turns a character code into an index -- is **not** written out. The search
 * has narrow and wide variants and a fallback path through `FONT+0x2c` and
 * `FONT+0x10`, and the version here would be a guess at the ordering. It is
 * left as a declaration rather than invented; see the note in ENCARGO.md about
 * why an empty body is a better answer than a plausible one.
 */
float limeGetStringWidth(const FONT *font, const char *text);
