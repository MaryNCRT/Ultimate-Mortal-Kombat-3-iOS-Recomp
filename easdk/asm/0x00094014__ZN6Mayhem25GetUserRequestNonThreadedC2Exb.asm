========================================================================
ZN6Mayhem25GetUserRequestNonThreadedC2Exb  0x00094014  188 bytes   Mayhem.mm
========================================================================

00094014  push    {r4, r5, r6, r7, lr}
00094016  add     r7, sp, #0xc
00094018  push.w  {r8, sl, fp}
0009401c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00094020  sub     sp, #0x48
00094022  uxtb    r3, r3
00094024  str     r3, [sp, #4]
00094026  ldr     r3, [pc, #0x94]
00094028  str     r0, [sp, #0x10]
0009402a  add     r0, sp, #0x14
0009402c  add     r3, pc ; -> 0x000f3438  0x0
0009402e  str     r1, [sp, #8]
00094030  str     r2, [sp, #0xc]
00094032  ldr     r3, [r3]
00094034  str     r7, [sp, #0x34]
00094036  str.w   sp, [sp, #0x3c]
0009403a  str     r3, [sp, #0x2c]
0009403c  ldr     r3, [pc, #0x80]
0009403e  add     r3, pc ; -> 0x000ee490  GCC_except_table85
00094040  str     r3, [sp, #0x30]
00094042  ldr     r3, [pc, #0x80]
00094044  add     r3, pc ; -> 0x000940a0  
00094046  orr     r3, r3, #1
0009404a  str     r3, [sp, #0x38]
0009404c  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00094050  ldr     r0, [sp, #0x10]
00094052  mov.w   r3, #-1
00094056  str     r3, [sp, #0x18]
00094058  bl      #0x8d0b0 ; -> ZN6Mayhem14GetUserRequestC2Ev
0009405c  ldr     r1, [sp, #0x10]
0009405e  ldr     r3, [pc, #0x68]
00094060  add     r3, pc ; -> 0x0017db6c  ZTVN6Mayhem25GetUserRequestNonThreadedE
00094062  adds    r3, #8
00094064  str     r3, [r1]
00094066  ldr     r3, [pc, #0x64]
00094068  add     r3, pc ; -> 0x0017db6c  ZTVN6Mayhem25GetUserRequestNonThreadedE
0009406a  adds    r3, #0x28
0009406c  str     r3, [r1, #8]
0009406e  add     r2, sp, #8
00094070  ldm     r2, {r2, r3}
00094072  ldr     r1, [sp, #0x10]
00094074  str     r2, [r1, #0x5c]
00094076  str     r3, [r1, #0x60]
00094078  ldr     r2, [sp, #4]
0009407a  movs    r3, #1
0009407c  strb.w  r2, [r1, #0x64]
00094080  ldr     r0, [sp, #0x10]
00094082  str     r3, [sp, #0x18]
00094084  bl      #0x93ffc ; -> ZN6Mayhem14GetUserRequest3runEv
00094088  add     r0, sp, #0x14
0009408a  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009408e  sub.w   sp, r7, #0x58
00094092  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00094096  sub.w   sp, r7, #0x18
0009409a  pop.w   {r8, sl, fp}
0009409e  pop     {r4, r5, r6, r7, pc}
000940a0  ldr     r3, [sp, #0x1c]
000940a2  ldr     r0, [sp, #0x10]
000940a4  str     r3, [sp]
000940a6  movs    r3, #0
000940a8  str     r3, [sp, #0x18]
000940aa  bl      #0x8e0bc ; -> ZN6Mayhem14GetUserRequestD2Ev
000940ae  ldr     r0, [sp]
000940b0  mov.w   r3, #-1
000940b4  str     r3, [sp, #0x18]
000940b6  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
000940ba  nop     
000940bc  and     r0, r8, #0x850000
000940c0  adr     r4, #0x138
000940c2  movs    r5, r0
000940c4  lsls    r0, r3, #1
000940c6  movs    r0, r0
000940c8  ldr     r3, [sp, #0x20]
000940ca  movs    r6, r1
000940cc  ldr     r3, [sp]
000940ce  movs    r6, r1
