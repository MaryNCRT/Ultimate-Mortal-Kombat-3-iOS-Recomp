========================================================================
-[SocialAchievement dealloc]  0x000d8408  128 bytes   SocialAchievement.m
========================================================================

000d8408  push    {r4, r5, r7, lr}
000d840a  add     r7, sp, #8
000d840c  sub     sp, #8
000d840e  ldr     r3, [pc, #0x5c]
000d8410  ldr     r1, [pc, #0x5c]
000d8412  mov     r5, r0
000d8414  add     r3, pc ; -> 0x000fb944  OBJC_IVAR_$_SocialAchievement.achievementTypeCode
000d8416  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d8418  ldr     r3, [r3]
000d841a  ldr     r4, [r1]
000d841c  ldr     r0, [r0, r3]
000d841e  mov     r1, r4
000d8420  blx     #0xddbfc ; -> objc_msgSend
000d8424  ldr     r3, [pc, #0x4c]
000d8426  mov     r1, r4
000d8428  add     r3, pc ; -> 0x000fb940  OBJC_IVAR_$_SocialAchievement.displayDescription
000d842a  ldr     r3, [r3]
000d842c  ldr     r0, [r5, r3]
000d842e  blx     #0xddbfc ; -> objc_msgSend
000d8432  ldr     r3, [pc, #0x44]
000d8434  mov     r1, r4
000d8436  add     r3, pc ; -> 0x000fb93c  OBJC_IVAR_$_SocialAchievement.achievementTypeURI
000d8438  ldr     r3, [r3]
000d843a  ldr     r0, [r5, r3]
000d843c  blx     #0xddbfc ; -> objc_msgSend
000d8440  ldr     r3, [pc, #0x38]
000d8442  mov     r1, r4
000d8444  add     r3, pc ; -> 0x000fb938  OBJC_IVAR_$_SocialAchievement.achievementId
000d8446  ldr     r3, [r3]
000d8448  ldr     r0, [r5, r3]
000d844a  blx     #0xddbfc ; -> objc_msgSend
000d844e  ldr     r3, [pc, #0x30]
000d8450  ldr     r1, [pc, #0x30]
000d8452  mov     r0, sp
000d8454  add     r3, pc ; -> 0x000fddec  
000d8456  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000d8458  ldr     r3, [r3]
000d845a  ldr     r1, [r1]
000d845c  str     r5, [sp]
000d845e  str     r3, [sp, #4]
000d8460  blx     #0xddc08 ; -> objc_msgSendSuper2
000d8464  sub.w   sp, r7, #8
000d8468  pop     {r4, r5, r7, pc}
000d846a  nop     
000d846c  adds    r5, #0x2c
000d846e  movs    r2, r0
000d8470  cmp     r2, ip
000d8472  movs    r2, r0
000d8474  adds    r5, #0x14
000d8476  movs    r2, r0
000d8478  adds    r5, #2
000d847a  movs    r2, r0
000d847c  adds    r4, #0xf0
000d847e  movs    r2, r0
000d8480  ldr     r4, [r2, r6]
000d8482  movs    r2, r0
000d8484  cmp     r6, r8
000d8486  movs    r2, r0
