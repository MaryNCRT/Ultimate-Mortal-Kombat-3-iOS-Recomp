========================================================================
-[FBPermissionDialog initWithSession  0x000856c0  72 bytes   FBPermissionDialog.m
========================================================================

000856c0  push    {r7, lr}
000856c2  add     r7, sp, #0
000856c4  sub     sp, #8
000856c6  ldr     r3, [pc, #0x30]
000856c8  ldr     r1, [pc, #0x30]
000856ca  str     r0, [sp]
000856cc  add     r3, pc ; -> 0x000fdd44  
000856ce  add     r1, pc ; -> 0x000fccd8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x360
000856d0  ldr     r3, [r3]
000856d2  ldr     r1, [r1]
000856d4  mov     r0, sp
000856d6  str     r3, [sp, #4]
000856d8  blx     #0xddc08 ; -> objc_msgSendSuper2
000856dc  cbz     r0, #0x856f0
000856de  ldr     r3, [pc, #0x20]
000856e0  movs    r2, #0
000856e2  add     r3, pc ; -> 0x000f5674  OBJC_IVAR_$_FBPermissionDialog._permission
000856e4  ldr     r3, [r3]
000856e6  str     r2, [r0, r3]
000856e8  ldr     r3, [pc, #0x18]
000856ea  add     r3, pc ; -> 0x000f5678  OBJC_IVAR_$_FBPermissionDialog._redirectTimer
000856ec  ldr     r3, [r3]
000856ee  str     r2, [r0, r3]
000856f0  sub.w   sp, r7, #0
000856f4  pop     {r7, pc}
000856f6  nop     
000856f8  strh    r4, [r6, #0x32]
000856fa  movs    r7, r0
000856fc  strb    r6, [r0, #0x18]
000856fe  movs    r7, r0
00085700  vaddl.u8 q0, d14, d6
00085704  vaddl.u8 q0, d10, d6
