========================================================================
ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE16_M_insert_uniqueESt17_Rb_tree_iteratorIS5_ERKS5_  0x0009b884  456 bytes   Mayhem.mm
========================================================================

0009b884  push    {r4, r5, r6, r7, lr}
0009b886  add     r7, sp, #0xc
0009b888  push.w  {r8, sl, fp}
0009b88c  sub     sp, #0x18
0009b88e  adds    r3, r0, #4
0009b890  cmp     r3, r1
0009b892  str     r0, [sp, #4]
0009b894  mov     fp, r1
0009b896  str     r2, [sp]
0009b898  mov     r8, r1
0009b89a  beq.w   #0x9b9b6
0009b89e  ldr     r2, [sp]
0009b8a0  ldr     r6, [r2]
0009b8a2  ldr     r5, [r6, #-0xc]
0009b8a6  mov     r0, r6
0009b8a8  str     r5, [sp, #0x10]
0009b8aa  ldr     r3, [r1, #0x10]
0009b8ac  ldr     r4, [r3, #-0xc]
0009b8b0  cmp     r4, r5
0009b8b2  str     r4, [sp, #0x14]
0009b8b4  ldr.w   sl, [r1, #0x10]
0009b8b8  ite     lo
0009b8ba  addlo   r2, sp, #0x14
0009b8bc  addhs   r2, sp, #0x10
0009b8be  mov     r1, sl
0009b8c0  ldr     r2, [r2]
0009b8c2  blx     #0xddb90 ; -> memcmp
0009b8c6  cmp     r0, #0
0009b8c8  bne     #0x9b92c
0009b8ca  cmp     r4, r5
0009b8cc  blo     #0x9b92e
0009b8ce  bls     #0x9b92e
0009b8d0  ldr     r2, [sp, #4]
0009b8d2  ldr     r3, [r2, #0xc]
0009b8d4  cmp     r3, fp
0009b8d6  it      eq
0009b8d8  moveq   r0, r2
0009b8da  beq     #0x9b966
0009b8dc  mov     r0, fp
0009b8de  blx     #0xdd560 ; -> ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base
0009b8e2  ldr     r3, [r0, #0x10]
0009b8e4  mov     r8, r0
0009b8e6  ldr     r5, [r3, #-0xc]
0009b8ea  ldr     r3, [sp]
0009b8ec  str     r5, [sp, #0x14]
0009b8ee  ldr     r6, [r3]
0009b8f0  ldr     r4, [r6, #-0xc]
0009b8f4  mov     r1, r6
0009b8f6  cmp     r4, r5
0009b8f8  ite     lo
0009b8fa  addlo   r2, sp, #0x10
0009b8fc  addhs   r2, sp, #0x14
0009b8fe  str     r4, [sp, #0x10]
0009b900  ldr     r0, [r0, #0x10]
0009b902  ldr     r2, [r2]
0009b904  blx     #0xddb90 ; -> memcmp
0009b908  cmp     r0, #0
0009b90a  bne     #0x9b95a
0009b90c  cmp     r4, r5
0009b90e  blo     #0x9b912
0009b910  bhi     #0x9b95c
0009b912  add     r0, sp, #8
0009b914  ldr     r1, [sp, #4]
0009b916  ldr     r2, [sp]
0009b918  bl      #0x9b3d4 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE16_M_insert_uniqueERKS5_
0009b91c  ldr.w   r8, [sp, #8]
0009b920  mov     r0, r8
0009b922  sub.w   sp, r7, #0x18
0009b926  pop.w   {r8, sl, fp}
0009b92a  pop     {r4, r5, r6, r7, pc}
0009b92c  blt     #0x9b8d0
0009b92e  ldr     r5, [sl, #-0xc]
0009b932  mov     r1, r6
0009b934  str     r5, [sp, #0x10]
0009b936  ldr     r4, [r6, #-0xc]
0009b93a  cmp     r4, r5
0009b93c  ite     lo
0009b93e  addlo   r2, sp, #0x14
0009b940  addhs   r2, sp, #0x10
0009b942  str     r4, [sp, #0x14]
0009b944  ldr.w   r0, [fp, #0x10]
0009b948  ldr     r2, [r2]
0009b94a  blx     #0xddb90 ; -> memcmp
0009b94e  cmp     r0, #0
0009b950  bne     #0x9b974
0009b952  cmp     r4, r5
0009b954  blo     #0x9b920
0009b956  bls     #0x9b920
0009b958  b       #0x9b976
0009b95a  bge     #0x9b912
0009b95c  ldr.w   r1, [r8, #0xc]
0009b960  cmp     r1, #0
0009b962  beq     #0x9ba1e
0009b964  ldr     r0, [sp, #4]
0009b966  mov     r1, fp
0009b968  mov     r2, fp
0009b96a  ldr     r3, [sp]
0009b96c  bl      #0x9b2a0 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_
0009b970  mov     r8, r0
0009b972  b       #0x9b920
0009b974  bge     #0x9b920
0009b976  ldr     r2, [sp, #4]
0009b978  ldr     r3, [r2, #0x10]
0009b97a  cmp     r3, fp
0009b97c  beq     #0x9ba2c
0009b97e  mov     r0, fp
0009b980  blx     #0xdd56c ; -> ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base
0009b984  ldr     r3, [sp]
0009b986  ldr     r6, [r3]
0009b988  ldr     r5, [r6, #-0xc]
0009b98c  str     r5, [sp, #0x14]
0009b98e  ldr     r3, [r0, #0x10]
0009b990  mov     r8, r0
0009b992  ldr     r4, [r3, #-0xc]
0009b996  cmp     r4, r5
0009b998  ite     lo
0009b99a  addlo   r2, sp, #0x10
0009b99c  addhs   r2, sp, #0x14
0009b99e  str     r4, [sp, #0x10]
0009b9a0  ldr     r1, [r0, #0x10]
0009b9a2  ldr     r2, [r2]
0009b9a4  mov     r0, r6
0009b9a6  blx     #0xddb90 ; -> memcmp
0009b9aa  cmp     r0, #0
0009b9ac  bne     #0x9ba00
0009b9ae  cmp     r4, r5
0009b9b0  blo     #0x9b912
0009b9b2  bls     #0x9b912
0009b9b4  b       #0x9ba02
0009b9b6  ldr     r3, [r0, #0x14]
0009b9b8  cmp     r3, #0
0009b9ba  beq     #0x9b912
0009b9bc  ldr.w   r8, [r0, #0x10]
0009b9c0  ldr.w   r3, [r8, #0x10]
0009b9c4  ldr     r5, [r3, #-0xc]
0009b9c8  str     r5, [sp, #0x14]
0009b9ca  ldr     r6, [r2]
0009b9cc  ldr     r4, [r6, #-0xc]
0009b9d0  mov     r1, r6
0009b9d2  cmp     r4, r5
0009b9d4  ite     lo
0009b9d6  addlo   r2, sp, #0x10
0009b9d8  addhs   r2, sp, #0x14
0009b9da  str     r4, [sp, #0x10]
0009b9dc  ldr.w   r0, [r8, #0x10]
0009b9e0  ldr     r2, [r2]
0009b9e2  blx     #0xddb90 ; -> memcmp
0009b9e6  cmp     r0, #0
0009b9e8  bne     #0x9ba18
0009b9ea  cmp     r4, r5
0009b9ec  blo     #0x9b912
0009b9ee  bls     #0x9b912
0009b9f0  mov     r2, r8
0009b9f2  ldr     r0, [sp, #4]
0009b9f4  movs    r1, #0
0009b9f6  ldr     r3, [sp]
0009b9f8  bl      #0x9b2a0 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_
0009b9fc  mov     r8, r0
0009b9fe  b       #0x9b920
0009ba00  bge     #0x9b912
0009ba02  ldr.w   r1, [fp, #0xc]
0009ba06  cbz     r1, #0x9ba3c
0009ba08  mov     r1, r8
0009ba0a  mov     r2, r8
0009ba0c  ldr     r0, [sp, #4]
0009ba0e  ldr     r3, [sp]
0009ba10  bl      #0x9b2a0 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_
0009ba14  mov     r8, r0
0009ba16  b       #0x9b920
0009ba18  bge.w   #0x9b912
0009ba1c  b       #0x9b9f0
0009ba1e  mov     r2, r8
0009ba20  ldr     r0, [sp, #4]
0009ba22  ldr     r3, [sp]
0009ba24  bl      #0x9b2a0 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_
0009ba28  mov     r8, r0
0009ba2a  b       #0x9b920
0009ba2c  mov     r0, r2
0009ba2e  movs    r1, #0
0009ba30  mov     r2, fp
0009ba32  ldr     r3, [sp]
0009ba34  bl      #0x9b2a0 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_
0009ba38  mov     r8, r0
0009ba3a  b       #0x9b920
0009ba3c  ldr     r0, [sp, #4]
0009ba3e  mov     r2, fp
0009ba40  ldr     r3, [sp]
0009ba42  bl      #0x9b2a0 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_
0009ba46  mov     r8, r0
0009ba48  b       #0x9b920
0009ba4a  nop     
