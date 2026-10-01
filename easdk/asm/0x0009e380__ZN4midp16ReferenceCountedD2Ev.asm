========================================================================
ZN4midp16ReferenceCountedD2Ev  0x0009e380  60 bytes   ReferenceCounted.cpp
========================================================================

0009e380  push    {r7, lr}
0009e382  add     r7, sp, #0
0009e384  ldr     r3, [pc, #0x24]
0009e386  add     r3, pc ; -> 0x0017dee4  ZTVN4midp16ReferenceCountedE
0009e388  adds    r3, #8
0009e38a  str     r3, [r0]
0009e38c  ldr     r3, [r0, #4]
0009e38e  cbnz    r3, #0x9e398
0009e390  mov.w   r3, #-1
0009e394  str     r3, [r0, #4]
0009e396  pop     {r7, pc}
0009e398  ldr     r0, [pc, #0x14]
0009e39a  ldr     r1, [pc, #0x18]
0009e39c  ldr     r3, [pc, #0x18]
0009e39e  add     r0, pc ; -> 0x000e5aec  ZZN4midp16ReferenceCountedD4EvE8__func__
0009e3a0  add     r1, pc ; -> 0x0017641c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.cpp'
0009e3a2  add     r3, pc ; -> 0x00176490  'm__refCount == REFCOUNT_BIAS'
0009e3a4  movs    r2, #0x24
0009e3a6  blx     #0xdd5cc ; -> assert_rtn
0009e3aa  nop     
0009e3ac  smmla   r0, sl, sp, r0
0009e3b0  strb    r2, [r1, #0x1d]
0009e3b2  movs    r4, r0
0009e3b4  strh    r0, [r7, #2]
0009e3b6  movs    r5, r1
0009e3b8  strh    r2, [r5, #6]
0009e3ba  movs    r5, r1
