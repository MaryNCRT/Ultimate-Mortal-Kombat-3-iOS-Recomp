"""
Pose a UMK3 character from its .bones, .skinanim and .skin files.

This is the tool that made a character stand up for the first time in this
project, and it is worth being clear about what that proves. Four format
specifications and three decompiled functions all have to be right
simultaneously or the result is a scattered blob -- and two earlier attempts
produced exactly that, which is how we know the test has teeth:

    attempt 1   sum matricesA per vertex, no palette
                -> a diffuse cloud. Each A[i] lives in its own bone's local
                   space; summing across spaces is meaningless.

    attempt 2   palette with identity rotations
                -> a figure stretched 146 units along X and flat in Y. Bone
                   axes point along local X, so with no rotations the whole
                   skeleton unrolls into a line.

    attempt 3   palette from the .skinanim quaternions
                -> y spans 0..179. A standing human.

What it exercises:

    .bones      hierarchy and bone offsets     docs/SKIN-FORMAT.md
    .skinanim   per-bone quaternions           docs/SKIN-FORMAT.md
    .skin       influences, weights, positions docs/SKIN-FORMAT.md
    GetMFromQuat2, MatrixMul2, DrawSkinnedMesh2  decomp/lime/RenderSkinned.c

Usage:
  python pose.py <CHARACTER> <out.png> [frame]

e.g. `python pose.py KANO_STANDARD kano.png 0`. Files are looked up in the
res/ directory of an extracted IPA; set UMK3_RES or edit RES below.
"""

import math
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import skin                                       # noqa: E402

try:
    import numpy as np
except ImportError:
    raise SystemExit("numpy is required: pip install numpy")
try:
    from PIL import Image
except ImportError:
    raise SystemExit("Pillow is required: pip install Pillow")


def quat_matrix(q):
    """`GetMFromQuat2`, verbatim.

    Row-major 3x3, and the quaternion is stored **(x, y, z, w)** -- w last.
    That ordering is not a guess: it falls out of matching the nine outputs of
    the decompiled function against the standard conversion.
    """
    x, y, z, w = q
    xx, yy, zz = 2 * x * x, 2 * y * y, 2 * z * z
    xy, xz, yz = 2 * x * y, 2 * x * z, 2 * y * z
    wx, wy, wz = 2 * w * x, 2 * w * y, 2 * w * z
    return np.array([[1 - (yy + zz), xy + wz,       xz - wy],
                     [xy - wz,       1 - (xx + zz), yz + wx],
                     [xz + wy,       yz - wx,       1 - (xx + yy)]])


def load_bones(path):
    """Tree and per-bone offset. Returns (num, offsets, children, root)."""
    num, size, recs = skin.parse_bones(open(path, "rb").read())
    slots = size - 16                             # 9 normally, 8 for the ROBO variant
    offsets = [np.array(struct.unpack_from("<3f", r, 4)) for r in recs]
    children = [[v for v in (struct.unpack_from("<b", r, 16 + k)[0]
                             for k in range(slots)) if v != -1] for r in recs]
    claimed = {c for k in children for c in k}
    roots = [i for i in range(num) if i not in claimed]
    if len(roots) != 1:
        raise ValueError("%d roots, expected exactly 1" % len(roots))
    return num, offsets, children, roots[0]


def load_frame(path, index):
    """One animation frame: root position and one quaternion per bone.

    The frame is `float; float root[3];` then 20 bytes per bone, of which the
    first 16 are a unit quaternion as plain float32 -- verified: |q| comes out
    1.0000 for every bone. The remaining 4 bytes are not yet identified.
    """
    data = open(path, "rb").read()
    _scale, nframes, fsize, nbones, _end, hdr = skin.parse_anim(data)
    if not 0 <= index < nframes:
        raise ValueError("frame %d out of range (0..%d)" % (index, nframes - 1))
    base = hdr + index * fsize
    root = np.array(struct.unpack_from("<3f", data, base + 4))
    quats = [struct.unpack_from("<4f", data, base + 16 + i * 20)
             for i in range(nbones)]
    return root, quats, nframes


def build_palette(num, offsets, children, root, root_pos, quats):
    """The matrix palette, as `CreateMatrixPaletteRecurse2` builds it.

    Depth-first, **one animation frame consumed per bone visited** -- so the
    frames are indexed by visit order, not by bone index. Each bone composes
    with its parent through `MatrixMul2`, in the row-vector convention that
    `Xform2` uses.

    The root takes its translation from the animation frame rather than from
    the .bones file, which is the behaviour the decompiled palette walk gates
    behind a counter that fires exactly once.
    """
    palette = [None] * num
    order = [0]

    def walk(i, parent_r, parent_t):
        n = order[0]
        order[0] += 1
        r = quat_matrix(quats[n]) if n < len(quats) else np.eye(3)
        t = root_pos if n == 0 else offsets[i]
        palette[i] = (r @ parent_r, t @ parent_r + parent_t)
        for c in children[i]:
            walk(c, palette[i][0], palette[i][1])

    walk(root, np.eye(3), np.zeros(3))
    return palette


def skin_vertices(path, palette, num):
    """`DrawSkinnedMesh2`'s position path.

        pos = SUM over i of ( A[i] * M3x3 + w[i] * T )

    Four influences per vertex; the bone index is one byte of a packed word and
    0xFF means the slot is unused. The A vectors already carry their weight,
    which is why only the translation term multiplies by w.
    """
    blocks, _end = skin.parse(open(path, "rb").read())
    pts = []
    for s in blocks:
        for i in range(s.num_matrices):           # num_matrices is a vertex count
            idx = s.indexes[i]
            a = s.matrices_a[i]
            w = s.weights[i * 4:i * 4 + 4]
            p = np.zeros(3)
            for k in range(4):
                bone = (idx >> (8 * k)) & 0xFF
                if bone == 0xFF or bone >= num:
                    continue
                rot, trans = palette[bone]
                p += np.array(a[k * 3:k * 3 + 3]) @ rot + w[k] * trans
            pts.append(p)
    return np.array(pts)


