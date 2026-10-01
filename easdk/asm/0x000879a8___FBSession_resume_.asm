========================================================================
-[FBSession resume]  0x000879a8  464 bytes   FBSession.m
========================================================================

000879a8  push    {r4, r5, r6, r7, lr}
000879aa  add     r7, sp, #0xc
000879ac  push.w  {r8, sl, fp}
000879b0  sub     sp, #0x70
000879b2  ldr     r1, [pc, #0x170]
000879b4  mov     r6, r0
000879b6  ldr     r0, [pc, #0x170]
000879b8  add     r1, pc ; -> 0x000fcae0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x168
000879ba  add     r0, pc ; -> 0x000fdb84  
000879bc  ldr     r1, [r1]
000879be  ldr     r0, [r0]
000879c0  blx     #0xddbfc ; -> objc_msgSend
000879c4  ldr     r1, [pc, #0x164]
000879c6  ldr     r2, [pc, #0x168]
000879c8  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000879ca  add     r2, pc ; -> 0x0017eca4  
000879cc  ldr.w   r8, [r1]
000879d0  mov     r1, r8
000879d2  mov     sl, r0
000879d4  blx     #0xddbfc ; -> objc_msgSend
000879d8  ldr     r1, [pc, #0x158]
000879da  add     r1, pc ; -> 0x000fcdb4  
000879dc  ldr     r1, [r1]
000879de  blx     #0xddbfc ; -> objc_msgSend
000879e2  orrs.w  r2, r0, r1
000879e6  mov     r4, r0
000879e8  mov     r5, r1
000879ea  bne     #0x879fa
000879ec  movs    r0, #0
000879ee  sxtb    r0, r0
000879f0  sub.w   sp, r7, #0x18
000879f4  pop.w   {r8, sl, fp}
000879f8  pop     {r4, r5, r6, r7, pc}
000879fa  ldr     r2, [pc, #0x13c]
000879fc  mov     r1, r8
000879fe  mov     r0, sl
00087a00  add     r2, pc ; -> 0x0017ecd4  
00087a02  blx     #0xddbfc ; -> objc_msgSend
00087a06  mov     r8, r0
00087a08  cbz     r0, #0x87a22
00087a0a  ldr     r1, [pc, #0x130]
00087a0c  add     r1, pc ; -> 0x000fcef4  
00087a0e  ldr     r1, [r1]
00087a10  blx     #0xddbfc ; -> objc_msgSend
00087a14  vmov    d7, r0, r1
00087a18  vcmpe.f64 d7, #0
00087a1c  vmrs    apsr_nzcv, fpscr
00087a20  ble     #0x879ec
00087a22  ldr     r3, [pc, #0x11c]
00087a24  ldr     r1, [pc, #0x11c]
00087a26  ldr     r2, [pc, #0x120]
00087a28  add     r3, pc ; -> 0x000f5d14  OBJC_IVAR_$_FBSession._uid
00087a2a  add     r1, pc ; -> 0x000fcec8  
00087a2c  ldr     r3, [r3]
00087a2e  ldr.w   fp, [r1]
00087a32  add     r2, pc ; -> 0x0017ecb4  
00087a34  add     r3, r6
00087a36  mov     r0, sl
00087a38  stm.w   r3, {r4, r5}
00087a3c  ldr     r3, [pc, #0x10c]
00087a3e  mov     r1, fp
00087a40  add     r3, pc ; -> 0x000f5d18  OBJC_IVAR_$_FBSession._sessionKey
00087a42  ldr     r5, [r3]
00087a44  blx     #0xddbfc ; -> objc_msgSend
00087a48  ldr     r1, [pc, #0x104]
00087a4a  add     r1, pc ; -> 0x000fce18  
00087a4c  ldr     r4, [r1]
00087a4e  mov     r1, r4
00087a50  blx     #0xddbfc ; -> objc_msgSend
00087a54  ldr     r3, [pc, #0xfc]
00087a56  ldr     r2, [pc, #0x100]
00087a58  mov     r1, fp
00087a5a  add     r3, pc ; -> 0x000f5d1c  OBJC_IVAR_$_FBSession._sessionSecret
00087a5c  add     r2, pc ; -> 0x0017ecc4  
00087a5e  str     r0, [r6, r5]
00087a60  mov     r0, sl
00087a62  ldr     r5, [r3]
00087a64  blx     #0xddbfc ; -> objc_msgSend
00087a68  mov     r1, r4
00087a6a  blx     #0xddbfc ; -> objc_msgSend
00087a6e  ldr     r1, [pc, #0xec]
00087a70  ldr     r3, [pc, #0xec]
00087a72  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
00087a74  add     r3, pc ; -> 0x000f5d20  OBJC_IVAR_$_FBSession._expirationDate
00087a76  ldr     r1, [r1]
00087a78  str     r0, [r6, r5]
00087a7a  mov     r0, r8
00087a7c  ldr     r4, [r3]
00087a7e  blx     #0xddbfc ; -> objc_msgSend
00087a82  movs    r3, #0
00087a84  str     r3, [sp, #0x50]
00087a86  str     r3, [sp, #0x54]
00087a88  str     r3, [sp, #0x58]
00087a8a  str     r3, [sp, #0x5c]
00087a8c  str     r3, [sp, #0x60]
00087a8e  str     r3, [sp, #0x64]
00087a90  str     r3, [sp, #0x68]
00087a92  str     r3, [sp, #0x6c]
00087a94  ldr     r3, [pc, #0xcc]
00087a96  ldr     r1, [pc, #0xd0]
00087a98  add     r2, sp, #0x50
00087a9a  add     r3, pc ; -> 0x000f5d04  OBJC_IVAR_$_FBSession._delegates
00087a9c  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
00087a9e  ldr     r1, [r1]
00087aa0  str     r1, [sp, #0xc]
00087aa2  str     r0, [r6, r4]
00087aa4  ldr     r0, [r3]
00087aa6  movs    r3, #0x10
00087aa8  str     r3, [sp]
00087aaa  add     r3, sp, r3
00087aac  ldr     r0, [r6, r0]
00087aae  str     r0, [sp, #8]
00087ab0  blx     #0xddbfc ; -> objc_msgSend
00087ab4  cmp     r0, #0
00087ab6  beq     #0x87b20
00087ab8  ldr     r3, [sp, #0x58]
00087aba  ldr     r1, [pc, #0xb0]
00087abc  ldr     r2, [pc, #0xb0]
00087abe  mov     r8, r0
00087ac0  add     r1, pc ; -> 0x000fcec4  '\x08J\x0e'
00087ac2  ldr.w   fp, [r3]
00087ac6  ldr.w   sl, [r1]
00087aca  str     r2, [sp, #4]
00087acc  mov     r3, fp
00087ace  movs    r5, #0
00087ad0  b       #0x87ad6
00087ad2  ldr     r3, [sp, #0x58]
00087ad4  ldr     r3, [r3]
00087ad6  cmp     fp, r3
00087ad8  beq     #0x87ae6
00087ada  ldr     r3, [pc, #0x98]
00087adc  add     r3, pc ; -> 0x000f5d04  OBJC_IVAR_$_FBSession._delegates
00087ade  ldr     r3, [r3]
00087ae0  ldr     r0, [r6, r3]
00087ae2  blx     #0xddbe4 ; -> objc_enumerationMutation
00087ae6  ldr     r3, [sp, #0x54]
00087ae8  mov     r1, sl
00087aea  mov     r2, r6
00087aec  ldr.w   r0, [r3, r5, lsl #2]
00087af0  ldr     r3, [sp, #4]
00087af2  adds    r5, #1
00087af4  add     r3, pc
00087af6  ldr     r3, [r3]
00087af8  add     r3, r6
00087afa  ldm     r3, {r3, r4}
00087afc  str     r4, [sp]
00087afe  blx     #0xddbfc ; -> objc_msgSend
00087b02  cmp     r8, r5
00087b04  bhi     #0x87ad2
00087b06  movs    r3, #0x10
00087b08  ldr     r0, [sp, #8]
00087b0a  str     r3, [sp]
00087b0c  ldr     r1, [sp, #0xc]
00087b0e  add     r2, sp, #0x50
00087b10  add     r3, sp, r3
00087b12  blx     #0xddbfc ; -> objc_msgSend
00087b16  cbz     r0, #0x87b20
00087b18  ldr     r3, [sp, #0x58]
00087b1a  mov     r8, r0
00087b1c  ldr     r3, [r3]
00087b1e  b       #0x87ace
00087b20  movs    r0, #1
00087b22  b       #0x879ee
00087b24  str     r4, [r4, r4]
00087b26  movs    r7, r0
00087b28  str     r6, [r0, #0x1c]
00087b2a  movs    r7, r0
00087b2c  str     r0, [r1, r4]
00087b2e  movs    r7, r0
00087b30  strb    r6, [r2, #0xb]
00087b32  movs    r7, r1
00087b34  strh    r6, [r2, r7]
00087b36  movs    r7, r0
00087b38  strb    r0, [r2, #0xb]
00087b3a  movs    r7, r1
00087b3c  strb    r4, [r4, r3]
00087b3e  movs    r7, r0
00087b40  b       #0x88114
00087b42  movs    r6, r0
00087b44  strb    r2, [r3, r2]
00087b46  movs    r7, r0
00087b48  strb    r6, [r7, #9]
00087b4a  movs    r7, r1
00087b4c  b       #0x880f8
00087b4e  movs    r6, r0
00087b50  strh    r2, [r1, r7]
00087b52  movs    r7, r0
00087b54  b       #0x880d4
00087b56  movs    r6, r0
00087b58  strb    r4, [r4, #9]
00087b5a  movs    r7, r1
00087b5c  strh    r2, [r3, r1]
00087b5e  movs    r7, r0
00087b60  b       #0x880b4
00087b62  movs    r6, r0
00087b64  b       #0x88034
00087b66  movs    r6, r0
00087b68  ldr     r6, [pc, #0x3e0]
00087b6a  movs    r7, r0
00087b6c  strb    r0, [r0, r0]
00087b6e  movs    r7, r0
00087b70  b       #0x87fac
00087b72  movs    r6, r0
00087b74  b       #0x87fc0
00087b76  movs    r6, r0
