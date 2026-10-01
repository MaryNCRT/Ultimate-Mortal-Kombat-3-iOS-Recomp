========================================================================
-[EAMTX_NewsFeed setMessage  0x000da498  40 bytes   EAMTX_NewsFeed.m
========================================================================

000da498  push    {r7, lr}
000da49a  add     r7, sp, #0
000da49c  sub     sp, #8
000da49e  mov     r3, r2
000da4a0  ldr     r2, [pc, #0x18]
000da4a2  mov.w   ip, #0
000da4a6  add     r2, pc ; -> 0x000fc290  OBJC_IVAR_$_EAMTX_NewsFeed.message
000da4a8  ldr     r2, [r2]
000da4aa  str.w   ip, [sp]
000da4ae  str.w   ip, [sp, #4]
000da4b2  blx     #0xddc20 ; -> objc_setProperty
000da4b6  sub.w   sp, r7, #0
000da4ba  pop     {r7, pc}
000da4bc  adds    r6, r4, #7
000da4be  movs    r2, r0
