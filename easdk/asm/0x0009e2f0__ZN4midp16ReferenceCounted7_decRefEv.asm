========================================================================
ZN4midp16ReferenceCounted7_decRefEv  0x0009e2f0  80 bytes   ReferenceCounted.cpp
========================================================================

0009e2f0  push    {r7, lr}
0009e2f2  add     r7, sp, #0
0009e2f4  sub     sp, #4
0009e2f6  ldr     r3, [r0, #4]
0009e2f8  cmp     r3, #0
0009e2fa  ble     #0x9e320
0009e2fc  ldr     r3, [r0, #4]!
0009e300  cmp     r3, #1
0009e302  ite     ne
0009e304  movne   r3, #0
0009e306  moveq   r3, #1
0009e308  mov     r1, r0
0009e30a  mov.w   r0, #-1
0009e30e  strb.w  r3, [sp, #3]
0009e312  blx     #0xdd428 ; -> OSAtomicAdd32
0009e316  ldrb.w  r0, [sp, #3]
0009e31a  sub.w   sp, r7, #0
0009e31e  pop     {r7, pc}
0009e320  ldr     r0, [pc, #0x10]
0009e322  ldr     r1, [pc, #0x14]
0009e324  ldr     r3, [pc, #0x14]
0009e326  add     r0, pc ; -> 0x000e5ae4  ZZN4midp16ReferenceCounted7_decRefEvE8__func__
0009e328  add     r1, pc ; -> 0x0017638c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.cpp'
0009e32a  add     r3, pc ; -> 0x00176400  'm__refCount > REFCOUNT_BIAS'
0009e32c  movs    r2, #0x30
0009e32e  blx     #0xdd5cc ; -> assert_rtn
0009e332  nop     
0009e334  strb    r2, [r7, #0x1e]
0009e336  movs    r4, r0
0009e338  strh    r0, [r4, #2]
0009e33a  movs    r5, r1
0009e33c  strh    r2, [r2, #6]
0009e33e  movs    r5, r1
