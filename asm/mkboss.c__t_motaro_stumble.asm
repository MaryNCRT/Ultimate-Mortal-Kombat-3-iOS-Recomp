========================================================================
t_motaro_stumble  0x000a9740  208 bytes   mkboss.c
========================================================================

000a9740  push    {r4, r5, r6, r7, lr}
000a9742  add     r7, sp, #0xc
000a9744  str     r8, [sp, #-0x4]!
000a9748  ldr.w   r2, [r0, #0xa4]
000a974c  movw    r8, #0x816
000a9750  mov     r4, r0
000a9752  adds    r3, r2, #1
000a9754  ldr.w   r5, [r0, #0x108]
000a9758  ldr.w   r6, [r0, r3, lsl #3]
000a975c  cmp     r6, r8
000a975e  beq     #0xa97cc
000a9760  movw    r3, #0x81e
000a9764  cmp     r6, r3
000a9766  beq     #0xa97b2
000a9768  cbz     r6, #0xa9774
000a976a  mvn     r0, #2
000a976e  ldr     r8, [sp], #4
000a9772  pop     {r4, r5, r6, r7, pc}
000a9774  mov     r0, r5
000a9776  mov.w   r3, #0x40000
000a977a  str     r3, [r5, #0x1c]
000a977c  bl      #0x55ab0 ; -> away_x_vel
000a9780  ldr     r3, [pc, #0x7c]
000a9782  mov     r0, r6
000a9784  str     r3, [r5, #0x40]
000a9786  ldr.w   r3, [r4, #0xa4]
000a978a  adds    r3, #1
000a978c  str.w   r8, [r4, r3, lsl #3]
000a9790  ldr.w   r3, [r4, #0xa4]
000a9794  adds    r2, r3, #1
000a9796  ldr     r3, [pc, #0x6c]
000a9798  str.w   r2, [r4, #0xa4]
000a979c  add     r3, pc ; -> 0x000f36d0  t_animate_a9
000a979e  ldr     r1, [r3]
000a97a0  lsls    r3, r2, #3
000a97a2  adds    r3, r3, r4
000a97a4  str     r1, [r3, #4]
000a97a6  ldr.w   r3, [r4, #0xa4]
000a97aa  adds    r3, #1
000a97ac  str.w   r6, [r4, r3, lsl #3]
000a97b0  b       #0xa976e
000a97b2  ldr     r3, [pc, #0x54]
000a97b4  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a97b6  ldr     r1, [r3]
000a97b8  lsls    r3, r2, #3
000a97ba  adds    r3, r3, r4
000a97bc  movs    r0, #0
000a97be  str     r1, [r3, #4]
000a97c0  ldr.w   r3, [r4, #0xa4]
000a97c4  adds    r3, #1
000a97c6  str.w   r0, [r4, r3, lsl #3]
000a97ca  b       #0xa976e
000a97cc  mov     r0, r5
000a97ce  bl      #0x59750 ; -> back_to_normal
000a97d2  mov     r0, r5
000a97d4  movs    r3, #0x10
000a97d6  str     r3, [r5, #0x1c]
000a97d8  str     r3, [r5, #0x20]
000a97da  bl      #0x58764 ; -> randu_minimum
000a97de  ldr     r3, [r5, #0x1c]
000a97e0  movw    r2, #0x81e
000a97e4  str     r3, [r5, #0x44]
000a97e6  ldr.w   r3, [r4, #0xa4]
000a97ea  adds    r3, #1
000a97ec  str.w   r2, [r4, r3, lsl #3]
000a97f0  ldr.w   r3, [r4, #0xa4]
000a97f4  adds    r2, r3, #1
000a97f6  ldr     r3, [pc, #0x14]
000a97f8  str.w   r2, [r4, #0xa4]
000a97fc  add     r3, pc ; -> 0x000f33fc  t_d_stance_pause
000a97fe  b       #0xa97b6
000a9800  movs    r0, r4
000a9802  movs    r4, r0
000a9804  ldr     r7, [sp, #0xc0]
000a9806  movs    r4, r0
000a9808  ldr     r7, [sp, #0x140]
000a980a  movs    r4, r0
000a980c  ldr     r3, [sp, #0x3f0]
000a980e  movs    r4, r0
