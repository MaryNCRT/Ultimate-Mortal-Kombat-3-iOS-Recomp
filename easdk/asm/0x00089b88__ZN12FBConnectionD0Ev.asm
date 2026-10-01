========================================================================
ZN12FBConnectionD0Ev  0x00089b88  864 bytes   FBConnection.mm
========================================================================

00089b88  push    {r4, r5, r6, r7, lr}
00089b8a  add     r7, sp, #0xc
00089b8c  push.w  {r8, sl, fp}
00089b90  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00089b94  sub     sp, #0x78
00089b96  ldr     r3, [pc, #0x328]
00089b98  str     r0, [sp]
00089b9a  add     r0, sp, #0x3c
00089b9c  add     r3, pc ; -> 0x000f301c  0x0
00089b9e  str     r7, [sp, #0x5c]
00089ba0  ldr     r3, [r3]
00089ba2  str.w   sp, [sp, #0x64]
00089ba6  str     r3, [sp, #0x54]
00089ba8  ldr     r3, [pc, #0x318]
00089baa  add     r3, pc ; -> 0x000ee1c0  GCC_except_table5
00089bac  str     r3, [sp, #0x58]
00089bae  ldr     r3, [pc, #0x318]
00089bb0  add     r3, pc ; -> 0x00089d4e  
00089bb2  orr     r3, r3, #1
00089bb6  str     r3, [sp, #0x60]
00089bb8  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00089bbc  ldr     r1, [pc, #0x30c]
00089bbe  ldr     r2, [sp]
00089bc0  ldr     r3, [pc, #0x30c]
00089bc2  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
00089bc4  add     r3, pc ; -> 0x0017da0c  ZTV12FBConnection
00089bc6  adds    r3, #8
00089bc8  ldr     r0, [r2, #0x14]
00089bca  str     r3, [r2]
00089bcc  ldr     r1, [r1]
00089bce  movs    r3, #1
00089bd0  str     r3, [sp, #0x40]
00089bd2  blx     #0xddbfc ; -> objc_msgSend
00089bd6  ldr     r3, [sp]
00089bd8  ldr     r2, [sp]
00089bda  adds    r2, #0x1c
00089bdc  str     r2, [sp, #0x1c]
00089bde  ldr     r2, [r3, #0x1c]
00089be0  ldr     r4, [r3, #0x20]
00089be2  cmp     r2, r4
00089be4  str     r4, [sp, #0x20]
00089be6  beq     #0x89c60
00089be8  ldr     r3, [pc, #0x2e8]
00089bea  str     r2, [sp, #0x34]
00089bec  add     r3, pc ; -> 0x000f3370  0x0
00089bee  ldr     r3, [r3]
00089bf0  str     r3, [sp, #0x2c]
00089bf2  ldr     r2, [sp, #0x34]
00089bf4  ldr     r4, [sp, #0x2c]
00089bf6  str     r2, [sp, #0x38]
00089bf8  ldr     r3, [r2, #0xc]
00089bfa  sub.w   r0, r3, #0xc
00089bfe  cmp     r4, r0
00089c00  bne     #0x89c6a
00089c02  ldr     r2, [sp, #0x38]
00089c04  ldr     r4, [sp, #0x2c]
00089c06  ldr     r3, [r2, #8]
00089c08  sub.w   r0, r3, #0xc
00089c0c  cmp     r4, r0
00089c0e  bne     #0x89c96
00089c10  ldr     r2, [sp, #0x34]
00089c12  ldr     r3, [sp, #0x20]
00089c14  adds    r2, #0x10
00089c16  cmp     r3, r2
00089c18  str     r2, [sp, #0x34]
00089c1a  bne     #0x89bf2
00089c1c  ldr     r4, [sp, #0x1c]
00089c1e  ldr     r0, [r4]
00089c20  cbz     r0, #0x89c26
00089c22  blx     #0xdd5a8 ; -> ZdlPv
00089c26  ldr     r2, [sp]
00089c28  ldr     r4, [sp, #0x2c]
00089c2a  ldr     r3, [r2, #0x10]
00089c2c  sub.w   r0, r3, #0xc
00089c30  cmp     r4, r0
00089c32  bne     #0x89d04
00089c34  ldr     r2, [sp]
00089c36  ldr     r4, [sp, #0x2c]
00089c38  ldr     r3, [r2, #0xc]
00089c3a  sub.w   r0, r3, #0xc
00089c3e  cmp     r4, r0
00089c40  bne     #0x89cdc
00089c42  ldr     r0, [sp]
00089c44  blx     #0xdd5a8 ; -> ZdlPv
00089c48  add     r0, sp, #0x3c
00089c4a  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00089c4e  sub.w   sp, r7, #0x58
00089c52  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00089c56  sub.w   sp, r7, #0x18
00089c5a  pop.w   {r8, sl, fp}
00089c5e  pop     {r4, r5, r6, r7, pc}
00089c60  ldr     r3, [pc, #0x274]
00089c62  add     r3, pc ; -> 0x000f3370  0x0
00089c64  ldr     r3, [r3]
00089c66  str     r3, [sp, #0x2c]
00089c68  b       #0x89c1c
00089c6a  subs    r2, r3, #4
00089c6c  ldr     r3, [r3, #-0x4]
00089c70  subs    r1, r3, #1
00089c72  dmb     ish
00089c76  mov     ip, r3
00089c78  ldrex   lr, [r2]
00089c7c  cmp     lr, r3
00089c7e  beq     #0x89cce
00089c80  cmp     lr, ip
00089c82  mov     r3, lr
00089c84  bne     #0x89c70
00089c86  cmp.w   lr, #0
00089c8a  bgt     #0x89c02
00089c8c  add.w   r1, sp, #0x75
00089c90  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089c94  b       #0x89c02
00089c96  subs    r2, r3, #4
00089c98  ldr     r3, [r3, #-0x4]
00089c9c  subs    r1, r3, #1
00089c9e  dmb     ish
00089ca2  mov     ip, r3
00089ca4  ldrex   lr, [r2]
00089ca8  cmp     lr, r3
00089caa  beq     #0x89cc0
00089cac  cmp     lr, ip
00089cae  mov     r3, lr
00089cb0  bne     #0x89c9c
00089cb2  cmp.w   lr, #0
00089cb6  bgt     #0x89c10
00089cb8  add     r1, sp, #0x74
00089cba  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089cbe  b       #0x89c10
00089cc0  strex   r4, r1, [r2]
00089cc4  cmp     r4, #0
00089cc6  bne     #0x89ca4
00089cc8  dmb     ish
00089ccc  b       #0x89cac
00089cce  strex   r4, r1, [r2]
00089cd2  cmp     r4, #0
00089cd4  bne     #0x89c78
00089cd6  dmb     ish
00089cda  b       #0x89c80
00089cdc  subs    r2, r3, #4
00089cde  ldr     r3, [r3, #-0x4]
00089ce2  subs    r1, r3, #1
00089ce4  dmb     ish
00089ce8  mov     ip, r3
00089cea  ldrex   r4, [r2]
00089cee  cmp     r4, r3
00089cf0  beq     #0x89d3e
00089cf2  cmp     r4, ip
00089cf4  mov     r3, r4
00089cf6  bne     #0x89ce2
00089cf8  cmp     r4, #0
00089cfa  bgt     #0x89c42
00089cfc  add     r1, sp, #0x70
00089cfe  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089d02  b       #0x89c42
00089d04  subs    r2, r3, #4
00089d06  ldr     r3, [r3, #-0x4]
00089d0a  subs    r1, r3, #1
00089d0c  dmb     ish
00089d10  mov     ip, r3
00089d12  ldrex   r4, [r2]
00089d16  cmp     r4, r3
00089d18  beq     #0x89d2e
00089d1a  cmp     r4, ip
00089d1c  mov     r3, r4
00089d1e  bne     #0x89d0a
00089d20  cmp     r4, #0
00089d22  bgt     #0x89c34
00089d24  add.w   r1, sp, #0x72
00089d28  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089d2c  b       #0x89c34
00089d2e  strex   lr, r1, [r2]
00089d32  cmp.w   lr, #0
00089d36  bne     #0x89d12
00089d38  dmb     ish
00089d3c  b       #0x89d1a
00089d3e  strex   lr, r1, [r2]
00089d42  cmp.w   lr, #0
00089d46  bne     #0x89cea
00089d48  dmb     ish
00089d4c  b       #0x89cf2
00089d4e  ldr     r3, [sp, #0x44]
00089d50  ldr     r4, [sp]
00089d52  str     r3, [sp, #4]
00089d54  ldr     r3, [sp]
00089d56  adds    r4, #0x1c
00089d58  str     r4, [sp, #0x10]
00089d5a  ldr     r2, [r3, #0x1c]
00089d5c  ldr     r4, [r3, #0x20]
00089d5e  cmp     r2, r4
00089d60  str     r4, [sp, #0x14]
00089d62  beq     #0x89d98
00089d64  ldr     r3, [pc, #0x174]
00089d66  str     r2, [sp, #0x30]
00089d68  add     r3, pc ; -> 0x000f3370  0x0
00089d6a  ldr     r3, [r3]
00089d6c  str     r3, [sp, #0x28]
00089d6e  ldr     r2, [sp, #0x30]
00089d70  ldr     r4, [sp, #0x28]
00089d72  str     r2, [sp, #0x18]
00089d74  ldr     r3, [r2, #0xc]
00089d76  sub.w   r0, r3, #0xc
00089d7a  cmp     r0, r4
00089d7c  bne     #0x89e04
00089d7e  ldr     r2, [sp, #0x18]
00089d80  ldr     r4, [sp, #0x28]
00089d82  ldr     r3, [r2, #8]
00089d84  sub.w   r0, r3, #0xc
00089d88  cmp     r0, r4
00089d8a  bne     #0x89dd8
00089d8c  ldr     r2, [sp, #0x30]
00089d8e  ldr     r3, [sp, #0x14]
00089d90  adds    r2, #0x10
00089d92  cmp     r3, r2
00089d94  str     r2, [sp, #0x30]
00089d96  bne     #0x89d6e
00089d98  ldr     r4, [sp, #0x10]
00089d9a  ldr     r0, [r4]
00089d9c  cbz     r0, #0x89da2
00089d9e  blx     #0xdd5a8 ; -> ZdlPv
00089da2  ldr     r3, [sp]
00089da4  ldr     r2, [sp, #4]
00089da6  str     r2, [sp, #8]
00089da8  ldr     r1, [r3, #0x10]
00089daa  ldr     r3, [pc, #0x134]
00089dac  sub.w   r0, r1, #0xc
00089db0  add     r3, pc ; -> 0x000f3370  0x0
00089db2  ldr     r3, [r3]
00089db4  cmp     r0, r3
00089db6  str     r3, [sp, #0x24]
00089db8  bne     #0x89e68
00089dba  ldr     r2, [sp, #8]
00089dbc  ldr     r4, [sp]
00089dbe  str     r2, [sp, #0xc]
00089dc0  ldr     r3, [r4, #0xc]
00089dc2  ldr     r2, [sp, #0x24]
00089dc4  sub.w   r0, r3, #0xc
00089dc8  cmp     r2, r0
00089dca  bne     #0x89e3e
00089dcc  ldr     r0, [sp, #0xc]
00089dce  mov.w   r3, #-1
00089dd2  str     r3, [sp, #0x40]
00089dd4  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00089dd8  subs    r2, r3, #4
00089dda  ldr     r3, [r3, #-0x4]
00089dde  subs    r1, r3, #1
00089de0  dmb     ish
00089de4  mov     ip, r3
00089de6  ldrex   lr, [r2]
00089dea  cmp     lr, r3
00089dec  beq     #0x89e30
00089dee  cmp     lr, ip
00089df0  mov     r3, lr
00089df2  bne     #0x89dde
00089df4  cmp.w   lr, #0
00089df8  bgt     #0x89d8c
00089dfa  add.w   r1, sp, #0x76
00089dfe  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089e02  b       #0x89d8c
00089e04  subs    r2, r3, #4
00089e06  ldr     r3, [r3, #-0x4]
00089e0a  subs    r1, r3, #1
00089e0c  dmb     ish
00089e10  mov     ip, r3
00089e12  ldrex   lr, [r2]
00089e16  cmp     lr, r3
00089e18  beq     #0x89ea2
00089e1a  cmp     lr, ip
00089e1c  mov     r3, lr
00089e1e  bne     #0x89e0a
00089e20  cmp.w   lr, #0
00089e24  bgt     #0x89d7e
00089e26  add.w   r1, sp, #0x77
00089e2a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089e2e  b       #0x89d7e
00089e30  strex   r4, r1, [r2]
00089e34  cmp     r4, #0
00089e36  bne     #0x89de6
00089e38  dmb     ish
00089e3c  b       #0x89dee
00089e3e  subs    r2, r3, #4
00089e40  ldr     r3, [r3, #-0x4]
00089e44  subs    r1, r3, #1
00089e46  dmb     ish
00089e4a  mov     ip, r3
00089e4c  ldrex   r4, [r2]
00089e50  cmp     r4, r3
00089e52  beq     #0x89e92
00089e54  cmp     r4, ip
00089e56  mov     r3, r4
00089e58  bne     #0x89e44
00089e5a  cmp     r4, #0
00089e5c  bgt     #0x89dcc
00089e5e  add.w   r1, sp, #0x71
00089e62  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089e66  b       #0x89dcc
00089e68  ldr     r3, [r1, #-0x4]
00089e6c  subs    r2, r1, #4
00089e6e  subs    r1, r3, #1
00089e70  dmb     ish
00089e74  mov     ip, r3
00089e76  ldrex   r4, [r2]
00089e7a  cmp     r4, r3
00089e7c  beq     #0x89eb0
00089e7e  cmp     r4, ip
00089e80  mov     r3, r4
00089e82  bne     #0x89e6e
00089e84  cmp     r4, #0
00089e86  bgt     #0x89dba
00089e88  add.w   r1, sp, #0x73
00089e8c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089e90  b       #0x89dba
00089e92  strex   lr, r1, [r2]
00089e96  cmp.w   lr, #0
00089e9a  bne     #0x89e4c
00089e9c  dmb     ish
00089ea0  b       #0x89e54
00089ea2  strex   r4, r1, [r2]
00089ea6  cmp     r4, #0
00089ea8  bne     #0x89e12
00089eaa  dmb     ish
00089eae  b       #0x89e1a
00089eb0  strex   lr, r1, [r2]
00089eb4  cmp.w   lr, #0
00089eb8  bne     #0x89e76
00089eba  dmb     ish
00089ebe  b       #0x89e7e
00089ec0  str     r4, [sp, #0x1f0]
00089ec2  movs    r6, r0
00089ec4  mov     r2, r2
00089ec6  movs    r6, r0
00089ec8  lsls    r2, r3, #6
00089eca  movs    r0, r0
00089ecc  cmp     r5, #0xb6
00089ece  movs    r7, r0
00089ed0  subs    r6, #0x44
00089ed2  movs    r7, r1
00089ed4  str     r7, [sp, #0x200]
00089ed6  movs    r6, r0
00089ed8  str     r7, [sp, #0x28]
00089eda  movs    r6, r0
00089edc  str     r6, [sp, #0x10]
00089ede  movs    r6, r0
00089ee0  str     r5, [sp, #0x2f0]
00089ee2  movs    r6, r0
00089ee4  nop     
00089ee6  nop     
