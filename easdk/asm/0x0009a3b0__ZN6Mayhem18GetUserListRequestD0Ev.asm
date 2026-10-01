========================================================================
ZN6Mayhem18GetUserListRequestD0Ev  0x0009a3b0  492 bytes   Mayhem.mm
========================================================================

0009a3b0  push    {r4, r5, r6, r7, lr}
0009a3b2  add     r7, sp, #0xc
0009a3b4  push.w  {r8, sl, fp}
0009a3b8  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009a3bc  sub     sp, #0x68
0009a3be  ldr     r3, [pc, #0x1bc]
0009a3c0  str     r0, [sp, #4]
0009a3c2  add     r0, sp, #0x30
0009a3c4  add     r3, pc ; -> 0x000f3438  0x0
0009a3c6  str     r7, [sp, #0x50]
0009a3c8  ldr     r3, [r3]
0009a3ca  str.w   sp, [sp, #0x58]
0009a3ce  str     r3, [sp, #0x48]
0009a3d0  ldr     r3, [pc, #0x1ac]
0009a3d2  add     r3, pc ; -> 0x000ee5e6  GCC_except_table119
0009a3d4  str     r3, [sp, #0x4c]
0009a3d6  ldr     r3, [pc, #0x1ac]
0009a3d8  add     r3, pc ; -> 0x0009a4be  
0009a3da  orr     r3, r3, #1
0009a3de  str     r3, [sp, #0x54]
0009a3e0  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009a3e4  ldr     r2, [sp, #4]
0009a3e6  ldr     r3, [pc, #0x1a0]
0009a3e8  add.w   r0, r2, #0x10
0009a3ec  add     r3, pc ; -> 0x0017daf0  ZTVN6Mayhem18GetUserListRequestE
0009a3ee  adds    r3, #8
0009a3f0  str     r3, [r2]
0009a3f2  ldr     r3, [pc, #0x198]
0009a3f4  add     r3, pc ; -> 0x0017daf0  ZTVN6Mayhem18GetUserListRequestE
0009a3f6  adds    r3, #0x1c
0009a3f8  str     r3, [r2, #0x10]
0009a3fa  movs    r3, #1
0009a3fc  str     r3, [sp, #0x34]
0009a3fe  bl      #0x8b6a8 ; -> ZN6Mayhem12MayhemThread4waitEv
0009a402  ldr     r3, [sp, #4]
0009a404  ldr     r2, [sp, #4]
0009a406  adds    r2, #0x6c
0009a408  str     r2, [sp, #0x18]
0009a40a  ldr     r2, [r3, #0x6c]
0009a40c  ldr     r4, [r3, #0x70]
0009a40e  cmp     r2, r4
0009a410  str     r4, [sp, #0x1c]
0009a412  beq     #0x9a438
0009a414  ldr     r3, [pc, #0x178]
0009a416  str     r2, [sp, #0x28]
0009a418  add     r3, pc ; -> 0x000f3370  0x0
0009a41a  ldr     r3, [r3]
0009a41c  str     r3, [sp, #0x20]
0009a41e  ldr     r2, [sp, #0x28]
0009a420  ldr     r4, [sp, #0x20]
0009a422  ldr     r3, [r2]
0009a424  sub.w   r0, r3, #0xc
0009a428  cmp     r0, r4
0009a42a  bne     #0x9a484
0009a42c  ldr     r2, [sp, #0x28]
0009a42e  ldr     r3, [sp, #0x1c]
0009a430  adds    r2, #4
0009a432  cmp     r3, r2
0009a434  str     r2, [sp, #0x28]
0009a436  bne     #0x9a41e
0009a438  ldr     r4, [sp, #0x18]
0009a43a  ldr     r0, [r4]
0009a43c  cbz     r0, #0x9a442
0009a43e  blx     #0xdd5a8 ; -> ZdlPv
0009a442  ldr     r2, [sp, #4]
0009a444  ldr     r0, [r2, #0x60]
0009a446  cbz     r0, #0x9a44c
0009a448  blx     #0xdd5a8 ; -> ZdlPv
0009a44c  ldr     r2, [sp, #4]
0009a44e  movs    r3, #2
0009a450  str     r3, [sp, #0x34]
0009a452  add.w   r0, r2, #0x10
0009a456  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0009a45a  ldr     r0, [sp, #4]
0009a45c  mov.w   r3, #-1
0009a460  str     r3, [sp, #0x34]
0009a462  bl      #0x8b9a0 ; -> ZN6Mayhem8UserListD2Ev
0009a466  ldr     r0, [sp, #4]
0009a468  blx     #0xdd5a8 ; -> ZdlPv
0009a46c  add     r0, sp, #0x30
0009a46e  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009a472  sub.w   sp, r7, #0x58
0009a476  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009a47a  sub.w   sp, r7, #0x18
0009a47e  pop.w   {r8, sl, fp}
0009a482  pop     {r4, r5, r6, r7, pc}
0009a484  subs    r2, r3, #4
0009a486  ldr     r3, [r3, #-0x4]
0009a48a  subs    r1, r3, #1
0009a48c  dmb     ish
0009a490  mov     ip, r3
0009a492  ldrex   lr, [r2]
0009a496  cmp     lr, r3
0009a498  beq     #0x9a4b0
0009a49a  cmp     lr, ip
0009a49c  mov     r3, lr
0009a49e  bne     #0x9a48a
0009a4a0  cmp.w   lr, #0
0009a4a4  bgt     #0x9a42c
0009a4a6  add.w   r1, sp, #0x66
0009a4aa  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009a4ae  b       #0x9a42c
0009a4b0  strex   r4, r1, [r2]
0009a4b4  cmp     r4, #0
0009a4b6  bne     #0x9a492
0009a4b8  dmb     ish
0009a4bc  b       #0x9a49a
0009a4be  ldr     r3, [sp, #0x38]
0009a4c0  str     r3, [sp]
0009a4c2  ldr     r3, [sp, #0x34]
0009a4c4  cmp     r3, #1
0009a4c6  beq     #0x9a52c
0009a4c8  ldr     r4, [sp]
0009a4ca  ldr     r3, [sp, #4]
0009a4cc  ldr     r2, [sp, #4]
0009a4ce  str     r4, [sp, #8]
0009a4d0  adds    r2, #0x6c
0009a4d2  str     r2, [sp, #0x10]
0009a4d4  ldr     r2, [r3, #0x6c]
0009a4d6  ldr     r4, [r3, #0x70]
0009a4d8  cmp     r2, r4
0009a4da  str     r4, [sp, #0x14]
0009a4dc  beq     #0x9a502
0009a4de  ldr     r3, [pc, #0xb4]
0009a4e0  str     r2, [sp, #0x24]
0009a4e2  add     r3, pc ; -> 0x000f3370  0x0
0009a4e4  ldr     r3, [r3]
0009a4e6  str     r3, [sp, #0x2c]
0009a4e8  ldr     r2, [sp, #0x24]
0009a4ea  ldr     r4, [sp, #0x2c]
0009a4ec  ldr     r3, [r2]
0009a4ee  sub.w   r0, r3, #0xc
0009a4f2  cmp     r0, r4
0009a4f4  bne     #0x9a542
0009a4f6  ldr     r2, [sp, #0x24]
0009a4f8  ldr     r3, [sp, #0x14]
0009a4fa  adds    r2, #4
0009a4fc  cmp     r3, r2
0009a4fe  str     r2, [sp, #0x24]
0009a500  bne     #0x9a4e8
0009a502  ldr     r4, [sp, #0x10]
0009a504  ldr     r0, [r4]
0009a506  cbz     r0, #0x9a50c
0009a508  blx     #0xdd5a8 ; -> ZdlPv
0009a50c  ldr     r3, [sp, #8]
0009a50e  ldr     r4, [sp, #4]
0009a510  str     r3, [sp, #0xc]
0009a512  ldr     r0, [r4, #0x60]
0009a514  cbz     r0, #0x9a51a
0009a516  blx     #0xdd5a8 ; -> ZdlPv
0009a51a  ldr     r3, [sp, #0xc]
0009a51c  ldr     r4, [sp, #4]
0009a51e  add.w   r0, r4, #0x10
0009a522  str     r3, [sp]
0009a524  movs    r3, #0
0009a526  str     r3, [sp, #0x34]
0009a528  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0009a52c  ldr     r0, [sp, #4]
0009a52e  movs    r3, #0
0009a530  str     r3, [sp, #0x34]
0009a532  bl      #0x8b9a0 ; -> ZN6Mayhem8UserListD2Ev
0009a536  ldr     r0, [sp]
0009a538  mov.w   r3, #-1
0009a53c  str     r3, [sp, #0x34]
0009a53e  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009a542  subs    r2, r3, #4
0009a544  ldr     r3, [r3, #-0x4]
0009a548  subs    r1, r3, #1
0009a54a  dmb     ish
0009a54e  mov     ip, r3
0009a550  ldrex   lr, [r2]
0009a554  cmp     lr, r3
0009a556  beq     #0x9a56e
0009a558  cmp     lr, ip
0009a55a  mov     r3, lr
0009a55c  bne     #0x9a548
0009a55e  cmp.w   lr, #0
0009a562  bgt     #0x9a4f6
0009a564  add.w   r1, sp, #0x67
0009a568  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009a56c  b       #0x9a4f6
0009a56e  strex   r4, r1, [r2]
0009a572  cmp     r4, #0
0009a574  bne     #0x9a550
0009a576  dmb     ish
0009a57a  b       #0x9a558
0009a57c  str     r0, [sp, #0x1c0]
0009a57e  movs    r5, r0
0009a580  tst     r0, r2
0009a582  movs    r5, r0
0009a584  lsls    r2, r4, #3
0009a586  movs    r0, r0
0009a588  adds    r7, #0
0009a58a  movs    r6, r1
0009a58c  adds    r6, #0xf8
0009a58e  movs    r6, r1
0009a590  ldrh    r4, [r2, #0x3a]
0009a592  movs    r5, r0
0009a594  ldrh    r2, [r1, #0x34]
0009a596  movs    r5, r0
0009a598  nop     
0009a59a  nop     
