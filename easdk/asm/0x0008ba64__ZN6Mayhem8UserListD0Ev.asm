========================================================================
ZN6Mayhem8UserListD0Ev  0x0008ba64  196 bytes   Mayhem.mm
========================================================================

0008ba64  push    {r4, r5, r6, r7, lr}
0008ba66  add     r7, sp, #0xc
0008ba68  push.w  {r8, sl, fp}
0008ba6c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008ba70  sub     sp, #0x48
0008ba72  ldr     r3, [pc, #0xa0]
0008ba74  str     r0, [sp]
0008ba76  add     r0, sp, #0x14
0008ba78  add     r3, pc ; -> 0x000f3438  0x0
0008ba7a  str     r7, [sp, #0x34]
0008ba7c  ldr     r3, [r3]
0008ba7e  str.w   sp, [sp, #0x3c]
0008ba82  str     r3, [sp, #0x2c]
0008ba84  ldr     r3, [pc, #0x90]
0008ba86  add     r3, pc ; -> 0x000ee222  GCC_except_table11
0008ba88  str     r3, [sp, #0x30]
0008ba8a  ldr     r3, [pc, #0x90]
0008ba8c  add     r3, pc ; -> 0x0008baf8  
0008ba8e  orr     r3, r3, #1
0008ba92  str     r3, [sp, #0x38]
0008ba94  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008ba98  ldr     r2, [sp]
0008ba9a  ldr     r3, [pc, #0x84]
0008ba9c  add     r3, pc ; -> 0x0017db20  ZTVN6Mayhem8UserListE
0008ba9e  adds    r3, #8
0008baa0  str     r3, [r2], #4
0008baa4  ldr     r3, [sp]
0008baa6  str     r2, [sp, #4]
0008baa8  ldr     r2, [sp]
0008baaa  ldr     r3, [r3, #4]
0008baac  str     r3, [sp, #0x10]
0008baae  ldr     r2, [r2, #8]
0008bab0  cmp     r3, r2
0008bab2  str     r2, [sp, #0xc]
0008bab4  beq     #0x8bad0
0008bab6  ldr     r2, [sp, #0x10]
0008bab8  ldr     r0, [sp, #0x10]
0008baba  ldr     r3, [r2]
0008babc  ldr     r2, [r3]
0008babe  movs    r3, #1
0008bac0  str     r3, [sp, #0x18]
0008bac2  blx     r2
0008bac4  ldr     r3, [sp, #0x10]
0008bac6  ldr     r2, [sp, #0xc]
0008bac8  adds    r3, #8
0008baca  cmp     r2, r3
0008bacc  str     r3, [sp, #0x10]
0008bace  bne     #0x8bab6
0008bad0  ldr     r3, [sp, #4]
0008bad2  ldr     r0, [r3]
0008bad4  cbz     r0, #0x8bada
0008bad6  blx     #0xdd5a8 ; -> ZdlPv
0008bada  ldr     r0, [sp]
0008badc  blx     #0xdd5a8 ; -> ZdlPv
0008bae0  add     r0, sp, #0x14
0008bae2  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008bae6  sub.w   sp, r7, #0x58
0008baea  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008baee  sub.w   sp, r7, #0x18
0008baf2  pop.w   {r8, sl, fp}
0008baf6  pop     {r4, r5, r6, r7, pc}
0008baf8  ldr     r2, [sp, #0x1c]
0008bafa  ldr     r3, [sp, #4]
0008bafc  str     r2, [sp, #8]
0008bafe  ldr     r0, [r3]
0008bb00  cbz     r0, #0x8bb06
0008bb02  blx     #0xdd5a8 ; -> ZdlPv
0008bb06  ldr     r0, [sp, #8]
0008bb08  mov.w   r3, #-1
0008bb0c  str     r3, [sp, #0x18]
0008bb0e  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008bb12  nop     
0008bb14  ldrb    r4, [r7, #6]
0008bb16  movs    r6, r0
0008bb18  movs    r7, #0x98
0008bb1a  movs    r6, r0
0008bb1c  lsls    r0, r5, #1
0008bb1e  movs    r0, r0
0008bb20  movs    r0, #0x80
0008bb22  movs    r7, r1
0008bb24  nop     
0008bb26  nop     
