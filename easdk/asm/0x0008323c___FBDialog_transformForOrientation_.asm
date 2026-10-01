========================================================================
-[FBDialog transformForOrientation]  0x0008323c  132 bytes   FBDialog.m
========================================================================

0008323c  push    {r4, r5, r7, lr}
0008323e  add     r7, sp, #8
00083240  ldr     r1, [pc, #0x60]
00083242  mov     r4, r0
00083244  ldr     r0, [pc, #0x60]
00083246  add     r1, pc ; -> 0x000fcb00  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x188
00083248  add     r0, pc ; -> 0x000fdb80  
0008324a  ldr     r1, [r1]
0008324c  ldr     r0, [r0]
0008324e  blx     #0xddbfc ; -> objc_msgSend
00083252  ldr     r1, [pc, #0x58]
00083254  add     r1, pc ; -> 0x000fcd58  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3e0
00083256  ldr     r1, [r1]
00083258  blx     #0xddbfc ; -> objc_msgSend
0008325c  cmp     r0, #4
0008325e  beq     #0x83284
00083260  cmp     r0, #3
00083262  beq     #0x8328e
00083264  cmp     r0, #2
00083266  beq     #0x83298
00083268  ldr     r0, [pc, #0x44]
0008326a  add     r0, pc ; -> 0x000f3090  0x0
0008326c  ldr     r0, [r0]
0008326e  mov     r5, r0
00083270  ldm     r5!, {r0, r1, r2, r3}
00083272  mov     ip, r5
00083274  mov     r5, r4
00083276  stm     r5!, {r0, r1, r2, r3}
00083278  ldm.w   ip, {r0, r1}
0008327c  stm.w   r5, {r0, r1}
00083280  mov     r0, r4
00083282  pop     {r4, r5, r7, pc}
00083284  mov     r0, r4
00083286  ldr     r1, [pc, #0x2c]
00083288  blx     #0xdd218 ; -> CGAffineTransformMakeRotation
0008328c  b       #0x83280
0008328e  mov     r0, r4
00083290  ldr     r1, [pc, #0x24]
00083292  blx     #0xdd218 ; -> CGAffineTransformMakeRotation
00083296  b       #0x83280
00083298  mov     r0, r4
0008329a  ldr     r1, [pc, #0x20]
0008329c  blx     #0xdd218 ; -> CGAffineTransformMakeRotation
000832a0  b       #0x83280
000832a2  nop     
000832a4  ldr     r0, [sp, #0x2d8]
000832a6  movs    r7, r0
000832a8  add     r1, sp, #0xd0
000832aa  movs    r7, r0
000832ac  ldr     r3, [sp]
000832ae  movs    r7, r0
000832b0  cdp2    p0, #2, c0, c2, c6, #0
000832b4  ldm     r3!, {r2, r5, r6, r7}
000832b6  lsls    r6, r2
000832b8  lsrs    r3, r3, #0x1f
000832ba  subs    r7, #0xc9
000832bc  lsrs    r3, r3, #0x1f
000832be  stm     r0!, {r0, r3, r6}
