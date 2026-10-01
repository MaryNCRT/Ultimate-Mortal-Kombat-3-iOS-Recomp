========================================================================
-[DMGCatBar unselectAll]  0x000cd5b4  120 bytes   DMGCatBar.mm
========================================================================

000cd5b4  push    {r4, r5, r7, lr}
000cd5b6  add     r7, sp, #8
000cd5b8  ldr     r3, [pc, #0x58]
000cd5ba  ldr     r1, [pc, #0x5c]
000cd5bc  mov     r5, r0
000cd5be  add     r3, pc ; -> 0x000f97f0  OBJC_IVAR_$_DMGCatBar.buttonHot
000cd5c0  add     r1, pc ; -> 0x000fdb1c  "c'\x0f"
000cd5c2  ldr     r3, [r3]
000cd5c4  ldr     r4, [r1]
000cd5c6  movs    r2, #0
000cd5c8  ldr     r0, [r0, r3]
000cd5ca  mov     r1, r4
000cd5cc  blx     #0xddbfc ; -> objc_msgSend
000cd5d0  ldr     r3, [pc, #0x48]
000cd5d2  mov     r1, r4
000cd5d4  movs    r2, #0
000cd5d6  add     r3, pc ; -> 0x000f97ec  OBJC_IVAR_$_DMGCatBar.buttonNew
000cd5d8  ldr     r3, [r3]
000cd5da  ldr     r0, [r5, r3]
000cd5dc  blx     #0xddbfc ; -> objc_msgSend
000cd5e0  ldr     r3, [pc, #0x3c]
000cd5e2  mov     r1, r4
000cd5e4  movs    r2, #0
000cd5e6  add     r3, pc ; -> 0x000f97f4  OBJC_IVAR_$_DMGCatBar.buttonYou
000cd5e8  ldr     r3, [r3]
000cd5ea  ldr     r0, [r5, r3]
000cd5ec  blx     #0xddbfc ; -> objc_msgSend
000cd5f0  ldr     r3, [pc, #0x30]
000cd5f2  mov     r1, r4
000cd5f4  movs    r2, #0
000cd5f6  add     r3, pc ; -> 0x000f97f8  OBJC_IVAR_$_DMGCatBar.buttonAll
000cd5f8  ldr     r3, [r3]
000cd5fa  ldr     r0, [r5, r3]
000cd5fc  blx     #0xddbfc ; -> objc_msgSend
000cd600  ldr     r3, [pc, #0x24]
000cd602  mov     r1, r4
000cd604  movs    r2, #0
000cd606  add     r3, pc ; -> 0x000f97fc  OBJC_IVAR_$_DMGCatBar.buttonSoon
000cd608  ldr     r0, [r3]
000cd60a  ldr     r0, [r5, r0]
000cd60c  blx     #0xddbfc ; -> objc_msgSend
000cd610  pop     {r4, r5, r7, pc}
000cd612  nop     
000cd614  stm     r2!, {r1, r2, r3, r5}
000cd616  movs    r2, r0
000cd618  lsls    r0, r3, #0x15
000cd61a  movs    r3, r0
000cd61c  stm     r2!, {r1, r4}
000cd61e  movs    r2, r0
000cd620  stm     r2!, {r1, r3}
000cd622  movs    r2, r0
000cd624  stm     r1!, {r1, r2, r3, r4, r5, r6, r7}
000cd626  movs    r2, r0
000cd628  stm     r1!, {r1, r4, r5, r6, r7}
000cd62a  movs    r2, r0
