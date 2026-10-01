========================================================================
-[FBDialog postDismissCleanup]  0x00082ec4  40 bytes   FBDialog.m
========================================================================

00082ec4  push    {r4, r7, lr}
00082ec6  add     r7, sp, #4
00082ec8  ldr     r1, [pc, #0x18]
00082eca  mov     r4, r0
00082ecc  add     r1, pc ; -> 0x000fccf4  'J(\x0e'
00082ece  ldr     r1, [r1]
00082ed0  blx     #0xddbfc ; -> objc_msgSend
00082ed4  ldr     r1, [pc, #0x10]
00082ed6  mov     r0, r4
00082ed8  add     r1, pc ; -> 0x000fccf0  '<-\x0e'
00082eda  ldr     r1, [r1]
00082edc  blx     #0xddbfc ; -> objc_msgSend
00082ee0  pop     {r4, r7, pc}
00082ee2  nop     
00082ee4  ldr     r6, [sp, #0x90]
00082ee6  movs    r7, r0
00082ee8  ldr     r6, [sp, #0x50]
00082eea  movs    r7, r0
