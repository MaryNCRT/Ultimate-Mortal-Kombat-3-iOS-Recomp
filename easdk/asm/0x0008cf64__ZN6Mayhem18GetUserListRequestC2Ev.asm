========================================================================
ZN6Mayhem18GetUserListRequestC2Ev  0x0008cf64  176 bytes   Mayhem.mm
========================================================================

0008cf64  push    {r4, r5, r6, r7, lr}
0008cf66  add     r7, sp, #0xc
0008cf68  push.w  {r8, sl, fp}
0008cf6c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008cf70  sub     sp, #0x3c
0008cf72  ldr     r3, [pc, #0x8c]
0008cf74  str     r0, [sp, #4]
0008cf76  add     r0, sp, #8
0008cf78  add     r3, pc ; -> 0x000f3438  0x0
0008cf7a  str     r7, [sp, #0x28]
0008cf7c  ldr     r3, [r3]
0008cf7e  str.w   sp, [sp, #0x30]
0008cf82  str     r3, [sp, #0x20]
0008cf84  ldr     r3, [pc, #0x7c]
0008cf86  add     r3, pc ; -> 0x000ee29e  GCC_except_table32
0008cf88  str     r3, [sp, #0x24]
0008cf8a  ldr     r3, [pc, #0x7c]
0008cf8c  add     r3, pc ; -> 0x0008cfe4  
0008cf8e  orr     r3, r3, #1
0008cf92  str     r3, [sp, #0x2c]
0008cf94  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008cf98  ldr     r0, [sp, #4]
0008cf9a  bl      #0x8acac ; -> ZN6Mayhem8UserListC2Ev
0008cf9e  ldr     r2, [sp, #4]
0008cfa0  movs    r3, #1
0008cfa2  str     r3, [sp, #0xc]
0008cfa4  add.w   r0, r2, #0x10
0008cfa8  bl      #0x8cda4 ; -> ZN6Mayhem7RequestC2Ev
0008cfac  ldr     r2, [sp, #4]
0008cfae  ldr     r3, [pc, #0x5c]
0008cfb0  add     r0, sp, #8
0008cfb2  add     r3, pc ; -> 0x0017daf0  ZTVN6Mayhem18GetUserListRequestE
0008cfb4  adds    r3, #8
0008cfb6  str     r3, [r2]
0008cfb8  ldr     r3, [pc, #0x54]
0008cfba  add     r3, pc ; -> 0x0017daf0  ZTVN6Mayhem18GetUserListRequestE
0008cfbc  adds    r3, #0x1c
0008cfbe  str     r3, [r2, #0x10]
0008cfc0  movs    r3, #0
0008cfc2  str     r3, [r2, #0x60]
0008cfc4  str     r3, [r2, #0x64]
0008cfc6  str     r3, [r2, #0x68]
0008cfc8  str     r3, [r2, #0x6c]
0008cfca  str     r3, [r2, #0x70]
0008cfcc  str     r3, [r2, #0x74]
0008cfce  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008cfd2  sub.w   sp, r7, #0x58
0008cfd6  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008cfda  sub.w   sp, r7, #0x18
0008cfde  pop.w   {r8, sl, fp}
0008cfe2  pop     {r4, r5, r6, r7, pc}
0008cfe4  ldr     r3, [sp, #0x10]
0008cfe6  ldr     r0, [sp, #4]
0008cfe8  str     r3, [sp]
0008cfea  movs    r3, #0
0008cfec  str     r3, [sp, #0xc]
0008cfee  bl      #0x8b9a0 ; -> ZN6Mayhem8UserListD2Ev
0008cff2  ldr     r0, [sp]
0008cff4  mov.w   r3, #-1
0008cff8  str     r3, [sp, #0xc]
0008cffa  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008cffe  nop     
0008d000  str     r4, [r7, #0x48]
0008d002  movs    r6, r0
0008d004  asrs    r4, r2, #0xc
0008d006  movs    r6, r0
0008d008  lsls    r4, r2, #1
0008d00a  movs    r0, r0
0008d00c  lsrs    r2, r7, #0xc
0008d00e  movs    r7, r1
0008d010  lsrs    r2, r6, #0xc
0008d012  movs    r7, r1
