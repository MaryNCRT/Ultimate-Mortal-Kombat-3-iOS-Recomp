========================================================================
ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E  0x0009c060  132 bytes   Mayhem.mm
========================================================================

0009c060  push    {r4, r5, r6, r7, lr}
0009c062  add     r7, sp, #0xc
0009c064  push.w  {r8, sl}
0009c068  sub     sp, #4
0009c06a  mov     r6, r0
0009c06c  mov     r4, r1
0009c06e  cbz     r1, #0x9c098
0009c070  ldr     r3, [pc, #0x6c]
0009c072  add     r3, pc ; -> 0x000f3370  0x0
0009c074  ldr.w   r8, [r3]
0009c078  mov     r0, r6
0009c07a  ldr     r1, [r4, #0xc]
0009c07c  bl      #0x9c060 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E
0009c080  ldr     r3, [r4, #0x10]
0009c082  ldr     r5, [r4, #8]
0009c084  sub.w   r0, r3, #0xc
0009c088  cmp     r8, r0
0009c08a  bne     #0x9c0a2
0009c08c  mov     r0, r4
0009c08e  blx     #0xdd5a8 ; -> ZdlPv
0009c092  mov     r4, r5
0009c094  cmp     r5, #0
0009c096  bne     #0x9c078
0009c098  sub.w   sp, r7, #0x14
0009c09c  pop.w   {r8, sl}
0009c0a0  pop     {r4, r5, r6, r7, pc}
0009c0a2  subs    r2, r3, #4
0009c0a4  ldr     r3, [r3, #-0x4]
0009c0a8  subs    r1, r3, #1
0009c0aa  dmb     ish
0009c0ae  mov     ip, r3
0009c0b0  ldrex   sl, [r2]
0009c0b4  cmp     sl, r3
0009c0b6  beq     #0x9c0ce
0009c0b8  cmp     sl, ip
0009c0ba  mov     r3, sl
0009c0bc  bne     #0x9c0a8
0009c0be  cmp.w   sl, #0
0009c0c2  bgt     #0x9c08c
0009c0c4  add.w   r1, sp, #3
0009c0c8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009c0cc  b       #0x9c08c
0009c0ce  strex   lr, r1, [r2]
0009c0d2  cmp.w   lr, #0
0009c0d6  bne     #0x9c0b0
0009c0d8  dmb     ish
0009c0dc  b       #0x9c0b8
0009c0de  nop     
0009c0e0  strb    r2, [r7, #0xb]
0009c0e2  movs    r5, r0
