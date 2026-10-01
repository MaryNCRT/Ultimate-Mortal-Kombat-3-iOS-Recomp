========================================================================
t_motaro_punch  0x000aa050  224 bytes   mkboss.c
========================================================================

000aa050  push    {r4, r5, r6, r7, lr}
000aa052  add     r7, sp, #0xc
000aa054  str     r8, [sp, #-0x4]!
000aa058  ldr.w   r2, [r0, #0xa4]
000aa05c  movw    r8, #0x57e
000aa060  mov     r4, r0
000aa062  adds    r3, r2, #1
000aa064  ldr.w   r5, [r0, #0x108]
000aa068  ldr.w   r6, [r0, r3, lsl #3]
000aa06c  cmp     r6, r8
000aa06e  beq     #0xaa0f4
000aa070  movw    r3, #0x584
000aa074  cmp     r6, r3
000aa076  beq     #0xaa0dc
000aa078  cbz     r6, #0xaa084
000aa07a  mvn     r0, #2
000aa07e  ldr     r8, [sp], #4
000aa082  pop     {r4, r5, r6, r7, pc}
000aa084  mov     r0, r5
000aa086  movs    r3, #2
000aa088  str     r3, [r5, #0x1c]
000aa08a  bl      #0x57be4 ; -> ochar_sound
000aa08e  ldr     r2, [pc, #0x90]
000aa090  str     r6, [r5, #0x1c]
000aa092  str     r6, [r5, #0x20]
000aa094  add     r2, pc ; -> 0x0017b3c4  boss_attack_info
000aa096  str     r2, [r5, #0x38]
000aa098  ldrsh.w r3, [r2]
000aa09c  mov     r0, r6
000aa09e  str     r3, [r5, #0x40]
000aa0a0  ldrsh.w r3, [r2, #2]
000aa0a4  str     r3, [r5, #0x48]
000aa0a6  ldrsh.w r3, [r2, #4]
000aa0aa  str     r3, [r5, #0x1c]
000aa0ac  movs    r3, #3
000aa0ae  str     r3, [r5, #0x44]
000aa0b0  ldr.w   r3, [r4, #0xa4]
000aa0b4  adds    r3, #1
000aa0b6  str.w   r8, [r4, r3, lsl #3]
000aa0ba  ldr.w   r3, [r4, #0xa4]
000aa0be  adds    r2, r3, #1
000aa0c0  ldr     r3, [pc, #0x60]
000aa0c2  str.w   r2, [r4, #0xa4]
000aa0c6  add     r3, pc ; -> 0x000f3880  t_striker
000aa0c8  ldr     r1, [r3]
000aa0ca  lsls    r3, r2, #3
000aa0cc  adds    r3, r3, r4
000aa0ce  str     r1, [r3, #4]
000aa0d0  ldr.w   r3, [r4, #0xa4]
000aa0d4  adds    r3, #1
000aa0d6  str.w   r6, [r4, r3, lsl #3]
000aa0da  b       #0xaa07e
000aa0dc  ldr     r1, [pc, #0x48]
000aa0de  lsls    r3, r2, #3
000aa0e0  adds    r3, r3, r0
000aa0e2  add     r1, pc ; -> 0x000a8929  t_boss_post_hit
000aa0e4  str     r1, [r3, #4]
000aa0e6  ldr.w   r3, [r0, #0xa4]
000aa0ea  movs    r0, #0
000aa0ec  adds    r3, #1
000aa0ee  str.w   r0, [r4, r3, lsl #3]
000aa0f2  b       #0xaa07e
000aa0f4  ldr     r0, [r5, #0x5c]
000aa0f6  cbz     r0, #0xaa108
000aa0f8  movs    r0, #8
000aa0fa  movw    r2, #0x584
000aa0fe  str.w   r2, [r4, r3, lsl #3]
000aa102  str.w   r0, [r4, #0xfc]
000aa106  b       #0xaa07e
000aa108  ldr     r1, [pc, #0x20]
000aa10a  lsls    r3, r2, #3
000aa10c  adds    r3, r3, r4
000aa10e  add     r1, pc ; -> 0x000a895d  t_boss_close_miss
000aa110  str     r1, [r3, #4]
000aa112  ldr.w   r3, [r4, #0xa4]
000aa116  adds    r3, #1
000aa118  str.w   r0, [r4, r3, lsl #3]
000aa11c  b       #0xaa07e
000aa11e  nop     
000aa120  asrs    r4, r5, #0xc
000aa122  movs    r5, r1
000aa124  str     r7, [sp, #0x2d8]
000aa126  movs    r4, r0
000aa128  ttat    pc, r3
000aa12c  ttat    pc, fp
