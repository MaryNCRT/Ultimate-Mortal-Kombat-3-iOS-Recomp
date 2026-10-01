========================================================================
t_c_zoom_sd  0x000ab988  212 bytes   mkboss.c
========================================================================

000ab988  push    {r4, r5, r6, r7, lr}
000ab98a  add     r7, sp, #0xc
000ab98c  ldr.w   r3, [r0, #0xa4]
000ab990  mov     r5, r0
000ab992  ldr.w   r4, [r0, #0x108]
000ab996  adds    r3, #1
000ab998  ldr.w   r6, [r0, r3, lsl #3]
000ab99c  cbnz    r6, #0xab9ce
000ab99e  mov.w   r3, #0x2bc
000ab9a2  mov     r0, r4
000ab9a4  str     r3, [r4, #0x1c]
000ab9a6  bl      #0xab6bc ; -> bossrandper
000ab9aa  ldr     r3, [r4, #0x5c]
000ab9ac  cmp     r3, #0
000ab9ae  bne     #0xaba0a
000ab9b0  ldr     r3, [pc, #0x94]
000ab9b2  mov     r0, r6
000ab9b4  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000ab9b6  ldr     r2, [r3]
000ab9b8  ldr.w   r3, [r5, #0xa4]
000ab9bc  lsls    r3, r3, #3
000ab9be  adds    r3, r3, r5
000ab9c0  str     r2, [r3, #4]
000ab9c2  ldr.w   r3, [r5, #0xa4]
000ab9c6  adds    r3, #1
000ab9c8  str.w   r6, [r5, r3, lsl #3]
000ab9cc  pop     {r4, r5, r6, r7, pc}
000ab9ce  movw    r3, #0x6ec
000ab9d2  cmp     r6, r3
000ab9d4  it      ne
000ab9d6  mvnne   r0, #2
000ab9da  bne     #0xab9cc
000ab9dc  mov     r0, r4
000ab9de  bl      #0x2f3a0 ; -> get_x_dist
000ab9e2  ldr     r0, [r4, #0x28]
000ab9e4  cmp     r0, #0x70
000ab9e6  bgt     #0xaba04
000ab9e8  ldr     r2, [pc, #0x60]
000ab9ea  add     r2, pc ; -> 0x000aa051  t_motaro_punch
000ab9ec  ldr.w   r3, [r5, #0xa4]
000ab9f0  movs    r0, #0
000ab9f2  lsls    r3, r3, #3
000ab9f4  adds    r3, r3, r5
000ab9f6  str     r2, [r3, #4]
000ab9f8  ldr.w   r3, [r5, #0xa4]
000ab9fc  adds    r3, #1
000ab9fe  str.w   r0, [r5, r3, lsl #3]
000aba02  b       #0xab9cc
000aba04  ldr     r2, [pc, #0x48]
000aba06  add     r2, pc ; -> 0x000aa869  t_motaro_kick
000aba08  b       #0xab9ec
000aba0a  ldr     r3, [pc, #0x48]
000aba0c  movw    r2, #0x6ec
000aba10  mov     r0, r6
000aba12  add     r3, pc ; -> 0x000a89e9  q_heading_down
000aba14  str     r3, [r4, #0x48]
000aba16  movs    r3, #0x40
000aba18  str     r3, [r4, #0x44]
000aba1a  ldr.w   r3, [r5, #0xa4]
000aba1e  adds    r3, #1
000aba20  str.w   r2, [r5, r3, lsl #3]
000aba24  ldr.w   r3, [r5, #0xa4]
000aba28  adds    r2, r3, #1
000aba2a  ldr     r3, [pc, #0x2c]
000aba2c  str.w   r2, [r5, #0xa4]
000aba30  add     r3, pc ; -> 0x000f3290  t_stance_wait_yes
000aba32  ldr     r1, [r3]
000aba34  lsls    r3, r2, #3
000aba36  adds    r3, r3, r5
000aba38  str     r1, [r3, #4]
000aba3a  ldr.w   r3, [r5, #0xa4]
000aba3e  adds    r3, #1
000aba40  str.w   r6, [r5, r3, lsl #3]
000aba44  b       #0xab9cc
000aba46  nop     
000aba48  ldrb    r0, [r6, #9]
000aba4a  movs    r4, r0
000aba4c  b       #0xab716
