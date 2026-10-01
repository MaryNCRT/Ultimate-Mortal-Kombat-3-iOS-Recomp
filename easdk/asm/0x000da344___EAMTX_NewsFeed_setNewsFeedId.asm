========================================================================
-[EAMTX_NewsFeed setNewsFeedId  0x000da344  16 bytes   EAMTX_NewsFeed.m
========================================================================

000da344  ldr     r3, [pc, #8]
000da346  add     r3, pc ; -> 0x000fc2a4  OBJC_IVAR_$_EAMTX_NewsFeed.newsFeedId
000da348  ldr     r3, [r3]
000da34a  str     r2, [r0, r3]
000da34c  bx      lr
000da34e  nop     
000da350  subs    r2, r3, #5
000da352  movs    r2, r0
