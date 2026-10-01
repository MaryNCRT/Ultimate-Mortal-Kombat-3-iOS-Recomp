========================================================================
ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE16_M_insert_uniqueESt17_Rb_tree_iteratorIS5_ERKS5_  0x0009b65c  456 bytes   Mayhem.mm
========================================================================

0009b65c  push    {r4, r5, r6, r7, lr}
0009b65e  add     r7, sp, #0xc
0009b660  push.w  {r8, sl, fp}
0009b664  sub     sp, #0x18
0009b666  adds    r3, r0, #4
0009b668  cmp     r3, r1
0009b66a  str     r0, [sp, #4]
0009b66c  mov     fp, r1
0009b66e  str     r2, [sp]
0009b670  mov     r8, r1
0009b672  beq.w   #0x9b78e
0009b676  ldr     r2, [sp]
0009b678  ldr     r6, [r2]
0009b67a  ldr     r5, [r6, #-0xc]
0009b67e  mov     r0, r6
0009b680  str     r5, [sp, #0x10]
0009b682  ldr     r3, [r1, #0x10]
0009b684  ldr     r4, [r3, #-0xc]
0009b688  cmp     r4, r5
0009b68a  str     r4, [sp, #0x14]
0009b68c  ldr.w   sl, [r1, #0x10]
0009b690  ite     lo
0009b692  addlo   r2, sp, #0x14
0009b694  addhs   r2, sp, #0x10
0009b696  mov     r1, sl
0009b698  ldr     r2, [r2]
0009b69a  blx     #0xddb90 ; -> memcmp
0009b69e  cmp     r0, #0
0009b6a0  bne     #0x9b704
0009b6a2  cmp     r4, r5
0009b6a4  blo     #0x9b706
0009b6a6  bls     #0x9b706
0009b6a8  ldr     r2, [sp, #4]
0009b6aa  ldr     r3, [r2, #0xc]
0009b6ac  cmp     r3, fp
0009b6ae  it      eq
0009b6b0  moveq   r0, r2
0009b6b2  beq     #0x9b73e
0009b6b4  mov     r0, fp
0009b6b6  blx     #0xdd560 ; -> ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base
0009b6ba  ldr     r3, [r0, #0x10]
0009b6bc  mov     r8, r0
0009b6be  ldr     r5, [r3, #-0xc]
0009b6c2  ldr     r3, [sp]
0009b6c4  str     r5, [sp, #0x14]
0009b6c6  ldr     r6, [r3]
0009b6c8  ldr     r4, [r6, #-0xc]
0009b6cc  mov     r1, r6
0009b6ce  cmp     r4, r5
0009b6d0  ite     lo
0009b6d2  addlo   r2, sp, #0x10
0009b6d4  addhs   r2, sp, #0x14
0009b6d6  str     r4, [sp, #0x10]
0009b6d8  ldr     r0, [r0, #0x10]
0009b6da  ldr     r2, [r2]
0009b6dc  blx     #0xddb90 ; -> memcmp
0009b6e0  cmp     r0, #0
0009b6e2  bne     #0x9b732
0009b6e4  cmp     r4, r5
0009b6e6  blo     #0x9b6ea
0009b6e8  bhi     #0x9b734
0009b6ea  add     r0, sp, #8
0009b6ec  ldr     r1, [sp, #4]
0009b6ee  ldr     r2, [sp]
0009b6f0  bl      #0x9b4bc ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE16_M_insert_uniqueERKS5_
0009b6f4  ldr.w   r8, [sp, #8]
0009b6f8  mov     r0, r8
0009b6fa  sub.w   sp, r7, #0x18
0009b6fe  pop.w   {r8, sl, fp}
0009b702  pop     {r4, r5, r6, r7, pc}
0009b704  blt     #0x9b6a8
0009b706  ldr     r5, [sl, #-0xc]
0009b70a  mov     r1, r6
0009b70c  str     r5, [sp, #0x10]
0009b70e  ldr     r4, [r6, #-0xc]
0009b712  cmp     r4, r5
0009b714  ite     lo
0009b716  addlo   r2, sp, #0x14
0009b718  addhs   r2, sp, #0x10
0009b71a  str     r4, [sp, #0x14]
0009b71c  ldr.w   r0, [fp, #0x10]
0009b720  ldr     r2, [r2]
0009b722  blx     #0xddb90 ; -> memcmp
0009b726  cmp     r0, #0
0009b728  bne     #0x9b74c
0009b72a  cmp     r4, r5
0009b72c  blo     #0x9b6f8
0009b72e  bls     #0x9b6f8
0009b730  b       #0x9b74e
0009b732  bge     #0x9b6ea
0009b734  ldr.w   r1, [r8, #0xc]
0009b738  cmp     r1, #0
0009b73a  beq     #0x9b7f6
0009b73c  ldr     r0, [sp, #4]
0009b73e  mov     r1, fp
0009b740  mov     r2, fp
0009b742  ldr     r3, [sp]
0009b744  bl      #0x9b16c ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_
0009b748  mov     r8, r0
0009b74a  b       #0x9b6f8
0009b74c  bge     #0x9b6f8
0009b74e  ldr     r2, [sp, #4]
0009b750  ldr     r3, [r2, #0x10]
0009b752  cmp     r3, fp
0009b754  beq     #0x9b804
0009b756  mov     r0, fp
0009b758  blx     #0xdd56c ; -> ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base
0009b75c  ldr     r3, [sp]
0009b75e  ldr     r6, [r3]
0009b760  ldr     r5, [r6, #-0xc]
0009b764  str     r5, [sp, #0x14]
0009b766  ldr     r3, [r0, #0x10]
0009b768  mov     r8, r0
0009b76a  ldr     r4, [r3, #-0xc]
0009b76e  cmp     r4, r5
0009b770  ite     lo
0009b772  addlo   r2, sp, #0x10
0009b774  addhs   r2, sp, #0x14
0009b776  str     r4, [sp, #0x10]
0009b778  ldr     r1, [r0, #0x10]
0009b77a  ldr     r2, [r2]
0009b77c  mov     r0, r6
0009b77e  blx     #0xddb90 ; -> memcmp
0009b782  cmp     r0, #0
0009b784  bne     #0x9b7d8
0009b786  cmp     r4, r5
0009b788  blo     #0x9b6ea
0009b78a  bls     #0x9b6ea
0009b78c  b       #0x9b7da
0009b78e  ldr     r3, [r0, #0x14]
0009b790  cmp     r3, #0
0009b792  beq     #0x9b6ea
0009b794  ldr.w   r8, [r0, #0x10]
0009b798  ldr.w   r3, [r8, #0x10]
0009b79c  ldr     r5, [r3, #-0xc]
0009b7a0  str     r5, [sp, #0x14]
0009b7a2  ldr     r6, [r2]
0009b7a4  ldr     r4, [r6, #-0xc]
0009b7a8  mov     r1, r6
0009b7aa  cmp     r4, r5
0009b7ac  ite     lo
0009b7ae  addlo   r2, sp, #0x10
0009b7b0  addhs   r2, sp, #0x14
0009b7b2  str     r4, [sp, #0x10]
0009b7b4  ldr.w   r0, [r8, #0x10]
0009b7b8  ldr     r2, [r2]
0009b7ba  blx     #0xddb90 ; -> memcmp
0009b7be  cmp     r0, #0
0009b7c0  bne     #0x9b7f0
0009b7c2  cmp     r4, r5
0009b7c4  blo     #0x9b6ea
0009b7c6  bls     #0x9b6ea
0009b7c8  mov     r2, r8
0009b7ca  ldr     r0, [sp, #4]
0009b7cc  movs    r1, #0
0009b7ce  ldr     r3, [sp]
0009b7d0  bl      #0x9b16c ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_
0009b7d4  mov     r8, r0
0009b7d6  b       #0x9b6f8
0009b7d8  bge     #0x9b6ea
0009b7da  ldr.w   r1, [fp, #0xc]
0009b7de  cbz     r1, #0x9b814
0009b7e0  mov     r1, r8
0009b7e2  mov     r2, r8
0009b7e4  ldr     r0, [sp, #4]
0009b7e6  ldr     r3, [sp]
0009b7e8  bl      #0x9b16c ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_
0009b7ec  mov     r8, r0
0009b7ee  b       #0x9b6f8
0009b7f0  bge.w   #0x9b6ea
0009b7f4  b       #0x9b7c8
0009b7f6  mov     r2, r8
0009b7f8  ldr     r0, [sp, #4]
0009b7fa  ldr     r3, [sp]
0009b7fc  bl      #0x9b16c ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_
0009b800  mov     r8, r0
0009b802  b       #0x9b6f8
0009b804  mov     r0, r2
0009b806  movs    r1, #0
0009b808  mov     r2, fp
0009b80a  ldr     r3, [sp]
0009b80c  bl      #0x9b16c ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_
0009b810  mov     r8, r0
0009b812  b       #0x9b6f8
0009b814  ldr     r0, [sp, #4]
0009b816  mov     r2, fp
0009b818  ldr     r3, [sp]
0009b81a  bl      #0x9b16c ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_
0009b81e  mov     r8, r0
0009b820  b       #0x9b6f8
0009b822  nop     
