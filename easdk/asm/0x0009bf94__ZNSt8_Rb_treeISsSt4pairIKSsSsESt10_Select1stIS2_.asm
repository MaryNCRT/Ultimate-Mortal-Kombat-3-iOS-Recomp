========================================================================
ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E  0x0009bf94  204 bytes   Mayhem.mm
========================================================================

0009bf94  push    {r4, r5, r6, r7, lr}
0009bf96  add     r7, sp, #0xc
0009bf98  push.w  {r8, sl}
0009bf9c  sub     sp, #4
0009bf9e  mov     sl, r0
0009bfa0  mov     r4, r1
0009bfa2  cbz     r1, #0x9bfda
0009bfa4  ldr     r3, [pc, #0xb4]
0009bfa6  add     r3, pc ; -> 0x000f3370  0x0
0009bfa8  ldr.w   r8, [r3]
0009bfac  mov     r0, sl
0009bfae  ldr     r1, [r4, #0xc]
0009bfb0  bl      #0x9bf94 ; -> ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E
0009bfb4  ldr     r3, [r4, #0x14]
0009bfb6  ldr     r6, [r4, #8]
0009bfb8  add.w   r5, r4, #0x10
0009bfbc  sub.w   r0, r3, #0xc
0009bfc0  cmp     r0, r8
0009bfc2  bne     #0x9bfe4
0009bfc4  ldr     r3, [r5]
0009bfc6  sub.w   r0, r3, #0xc
0009bfca  cmp     r0, r8
0009bfcc  bne     #0x9c010
0009bfce  mov     r0, r4
0009bfd0  blx     #0xdd5a8 ; -> ZdlPv
0009bfd4  mov     r4, r6
0009bfd6  cmp     r6, #0
0009bfd8  bne     #0x9bfac
0009bfda  sub.w   sp, r7, #0x14
0009bfde  pop.w   {r8, sl}
0009bfe2  pop     {r4, r5, r6, r7, pc}
0009bfe4  subs    r2, r3, #4
0009bfe6  ldr     r3, [r3, #-0x4]
0009bfea  subs    r1, r3, #1
0009bfec  dmb     ish
0009bff0  mov     ip, r3
0009bff2  ldrex   sb, [r2]
0009bff6  cmp     sb, r3
0009bff8  beq     #0x9c04a
0009bffa  cmp     sb, ip
0009bffc  mov     r3, sb
0009bffe  bne     #0x9bfea
0009c000  cmp.w   sb, #0
0009c004  bgt     #0x9bfc4
0009c006  add.w   r1, sp, #3
0009c00a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009c00e  b       #0x9bfc4
0009c010  subs    r2, r3, #4
0009c012  ldr     r3, [r3, #-0x4]
0009c016  subs    r1, r3, #1
0009c018  dmb     ish
0009c01c  mov     ip, r3
0009c01e  ldrex   r5, [r2]
0009c022  cmp     r5, r3
0009c024  beq     #0x9c03a
0009c026  cmp     r5, ip
0009c028  mov     r3, r5
0009c02a  bne     #0x9c016
0009c02c  cmp     r5, #0
0009c02e  bgt     #0x9bfce
0009c030  add.w   r1, sp, #2
0009c034  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009c038  b       #0x9bfce
0009c03a  strex   sb, r1, [r2]
0009c03e  cmp.w   sb, #0
0009c042  bne     #0x9c01e
0009c044  dmb     ish
0009c048  b       #0x9c026
0009c04a  strex   lr, r1, [r2]
0009c04e  cmp.w   lr, #0
0009c052  bne     #0x9bff2
0009c054  dmb     ish
0009c058  b       #0x9bffa
0009c05a  nop     
0009c05c  strb    r6, [r0, #0xf]
0009c05e  movs    r5, r0
