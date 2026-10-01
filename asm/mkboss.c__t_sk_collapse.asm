========================================================================
t_sk_collapse  0x000a968c  180 bytes   mkboss.c
========================================================================

000a968c  push    {r4, r5, r7, lr}
000a968e  add     r7, sp, #8
000a9690  ldr.w   r2, [r0, #0xa4]
000a9694  mov     r4, r0
000a9696  ldr.w   r5, [r0, #0x108]
000a969a  adds    r3, r2, #1
000a969c  ldr.w   r0, [r0, r3, lsl #3]
000a96a0  cmp.w   r0, #0x830
000a96a4  beq     #0xa9706
000a96a6  movw    r3, #0x834
000a96aa  cmp     r0, r3
000a96ac  beq     #0xa96ec
000a96ae  cbz     r0, #0xa96b6
000a96b0  mvn     r0, #2
000a96b4  pop     {r4, r5, r7, pc}
000a96b6  ldr     r3, [pc, #0x78]
000a96b8  mov.w   r2, #0x830
000a96bc  str     r3, [r5, #0x40]
000a96be  ldr.w   r3, [r4, #0xa4]
000a96c2  adds    r3, #1
000a96c4  str.w   r2, [r4, r3, lsl #3]
000a96c8  ldr.w   r3, [r4, #0xa4]
000a96cc  adds    r2, r3, #1
000a96ce  ldr.w   r3, [pc, #0x64]
000a96d2  str.w   r2, [r4, #0xa4]
000a96d6  add     r3, pc ; -> 0x000f36d0  t_animate_a9
000a96d8  ldr     r1, [r3]
000a96da  lsls    r3, r2, #3
000a96dc  adds    r3, r3, r4
000a96de  str     r1, [r3, #4]
000a96e0  ldr.w   r3, [r4, #0xa4]
000a96e4  adds    r3, #1
000a96e6  str.w   r0, [r4, r3, lsl #3]
000a96ea  b       #0xa96b4
000a96ec  ldr     r3, [pc, #0x48]
000a96ee  add     r3, pc ; -> 0x000f3724  t_wait_forever
000a96f0  ldr     r1, [r3]
000a96f2  lsls    r3, r2, #3
000a96f4  adds    r3, r3, r4
000a96f6  movs    r0, #0
000a96f8  str     r1, [r3, #4]
000a96fa  ldr.w   r3, [r4, #0xa4]
000a96fe  adds    r3, #1
000a9700  str.w   r0, [r4, r3, lsl #3]
000a9704  b       #0xa96b4
000a9706  mov     r0, r5
000a9708  bl      #0x424fc ; -> shake_n_sound
000a970c  movs    r3, #3
000a970e  str     r3, [r5, #0x1c]
000a9710  ldr.w   r3, [r4, #0xa4]
000a9714  movw    r2, #0x834
000a9718  adds    r3, #1
000a971a  str.w   r2, [r4, r3, lsl #3]
000a971e  ldr.w   r3, [r4, #0xa4]
000a9722  adds    r2, r3, #1
000a9724  ldr     r3, [pc, #0x14]
000a9726  str.w   r2, [r4, #0xa4]
000a972a  add     r3, pc ; -> 0x000f37cc  t_mframew
000a972c  b       #0xa96f0
000a972e  nop     
000a9730  movs    r6, r3
000a9732  movs    r3, r0
000a9734  ldr     r7, [sp, #0x3d8]
000a9736  movs    r4, r0
000a9738  adr     r0, #0xc8
000a973a  movs    r4, r0
000a973c  adr     r0, #0x278
000a973e  movs    r4, r0
