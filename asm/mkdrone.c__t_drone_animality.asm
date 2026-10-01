========================================================================
t_drone_animality  0x00069274  240 bytes   mkdrone.c
========================================================================

00069274  push    {lr}
00069276  ldr.w   r1, [r0, #0xa4]
0006927a  movw    lr, #0x9f3
0006927e  ldr.w   ip, [r0, #0x108]
00069282  adds    r3, r1, #1
00069284  ldr.w   r2, [r0, r3, lsl #3]
00069288  cmp     r2, lr
0006928a  beq     #0x692fe
0006928c  movw    r3, #0x9f6
00069290  cmp     r2, r3
00069292  beq     #0x692dc
00069294  cbz     r2, #0x6929c
00069296  mvn     r0, #2
0006929a  pop     {pc}
0006929c  ldr.w   r3, [ip, #8]
000692a0  ldr     r1, [pc, #0xa8]
000692a2  ldr     r3, [r3, #0x24]
000692a4  add     r1, pc ; -> 0x00171d9c  ochar_animality_distances
000692a6  ldr.w   r3, [r1, r3, lsl #2]
000692aa  ldr.w   r1, [pc, #0xa4]
000692ae  str.w   r3, [ip, #0x1c]
000692b2  ldr.w   r3, [r0, #0xa4]
000692b6  add     r1, pc ; -> 0x000724d9  t_fatality_align
000692b8  adds    r3, #1
000692ba  str.w   lr, [r0, r3, lsl #3]
000692be  ldr.w   r3, [r0, #0xa4]
000692c2  adds    r3, #1
000692c4  str.w   r3, [r0, #0xa4]
000692c8  lsls    r3, r3, #3
000692ca  adds    r3, r3, r0
000692cc  str     r1, [r3, #4]
000692ce  ldr.w   r3, [r0, #0xa4]
000692d2  adds    r3, #1
000692d4  str.w   r2, [r0, r3, lsl #3]
000692d8  mov     r0, r2
000692da  b       #0x6929a
000692dc  ldr.w   r2, [ip, #0x44]
000692e0  cbnz    r2, #0x69340
000692e2  ldr.w   ip, [pc, #0x70]
000692e6  lsls    r3, r1, #3
000692e8  adds    r3, r3, r0
000692ea  add     ip, pc ; -> 0x000703c9  t_d_fatality_abort
000692ec  str.w   ip, [r3, #4]
000692f0  ldr.w   r3, [r0, #0xa4]
000692f4  adds    r3, #1
000692f6  str.w   r2, [r0, r3, lsl #3]
000692fa  mov     r0, r2
000692fc  b       #0x6929a
000692fe  movs    r3, #0x40
00069300  str.w   r3, [ip, #0x44]
00069304  ldr     r3, [pc, #0x50]
00069306  movw    r2, #0x9f6
0006930a  add     r3, pc ; -> 0x00068ea1  q_is_he_dizzy
0006930c  str.w   r3, [ip, #0x48]
00069310  ldr.w   r3, [r0, #0xa4]
00069314  adds    r3, #1
00069316  str.w   r2, [r0, r3, lsl #3]
0006931a  ldr.w   r3, [r0, #0xa4]
0006931e  ldr.w   r2, [pc, #0x3c]
00069322  adds    r3, #1
00069324  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
00069326  str.w   r3, [r0, #0xa4]
0006932a  lsls    r3, r3, #3
0006932c  adds    r3, r3, r0
0006932e  str     r2, [r3, #4]
00069330  ldr.w   r3, [r0, #0xa4]
00069334  movs    r2, #0
00069336  adds    r3, #1
00069338  str.w   r2, [r0, r3, lsl #3]
0006933c  mov     r0, r2
0006933e  b       #0x6929a
00069340  ldr     r3, [pc, #0x1c]
00069342  add     r3, pc ; -> 0x000f31ac  t_do_animality
00069344  ldr     r2, [r3]
00069346  lsls    r3, r1, #3
00069348  b       #0x6932c
0006934a  nop     
0006934c  ldrh    r4, [r6, #0x16]
0006934e  movs    r0, r2
00069350  str     r2, [sp, #0x7c]
00069352  movs    r0, r0
00069354  strb    r3, [r3, #3]
00069356  movs    r0, r0
00069358  sdiv    pc, r3, pc
0006935c  ldrh    r5, [r7, #0x24]
0006935e  movs    r0, r0
00069360  ldr     r6, [sp, #0x198]
00069362  movs    r0, r1
