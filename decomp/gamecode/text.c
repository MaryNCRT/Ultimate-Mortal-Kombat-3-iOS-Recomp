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
#include <string.h>   /* strlen, for asciiToUnicode */

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


extern char **LanguageTextPtrs;         /* 0x003857d8, one pointer per string */
int  sprintf(char *dst, const char *fmt, ...);
long convertAsciiStringToUnicode(char *dst, const char *src);


/* ------------------------------------------------------------------ GameText
 *
 * armv7 0x000a72a8, 36 bytes.  **Complete.**
 *
 * The string table lookup. -1 is the miss and returns a pointer to an empty
 * string in __TEXT rather than NULL, which is why callers pass the result
 * straight to the font code without checking it.
 */
const char *GameText(long index)
{
    if (index == -1)
        return "";                      /* 0x00177f8c, an empty string */
    return LanguageTextPtrs[index];
}


/* ---------------------------------------------------------- GameTextNoHeader
 *
 * armv7 0x000a72cc, 40 bytes.  **Complete.**
 *
 * The same lookup with **two bytes skipped**, so each stored string carries a
 * two-byte header the drawing code sometimes wants and sometimes does not.
 *
 * The -1 path is not just GameText's: it loads a DIFFERENT empty string, four
 * bytes further on, and branches to the `bx lr` PAST the `adds r0, #2`. So the
 * miss case returns an unadjusted pointer in both functions, and adding the two
 * to it -- which a tidier-looking rewrite would -- walks off the end of a
 * one-byte string.
 */
const char *GameTextNoHeader(long index)
{
    if (index == -1)
        return "";                      /* 0x00177f90, and NOT advanced by 2 */
    return LanguageTextPtrs[index] + 2;
}


/* ------------------------------------------------------------------- copyInt
 *
 * armv7 0x000a75ac, 40 bytes.  **Complete.**
 *
 * Formats an integer and writes it out as UNICODE, returning the byte length:
 * `convertAsciiStringToUnicode` returns a character count and the result is
 * shifted left by one (`lsls r0, r0, #1`), so two bytes per character.
 *
 * The scratch buffer is 0x40 bytes on the stack and `sprintf` is unbounded.
 * Sixty-four bytes is far beyond any %d, so it cannot overflow here -- but the
 * shape is worth noting rather than silently "fixing" to snprintf, because the
 * return value is a length the caller uses and a truncating rewrite changes it.
 */
long copyInt(char *dst, long value)
{
    char buf[0x40];

    sprintf(buf, "%d", (int)value);
    return convertAsciiStringToUnicode(dst, buf) * 2;
}


/* ----------------------------------------------------------------- copyFloat
 *
 * armv7 0x000a75d4, 44 bytes.  **Complete.**
 *
 * copyInt with "%f". **The value arrives in a REGISTER PAIR**: the prologue
 * moves r1 into r2 and r2 into r3 before the call, which is a double being
 * shuffled into the varargs slots under the soft-float ABI. So the parameter is
 * a double, not a float -- C promotes it at the call site and this function
 * never sees the original.
 */
long copyFloat(char *dst, double value)
{
    char buf[0x40];

    sprintf(buf, "%f", value);
    return convertAsciiStringToUnicode(dst, buf) * 2;
}


/* ------------------------------------------- convertAsciiStringToUnicode
 *
 * armv7 0x000a7310, 56 bytes.  **Complete.**
 *
 * Widens ASCII to UTF-16LE by interleaving zero bytes, and returns the
 * CHARACTER count -- which is why every caller shifts it left by one to get
 * bytes.
 *
 * **The terminator is two bytes and it is written on both paths.** The empty
 * -source branch at 0xa733e skips the loop and still stores the pair, so an
 * empty input produces a well-formed empty UTF-16 string rather than nothing.
 * A rewrite that returns early on an empty source leaves the destination
 * uninitialised.
 */
long convertAsciiStringToUnicode(char *dst, const char *src)
{
    long n = 0;

    while (src[n] != 0) {
        dst[n * 2]     = src[n];
        dst[n * 2 + 1] = 0;
        n++;
    }
    dst[n * 2]     = 0;             /* strb [ip, r2] */
    dst[n * 2 + 1] = 0;             /* strb [r2, lr], lr = dst + 1 */
    return n;
}


