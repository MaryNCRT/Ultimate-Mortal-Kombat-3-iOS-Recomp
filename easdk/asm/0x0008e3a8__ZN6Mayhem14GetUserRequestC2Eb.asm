========================================================================
ZN6Mayhem14GetUserRequestC2Eb  0x0008e3a8  280 bytes   Mayhem.mm
========================================================================

0008e3a8  push    {r4, r5, r6, r7, lr}
0008e3aa  add     r7, sp, #0xc
0008e3ac  push.w  {r8, sl, fp}
0008e3b0  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008e3b4  sub     sp, #0x4c
0008e3b6  ldr     r3, [pc, #0xf0]
0008e3b8  str     r0, [sp, #8]
0008e3ba  add     r0, sp, #0x14
0008e3bc  add     r3, pc ; -> 0x000f3438  0x0
0008e3be  uxtb    r1, r1
0008e3c0  ldr     r3, [r3]
0008e3c2  str     r1, [sp, #4]
0008e3c4  str     r7, [sp, #0x34]
0008e3c6  str.w   sp, [sp, #0x3c]
0008e3ca  str     r3, [sp, #0x2c]
0008e3cc  ldr     r3, [pc, #0xdc]
0008e3ce  add     r3, pc ; -> 0x000ee2f6  GCC_except_table46
0008e3d0  str     r3, [sp, #0x30]
0008e3d2  ldr     r3, [pc, #0xdc]
0008e3d4  add     r3, pc ; -> 0x0008e442  
0008e3d6  orr     r3, r3, #1
0008e3da  str     r3, [sp, #0x38]
0008e3dc  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008e3e0  ldr     r0, [sp, #8]
0008e3e2  mov.w   r3, #-1
0008e3e6  str     r3, [sp, #0x18]
0008e3e8  bl      #0x8d014 ; -> ZN6Mayhem11UserRequestC2Ev
0008e3ec  ldr     r1, [sp, #8]
0008e3ee  ldr     r3, [pc, #0xc4]
0008e3f0  mov.w   r2, #-1
0008e3f4  add     r3, pc ; -> 0x0017dba8  ZTVN6Mayhem14GetUserRequestE
0008e3f6  adds    r3, #8
0008e3f8  str     r3, [r1]
0008e3fa  ldr     r3, [pc, #0xbc]
0008e3fc  add     r3, pc ; -> 0x0017dba8  ZTVN6Mayhem14GetUserRequestE
0008e3fe  adds    r3, #0x28
0008e400  str     r3, [r1, #8]
0008e402  ldr     r3, [pc, #0xb8]
0008e404  add     r3, pc ; -> 0x000f3370  0x0
0008e406  ldr     r3, [r3]
0008e408  str     r3, [sp, #0x10]
0008e40a  adds    r3, #0xc
0008e40c  str     r3, [r1, #0x58]
0008e40e  ldr     r4, [sp, #8]
0008e410  mov.w   r3, #-1
0008e414  add.w   r0, r4, #8
0008e418  str     r2, [r4, #0x5c]
0008e41a  str     r3, [r4, #0x60]
0008e41c  ldr     r1, [sp, #4]
0008e41e  movs    r3, #1
0008e420  strb.w  r1, [r4, #0x64]
0008e424  str     r3, [sp, #0x18]
0008e426  bl      #0x8b6b8 ; -> ZN6Mayhem12MayhemThread5startEv
0008e42a  add     r0, sp, #0x14
0008e42c  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008e430  sub.w   sp, r7, #0x58
0008e434  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008e438  sub.w   sp, r7, #0x18
0008e43c  pop.w   {r8, sl, fp}
0008e440  pop     {r4, r5, r6, r7, pc}
0008e442  ldr     r2, [sp, #0x1c]
0008e444  ldr     r4, [sp, #8]
0008e446  ldr     r1, [sp, #0x10]
0008e448  str     r2, [sp, #0xc]
0008e44a  ldr     r3, [r4, #0x58]
0008e44c  sub.w   r0, r3, #0xc
0008e450  cmp     r1, r0
0008e452  bne     #0x8e46e
0008e454  ldr     r1, [sp, #0xc]
0008e456  ldr     r0, [sp, #8]
0008e458  movs    r3, #0
0008e45a  str     r3, [sp, #0x18]
0008e45c  str     r1, [sp]
0008e45e  bl      #0x8c8d8 ; -> ZN6Mayhem11UserRequestD2Ev
0008e462  ldr     r0, [sp]
0008e464  mov.w   r3, #-1
0008e468  str     r3, [sp, #0x18]
0008e46a  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008e46e  subs    r2, r3, #4
0008e470  ldr     r3, [r3, #-0x4]
0008e474  subs    r1, r3, #1
0008e476  dmb     ish
0008e47a  mov     ip, r3
0008e47c  ldrex   r4, [r2]
0008e480  cmp     r4, r3
0008e482  beq     #0x8e498
0008e484  cmp     r4, ip
0008e486  mov     r3, r4
0008e488  bne     #0x8e474
0008e48a  cmp     r4, #0
0008e48c  bgt     #0x8e454
0008e48e  add.w   r1, sp, #0x4b
0008e492  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e496  b       #0x8e454
0008e498  strex   lr, r1, [r2]
0008e49c  cmp.w   lr, #0
0008e4a0  bne     #0x8e47c
0008e4a2  dmb     ish
0008e4a6  b       #0x8e484
0008e4a8  str     r0, [r7, r1]
0008e4aa  movs    r6, r0
0008e4ac  vhadd.u32 d0, d4, d5
0008e4b0  lsls    r2, r5, #1
0008e4b2  movs    r0, r0
