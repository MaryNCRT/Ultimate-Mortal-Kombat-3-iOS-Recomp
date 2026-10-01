========================================================================
getObject  0x000d8a8c  64 bytes   SocialUser.m
========================================================================

000d8a8c  push    {r4, r5, r7, lr}
000d8a8e  add     r7, sp, #8
000d8a90  mov     r3, r1
000d8a92  mov     r5, r2
000d8a94  cbz     r0, #0xd8abc
000d8a96  ldr     r1, [pc, #0x28]
000d8a98  mov     r2, r3
000d8a9a  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000d8a9c  ldr     r1, [r1]
000d8a9e  blx     #0xddbfc ; -> objc_msgSend
000d8aa2  mov     r4, r0
000d8aa4  cbz     r0, #0xd8abc
000d8aa6  ldr     r0, [pc, #0x1c]
000d8aa8  ldr     r1, [pc, #0x1c]
000d8aaa  add     r0, pc ; -> 0x000fdc0c  
000d8aac  add     r1, pc ; -> 0x000fcf34  
000d8aae  ldr     r0, [r0]
000d8ab0  ldr     r1, [r1]
000d8ab2  blx     #0xddbfc ; -> objc_msgSend
000d8ab6  cmp     r4, r0
000d8ab8  it      ne
000d8aba  movne   r5, r4
000d8abc  mov     r0, r5
000d8abe  pop     {r4, r5, r7, pc}
000d8ac0  ands    r6, r6
000d8ac2  movs    r2, r0
000d8ac4  str     r6, [r3, r5]
000d8ac6  movs    r2, r0
000d8ac8  add     ip, r0
000d8aca  movs    r2, r0
