========================================================================
t_joy_duck_entry  0x000319c4  84 bytes   joy.c
========================================================================

000319c4  push    {r4, r5, r6, r7, lr}
000319c6  add     r7, sp, #0xc
000319c8  ldr.w   r3, [r0, #0xa4]
000319cc  mov     r4, r0
000319ce  ldr.w   r5, [r0, #0x108]
000319d2  adds    r3, #1
000319d4  ldr.w   r6, [r0, r3, lsl #3]
000319d8  cbnz    r6, #0x31a0c
000319da  mov     r0, r5
000319dc  movs    r3, #4
000319de  str     r3, [r5, #0x40]
000319e0  bl      #0x5520c ; -> get_char_ani
000319e4  ldr     r3, [r5, #0x40]
000319e6  mov     r0, r5
000319e8  adds    r3, #8
000319ea  str     r3, [r5, #0x40]
000319ec  bl      #0x59e24 ; -> do_next_a9_frame
000319f0  ldr.w   r3, [r4, #0xa4]
000319f4  ldr     r2, [pc, #0x1c]
000319f6  mov     r0, r6
000319f8  lsls    r3, r3, #3
000319fa  adds    r3, r3, r4
000319fc  add     r2, pc ; -> 0x0002ee31  t_joyd3
000319fe  str     r2, [r3, #4]
00031a00  ldr.w   r3, [r4, #0xa4]
00031a04  adds    r3, #1
00031a06  str.w   r6, [r4, r3, lsl #3]
00031a0a  pop     {r4, r5, r6, r7, pc}
00031a0c  mvn     r0, #2
00031a10  b       #0x31a0a
00031a12  nop     
00031a14  bmi     #0x31a7a
