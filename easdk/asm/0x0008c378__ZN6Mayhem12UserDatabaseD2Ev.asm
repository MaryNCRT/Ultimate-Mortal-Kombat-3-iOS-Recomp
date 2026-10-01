========================================================================
ZN6Mayhem12UserDatabaseD2Ev  0x0008c378  728 bytes   Mayhem.mm
========================================================================

0008c378  push    {r4, r5, r6, r7, lr}
0008c37a  add     r7, sp, #0xc
0008c37c  push.w  {r8, sl, fp}
0008c380  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008c384  sub     sp, #0x54
0008c386  ldr     r3, [pc, #0x2b8]
0008c388  str     r0, [sp]
0008c38a  add     r0, sp, #0x18
0008c38c  add     r3, pc ; -> 0x000f3438  0x0
0008c38e  str     r7, [sp, #0x38]
0008c390  ldr     r3, [r3]
0008c392  str.w   sp, [sp, #0x40]
0008c396  str     r3, [sp, #0x30]
0008c398  ldr     r3, [pc, #0x2a8]
0008c39a  add     r3, pc ; -> 0x000ee272  GCC_except_table21
0008c39c  str     r3, [sp, #0x34]
0008c39e  ldr     r3, [pc, #0x2a8]
0008c3a0  add     r3, pc ; -> 0x0008c616  
0008c3a2  orr     r3, r3, #1
0008c3a6  str     r3, [sp, #0x3c]
0008c3a8  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008c3ac  ldr     r2, [sp]
0008c3ae  adds    r4, r2, #4
0008c3b0  ldr     r3, [r2, #0xc]
0008c3b2  str     r4, [sp, #0x10]
0008c3b4  cmp     r4, r3
0008c3b6  beq     #0x8c44a
0008c3b8  str     r3, [sp, #0x14]
0008c3ba  b       #0x8c3be
0008c3bc  mov     r3, r0
0008c3be  ldr     r3, [r3, #0x14]
0008c3c0  str     r3, [sp, #8]
0008c3c2  cmp     r3, #0
0008c3c4  beq     #0x8c438
0008c3c6  ldr     r2, [r3, #0x18]
0008c3c8  ldr     r3, [pc, #0x280]
0008c3ca  sub.w   r0, r2, #0xc
0008c3ce  add     r3, pc ; -> 0x000f3370  0x0
0008c3d0  ldr     r3, [r3]
0008c3d2  cmp     r0, r3
0008c3d4  str     r3, [sp, #0xc]
0008c3d6  bne     #0x8c470
0008c3d8  ldr     r2, [sp, #8]
0008c3da  ldr     r4, [sp, #0xc]
0008c3dc  ldr     r3, [r2, #0x14]
0008c3de  sub.w   r0, r3, #0xc
0008c3e2  cmp     r4, r0
0008c3e4  bne     #0x8c49e
0008c3e6  ldr     r2, [sp, #8]
0008c3e8  ldr     r4, [sp, #0xc]
0008c3ea  ldr     r3, [r2, #0x10]
0008c3ec  sub.w   r0, r3, #0xc
0008c3f0  cmp     r4, r0
0008c3f2  bne     #0x8c4cc
0008c3f4  ldr     r2, [sp, #8]
0008c3f6  ldr     r4, [sp, #0xc]
0008c3f8  ldr     r3, [r2, #0xc]
0008c3fa  sub.w   r0, r3, #0xc
0008c3fe  cmp     r4, r0
0008c400  bne     #0x8c4f8
0008c402  ldr     r2, [sp, #8]
0008c404  ldr     r4, [sp, #0xc]
0008c406  ldr     r3, [r2, #8]
0008c408  sub.w   r0, r3, #0xc
0008c40c  cmp     r4, r0
0008c40e  bne.w   #0x8c524
0008c412  ldr     r2, [sp, #8]
0008c414  ldr     r4, [sp, #0xc]
0008c416  ldr     r3, [r2, #4]
0008c418  sub.w   r0, r3, #0xc
0008c41c  cmp     r4, r0
0008c41e  bne.w   #0x8c552
0008c422  ldr     r2, [sp, #8]
0008c424  ldr     r4, [sp, #0xc]
0008c426  ldr     r3, [r2]
0008c428  sub.w   r0, r3, #0xc
0008c42c  cmp     r4, r0
0008c42e  bne.w   #0x8c580
0008c432  ldr     r0, [sp, #8]
0008c434  blx     #0xdd5a8 ; -> ZdlPv
0008c438  movs    r3, #3
0008c43a  ldr     r0, [sp, #0x14]
0008c43c  str     r3, [sp, #0x1c]
0008c43e  blx     #0xdd56c ; -> ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base
0008c442  ldr     r2, [sp, #0x10]
0008c444  str     r0, [sp, #0x14]
0008c446  cmp     r2, r0
0008c448  bne     #0x8c3bc
0008c44a  ldr     r4, [sp]
0008c44c  movs    r3, #1
0008c44e  ldr     r1, [r4, #8]
0008c450  mov     r0, r4
0008c452  str     r3, [sp, #0x1c]
0008c454  bl      #0x9c0e4 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E
0008c458  add     r0, sp, #0x18
0008c45a  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008c45e  sub.w   sp, r7, #0x58
0008c462  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008c466  sub.w   sp, r7, #0x18
0008c46a  pop.w   {r8, sl, fp}
0008c46e  pop     {r4, r5, r6, r7, pc}
0008c470  ldr     r3, [r2, #-0x4]
0008c474  subs    r1, r2, #4
0008c476  subs    r2, r3, #1
0008c478  dmb     ish
0008c47c  mov     ip, r3
0008c47e  ldrex   lr, [r1]
0008c482  cmp     lr, r3
0008c484  beq.w   #0x8c5cc
0008c488  cmp     lr, ip
0008c48a  mov     r3, lr
0008c48c  bne     #0x8c476
0008c48e  cmp.w   lr, #0
0008c492  bgt     #0x8c3d8
0008c494  add.w   r1, sp, #0x53
0008c498  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008c49c  b       #0x8c3d8
0008c49e  subs    r2, r3, #4
0008c4a0  ldr     r3, [r3, #-0x4]
0008c4a4  subs    r1, r3, #1
0008c4a6  dmb     ish
0008c4aa  mov     ip, r3
0008c4ac  ldrex   lr, [r2]
0008c4b0  cmp     lr, r3
0008c4b2  beq.w   #0x8c5bc
0008c4b6  cmp     lr, ip
0008c4b8  mov     r3, lr
0008c4ba  bne     #0x8c4a4
0008c4bc  cmp.w   lr, #0
0008c4c0  bgt     #0x8c3e6
0008c4c2  add.w   r1, sp, #0x52
0008c4c6  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008c4ca  b       #0x8c3e6
0008c4cc  subs    r2, r3, #4
0008c4ce  ldr     r3, [r3, #-0x4]
0008c4d2  subs    r1, r3, #1
0008c4d4  dmb     ish
0008c4d8  mov     ip, r3
0008c4da  ldrex   lr, [r2]
0008c4de  cmp     lr, r3
0008c4e0  beq     #0x8c5ae
0008c4e2  cmp     lr, ip
0008c4e4  mov     r3, lr
0008c4e6  bne     #0x8c4d2
0008c4e8  cmp.w   lr, #0
0008c4ec  bgt     #0x8c3f4
0008c4ee  add.w   r1, sp, #0x51
0008c4f2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008c4f6  b       #0x8c3f4
0008c4f8  subs    r2, r3, #4
0008c4fa  ldr     r3, [r3, #-0x4]
0008c4fe  subs    r1, r3, #1
0008c500  dmb     ish
0008c504  mov     ip, r3
0008c506  ldrex   lr, [r2]
0008c50a  cmp     lr, r3
0008c50c  beq     #0x8c606
0008c50e  cmp     lr, ip
0008c510  mov     r3, lr
0008c512  bne     #0x8c4fe
0008c514  cmp.w   lr, #0
0008c518  bgt.w   #0x8c402
0008c51c  add     r1, sp, #0x50
0008c51e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008c522  b       #0x8c402
0008c524  subs    r2, r3, #4
0008c526  ldr     r3, [r3, #-0x4]
0008c52a  subs    r1, r3, #1
0008c52c  dmb     ish
0008c530  mov     ip, r3
0008c532  ldrex   lr, [r2]
0008c536  cmp     lr, r3
0008c538  beq     #0x8c5f8
0008c53a  cmp     lr, ip
0008c53c  mov     r3, lr
0008c53e  bne     #0x8c52a
0008c540  cmp.w   lr, #0
0008c544  bgt.w   #0x8c412
0008c548  add.w   r1, sp, #0x4f
0008c54c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008c550  b       #0x8c412
0008c552  subs    r2, r3, #4
0008c554  ldr     r3, [r3, #-0x4]
0008c558  subs    r1, r3, #1
0008c55a  dmb     ish
0008c55e  mov     ip, r3
0008c560  ldrex   lr, [r2]
0008c564  cmp     lr, r3
0008c566  beq     #0x8c5ea
0008c568  cmp     lr, ip
0008c56a  mov     r3, lr
0008c56c  bne     #0x8c558
0008c56e  cmp.w   lr, #0
0008c572  bgt.w   #0x8c422
0008c576  add.w   r1, sp, #0x4e
0008c57a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008c57e  b       #0x8c422
0008c580  subs    r2, r3, #4
0008c582  ldr     r3, [r3, #-0x4]
0008c586  subs    r1, r3, #1
0008c588  dmb     ish
0008c58c  mov     ip, r3
0008c58e  ldrex   lr, [r2]
0008c592  cmp     lr, r3
0008c594  beq     #0x8c5dc
0008c596  cmp     lr, ip
0008c598  mov     r3, lr
0008c59a  bne     #0x8c586
0008c59c  cmp.w   lr, #0
0008c5a0  bgt.w   #0x8c432
0008c5a4  add.w   r1, sp, #0x4d
0008c5a8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008c5ac  b       #0x8c432
0008c5ae  strex   r4, r1, [r2]
0008c5b2  cmp     r4, #0
0008c5b4  bne     #0x8c4da
0008c5b6  dmb     ish
0008c5ba  b       #0x8c4e2
0008c5bc  strex   r4, r1, [r2]
0008c5c0  cmp     r4, #0
0008c5c2  bne.w   #0x8c4ac
0008c5c6  dmb     ish
0008c5ca  b       #0x8c4b6
0008c5cc  strex   r4, r2, [r1]
0008c5d0  cmp     r4, #0
0008c5d2  bne.w   #0x8c47e
0008c5d6  dmb     ish
0008c5da  b       #0x8c488
0008c5dc  strex   r4, r1, [r2]
0008c5e0  cmp     r4, #0
0008c5e2  bne     #0x8c58e
0008c5e4  dmb     ish
0008c5e8  b       #0x8c596
0008c5ea  strex   r4, r1, [r2]
0008c5ee  cmp     r4, #0
0008c5f0  bne     #0x8c560
0008c5f2  dmb     ish
0008c5f6  b       #0x8c568
0008c5f8  strex   r4, r1, [r2]
0008c5fc  cmp     r4, #0
0008c5fe  bne     #0x8c532
0008c600  dmb     ish
0008c604  b       #0x8c53a
0008c606  strex   r4, r1, [r2]
0008c60a  cmp     r4, #0
0008c60c  bne.w   #0x8c506
0008c610  dmb     ish
0008c614  b       #0x8c50e
0008c616  ldr     r3, [sp, #0x1c]
0008c618  ldr     r0, [sp, #0x20]
0008c61a  cmp     r3, #1
0008c61c  beq     #0x8c622
0008c61e  cmp     r3, #2
0008c620  beq     #0x8c62c
0008c622  mov.w   r3, #-1
0008c626  str     r3, [sp, #0x1c]
0008c628  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008c62c  ldr     r3, [sp]
0008c62e  str     r0, [sp, #4]
0008c630  ldr     r0, [sp]
0008c632  ldr     r1, [r3, #8]
0008c634  movs    r3, #2
0008c636  str     r3, [sp, #0x1c]
0008c638  bl      #0x9c0e4 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E
0008c63c  ldr     r0, [sp, #4]
0008c63e  b       #0x8c622
0008c640  strb    r0, [r5, #2]
0008c642  movs    r6, r0
0008c644  subs    r4, r2, #3
0008c646  movs    r6, r0
0008c648  lsls    r2, r6, #9
0008c64a  movs    r0, r0
0008c64c  ldr     r6, [r3, #0x78]
0008c64e  movs    r6, r0
