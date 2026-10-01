========================================================================
ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE16_M_insert_uniqueERKS5_  0x0009b3d4  232 bytes   Mayhem.mm
========================================================================

0009b3d4  push    {r4, r5, r6, r7, lr}
0009b3d6  add     r7, sp, #0xc
0009b3d8  push.w  {r8, sl, fp}
0009b3dc  sub     sp, #0x10
0009b3de  str     r2, [sp]
0009b3e0  ldr     r2, [r1, #8]
0009b3e2  mov     sl, r0
0009b3e4  mov     fp, r1
0009b3e6  add.w   r6, r1, #4
0009b3ea  cmp     r2, #0
0009b3ec  beq     #0x9b47a
0009b3ee  ldr     r3, [sp]
0009b3f0  mov     r6, r2
0009b3f2  ldr.w   r8, [r3]
0009b3f6  ldr     r5, [r8, #-0xc]
0009b3fa  mov     r0, r8
0009b3fc  str     r5, [sp, #8]
0009b3fe  ldr     r3, [r6, #0x10]
0009b400  ldr     r4, [r3, #-0xc]
0009b404  cmp     r5, r4
0009b406  ite     hi
0009b408  addhi   r2, sp, #0xc
0009b40a  addls   r2, sp, #8
0009b40c  str     r4, [sp, #0xc]
0009b40e  ldr     r1, [r6, #0x10]
0009b410  ldr     r2, [r2]
0009b412  blx     #0xddb90 ; -> memcmp
0009b416  cmp     r0, #0
0009b418  beq     #0x9b46e
0009b41a  lsrs    r0, r0, #0x1f
0009b41c  cbz     r0, #0x9b426
0009b41e  ldr     r3, [r6, #8]
0009b420  cbz     r3, #0x9b42c
0009b422  mov     r6, r3
0009b424  b       #0x9b3f6
0009b426  ldr     r3, [r6, #0xc]
0009b428  cmp     r3, #0
0009b42a  bne     #0x9b422
0009b42c  cmp     r0, #0
0009b42e  bne     #0x9b47a
0009b430  str     r6, [sp, #4]
0009b432  ldr     r3, [r6, #0x10]
0009b434  mov     r1, r8
0009b436  ldr     r5, [r3, #-0xc]
0009b43a  str     r5, [sp, #0xc]
0009b43c  ldr     r4, [r8, #-0xc]
0009b440  cmp     r5, r4
0009b442  ite     hi
0009b444  addhi   r2, sp, #8
0009b446  addls   r2, sp, #0xc
0009b448  str     r4, [sp, #8]
0009b44a  ldr     r0, [r6, #0x10]
0009b44c  ldr     r2, [r2]
0009b44e  blx     #0xddb90 ; -> memcmp
0009b452  cmp     r0, #0
0009b454  beq     #0x9b49a
0009b456  blt     #0x9b4a0
0009b458  movs    r3, #0
0009b45a  str.w   r6, [sl]
0009b45e  strb.w  r3, [sl, #4]
0009b462  mov     r0, sl
0009b464  sub.w   sp, r7, #0x18
0009b468  pop.w   {r8, sl, fp}
0009b46c  pop     {r4, r5, r6, r7, pc}
0009b46e  cmp     r5, r4
0009b470  bhi     #0x9b426
0009b472  ite     hs
0009b474  movhs   r0, #0
0009b476  movlo   r0, #1
0009b478  b       #0x9b41c
0009b47a  ldr.w   r3, [fp, #0xc]
0009b47e  cmp     r3, r6
0009b480  bne     #0x9b4a8
0009b482  movs    r1, #0
0009b484  mov     r0, fp
0009b486  mov     r2, r6
0009b488  ldr     r3, [sp]
0009b48a  bl      #0x9b2a0 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_
0009b48e  movs    r3, #1
0009b490  strb.w  r3, [sl, #4]
0009b494  str.w   r0, [sl]
0009b498  b       #0x9b462
0009b49a  cmp     r5, r4
0009b49c  bhi     #0x9b458
0009b49e  bhs     #0x9b458
0009b4a0  ldr     r2, [sp, #4]
0009b4a2  movs    r1, #0
0009b4a4  mov     r0, fp
0009b4a6  b       #0x9b488
0009b4a8  mov     r0, r6
0009b4aa  blx     #0xdd560 ; -> ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base
0009b4ae  ldr     r3, [sp]
0009b4b0  str     r6, [sp, #4]
0009b4b2  ldr.w   r8, [r3]
0009b4b6  mov     r6, r0
0009b4b8  b       #0x9b432
0009b4ba  nop     
