========================================================================
-[FBDialog title]  0x00082a60  32 bytes   FBDialog.m
========================================================================

00082a60  push    {r7, lr}
00082a62  add     r7, sp, #0
00082a64  ldr     r3, [pc, #0x10]
00082a66  ldr     r1, [pc, #0x14]
00082a68  add     r3, pc ; -> 0x000f51d4  OBJC_IVAR_$_FBDialog._titleLabel
00082a6a  add     r1, pc ; -> 0x000fcc28  'tS\x0e'
00082a6c  ldr     r3, [r3]
00082a6e  ldr     r1, [r1]
00082a70  ldr     r0, [r0, r3]
00082a72  blx     #0xddbfc ; -> objc_msgSend
00082a76  pop     {r7, pc}
00082a78  movs    r7, #0x68
00082a7a  movs    r7, r0
00082a7c  adr     r1, #0x2e8
00082a7e  movs    r7, r0
