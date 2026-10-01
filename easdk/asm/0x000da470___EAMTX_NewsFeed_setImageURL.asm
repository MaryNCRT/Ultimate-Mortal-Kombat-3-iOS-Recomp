========================================================================
-[EAMTX_NewsFeed setImageURL  0x000da470  40 bytes   EAMTX_NewsFeed.m
========================================================================

000da470  push    {r7, lr}
000da472  add     r7, sp, #0
000da474  sub     sp, #8
000da476  mov     r3, r2
000da478  ldr     r2, [pc, #0x18]
000da47a  mov.w   ip, #0
000da47e  add     r2, pc ; -> 0x000fc294  OBJC_IVAR_$_EAMTX_NewsFeed.imageURL
000da480  ldr     r2, [r2]
000da482  str.w   ip, [sp]
000da486  str.w   ip, [sp, #4]
000da48a  blx     #0xddc20 ; -> objc_setProperty
000da48e  sub.w   sp, r7, #0
000da492  pop     {r7, pc}
000da494  subs    r2, r2, #0
000da496  movs    r2, r0
