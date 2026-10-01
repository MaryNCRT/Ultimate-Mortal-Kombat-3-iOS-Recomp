========================================================================
ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E  0x0009c0e4  132 bytes   Mayhem.mm
========================================================================

0009c0e4  push    {r4, r5, r6, r7, lr}
0009c0e6  add     r7, sp, #0xc
0009c0e8  push.w  {r8, sl}
0009c0ec  sub     sp, #4
0009c0ee  mov     r6, r0
0009c0f0  mov     r4, r1
0009c0f2  cbz     r1, #0x9c11c
0009c0f4  ldr     r3, [pc, #0x6c]
0009c0f6  add     r3, pc ; -> 0x000f3370  0x0
0009c0f8  ldr.w   r8, [r3]
0009c0fc  mov     r0, r6
0009c0fe  ldr     r1, [r4, #0xc]
0009c100  bl      #0x9c0e4 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E
0009c104  ldr     r3, [r4, #0x10]
0009c106  ldr     r5, [r4, #8]
0009c108  sub.w   r0, r3, #0xc
0009c10c  cmp     r8, r0
0009c10e  bne     #0x9c126
0009c110  mov     r0, r4
0009c112  blx     #0xdd5a8 ; -> ZdlPv
0009c116  mov     r4, r5
0009c118  cmp     r5, #0
0009c11a  bne     #0x9c0fc
0009c11c  sub.w   sp, r7, #0x14
0009c120  pop.w   {r8, sl}
0009c124  pop     {r4, r5, r6, r7, pc}
0009c126  subs    r2, r3, #4
0009c128  ldr     r3, [r3, #-0x4]
0009c12c  subs    r1, r3, #1
0009c12e  dmb     ish
0009c132  mov     ip, r3
0009c134  ldrex   sl, [r2]
0009c138  cmp     sl, r3
0009c13a  beq     #0x9c152
0009c13c  cmp     sl, ip
0009c13e  mov     r3, sl
0009c140  bne     #0x9c12c
0009c142  cmp.w   sl, #0
0009c146  bgt     #0x9c110
0009c148  add.w   r1, sp, #3
0009c14c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009c150  b       #0x9c110
0009c152  strex   lr, r1, [r2]
0009c156  cmp.w   lr, #0
0009c15a  bne     #0x9c134
0009c15c  dmb     ish
0009c160  b       #0x9c13c
0009c162  nop     
0009c164  strb    r6, [r6, #9]
0009c166  movs    r5, r0
