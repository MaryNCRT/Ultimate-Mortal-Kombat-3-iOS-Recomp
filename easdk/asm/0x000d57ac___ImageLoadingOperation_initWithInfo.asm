========================================================================
-[ImageLoadingOperation initWithInfo  0x000d57ac  68 bytes   ImageLoadingOperation.m
========================================================================

000d57ac  push    {r4, r5, r7, lr}
000d57ae  add     r7, sp, #8
000d57b0  sub     sp, #8
000d57b2  ldr     r3, [pc, #0x30]
000d57b4  ldr     r1, [pc, #0x30]
000d57b6  str     r0, [sp]
000d57b8  add     r3, pc ; -> 0x000fdddc  
000d57ba  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d57bc  ldr     r3, [r3]
000d57be  ldr     r1, [r1]
000d57c0  mov     r0, sp
000d57c2  mov     r5, r2
000d57c4  str     r3, [sp, #4]
000d57c6  blx     #0xddc08 ; -> objc_msgSendSuper2
000d57ca  mov     r4, r0
000d57cc  cbz     r0, #0xd57da
000d57ce  ldr     r1, [pc, #0x1c]
000d57d0  mov     r2, r5
000d57d2  add     r1, pc ; -> 0x000fdaa4  
000d57d4  ldr     r1, [r1]
000d57d6  blx     #0xddbfc ; -> objc_msgSend
000d57da  mov     r0, r4
000d57dc  sub.w   sp, r7, #8
000d57e0  pop     {r4, r5, r7, pc}
000d57e2  nop     
000d57e4  strh    r0, [r4, #0x30]
000d57e6  movs    r2, r0
000d57e8  strb    r2, [r0, #7]
000d57ea  movs    r2, r0
000d57ec  strh    r6, [r1, #0x16]
000d57ee  movs    r2, r0
