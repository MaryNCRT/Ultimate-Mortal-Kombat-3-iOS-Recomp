========================================================================
-[Social_Info isConnected]  0x000d6344  44 bytes   Social_Info.mm
========================================================================

000d6344  push    {r7, lr}
000d6346  add     r7, sp, #0
000d6348  ldr     r3, [pc, #0x1c]
000d634a  add     r3, pc ; -> 0x000fae60  OBJC_IVAR_$_Social_Info.mFacebookAgent
000d634c  ldr     r3, [r3]
000d634e  ldr     r0, [r0, r3]
000d6350  cbz     r0, #0xd6366
000d6352  ldr     r1, [pc, #0x18]
000d6354  add     r1, pc ; -> 0x000fcda4  
000d6356  ldr     r1, [r1]
000d6358  blx     #0xddbfc ; -> objc_msgSend
000d635c  tst.w   r0, #0xff
000d6360  ite     eq
000d6362  moveq   r0, #0
000d6364  movne   r0, #1
000d6366  pop     {r7, pc}
000d6368  ldr     r3, [pc, #0x48]
000d636a  movs    r2, r0
000d636c  ldr     r4, [r1, #0x24]
000d636e  movs    r2, r0
