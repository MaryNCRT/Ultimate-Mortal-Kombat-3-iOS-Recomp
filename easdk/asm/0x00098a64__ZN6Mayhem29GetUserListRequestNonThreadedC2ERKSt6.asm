========================================================================
ZN6Mayhem29GetUserListRequestNonThreadedC2ERKSt6vectorISsSaISsEE  0x00098a64  196 bytes   Mayhem.mm
========================================================================

00098a64  push    {r4, r5, r6, r7, lr}
00098a66  add     r7, sp, #0xc
00098a68  push.w  {r8, sl, fp}
00098a6c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00098a70  sub     sp, #0x40
00098a72  ldr     r3, [pc, #0xa0]
00098a74  str     r0, [sp, #8]
00098a76  add     r0, sp, #0xc
00098a78  add     r3, pc ; -> 0x000f3438  0x0
00098a7a  str     r1, [sp, #4]
00098a7c  ldr     r3, [r3]
00098a7e  str     r7, [sp, #0x2c]
00098a80  str.w   sp, [sp, #0x34]
00098a84  str     r3, [sp, #0x24]
00098a86  ldr     r3, [pc, #0x90]
00098a88  add     r3, pc ; -> 0x000ee58e  GCC_except_table106
00098a8a  str     r3, [sp, #0x28]
00098a8c  ldr     r3, [pc, #0x8c]
00098a8e  add     r3, pc ; -> 0x00098af8  
00098a90  orr     r3, r3, #1
00098a94  str     r3, [sp, #0x30]
00098a96  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00098a9a  ldr     r0, [sp, #8]
00098a9c  mov.w   r3, #-1
00098aa0  str     r3, [sp, #0x10]
00098aa2  bl      #0x8cf64 ; -> ZN6Mayhem18GetUserListRequestC2Ev
00098aa6  ldr     r2, [sp, #8]
00098aa8  ldr     r3, [pc, #0x74]
00098aaa  add     r3, pc ; -> 0x0017dac0  ZTVN6Mayhem29GetUserListRequestNonThreadedE
00098aac  adds    r3, #8
00098aae  str     r3, [r2]
00098ab0  ldr     r3, [pc, #0x70]
00098ab2  add     r3, pc ; -> 0x0017dac0  ZTVN6Mayhem29GetUserListRequestNonThreadedE
00098ab4  adds    r3, #0x1c
00098ab6  str     r3, [r2, #0x10]
00098ab8  ldr     r0, [sp, #8]
00098aba  movs    r3, #1
00098abc  ldr     r1, [sp, #4]
00098abe  str     r3, [sp, #0x10]
00098ac0  bl      #0x8f578 ; -> ZN6Mayhem18GetUserListRequest10AddUserIDsERKSt6vectorISsSaISsEE
00098ac4  cmp     r0, #0
00098ac6  ble     #0x98ae6
00098ac8  ldr     r0, [sp, #8]
00098aca  bl      #0x95150 ; -> ZN6Mayhem18GetUserListRequest3runEv
00098ace  add     r0, sp, #0xc
00098ad0  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00098ad4  sub.w   sp, r7, #0x58
00098ad8  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00098adc  sub.w   sp, r7, #0x18
00098ae0  pop.w   {r8, sl, fp}
00098ae4  pop     {r4, r5, r6, r7, pc}
00098ae6  ldr     r2, [sp, #8]
00098ae8  movs    r3, #1
00098aea  str     r3, [sp, #0x10]
00098aec  add.w   r0, r2, #0x10
00098af0  mov     r1, r3
00098af2  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00098af6  b       #0x98ace
00098af8  ldr     r2, [sp, #0x14]
00098afa  ldr     r0, [sp, #8]
00098afc  movs    r3, #0
00098afe  str     r3, [sp, #0x10]
00098b00  str     r2, [sp]
00098b02  bl      #0x984fc ; -> ZN6Mayhem18GetUserListRequestD2Ev
00098b06  ldr     r0, [sp]
00098b08  mov.w   r3, #-1
00098b0c  str     r3, [sp, #0x10]
00098b0e  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00098b12  nop     
00098b14  add     r1, sp, #0x2f0
00098b16  movs    r5, r0
00098b18  ldrh    r2, [r0, r4]
00098b1a  movs    r5, r0
00098b1c  lsls    r6, r4, #1
00098b1e  movs    r0, r0
00098b20  str     r2, [r2, r0]
00098b22  movs    r6, r1
00098b24  str     r2, [r1, r0]
00098b26  movs    r6, r1
