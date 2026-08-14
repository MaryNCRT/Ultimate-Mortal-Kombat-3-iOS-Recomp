"""
Puntua las funciones por dificultad de decompilacion y emite una lista de
trabajo ordenada de facil a dificil.

Atacar primero las funciones simples rinde mucho mas que ir en orden
arbitrario: las faciles se verifican rapido, y al hacerlo se descubren los
tipos, structs y convenciones que luego hacen legibles a las dificiles.

Metricas por funcion (todas baratas de calcular sobre el desensamblado):
  - numero de instrucciones          -> tamano bruto
  - saltos condicionales             -> complejidad ciclomatica
  - saltos hacia atras               -> bucles
  - llamadas                         -> dependencias de otras funciones
  - bloques IT                       -> ejecucion condicional Thumb
  - saltos indirectos (bx/blx reg)   -> tablas de salto, lo mas dificil
  - bytes no decodificados           -> pools de literales intercalados

Uso:
  python rank.py <slice_thin> [archivo_fuente] [--csv salida.csv]
"""

import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from macho import MachO, read_file, N_STAB, N_TYPE, N_SECT  # noqa: E402

from capstone import Cs, CS_ARCH_ARM, CS_MODE_ARM, CS_MODE_THUMB, CS_MODE_LITTLE_ENDIAN
from capstone.arm_const import ARM_OP_IMM, ARM_OP_REG, ARM_CC_AL, ARM_CC_INVALID

N_ARM_THUMB_DEF = 0x0008
OUT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))

# Pesos: cuanto encarece cada rasgo la decompilacion manual.
W_INSN = 1.0
W_COND = 6.0
W_LOOP = 25.0
W_CALL = 4.0
W_IT = 15.0
W_INDIRECT = 60.0
W_GAP = 0.5


class FuncInfo(object):
    __slots__ = ("addr", "name", "src", "thumb", "size", "insns", "conds",
                 "loops", "calls", "its", "indirect", "gap", "score")


def analyze(path, only_file=None):
    m = MachO(read_file(path), 0)
    text = m.section_by_name("__TEXT", "__text")

    best = {}
    for name, n_type, n_sect, n_desc, n_value in m.symbols():
        if n_type & N_STAB or (n_type & N_TYPE) != N_SECT:
            continue
        a = n_value & ~1
        if not text.contains_addr(a):
            continue
        thumb = bool(n_value & 1) or bool(n_desc & N_ARM_THUMB_DEF)
        prev = best.get(a)
        if prev is None or len(name) > len(prev[0]):
            best[a] = (name, thumb)

    # mapa funcion -> archivo fuente
    fmap = {}
    ftf = os.path.join(OUT, "func-to-file.txt")
    if os.path.exists(ftf):
        with open(ftf, encoding="utf-8") as fh:
            for line in fh:
                if line.startswith("0x"):
                    p = line.split()
                    if len(p) >= 3:
                        fmap[p[1]] = p[2].replace("\\", "/").rsplit("/", 1)[-1]

    addrs = sorted(best)
    end = text.addr + text.size
    md_t = Cs(CS_ARCH_ARM, CS_MODE_THUMB | CS_MODE_LITTLE_ENDIAN)
    md_a = Cs(CS_ARCH_ARM, CS_MODE_ARM | CS_MODE_LITTLE_ENDIAN)
    md_t.detail = True
    md_a.detail = True

    out = []
    for i, a in enumerate(addrs):
        name, thumb = best[a]
        src = fmap.get(name, "?")
        if only_file and src != only_file:
            continue
        size = (addrs[i + 1] if i + 1 < len(addrs) else end) - a
        off = text.offset + (a - text.addr)
        code = m.data[off:off + size]
        md = md_t if thumb else md_a

        fi = FuncInfo()
        fi.addr, fi.name, fi.src, fi.thumb, fi.size = a, name, src, thumb, size
        fi.insns = fi.conds = fi.loops = fi.calls = fi.its = fi.indirect = 0
        decoded = 0

        for ins in md.disasm(code, a):
            fi.insns += 1
            decoded += ins.size
            b = ins.mnemonic.split(".")[0]
            if b == "it" or (b.startswith("it") and set(b[2:]) <= set("te")):
                fi.its += 1
            if b in ("bl", "blx"):
                fi.calls += 1
                if ins.operands and ins.operands[0].type == ARM_OP_REG:
                    fi.indirect += 1
            elif b == "bx":
                if ins.operands and ins.reg_name(ins.operands[0].reg) != "lr":
                    fi.indirect += 1
            elif b in ("tbb", "tbh"):
                fi.indirect += 1
            elif b.startswith("b") or b in ("cbz", "cbnz"):
                if ins.cc not in (ARM_CC_AL, ARM_CC_INVALID, 0) or b in ("cbz", "cbnz"):
                    fi.conds += 1
                for op in ins.operands:
                    if op.type == ARM_OP_IMM and a <= op.imm < ins.address:
                        fi.loops += 1

        fi.gap = size - decoded
        fi.score = (W_INSN * fi.insns + W_COND * fi.conds + W_LOOP * fi.loops
                    + W_CALL * fi.calls + W_IT * fi.its
                    + W_INDIRECT * fi.indirect + W_GAP * fi.gap)
        out.append(fi)

    out.sort(key=lambda f: (f.score, f.addr))
    return out


def main():
    path = sys.argv[1]
    only = None
    csv = None
    args = sys.argv[2:]
    i = 0
    while i < len(args):
        if args[i] == "--csv":
            csv = args[i + 1]
            i += 2
        else:
            only = args[i]
            i += 1

    fns = analyze(path, only)
    print("%-6s %-42s %-22s %5s %5s %5s %5s %4s %4s %4s %8s"
          % ("addr", "funcion", "archivo", "ins", "cond", "loop", "call",
             "IT", "ind", "gap", "score"))
    for f in fns:
        print("%06x %-42s %-22s %5d %5d %5d %5d %4d %4d %4d %8.1f"
              % (f.addr, f.name[:42], f.src[:22], f.insns, f.conds, f.loops,
                 f.calls, f.its, f.indirect, f.gap, f.score))

    print("\ntotal: %d funciones" % len(fns))
    if fns:
        easy = sum(1 for f in fns if f.score < 100)
        mid = sum(1 for f in fns if 100 <= f.score < 400)
        hard = len(fns) - easy - mid
        print("  faciles  (score <100): %d" % easy)
        print("  medias   (100-400):    %d" % mid)
        print("  dificiles(>400):       %d" % hard)
        print("  con saltos indirectos: %d" % sum(1 for f in fns if f.indirect))

    if csv:
        with open(csv, "w", encoding="utf-8") as fh:
            fh.write("addr,name,src,insns,conds,loops,calls,its,indirect,gap,score\n")
            for f in fns:
                fh.write("0x%08x,%s,%s,%d,%d,%d,%d,%d,%d,%d,%.1f\n"
                         % (f.addr, f.name, f.src, f.insns, f.conds, f.loops,
                            f.calls, f.its, f.indirect, f.gap, f.score))
        print("\nescrito %s" % csv)


if __name__ == "__main__":
    main()
