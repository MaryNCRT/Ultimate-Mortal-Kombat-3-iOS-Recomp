========================================================================
-[EAMTX_NewsFeed setCategoryLabel  0x000da420  40 bytes   EAMTX_NewsFeed.m
========================================================================

000da420  push    {r7, lr}
000da422  add     r7, sp, #0
000da424  sub     sp, #8
000da426  mov     r3, r2
000da428  ldr     r2, [pc, #0x18]
000da42a  mov.w   ip, #0
000da42e  add     r2, pc ; -> 0x000fc29c  OBJC_IVAR_$_EAMTX_NewsFeed.categoryLabel
000da430  ldr     r2, [r2]
000da432  str.w   ip, [sp]
000da436  str.w   ip, [sp, #4]
000da43a  blx     #0xddc20 ; -> objc_setProperty
000da43e  sub.w   sp, r7, #0
000da442  pop     {r7, pc}
000da444  subs    r2, r5, #1
000da446  movs    r2, r0
