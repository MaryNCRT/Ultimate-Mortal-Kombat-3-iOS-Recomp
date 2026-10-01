========================================================================
t_rbomb4  0x00077d7c  312 bytes   mkzap.c
========================================================================

00077d7c  push    {r4, r5, r6, r7, lr}
00077d7e  add     r7, sp, #0xc
00077d80  str     r8, [sp, #-0x4]!
00077d84  ldr.w   r2, [r0, #0xa4]
00077d88  movw    r8, #0xd08
00077d8c  mov     r4, r0
00077d8e  adds    r3, r2, #1
00077d90  ldr.w   r5, [r0, #0x108]
00077d94  ldr.w   r6, [r0, r3, lsl #3]
00077d98  cmp     r6, r8
00077d9a  beq     #0x77e3a
00077d9c  ble     #0x77db6
00077d9e  movw    r3, #0xd0b
00077da2  cmp     r6, r3
00077da4  beq     #0x77e70
00077da6  adds    r3, #2
00077da8  cmp     r6, r3
00077daa  beq     #0x77e20
00077dac  mvn     r0, #2
00077db0  ldr     r8, [sp], #4
00077db4  pop     {r4, r5, r6, r7, pc}
00077db6  cmp     r6, #0
00077db8  bne     #0x77dac
00077dba  movs    r3, #0x20
00077dbc  str     r3, [r5, #0x54]
00077dbe  str.w   r3, [r0, #0x104]
00077dc2  mov     r0, r5
00077dc4  bl      #0x75d6c ; -> set_proj_vel
00077dc8  ldr     r3, [pc, #0xcc]
00077dca  ldr     r2, [r5]
00077dcc  mov     r0, r5
00077dce  add     r3, pc ; -> 0x000f357c  G
00077dd0  ldr     r3, [r3]
00077dd2  ldr.w   r3, [r3, #0xac]
00077dd6  subs    r3, #0x15
00077dd8  str     r3, [r2, #0x40]
00077dda  movs    r3, #3
00077ddc  str     r3, [r5, #0x1c]
00077dde  bl      #0x553a0 ; -> init_anirate
00077de2  mov     r0, r5
00077de4  movs    r3, #4
00077de6  str     r3, [r5, #0x40]
00077de8  bl      #0x55228 ; -> get_char_ani2
00077dec  ldr     r0, [r5, #8]
00077dee  str     r6, [r5, #0x20]
00077df0  ldr.w   r2, [pc, #0xa8]
00077df4  str     r6, [r0, #0x1c]
00077df6  ldr.w   r3, [r4, #0xa4]
00077dfa  add     r2, pc ; -> 0x0007641d  t_bomb_gravity
00077dfc  mov     r0, r6
00077dfe  adds    r3, #1
00077e00  str.w   r8, [r4, r3, lsl #3]
00077e04  ldr.w   r3, [r4, #0xa4]
00077e08  adds    r3, #1
00077e0a  str.w   r3, [r4, #0xa4]
00077e0e  lsls    r3, r3, #3
00077e10  adds    r3, r3, r4
00077e12  str     r2, [r3, #4]
00077e14  ldr.w   r3, [r4, #0xa4]
00077e18  adds    r3, #1
00077e1a  str.w   r6, [r4, r3, lsl #3]
00077e1e  b       #0x77db0
00077e20  ldr.w   r1, [pc, #0x7c]
00077e24  lsls    r3, r2, #3
00077e26  adds    r3, r3, r0
00077e28  add     r1, pc ; -> 0x0007905d  t_bgrav9
00077e2a  str     r1, [r3, #4]
00077e2c  ldr.w   r3, [r0, #0xa4]
00077e30  movs    r0, #0
00077e32  adds    r3, #1
00077e34  str.w   r0, [r4, r3, lsl #3]
00077e38  b       #0x77db0
00077e3a  ldr     r3, [pc, #0x68]
00077e3c  movw    r2, #0xd0b
00077e40  str     r3, [r5, #0x1c]
00077e42  ldr.w   r3, [r0, #0xa4]
00077e46  adds    r3, #1
00077e48  str.w   r2, [r0, r3, lsl #3]
00077e4c  ldr.w   r2, [pc, #0x58]
00077e50  ldr.w   r3, [r0, #0xa4]
00077e54  add     r2, pc ; -> 0x00075385  t_bomb_gravity2
00077e56  adds    r3, #1
00077e58  str.w   r3, [r0, #0xa4]
00077e5c  lsls    r3, r3, #3
00077e5e  adds    r3, r3, r4
00077e60  movs    r0, #0
00077e62  str     r2, [r3, #4]
00077e64  ldr.w   r3, [r4, #0xa4]
00077e68  adds    r3, #1
00077e6a  str.w   r0, [r4, r3, lsl #3]
00077e6e  b       #0x77db0
00077e70  ldr.w   r3, [pc, #0x38]
00077e74  movw    r2, #0xd0d
00077e78  str     r3, [r5, #0x1c]
00077e7a  ldr.w   r3, [r0, #0xa4]
00077e7e  adds    r3, #1
00077e80  str.w   r2, [r0, r3, lsl #3]
00077e84  ldr.w   r2, [pc, #0x28]
00077e88  ldr.w   r3, [r0, #0xa4]
00077e8c  add     r2, pc ; -> 0x00075385  t_bomb_gravity2
00077e8e  adds    r3, #1
00077e90  str.w   r3, [r0, #0xa4]
00077e94  b       #0x77e5c
00077e96  nop     
