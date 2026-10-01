========================================================================
-[FacebookAgent setFbApplicationId  0x000dccd0  40 bytes   FacebookAgent.mm
========================================================================

000dccd0  push    {r7, lr}
000dccd2  add     r7, sp, #0
000dccd4  sub     sp, #8
000dccd6  mov     r3, r2
000dccd8  ldr     r2, [pc, #0x18]
000dccda  mov.w   ip, #0
000dccde  add     r2, pc ; -> 0x000fc54c  OBJC_IVAR_$_FacebookAgent.fbApplicationId
000dcce0  ldr     r2, [r2]
000dcce2  str.w   ip, [sp]
000dcce6  str.w   ip, [sp, #4]
000dccea  blx     #0xddc20 ; -> objc_setProperty
000dccee  sub.w   sp, r7, #0
000dccf2  pop     {r7, pc}