extern long   UCPtr;                    /* 0x00178034 */
extern char  *usprintfBuffers[16];      /* 0x00178038 */


/* ---------------------------------------------------------------------- UC
 *
 * armv7 0x000a7400, 52 bytes.  **Complete.**
 *
 *      UCPtr = (UCPtr + 1 > 15) ? 0 : UCPtr + 1
 *      convertAsciiStringToUnicode(usprintfBuffers[UCPtr], s)
 *      return usprintfBuffers[UCPtr]
 *
 * **Sixteen rotating buffers, and the caller owns none of them.** This is the
 * idiom that lets `UC("...")` be used inline in a drawing call: the returned
 * pointer stays valid until sixteen more conversions have happened, and then it
 * is silently reused.
 *
 * A port must keep the count at sixteen. Any smaller and a caller that holds
 * several converted strings across one frame starts seeing them change under
 * it -- and the failure looks like a text bug, not a lifetime bug.
 *
 * The pointer is re-read from `UCPtr` after the conversion rather than kept in
 * a register, which is transcribed as written; nothing in this function can
 * change it, but the original does not assume that.
 */
char *UC(const char *s)
{
    UCPtr = (UCPtr + 1 > 15) ? 0 : UCPtr + 1;
    convertAsciiStringToUnicode(usprintfBuffers[UCPtr], s);
    return usprintfBuffers[UCPtr];
}




/* ----------------------------------------------------------- copyUnicodeString
 *
 * armv7 0x000a745c, 80 bytes.  **Complete.**
 *
 * Copies a UTF-16LE string, terminator NOT included, and returns the byte
 * count. The loop condition goes through `decodeLHWord`, so the terminator is
 * a two-byte zero read as a little-endian halfword rather than a byte test --
 * which is why a character whose low byte is zero does not end the string.
 *
 * **Both pointers are null-checked and the result is 0 for either.** The guard
 * is built branchlessly out of `rsbs`/`ite`, which is why it does not look like
 * a guard; what it computes is `if (!dst || !src) return 0`.
 *
 * The returned count excludes the terminator and the destination never receives
 * one. Callers that want a terminated string write it themselves.
 */
long copyUnicodeString(char *dst, const char *src)
{
    long n = 0;

    if (dst == 0 || src == 0)
        return 0;

    while (decodeLHWord(src + n) != 0) {
        dst[n]     = src[n];
        dst[n + 1] = src[n + 1];
        n += 2;
    }
    return n;                           /* no terminator is written */
}




/* ------------------------------------------------------------- asciiToUnicode
 *
 * armv7 0x000a78dc, 84 bytes.  **Complete.**
 *
 * Widens ASCII into a caller-supplied buffer, refusing when the buffer cannot
 * hold the result plus its terminator, and returning 1 on success and 0 on
 * refusal. Unlike convertAsciiStringToUnicode it DOES write the two-byte
 * terminator, and the size check is what makes the difference: this one knows
 * how much room it has.
 *
 * **strlen is called inside the loop condition.** Not hoisted, not cached: once
 * per character, so the function is quadratic in the length of the string. It
 * is called twice more afterwards to place the terminator.
 *
 * That is transcribed rather than fixed. The strings this handles are menu
 * labels of a few dozen characters, so the cost never mattered; hoisting it is
 * a one-line change anybody porting this can make deliberately, and doing it
 * silently would hide that the original did not.
 *
 * The bound is strictly greater -- dst_bytes > strlen*2 -- which is what leaves
 * room for the terminator the check does not otherwise account for.
 */
int asciiToUnicode(const char *src, char *dst, long dst_bytes)
{
    long i;

    if (dst_bytes <= (long)strlen(src) * 2)
        return 0;

    for (i = 0; (unsigned long)i < strlen(src); i++) {   /* not hoisted */
        dst[i * 2]     = src[i];
        dst[i * 2 + 1] = 0;
    }
    dst[strlen(src) * 2]     = 0;
    dst[strlen(src) * 2 + 1] = 0;
    return 1;
}
