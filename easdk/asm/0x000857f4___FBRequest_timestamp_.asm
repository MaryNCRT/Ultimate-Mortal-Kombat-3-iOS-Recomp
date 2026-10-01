========================================================================
-[FBRequest timestamp]  0x000857f4  16 bytes   FBRequest.m
========================================================================

000857f4  ldr     r3, [pc, #8]
000857f6  add     r3, pc ; -> 0x000f59d8  OBJC_IVAR_$_FBRequest._timestamp
000857f8  ldr     r3, [r3]
000857fa  ldr     r0, [r0, r3]
000857fc  bx      lr
000857fe  nop     
00085800  lsls    r6, r3, #7
00085802  movs    r7, r0
