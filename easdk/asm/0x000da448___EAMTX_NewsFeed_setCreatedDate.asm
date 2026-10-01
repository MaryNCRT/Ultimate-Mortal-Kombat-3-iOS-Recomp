========================================================================
-[EAMTX_NewsFeed setCreatedDate  0x000da448  40 bytes   EAMTX_NewsFeed.m
========================================================================

000da448  push    {r7, lr}
000da44a  add     r7, sp, #0
000da44c  sub     sp, #8
000da44e  mov     r3, r2
000da450  ldr     r2, [pc, #0x18]
000da452  mov.w   ip, #0
000da456  add     r2, pc ; -> 0x000fc298  OBJC_IVAR_$_EAMTX_NewsFeed.createdDate
000da458  ldr     r2, [r2]
000da45a  str.w   ip, [sp]
000da45e  str.w   ip, [sp, #4]
000da462  blx     #0xddc20 ; -> objc_setProperty
000da466  sub.w   sp, r7, #0
000da46a  pop     {r7, pc}
000da46c  subs    r6, r7, #0
000da46e  movs    r2, r0
