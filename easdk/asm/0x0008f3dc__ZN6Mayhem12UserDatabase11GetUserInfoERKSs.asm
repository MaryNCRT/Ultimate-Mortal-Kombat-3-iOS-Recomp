========================================================================
ZN6Mayhem12UserDatabase11GetUserInfoERKSs  0x0008f3dc  412 bytes   Mayhem.mm
========================================================================

0008f3dc  push    {r4, r5, r6, r7, lr}
0008f3de  add     r7, sp, #0xc
0008f3e0  push.w  {r8, sl, fp}
0008f3e4  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008f3e8  sub     sp, #0x6c
0008f3ea  ldr     r3, [pc, #0x178]
0008f3ec  str     r0, [sp, #4]
0008f3ee  add     r0, sp, #0x24
0008f3f0  add     r3, pc ; -> 0x000f3438  0x0
0008f3f2  str     r1, [sp]
0008f3f4  ldr     r3, [r3]
0008f3f6  str     r7, [sp, #0x44]
0008f3f8  str.w   sp, [sp, #0x4c]
0008f3fc  str     r3, [sp, #0x3c]
0008f3fe  ldr     r3, [pc, #0x168]
0008f400  add     r3, pc ; -> 0x000ee3ae  GCC_except_table64
0008f402  str     r3, [sp, #0x40]
0008f404  ldr     r3, [pc, #0x164]
0008f406  add     r3, pc ; -> 0x0008f508  
0008f408  orr     r3, r3, #1
0008f40c  str     r3, [sp, #0x48]
0008f40e  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008f412  ldr     r0, [sp, #4]
0008f414  ldr     r1, [sp]
0008f416  bl      #0x9b824 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE11lower_boundERS1_
0008f41a  ldr     r2, [sp, #4]
0008f41c  adds    r3, r2, #4
0008f41e  cmp     r3, r0
0008f420  str     r0, [sp, #0x20]
0008f422  beq     #0x8f466
0008f424  ldr     r4, [sp]
0008f426  str     r0, [sp, #0x1c]
0008f428  add.w   r1, r0, #0x10
0008f42c  ldr     r3, [r4]
0008f42e  ldr     r3, [r3, #-0xc]
0008f432  str     r3, [sp, #0x14]
0008f434  str     r3, [sp, #0x64]
0008f436  ldr     r3, [r0, #0x10]
0008f438  ldr     r4, [sp, #0x14]
0008f43a  ldr     r3, [r3, #-0xc]
0008f43e  cmp     r4, r3
0008f440  str     r3, [sp, #0x10]
0008f442  str     r3, [sp, #0x60]
0008f444  ldr     r3, [sp]
0008f446  ite     hi
0008f448  addhi   r2, sp, #0x60
0008f44a  addls   r2, sp, #0x64
0008f44c  ldr     r1, [r1]
0008f44e  ldr     r2, [r2]
0008f450  ldr     r0, [r3]
0008f452  blx     #0xddb90 ; -> memcmp
0008f456  cbnz    r0, #0x8f462
0008f458  ldr     r4, [sp, #0x14]
0008f45a  ldr     r2, [sp, #0x10]
0008f45c  cmp     r4, r2
0008f45e  bls     #0x8f4bc
0008f460  adds    r0, #1
0008f462  cmp     r0, #0
0008f464  bge     #0x8f49c
0008f466  add     r0, sp, #0x58
0008f468  ldr     r1, [sp]
0008f46a  mov.w   r3, #-1
0008f46e  str     r3, [sp, #0x28]
0008f470  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008f474  movs    r3, #0
0008f476  ldr     r0, [sp, #4]
0008f478  str     r3, [sp, #0x5c]
0008f47a  ldr     r1, [sp, #0x20]
0008f47c  adds    r3, #1
0008f47e  add     r2, sp, #0x58
0008f480  str     r3, [sp, #0x28]
0008f482  bl      #0x9b884 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE16_M_insert_uniqueESt17_Rb_tree_iteratorIS5_ERKS5_
0008f486  ldr     r3, [pc, #0xe8]
0008f488  ldr     r2, [sp, #0x58]
0008f48a  str     r0, [sp, #0x18]
0008f48c  add     r3, pc ; -> 0x000f3370  0x0
0008f48e  sub.w   r0, r2, #0xc
0008f492  ldr     r3, [r3]
0008f494  cmp     r0, r3
0008f496  bne     #0x8f4c8
0008f498  ldr     r3, [sp, #0x18]
0008f49a  str     r3, [sp, #0x1c]
0008f49c  ldr     r2, [sp, #0x1c]
0008f49e  add     r0, sp, #0x24
0008f4a0  ldr     r2, [r2, #0x14]
0008f4a2  str     r2, [sp, #8]
0008f4a4  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008f4a8  ldr     r0, [sp, #8]
0008f4aa  sub.w   sp, r7, #0x58
0008f4ae  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008f4b2  sub.w   sp, r7, #0x18
0008f4b6  pop.w   {r8, sl, fp}
0008f4ba  pop     {r4, r5, r6, r7, pc}
0008f4bc  it      lo
0008f4be  movlo.w r0, #-1
0008f4c2  cmp     r0, #0
0008f4c4  blt     #0x8f466
0008f4c6  b       #0x8f49c
0008f4c8  ldr     r3, [r2, #-0x4]
0008f4cc  subs    r1, r2, #4
0008f4ce  subs    r2, r3, #1
0008f4d0  dmb     ish
0008f4d4  mov     ip, r3
0008f4d6  ldrex   r4, [r1]
0008f4da  cmp     r4, r3
0008f4dc  beq     #0x8f4f8
0008f4de  cmp     r4, ip
0008f4e0  mov     r3, r4
0008f4e2  bne     #0x8f4ce
0008f4e4  cmp     r4, #0
0008f4e6  itt     gt
0008f4e8  ldrgt   r2, [sp, #0x18]
0008f4ea  strgt   r2, [sp, #0x1c]
0008f4ec  bgt     #0x8f49c
0008f4ee  add.w   r1, sp, #0x6b
0008f4f2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008f4f6  b       #0x8f498
0008f4f8  strex   lr, r2, [r1]
0008f4fc  cmp.w   lr, #0
0008f500  bne     #0x8f4d6
0008f502  dmb     ish
0008f506  b       #0x8f4de
0008f508  ldr     r3, [pc, #0x68]
0008f50a  ldr     r1, [sp, #0x58]
0008f50c  ldr     r4, [sp, #0x2c]
0008f50e  add     r3, pc ; -> 0x000f3370  0x0
0008f510  sub.w   r0, r1, #0xc
0008f514  ldr     r3, [r3]
0008f516  str     r4, [sp, #0xc]
0008f518  cmp     r0, r3
0008f51a  bne     #0x8f528
0008f51c  ldr     r0, [sp, #0xc]
0008f51e  mov.w   r3, #-1
0008f522  str     r3, [sp, #0x28]
0008f524  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008f528  ldr     r3, [r1, #-0x4]
0008f52c  subs    r2, r1, #4
0008f52e  subs    r1, r3, #1
0008f530  dmb     ish
0008f534  mov     ip, r3
0008f536  ldrex   lr, [r2]
0008f53a  cmp     lr, r3
0008f53c  beq     #0x8f554
0008f53e  cmp     lr, ip
0008f540  mov     r3, lr
0008f542  bne     #0x8f52e
0008f544  cmp.w   lr, #0
0008f548  bgt     #0x8f51c
0008f54a  add.w   r1, sp, #0x6a
0008f54e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008f552  b       #0x8f51c
0008f554  strex   r4, r1, [r2]
0008f558  cmp     r4, #0
0008f55a  bne     #0x8f536
0008f55c  dmb     ish
0008f560  b       #0x8f53e
0008f562  nop     
0008f564  eors    r4, r0
0008f566  movs    r6, r0
0008f568  vaddl.s32 q0, d10, d5
0008f56c  lsls    r6, r7, #3
0008f56e  movs    r0, r0
0008f570  subs    r6, #0xe0
0008f572  movs    r6, r0
0008f574  subs    r6, #0x5e
0008f576  movs    r6, r0
