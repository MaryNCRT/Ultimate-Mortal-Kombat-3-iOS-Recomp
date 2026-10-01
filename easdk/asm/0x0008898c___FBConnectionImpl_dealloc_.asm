========================================================================
-[FBConnectionImpl dealloc]  0x0008898c  68 bytes   FBConnection.mm
========================================================================

0008898c  push    {r4, r7, lr}
0008898e  add     r7, sp, #4
00088990  sub     sp, #8
00088992  ldr     r1, [pc, #0x2c]
00088994  mov     r4, r0
00088996  ldr     r0, [pc, #0x2c]
00088998  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
0008899a  add     r0, pc ; -> 0x00379bcc  m_dialog
0008899c  ldr     r1, [r1]
0008899e  ldr     r0, [r0]
000889a0  blx     #0xddbfc ; -> objc_msgSend
000889a4  ldr     r3, [pc, #0x20]
000889a6  ldr     r1, [pc, #0x24]
000889a8  mov     r0, sp
000889aa  add     r3, pc ; -> 0x000fdd58  
000889ac  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000889ae  ldr     r3, [r3]
000889b0  ldr     r1, [r1]
000889b2  str     r4, [sp]
000889b4  str     r3, [sp, #4]
000889b6  blx     #0xddc08 ; -> objc_msgSendSuper2
000889ba  sub.w   sp, r7, #4
000889be  pop     {r4, r7, pc}
000889c0  subs    r7, #0xe0
000889c2  movs    r7, r0
000889c4  asrs    r6, r5, #8
000889c6  movs    r7, r5
000889c8  strh    r2, [r5, r6]
000889ca  movs    r7, r0
000889cc  subs    r7, #0xf0
000889ce  movs    r7, r0
