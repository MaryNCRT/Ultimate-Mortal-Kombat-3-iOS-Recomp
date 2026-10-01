========================================================================
ZN6Mayhem12UserDatabase11AddUserInfoERKSsPNS_8UserInfoE  0x0008c1d8  416 bytes   Mayhem.mm
========================================================================

0008c1d8  push    {r4, r5, r6, r7, lr}
0008c1da  add     r7, sp, #0xc
0008c1dc  push.w  {r8, sl, fp}
0008c1e0  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008c1e4  sub     sp, #0x6c
0008c1e6  ldr     r3, [pc, #0x178]
0008c1e8  str     r0, [sp, #8]
0008c1ea  add     r0, sp, #0x24
0008c1ec  add     r3, pc ; -> 0x000f3438  0x0
0008c1ee  str     r2, [sp]
0008c1f0  ldr     r3, [r3]
0008c1f2  str     r1, [sp, #4]
0008c1f4  str     r7, [sp, #0x44]
0008c1f6  str.w   sp, [sp, #0x4c]
0008c1fa  str     r3, [sp, #0x3c]
0008c1fc  ldr     r3, [pc, #0x164]
0008c1fe  add     r3, pc ; -> 0x000ee256  GCC_except_table17
0008c200  str     r3, [sp, #0x40]
0008c202  ldr     r3, [pc, #0x164]
0008c204  add     r3, pc ; -> 0x0008c304  
0008c206  orr     r3, r3, #1
0008c20a  str     r3, [sp, #0x48]
0008c20c  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008c210  ldr     r0, [sp, #8]
0008c212  ldr     r1, [sp, #4]
0008c214  bl      #0x9b824 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE11lower_boundERS1_
0008c218  ldr     r2, [sp, #8]
0008c21a  adds    r3, r2, #4
0008c21c  cmp     r0, r3
0008c21e  str     r0, [sp, #0x18]
0008c220  beq     #0x8c264
0008c222  ldr     r4, [sp, #4]
0008c224  str     r0, [sp, #0x1c]
0008c226  add.w   r1, r0, #0x10
0008c22a  ldr     r3, [r4]
0008c22c  ldr     r3, [r3, #-0xc]
0008c230  str     r3, [sp, #0x14]
0008c232  str     r3, [sp, #0x64]
0008c234  ldr     r3, [r0, #0x10]
0008c236  ldr     r4, [sp, #0x14]
0008c238  ldr     r3, [r3, #-0xc]
0008c23c  cmp     r4, r3
0008c23e  str     r3, [sp, #0x10]
0008c240  str     r3, [sp, #0x60]
0008c242  ldr     r3, [sp, #4]
0008c244  ite     hi
0008c246  addhi   r2, sp, #0x60
0008c248  addls   r2, sp, #0x64
0008c24a  ldr     r1, [r1]
0008c24c  ldr     r2, [r2]
0008c24e  ldr     r0, [r3]
0008c250  blx     #0xddb90 ; -> memcmp
0008c254  cbnz    r0, #0x8c260
0008c256  ldr     r4, [sp, #0x14]
0008c258  ldr     r2, [sp, #0x10]
0008c25a  cmp     r4, r2
0008c25c  bls     #0x8c2b8
0008c25e  adds    r0, #1
0008c260  cmp     r0, #0
0008c262  bge     #0x8c29a
0008c264  add     r0, sp, #0x58
0008c266  ldr     r1, [sp, #4]
0008c268  mov.w   r3, #-1
0008c26c  str     r3, [sp, #0x28]
0008c26e  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008c272  movs    r3, #0
0008c274  ldr     r0, [sp, #8]
0008c276  str     r3, [sp, #0x5c]
0008c278  ldr     r1, [sp, #0x18]
0008c27a  adds    r3, #1
0008c27c  add     r2, sp, #0x58
0008c27e  str     r3, [sp, #0x28]
0008c280  bl      #0x9b884 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE16_M_insert_uniqueESt17_Rb_tree_iteratorIS5_ERKS5_
0008c284  ldr     r3, [pc, #0xe4]
0008c286  ldr     r2, [sp, #0x58]
0008c288  str     r0, [sp, #0x20]
0008c28a  add     r3, pc ; -> 0x000f3370  0x0
0008c28c  sub.w   r0, r2, #0xc
0008c290  ldr     r3, [r3]
0008c292  cmp     r0, r3
0008c294  bne     #0x8c2c4
0008c296  ldr     r3, [sp, #0x20]
0008c298  str     r3, [sp, #0x1c]
0008c29a  ldr     r3, [sp]
0008c29c  ldr     r2, [sp, #0x1c]
0008c29e  add     r0, sp, #0x24
0008c2a0  str     r3, [r2, #0x14]
0008c2a2  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008c2a6  sub.w   sp, r7, #0x58
0008c2aa  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008c2ae  sub.w   sp, r7, #0x18
0008c2b2  pop.w   {r8, sl, fp}
0008c2b6  pop     {r4, r5, r6, r7, pc}
0008c2b8  it      lo
0008c2ba  movlo.w r0, #-1
0008c2be  cmp     r0, #0
0008c2c0  blt     #0x8c264
0008c2c2  b       #0x8c29a
0008c2c4  ldr     r3, [r2, #-0x4]
0008c2c8  subs    r1, r2, #4
0008c2ca  subs    r2, r3, #1
0008c2cc  dmb     ish
0008c2d0  mov     ip, r3
0008c2d2  ldrex   r4, [r1]
0008c2d6  cmp     r4, r3
0008c2d8  beq     #0x8c2f4
0008c2da  cmp     r4, ip
0008c2dc  mov     r3, r4
0008c2de  bne     #0x8c2ca
0008c2e0  cmp     r4, #0
0008c2e2  itt     gt
0008c2e4  ldrgt   r2, [sp, #0x20]
0008c2e6  strgt   r2, [sp, #0x1c]
0008c2e8  bgt     #0x8c29a
0008c2ea  add.w   r1, sp, #0x6b
0008c2ee  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008c2f2  b       #0x8c296
0008c2f4  strex   lr, r2, [r1]
0008c2f8  cmp.w   lr, #0
0008c2fc  bne     #0x8c2d2
0008c2fe  dmb     ish
0008c302  b       #0x8c2da
0008c304  ldr     r3, [pc, #0x68]
0008c306  ldr     r1, [sp, #0x58]
0008c308  ldr     r4, [sp, #0x2c]
0008c30a  add     r3, pc ; -> 0x000f3370  0x0
0008c30c  sub.w   r0, r1, #0xc
0008c310  ldr     r3, [r3]
0008c312  str     r4, [sp, #0xc]
0008c314  cmp     r0, r3
0008c316  bne     #0x8c324
0008c318  ldr     r0, [sp, #0xc]
0008c31a  mov.w   r3, #-1
0008c31e  str     r3, [sp, #0x28]
0008c320  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008c324  ldr     r3, [r1, #-0x4]
0008c328  subs    r2, r1, #4
0008c32a  subs    r1, r3, #1
0008c32c  dmb     ish
0008c330  mov     ip, r3
0008c332  ldrex   lr, [r2]
0008c336  cmp     lr, r3
0008c338  beq     #0x8c350
0008c33a  cmp     lr, ip
0008c33c  mov     r3, lr
0008c33e  bne     #0x8c32a
0008c340  cmp.w   lr, #0
0008c344  bgt     #0x8c318
0008c346  add.w   r1, sp, #0x6a
0008c34a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008c34e  b       #0x8c318
0008c350  strex   r4, r1, [r2]
0008c354  cmp     r4, #0
0008c356  bne     #0x8c332
0008c358  dmb     ish
0008c35c  b       #0x8c33a
0008c35e  nop     
0008c360  strb    r0, [r1, #9]
0008c362  movs    r6, r0
0008c364  movs    r0, #0x54
0008c366  movs    r6, r0
0008c368  lsls    r4, r7, #3
0008c36a  movs    r0, r0
0008c36c  strb    r2, [r4, #3]
0008c36e  movs    r6, r0
0008c370  strb    r2, [r4, #1]
0008c372  movs    r6, r0
0008c374  nop     
0008c376  nop     
