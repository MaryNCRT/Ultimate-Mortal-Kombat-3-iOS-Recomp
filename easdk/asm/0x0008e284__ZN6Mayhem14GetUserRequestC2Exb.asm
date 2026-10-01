========================================================================
ZN6Mayhem14GetUserRequestC2Exb  0x0008e284  280 bytes   Mayhem.mm
========================================================================

0008e284  push    {r4, r5, r6, r7, lr}
0008e286  add     r7, sp, #0xc
0008e288  push.w  {r8, sl, fp}
0008e28c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008e290  sub     sp, #0x54
0008e292  uxtb    r3, r3
0008e294  str     r3, [sp, #4]
0008e296  ldr     r3, [pc, #0xec]
0008e298  str     r0, [sp, #0x10]
0008e29a  add     r0, sp, #0x1c
0008e29c  add     r3, pc ; -> 0x000f3438  0x0
0008e29e  str     r1, [sp, #8]
0008e2a0  str     r2, [sp, #0xc]
0008e2a2  ldr     r3, [r3]
0008e2a4  str     r7, [sp, #0x3c]
0008e2a6  str.w   sp, [sp, #0x44]
0008e2aa  str     r3, [sp, #0x34]
0008e2ac  ldr     r3, [pc, #0xd8]
0008e2ae  add     r3, pc ; -> 0x000ee2f0  GCC_except_table45
0008e2b0  str     r3, [sp, #0x38]
0008e2b2  ldr     r3, [pc, #0xd8]
0008e2b4  add     r3, pc ; -> 0x0008e31e  
0008e2b6  orr     r3, r3, #1
0008e2ba  str     r3, [sp, #0x40]
0008e2bc  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008e2c0  ldr     r0, [sp, #0x10]
0008e2c2  mov.w   r3, #-1
0008e2c6  str     r3, [sp, #0x20]
0008e2c8  bl      #0x8d014 ; -> ZN6Mayhem11UserRequestC2Ev
0008e2cc  ldr     r1, [sp, #0x10]
0008e2ce  ldr     r3, [pc, #0xc0]
0008e2d0  add     r3, pc ; -> 0x0017dba8  ZTVN6Mayhem14GetUserRequestE
0008e2d2  adds    r3, #8
0008e2d4  str     r3, [r1]
0008e2d6  ldr     r3, [pc, #0xbc]
0008e2d8  add     r3, pc ; -> 0x0017dba8  ZTVN6Mayhem14GetUserRequestE
0008e2da  adds    r3, #0x28
0008e2dc  str     r3, [r1, #8]
0008e2de  ldr     r3, [pc, #0xb8]
0008e2e0  add     r3, pc ; -> 0x000f3370  0x0
0008e2e2  ldr     r3, [r3]
0008e2e4  str     r3, [sp, #0x18]
0008e2e6  adds    r3, #0xc
0008e2e8  str     r3, [r1, #0x58]
0008e2ea  add     r2, sp, #8
0008e2ec  ldm     r2, {r2, r3}
0008e2ee  ldr     r4, [sp, #0x10]
0008e2f0  add.w   r0, r4, #8
0008e2f4  str     r2, [r4, #0x5c]
0008e2f6  str     r3, [r4, #0x60]
0008e2f8  ldr     r1, [sp, #4]
0008e2fa  movs    r3, #1
0008e2fc  strb.w  r1, [r4, #0x64]
0008e300  str     r3, [sp, #0x20]
0008e302  bl      #0x8b6b8 ; -> ZN6Mayhem12MayhemThread5startEv
0008e306  add     r0, sp, #0x1c
0008e308  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008e30c  sub.w   sp, r7, #0x58
0008e310  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008e314  sub.w   sp, r7, #0x18
0008e318  pop.w   {r8, sl, fp}
0008e31c  pop     {r4, r5, r6, r7, pc}
0008e31e  ldr     r2, [sp, #0x24]
0008e320  ldr     r4, [sp, #0x10]
0008e322  ldr     r1, [sp, #0x18]
0008e324  str     r2, [sp, #0x14]
0008e326  ldr     r3, [r4, #0x58]
0008e328  sub.w   r0, r3, #0xc
0008e32c  cmp     r1, r0
0008e32e  bne     #0x8e34a
0008e330  ldr     r1, [sp, #0x14]
0008e332  ldr     r0, [sp, #0x10]
0008e334  movs    r3, #0
0008e336  str     r3, [sp, #0x20]
0008e338  str     r1, [sp]
0008e33a  bl      #0x8c8d8 ; -> ZN6Mayhem11UserRequestD2Ev
0008e33e  ldr     r0, [sp]
0008e340  mov.w   r3, #-1
0008e344  str     r3, [sp, #0x20]
0008e346  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008e34a  subs    r2, r3, #4
0008e34c  ldr     r3, [r3, #-0x4]
0008e350  subs    r1, r3, #1
0008e352  dmb     ish
0008e356  mov     ip, r3
0008e358  ldrex   r4, [r2]
0008e35c  cmp     r4, r3
0008e35e  beq     #0x8e374
0008e360  cmp     r4, ip
0008e362  mov     r3, r4
0008e364  bne     #0x8e350
0008e366  cmp     r4, #0
0008e368  bgt     #0x8e330
0008e36a  add.w   r1, sp, #0x53
0008e36e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e372  b       #0x8e330
0008e374  strex   lr, r1, [r2]
0008e378  cmp.w   lr, #0
0008e37c  bne     #0x8e358
0008e37e  dmb     ish
0008e382  b       #0x8e360
0008e384  str     r0, [r3, r6]
0008e386  movs    r6, r0
0008e388  movs    r6, r7
0008e38a  movs    r6, r0
0008e38c  lsls    r6, r4, #1
0008e38e  movs    r0, r0
0008e390  ldr.w   r0, [r4, #0xe]
0008e394  str.w   r0, [ip, #0xe]
0008e398  str     r4, [r1, r2]
0008e39a  movs    r6, r0
