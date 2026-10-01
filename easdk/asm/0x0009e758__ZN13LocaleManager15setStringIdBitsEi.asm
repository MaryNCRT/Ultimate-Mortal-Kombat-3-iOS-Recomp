========================================================================
ZN13LocaleManager15setStringIdBitsEi  0x0009e758  60 bytes   LocaleManager.mm
========================================================================

0009e758  push    {r7, lr}
0009e75a  add     r7, sp, #0
0009e75c  cmp     r1, #0x1e
0009e75e  bhi     #0x9e776
0009e760  movs    r3, #1
0009e762  str     r1, [r0, #0x28]
0009e764  lsls.w  r1, r3, r1
0009e768  subs    r1, #1
0009e76a  mvn     r3, #0x80000000
0009e76e  str     r1, [r0, #0x2c]
0009e770  subs    r3, r3, r1
0009e772  str     r3, [r0, #0x24]
0009e774  pop     {r7, pc}
0009e776  ldr     r0, [pc, #0x10]
0009e778  ldr     r1, [pc, #0x10]
0009e77a  ldr     r3, [pc, #0x14]
0009e77c  add     r0, pc ; -> 0x000e5c94  ZZN13LocaleManager15setStringIdBitsEiE8__func__
0009e77e  add     r1, pc ; -> 0x00176514  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/text/LocaleManager.mm'
0009e780  add     r3, pc ; -> 0x0017657c  'shift >= 0 && shift < 31'
0009e782  movs    r2, #0x63
0009e784  blx     #0xdd5cc ; -> assert_rtn
0009e788  strb    r4, [r2, #0x14]
0009e78a  movs    r4, r0
0009e78c  ldrb    r2, [r2, #0x16]
0009e78e  movs    r5, r1
0009e790  ldrb    r0, [r7, #0x17]
0009e792  movs    r5, r1
