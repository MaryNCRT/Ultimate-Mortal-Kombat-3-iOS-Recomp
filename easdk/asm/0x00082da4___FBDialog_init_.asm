========================================================================
-[FBDialog init]  0x00082da4  52 bytes   FBDialog.m
========================================================================

00082da4  push    {r4, r5, r7, lr}
00082da6  add     r7, sp, #8
00082da8  ldr     r1, [pc, #0x20]
00082daa  mov     r5, r0
00082dac  ldr     r0, [pc, #0x20]
00082dae  add     r1, pc ; -> 0x000fccd8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x360
00082db0  ldr     r4, [r1]
00082db2  ldr     r1, [pc, #0x20]
00082db4  add     r0, pc ; -> 0x000fdbc0  
00082db6  add     r1, pc ; -> 0x000fccdc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x364
00082db8  ldr     r0, [r0]
00082dba  ldr     r1, [r1]
00082dbc  blx     #0xddbfc ; -> objc_msgSend
00082dc0  mov     r1, r4
00082dc2  mov     r2, r0
00082dc4  mov     r0, r5
00082dc6  blx     #0xddbfc ; -> objc_msgSend
00082dca  pop     {r4, r5, r7, pc}
00082dcc  ldr     r7, [sp, #0x98]
00082dce  movs    r7, r0
00082dd0  add     r6, sp, #0x20
00082dd2  movs    r7, r0
00082dd4  ldr     r7, [sp, #0x88]
00082dd6  movs    r7, r0
