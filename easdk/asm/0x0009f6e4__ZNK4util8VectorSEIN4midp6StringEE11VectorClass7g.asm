========================================================================
ZNK4util8VectorSEIN4midp6StringEE11VectorClass7getNameEv  0x0009f6e4  140 bytes   LocaleManager.mm
========================================================================

0009f6e4  push    {r4, r5, r6, r7, lr}
0009f6e6  add     r7, sp, #0xc
0009f6e8  push.w  {r8, sl, fp}
0009f6ec  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009f6f0  sub     sp, #0x3c
0009f6f2  ldr     r3, [pc, #0x6c]
0009f6f4  add     r0, sp, #8
0009f6f6  str     r7, [sp, #0x28]
0009f6f8  add     r3, pc ; -> 0x000f301c  0x0
0009f6fa  str.w   sp, [sp, #0x30]
0009f6fe  ldr     r3, [r3]
0009f700  str     r3, [sp, #0x20]
0009f702  ldr     r3, [pc, #0x60]
0009f704  add     r3, pc ; -> 0x000ee642  GCC_except_table2
0009f706  str     r3, [sp, #0x24]
0009f708  ldr     r3, [pc, #0x5c]
0009f70a  add     r3, pc ; -> 0x0009f74a  
0009f70c  orr     r3, r3, #1
0009f710  str     r3, [sp, #0x2c]
0009f712  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009f716  movs    r0, #0x14
0009f718  mov.w   r3, #-1
0009f71c  str     r3, [sp, #0xc]
0009f71e  blx     #0xdd5c0 ; -> Znwm
0009f722  ldr     r1, [pc, #0x48]
0009f724  movs    r3, #1
0009f726  str     r3, [sp, #0xc]
0009f728  add     r1, pc ; -> 0x00176598  'java.util.Vector'
0009f72a  str     r0, [sp, #4]
0009f72c  bl      #0x9dd84 ; -> ZN4midp6StringC1EPKc
0009f730  add     r0, sp, #8
0009f732  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009f736  ldr     r0, [sp, #4]
0009f738  sub.w   sp, r7, #0x58
0009f73c  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009f740  sub.w   sp, r7, #0x18
0009f744  pop.w   {r8, sl, fp}
0009f748  pop     {r4, r5, r6, r7, pc}
0009f74a  ldr     r3, [sp, #0x10]
0009f74c  ldr     r0, [sp, #4]
0009f74e  str     r3, [sp]
0009f750  blx     #0xdd5a8 ; -> ZdlPv
0009f754  ldr     r0, [sp]
0009f756  mov.w   r3, #-1
0009f75a  str     r3, [sp, #0xc]
0009f75c  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009f760  subs    r1, #0x20
0009f762  movs    r5, r0
