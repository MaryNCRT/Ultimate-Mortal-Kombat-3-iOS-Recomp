========================================================================
EASOC_MayhemSetUserName  0x000809f8  532 bytes   EASDK_Handler.mm
========================================================================

000809f8  push    {r4, r5, r6, r7, lr}
000809fa  add     r7, sp, #0xc
000809fc  push.w  {r8, sl, fp}
00080a00  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00080a04  sub     sp, #0x78
00080a06  ldr     r3, [pc, #0x1ec]
00080a08  str     r0, [sp, #4]
00080a0a  add     r0, sp, #0x38
00080a0c  add     r3, pc ; -> 0x000f301c  0x0
00080a0e  str     r7, [sp, #0x58]
00080a10  ldr     r3, [r3]
00080a12  str.w   sp, [sp, #0x60]
00080a16  str     r3, [sp, #0x50]
00080a18  ldr     r3, [pc, #0x1dc]
00080a1a  add     r3, pc ; -> 0x000ee13a  GCC_except_table10
00080a1c  str     r3, [sp, #0x54]
00080a1e  ldr     r3, [pc, #0x1dc]
00080a20  add     r3, pc ; -> 0x00080b3e  
00080a22  orr     r3, r3, #1
00080a26  str     r3, [sp, #0x5c]
00080a28  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00080a2c  movs    r3, #4
00080a2e  add     r0, sp, #0x70
00080a30  str     r3, [sp, #0x3c]
00080a32  ldr     r1, [sp, #4]
00080a34  add.w   r2, sp, #0x77
00080a38  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00080a3c  movs    r3, #3
00080a3e  movs    r0, #0x6c
00080a40  str     r3, [sp, #0x3c]
00080a42  blx     #0xdd5c0 ; -> Znwm
00080a46  movs    r3, #2
00080a48  str     r0, [sp, #8]
00080a4a  str     r0, [sp, #0xc]
00080a4c  str     r3, [sp, #0x3c]
00080a4e  add     r1, sp, #0x70
00080a50  bl      #0x8e0b0 ; -> ZN6Mayhem15PostUserRequestC1ERKSs
00080a54  ldr     r3, [sp, #8]
00080a56  ldr     r4, [sp, #0xc]
00080a58  add     r2, sp, #0x6c
00080a5a  str     r2, [sp, #0x18]
00080a5c  str     r3, [sp, #0x6c]
00080a5e  cbz     r4, #0x80a70
00080a60  adds.w  r0, r3, #8
00080a64  beq     #0x80a70
00080a66  ldr     r3, [r3, #8]
00080a68  ldr     r2, [r3, #0xc]
00080a6a  movs    r3, #3
00080a6c  str     r3, [sp, #0x3c]
00080a6e  blx     r2
00080a70  ldr     r3, [sp, #0x6c]
00080a72  str     r3, [sp, #0x20]
00080a74  cbz     r3, #0x80a84
00080a76  add.w   r0, r3, #8
00080a7a  ldr     r3, [r3, #8]
00080a7c  ldr     r2, [r3, #0xc]
00080a7e  movs    r3, #1
00080a80  str     r3, [sp, #0x3c]
00080a82  blx     r2
00080a84  ldr     r3, [pc, #0x178]
00080a86  ldr     r2, [sp, #0x20]
00080a88  add     r3, pc ; -> 0x00379b44  m_pendingMayhemUser
00080a8a  ldr     r4, [r3]
00080a8c  str     r2, [r3]
00080a8e  str     r4, [sp, #0x1c]
00080a90  cbz     r4, #0x80aa8
00080a92  add.w   r3, r4, #8
00080a96  str     r3, [sp, #0x24]
00080a98  ldr     r3, [r4, #8]
00080a9a  ldr     r0, [sp, #0x24]
00080a9c  ldr     r2, [r3, #8]
00080a9e  movs    r3, #1
00080aa0  str     r3, [sp, #0x3c]
00080aa2  blx     r2
00080aa4  cmp     r0, #0
00080aa6  bne     #0x80afa
00080aa8  ldr     r4, [sp, #0x18]
00080aaa  ldr     r4, [r4]
00080aac  str     r4, [sp, #0x30]
00080aae  cbz     r4, #0x80ac6
00080ab0  ldr     r2, [sp, #0x30]
00080ab2  ldr     r4, [sp, #0x30]
00080ab4  adds    r4, #8
00080ab6  str     r4, [sp, #0x34]
00080ab8  ldr     r3, [r2, #8]
00080aba  mov     r0, r4
00080abc  ldr     r2, [r3, #8]
00080abe  movs    r3, #3
00080ac0  str     r3, [sp, #0x3c]
00080ac2  blx     r2
00080ac4  cbnz    r0, #0x80aee
00080ac6  ldr     r3, [pc, #0x13c]
00080ac8  ldr     r2, [sp, #0x70]
00080aca  add     r3, pc ; -> 0x000f3370  0x0
00080acc  sub.w   r0, r2, #0xc
00080ad0  ldr     r3, [r3]
00080ad2  cmp     r0, r3
00080ad4  bne     #0x80b04
00080ad6  add     r0, sp, #0x38
00080ad8  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00080adc  sub.w   sp, r7, #0x58
00080ae0  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00080ae4  sub.w   sp, r7, #0x18
00080ae8  pop.w   {r8, sl, fp}
00080aec  pop     {r4, r5, r6, r7, pc}
00080aee  ldr     r4, [sp, #0x30]
00080af0  ldr     r0, [sp, #0x34]
00080af2  ldr     r3, [r4, #8]
00080af4  ldr     r3, [r3, #4]
00080af6  blx     r3
00080af8  b       #0x80ac6
00080afa  ldr     r3, [r4, #8]
00080afc  ldr     r0, [sp, #0x24]
00080afe  ldr     r3, [r3, #4]
00080b00  blx     r3
00080b02  b       #0x80aa8
00080b04  ldr     r3, [r2, #-0x4]
00080b08  subs    r1, r2, #4
00080b0a  subs    r2, r3, #1
00080b0c  dmb     ish
00080b10  mov     ip, r3
00080b12  ldrex   r4, [r1]
00080b16  cmp     r4, r3
00080b18  beq     #0x80b2e
00080b1a  cmp     r4, ip
00080b1c  mov     r3, r4
00080b1e  bne     #0x80b0a
00080b20  cmp     r4, #0
00080b22  bgt     #0x80ad6
00080b24  add.w   r1, sp, #0x75
00080b28  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00080b2c  b       #0x80ad6
00080b2e  strex   lr, r2, [r1]
00080b32  cmp.w   lr, #0
00080b36  bne     #0x80b12
00080b38  dmb     ish
00080b3c  b       #0x80b1a
00080b3e  ldr     r3, [sp, #0x3c]
00080b40  ldr.w   lr, [sp, #0x40]
00080b44  cmp     r3, #1
00080b46  str.w   lr, [sp]
00080b4a  beq     #0x80bb2
00080b4c  cmp     r3, #2
00080b4e  beq     #0x80b82
00080b50  cmp     r3, #3
00080b52  beq     #0x80ba6
00080b54  ldr     r3, [sp, #0x18]
00080b56  str.w   lr, [sp, #0x10]
00080b5a  ldr     r3, [r3]
00080b5c  str     r3, [sp, #0x28]
00080b5e  cbz     r3, #0x80b7e
00080b60  add.w   r4, r3, #8
00080b64  str     r4, [sp, #0x2c]
00080b66  ldr     r3, [r3, #8]
00080b68  mov     r0, r4
00080b6a  ldr     r2, [r3, #8]
00080b6c  movs    r3, #0
00080b6e  str     r3, [sp, #0x3c]
00080b70  blx     r2
00080b72  cbz     r0, #0x80b7e
00080b74  ldr     r2, [sp, #0x28]
00080b76  ldr     r0, [sp, #0x2c]
00080b78  ldr     r3, [r2, #8]
00080b7a  ldr     r3, [r3, #4]
00080b7c  blx     r3
00080b7e  ldr     r3, [sp, #0x10]
00080b80  str     r3, [sp]
00080b82  ldr     r3, [pc, #0x84]
00080b84  ldr     r1, [sp, #0x70]
00080b86  ldr     r2, [sp]
00080b88  add     r3, pc ; -> 0x000f3370  0x0
00080b8a  sub.w   r0, r1, #0xc
00080b8e  ldr     r3, [r3]
00080b90  str     r2, [sp, #0x14]
00080b92  cmp     r0, r3
00080b94  bne     #0x80bba
00080b96  ldr     r2, [sp, #0x14]
00080b98  mov.w   r3, #-1
00080b9c  str     r3, [sp, #0x3c]
00080b9e  mov     r0, r2
00080ba0  str     r2, [sp]
00080ba2  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00080ba6  ldr     r0, [sp]
00080ba8  mov.w   r3, #-1
00080bac  str     r3, [sp, #0x3c]
00080bae  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00080bb2  ldr     r0, [sp, #8]
00080bb4  blx     #0xdd5a8 ; -> ZdlPv
00080bb8  b       #0x80b82
00080bba  ldr     r3, [r1, #-0x4]
00080bbe  subs    r2, r1, #4
00080bc0  subs    r1, r3, #1
00080bc2  dmb     ish
00080bc6  mov     ip, r3
00080bc8  ldrex   r4, [r2]
00080bcc  cmp     r4, r3
00080bce  beq     #0x80be4
00080bd0  cmp     r4, ip
00080bd2  mov     r3, r4
00080bd4  bne     #0x80bc0
00080bd6  cmp     r4, #0
00080bd8  bgt     #0x80b96
00080bda  add.w   r1, sp, #0x76
00080bde  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00080be2  b       #0x80b96
00080be4  strex   lr, r1, [r2]
00080be8  cmp.w   lr, #0
00080bec  bne     #0x80bc8
00080bee  dmb     ish
00080bf2  b       #0x80bd0
00080bf4  movs    r6, #0xc
00080bf6  movs    r7, r0
00080bf8  bvc     #0x80c34
00080bfa  movs    r6, r0
00080bfc  lsls    r2, r3, #4
00080bfe  movs    r0, r0
00080c00  str     r0, [sp, #0x2e0]
00080c02  movs    r7, r5
00080c04  cmp     r0, #0xa2
00080c06  movs    r7, r0
00080c08  movs    r7, #0xe4
00080c0a  movs    r7, r0
