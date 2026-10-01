========================================================================
ZNK4midp11StringClass11newInstanceEv  0x0009e0bc  132 bytes   JString.cpp
========================================================================

0009e0bc  push    {r4, r5, r6, r7, lr}
0009e0be  add     r7, sp, #0xc
0009e0c0  push.w  {r8, sl, fp}
0009e0c4  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009e0c8  sub     sp, #0x3c
0009e0ca  ldr     r3, [pc, #0x68]
0009e0cc  add     r0, sp, #8
0009e0ce  str     r7, [sp, #0x28]
0009e0d0  add     r3, pc ; -> 0x000f301c  0x0
0009e0d2  str.w   sp, [sp, #0x30]
0009e0d6  ldr     r3, [r3]
0009e0d8  str     r3, [sp, #0x20]
0009e0da  ldr     r3, [pc, #0x5c]
0009e0dc  add     r3, pc ; -> 0x000ee606  GCC_except_table0
0009e0de  str     r3, [sp, #0x24]
0009e0e0  ldr     r3, [pc, #0x58]
0009e0e2  add     r3, pc ; -> 0x0009e11e  
0009e0e4  orr     r3, r3, #1
0009e0e8  str     r3, [sp, #0x2c]
0009e0ea  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009e0ee  movs    r0, #0x14
0009e0f0  mov.w   r3, #-1
0009e0f4  str     r3, [sp, #0xc]
0009e0f6  blx     #0xdd5c0 ; -> Znwm
0009e0fa  movs    r3, #1
0009e0fc  str     r3, [sp, #0xc]
0009e0fe  str     r0, [sp, #4]
0009e100  bl      #0x9d9e4 ; -> ZN4midp6StringC1Ev
0009e104  add     r0, sp, #8
0009e106  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009e10a  ldr     r0, [sp, #4]
0009e10c  sub.w   sp, r7, #0x58
0009e110  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009e114  sub.w   sp, r7, #0x18
0009e118  pop.w   {r8, sl, fp}
0009e11c  pop     {r4, r5, r6, r7, pc}
0009e11e  ldr     r3, [sp, #0x10]
0009e120  ldr     r0, [sp, #4]
0009e122  str     r3, [sp]
0009e124  blx     #0xdd5a8 ; -> ZdlPv
0009e128  ldr     r0, [sp]
0009e12a  mov.w   r3, #-1
0009e12e  str     r3, [sp, #0xc]
0009e130  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009e134  ldr     r7, [pc, #0x120]
0009e136  movs    r5, r0
0009e138  lsls    r6, r4, #0x14
0009e13a  movs    r5, r0
0009e13c  movs    r0, r7
0009e13e  movs    r0, r0
