========================================================================
-[FBPermissionDialog redirectToLogin]  0x000854c0  84 bytes   FBPermissionDialog.m
========================================================================

000854c0  push    {r4, r5, r7, lr}
000854c2  add     r7, sp, #8
000854c4  sub     sp, #0x10
000854c6  ldr     r3, [pc, #0x34]
000854c8  mov     r4, r0
000854ca  ldr     r1, [pc, #0x34]
000854cc  add     r3, pc ; -> 0x000f5678  OBJC_IVAR_$_FBPermissionDialog._redirectTimer
000854ce  ldr     r0, [pc, #0x34]
000854d0  ldr     r5, [r3]
000854d2  ldr     r3, [pc, #0x34]
000854d4  add     r0, pc ; -> 0x000fdb58  
000854d6  add     r1, pc ; -> 0x000fc9b8  '~\x07\x0e'
000854d8  add     r3, pc ; -> 0x000fce00  'a6\x0e'
000854da  ldr     r0, [r0]
000854dc  ldr     r3, [r3]
000854de  ldr     r1, [r1]
000854e0  ldr     r2, [pc, #0x28]
000854e2  str     r4, [sp]
000854e4  str     r3, [sp, #4]
000854e6  movs    r3, #0
000854e8  str     r3, [sp, #8]
000854ea  str     r3, [sp, #0xc]
000854ec  ldr     r3, [pc, #0x20]
000854ee  blx     #0xddbfc ; -> objc_msgSend
000854f2  str     r0, [r4, r5]
000854f4  sub.w   sp, r7, #8
000854f8  pop     {r4, r5, r7, pc}
000854fa  nop     
000854fc  lsls    r0, r5, #6
000854fe  movs    r7, r0
00085500  strb    r6, [r3, #0x13]
00085502  movs    r7, r0
00085504  strh    r0, [r0, #0x34]
00085506  movs    r7, r0
00085508  ldrb    r4, [r4, #4]
0008550a  movs    r7, r0
0008550c  asrs    r3, r7, #0x11
0008550e  blxns   r5
00085510  ldrb    r1, [r4, #0xb]
00085512  subs    r7, #0x84
