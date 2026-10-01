========================================================================
t_mot_sweep_hit  0x000ac000  308 bytes   mkboss.c
========================================================================

000ac000  push    {r4, r5, r7, lr}
000ac002  add     r7, sp, #8
000ac004  ldr.w   r3, [r0, #0xa4]
000ac008  movw    r1, #0x42a
000ac00c  mov     r4, r0
000ac00e  adds    r2, r3, #1
000ac010  ldr.w   r5, [r0, #0x108]
000ac014  ldr.w   r3, [r0, r2, lsl #3]
000ac018  cmp     r3, r1
000ac01a  beq     #0xac0a8
000ac01c  ble     #0xac032
000ac01e  movw    r2, #0x42b
000ac022  cmp     r3, r2
000ac024  beq     #0xac0b8
000ac026  adds    r2, #2
000ac028  cmp     r3, r2
000ac02a  beq     #0xac07c
000ac02c  mvn     r0, #2
000ac030  pop     {r4, r5, r7, pc}
000ac032  cbz     r3, #0xac06c
000ac034  cmp.w   r3, #0x428
000ac038  bne     #0xac02c
000ac03a  movs    r3, #4
000ac03c  str     r3, [r5, #0x1c]
000ac03e  ldr.w   r3, [r0, #0xa4]
000ac042  adds    r3, #1
000ac044  str.w   r1, [r0, r3, lsl #3]
000ac048  ldr.w   r3, [r0, #0xa4]
000ac04c  adds    r2, r3, #1
000ac04e  ldr     r3, [pc, #0xcc]
000ac050  str.w   r2, [r0, #0xa4]
000ac054  add     r3, pc ; -> 0x000f37cc  t_mframew
000ac056  ldr     r1, [r3]
000ac058  lsls    r3, r2, #3
000ac05a  adds    r3, r3, r4
000ac05c  movs    r0, #0
000ac05e  str     r1, [r3, #4]
000ac060  ldr.w   r3, [r4, #0xa4]
000ac064  adds    r3, #1
000ac066  str.w   r0, [r4, r3, lsl #3]
000ac06a  b       #0xac030
000ac06c  mov.w   r3, #0x428
000ac070  str.w   r3, [r0, r2, lsl #3]
000ac074  movs    r0, #8
000ac076  str.w   r0, [r4, #0xfc]
000ac07a  b       #0xac030
000ac07c  mov     r0, r5
000ac07e  bl      #0x70f28 ; -> d_front_me_a5
000ac082  ldr     r3, [r5, #0x30]
000ac084  cmp.w   r3, #0x120
000ac088  bge     #0xac0da
000ac08a  ldr.w   r2, [pc, #0x94]
000ac08e  add     r2, pc ; -> 0x000a8891  t_motaro_hip_jump
000ac090  ldr.w   r3, [r4, #0xa4]
000ac094  movs    r0, #0
000ac096  lsls    r3, r3, #3
000ac098  adds    r3, r3, r4
000ac09a  str     r2, [r3, #4]
000ac09c  ldr.w   r3, [r4, #0xa4]
000ac0a0  adds    r3, #1
000ac0a2  str.w   r0, [r4, r3, lsl #3]
000ac0a6  b       #0xac030
000ac0a8  movw    r3, #0x42b
000ac0ac  str.w   r3, [r0, r2, lsl #3]
000ac0b0  movs    r0, #0xa
000ac0b2  str.w   r0, [r4, #0xfc]
000ac0b6  b       #0xac030
000ac0b8  movs    r3, #4
000ac0ba  str     r3, [r5, #0x1c]
000ac0bc  ldr.w   r3, [r0, #0xa4]
000ac0c0  movw    r2, #0x42d
000ac0c4  adds    r3, #1
000ac0c6  str.w   r2, [r0, r3, lsl #3]
000ac0ca  ldr.w   r3, [r0, #0xa4]
000ac0ce  adds    r2, r3, #1
000ac0d0  ldr     r3, [pc, #0x50]
000ac0d2  str.w   r2, [r0, #0xa4]
000ac0d6  add     r3, pc ; -> 0x000f37cc  t_mframew
000ac0d8  b       #0xac056
000ac0da  mov.w   r3, #0x1f4
000ac0de  mov     r0, r5
000ac0e0  str     r3, [r5, #0x1c]
000ac0e2  bl      #0xab6bc ; -> bossrandper
000ac0e6  ldr     r0, [r5, #0x5c]
000ac0e8  cbz     r0, #0xac0f2
000ac0ea  ldr.w   r2, [pc, #0x3c]
000ac0ee  add     r2, pc ; -> 0x000a8891  t_motaro_hip_jump
000ac0f0  b       #0xac090
000ac0f2  ldr.w   r3, [pc, #0x38]
000ac0f6  ldr     r2, [pc, #0x38]
000ac0f8  str     r3, [r5, #0x1c]
000ac0fa  sub.w   r3, r3, #0x10000
000ac0fe  str     r3, [r5, #0x20]
000ac100  movs    r3, #0x1a
000ac102  str     r3, [r5, #0x40]
000ac104  ldr.w   r3, [r4, #0xa4]
000ac108  add     r2, pc ; -> 0x000aa435  t_mhop7
000ac10a  lsls    r3, r3, #3
000ac10c  adds    r3, r3, r4
000ac10e  str     r2, [r3, #4]
000ac110  ldr.w   r3, [r4, #0xa4]
000ac114  adds    r3, #1
000ac116  str.w   r0, [r4, r3, lsl #3]
000ac11a  b       #0xac030
000ac11c  strb    r4, [r6, #0x1d]
000ac11e  movs    r4, r0
000ac120  stm     r7!, {r0, r1, r2, r3, r4, r5, r6, r7}
