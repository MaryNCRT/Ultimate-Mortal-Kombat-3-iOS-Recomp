========================================================================
t_mhop7  0x000aa434  188 bytes   mkboss.c
========================================================================

000aa434  push    {r4, r5, r7, lr}
000aa436  add     r7, sp, #8
000aa438  ldr.w   r2, [r0, #0xa4]
000aa43c  mov     r4, r0
000aa43e  ldr.w   r5, [r0, #0x108]
000aa442  adds    r3, r2, #1
000aa444  movw    r1, #0x497
000aa448  ldr.w   r0, [r0, r3, lsl #3]
000aa44c  cmp     r0, r1
000aa44e  beq     #0xaa4b0
000aa450  movw    r3, #0x49d
000aa454  cmp     r0, r3
000aa456  beq     #0xaa496
000aa458  cbz     r0, #0xaa460
000aa45a  mvn     r0, #2
000aa45e  pop     {r4, r5, r7, pc}
000aa460  mov.w   r3, #0x8000
000aa464  str     r3, [r5, #0x24]
000aa466  movs    r3, #4
000aa468  str     r3, [r5, #0x28]
000aa46a  ldr.w   r3, [r4, #0xa4]
000aa46e  adds    r3, #1
000aa470  str.w   r1, [r4, r3, lsl #3]
000aa474  ldr.w   r3, [r4, #0xa4]
000aa478  adds    r2, r3, #1
000aa47a  ldr     r3, [pc, #0x68]
000aa47c  str.w   r2, [r4, #0xa4]
000aa480  add     r3, pc ; -> 0x000f3720  t_flight
000aa482  ldr     r1, [r3]
000aa484  lsls    r3, r2, #3
000aa486  adds    r3, r3, r4
000aa488  str     r1, [r3, #4]
000aa48a  ldr.w   r3, [r4, #0xa4]
000aa48e  adds    r3, #1
000aa490  str.w   r0, [r4, r3, lsl #3]
000aa494  b       #0xaa45e
000aa496  ldr     r3, [pc, #0x50]
000aa498  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000aa49a  ldr     r1, [r3]
000aa49c  lsls    r3, r2, #3
000aa49e  adds    r3, r3, r4
000aa4a0  movs    r0, #0
000aa4a2  str     r1, [r3, #4]
000aa4a4  ldr.w   r3, [r4, #0xa4]
000aa4a8  adds    r3, #1
000aa4aa  str.w   r0, [r4, r3, lsl #3]
000aa4ae  b       #0xaa45e
000aa4b0  mov     r0, r5
000aa4b2  bl      #0x424fc ; -> shake_n_sound
000aa4b6  mov     r0, r5
000aa4b8  movs    r3, #0x1a
000aa4ba  str     r3, [r5, #0x40]
000aa4bc  bl      #0x55474 ; -> find_ani_part2
000aa4c0  movs    r3, #3
000aa4c2  str     r3, [r5, #0x1c]
000aa4c4  ldr.w   r3, [r4, #0xa4]
000aa4c8  movw    r2, #0x49d
000aa4cc  adds    r3, #1
000aa4ce  str.w   r2, [r4, r3, lsl #3]
000aa4d2  ldr.w   r3, [r4, #0xa4]
000aa4d6  adds    r2, r3, #1
000aa4d8  ldr     r3, [pc, #0x10]
000aa4da  str.w   r2, [r4, #0xa4]
000aa4de  add     r3, pc ; -> 0x000f37cc  t_mframew
000aa4e0  b       #0xaa49a
000aa4e2  nop     
000aa4e4  str     r2, [sp, #0x270]
000aa4e6  movs    r4, r0
000aa4e8  str     r2, [sp, #0x1b0]
000aa4ea  movs    r4, r0
000aa4ec  str     r2, [sp, #0x3a8]
000aa4ee  movs    r4, r0
