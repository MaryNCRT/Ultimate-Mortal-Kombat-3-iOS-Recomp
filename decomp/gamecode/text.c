/*
 * text.c — src/gamecode/text.cpp (string handling)
 *
 * Eighteen functions in the original. These three are the primitives the rest
 * sit on, and they are worth having early because this engine's strings are
 * UTF-16 more often than they look -- limeFont detects the encoding at runtime
 * from a BOM and both encodings travel as `const char *`.
 *
 * Verified against the oracle by tests/test_text_diff.c.
 */

#include <stdint.h>

uint32_t decodeLHWord(const char *p);
int      putUnicodeChar(char *dst, uint32_t ch);
long     strLenUnicode(const char *s);


/* ------------------------------------------------------------ decodeLHWord
 *
 * armv7 0x000a72f8, 12 bytes.  `__Z12decodeLHWordPKc`
 *
 *      ldrb r3, [r0, #1] ; ldrb r0, [r0]
 *      orr.w r0, r0, r3, lsl #8
 *
 * A little-endian sixteen-bit read, byte by byte -- "LH" is low-high. Both
 * loads are `ldrb` and not `ldrsb`, so neither half is sign-extended and the
 * result is a clean 0..0xFFFF.
 *
 * It reads the two bytes SEPARATELY rather than loading a halfword, which is
 * what makes it safe on an unaligned pointer. A port that "simplifies" this
 * into `*(uint16_t *)p` gets the same answer on x86 and faults on any target
 * that cares about alignment.
 */
uint32_t decodeLHWord(const char *p)
{
    return (uint32_t)(uint8_t)p[0] | ((uint32_t)(uint8_t)p[1] << 8);
}


/* ---------------------------------------------------------- putUnicodeChar
 *
 * armv7 0x000a7304, 12 bytes.
 *
 *      strb r1, [r0] ; lsrs r1, r1, #8 ; strb r1, [r0, #1] ; movs r0, #2
 *
 * The inverse of decodeLHWord, and it returns **2** -- the number of bytes
 * written, so callers can advance a cursor without knowing the encoding. Two
 * separate byte stores again, for the same alignment reason.
 */
int putUnicodeChar(char *dst, uint32_t ch)
{
    dst[0] = (char)(ch & 0xFFu);
    dst[1] = (char)((ch >> 8) & 0xFFu);
    return 2;
}


/* ----------------------------------------------------------- strLenUnicode
 *
 * armv7 0x000a7440, 28 bytes.
 *
 *  L:  ldrsb r3, [r2, r0]      ; s[i]
 *      cbnz  r3, next
 *      ldrsb r3, [r0 + r2, #1] ; s[i + 1]
 *      cbz   r3, done
 *  next: adds r2, #2 ; b L
 *  done: add.w r0, r2, r2, lsr #31 ; asrs r0, r0, #1
 *
 * **The terminator is a pair of zero bytes, not one.** The loop only stops
 * when BOTH halves of a code unit are zero, so a character like U+0041 --
 * `41 00` -- does not end the string even though its second byte is zero. A
 * length written as `strlen(s) / 2` would return 1 for a ten-character ASCII
 * string stored as UTF-16.
 *
 * The tail is the compiler's signed divide-by-two: add the sign bit, then
 * arithmetic-shift. `r2` is even and never negative here, so it is exactly
 * `r2 / 2`, and it is written that way rather than transcribing an idiom that
 * only exists because the compiler did not know the sign.
 *
 * The byte loads are `ldrsb` rather than `ldrb`. For a test against zero the
 * sign makes no difference, which is why it is safe to write this as a plain
 * comparison -- but it is the reason the disassembly looks like it cares.
 */
long strLenUnicode(const char *s)
{
    long i = 0;

    for (;;) {
        if (s[i] == 0 && s[i + 1] == 0)
            break;
        i += 2;
    }
    return i / 2;
}


/* --------------------------------------------------- CheckAllUnicodeCharsUsed
 *
 * armv7 0x000a72f4, 4 bytes: `bx lr`.
 *
 * Empty in the shipped build. The name says it was a coverage check over the
 * font's glyph table -- the sort of thing compiled out of a release -- and the
 * symbol survives because the linker kept the entry, not because anything runs.
 * It is written out rather than skipped so the file's function count matches
 * the binary's.
 */
void CheckAllUnicodeCharsUsed(void)
{
}
