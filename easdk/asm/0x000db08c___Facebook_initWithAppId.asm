========================================================================
-[Facebook initWithAppId  0x000db08c  96 bytes   Facebook.m
========================================================================

000db08c  push    {r4, r5, r6, r7, lr}
000db08e  add     r7, sp, #0xc
000db090  sub     sp, #8
000db092  ldr     r3, [pc, #0x44]
000db094  ldr     r1, [pc, #0x44]
000db096  str     r0, [sp]
000db098  add     r3, pc ; -> 0x000fde00  
000db09a  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000db09c  ldr     r3, [r3]
000db09e  ldr     r1, [r1]
000db0a0  mov     r0, sp
000db0a2  mov     r6, r2
000db0a4  str     r3, [sp, #4]
000db0a6  blx     #0xddc08 ; -> objc_msgSendSuper2
000db0aa  mov     r4, r0
000db0ac  cbz     r0, #0xdb0d0
000db0ae  ldr     r5, [pc, #0x30]
000db0b0  ldr     r1, [pc, #0x30]
000db0b2  add     r5, pc ; -> 0x000fc51c  OBJC_IVAR_$_Facebook._appId
000db0b4  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000db0b6  ldr     r3, [r5]
000db0b8  ldr     r1, [r1]
000db0ba  ldr     r0, [r0, r3]
000db0bc  blx     #0xddbfc ; -> objc_msgSend
000db0c0  ldr     r1, [pc, #0x24]
000db0c2  mov     r0, r6
000db0c4  ldr     r5, [r5]
000db0c6  add     r1, pc ; -> 0x000fce18  
000db0c8  ldr     r1, [r1]
000db0ca  blx     #0xddbfc ; -> objc_msgSend
000db0ce  str     r0, [r4, r5]
000db0d0  mov     r0, r4
000db0d2  sub.w   sp, r7, #0xc
000db0d6  pop     {r4, r5, r6, r7, pc}
000db0d8  cmp     r5, #0x64
000db0da  movs    r2, r0
000db0dc  adds    r2, r4, r3
000db0de  movs    r2, r0
000db0e0  asrs    r6, r4, #0x11
000db0e2  movs    r2, r0
000db0e4  adds    r4, r0, r3
000db0e6  movs    r2, r0
000db0e8  adds    r6, r1, #5
000db0ea  movs    r2, r0
