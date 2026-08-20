#include "pvr.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define PVR_HEADER  52
#define PVR_TAG     0x21525650u          /* "PVR!" little-endian */
#define BLOCK_BYTES 8

static uint32_t rd_u32(const uint8_t *p)
{
    return (uint32_t)p[0] | ((uint32_t)p[1] << 8) |
           ((uint32_t)p[2] << 16) | ((uint32_t)p[3] << 24);
}

/* Endpoint A -- the top 16 bits of the colour word. */
static void colour_a(uint16_t packed, int *out)
{
    if (packed & 0x8000) {                 /* opaque: 5-5-5 */
        int r = (packed >> 10) & 0x1F, g = (packed >> 5) & 0x1F, b = packed & 0x1F;
        out[0] = (r << 3) | (r >> 2);
        out[1] = (g << 3) | (g >> 2);
        out[2] = (b << 3) | (b >> 2);
        out[3] = 255;
        return;
    }
    int a = (packed >> 12) & 0x07;         /* translucent: 3-4-4-3 */
    int r = (packed >> 8) & 0x0F;
    int g = (packed >> 4) & 0x0F;
    int b = (packed >> 1) & 0x07;
    out[0] = (r << 4) | r;
    out[1] = (g << 4) | g;
    out[2] = (b << 5) | (b << 2) | (b >> 1);
    out[3] = (a << 5) | (a << 2) | (a >> 1);
}

/* Endpoint B -- the low 16 bits. B has four bits of blue where A has three,
 * because A gives up its low bit to the modulation flag. */
static void colour_b(uint16_t packed, int *out)
{
    if (packed & 0x8000) {                 /* opaque: 5-5-5 */
        int r = (packed >> 10) & 0x1F, g = (packed >> 5) & 0x1F, b = packed & 0x1F;
        out[0] = (r << 3) | (r >> 2);
        out[1] = (g << 3) | (g >> 2);
        out[2] = (b << 3) | (b >> 2);
        out[3] = 255;
        return;
    }
    int a = (packed >> 12) & 0x07;         /* translucent: 3-4-4-4 */
    int r = (packed >> 8) & 0x0F;
    int g = (packed >> 4) & 0x0F;
    int b = packed & 0x0F;
    out[0] = (r << 4) | r;
    out[1] = (g << 4) | g;
    out[2] = (b << 4) | b;
    out[3] = (a << 5) | (a << 2) | (a >> 1);
}

/* Blocks are stored in Morton order: the bits of x and y interleaved, with
 * whichever axis is longer contributing its remaining high bits linearly. */
static int morton_index(int x, int y, int width, int height)
{
    int n = (width < height) ? width : height;
    int idx = 0, shift = 0;
    for (int k = n; k > 1; k >>= 1) {
        idx |= ((y & 1) << shift) | ((x & 1) << (shift + 1));
        x >>= 1; y >>= 1; shift += 2;
    }
    idx |= (width > height ? x : y) << shift;
    return idx;
}

static int wrapi(int v, int n)
{
    if (n <= 0) return 0;
    v %= n;
    return v < 0 ? v + n : v;
}

static int floor_div(float f)
{
    int i = (int)f;
    return (f < 0.0f && (float)i != f) ? i - 1 : i;
}

