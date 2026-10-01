========================================================================
ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE16_M_insert_uniqueERKS5_  0x0009b4bc  224 bytes   Mayhem.mm
========================================================================

0009b4bc  push    {r4, r5, r6, r7, lr}
0009b4be  add     r7, sp, #0xc
0009b4c0  push.w  {r8, sl, fp}
0009b4c4  sub     sp, #0x10
0009b4c6  str     r1, [sp, #4]
0009b4c8  str     r2, [sp]
0009b4ca  ldr     r2, [r1, #8]
0009b4cc  mov     fp, r0
0009b4ce  add.w   sl, r1, #4
0009b4d2  cmp     r2, #0
0009b4d4  beq     #0x9b562
0009b4d6  mov     r6, r2
0009b4d8  ldr     r2, [sp]
0009b4da  ldr.w   r8, [r2]
0009b4de  ldr     r5, [r8, #-0xc]
0009b4e2  mov     r0, r8
0009b4e4  str     r5, [sp, #8]
0009b4e6  ldr     r3, [r6, #0x10]
0009b4e8  ldr     r4, [r3, #-0xc]
0009b4ec  cmp     r5, r4
0009b4ee  ite     hi
0009b4f0  addhi   r2, sp, #0xc
0009b4f2  addls   r2, sp, #8
0009b4f4  str     r4, [sp, #0xc]
0009b4f6  ldr     r1, [r6, #0x10]
0009b4f8  ldr     r2, [r2]
0009b4fa  blx     #0xddb90 ; -> memcmp
0009b4fe  cmp     r0, #0
0009b500  beq     #0x9b556
0009b502  lsrs    r0, r0, #0x1f
0009b504  cbz     r0, #0x9b50e
0009b506  ldr     r3, [r6, #8]
0009b508  cbz     r3, #0x9b514
0009b50a  mov     r6, r3
0009b50c  b       #0x9b4de
0009b50e  ldr     r3, [r6, #0xc]
0009b510  cmp     r3, #0
0009b512  bne     #0x9b50a
0009b514  mov     sl, r6
0009b516  cmp     r0, #0
0009b518  bne     #0x9b562
0009b51a  ldr     r3, [r6, #0x10]
0009b51c  mov     r1, r8
0009b51e  ldr     r5, [r3, #-0xc]
0009b522  str     r5, [sp, #0xc]
0009b524  ldr     r4, [r8, #-0xc]
0009b528  cmp     r5, r4
0009b52a  ite     hi
0009b52c  addhi   r2, sp, #8
0009b52e  addls   r2, sp, #0xc
0009b530  str     r4, [sp, #8]
0009b532  ldr     r0, [r6, #0x10]
0009b534  ldr     r2, [r2]
0009b536  blx     #0xddb90 ; -> memcmp
0009b53a  cmp     r0, #0
0009b53c  beq     #0x9b57e
0009b53e  blt     #0x9b584
0009b540  movs    r3, #0
0009b542  str.w   r6, [fp]
0009b546  strb.w  r3, [fp, #4]
0009b54a  mov     r0, fp
0009b54c  sub.w   sp, r7, #0x18
0009b550  pop.w   {r8, sl, fp}
0009b554  pop     {r4, r5, r6, r7, pc}
0009b556  cmp     r5, r4
0009b558  bhi     #0x9b50e
0009b55a  ite     hs
0009b55c  movhs   r0, #0
0009b55e  movlo   r0, #1
0009b560  b       #0x9b504
0009b562  ldr     r2, [sp, #4]
0009b564  ldr     r3, [r2, #0xc]
0009b566  cmp     r3, sl
0009b568  it      eq
0009b56a  moveq   r0, r2
0009b56c  beq     #0x9b586
0009b56e  mov     r0, sl
0009b570  blx     #0xdd560 ; -> ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base
0009b574  ldr     r3, [sp]
0009b576  ldr.w   r8, [r3]
0009b57a  mov     r6, r0
0009b57c  b       #0x9b51a
0009b57e  cmp     r5, r4
0009b580  bhi     #0x9b540
0009b582  bhs     #0x9b540
0009b584  ldr     r0, [sp, #4]
0009b586  ldr     r3, [sp]
0009b588  movs    r1, #0
0009b58a  mov     r2, sl
0009b58c  bl      #0x9b16c ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_
0009b590  movs    r3, #1
0009b592  strb.w  r3, [fp, #4]
0009b596  str.w   r0, [fp]
0009b59a  b       #0x9b54a
