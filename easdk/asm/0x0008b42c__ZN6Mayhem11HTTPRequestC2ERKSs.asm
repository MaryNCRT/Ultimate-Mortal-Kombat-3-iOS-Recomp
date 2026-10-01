========================================================================
ZN6Mayhem11HTTPRequestC2ERKSs  0x0008b42c  72 bytes   Mayhem.mm
========================================================================

0008b42c  push    {r4, r7, lr}
0008b42e  add     r7, sp, #4
0008b430  mov     r4, r0
0008b432  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008b436  ldr     r3, [pc, #0x30]
0008b438  ldr     r0, [pc, #0x30]
0008b43a  add.w   ip, r4, #0xc
0008b43e  add     r3, pc ; -> 0x000f3370  0x0
0008b440  add     r0, pc ; -> 0x000de1e8  ZZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE13_Rb_tree_implIS6_Lb0EEC4ERKSaISt13_Rb_tree_nodeIS2_EERKS6_E6C.1379
0008b442  ldr     r3, [r3]
0008b444  add.w   lr, r3, #0xc
0008b448  ldm     r0, {r0, r1, r2, r3}
0008b44a  str.w   lr, [r4, #4]
0008b44e  str.w   lr, [r4, #0x20]
0008b452  stm.w   ip, {r0, r1, r2, r3}
0008b456  movs    r3, #0
0008b458  str.w   ip, [r4, #0x14]
0008b45c  str     r3, [r4, #0x1c]
0008b45e  str     r3, [r4, #0xc]
0008b460  str     r3, [r4, #0x10]
0008b462  str.w   ip, [r4, #0x18]
0008b466  pop     {r4, r7, pc}
0008b468  ldrb    r6, [r5, #0x1c]
0008b46a  movs    r6, r0
0008b46c  cmp     r5, #0xa4
0008b46e  movs    r5, r0
0008b470  nop     
0008b472  nop     
