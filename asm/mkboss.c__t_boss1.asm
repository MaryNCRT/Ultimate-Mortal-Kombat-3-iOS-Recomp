========================================================================
t_boss1  0x000ac5e0  260 bytes   mkboss.c
========================================================================

000ac5e0  push    {r4, r5, r6, r7, lr}
000ac5e2  add     r7, sp, #0xc
000ac5e4  ldr.w   r3, [r0, #0xa4]
000ac5e8  mov     r5, r0
000ac5ea  ldr.w   r4, [r0, #0x108]
000ac5ee  adds    r3, #1
000ac5f0  ldr.w   r6, [r0, r3, lsl #3]
000ac5f4  cbnz    r6, #0xac628
000ac5f6  mov     r0, r4
000ac5f8  bl      #0xa8e88 ; -> q_ok_motaro_sweep
000ac5fc  ldr     r3, [r4, #0x5c]
000ac5fe  cbnz    r3, #0xac62e
000ac600  mov     r0, r4
000ac602  bl      #0x2f3a0 ; -> get_x_dist
000ac606  ldr     r3, [r4, #0x28]
000ac608  cmp     r3, #0x9f
000ac60a  bgt     #0xac65e
000ac60c  ldr.w   r3, [r5, #0xa4]
000ac610  ldr     r2, [pc, #0xbc]
000ac612  movs    r0, #0
000ac614  lsls    r3, r3, #3
000ac616  adds    r3, r3, r5
000ac618  add     r2, pc ; -> 0x000ac419  t_boss_close
000ac61a  str     r2, [r3, #4]
000ac61c  ldr.w   r3, [r5, #0xa4]
000ac620  adds    r3, #1
000ac622  str.w   r0, [r5, r3, lsl #3]
000ac626  b       #0xac62c
000ac628  mvn     r0, #2
000ac62c  pop     {r4, r5, r6, r7, pc}
000ac62e  mov.w   r3, #0x12c
000ac632  mov     r0, r4
000ac634  str     r3, [r4, #0x1c]
000ac636  bl      #0xab6bc ; -> bossrandper
000ac63a  ldr     r3, [r4, #0x5c]
000ac63c  cmp     r3, #0
000ac63e  beq     #0xac600
000ac640  ldr.w   r3, [r5, #0xa4]
000ac644  ldr.w   r2, [pc, #0x8c]
000ac648  mov     r0, r6
000ac64a  lsls    r3, r3, #3
000ac64c  adds    r3, r3, r5
000ac64e  add     r2, pc ; -> 0x000aa211  t_motaro_sweep
000ac650  str     r2, [r3, #4]
000ac652  ldr.w   r3, [r5, #0xa4]
000ac656  adds    r3, #1
000ac658  str.w   r6, [r5, r3, lsl #3]
000ac65c  b       #0xac62c
000ac65e  movs    r3, #0xc8
000ac660  mov     r0, r4
000ac662  str     r3, [r4, #0x1c]
000ac664  bl      #0xab6bc ; -> bossrandper
000ac668  ldr     r6, [r4, #0x5c]
000ac66a  cbz     r6, #0xac6aa
000ac66c  ldr     r3, [pc, #0x68]
000ac66e  movw    r2, #0x147
000ac672  movs    r0, #0
000ac674  add     r3, pc ; -> 0x0017b9d4  funcs.5093
000ac676  str     r3, [r4, #0x68]
000ac678  movs    r3, #2
000ac67a  str     r3, [r4, #0x64]
000ac67c  ldr.w   r3, [r5, #0xa4]
000ac680  adds    r3, #1
000ac682  str.w   r2, [r5, r3, lsl #3]
000ac686  ldr.w   r3, [r5, #0xa4]
000ac68a  adds    r2, r3, #1
000ac68c  ldr.w   r3, [pc, #0x4c]
000ac690  str.w   r2, [r5, #0xa4]
000ac694  add     r3, pc ; -> 0x000f3404  t_random_do
000ac696  ldr     r1, [r3]
000ac698  lsls    r3, r2, #3
000ac69a  adds    r3, r3, r5
000ac69c  str     r1, [r3, #4]
000ac69e  ldr.w   r3, [r5, #0xa4]
000ac6a2  adds    r3, #1
000ac6a4  str.w   r0, [r5, r3, lsl #3]
000ac6a8  b       #0xac62c
000ac6aa  ldr     r3, [pc, #0x34]
000ac6ac  mov     r0, r4
000ac6ae  add     r3, pc ; -> 0x0017b3b4  mhe_motaro_far_attax
000ac6b0  str     r3, [r4, #0x1c]
000ac6b2  bl      #0xa8d34 ; -> get_mhe_long
000ac6b6  ldr.w   r3, [r5, #0xa4]
000ac6ba  ldr     r0, [r4, #0x1c]
000ac6bc  lsls    r3, r3, #3
000ac6be  adds    r3, r3, r5
000ac6c0  str     r0, [r3, #4]
000ac6c2  ldr.w   r3, [r5, #0xa4]
000ac6c6  mov     r0, r6
000ac6c8  adds    r3, #1
000ac6ca  str.w   r6, [r5, r3, lsl #3]
000ac6ce  b       #0xac62c
000ac6d0  ldc2l   p15, c15, [sp, #0x3fc]!
000ac6d4  blt     #0xac656
