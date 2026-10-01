========================================================================
t_r_sk_charge  0x00043878  232 bytes   mkreact.c
========================================================================

00043878  push    {r4, r5, r6, r7, lr}
0004387a  add     r7, sp, #0xc
0004387c  str     r8, [sp, #-0x4]!
00043880  ldr.w   r2, [r0, #0xa4]
00043884  movw    r8, #0x1158
00043888  mov     r4, r0
0004388a  adds    r3, r2, #1
0004388c  ldr.w   r5, [r0, #0x108]
00043890  ldr.w   r6, [r0, r3, lsl #3]
00043894  cmp     r6, r8
00043896  beq     #0x4391c
00043898  movw    r3, #0x115d
0004389c  cmp     r6, r3
0004389e  beq     #0x43902
000438a0  cbz     r6, #0x438ac
000438a2  mvn     r0, #2
000438a6  ldr     r8, [sp], #4
000438aa  pop     {r4, r5, r6, r7, pc}
000438ac  movs    r1, #0xa
000438ae  mov     r0, r5
000438b0  bl      #0x57dbc ; -> rsnd_func
000438b4  mov     r0, r5
000438b6  movs    r3, #2
000438b8  str     r3, [r5, #0x1c]
000438ba  bl      #0x580a4 ; -> group_sound
000438be  mov     r0, r5
000438c0  mov.w   r3, #0x60006
000438c4  str     r3, [r5, #0x48]
000438c6  bl      #0x581e0 ; -> shake_a11
000438ca  ldr     r3, [pc, #0x80]
000438cc  str     r6, [r5, #0x38]
000438ce  ldr     r2, [pc, #0x80]
000438d0  add     r3, pc ; -> 0x0004176d  t_airborn_hit_no_sound
000438d2  str     r3, [r5, #0x30]
000438d4  movs    r3, #6
000438d6  str     r3, [r5, #0x34]
000438d8  ldr.w   r3, [r4, #0xa4]
000438dc  add     r2, pc ; -> 0x00044b85  t_reaction_start
000438de  mov     r0, r6
000438e0  adds    r3, #1
000438e2  str.w   r8, [r4, r3, lsl #3]
000438e6  ldr.w   r3, [r4, #0xa4]
000438ea  adds    r3, #1
000438ec  str.w   r3, [r4, #0xa4]
000438f0  lsls    r3, r3, #3
000438f2  adds    r3, r3, r4
000438f4  str     r2, [r3, #4]
000438f6  ldr.w   r3, [r4, #0xa4]
000438fa  adds    r3, #1
000438fc  str.w   r6, [r4, r3, lsl #3]
00043900  b       #0x438a6
00043902  ldr     r3, [pc, #0x50]
00043904  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00043906  ldr     r1, [r3]
00043908  lsls    r3, r2, #3
0004390a  adds    r3, r3, r4
0004390c  movs    r0, #0
0004390e  str     r1, [r3, #4]
00043910  ldr.w   r3, [r4, #0xa4]
00043914  adds    r3, #1
00043916  str.w   r0, [r4, r3, lsl #3]
0004391a  b       #0x438a6
0004391c  mov     r0, r5
0004391e  mov.w   r3, #0x50000
00043922  str     r3, [r5, #0x1c]
00043924  bl      #0x55ab0 ; -> away_x_vel
00043928  ldr     r3, [pc, #0x2c]
0004392a  movw    r2, #0x115d
0004392e  str     r3, [r5, #0x40]
00043930  ldr.w   r3, [r4, #0xa4]
00043934  adds    r3, #1
00043936  str.w   r2, [r4, r3, lsl #3]
0004393a  ldr.w   r3, [r4, #0xa4]
0004393e  adds    r2, r3, #1
00043940  ldr.w   r3, [pc, #0x18]
00043944  str.w   r2, [r4, #0xa4]
00043948  add     r3, pc ; -> 0x000f36d0  t_animate_a9
0004394a  b       #0x43906
0004394c  udf     #0x99
