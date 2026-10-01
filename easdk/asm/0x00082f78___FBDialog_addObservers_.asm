========================================================================
-[FBDialog addObservers]  0x00082f78  176 bytes   FBDialog.m
========================================================================

00082f78  push    {r4, r5, r6, r7, lr}
00082f7a  add     r7, sp, #0xc
00082f7c  push.w  {r8, sl}
00082f80  sub     sp, #8
00082f82  ldr     r1, [pc, #0x80]
00082f84  mov     r8, r0
00082f86  ldr     r0, [pc, #0x80]
00082f88  add     r1, pc ; -> 0x000fca30  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xb8
00082f8a  mov.w   sl, #0
00082f8e  add     r0, pc ; -> 0x000fdb68  
00082f90  ldr     r4, [r1]
00082f92  ldr     r5, [r0]
00082f94  mov     r1, r4
00082f96  mov     r0, r5
00082f98  blx     #0xddbfc ; -> objc_msgSend
00082f9c  ldr     r1, [pc, #0x6c]
00082f9e  ldr     r3, [pc, #0x70]
00082fa0  ldr     r2, [pc, #0x70]
00082fa2  add     r1, pc ; -> 0x000fcd04  'l-\x0e'
00082fa4  add     r3, pc ; -> 0x000fcd08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x390
00082fa6  ldr     r6, [r1]
00082fa8  ldr     r3, [r3]
00082faa  add     r2, pc ; -> 0x0017e814  
00082fac  str     r2, [sp]
00082fae  mov     r1, r6
00082fb0  mov     r2, r8
00082fb2  str.w   sl, [sp, #4]
00082fb6  blx     #0xddbfc ; -> objc_msgSend
00082fba  mov     r1, r4
00082fbc  mov     r0, r5
00082fbe  blx     #0xddbfc ; -> objc_msgSend
00082fc2  ldr     r3, [pc, #0x54]
00082fc4  ldr     r2, [pc, #0x54]
00082fc6  mov     r1, r6
00082fc8  add     r3, pc ; -> 0x000fcd00  "q'\x0e"
00082fca  add     r2, pc ; -> 0x0017e824  
00082fcc  ldr     r3, [r3]
00082fce  str     r2, [sp]
00082fd0  mov     r2, r8
00082fd2  str.w   sl, [sp, #4]
00082fd6  blx     #0xddbfc ; -> objc_msgSend
00082fda  mov     r1, r4
00082fdc  mov     r0, r5
00082fde  blx     #0xddbfc ; -> objc_msgSend
00082fe2  ldr     r3, [pc, #0x3c]
00082fe4  ldr     r2, [pc, #0x3c]
00082fe6  mov     r1, r6
00082fe8  add     r3, pc ; -> 0x000fccfc  "_'\x0e"
00082fea  add     r2, pc ; -> 0x0017e834  
00082fec  ldr     r3, [r3]
00082fee  str     r2, [sp]
00082ff0  mov     r2, r8
00082ff2  str.w   sl, [sp, #4]
00082ff6  blx     #0xddbfc ; -> objc_msgSend
00082ffa  sub.w   sp, r7, #0x14
00082ffe  pop.w   {r8, sl}
00083002  pop     {r4, r5, r6, r7, pc}
00083004  ldr     r2, [sp, #0x290]
00083006  movs    r7, r0
00083008  add     r3, sp, #0x358
0008300a  movs    r7, r0
0008300c  ldr     r5, [sp, #0x178]
0008300e  movs    r7, r0
00083010  ldr     r5, [sp, #0x180]
00083012  movs    r7, r0
