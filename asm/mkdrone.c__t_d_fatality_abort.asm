========================================================================
t_d_fatality_abort  0x000703c8  64 bytes   mkdrone.c
========================================================================

000703c8  push    {r4, r5, r7, lr}
000703ca  add     r7, sp, #8
000703cc  ldr.w   r3, [r0, #0xa4]
000703d0  mov     r4, r0
000703d2  adds    r3, #1
000703d4  ldr.w   r5, [r0, r3, lsl #3]
000703d8  cbnz    r5, #0x703fc
000703da  bl      #0x2ebdc ; -> reset_proc_stack
000703de  ldr     r3, [pc, #0x24]
000703e0  mov     r0, r5
000703e2  add     r3, pc ; -> 0x000f36e4  t_victory_animation
000703e4  ldr     r2, [r3]
000703e6  ldr.w   r3, [r4, #0xa4]
000703ea  lsls    r3, r3, #3
000703ec  adds    r3, r3, r4
000703ee  str     r2, [r3, #4]
000703f0  ldr.w   r3, [r4, #0xa4]
000703f4  adds    r3, #1
000703f6  str.w   r5, [r4, r3, lsl #3]
000703fa  pop     {r4, r5, r7, pc}
000703fc  mvn     r0, #2
00070400  b       #0x703fa
00070402  nop     
00070404  adds    r2, #0xfe
00070406  movs    r0, r1
