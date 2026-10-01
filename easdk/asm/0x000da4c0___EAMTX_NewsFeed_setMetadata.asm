========================================================================
-[EAMTX_NewsFeed setMetadata  0x000da4c0  40 bytes   EAMTX_NewsFeed.m
========================================================================

000da4c0  push    {r7, lr}
000da4c2  add     r7, sp, #0
000da4c4  sub     sp, #8
000da4c6  mov     r3, r2
000da4c8  ldr     r2, [pc, #0x18]
000da4ca  mov.w   ip, #0
000da4ce  add     r2, pc ; -> 0x000fc28c  OBJC_IVAR_$_EAMTX_NewsFeed.metadata
000da4d0  ldr     r2, [r2]
000da4d2  str.w   ip, [sp]
000da4d6  str.w   ip, [sp, #4]
000da4da  blx     #0xddc20 ; -> objc_setProperty
000da4de  sub.w   sp, r7, #0
000da4e2  pop     {r7, pc}
000da4e4  adds    r2, r7, #6
000da4e6  movs    r2, r0
