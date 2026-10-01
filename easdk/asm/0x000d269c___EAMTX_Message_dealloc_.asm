========================================================================
-[EAMTX_Message dealloc]  0x000d269c  188 bytes   EAMTX_Message.mm
========================================================================

000d269c  push    {r4, r7, lr}
000d269e  add     r7, sp, #4
000d26a0  sub     sp, #8
000d26a2  ldr     r1, [pc, #0x8c]
000d26a4  movs    r2, #0
000d26a6  mov     r4, r0
000d26a8  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
000d26aa  ldr     r1, [r1]
000d26ac  blx     #0xddbfc ; -> objc_msgSend
000d26b0  ldr     r1, [pc, #0x80]
000d26b2  mov     r0, r4
000d26b4  movs    r2, #0
000d26b6  add     r1, pc ; -> 0x000fd478  
000d26b8  ldr     r1, [r1]
000d26ba  blx     #0xddbfc ; -> objc_msgSend
000d26be  ldr     r1, [pc, #0x78]
000d26c0  mov     r0, r4
000d26c2  movs    r2, #0
000d26c4  add     r1, pc ; -> 0x000fcc48  "S'\x0e"
000d26c6  ldr     r1, [r1]
000d26c8  blx     #0xddbfc ; -> objc_msgSend
000d26cc  ldr     r1, [pc, #0x6c]
000d26ce  mov     r0, r4
000d26d0  movs    r2, #0
000d26d2  add     r1, pc ; -> 0x000fd474  
000d26d4  ldr     r1, [r1]
000d26d6  blx     #0xddbfc ; -> objc_msgSend
000d26da  ldr     r1, [pc, #0x64]
000d26dc  mov     r0, r4
000d26de  movs    r2, #0
000d26e0  add     r1, pc ; -> 0x000fd470  
000d26e2  ldr     r1, [r1]
000d26e4  blx     #0xddbfc ; -> objc_msgSend
000d26e8  ldr     r1, [pc, #0x58]
000d26ea  mov     r0, r4
000d26ec  movs    r2, #0
000d26ee  add     r1, pc ; -> 0x000fd468  
000d26f0  ldr     r1, [r1]
000d26f2  blx     #0xddbfc ; -> objc_msgSend
000d26f6  ldr     r1, [pc, #0x50]
000d26f8  mov     r0, r4
000d26fa  movs    r2, #0
000d26fc  add     r1, pc ; -> 0x000fd46c  
000d26fe  ldr     r1, [r1]
000d2700  blx     #0xddbfc ; -> objc_msgSend
000d2704  ldr     r1, [pc, #0x44]
000d2706  mov     r0, r4
000d2708  movs    r2, #0
000d270a  add     r1, pc ; -> 0x000fd814  'a\r\x0f'
000d270c  ldr     r1, [r1]
000d270e  blx     #0xddbfc ; -> objc_msgSend
000d2712  ldr     r3, [pc, #0x3c]
000d2714  ldr     r1, [pc, #0x3c]
000d2716  mov     r0, sp
000d2718  add     r3, pc ; -> 0x000fddcc  
000d271a  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000d271c  ldr     r3, [r3]
000d271e  ldr     r1, [r1]
000d2720  str     r4, [sp]
000d2722  str     r3, [sp, #4]
000d2724  blx     #0xddc08 ; -> objc_msgSendSuper2
000d2728  sub.w   sp, r7, #4
000d272c  pop     {r4, r7, pc}
000d272e  nop     
000d2730  adr     r5, #0x330
000d2732  movs    r2, r0
000d2734  add     r5, sp, #0x2f8
000d2736  movs    r2, r0
000d2738  adr     r5, #0x200
000d273a  movs    r2, r0
000d273c  add     r5, sp, #0x278
000d273e  movs    r2, r0
000d2740  add     r5, sp, #0x230
000d2742  movs    r2, r0
000d2744  add     r5, sp, #0x1d8
000d2746  movs    r2, r0
000d2748  add     r5, sp, #0x1b0
000d274a  movs    r2, r0
000d274c  cbz     r6, #0xd2750
000d274e  movs    r2, r0
