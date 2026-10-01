========================================================================
ZN12FBConnectionC2Ev  0x00089944  568 bytes   FBConnection.mm
========================================================================

00089944  push    {r4, r5, r6, r7, lr}
00089946  add     r7, sp, #0xc
00089948  push.w  {r8, sl, fp}
0008994c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00089950  sub     sp, #0x5c
00089952  ldr     r3, [pc, #0x204]
00089954  str     r0, [sp]
00089956  add     r0, sp, #0x24
00089958  add     r3, pc ; -> 0x000f301c  0x0
0008995a  str     r7, [sp, #0x44]
0008995c  ldr     r3, [r3]
0008995e  str.w   sp, [sp, #0x4c]
00089962  str     r3, [sp, #0x3c]
00089964  ldr     r3, [pc, #0x1f4]
00089966  add     r3, pc ; -> 0x000ee1ba  GCC_except_table4
00089968  str     r3, [sp, #0x40]
0008996a  ldr     r3, [pc, #0x1f4]
0008996c  add     r3, pc ; -> 0x000899f2  
0008996e  orr     r3, r3, #1
00089972  str     r3, [sp, #0x48]
00089974  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00089978  ldr     r1, [sp]
0008997a  ldr     r3, [pc, #0x1e8]
0008997c  movs    r2, #0
0008997e  ldr     r0, [pc, #0x1e8]
00089980  add     r3, pc ; -> 0x0017da0c  ZTV12FBConnection
00089982  adds    r3, #8
00089984  str     r3, [r1]
00089986  ldr     r4, [sp]
00089988  movs    r3, #0
0008998a  ldr     r1, [pc, #0x1e0]
0008998c  add     r0, pc ; -> 0x000fdc1c  
0008998e  str     r2, [r4, #4]
00089990  str     r3, [r4, #8]
00089992  ldr     r3, [pc, #0x1dc]
00089994  add.w   r2, r4, #0x1c
00089998  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0008999a  add     r3, pc ; -> 0x000f3370  0x0
0008999c  ldr     r0, [r0]
0008999e  ldr     r3, [r3]
000899a0  ldr     r1, [r1]
000899a2  str     r3, [sp, #0x10]
000899a4  adds    r3, #0xc
000899a6  str     r3, [r4, #0xc]
000899a8  str     r3, [r4, #0x10]
000899aa  movs    r3, #0
000899ac  str     r3, [r4, #0x14]
000899ae  str     r3, [r4, #0x18]
000899b0  str     r3, [r4, #0x1c]
000899b2  str     r3, [r2, #4]
000899b4  str     r3, [r2, #8]
000899b6  str     r3, [r4, #0x28]
000899b8  adds    r3, #1
000899ba  str     r3, [sp, #0x28]
000899bc  blx     #0xddbfc ; -> objc_msgSend
000899c0  ldr     r1, [pc, #0x1b0]
000899c2  ldr     r2, [sp]
000899c4  add     r1, pc ; -> 0x000fcf48  
000899c6  ldr     r1, [r1]
000899c8  blx     #0xddbfc ; -> objc_msgSend
000899cc  ldr     r1, [pc, #0x1a8]
000899ce  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000899d0  ldr     r1, [r1]
000899d2  blx     #0xddbfc ; -> objc_msgSend
000899d6  ldr     r1, [sp]
000899d8  str     r0, [r1, #0x14]
000899da  add     r0, sp, #0x24
000899dc  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
000899e0  sub.w   sp, r7, #0x58
000899e4  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
000899e8  sub.w   sp, r7, #0x18
000899ec  pop.w   {r8, sl, fp}
000899f0  pop     {r4, r5, r6, r7, pc}
000899f2  ldr     r2, [sp]
000899f4  ldr.w   lr, [sp, #0x2c]
000899f8  ldr     r1, [sp]
000899fa  str.w   lr, [sp, #4]
000899fe  adds    r1, #0x1c
00089a00  str     r1, [sp, #0x14]
00089a02  ldr     r3, [r2, #0x1c]
00089a04  ldr     r4, [r2, #0x20]
00089a06  cmp     r3, r4
00089a08  str     r4, [sp, #0x18]
00089a0a  beq     #0x89a38
00089a0c  str     r3, [sp, #0x1c]
00089a0e  ldr     r1, [sp, #0x1c]
00089a10  ldr     r2, [sp, #0x10]
00089a12  str     r1, [sp, #0x20]
00089a14  ldr     r3, [r1, #0xc]
00089a16  sub.w   r0, r3, #0xc
00089a1a  cmp     r2, r0
00089a1c  bne     #0x89a9c
00089a1e  ldr     r1, [sp, #0x20]
00089a20  ldr     r2, [sp, #0x10]
00089a22  ldr     r3, [r1, #8]
00089a24  sub.w   r0, r3, #0xc
00089a28  cmp     r2, r0
00089a2a  bne     #0x89a72
00089a2c  ldr     r1, [sp, #0x1c]
00089a2e  ldr     r2, [sp, #0x18]
00089a30  adds    r1, #0x10
00089a32  cmp     r2, r1
00089a34  str     r1, [sp, #0x1c]
00089a36  bne     #0x89a0e
00089a38  ldr     r3, [sp, #0x14]
00089a3a  ldr     r0, [r3]
00089a3c  cbz     r0, #0x89a42
00089a3e  blx     #0xdd5a8 ; -> ZdlPv
00089a42  ldr     r4, [sp, #4]
00089a44  ldr     r1, [sp]
00089a46  ldr     r2, [sp, #0x10]
00089a48  str     r4, [sp, #8]
00089a4a  ldr     r3, [r1, #0x10]
00089a4c  sub.w   r0, r3, #0xc
00089a50  cmp     r2, r0
00089a52  bne     #0x89b00
00089a54  ldr     r1, [sp, #8]
00089a56  ldr     r2, [sp]
00089a58  ldr     r4, [sp, #0x10]
00089a5a  str     r1, [sp, #0xc]
00089a5c  ldr     r3, [r2, #0xc]
00089a5e  sub.w   r0, r3, #0xc
00089a62  cmp     r4, r0
00089a64  bne     #0x89ad6
00089a66  ldr     r0, [sp, #0xc]
00089a68  mov.w   r3, #-1
00089a6c  str     r3, [sp, #0x28]
00089a6e  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00089a72  subs    r2, r3, #4
00089a74  ldr     r3, [r3, #-0x4]
00089a78  subs    r1, r3, #1
00089a7a  dmb     ish
00089a7e  mov     ip, r3
00089a80  ldrex   r4, [r2]
00089a84  cmp     r4, r3
00089a86  beq     #0x89ac6
00089a88  cmp     r4, ip
00089a8a  mov     r3, r4
00089a8c  bne     #0x89a78
00089a8e  cmp     r4, #0
00089a90  bgt     #0x89a2c
00089a92  add.w   r1, sp, #0x5a
00089a96  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089a9a  b       #0x89a2c
00089a9c  subs    r2, r3, #4
00089a9e  ldr     r3, [r3, #-0x4]
00089aa2  subs    r1, r3, #1
00089aa4  dmb     ish
00089aa8  mov     ip, r3
00089aaa  ldrex   r4, [r2]
00089aae  cmp     r4, r3
00089ab0  beq     #0x89b38
00089ab2  cmp     r4, ip
00089ab4  mov     r3, r4
00089ab6  bne     #0x89aa2
00089ab8  cmp     r4, #0
00089aba  bgt     #0x89a1e
00089abc  add.w   r1, sp, #0x5b
00089ac0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089ac4  b       #0x89a1e
00089ac6  strex   lr, r1, [r2]
00089aca  cmp.w   lr, #0
00089ace  bne     #0x89a80
00089ad0  dmb     ish
00089ad4  b       #0x89a88
00089ad6  subs    r2, r3, #4
00089ad8  ldr     r3, [r3, #-0x4]
00089adc  subs    r1, r3, #1
00089ade  dmb     ish
00089ae2  mov     ip, r3
00089ae4  ldrex   lr, [r2]
00089ae8  cmp     lr, r3
00089aea  beq     #0x89b2a
00089aec  cmp     lr, ip
00089aee  mov     r3, lr
00089af0  bne     #0x89adc
00089af2  cmp.w   lr, #0
00089af6  bgt     #0x89a66
00089af8  add     r1, sp, #0x58
00089afa  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089afe  b       #0x89a66
00089b00  subs    r2, r3, #4
00089b02  ldr     r3, [r3, #-0x4]
00089b06  subs    r1, r3, #1
00089b08  dmb     ish
00089b0c  mov     ip, r3
00089b0e  ldrex   r4, [r2]
00089b12  cmp     r4, r3
00089b14  beq     #0x89b48
00089b16  cmp     r4, ip
00089b18  mov     r3, r4
00089b1a  bne     #0x89b06
00089b1c  cmp     r4, #0
00089b1e  bgt     #0x89a54
00089b20  add.w   r1, sp, #0x59
00089b24  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089b28  b       #0x89a54
00089b2a  strex   r4, r1, [r2]
00089b2e  cmp     r4, #0
00089b30  bne     #0x89ae4
00089b32  dmb     ish
00089b36  b       #0x89aec
00089b38  strex   lr, r1, [r2]
00089b3c  cmp.w   lr, #0
00089b40  bne     #0x89aaa
00089b42  dmb     ish
00089b46  b       #0x89ab2
00089b48  strex   lr, r1, [r2]
00089b4c  cmp.w   lr, #0
00089b50  bne     #0x89b0e
00089b52  dmb     ish
00089b56  b       #0x89b16
00089b58  str     r6, [sp, #0x300]
00089b5a  movs    r6, r0
00089b5c  ldr     r0, [pc, #0x140]
00089b5e  movs    r6, r0
00089b60  lsls    r2, r0, #2
00089b62  movs    r0, r0
00089b64  lsls    r0, r1
00089b66  movs    r7, r1
00089b68  cmp     r4, r1
00089b6a  movs    r7, r0
00089b6c  cmp     r7, #0xe8
00089b6e  movs    r7, r0
00089b70  ldr     r1, [sp, #0x348]
00089b72  movs    r6, r0
00089b74  adds    r5, #0x80
00089b76  movs    r7, r0
00089b78  adds    r2, #0xfe
00089b7a  movs    r7, r0
