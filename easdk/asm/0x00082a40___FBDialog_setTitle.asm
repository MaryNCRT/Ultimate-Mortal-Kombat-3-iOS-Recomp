========================================================================
-[FBDialog setTitle  0x00082a40  32 bytes   FBDialog.m
========================================================================

00082a40  push    {r7, lr}
00082a42  add     r7, sp, #0
00082a44  ldr     r3, [pc, #0x10]
00082a46  ldr     r1, [pc, #0x14]
00082a48  add     r3, pc ; -> 0x000f51d4  OBJC_IVAR_$_FBDialog._titleLabel
00082a4a  add     r1, pc ; -> 0x000fcc80  '\x1e,\x0e'
00082a4c  ldr     r3, [r3]
00082a4e  ldr     r1, [r1]
00082a50  ldr     r0, [r0, r3]
00082a52  blx     #0xddbfc ; -> objc_msgSend
00082a56  pop     {r7, pc}
00082a58  movs    r7, #0x88
00082a5a  movs    r7, r0
00082a5c  adr     r2, #0xc8
00082a5e  movs    r7, r0
