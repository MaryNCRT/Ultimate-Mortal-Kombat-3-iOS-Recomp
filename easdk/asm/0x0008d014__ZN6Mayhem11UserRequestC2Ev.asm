========================================================================
ZN6Mayhem11UserRequestC2Ev  0x0008d014  156 bytes   Mayhem.mm
========================================================================

0008d014  push    {r4, r5, r6, r7, lr}
0008d016  add     r7, sp, #0xc
0008d018  push.w  {r8, sl, fp}
0008d01c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008d020  sub     sp, #0x3c
0008d022  ldr     r3, [pc, #0x78]
0008d024  str     r0, [sp, #4]
0008d026  add     r0, sp, #8
0008d028  add     r3, pc ; -> 0x000f3438  0x0
0008d02a  str     r7, [sp, #0x28]
0008d02c  ldr     r3, [r3]
0008d02e  str.w   sp, [sp, #0x30]
0008d032  str     r3, [sp, #0x20]
0008d034  ldr     r3, [pc, #0x68]
0008d036  add     r3, pc ; -> 0x000ee2a4  GCC_except_table33
0008d038  str     r3, [sp, #0x24]
0008d03a  ldr     r3, [pc, #0x68]
0008d03c  add     r3, pc ; -> 0x0008d086  
0008d03e  orr     r3, r3, #1
0008d042  str     r3, [sp, #0x2c]
0008d044  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008d048  ldr     r0, [sp, #4]
0008d04a  bl      #0x8ac40 ; -> ZN6Mayhem4UserC2Ev
0008d04e  ldr     r2, [sp, #4]
0008d050  movs    r3, #1
0008d052  str     r3, [sp, #0xc]
0008d054  add.w   r0, r2, #8
0008d058  bl      #0x8cda4 ; -> ZN6Mayhem7RequestC2Ev
0008d05c  ldr     r2, [sp, #4]
0008d05e  ldr     r3, [pc, #0x48]
0008d060  add     r0, sp, #8
0008d062  add     r3, pc ; -> 0x0017dbe4  ZTVN6Mayhem11UserRequestE
0008d064  adds    r3, #8
0008d066  str     r3, [r2]
0008d068  ldr     r3, [pc, #0x40]
0008d06a  add     r3, pc ; -> 0x0017dbe4  ZTVN6Mayhem11UserRequestE
0008d06c  adds    r3, #0x28
0008d06e  str     r3, [r2, #8]
0008d070  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008d074  sub.w   sp, r7, #0x58
0008d078  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008d07c  sub.w   sp, r7, #0x18
0008d080  pop.w   {r8, sl, fp}
0008d084  pop     {r4, r5, r6, r7, pc}
0008d086  ldr     r3, [sp, #0x10]
0008d088  ldr     r0, [sp, #4]
0008d08a  str     r3, [sp]
0008d08c  bl      #0x8b3c0 ; -> ZN6Mayhem4UserD2Ev
0008d090  ldr     r0, [sp]
0008d092  mov.w   r3, #-1
0008d096  str     r3, [sp, #0xc]
0008d098  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008d09c  str     r4, [r1, #0x40]
0008d09e  movs    r6, r0
0008d0a0  asrs    r2, r5, #9
0008d0a2  movs    r6, r0
0008d0a4  lsls    r6, r0, #1
0008d0a6  movs    r0, r0
0008d0a8  lsrs    r6, r7, #0xd
0008d0aa  movs    r7, r1
0008d0ac  lsrs    r6, r6, #0xd
0008d0ae  movs    r7, r1
