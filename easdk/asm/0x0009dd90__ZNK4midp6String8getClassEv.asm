========================================================================
ZNK4midp6String8getClassEv  0x0009dd90  148 bytes   JString.cpp
========================================================================

0009dd90  push    {r4, r5, r6, r7, lr}
0009dd92  add     r7, sp, #0xc
0009dd94  push.w  {r8, sl, fp}
0009dd98  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009dd9c  sub     sp, #0x3c
0009dd9e  ldr     r3, [pc, #0x74]
0009dda0  add     r0, sp, #8
0009dda2  str     r7, [sp, #0x28]
0009dda4  add     r3, pc ; -> 0x000f301c  0x0
0009dda6  str.w   sp, [sp, #0x30]
0009ddaa  ldr     r3, [r3]
0009ddac  str     r3, [sp, #0x20]
0009ddae  ldr     r3, [pc, #0x68]
0009ddb0  add     r3, pc ; -> 0x000ee62a  GCC_except_table10
0009ddb2  str     r3, [sp, #0x24]
0009ddb4  ldr     r3, [pc, #0x64]
0009ddb6  add     r3, pc ; -> 0x0009ddfc  
0009ddb8  orr     r3, r3, #1
0009ddbc  str     r3, [sp, #0x2c]
0009ddbe  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009ddc2  movs    r0, #8
0009ddc4  mov.w   r3, #-1
0009ddc8  str     r3, [sp, #0xc]
0009ddca  blx     #0xdd5c0 ; -> Znwm
0009ddce  movs    r3, #1
0009ddd0  str     r3, [sp, #0xc]
0009ddd2  str     r0, [sp, #4]
0009ddd4  bl      #0x9e2b4 ; -> ZN4midp5ClassC2Ev
0009ddd8  ldr     r2, [sp, #4]
0009ddda  ldr     r3, [pc, #0x44]
0009dddc  add     r0, sp, #8
0009ddde  add     r3, pc ; -> 0x0017de2c  ZTVN4midp11StringClassE
0009dde0  adds    r3, #8
0009dde2  str     r3, [r2]
0009dde4  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009dde8  ldr     r0, [sp, #4]
0009ddea  sub.w   sp, r7, #0x58
0009ddee  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009ddf2  sub.w   sp, r7, #0x18
0009ddf6  pop.w   {r8, sl, fp}
0009ddfa  pop     {r4, r5, r6, r7, pc}
0009ddfc  ldr     r2, [sp, #0x10]
0009ddfe  ldr     r0, [sp, #4]
0009de00  str     r2, [sp]
0009de02  blx     #0xdd5a8 ; -> ZdlPv
0009de06  ldr     r0, [sp]
0009de08  mov.w   r3, #-1
0009de0c  str     r3, [sp, #0xc]
0009de0e  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009de12  nop     
0009de14  strh    r4, [r6, r1]
0009de16  movs    r5, r0
0009de18  lsrs    r6, r6, #1
0009de1a  movs    r5, r0
0009de1c  lsls    r2, r0, #1
0009de1e  movs    r0, r0
0009de20  lsls    r2, r1, #1
0009de22  movs    r6, r1
