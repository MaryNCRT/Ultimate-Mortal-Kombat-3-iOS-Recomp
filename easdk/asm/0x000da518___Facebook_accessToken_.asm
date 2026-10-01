========================================================================
-[Facebook accessToken]  0x000da518  16 bytes   Facebook.m
========================================================================

000da518  ldr     r3, [pc, #8]
000da51a  add     r3, pc ; -> 0x000fc508  OBJC_IVAR_$_Facebook._accessToken
000da51c  ldr     r3, [r3]
000da51e  ldr     r0, [r0, r3]
000da520  bx      lr
000da522  nop     
000da524  subs    r2, r5, #7
000da526  movs    r2, r0
