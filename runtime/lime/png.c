/* png.c -- see png.h. */
#include "png.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* ------------------------------------------------------------------ inflate */

typedef struct {
    const uint8_t *d;
    size_t         n, pos;
    uint32_t       bitbuf;
    int            bitcnt;
    int            err;
} BitIn;

typedef struct {
    short counts[16];
    short symbols[288];
} Huff;

static int getbit(BitIn *s)
{
    int b;

    if (s->bitcnt == 0) {
        if (s->pos >= s->n) { s->err = 1; return 0; }
        s->bitbuf = s->d[s->pos++];
        s->bitcnt = 8;
    }
    b = (int)(s->bitbuf & 1u);
    s->bitbuf >>= 1;
    s->bitcnt--;
    return b;
}

static int getbits(BitIn *s, int need)
{
    int v = 0, i;

    for (i = 0; i < need; i++) v |= getbit(s) << i;
    return v;
}

static void huff_build(Huff *h, const uint8_t *lengths, int n)
{
    int i, sum = 0, offs[16];

    for (i = 0; i < 16; i++) h->counts[i] = 0;
    for (i = 0; i < n; i++) h->counts[lengths[i]]++;
    h->counts[0] = 0;
    for (i = 0; i < 16; i++) { offs[i] = sum; sum += h->counts[i]; }
    for (i = 0; i < n; i++)
        if (lengths[i]) h->symbols[offs[lengths[i]]++] = (short)i;
}

/* Canonical Huffman decode, one bit at a time -- the puff formulation. */
static int huff_decode(BitIn *s, const Huff *h)
{
    int len, code = 0, first = 0, index = 0, count;

    for (len = 1; len <= 15; len++) {
        code |= getbit(s);
        count = h->counts[len];
        if (code - count < first) return h->symbols[index + (code - first)];
        index += count;
        first += count;
        first <<= 1;
        code  <<= 1;
    }
    s->err = 1;
    return -1;
}

static const short LBASE[29] = {
    3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 15, 17, 19, 23, 27, 31, 35, 43, 51, 59,
    67, 83, 99, 115, 131, 163, 195, 227, 258 };
static const short LEXT[29] = {
    0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3,
    4, 4, 4, 4, 5, 5, 5, 5, 0 };
static const short DBASE[30] = {
    1, 2, 3, 4, 5, 7, 9, 13, 17, 25, 33, 49, 65, 97, 129, 193, 257, 385, 513,
    769, 1025, 1537, 2049, 3073, 4097, 6145, 8193, 12289, 16385, 24577 };
static const short DEXT[30] = {
    0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8,
    9, 9, 10, 10, 11, 11, 12, 12, 13, 13 };

typedef struct { uint8_t *d; size_t n, cap; } Out;

static int out_byte(Out *o, uint8_t b)
{
    if (o->n >= o->cap) {
        size_t cap = o->cap ? o->cap * 2 : 65536;
        uint8_t *p = (uint8_t *)realloc(o->d, cap);
        if (!p) return 0;
        o->d = p;
        o->cap = cap;
    }
    o->d[o->n++] = b;
    return 1;
}

static int inflate_block(BitIn *s, Out *o, const Huff *lc, const Huff *dc)
{
    for (;;) {
        int sym = huff_decode(s, lc);

        if (s->err) return 0;
        if (sym < 256) {
            if (!out_byte(o, (uint8_t)sym)) return 0;
        } else if (sym == 256) {
            return 1;
        } else {
            int i, len, dist, dsym;

            sym -= 257;
            if (sym >= 29) return 0;
            len = LBASE[sym] + getbits(s, LEXT[sym]);
            dsym = huff_decode(s, dc);
            if (dsym < 0 || dsym >= 30) return 0;
            dist = DBASE[dsym] + getbits(s, DEXT[dsym]);
            if ((size_t)dist > o->n) return 0;
            for (i = 0; i < len; i++)
                if (!out_byte(o, o->d[o->n - (size_t)dist])) return 0;
        }
    }
}

