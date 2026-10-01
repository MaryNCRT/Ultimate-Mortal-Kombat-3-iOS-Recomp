========================================================================
ZN4midp5arrayINS0_INS0_INS_23ReferenceCountedPointerINS_6StringEEEEEEEED0Ev  0x0009f8d8  292 bytes   LocaleManager.mm
========================================================================

0009f8d8  push    {r4, r5, r6, r7, lr}
0009f8da  add     r7, sp, #0xc
0009f8dc  push.w  {r8, sl, fp}
0009f8e0  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009f8e4  sub     sp, #0x54
0009f8e6  ldr     r3, [pc, #0xf8]
0009f8e8  str     r0, [sp, #4]
0009f8ea  add     r0, sp, #0x20
0009f8ec  add     r3, pc ; -> 0x000f301c  0x0
0009f8ee  str     r7, [sp, #0x40]
0009f8f0  ldr     r3, [r3]
0009f8f2  str.w   sp, [sp, #0x48]
0009f8f6  str     r3, [sp, #0x38]
0009f8f8  ldr     r3, [pc, #0xe8]
0009f8fa  add     r3, pc ; -> 0x000ee64e  GCC_except_table7
0009f8fc  str     r3, [sp, #0x3c]
0009f8fe  ldr     r3, [pc, #0xe8]
0009f900  add     r3, pc ; -> 0x0009f9ba  
0009f902  orr     r3, r3, #1
0009f906  str     r3, [sp, #0x44]
0009f908  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009f90c  ldr     r2, [sp, #4]
0009f90e  ldr     r3, [pc, #0xdc]
0009f910  add     r3, pc ; -> 0x0017df1c  ZTVN4midp5arrayINS0_INS0_INS_23ReferenceCountedPointerINS_6StringEEEEEEEEE
0009f912  adds    r3, #8
0009f914  str     r3, [r2]
0009f916  ldr     r3, [r2, #8]
0009f918  str     r3, [sp, #8]
0009f91a  ldr     r0, [r2, #0xc]
0009f91c  cmp     r0, #0
0009f91e  beq     #0x9f9b4
0009f920  ldr     r2, [r0, #8]
0009f922  str     r2, [sp, #0x18]
0009f924  ldrb    r3, [r0, #0x14]
0009f926  cmp     r3, #0
0009f928  ite     ne
0009f92a  movne   r3, #1
0009f92c  moveq   r3, #0
0009f92e  str     r3, [sp, #0x14]
0009f930  ldr     r3, [sp, #4]
0009f932  movs    r2, #0
0009f934  str     r2, [r3, #0xc]
0009f936  str     r2, [r3, #8]
0009f938  movs    r3, #1
0009f93a  str     r3, [sp, #0x24]
0009f93c  bl      #0x9f614 ; -> ZN4midp6DECREFEPNS_16ReferenceCountedE
0009f940  cbz     r0, #0x9f97e
0009f942  ldr     r3, [sp, #0x14]
0009f944  cbz     r3, #0x9f97e
0009f946  ldr     r2, [sp, #0x18]
0009f948  cbz     r2, #0x9f97e
0009f94a  ldr     r3, [sp, #8]
0009f94c  str     r2, [sp, #0x10]
0009f94e  cmp     r3, #0
0009f950  ble     #0x9f978
0009f952  str     r2, [sp, #0x1c]
0009f954  movs    r2, #0
0009f956  str     r2, [sp, #0xc]
0009f958  ldr     r2, [sp, #0x1c]
0009f95a  ldr     r0, [sp, #0x1c]
0009f95c  ldr     r3, [r2]
0009f95e  ldr     r2, [r3]
0009f960  movs    r3, #1
0009f962  str     r3, [sp, #0x24]
0009f964  blx     r2
0009f966  ldr     r2, [sp, #0x1c]
0009f968  ldr     r3, [sp, #0xc]
0009f96a  adds    r2, #0x14
0009f96c  str     r2, [sp, #0x1c]
0009f96e  ldr     r2, [sp, #8]
0009f970  adds    r3, #1
0009f972  str     r3, [sp, #0xc]
0009f974  cmp     r3, r2
0009f976  bne     #0x9f958
0009f978  ldr     r0, [sp, #0x10]
0009f97a  blx     #0xdd5a8 ; -> ZdlPv
0009f97e  ldr     r3, [pc, #0x70]
0009f980  ldr     r2, [sp, #4]
0009f982  add     r3, pc ; -> 0x000f343c  ZTVN4midp10array_baseE
0009f984  ldr     r3, [r3]
0009f986  adds    r3, #8
0009f988  str     r3, [r2]
0009f98a  ldr     r0, [sp, #4]
0009f98c  mov.w   r3, #-1
0009f990  str     r3, [sp, #0x24]
0009f992  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009f996  ldr     r0, [sp, #4]
0009f998  blx     #0xdd5a8 ; -> ZdlPv
0009f99c  add     r0, sp, #0x20
0009f99e  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009f9a2  sub.w   sp, r7, #0x58
0009f9a6  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009f9aa  sub.w   sp, r7, #0x18
0009f9ae  pop.w   {r8, sl, fp}
0009f9b2  pop     {r4, r5, r6, r7, pc}
0009f9b4  str     r0, [sp, #0x18]
0009f9b6  str     r0, [sp, #0x14]
0009f9b8  b       #0x9f930
0009f9ba  ldr     r3, [sp, #0x28]
0009f9bc  ldr     r2, [sp, #4]
0009f9be  str     r3, [sp]
0009f9c0  ldr     r3, [pc, #0x30]
0009f9c2  add     r3, pc ; -> 0x000f343c  ZTVN4midp10array_baseE
0009f9c4  ldr     r3, [r3]
0009f9c6  adds    r3, #8
0009f9c8  str     r3, [r2]
0009f9ca  ldr     r0, [sp, #4]
0009f9cc  movs    r3, #0
0009f9ce  str     r3, [sp, #0x24]
0009f9d0  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009f9d4  ldr     r0, [sp]
0009f9d6  mov.w   r3, #-1
0009f9da  str     r3, [sp, #0x24]
0009f9dc  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009f9e0  adds    r7, #0x2c
0009f9e2  movs    r5, r0
0009f9e4  ldcl    p0, c0, [r0, #-0x10]
0009f9e8  lsls    r6, r6, #2
0009f9ea  movs    r0, r0
0009f9ec  b       #0x9f600
0009f9ee  movs    r5, r1
0009f9f0  subs    r2, #0xb6
0009f9f2  movs    r5, r0
0009f9f4  subs    r2, #0x76
0009f9f6  movs    r5, r0
0009f9f8  nop     
0009f9fa  nop     
