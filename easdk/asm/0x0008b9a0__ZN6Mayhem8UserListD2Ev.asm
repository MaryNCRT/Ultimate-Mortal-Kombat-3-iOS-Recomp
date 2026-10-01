========================================================================
ZN6Mayhem8UserListD2Ev  0x0008b9a0  184 bytes   Mayhem.mm
========================================================================

0008b9a0  push    {r4, r5, r6, r7, lr}
0008b9a2  add     r7, sp, #0xc
0008b9a4  push.w  {r8, sl, fp}
0008b9a8  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008b9ac  sub     sp, #0x48
0008b9ae  ldr     r3, [pc, #0x98]
0008b9b0  str     r0, [sp]
0008b9b2  add     r0, sp, #0x14
0008b9b4  add     r3, pc ; -> 0x000f3438  0x0
0008b9b6  str     r7, [sp, #0x34]
0008b9b8  ldr     r3, [r3]
0008b9ba  str.w   sp, [sp, #0x3c]
0008b9be  str     r3, [sp, #0x2c]
0008b9c0  ldr     r3, [pc, #0x88]
0008b9c2  add     r3, pc ; -> 0x000ee21c  GCC_except_table10
0008b9c4  str     r3, [sp, #0x30]
0008b9c6  ldr     r3, [pc, #0x88]
0008b9c8  add     r3, pc ; -> 0x0008ba2e  
0008b9ca  orr     r3, r3, #1
0008b9ce  str     r3, [sp, #0x38]
0008b9d0  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008b9d4  ldr     r2, [sp]
0008b9d6  ldr     r3, [pc, #0x7c]
0008b9d8  add     r3, pc ; -> 0x0017db20  ZTVN6Mayhem8UserListE
0008b9da  adds    r3, #8
0008b9dc  str     r3, [r2], #4
0008b9e0  ldr     r3, [sp]
0008b9e2  str     r2, [sp, #4]
0008b9e4  ldr     r2, [sp]
0008b9e6  ldr     r3, [r3, #4]
0008b9e8  str     r3, [sp, #0x10]
0008b9ea  ldr     r2, [r2, #8]
0008b9ec  cmp     r3, r2
0008b9ee  str     r2, [sp, #0xc]
0008b9f0  beq     #0x8ba0c
0008b9f2  ldr     r2, [sp, #0x10]
0008b9f4  ldr     r0, [sp, #0x10]
0008b9f6  ldr     r3, [r2]
0008b9f8  ldr     r2, [r3]
0008b9fa  movs    r3, #1
0008b9fc  str     r3, [sp, #0x18]
0008b9fe  blx     r2
0008ba00  ldr     r3, [sp, #0x10]
0008ba02  ldr     r2, [sp, #0xc]
0008ba04  adds    r3, #8
0008ba06  cmp     r2, r3
0008ba08  str     r3, [sp, #0x10]
0008ba0a  bne     #0x8b9f2
0008ba0c  ldr     r3, [sp, #4]
0008ba0e  ldr     r0, [r3]
0008ba10  cbz     r0, #0x8ba16
0008ba12  blx     #0xdd5a8 ; -> ZdlPv
0008ba16  add     r0, sp, #0x14
0008ba18  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008ba1c  sub.w   sp, r7, #0x58
0008ba20  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008ba24  sub.w   sp, r7, #0x18
0008ba28  pop.w   {r8, sl, fp}
0008ba2c  pop     {r4, r5, r6, r7, pc}
0008ba2e  ldr     r2, [sp, #0x1c]
0008ba30  ldr     r3, [sp, #4]
0008ba32  str     r2, [sp, #8]
0008ba34  ldr     r0, [r3]
0008ba36  cbz     r0, #0x8ba3c
0008ba38  blx     #0xdd5a8 ; -> ZdlPv
0008ba3c  ldr     r0, [sp, #8]
0008ba3e  mov.w   r3, #-1
0008ba42  str     r3, [sp, #0x18]
0008ba44  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008ba48  ldrb    r0, [r0, #0xa]
0008ba4a  movs    r6, r0
0008ba4c  cmp     r0, #0x56
0008ba4e  movs    r6, r0
0008ba50  lsls    r2, r4, #1
0008ba52  movs    r0, r0
0008ba54  movs    r1, #0x44
0008ba56  movs    r7, r1
