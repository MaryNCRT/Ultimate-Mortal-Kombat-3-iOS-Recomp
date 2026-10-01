========================================================================
toss_check  0x0002ff04  204 bytes   joy.c
========================================================================

0002ff04  push    {r4, r7, lr}
0002ff06  add     r7, sp, #4
0002ff08  ldr     r3, [r0]
0002ff0a  mov     r4, r0
0002ff0c  ldr     r3, [r3, #4]
0002ff0e  str     r3, [r0, #0x1c]
0002ff10  bl      #0x68e20 ; -> q_is_he_a_boss
0002ff14  ldr     r3, [r4, #0x5c]
0002ff16  cbnz    r3, #0x2ff26
0002ff18  ldr     r3, [pc, #0xa8]
0002ff1a  add     r3, pc ; -> 0x00165650  bt_jump+0x2c
0002ff1c  ldr     r3, [r3]
0002ff1e  ldrh    r2, [r3, #0x1a]
0002ff20  sxth    r3, r2
0002ff22  str     r3, [r4, #0x20]
0002ff24  cbz     r2, #0x2ff2c
0002ff26  movs    r0, #0
0002ff28  str     r0, [r4, #0x5c]
0002ff2a  pop     {r4, r7, pc}
0002ff2c  ldr     r3, [r4]
0002ff2e  ldr     r3, [r3, #4]
0002ff30  ldr     r3, [r3, #0x30]
0002ff32  tst.w   r3, #8
0002ff36  str     r3, [r4, #0x1c]
0002ff38  bne     #0x2ff26
0002ff3a  mov     r0, r4
0002ff3c  bl      #0x55060 ; -> is_he_airborn
0002ff40  cmp     r0, #0
0002ff42  bne     #0x2ff26
0002ff44  mov     r0, r4
0002ff46  bl      #0x2f3a0 ; -> get_x_dist
0002ff4a  ldr     r2, [r4, #0x28]
0002ff4c  ldr     r3, [r4, #0x38]
0002ff4e  cmp     r2, r3
0002ff50  bgt     #0x2ff26
0002ff52  mov     r0, r4
0002ff54  bl      #0x551f0 ; -> am_i_facing_him
0002ff58  cmp     r0, #0
0002ff5a  beq     #0x2ff26
0002ff5c  mov     r0, r4
0002ff5e  bl      #0x54e38 ; -> get_his_action
0002ff62  ldr     r3, [r4, #0x20]
0002ff64  cmp.w   r3, #0x304
0002ff68  beq     #0x2ff26
0002ff6a  mov     r0, r4
0002ff6c  bl      #0x5507c ; -> is_he_joy
0002ff70  ldr     r3, [r4, #0x5c]
0002ff72  cbnz    r3, #0x2ff90
0002ff74  bl      #0x586b0 ; -> random32
0002ff78  ldr     r3, [pc, #0x4c]
0002ff7a  umull   r2, r3, r0, r3
0002ff7e  lsrs    r3, r3, #5
0002ff80  lsls    r2, r3, #2
0002ff82  lsls    r3, r3, #4
0002ff84  add     r3, r2
0002ff86  lsls    r2, r3, #2
0002ff88  adds    r3, r3, r2
0002ff8a  subs    r0, r0, r3
0002ff8c  cmp     r0, #0x32
0002ff8e  bhi     #0x2ff26
0002ff90  mov     r0, r4
0002ff92  bl      #0x54dc0 ; -> get_my_dfe
0002ff96  mov     r0, r4
0002ff98  bl      #0x5517c ; -> is_he_right
0002ff9c  ldr     r3, [r4, #0x5c]
0002ff9e  cbnz    r3, #0x2ffa4
0002ffa0  ldr     r3, [r4, #0x34]
0002ffa2  str     r3, [r4, #0x30]
0002ffa4  ldr     r3, [r4, #0x30]
0002ffa6  cmp     r3, #0x6f
0002ffa8  ble     #0x2ff26
0002ffaa  ldr.w   r1, [pc, #0x20]
0002ffae  mov     r0, r4
0002ffb0  add     r1, pc ; -> 0x000f3898  is_stick_away
0002ffb2  ldr     r1, [r1]
0002ffb4  bl      #0x5712c ; -> call_for_him
0002ffb8  ldr     r3, [r4, #0x5c]
0002ffba  cmp     r3, #0
0002ffbc  bne     #0x2ff26
0002ffbe  movs    r0, #1
0002ffc0  str     r0, [r4, #0x5c]
0002ffc2  b       #0x2ff2a
0002ffc4  ldrsb   r2, [r6, r4]
0002ffc6  movs    r3, r2
0002ffc8  strh    r7, [r3, #0x28]
0002ffca  str     r3, [r5, r7]
0002ffcc  subs    r0, #0xe4
0002ffce  movs    r4, r1
