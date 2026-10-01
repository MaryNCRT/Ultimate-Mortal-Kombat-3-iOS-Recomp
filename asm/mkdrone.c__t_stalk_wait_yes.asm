========================================================================
t_stalk_wait_yes  0x00072a2c  360 bytes   mkdrone.c
========================================================================

00072a2c  push    {r4, r5, r7, lr}
00072a2e  add     r7, sp, #8
00072a30  ldr.w   r3, [r0, #0xa4]
00072a34  movw    r2, #0x5f4
00072a38  mov     r4, r0
00072a3a  adds    r1, r3, #1
00072a3c  ldr.w   r5, [r0, #0x108]
00072a40  ldr.w   r3, [r0, r1, lsl #3]
00072a44  cmp     r3, r2
00072a46  beq     #0x72ada
00072a48  ble     #0x72a5e
00072a4a  movw    r2, #0x5f5
00072a4e  cmp     r3, r2
00072a50  beq     #0x72b06
00072a52  adds    r2, #2
00072a54  cmp     r3, r2
00072a56  beq     #0x72a94
00072a58  mvn     r0, #2
00072a5c  pop     {r4, r5, r7, pc}
00072a5e  cmp     r3, #0
00072a60  bne     #0x72a58
00072a62  mov     r0, r5
00072a64  bl      #0x55388 ; -> face_opponent
00072a68  mov     r0, r5
00072a6a  bl      #0x72928 ; -> d_walkf_setup
00072a6e  mov     r0, r5
00072a70  bl      #0x551f0 ; -> am_i_facing_him
00072a74  ldr     r0, [r5, #0x5c]
00072a76  cmp     r0, #0
00072a78  bne     #0x72b3e
00072a7a  ldr     r2, [pc, #0x104]
00072a7c  ldr.w   r3, [r4, #0xa4]
00072a80  add     r2, pc ; -> 0x00070675  t_d_turnaround
00072a82  lsls    r3, r3, #3
00072a84  adds    r3, r3, r4
00072a86  str     r2, [r3, #4]
00072a88  ldr.w   r3, [r4, #0xa4]
00072a8c  adds    r3, #1
00072a8e  str.w   r0, [r4, r3, lsl #3]
00072a92  b       #0x72a5c
00072a94  ldr.w   r1, [r0, #0xf8]
00072a98  ldr     r2, [r5, #0x44]
00072a9a  lsls    r3, r1, #2
00072a9c  adds    r3, r3, r0
00072a9e  str.w   r2, [r3, #0xa8]
00072aa2  adds    r3, r1, #1
00072aa4  str.w   r3, [r0, #0xf8]
00072aa8  mov     r0, r5
00072aaa  ldr     r3, [r5, #0x48]
00072aac  blx     r3
00072aae  ldr.w   r3, [r4, #0xf8]
00072ab2  subs    r3, #1
00072ab4  str.w   r3, [r4, #0xf8]
00072ab8  lsls    r3, r3, #2
00072aba  adds    r3, r3, r4
00072abc  ldr.w   r2, [r3, #0xa8]
00072ac0  ldr     r3, [r5, #0x5c]
00072ac2  str     r2, [r5, #0x44]
00072ac4  cmp     r3, #0
00072ac6  beq     #0x72b54
00072ac8  ldr.w   r3, [r4, #0xa4]
00072acc  cmp     r3, #0
00072ace  ble     #0x72b76
00072ad0  subs    r3, #1
00072ad2  movs    r0, #0
00072ad4  str.w   r3, [r4, #0xa4]
00072ad8  b       #0x72a5c
00072ada  movw    r3, #0x5f5
00072ade  str.w   r3, [r0, r1, lsl #3]
00072ae2  ldr.w   r3, [r0, #0xa4]
00072ae6  adds    r2, r3, #1
00072ae8  ldr     r3, [pc, #0x98]
00072aea  str.w   r2, [r0, #0xa4]
00072aee  add     r3, pc ; -> 0x000f37a8  t_check_winner_status
00072af0  ldr     r1, [r3]
00072af2  lsls    r3, r2, #3
00072af4  adds    r3, r3, r0
00072af6  str     r1, [r3, #4]
00072af8  ldr.w   r3, [r0, #0xa4]
00072afc  movs    r0, #0
00072afe  adds    r3, #1
00072b00  str.w   r0, [r4, r3, lsl #3]
00072b04  b       #0x72a5c
00072b06  mov     r0, r5
00072b08  bl      #0x5a680 ; -> next_anirate
00072b0c  ldr.w   r3, [r4, #0xa4]
00072b10  movw    r2, #0x5f7
00072b14  adds    r3, #1
00072b16  str.w   r2, [r4, r3, lsl #3]
00072b1a  ldr.w   r2, [pc, #0x6c]
00072b1e  ldr.w   r3, [r4, #0xa4]
00072b22  add     r2, pc ; -> 0x0006c40d  t_d_beware
00072b24  adds    r3, #1
00072b26  str.w   r3, [r4, #0xa4]
00072b2a  lsls    r3, r3, #3
00072b2c  adds    r3, r3, r4
00072b2e  movs    r0, #0
00072b30  str     r2, [r3, #4]
00072b32  ldr.w   r3, [r4, #0xa4]
00072b36  adds    r3, #1
00072b38  str.w   r0, [r4, r3, lsl #3]
00072b3c  b       #0x72a5c
00072b3e  ldr.w   r3, [r4, #0xa4]
00072b42  movs    r0, #1
00072b44  movw    r2, #0x5f4
00072b48  adds    r3, #1
00072b4a  str.w   r2, [r4, r3, lsl #3]
00072b4e  str.w   r0, [r4, #0xfc]
00072b52  b       #0x72a5c
00072b54  subs    r0, r2, #1
00072b56  str     r0, [r5, #0x44]
00072b58  cmp     r0, #0
00072b5a  bne     #0x72a6e
00072b5c  ldr.w   r3, [r4, #0xa4]
00072b60  cmp     r3, #0
00072b62  ble     #0x72b6c
00072b64  subs    r3, #1
00072b66  str.w   r3, [r4, #0xa4]
00072b6a  b       #0x72a5c
00072b6c  ldr.w   r2, [pc, #0x1c]
00072b70  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00072b72  ldr     r2, [r2]
00072b74  b       #0x72a82
00072b76  ldr.w   r2, [pc, #0x18]
00072b7a  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00072b7c  ldr     r2, [r2]
00072b7e  b       #0x72b2a
00072b80  blt     #0x72b66
