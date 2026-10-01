========================================================================
-[FacebookAgent getFBAccessToken]  0x000dc06c  36 bytes   FacebookAgent.mm
========================================================================

000dc06c  push    {r7, lr}
000dc06e  add     r7, sp, #0
000dc070  ldr     r3, [pc, #0x14]
000dc072  add     r3, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dc074  ldr     r3, [r3]
000dc076  ldr     r0, [r0, r3]
000dc078  cbz     r0, #0xdc084
000dc07a  ldr     r1, [pc, #0x10]
000dc07c  add     r1, pc ; -> 0x000fd9c8  '\x13\x1c\x0f'
000dc07e  ldr     r1, [r1]
000dc080  blx     #0xddbfc ; -> objc_msgSend
000dc084  pop     {r7, pc}
000dc086  nop     
000dc088  lsrs    r2, r0, #1
000dc08a  movs    r2, r0
000dc08c  adds    r0, r1, r5
000dc08e  movs    r2, r0
