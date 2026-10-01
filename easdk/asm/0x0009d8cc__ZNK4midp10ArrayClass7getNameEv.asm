========================================================================
ZNK4midp10ArrayClass7getNameEv  0x0009d8cc  140 bytes   JArray.cpp
========================================================================

0009d8cc  push    {r4, r5, r6, r7, lr}
0009d8ce  add     r7, sp, #0xc
0009d8d0  push.w  {r8, sl, fp}
0009d8d4  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009d8d8  sub     sp, #0x3c
0009d8da  ldr     r3, [pc, #0x6c]
0009d8dc  add     r0, sp, #8
0009d8de  str     r7, [sp, #0x28]
0009d8e0  add     r3, pc ; -> 0x000f301c  0x0
0009d8e2  str.w   sp, [sp, #0x30]
0009d8e6  ldr     r3, [r3]
0009d8e8  str     r3, [sp, #0x20]
0009d8ea  ldr     r3, [pc, #0x60]
0009d8ec  add     r3, pc ; -> 0x000ee600  GCC_except_table1
0009d8ee  str     r3, [sp, #0x24]
0009d8f0  ldr     r3, [pc, #0x5c]
0009d8f2  add     r3, pc ; -> 0x0009d932  
0009d8f4  orr     r3, r3, #1
0009d8f8  str     r3, [sp, #0x2c]
0009d8fa  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009d8fe  movs    r0, #0x14
0009d900  mov.w   r3, #-1
0009d904  str     r3, [sp, #0xc]
0009d906  blx     #0xdd5c0 ; -> Znwm
0009d90a  ldr     r1, [pc, #0x48]
0009d90c  movs    r3, #1
0009d90e  str     r3, [sp, #0xc]
0009d910  add     r1, pc ; -> 0x001761d8  '['
0009d912  str     r0, [sp, #4]
0009d914  bl      #0x9dd84 ; -> ZN4midp6StringC1EPKc
0009d918  add     r0, sp, #8
0009d91a  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009d91e  ldr     r0, [sp, #4]
0009d920  sub.w   sp, r7, #0x58
0009d924  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009d928  sub.w   sp, r7, #0x18
0009d92c  pop.w   {r8, sl, fp}
0009d930  pop     {r4, r5, r6, r7, pc}
0009d932  ldr     r3, [sp, #0x10]
0009d934  ldr     r0, [sp, #4]
0009d936  str     r3, [sp]
0009d938  blx     #0xdd5a8 ; -> ZdlPv
0009d93c  ldr     r0, [sp]
0009d93e  mov.w   r3, #-1
0009d942  str     r3, [sp, #0xc]
0009d944  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009d948  ldrsb   r0, [r7, r4]
0009d94a  movs    r5, r0
0009d94c  lsrs    r0, r2, #0x14
0009d94e  movs    r5, r0
0009d950  movs    r4, r7
0009d952  movs    r0, r0
0009d954  ldrh    r4, [r0, #6]
0009d956  movs    r5, r1