static uint8_t *zinflate(const uint8_t *src, size_t n, size_t *out_len)
{
    static const uint8_t ORDER[19] = {
        16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15 };
    BitIn s;
    Out   o;
    Huff  fixed_l, fixed_d;
    uint8_t lengths[320];
    int i, built = 0;

    memset(&s, 0, sizeof(s));
    memset(&o, 0, sizeof(o));
    s.d = src;
    s.n = n;

    /* zlib wrapper: two header bytes, and a trailing adler32 we do not check. */
    if (n < 2) return NULL;
    s.pos = 2;

    for (;;) {
        int final = getbit(&s);
        int type  = getbits(&s, 2);

        if (s.err) { free(o.d); return NULL; }

        if (type == 0) {                        /* stored */
            unsigned len;

            s.bitcnt = 0;
            if (s.pos + 4 > s.n) { free(o.d); return NULL; }
            len = (unsigned)s.d[s.pos] | ((unsigned)s.d[s.pos + 1] << 8);
            s.pos += 4;
            if (s.pos + len > s.n) { free(o.d); return NULL; }
            for (i = 0; i < (int)len; i++)
                if (!out_byte(&o, s.d[s.pos++])) { free(o.d); return NULL; }
        } else if (type == 1) {                 /* fixed Huffman */
            if (!built) {
                for (i = 0;   i < 144; i++) lengths[i] = 8;
                for (i = 144; i < 256; i++) lengths[i] = 9;
                for (i = 256; i < 280; i++) lengths[i] = 7;
                for (i = 280; i < 288; i++) lengths[i] = 8;
                huff_build(&fixed_l, lengths, 288);
                for (i = 0; i < 30; i++) lengths[i] = 5;
                huff_build(&fixed_d, lengths, 30);
                built = 1;
            }
            if (!inflate_block(&s, &o, &fixed_l, &fixed_d)) { free(o.d); return NULL; }
        } else if (type == 2) {                 /* dynamic Huffman */
            Huff cl, lit, dst;
            uint8_t cl_len[19];
            int hlit  = getbits(&s, 5) + 257;
            int hdist = getbits(&s, 5) + 1;
            int hclen = getbits(&s, 4) + 4;
            int k = 0;

            if (hlit > 286 || hdist > 30) { free(o.d); return NULL; }
            memset(cl_len, 0, sizeof(cl_len));
            for (i = 0; i < hclen; i++) cl_len[ORDER[i]] = (uint8_t)getbits(&s, 3);
            huff_build(&cl, cl_len, 19);

            memset(lengths, 0, sizeof(lengths));
            while (k < hlit + hdist) {
                int sym = huff_decode(&s, &cl);

                if (sym < 0) { free(o.d); return NULL; }
                if (sym < 16) {
                    lengths[k++] = (uint8_t)sym;
                } else if (sym == 16) {
                    int rep = 3 + getbits(&s, 2);
                    uint8_t prev = k ? lengths[k - 1] : 0;
                    while (rep-- > 0 && k < hlit + hdist) lengths[k++] = prev;
                } else if (sym == 17) {
                    int rep = 3 + getbits(&s, 3);
                    while (rep-- > 0 && k < hlit + hdist) lengths[k++] = 0;
                } else {
                    int rep = 11 + getbits(&s, 7);
                    while (rep-- > 0 && k < hlit + hdist) lengths[k++] = 0;
                }
            }
            huff_build(&lit, lengths, hlit);
            huff_build(&dst, lengths + hlit, hdist);
            if (!inflate_block(&s, &o, &lit, &dst)) { free(o.d); return NULL; }
        } else {
            free(o.d);
            return NULL;
        }

        if (final) break;
        if (s.err) { free(o.d); return NULL; }
    }

    *out_len = o.n;
    return o.d;
}

/* ---------------------------------------------------------------------- PNG */

static uint32_t rd_be32(const uint8_t *p)
{
    return ((uint32_t)p[0] << 24) | ((uint32_t)p[1] << 16) |
           ((uint32_t)p[2] << 8) | (uint32_t)p[3];
}

static int iabs(int v) { return v < 0 ? -v : v; }

static int paeth(int a, int b, int c)
{
    int p = a + b - c, pa = iabs(p - a), pb = iabs(p - b), pc = iabs(p - c);

    if (pa <= pb && pa <= pc) return a;
    return (pb <= pc) ? b : c;
}

