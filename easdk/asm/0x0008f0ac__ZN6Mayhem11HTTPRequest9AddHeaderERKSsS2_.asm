========================================================================
ZN6Mayhem11HTTPRequest9AddHeaderERKSsS2_  0x0008f0ac  816 bytes   Mayhem.mm
========================================================================

0008f0ac  push    {r4, r5, r6, r7, lr}
0008f0ae  add     r7, sp, #0xc
0008f0b0  push.w  {r8, sl, fp}
0008f0b4  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008f0b8  sub     sp, #0x80
0008f0ba  ldr     r3, [pc, #0x30c]
0008f0bc  str     r0, [sp, #8]
0008f0be  add     r0, sp, #0x30
0008f0c0  add     r3, pc ; -> 0x000f3438  0x0
0008f0c2  str     r1, [sp, #4]
0008f0c4  ldr     r3, [r3]
0008f0c6  str     r2, [sp]
0008f0c8  str     r7, [sp, #0x50]
0008f0ca  str.w   sp, [sp, #0x58]
0008f0ce  str     r3, [sp, #0x48]
0008f0d0  ldr     r3, [pc, #0x2f8]
0008f0d2  add     r3, pc ; -> 0x000ee3a4  GCC_except_table63
0008f0d4  str     r3, [sp, #0x4c]
0008f0d6  ldr     r3, [pc, #0x2f8]
0008f0d8  add     r3, pc ; -> 0x0008f28e  
0008f0da  orr     r3, r3, #1
0008f0de  str     r3, [sp, #0x54]
0008f0e0  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008f0e4  ldr     r2, [sp, #8]
0008f0e6  ldr     r1, [sp, #4]
0008f0e8  add.w   r0, r2, #8
0008f0ec  bl      #0x9b59c ; -> ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE11lower_boundERS1_
0008f0f0  ldr     r4, [sp, #8]
0008f0f2  add.w   r3, r4, #0xc
0008f0f6  cmp     r3, r0
0008f0f8  str     r0, [sp, #0x2c]
0008f0fa  beq     #0x8f13e
0008f0fc  str     r0, [sp, #0x28]
0008f0fe  add.w   r1, r0, #0x10
0008f102  ldr     r0, [sp, #4]
0008f104  ldr     r4, [sp, #0x28]
0008f106  ldr     r3, [r0]
0008f108  ldr     r3, [r3, #-0xc]
0008f10c  str     r3, [sp, #0x70]
0008f10e  ldr     r2, [r4, #0x10]
0008f110  ldr     r2, [r2, #-0xc]
0008f114  str     r3, [sp, #0x1c]
0008f116  cmp     r2, r3
0008f118  ldr     r3, [sp, #4]
0008f11a  str     r2, [sp, #0x18]
0008f11c  str     r2, [sp, #0x6c]
0008f11e  ite     lo
0008f120  addlo   r2, sp, #0x6c
0008f122  addhs   r2, sp, #0x70
0008f124  ldr     r0, [r3]
0008f126  ldr     r2, [r2]
0008f128  ldr     r1, [r1]
0008f12a  blx     #0xddb90 ; -> memcmp
0008f12e  cbnz    r0, #0x8f13a
0008f130  ldr     r4, [sp, #0x18]
0008f132  ldr     r2, [sp, #0x1c]
0008f134  cmp     r4, r2
0008f136  bhs     #0x8f1ca
0008f138  adds    r0, #1
0008f13a  cmp     r0, #0
0008f13c  bge     #0x8f1a0
0008f13e  ldr     r3, [pc, #0x294]
0008f140  add     r0, sp, #0x64
0008f142  ldr     r1, [sp, #4]
0008f144  add     r3, pc ; -> 0x000f3370  0x0
0008f146  ldr     r3, [r3]
0008f148  str     r3, [sp, #0xc]
0008f14a  adds    r3, #0xc
0008f14c  str     r3, [sp, #0x74]
0008f14e  movs    r3, #3
0008f150  str     r3, [sp, #0x34]
0008f152  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008f156  movs    r3, #1
0008f158  add     r0, sp, #0x68
0008f15a  str     r3, [sp, #0x34]
0008f15c  add     r1, sp, #0x74
0008f15e  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008f162  ldr     r2, [sp, #8]
0008f164  movs    r3, #2
0008f166  ldr     r1, [sp, #0x2c]
0008f168  add.w   r0, r2, #8
0008f16c  str     r3, [sp, #0x34]
0008f16e  add     r2, sp, #0x64
0008f170  bl      #0x9bdcc ; -> ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE16_M_insert_uniqueESt17_Rb_tree_iteratorIS2_ERKS2_
0008f174  ldr     r3, [sp, #0x68]
0008f176  ldr     r4, [sp, #0xc]
0008f178  str     r0, [sp, #0x24]
0008f17a  sub.w   r0, r3, #0xc
0008f17e  cmp     r4, r0
0008f180  bne     #0x8f1d6
0008f182  ldr     r3, [sp, #0x64]
0008f184  ldr     r2, [sp, #0xc]
0008f186  sub.w   r0, r3, #0xc
0008f18a  cmp     r2, r0
0008f18c  bne     #0x8f236
0008f18e  ldr     r3, [sp, #0x74]
0008f190  ldr     r2, [sp, #0xc]
0008f192  sub.w   r0, r3, #0xc
0008f196  cmp     r2, r0
0008f198  itt     eq
0008f19a  ldreq   r3, [sp, #0x24]
0008f19c  streq   r3, [sp, #0x28]
0008f19e  bne     #0x8f202
0008f1a0  ldr     r3, [sp, #0x28]
0008f1a2  ldr     r1, [sp]
0008f1a4  add.w   r0, r3, #0x14
0008f1a8  mov.w   r3, #-1
0008f1ac  str     r3, [sp, #0x34]
0008f1ae  blx     #0xdd518 ; -> ZNSs6assignERKSs
0008f1b2  add     r0, sp, #0x30
0008f1b4  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008f1b8  sub.w   sp, r7, #0x58
0008f1bc  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008f1c0  sub.w   sp, r7, #0x18
0008f1c4  pop.w   {r8, sl, fp}
0008f1c8  pop     {r4, r5, r6, r7, pc}
0008f1ca  it      hi
0008f1cc  movhi.w r0, #-1
0008f1d0  cmp     r0, #0
0008f1d2  blt     #0x8f13e
0008f1d4  b       #0x8f1a0
0008f1d6  subs    r2, r3, #4
0008f1d8  ldr     r3, [r3, #-0x4]
0008f1dc  subs    r1, r3, #1
0008f1de  dmb     ish
0008f1e2  mov     ip, r3
0008f1e4  ldrex   lr, [r2]
0008f1e8  cmp     lr, r3
0008f1ea  beq     #0x8f280
0008f1ec  cmp     lr, ip
0008f1ee  mov     r3, lr
0008f1f0  bne     #0x8f1dc
0008f1f2  cmp.w   lr, #0
0008f1f6  bgt     #0x8f182
0008f1f8  add.w   r1, sp, #0x7e
0008f1fc  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008f200  b       #0x8f182
0008f202  subs    r2, r3, #4
0008f204  ldr     r3, [r3, #-0x4]
0008f208  subs    r1, r3, #1
0008f20a  dmb     ish
0008f20e  mov     ip, r3
0008f210  ldrex   r4, [r2]
0008f214  cmp     r4, r3
0008f216  beq     #0x8f270
0008f218  cmp     r4, ip
0008f21a  mov     r3, r4
0008f21c  bne     #0x8f208
0008f21e  cmp     r4, #0
0008f220  itt     gt
0008f222  ldrgt   r0, [sp, #0x24]
0008f224  strgt   r0, [sp, #0x28]
0008f226  bgt     #0x8f1a0
0008f228  add.w   r1, sp, #0x79
0008f22c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008f230  ldr     r2, [sp, #0x24]
0008f232  str     r2, [sp, #0x28]
0008f234  b       #0x8f1a0
0008f236  subs    r2, r3, #4
0008f238  ldr     r3, [r3, #-0x4]
0008f23c  subs    r1, r3, #1
0008f23e  dmb     ish
0008f242  mov     ip, r3
0008f244  ldrex   r4, [r2]
0008f248  cmp     r4, r3
0008f24a  beq     #0x8f260
0008f24c  cmp     r4, ip
0008f24e  mov     r3, r4
0008f250  bne     #0x8f23c
0008f252  cmp     r4, #0
0008f254  bgt     #0x8f18e
0008f256  add.w   r1, sp, #0x7d
0008f25a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008f25e  b       #0x8f18e
0008f260  strex   lr, r1, [r2]
0008f264  cmp.w   lr, #0
0008f268  bne     #0x8f244
0008f26a  dmb     ish
0008f26e  b       #0x8f24c
0008f270  strex   lr, r1, [r2]
0008f274  cmp.w   lr, #0
0008f278  bne     #0x8f210
0008f27a  dmb     ish
0008f27e  b       #0x8f218
0008f280  strex   r4, r1, [r2]
0008f284  cmp     r4, #0
0008f286  bne     #0x8f1e4
0008f288  dmb     ish
0008f28c  b       #0x8f1ec
0008f28e  ldr     r3, [sp, #0x34]
0008f290  ldr     r0, [sp, #0x38]
0008f292  cmp     r3, #1
0008f294  beq     #0x8f2c4
0008f296  cmp     r3, #2
0008f298  beq     #0x8f2aa
0008f29a  ldr     r3, [sp, #0x64]
0008f29c  ldr     r4, [sp, #0xc]
0008f29e  str     r0, [sp, #0x20]
0008f2a0  sub.w   r0, r3, #0xc
0008f2a4  cmp     r4, r0
0008f2a6  bne     #0x8f2e2
0008f2a8  ldr     r0, [sp, #0x20]
0008f2aa  ldr     r3, [sp, #0x74]
0008f2ac  ldr     r2, [sp, #0xc]
0008f2ae  str     r0, [sp, #0x10]
0008f2b0  sub.w   r0, r3, #0xc
0008f2b4  cmp     r2, r0
0008f2b6  bne     #0x8f30e
0008f2b8  ldr     r0, [sp, #0x10]
0008f2ba  mov.w   r3, #-1
0008f2be  str     r3, [sp, #0x34]
0008f2c0  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008f2c4  ldr     r3, [sp, #0x68]
0008f2c6  ldr     r4, [sp, #0xc]
0008f2c8  str     r0, [sp, #0x14]
0008f2ca  sub.w   r0, r3, #0xc
0008f2ce  cmp     r4, r0
0008f2d0  bne     #0x8f370
0008f2d2  ldr     r3, [sp, #0x64]
0008f2d4  ldr     r2, [sp, #0xc]
0008f2d6  sub.w   r0, r3, #0xc
0008f2da  cmp     r2, r0
0008f2dc  bne     #0x8f346
0008f2de  ldr     r0, [sp, #0x14]
0008f2e0  b       #0x8f2aa
0008f2e2  subs    r2, r3, #4
0008f2e4  ldr     r3, [r3, #-0x4]
0008f2e8  subs    r1, r3, #1
0008f2ea  dmb     ish
0008f2ee  mov     ip, r3
0008f2f0  ldrex   lr, [r2]
0008f2f4  cmp     lr, r3
0008f2f6  beq     #0x8f338
0008f2f8  cmp     lr, ip
0008f2fa  mov     r3, lr
0008f2fc  bne     #0x8f2e8
0008f2fe  cmp.w   lr, #0
0008f302  bgt     #0x8f2a8
0008f304  add.w   r1, sp, #0x7f
0008f308  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008f30c  b       #0x8f2a8
0008f30e  subs    r2, r3, #4
0008f310  ldr     r3, [r3, #-0x4]
0008f314  subs    r1, r3, #1
0008f316  dmb     ish
0008f31a  mov     ip, r3
0008f31c  ldrex   r4, [r2]
0008f320  cmp     r4, r3
0008f322  beq     #0x8f3aa
0008f324  cmp     r4, ip
0008f326  mov     r3, r4
0008f328  bne     #0x8f314
0008f32a  cmp     r4, #0
0008f32c  bgt     #0x8f2b8
0008f32e  add.w   r1, sp, #0x7a
0008f332  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008f336  b       #0x8f2b8
0008f338  strex   r4, r1, [r2]
0008f33c  cmp     r4, #0
0008f33e  bne     #0x8f2f0
0008f340  dmb     ish
0008f344  b       #0x8f2f8
0008f346  subs    r2, r3, #4
0008f348  ldr     r3, [r3, #-0x4]
0008f34c  subs    r1, r3, #1
0008f34e  dmb     ish
0008f352  mov     ip, r3
0008f354  ldrex   r4, [r2]
0008f358  cmp     r4, r3
0008f35a  beq     #0x8f39a
0008f35c  cmp     r4, ip
0008f35e  mov     r3, r4
0008f360  bne     #0x8f34c
0008f362  cmp     r4, #0
0008f364  bgt     #0x8f2de
0008f366  add.w   r1, sp, #0x7b
0008f36a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008f36e  b       #0x8f2de
0008f370  subs    r2, r3, #4
0008f372  ldr     r3, [r3, #-0x4]
0008f376  subs    r1, r3, #1
0008f378  dmb     ish
0008f37c  mov     ip, r3
0008f37e  ldrex   lr, [r2]
0008f382  cmp     lr, r3
0008f384  beq     #0x8f3ba
0008f386  cmp     lr, ip
0008f388  mov     r3, lr
0008f38a  bne     #0x8f376
0008f38c  cmp.w   lr, #0
0008f390  bgt     #0x8f2d2
0008f392  add     r1, sp, #0x7c
0008f394  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008f398  b       #0x8f2d2
0008f39a  strex   lr, r1, [r2]
0008f39e  cmp.w   lr, #0
0008f3a2  bne     #0x8f354
0008f3a4  dmb     ish
0008f3a8  b       #0x8f35c
0008f3aa  strex   lr, r1, [r2]
0008f3ae  cmp.w   lr, #0
0008f3b2  bne     #0x8f31c
0008f3b4  dmb     ish
0008f3b8  b       #0x8f324
0008f3ba  strex   r4, r1, [r2]
0008f3be  cmp     r4, #0
0008f3c0  bne     #0x8f37e
0008f3c2  dmb     ish
0008f3c6  b       #0x8f386
0008f3c8  muls    r4, r6, r4
0008f3ca  movs    r6, r0
0008f3cc  movt    r0, #0xe005
0008f3d0  lsls    r2, r6, #6
0008f3d2  movs    r0, r0
0008f3d4  tst     r0, r5
0008f3d6  movs    r6, r0
0008f3d8  nop     
0008f3da  nop     
