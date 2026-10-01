========================================================================
-[Facebook requestWithGraphPath  0x000da8c0  84 bytes   Facebook.m
========================================================================

000da8c0  push    {r4, r5, r6, r7, lr}
000da8c2  add     r7, sp, #0xc
000da8c4  str     r8, [sp, #-0x4]!
000da8c8  sub     sp, #8
000da8ca  ldr     r1, [pc, #0x38]
000da8cc  mov     r6, r0
000da8ce  ldr     r0, [pc, #0x38]
000da8d0  add     r1, pc ; -> 0x000fdabc  
000da8d2  mov     r8, r2
000da8d4  ldr     r4, [r1]
000da8d6  ldr     r1, [pc, #0x34]
000da8d8  add     r0, pc ; -> 0x000fdbf4  
000da8da  mov     r5, r3
000da8dc  add     r1, pc ; -> 0x000fcf30  '\x07G\x0e'
000da8de  ldr     r0, [r0]
000da8e0  ldr     r1, [r1]
000da8e2  blx     #0xddbfc ; -> objc_msgSend
000da8e6  ldr     r2, [pc, #0x28]
000da8e8  mov     r1, r4
000da8ea  str     r5, [sp, #4]
000da8ec  add     r2, pc ; -> 0x0017ea14  
000da8ee  str     r2, [sp]
000da8f0  mov     r2, r8
000da8f2  mov     r3, r0
000da8f4  mov     r0, r6
000da8f6  blx     #0xddbfc ; -> objc_msgSend
000da8fa  sub.w   sp, r7, #0x10
000da8fe  ldr     r8, [sp], #4
000da902  pop     {r4, r5, r6, r7, pc}
000da904  adds    r1, #0xe8
000da906  movs    r2, r0
000da908  adds    r3, #0x18
000da90a  movs    r2, r0
000da90c  movs    r6, #0x50
000da90e  movs    r2, r0
000da910  asrs    r4, r4
000da912  movs    r2, r1
