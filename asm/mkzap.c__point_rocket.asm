========================================================================
point_rocket  0x000782e0  284 bytes   mkzap.c
========================================================================

000782e0  push    {r4, r7, lr}
000782e2  add     r7, sp, #4
000782e4  ldr     r3, [r0, #8]
000782e6  mov     r4, r0
000782e8  ldr     r1, [r3, #0x18]
000782ea  ldr.w   ip, [r3, #0x1c]
000782ee  cmp     r1, #0
000782f0  itete   lt
000782f2  ldrlt   r2, [r3, #0x28]
000782f4  ldrge   r2, [r3, #0x28]
000782f6  orrlt   r2, r2, #0x10
000782fa  bicge   r2, r2, #0x10
000782fe  ite     lt
00078300  strlt   r2, [r3, #0x28]
00078302  strge   r2, [r3, #0x28]
00078304  rsb.w   r2, ip, #0
00078308  eor.w   r0, r1, r1, asr #31
0007830c  sub.w   r0, r0, r1, asr #31
00078310  vmov    s10, r0
00078314  vcvt.f64.s32 d6, s10
00078318  vmov    s10, r2
0007831c  vcvt.f64.s32 d7, s10
00078320  vmov    r0, r1, d6
00078324  vmov    r2, r3, d7
00078328  blx     #0xdd74c ; -> atan2
0007832c  vmov.f64 d6, #8.000000e+00
00078330  vmov    d7, r0, r1
00078334  vmul.f64 d7, d7, d6
00078338  vldr    d6, [pc, #0x9c]
0007833c  vdiv.f64 d7, d7, d6
00078340  vcvt.f32.f64 s14, d7
00078344  vmov.f64 d6, #5.000000e-01
00078348  vcvt.f64.f32 d7, s14
0007834c  vadd.f64 d7, d7, d6
00078350  vcvt.s32.f64 s14, d7
00078354  vmov    r0, s14
00078358  cmp     r0, #8
0007835a  bhi     #0x78378
0007835c  tbb     [pc, r0]
00078360  lsrs    r5, r1, #0x14
00078362  adds    r4, r2, #0
00078364  cmp     r4, #0x24
00078366  lsls    r4, r6, #0x14
00078368  lsrs    r5, r0, #0x10
0007836a  ldr     r3, [pc, #0x74]
0007836c  add     r3, pc ; -> 0x000f33c0  robo_ani_data
0007836e  ldr     r3, [r3]
00078370  add.w   r3, r3, #0x1540
00078374  adds    r3, #0x10
00078376  str     r3, [r4, #0x40]
00078378  pop     {r4, r7, pc}
0007837a  ldr     r3, [pc, #0x68]
0007837c  add     r3, pc ; -> 0x000f33c0  robo_ani_data
0007837e  ldr     r3, [r3]
00078380  add.w   r3, r3, #0x1500
00078384  str     r3, [r4, #0x40]
00078386  b       #0x78378
00078388  ldr     r3, [pc, #0x5c]
0007838a  add     r3, pc ; -> 0x000f33c0  robo_ani_data
0007838c  ldr     r3, [r3]
0007838e  add.w   r3, r3, #0x1500
00078392  adds    r3, #0x14
00078394  str     r3, [r4, #0x40]
00078396  b       #0x78378
00078398  ldr     r3, [pc, #0x50]
0007839a  add     r3, pc ; -> 0x000f33c0  robo_ani_data
0007839c  ldr     r3, [r3]
0007839e  add.w   r3, r3, #0x1500
000783a2  adds    r3, #0x28
000783a4  str     r3, [r4, #0x40]
000783a6  b       #0x78378
000783a8  ldr     r3, [pc, #0x44]
000783aa  add     r3, pc ; -> 0x000f33c0  robo_ani_data
000783ac  ldr     r3, [r3]
000783ae  add.w   r3, r3, #0x1500
000783b2  adds    r3, #0x3c
000783b4  str     r3, [r4, #0x40]
000783b6  b       #0x78378
000783b8  ldr     r3, [pc, #0x38]
000783ba  add     r3, pc ; -> 0x000f33c0  robo_ani_data
000783bc  ldr     r3, [r3]
000783be  add.w   r3, r3, #0x1540
000783c2  adds    r3, #0x38
000783c4  str     r3, [r4, #0x40]
000783c6  b       #0x78378
000783c8  ldr     r3, [pc, #0x2c]
000783ca  add     r3, pc ; -> 0x000f33c0  robo_ani_data
000783cc  ldr     r3, [r3]
000783ce  add.w   r3, r3, #0x1540
000783d2  adds    r3, #0x24
000783d4  str     r3, [r4, #0x40]
000783d6  b       #0x78378
000783d8  cmp     r5, #0x18
000783da  strb    r4, [r0, r1]
000783dc  movs    r1, #0xfb
000783de  ands    r1, r1
000783e0  add     sp, #0x140
000783e2  movs    r7, r0
000783e4  add     sp, #0x100
000783e6  movs    r7, r0
000783e8  add     sp, #0xc8
000783ea  movs    r7, r0
000783ec  add     sp, #0x88
000783ee  movs    r7, r0
000783f0  add     sp, #0x48
000783f2  movs    r7, r0
000783f4  add     sp, #8
000783f6  movs    r7, r0
000783f8  add     r7, sp, #0x3c8
000783fa  movs    r7, r0
