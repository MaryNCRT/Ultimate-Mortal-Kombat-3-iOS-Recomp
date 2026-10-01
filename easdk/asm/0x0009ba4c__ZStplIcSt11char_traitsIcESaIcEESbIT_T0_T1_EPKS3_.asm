========================================================================
ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EPKS3_RKS6_  0x0009ba4c  252 bytes   Mayhem.mm
========================================================================

0009ba4c  push    {r4, r5, r6, r7, lr}
0009ba4e  add     r7, sp, #0xc
0009ba50  push.w  {r8, sl, fp}
0009ba54  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009ba58  sub     sp, #0x54
0009ba5a  ldr     r3, [pc, #0xdc]
0009ba5c  str     r0, [sp, #0xc]
0009ba5e  add     r0, sp, #0x1c
0009ba60  add     r3, pc ; -> 0x000f3438  0x0
0009ba62  str     r1, [sp, #8]
0009ba64  ldr     r3, [r3]
0009ba66  str     r2, [sp, #4]
0009ba68  str     r7, [sp, #0x3c]
0009ba6a  str.w   sp, [sp, #0x44]
0009ba6e  str     r3, [sp, #0x34]
0009ba70  ldr     r3, [pc, #0xc8]
0009ba72  add     r3, pc ; -> 0x000ee250  GCC_except_table16
0009ba74  str     r3, [sp, #0x38]
0009ba76  ldr     r3, [pc, #0xc8]
0009ba78  add     r3, pc ; -> 0x0009bade  
0009ba7a  orr     r3, r3, #1
0009ba7e  str     r3, [sp, #0x40]
0009ba80  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009ba84  ldr     r0, [sp, #8]
0009ba86  blx     #0xdde0c ; -> strlen
0009ba8a  ldr     r3, [pc, #0xb8]
0009ba8c  ldr     r2, [sp, #0xc]
0009ba8e  add     r3, pc ; -> 0x000f3370  0x0
0009ba90  ldr     r3, [r3]
0009ba92  str     r2, [sp, #0x18]
0009ba94  str     r3, [sp, #0x14]
0009ba96  adds    r3, #0xc
0009ba98  str     r0, [sp]
0009ba9a  str     r3, [r2]
0009ba9c  ldr     r4, [sp, #4]
0009ba9e  ldr     r2, [sp]
0009baa0  ldr     r0, [sp, #0xc]
0009baa2  ldr     r3, [r4]
0009baa4  ldr     r1, [r3, #-0xc]
0009baa8  movs    r3, #1
0009baaa  str     r3, [sp, #0x20]
0009baac  adds    r1, r1, r2
0009baae  blx     #0xdd524 ; -> ZNSs7reserveEm
0009bab2  ldr     r0, [sp, #0xc]
0009bab4  ldr     r1, [sp, #8]
0009bab6  ldr     r2, [sp]
0009bab8  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
0009babc  ldr     r0, [sp, #0xc]
0009babe  ldr     r1, [sp, #4]
0009bac0  blx     #0xdd500 ; -> ZNSs6appendERKSs
0009bac4  add     r0, sp, #0x1c
0009bac6  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009baca  ldr     r0, [sp, #0xc]
0009bacc  sub.w   sp, r7, #0x58
0009bad0  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009bad4  sub.w   sp, r7, #0x18
0009bad8  pop.w   {r8, sl, fp}
0009badc  pop     {r4, r5, r6, r7, pc}
0009bade  ldr     r3, [sp, #0x24]
0009bae0  ldr     r4, [sp, #0x18]
0009bae2  ldr     r2, [sp, #0x14]
0009bae4  str     r3, [sp, #0x10]
0009bae6  ldr     r3, [r4]
0009bae8  sub.w   r0, r3, #0xc
0009baec  cmp     r2, r0
0009baee  bne     #0x9bafc
0009baf0  ldr     r0, [sp, #0x10]
0009baf2  mov.w   r3, #-1
0009baf6  str     r3, [sp, #0x20]
0009baf8  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009bafc  subs    r2, r3, #4
0009bafe  ldr     r3, [r3, #-0x4]
0009bb02  subs    r1, r3, #1
0009bb04  dmb     ish
0009bb08  mov     ip, r3
0009bb0a  ldrex   r4, [r2]
0009bb0e  cmp     r4, r3
0009bb10  beq     #0x9bb26
0009bb12  cmp     r4, ip
0009bb14  mov     r3, r4
0009bb16  bne     #0x9bb02
0009bb18  cmp     r4, #0
0009bb1a  bgt     #0x9baf0
0009bb1c  add.w   r1, sp, #0x53
0009bb20  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009bb24  b       #0x9baf0
0009bb26  strex   lr, r1, [r2]
0009bb2a  cmp.w   lr, #0
0009bb2e  bne     #0x9bb0a
0009bb30  dmb     ish
0009bb34  b       #0x9bb12
0009bb36  nop     
0009bb38  ldrb    r4, [r2, #7]
0009bb3a  movs    r5, r0
0009bb3c  movs    r7, #0xda
0009bb3e  movs    r5, r0
0009bb40  lsls    r2, r4, #1
0009bb42  movs    r0, r0
0009bb44  ldrb    r6, [r3, #3]
0009bb46  movs    r5, r0