class PosedMesh(object):
    """Duck-types meshview's mesh so the existing rasteriser can draw it."""
    __slots__ = ("name", "verts", "faces", "num_faces", "texture")


def build_mesh(path, pts, texture):
    """Assemble a renderable mesh from the skinned positions and the .skin's
    own topology.

    The two per-vertex blocks that sat unidentified for the whole project turn
    out to be indexed by **triangle**, not by vertex -- `num_verts` in the
    header is a triangle count, and it matches the `.meshset`'s face count for
    the character exactly (Kano: 1,602 both).

        vert_extra  6 bytes   three uint16 indices into the skinned positions
        vert_data  24 bytes   three UV pairs, one per triangle corner

    Verified across all 30 skin blocks in the game: every index lands inside
    `num_matrices`, the maximum is always exactly `num_matrices - 1` so no
    vertex goes unused, and **no file contains a single degenerate triangle**.

    UVs are stored per corner but are consistent for a shared index -- Kano's
    triangles 0 and 1 both give index 4 the UV (0.513, 0.142) -- so they
    collapse to per-vertex without splitting anything.
    """
    blocks, _end = skin.parse(open(path, "rb").read())
    faces, uvs, base = [], {}, 0
    for s in blocks:
        tri = struct.unpack("<%dH" % (s.num_verts * 3), s.vert_extra)
        for t in range(s.num_verts):
            a, b, c = tri[t*3], tri[t*3+1], tri[t*3+2]
            uv = struct.unpack_from("<6f", s.vert_data, t * 24)
            for j, v in enumerate((a, b, c)):
                uvs.setdefault(base + v, (uv[j*2], uv[j*2+1]))
            faces.append((base + a, base + b, base + c))
        base += s.num_matrices

    m = PosedMesh()
    m.name = "posed"
    m.faces = faces
    m.num_faces = len(faces)
    m.texture = texture
    m.verts = [(p[0], p[1], p[2]) + uvs.get(i, (0.0, 0.0))
               for i, p in enumerate(pts)]
    return m


def plot(pts, bone_pts, out, size=480):
    """Two orthographic views: front (X/Y) and side (Z/Y), bones in red."""
    img = np.full((size, size * 2, 3), 20, np.uint8)
    allp = np.vstack([pts, bone_pts])
    centre = (allp.max(0) + allp.min(0)) * 0.5
    radius = float(np.abs(allp - centre).max()) or 1.0

    def project(p, ax, ay):
        return (((p[:, ax] - centre[ax]) / radius * 0.45 + 0.5) * (size - 1),
                (0.5 - (p[:, ay] - centre[ay]) / radius * 0.45) * (size - 1))

    for (ax, ay), xoff in (((0, 1), 0), ((2, 1), size)):
        px, py = project(pts, ax, ay)
        for x, y in zip(px.astype(int), py.astype(int)):
            if 0 <= x < size and 0 <= y < size:
                img[y, x + xoff] = (110, 220, 140)
        bx, by = project(bone_pts, ax, ay)
        for x, y in zip(bx.astype(int), by.astype(int)):
            for dy in (-1, 0, 1):
                for dx in (-1, 0, 1):
                    if 0 <= x + dx < size and 0 <= y + dy < size:
                        img[y + dy, x + dx + xoff] = (235, 70, 70)
    Image.fromarray(img).save(out)


RES = os.environ.get("UMK3_RES", "res")


def main(argv):
    if len(argv) < 3:
        print(__doc__)
        return 1
    name, out = argv[1], argv[2]
    frame = int(argv[3]) if len(argv) > 3 else 0

    num, offsets, children, root = load_bones(os.path.join(RES, name + ".bones"))
    root_pos, quats, nframes = load_frame(os.path.join(RES, name + ".skinanim"),
                                          frame)
    palette = build_palette(num, offsets, children, root, root_pos, quats)
    pts = skin_vertices(os.path.join(RES, name + ".skin"), palette, num)
    bone_pts = np.array([palette[i][1] for i in range(num)])

    print("%s: %d bones, %d frames, frame %d" % (name, num, nframes, frame))
    print("  %d vertices" % len(pts))
    print("  x %7.1f..%7.1f   y %7.1f..%7.1f   z %7.1f..%7.1f"
          % (pts[:, 0].min(), pts[:, 0].max(), pts[:, 1].min(),
             pts[:, 1].max(), pts[:, 2].min(), pts[:, 2].max()))

    if "--render" in argv:
        import meshview
        texture = "%s_DIFFUSE.pvr" % name.split("_")[0]
        mesh = build_mesh(os.path.join(RES, name + ".skin"), pts, texture)
        print("  %d triangles, texture %s" % (mesh.num_faces, texture))
        yaw = 0.0
        for i, a in enumerate(argv):
            if a == "--angle" and i + 1 < len(argv):
                yaw = math.radians(float(argv[i + 1]))
        img, stats = meshview.render([mesh], RES, size=560, yaw=yaw,
                                     pitch=0.0, fit=0.62)
        Image.fromarray(img).save(out)
        print("  -> %s   %d triangles drawn" % (out, stats["triangles"]))
        return 0

    plot(pts, bone_pts, out)
    print("  -> %s   left: front X/Y   right: side Z/Y   (red = bones)" % out)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
