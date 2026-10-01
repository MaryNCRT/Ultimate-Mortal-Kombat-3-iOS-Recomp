========================================================================
-[Facebook expirationDate]  0x000da508  16 bytes   Facebook.m
========================================================================

000da508  ldr     r3, [pc, #8]
000da50a  add     r3, pc ; -> 0x000fc504  OBJC_IVAR_$_Facebook._expirationDate
000da50c  ldr     r3, [r3]
000da50e  ldr     r0, [r0, r3]
000da510  bx      lr
000da512  nop     
000da514  subs    r6, r6, #7
000da516  movs    r2, r0
