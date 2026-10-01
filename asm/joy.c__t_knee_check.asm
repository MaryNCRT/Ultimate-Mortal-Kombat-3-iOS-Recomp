========================================================================
t_knee_check  0x0002f9d4  256 bytes   joy.c
========================================================================

0002f9d4  push    {r4, r5, r6, r7, lr}
0002f9d6  add     r7, sp, #0xc
0002f9d8  ldr.w   r2, [r0, #0xa4]
0002f9dc  mov     r4, r0
0002f9de  ldr.w   r5, [r0, #0x108]
0002f9e2  adds    r3, r2, #1
0002f9e4  ldr.w   r6, [r0, r3, lsl #3]
0002f9e8  cbnz    r6, #0x2fa08
0002f9ea  mov     r0, r5
0002f9ec  bl      #0x2f3a0 ; -> get_x_dist
0002f9f0  ldr     r3, [r5, #0x28]
0002f9f2  cmp     r3, #0x4a
0002f9f4  ble     #0x2fa2c
0002f9f6  ldr.w   r3, [r4, #0xa4]
0002f9fa  cmp     r3, #0
0002f9fc  ble     #0x2fa8e
0002f9fe  mov     r0, r6
0002fa00  subs    r3, #1
0002fa02  str.w   r3, [r4, #0xa4]
0002fa06  pop     {r4, r5, r6, r7, pc}
0002fa08  cmp.w   r6, #0x1fe
0002fa0c  it      ne
0002fa0e  mvnne   r0, #2
0002fa12  bne     #0x2fa06
0002fa14  ldr     r1, [pc, #0xa8]
0002fa16  add     r1, pc ; -> 0x00030061  t_local_reaction_exit
0002fa18  lsls    r3, r2, #3
0002fa1a  adds    r3, r3, r4
0002fa1c  movs    r0, #0
0002fa1e  str     r1, [r3, #4]
0002fa20  ldr.w   r3, [r4, #0xa4]
0002fa24  adds    r3, #1
0002fa26  str.w   r0, [r4, r3, lsl #3]
0002fa2a  b       #0x2fa06
0002fa2c  mov     r0, r5
0002fa2e  bl      #0x55060 ; -> is_he_airborn
0002fa32  cbz     r0, #0x2fa44
0002fa34  ldr.w   r3, [r4, #0xa4]
0002fa38  cmp     r3, #0
0002fa3a  bgt     #0x2f9fe
0002fa3c  ldr.w   r2, [pc, #0x84]
0002fa40  add     r2, pc ; -> 0x00030061  t_local_reaction_exit
0002fa42  b       #0x2fa94
0002fa44  ldr.w   r3, [r4, #0xa4]
0002fa48  cmp     r3, #0
0002fa4a  ble     #0x2faa8
0002fa4c  subs    r3, #1
0002fa4e  str.w   r3, [r4, #0xa4]
0002fa52  ldr.w   r1, [r4, #0xa4]
0002fa56  adds    r3, r1, #1
0002fa58  lsls    r2, r3, #3
0002fa5a  adds    r2, r2, r4
0002fa5c  ldr     r0, [r2, #4]
0002fa5e  adds    r2, r3, #1
0002fa60  ldr.w   r2, [r4, r2, lsl #3]
0002fa64  str.w   r2, [r4, r3, lsl #3]
0002fa68  lsls    r3, r1, #3
0002fa6a  adds    r3, r3, r4
0002fa6c  mov.w   r2, #0x1fe
0002fa70  str     r0, [r3, #4]
0002fa72  ldr.w   r3, [r4, #0xa4]
0002fa76  adds    r3, #1
0002fa78  str.w   r2, [r4, r3, lsl #3]
0002fa7c  ldr.w   r3, [r4, #0xa4]
0002fa80  adds    r2, r3, #1
0002fa82  ldr     r3, [pc, #0x44]
0002fa84  str.w   r2, [r4, #0xa4]
0002fa88  add     r3, pc ; -> 0x000f38b4  t_do_knee
0002fa8a  ldr     r1, [r3]
0002fa8c  b       #0x2fa18
0002fa8e  ldr.w   r2, [pc, #0x3c]
0002fa92  add     r2, pc ; -> 0x00030061  t_local_reaction_exit
0002fa94  lsls    r3, r3, #3
0002fa96  adds    r3, r3, r4
0002fa98  mov     r0, r6
0002fa9a  str     r2, [r3, #4]
0002fa9c  ldr.w   r3, [r4, #0xa4]
0002faa0  adds    r3, #1
0002faa2  str.w   r6, [r4, r3, lsl #3]
0002faa6  b       #0x2fa06
0002faa8  ldr.w   r2, [pc, #0x24]
0002faac  lsls    r3, r3, #3
0002faae  adds    r3, r3, r4
0002fab0  add     r2, pc ; -> 0x00030061  t_local_reaction_exit
0002fab2  str     r2, [r3, #4]
0002fab4  ldr.w   r3, [r4, #0xa4]
0002fab8  adds    r3, #1
0002faba  str.w   r0, [r4, r3, lsl #3]
0002fabe  b       #0x2fa52
0002fac0  lsls    r7, r0, #0x19
0002fac2  movs    r0, r0
0002fac4  lsls    r5, r3, #0x18
0002fac6  movs    r0, r0
0002fac8  subs    r6, #0x28
0002faca  movs    r4, r1
0002facc  lsls    r3, r1, #0x17
0002face  movs    r0, r0
0002fad0  lsls    r5, r5, #0x16
0002fad2  movs    r0, r0