bool lime_png_load(const char *path, uint8_t **out, int *width, int *height)
{
    static const uint8_t SIG[8] = {
        0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A };
    FILE *f;
    uint8_t *file = NULL, *idat = NULL, *raw = NULL, *rgba = NULL;
    uint8_t  pal[256 * 3], alpha[256];
    long     size;
    size_t   idat_len = 0, idat_cap = 0, raw_len = 0, off;
    int      w = 0, h = 0, bitdepth = 0, colour = 0, interlace = 0;
    int      channels = 0, stride, y, x, npal = 0, i;

    *out = NULL;
    memset(pal, 0, sizeof(pal));
    for (i = 0; i < 256; i++) alpha[i] = 255;

    f = fopen(path, "rb");
    if (!f) return false;
    if (fseek(f, 0, SEEK_END) != 0) { fclose(f); return false; }
    size = ftell(f);
    rewind(f);
    if (size < 8) { fclose(f); return false; }
    file = (uint8_t *)malloc((size_t)size);
    if (!file) { fclose(f); return false; }
    if (fread(file, 1, (size_t)size, f) != (size_t)size) {
        free(file); fclose(f); return false;
    }
    fclose(f);

    if (memcmp(file, SIG, 8) != 0) { free(file); return false; }

    off = 8;
    while (off + 8 <= (size_t)size) {
        uint32_t len = rd_be32(file + off);
        const char *tag = (const char *)file + off + 4;
        const uint8_t *data = file + off + 8;

        if (off + 12 + (size_t)len > (size_t)size) break;

        if (!memcmp(tag, "IHDR", 4) && len >= 13) {
            w = (int)rd_be32(data);
            h = (int)rd_be32(data + 4);
            bitdepth  = data[8];
            colour    = data[9];
            interlace = data[12];
        } else if (!memcmp(tag, "PLTE", 4)) {
            npal = (int)(len / 3);
            if (npal > 256) npal = 256;
            memcpy(pal, data, (size_t)npal * 3);
        } else if (!memcmp(tag, "tRNS", 4)) {
            size_t n = len > 256 ? 256 : (size_t)len;
            memcpy(alpha, data, n);
        } else if (!memcmp(tag, "IDAT", 4)) {
            if (idat_len + (size_t)len > idat_cap) {
                size_t cap = idat_cap ? idat_cap : (size_t)len + 65536;
                uint8_t *p;

                while (cap < idat_len + (size_t)len) cap *= 2;
                p = (uint8_t *)realloc(idat, cap);
                if (!p) { free(idat); free(file); return false; }
                idat = p;
                idat_cap = cap;
            }
            memcpy(idat + idat_len, data, len);
            idat_len += len;
        } else if (!memcmp(tag, "IEND", 4)) {
            break;
        }
        off += 12 + (size_t)len;
    }
    free(file);

    if (!idat || w <= 0 || h <= 0 || bitdepth != 8 || interlace != 0) {
        free(idat);
        return false;
    }
    switch (colour) {
        case 0: channels = 1; break;            /* grey */
        case 2: channels = 3; break;            /* RGB */
        case 3: channels = 1; break;            /* palette */
        case 4: channels = 2; break;            /* grey + alpha */
        case 6: channels = 4; break;            /* RGBA */
        default: free(idat); return false;
    }
    if (colour == 3 && npal == 0) { free(idat); return false; }

    raw = zinflate(idat, idat_len, &raw_len);
    free(idat);
    if (!raw) return false;

    stride = w * channels;
    if (raw_len < (size_t)h * (size_t)(stride + 1)) { free(raw); return false; }

    /* Unfilter in place. Each scanline is one filter byte then stride bytes,
     * and every filter refers to the row above AFTER that row was unfiltered,
     * which is why this runs top to bottom and writes back as it goes. */
    for (y = 0; y < h; y++) {
        uint8_t *row  = raw + (size_t)y * (size_t)(stride + 1) + 1;
        uint8_t *prev = (y > 0)
                      ? raw + (size_t)(y - 1) * (size_t)(stride + 1) + 1
                      : NULL;
        int ft = raw[(size_t)y * (size_t)(stride + 1)];

        for (x = 0; x < stride; x++) {
            int a = (x >= channels) ? row[x - channels] : 0;
            int b = prev ? prev[x] : 0;
            int c = (prev && x >= channels) ? prev[x - channels] : 0;
            int v = row[x];

            switch (ft) {
                case 0: break;
                case 1: v += a; break;
                case 2: v += b; break;
                case 3: v += (a + b) / 2; break;
                case 4: v += paeth(a, b, c); break;
                default: free(raw); return false;
            }
            row[x] = (uint8_t)v;
        }
    }

    rgba = (uint8_t *)malloc((size_t)w * (size_t)h * 4);
    if (!rgba) { free(raw); return false; }

    for (y = 0; y < h; y++) {
        const uint8_t *row = raw + (size_t)y * (size_t)(stride + 1) + 1;
        uint8_t *dst = rgba + (size_t)y * (size_t)w * 4;

        for (x = 0; x < w; x++) {
            const uint8_t *s = row + (size_t)x * (size_t)channels;
            uint8_t *d = dst + (size_t)x * 4;

            switch (colour) {
                case 0:
                    d[0] = d[1] = d[2] = s[0];
                    d[3] = 255;
                    break;
                case 2:
                    d[0] = s[0]; d[1] = s[1]; d[2] = s[2]; d[3] = 255;
                    break;
                case 3: {
                    int idx = (s[0] < npal) ? s[0] : 0;
                    d[0] = pal[idx * 3 + 0];
                    d[1] = pal[idx * 3 + 1];
                    d[2] = pal[idx * 3 + 2];
                    d[3] = alpha[idx];
                    break;
                }
                case 4:
                    d[0] = d[1] = d[2] = s[0];
                    d[3] = s[1];
                    break;
                default:
                    d[0] = s[0]; d[1] = s[1]; d[2] = s[2]; d[3] = s[3];
                    break;
            }
        }
    }
    free(raw);

    *out = rgba;
    *width = w;
    *height = h;
    return true;
}
