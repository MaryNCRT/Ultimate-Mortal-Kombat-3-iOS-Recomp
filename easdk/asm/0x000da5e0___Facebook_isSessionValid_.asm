========================================================================
-[Facebook isSessionValid]  0x000da5e0  112 bytes   Facebook.m
========================================================================

000da5e0  push    {r4, r5, r7, lr}
000da5e2  add     r7, sp, #8
000da5e4  ldr     r1, [pc, #0x54]
000da5e6  mov     r4, r0
000da5e8  add     r1, pc ; -> 0x000fd9c8  '\x13\x1c\x0f'
000da5ea  ldr     r1, [r1]
000da5ec  blx     #0xddbfc ; -> objc_msgSend
000da5f0  cbz     r0, #0xda636
000da5f2  ldr     r1, [pc, #0x4c]
000da5f4  mov     r0, r4
000da5f6  add     r1, pc ; -> 0x000fd9a8  
000da5f8  ldr     r5, [r1]
000da5fa  mov     r1, r5
000da5fc  blx     #0xddbfc ; -> objc_msgSend
000da600  cbz     r0, #0xda636
000da602  mov     r1, r5
000da604  mov     r0, r4
000da606  blx     #0xddbfc ; -> objc_msgSend
000da60a  ldr     r1, [pc, #0x38]
000da60c  add     r1, pc ; -> 0x000fd16c  
000da60e  ldr     r4, [r1]
000da610  ldr     r1, [pc, #0x34]
000da612  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000da614  ldr     r1, [r1]
000da616  mov     r5, r0
000da618  ldr     r0, [pc, #0x30]
000da61a  add     r0, pc ; -> 0x000fdbb4  
000da61c  ldr     r0, [r0]
000da61e  blx     #0xddbfc ; -> objc_msgSend
000da622  mov     r1, r4
000da624  mov     r2, r0
000da626  mov     r0, r5
000da628  blx     #0xddbfc ; -> objc_msgSend
000da62c  cmp     r0, #1
000da62e  ite     ne
000da630  movne   r0, #0
000da632  moveq   r0, #1
000da634  b       #0xda638
000da636  movs    r0, #0
000da638  pop     {r4, r5, r7, pc}
000da63a  nop     
000da63c  adds    r3, #0xdc
000da63e  movs    r2, r0
000da640  adds    r3, #0xae
000da642  movs    r2, r0
000da644  cmp     r3, #0x5c
000da646  movs    r2, r0
000da648  movs    r5, #0xb2
000da64a  movs    r2, r0
000da64c  adds    r5, #0x96
000da64e  movs    r2, r0
