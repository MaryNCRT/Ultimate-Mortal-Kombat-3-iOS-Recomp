========================================================================
ZN6Mayhem11HTTPRequestD2Ev  0x0008d2d0  492 bytes   Mayhem.mm
========================================================================

0008d2d0  push    {r4, r5, r6, r7, lr}
0008d2d2  add     r7, sp, #0xc
0008d2d4  push.w  {r8, sl, fp}
0008d2d8  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008d2dc  sub     sp, #0x4c
0008d2de  ldr     r3, [pc, #0x1cc]
0008d2e0  str     r0, [sp]
0008d2e2  add     r0, sp, #0x10
0008d2e4  add     r3, pc ; -> 0x000f3438  0x0
0008d2e6  str     r7, [sp, #0x30]
0008d2e8  ldr     r3, [r3]
0008d2ea  str.w   sp, [sp, #0x38]
0008d2ee  str     r3, [sp, #0x28]
0008d2f0  ldr     r3, [pc, #0x1bc]
0008d2f2  add     r3, pc ; -> 0x000ee2b4  GCC_except_table35
0008d2f4  str     r3, [sp, #0x2c]
0008d2f6  ldr     r3, [pc, #0x1bc]
0008d2f8  add     r3, pc ; -> 0x0008d40a  
0008d2fa  orr     r3, r3, #1
0008d2fe  str     r3, [sp, #0x34]
0008d300  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008d304  ldr     r3, [sp]
0008d306  ldr     r2, [r3, #0x20]
0008d308  ldr     r3, [pc, #0x1ac]
0008d30a  sub.w   r0, r2, #0xc
0008d30e  add     r3, pc ; -> 0x000f3370  0x0
0008d310  ldr     r3, [r3]
0008d312  cmp     r0, r3
0008d314  str     r3, [sp, #0xc]
0008d316  bne     #0x8d35c
0008d318  ldr     r2, [sp]
0008d31a  movs    r3, #1
0008d31c  add.w   r0, r2, #8
0008d320  ldr     r1, [r2, #0x10]
0008d322  str     r3, [sp, #0x14]
0008d324  bl      #0x9bf94 ; -> ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E
0008d328  ldr     r4, [sp]
0008d32a  ldr     r2, [sp, #0xc]
0008d32c  ldr     r3, [r4, #4]
0008d32e  sub.w   r0, r3, #0xc
0008d332  cmp     r2, r0
0008d334  bne     #0x8d3b0
0008d336  ldr     r2, [sp]
0008d338  ldr     r4, [sp, #0xc]
0008d33a  ldr     r3, [r2]
0008d33c  sub.w   r0, r3, #0xc
0008d340  cmp     r4, r0
0008d342  bne     #0x8d386
0008d344  add     r0, sp, #0x10
0008d346  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008d34a  sub.w   sp, r7, #0x58
0008d34e  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008d352  sub.w   sp, r7, #0x18
0008d356  pop.w   {r8, sl, fp}
0008d35a  pop     {r4, r5, r6, r7, pc}
0008d35c  ldr     r3, [r2, #-0x4]
0008d360  subs    r1, r2, #4
0008d362  subs    r2, r3, #1
0008d364  dmb     ish
0008d368  mov     ip, r3
0008d36a  ldrex   r4, [r1]
0008d36e  cmp     r4, r3
0008d370  beq     #0x8d3fa
0008d372  cmp     r4, ip
0008d374  mov     r3, r4
0008d376  bne     #0x8d362
0008d378  cmp     r4, #0
0008d37a  bgt     #0x8d318
0008d37c  add.w   r1, sp, #0x4b
0008d380  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d384  b       #0x8d318
0008d386  subs    r2, r3, #4
0008d388  ldr     r3, [r3, #-0x4]
0008d38c  subs    r1, r3, #1
0008d38e  dmb     ish
0008d392  mov     ip, r3
0008d394  ldrex   r4, [r2]
0008d398  cmp     r4, r3
0008d39a  beq     #0x8d3ea
0008d39c  cmp     r4, ip
0008d39e  mov     r3, r4
0008d3a0  bne     #0x8d38c
0008d3a2  cmp     r4, #0
0008d3a4  bgt     #0x8d344
0008d3a6  add.w   r1, sp, #0x47
0008d3aa  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d3ae  b       #0x8d344
0008d3b0  subs    r2, r3, #4
0008d3b2  ldr     r3, [r3, #-0x4]
0008d3b6  subs    r1, r3, #1
0008d3b8  dmb     ish
0008d3bc  mov     ip, r3
0008d3be  ldrex   r4, [r2]
0008d3c2  cmp     r4, r3
0008d3c4  beq     #0x8d3da
0008d3c6  cmp     r4, ip
0008d3c8  mov     r3, r4
0008d3ca  bne     #0x8d3b6
0008d3cc  cmp     r4, #0
0008d3ce  bgt     #0x8d336
0008d3d0  add.w   r1, sp, #0x49
0008d3d4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d3d8  b       #0x8d336
0008d3da  strex   lr, r1, [r2]
0008d3de  cmp.w   lr, #0
0008d3e2  bne     #0x8d3be
0008d3e4  dmb     ish
0008d3e8  b       #0x8d3c6
0008d3ea  strex   lr, r1, [r2]
0008d3ee  cmp.w   lr, #0
0008d3f2  bne     #0x8d394
0008d3f4  dmb     ish
0008d3f8  b       #0x8d39c
0008d3fa  strex   lr, r2, [r1]
0008d3fe  cmp.w   lr, #0
0008d402  bne     #0x8d36a
0008d404  dmb     ish
0008d408  b       #0x8d372
0008d40a  ldr     r3, [sp, #0x18]
0008d40c  ldr     r4, [sp]
0008d40e  ldr     r2, [sp, #0xc]
0008d410  str     r3, [sp, #4]
0008d412  ldr     r3, [r4, #4]
0008d414  sub.w   r0, r3, #0xc
0008d418  cmp     r2, r0
0008d41a  bne     #0x8d43a
0008d41c  ldr     r2, [sp, #4]
0008d41e  ldr     r4, [sp]
0008d420  str     r2, [sp, #8]
0008d422  ldr     r3, [r4]
0008d424  ldr     r2, [sp, #0xc]
0008d426  sub.w   r0, r3, #0xc
0008d42a  cmp     r2, r0
0008d42c  bne     #0x8d464
0008d42e  ldr     r0, [sp, #8]
0008d430  mov.w   r3, #-1
0008d434  str     r3, [sp, #0x14]
0008d436  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008d43a  subs    r2, r3, #4
0008d43c  ldr     r3, [r3, #-0x4]
0008d440  subs    r1, r3, #1
0008d442  dmb     ish
0008d446  mov     ip, r3
0008d448  ldrex   r4, [r2]
0008d44c  cmp     r4, r3
0008d44e  beq     #0x8d48c
0008d450  cmp     r4, ip
0008d452  mov     r3, r4
0008d454  bne     #0x8d440
0008d456  cmp     r4, #0
0008d458  bgt     #0x8d41c
0008d45a  add.w   r1, sp, #0x4a
0008d45e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d462  b       #0x8d41c
0008d464  subs    r2, r3, #4
0008d466  ldr     r3, [r3, #-0x4]
0008d46a  subs    r1, r3, #1
0008d46c  dmb     ish
0008d470  mov     ip, r3
0008d472  ldrex   r4, [r2]
0008d476  cmp     r4, r3
0008d478  beq     #0x8d49c
0008d47a  cmp     r4, ip
0008d47c  mov     r3, r4
0008d47e  bne     #0x8d46a
0008d480  cmp     r4, #0
0008d482  bgt     #0x8d42e
0008d484  add     r1, sp, #0x48
0008d486  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d48a  b       #0x8d42e
0008d48c  strex   lr, r1, [r2]
0008d490  cmp.w   lr, #0
0008d494  bne     #0x8d448
0008d496  dmb     ish
0008d49a  b       #0x8d450
0008d49c  strex   lr, r1, [r2]
0008d4a0  cmp.w   lr, #0
0008d4a4  bne     #0x8d472
0008d4a6  dmb     ish
0008d4aa  b       #0x8d47a
0008d4ac  str     r0, [r2, #0x14]
0008d4ae  movs    r6, r0
0008d4b0  lsrs    r6, r7, #0x1e
0008d4b2  movs    r6, r0
0008d4b4  lsls    r6, r1, #4
0008d4b6  movs    r0, r0
0008d4b8  str     r6, [r3, #4]
0008d4ba  movs    r6, r0
