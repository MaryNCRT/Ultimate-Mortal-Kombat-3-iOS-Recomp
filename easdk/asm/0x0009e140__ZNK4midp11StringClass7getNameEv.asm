========================================================================
ZNK4midp11StringClass7getNameEv  0x0009e140  140 bytes   JString.cpp
========================================================================

0009e140  push    {r4, r5, r6, r7, lr}
0009e142  add     r7, sp, #0xc
0009e144  push.w  {r8, sl, fp}
0009e148  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009e14c  sub     sp, #0x3c
0009e14e  ldr     r3, [pc, #0x6c]
0009e150  add     r0, sp, #8
0009e152  str     r7, [sp, #0x28]
0009e154  add     r3, pc ; -> 0x000f301c  0x0
0009e156  str.w   sp, [sp, #0x30]
0009e15a  ldr     r3, [r3]
0009e15c  str     r3, [sp, #0x20]
0009e15e  ldr     r3, [pc, #0x60]
0009e160  add     r3, pc ; -> 0x000ee624  GCC_except_table6
0009e162  str     r3, [sp, #0x24]
0009e164  ldr     r3, [pc, #0x5c]
0009e166  add     r3, pc ; -> 0x0009e1a6  
0009e168  orr     r3, r3, #1
0009e16c  str     r3, [sp, #0x2c]
0009e16e  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009e172  movs    r0, #0x14
0009e174  mov.w   r3, #-1
0009e178  str     r3, [sp, #0xc]
0009e17a  blx     #0xdd5c0 ; -> Znwm
0009e17e  ldr     r1, [pc, #0x48]
0009e180  movs    r3, #1
0009e182  str     r3, [sp, #0xc]
0009e184  add     r1, pc ; -> 0x001761dc  'java.lang.String'
0009e186  str     r0, [sp, #4]
0009e188  bl      #0x9dd84 ; -> ZN4midp6StringC1EPKc
0009e18c  add     r0, sp, #8
0009e18e  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009e192  ldr     r0, [sp, #4]
0009e194  sub.w   sp, r7, #0x58
0009e198  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009e19c  sub.w   sp, r7, #0x18
0009e1a0  pop.w   {r8, sl, fp}
0009e1a4  pop     {r4, r5, r6, r7, pc}
0009e1a6  ldr     r3, [sp, #0x10]
0009e1a8  ldr     r0, [sp, #4]
0009e1aa  str     r3, [sp]
0009e1ac  blx     #0xdd5a8 ; -> ZdlPv
0009e1b0  ldr     r0, [sp]
0009e1b2  mov.w   r3, #-1
0009e1b6  str     r3, [sp, #0xc]
0009e1b8  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009e1bc  ldr     r6, [pc, #0x310]
0009e1be  movs    r5, r0
0009e1c0  lsls    r0, r0, #0x13
0009e1c2  movs    r5, r0
0009e1c4  movs    r4, r7
0009e1c6  movs    r0, r0
0009e1c8  strh    r4, [r2, #2]
0009e1ca  movs    r5, r1
