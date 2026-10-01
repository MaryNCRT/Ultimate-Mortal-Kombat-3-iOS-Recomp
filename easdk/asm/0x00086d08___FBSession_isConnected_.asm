========================================================================
-[FBSession isConnected]  0x00086d08  20 bytes   FBSession.m
========================================================================

00086d08  ldr     r3, [pc, #0xc]
00086d0a  add     r3, pc ; -> 0x000f5d18  OBJC_IVAR_$_FBSession._sessionKey
00086d0c  ldr     r3, [r3]
00086d0e  ldr     r0, [r0, r3]
00086d10  subs    r0, #0
00086d12  it      ne
00086d14  movne   r0, #1
00086d16  bx      lr
00086d18  and     r0, sl, #6
