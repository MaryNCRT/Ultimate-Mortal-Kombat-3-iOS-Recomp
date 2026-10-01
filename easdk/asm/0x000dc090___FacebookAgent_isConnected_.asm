========================================================================
-[FacebookAgent isConnected]  0x000dc090  36 bytes   FacebookAgent.mm
========================================================================

000dc090  push    {r7, lr}
000dc092  add     r7, sp, #0
000dc094  ldr     r3, [pc, #0x14]
000dc096  add     r3, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dc098  ldr     r3, [r3]
000dc09a  ldr     r0, [r0, r3]
000dc09c  cbz     r0, #0xdc0aa
000dc09e  ldr     r1, [pc, #0x10]
000dc0a0  add     r1, pc ; -> 0x000fd9e0  
000dc0a2  ldr     r1, [r1]
000dc0a4  blx     #0xddbfc ; -> objc_msgSend
000dc0a8  sxtb    r0, r0
000dc0aa  pop     {r7, pc}
000dc0ac  lsrs    r6, r3, #0x20
000dc0ae  movs    r2, r0
000dc0b0  adds    r4, r7, r4
000dc0b2  movs    r2, r0
