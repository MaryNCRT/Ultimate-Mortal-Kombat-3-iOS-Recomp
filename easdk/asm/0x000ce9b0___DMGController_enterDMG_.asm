========================================================================
-[DMGController enterDMG]  0x000ce9b0  116 bytes   DMGController.mm
========================================================================

000ce9b0  push    {r4, r7, lr}
000ce9b2  add     r7, sp, #4
000ce9b4  sub     sp, #0xc
000ce9b6  ldr     r1, [pc, #0x54]
000ce9b8  mov     r4, r0
000ce9ba  add     r1, pc ; -> 0x000fd8ec  'h\x15\x0f'
000ce9bc  ldr     r1, [r1]
000ce9be  blx     #0xddbfc ; -> objc_msgSend
000ce9c2  ldr     r3, [pc, #0x4c]
000ce9c4  ldr     r1, [pc, #0x4c]
000ce9c6  mov     r2, r4
000ce9c8  add     r3, pc ; -> 0x000f9a28  OBJC_IVAR_$_DMGController.dmgView
000ce9ca  add     r1, pc ; -> 0x000fd8e8  'N\x16\x0f'
000ce9cc  ldr     r3, [r3]
000ce9ce  ldr     r1, [r1]
000ce9d0  ldr     r0, [r4, r3]
000ce9d2  blx     #0xddbfc ; -> objc_msgSend
000ce9d6  ldr     r1, [pc, #0x40]
000ce9d8  mov     r0, r4
000ce9da  add     r1, pc ; -> 0x000fd8e4  '\x7f\x15\x0f'
000ce9dc  ldr     r1, [r1]
000ce9de  blx     #0xddbfc ; -> objc_msgSend
000ce9e2  ldr     r3, [pc, #0x38]
000ce9e4  ldr     r1, [pc, #0x38]
000ce9e6  mov     r0, r4
000ce9e8  add     r3, pc ; -> 0x000f9a30  OBJC_IVAR_$_DMGController.mContext
000ce9ea  add     r1, pc ; -> 0x000fd8e0  '\r\x15\x0f'
000ce9ec  ldr     r3, [r3]
000ce9ee  ldr     r1, [r1]
000ce9f0  movw    r2, #0x7531
000ce9f4  ldr     r3, [r4, r3]
000ce9f6  str     r3, [sp]
000ce9f8  movs    r3, #0
000ce9fa  str     r3, [sp, #4]
000ce9fc  str     r3, [sp, #8]
000ce9fe  adds    r3, #4
000cea00  blx     #0xddbfc ; -> objc_msgSend
000cea04  sub.w   sp, r7, #4
000cea08  pop     {r4, r7, pc}
000cea0a  nop     
000cea0c  vhadd.s32 d0, d14, d2
000cea10  add     sp, #0x170
000cea12  movs    r2, r0
000cea14  vhadd.s16 d0, d10, d2
000cea18  vhadd.s8 d0, d6, d2
000cea1c  add     sp, #0x110
000cea1e  movs    r2, r0
000cea20  cdp     p0, #0xf, c0, c2, c2, #0
