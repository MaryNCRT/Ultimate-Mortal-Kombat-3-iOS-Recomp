========================================================================
-[EAMTX_NewsFeed setActionLink  0x000da3f8  40 bytes   EAMTX_NewsFeed.m
========================================================================

000da3f8  push    {r7, lr}
000da3fa  add     r7, sp, #0
000da3fc  sub     sp, #8
000da3fe  mov     r3, r2
000da400  ldr     r2, [pc, #0x18]
000da402  mov.w   ip, #0
000da406  add     r2, pc ; -> 0x000fc2a0  OBJC_IVAR_$_EAMTX_NewsFeed.actionLink
000da408  ldr     r2, [r2]
000da40a  str.w   ip, [sp]
000da40e  str.w   ip, [sp, #4]
000da412  blx     #0xddc20 ; -> objc_setProperty
000da416  sub.w   sp, r7, #0
000da41a  pop     {r7, pc}
000da41c  subs    r6, r2, #2
000da41e  movs    r2, r0
