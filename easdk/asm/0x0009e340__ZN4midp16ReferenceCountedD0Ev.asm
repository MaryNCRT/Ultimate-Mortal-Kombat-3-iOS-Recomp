========================================================================
ZN4midp16ReferenceCountedD0Ev  0x0009e340  64 bytes   ReferenceCounted.cpp
========================================================================

0009e340  push    {r7, lr}
0009e342  add     r7, sp, #0
0009e344  ldr     r3, [pc, #0x28]
0009e346  add     r3, pc ; -> 0x0017dee4  ZTVN4midp16ReferenceCountedE
0009e348  adds    r3, #8
0009e34a  str     r3, [r0]
0009e34c  ldr     r3, [r0, #4]
0009e34e  cbnz    r3, #0x9e35c
0009e350  mov.w   r3, #-1
0009e354  str     r3, [r0, #4]
0009e356  blx     #0xdd5a8 ; -> ZdlPv
0009e35a  pop     {r7, pc}
0009e35c  ldr     r0, [pc, #0x14]
0009e35e  ldr     r1, [pc, #0x18]
0009e360  ldr     r3, [pc, #0x18]
0009e362  add     r0, pc ; -> 0x000e5aec  ZZN4midp16ReferenceCountedD4EvE8__func__
0009e364  add     r1, pc ; -> 0x0017641c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.cpp'
0009e366  add     r3, pc ; -> 0x00176490  'm__refCount == REFCOUNT_BIAS'
0009e368  movs    r2, #0x24
0009e36a  blx     #0xdd5cc ; -> assert_rtn
0009e36e  nop     
