"""
Differential test for the PVRTC decoder, against EA's own PNGs.

The game ships **38 textures twice** — as `NAME.PNG` and `NAME.pvr`. The PNG is
the uncompressed source the PVR was built from, which makes it a reference
implementation that costs nothing and required no external tool. It was sitting
in the bundle the whole time.

Compares `tools/pvrtc.py` output against the PNG channel by channel and reports
the mean and maximum absolute difference. PVRTC is lossy, so a correct decoder
will not score zero — but it should be within a few units out of 255. Anything
larger is a bug in the decoder, not compression loss.

Usage:
  python pvrtc_diff.py
"""

import sys,os,glob
sys.path.insert(0,"tools")
from pvr import load as load_pvr
from pvrtc import decode
from PIL import Image
TX=r"E:\MK3 PROJECT\WORK\stage\Payload\UMK3.app\res\Textures"
pairs=[]
for p in glob.glob(os.path.join(TX,"*.PNG")):
    b=p[:-4]
    if os.path.exists(b+".pvr"): pairs.append((b+".pvr",p))
print("pares: %d"%len(pairs))
rows=[]
for pvrp,pngp in sorted(pairs):
    name=os.path.basename(pvrp)
    try:
        t=load_pvr(pvrp); w,h,px=decode(t)
    except Exception as e:
        rows.append((name,"ERROR "+str(e),None,None)); continue
    ref=Image.open(pngp).convert("RGBA")
    if ref.size!=(w,h):
        rows.append((name,"tamano %s vs %s"%(ref.size,(w,h)),None,None)); continue
    rp=ref.tobytes()
    n=w*h
    tot=0; mx=0
    for i in range(0,n*4,4):
        for c in range(3):
            d=abs(rp[i+c]-px[i+c]); tot+=d
            if d>mx: mx=d
    avg=tot/(n*3.0)
    rows.append((name,"%dx%d %s"%(w,h,t.format_name),avg,mx))
ok=[r for r in rows if r[2] is not None]
print("\n%-30s %-20s %8s %6s"%("textura","formato","dif.media","max"))
for n,f,a,m in sorted(ok,key=lambda r:r[2])[:6]: print("%-30s %-20s %8.2f %6d"%(n,f,a,m))
print("   ...")
for n,f,a,m in sorted(ok,key=lambda r:-r[2])[:6]: print("%-30s %-20s %8.2f %6d"%(n,f,a,m))
if ok:
    import statistics
    print("\ncomparadas: %d de %d"%(len(ok),len(rows)))
    print("diferencia media global: %.2f / 255  (%.1f%%)"%(statistics.mean(r[2] for r in ok), 100*statistics.mean(r[2] for r in ok)/255))
    print("peor maximo: %d"%max(r[3] for r in ok))
for n,f,a,m in rows:
    if a is None: print("  SIN COMPARAR %-28s %s"%(n,f))
