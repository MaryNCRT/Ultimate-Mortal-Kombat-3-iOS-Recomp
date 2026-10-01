========================================================================
-[Social_Info friendsList]  0x000d5e74  16 bytes   Social_Info.mm
========================================================================

000d5e74  ldr     r3, [pc, #8]
000d5e76  add     r3, pc ; -> 0x000fae98  OBJC_IVAR_$_Social_Info.friendsList
000d5e78  ldr     r3, [r3]
000d5e7a  ldr     r0, [r0, r3]
000d5e7c  bx      lr
000d5e7e  nop     
000d5e80  str     r6, [r3, r0]
000d5e82  movs    r2, r0
