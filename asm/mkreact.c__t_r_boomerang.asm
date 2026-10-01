========================================================================
t_r_boomerang  0x000465b0  188 bytes   mkreact.c
========================================================================

000465b0  push    {r4, r5, r6, r7, lr}
000465b2  add     r7, sp, #0xc
000465b4  ldr.w   r3, [r0, #0xa4]
000465b8  mov     r5, r0
000465ba  ldr.w   r4, [r0, #0x108]
000465be  adds    r3, #1
000465c0  ldr.w   r6, [r0, r3, lsl #3]
000465c4  cmp     r6, #0
000465c6  bne     #0x4662a
000465c8  ldr     r3, [pc, #0x90]
000465ca  mov     r0, r4
000465cc  str     r3, [r4, #0x48]
000465ce  bl      #0x581e0 ; -> shake_a11
000465d2  mov     r0, r4
000465d4  movs    r3, #2
000465d6  str     r3, [r4, #0x1c]
000465d8  bl      #0x580a4 ; -> group_sound
000465dc  mov     r0, r4
000465de  movs    r3, #5
000465e0  str     r3, [r4, #0x1c]
000465e2  bl      #0x57b94 ; -> his_ochar_sound
000465e6  mov     r0, r4
000465e8  movs    r3, #0xb
000465ea  str     r3, [r4, #0x1c]
000465ec  bl      #0x5877c ; -> create_blood_proc
000465f0  ldr     r3, [pc, #0x6c]
000465f2  str     r6, [r4, #0x34]
000465f4  str     r6, [r4, #0x38]
000465f6  add     r3, pc ; -> 0x0004176d  t_airborn_hit_no_sound
000465f8  str     r3, [r4, #0x30]
000465fa  ldr.w   r3, [r5, #0xa4]
000465fe  movw    r2, #0x36a
00046602  mov     r0, r6
00046604  adds    r3, #1
00046606  str.w   r2, [r5, r3, lsl #3]
0004660a  ldr.w   r3, [r5, #0xa4]
0004660e  ldr     r2, [pc, #0x54]
00046610  adds    r3, #1
00046612  str.w   r3, [r5, #0xa4]
00046616  lsls    r3, r3, #3
00046618  adds    r3, r3, r5
0004661a  add     r2, pc ; -> 0x00044b85  t_reaction_start
0004661c  str     r2, [r3, #4]
0004661e  ldr.w   r3, [r5, #0xa4]
00046622  adds    r3, #1
00046624  str.w   r6, [r5, r3, lsl #3]
00046628  pop     {r4, r5, r6, r7, pc}
0004662a  movw    r3, #0x36a
0004662e  cmp     r6, r3
00046630  it      ne
00046632  mvnne   r0, #2
00046636  bne     #0x46628
00046638  mov.w   r3, #0x40000
0004663c  str     r3, [r4, #0x1c]
0004663e  ldr.w   r3, [r5, #0xa4]
00046642  ldr     r2, [pc, #0x24]
00046644  movs    r0, #0
00046646  lsls    r3, r3, #3
00046648  adds    r3, r3, r5
0004664a  add     r2, pc ; -> 0x00043df5  t_stumble_back_vel
0004664c  str     r2, [r3, #4]
0004664e  ldr.w   r3, [r5, #0xa4]
00046652  adds    r3, #1
00046654  str.w   r0, [r5, r3, lsl #3]
00046658  b       #0x46628
0004665a  nop     
0004665c  movs    r6, r0
0004665e  movs    r4, r0
00046660  cbz     r3, #0x46680