static bool decode_pvrtc(const uint8_t *raw, long raw_len, int width, int height,
                         int two_bpp, LimeImage *out)
{
    const int bw = two_bpp ? 8 : 4, bh = 4;
    int bx = (width  + bw - 1) / bw; if (bx < 1) bx = 1;
    int by = (height + bh - 1) / bh; if (by < 1) by = 1;
    if (raw_len < (long)bx * by * BLOCK_BYTES) return false;

    const int nb = bx * by;
    uint32_t *mods = malloc((size_t)nb * sizeof(uint32_t));
    uint8_t  *mode = malloc((size_t)nb);
    int      *ca   = malloc((size_t)nb * 4 * sizeof(int));
    int      *cb   = malloc((size_t)nb * 4 * sizeof(int));
    uint8_t  *rgba = malloc((size_t)width * (size_t)height * 4);
    if (!mods || !mode || !ca || !cb || !rgba) {
        free(mods); free(mode); free(ca); free(cb); free(rgba);
        return false;
    }

    for (int j = 0; j < by; j++) {
        for (int i = 0; i < bx; i++) {
            long off = (long)morton_index(i, j, bx, by) * BLOCK_BYTES;
            uint32_t m = rd_u32(raw + off);
            uint32_t c = rd_u32(raw + off + 4);
            int k = j * bx + i;
            mods[k] = m;
            mode[k] = (uint8_t)(c & 1);
            /* Colour B is the LOW 16 bits and is NOT shifted: the modulation
             * flag shares bit 0 with the least significant bit of blue rather
             * than displacing the field. Shifting corrupts every channel. */
            colour_b((uint16_t)(c & 0xFFFF), &cb[k * 4]);
            colour_a((uint16_t)((c >> 16) & 0xFFFF), &ca[k * 4]);
        }
    }

    static const float W_PUNCH[4]  = { 0.0f, 0.5f, 0.5f, 1.0f };
    static const float W_NORMAL[4] = { 0.0f, 0.375f, 0.625f, 1.0f };

    for (int py = 0; py < height; py++) {
        for (int px = 0; px < width; px++) {
            /* The endpoints for a pixel come from the four blocks whose
             * centres surround it, so the block grid sits half a block off. */
            float fx = (float)(px - bw / 2) / (float)bw;
            float fy = (float)(py - bh / 2) / (float)bh;
            int i0 = floor_div(fx), j0 = floor_div(fy);
            float u = fx - (float)i0, v = fy - (float)j0;
            i0 = wrapi(i0, bx); j0 = wrapi(j0, by);
            int i1 = wrapi(i0 + 1, bx), j1 = wrapi(j0 + 1, by);

            int k00 = j0 * bx + i0, k10 = j0 * bx + i1;
            int k01 = j1 * bx + i0, k11 = j1 * bx + i1;
            float w00 = (1.0f - u) * (1.0f - v), w10 = u * (1.0f - v);
            float w01 = (1.0f - u) * v,          w11 = u * v;

            float A[4], B[4];
            for (int ch = 0; ch < 4; ch++) {
                A[ch] = (float)ca[k00*4+ch]*w00 + (float)ca[k10*4+ch]*w10 +
                        (float)ca[k01*4+ch]*w01 + (float)ca[k11*4+ch]*w11;
                B[ch] = (float)cb[k00*4+ch]*w00 + (float)cb[k10*4+ch]*w10 +
                        (float)cb[k01*4+ch]*w01 + (float)cb[k11*4+ch]*w11;
            }

            /* modulation comes from the block the pixel physically sits in */
            int mk = (py / bh) * bx + (px / bw);
            int lx = px % bw, ly = py % bh;
            float w;
            int punch = 0;
            if (two_bpp) {
                w = ((mods[mk] >> (ly * 8 + lx)) & 1u) ? 1.0f : 0.0f;
            } else {
                int sel = (int)((mods[mk] >> ((ly * 4 + lx) * 2)) & 3u);
                if (mode[mk]) { w = W_PUNCH[sel]; punch = (sel == 2); }
                else          { w = W_NORMAL[sel]; }
            }

            uint8_t *o = rgba + ((size_t)py * (size_t)width + (size_t)px) * 4;
            for (int ch = 0; ch < 3; ch++) {
                float val = B[ch] * (1.0f - w) + A[ch] * w + 0.5f;
                o[ch] = (uint8_t)(val < 0.0f ? 0.0f : (val > 255.0f ? 255.0f : val));
            }
            float al = B[3] * (1.0f - w) + A[3] * w + 0.5f;
            o[3] = punch ? 0 :
                   (uint8_t)(al < 0.0f ? 0.0f : (al > 255.0f ? 255.0f : al));
        }
    }

    free(mods); free(mode); free(ca); free(cb);
    out->width = width;
    out->height = height;
    out->rgba = rgba;
    return true;
}

bool lime_pvr_load(const char *path, LimeImage *out)
{
    memset(out, 0, sizeof(*out));

    FILE *f = fopen(path, "rb");
    if (!f) return false;
    fseek(f, 0, SEEK_END);
    long size = ftell(f);
    fseek(f, 0, SEEK_SET);
    if (size < PVR_HEADER) { fclose(f); return false; }

    uint8_t *raw = malloc((size_t)size);
    if (!raw) { fclose(f); return false; }
    if (fread(raw, 1, (size_t)size, f) != (size_t)size) {
        free(raw); fclose(f); return false;
    }
    fclose(f);

    uint32_t hlen   = rd_u32(raw + 0);
    uint32_t height = rd_u32(raw + 4);
    uint32_t width  = rd_u32(raw + 8);
    uint32_t flags  = rd_u32(raw + 16);
    uint32_t tag    = rd_u32(raw + 44);

    if (tag != PVR_TAG || hlen != PVR_HEADER) { free(raw); return false; }

    uint32_t fmt = flags & 0xFF;
    bool ok = false;
    if (fmt == 0x19)                       /* PVRTC 4bpp */
        ok = decode_pvrtc(raw + PVR_HEADER, size - PVR_HEADER,
                          (int)width, (int)height, 0, out);
    else if (fmt == 0x18)                  /* PVRTC 2bpp */
        ok = decode_pvrtc(raw + PVR_HEADER, size - PVR_HEADER,
                          (int)width, (int)height, 1, out);

    free(raw);
    return ok;
}

void lime_image_free(LimeImage *img)
{
    if (img) { free(img->rgba); memset(img, 0, sizeof(*img)); }
}

bool lime_texture_load(const char *res_dir, const char *mesh_texture,
                       LimeImage *out)
{
    memset(out, 0, sizeof(*out));
    if (!mesh_texture || !*mesh_texture) return false;

    /* Strip the exporter placeholder extension. */
    char stem[128];
    size_t n = strlen(mesh_texture);
    if (n >= sizeof(stem)) n = sizeof(stem) - 1;
    memcpy(stem, mesh_texture, n);
    stem[n] = 0;
    char *dot = strrchr(stem, '.');
    if (dot) *dot = 0;

    static const char *exts[2] = { ".pvr", ".PVR" };
    char path[512];
    for (int e = 0; e < 2; e++) {
        snprintf(path, sizeof(path), "%s/Textures/%s%s", res_dir, stem, exts[e]);
        if (lime_pvr_load(path, out)) return true;
        snprintf(path, sizeof(path), "%s/%s%s", res_dir, stem, exts[e]);
        if (lime_pvr_load(path, out)) return true;
    }
    return false;
}
