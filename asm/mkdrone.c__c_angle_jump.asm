========================================================================
c_angle_jump  0x00070a18  372 bytes   mkdrone.c
========================================================================

00070a18  push    {r4, r5, r6, r7, lr}
00070a1a  add     r7, sp, #0xc
00070a1c  str     r8, [sp, #-0x4]!
00070a20  ldr.w   r3, [r0, #0xa4]
00070a24  mov     r5, r0
00070a26  ldr.w   r4, [r0, #0x108]
00070a2a  adds    r3, #1
00070a2c  ldr.w   r6, [r0, r3, lsl #3]
00070a30  cbnz    r6, #0x70a64
00070a32  ldr     r3, [pc, #0x128]
00070a34  mov     r0, r4
00070a36  add     r3, pc ; -> 0x00171ebc  rpt_angle
00070a38  str     r3, [r4, #0x1c]
00070a3a  bl      #0x6c9c8 ; -> ask_mr_diff
00070a3e  ldr     r3, [r4, #0x5c]
00070a40  cmp     r3, #0
00070a42  bne     #0x70ab4
00070a44  ldr     r2, [pc, #0x118]
00070a46  add     r2, pc ; -> 0x0006c185  t_return_to_beware
00070a48  ldr.w   r3, [r5, #0xa4]
00070a4c  lsls    r3, r3, #3
00070a4e  adds    r3, r3, r5
00070a50  mov     r0, r6
00070a52  str     r2, [r3, #4]
00070a54  ldr.w   r3, [r5, #0xa4]
00070a58  adds    r3, #1
00070a5a  str.w   r6, [r5, r3, lsl #3]
00070a5e  ldr     r8, [sp], #4
00070a62  pop     {r4, r5, r6, r7, pc}
00070a64  movw    r3, #0xc24
00070a68  cmp     r6, r3
00070a6a  it      ne
00070a6c  mvnne   r0, #2
00070a70  bne     #0x70a5e
00070a72  ldr     r2, [r4, #8]
00070a74  movs    r3, #6
00070a76  str     r3, [r4, #0x1c]
00070a78  ldr     r3, [r2, #0x24]
00070a7a  cmp     r3, #4
00070a7c  str     r3, [r4, #0x20]
00070a7e  beq     #0x70aca
00070a80  movs    r3, #0x19
00070a82  str     r3, [r4, #0x1c]
00070a84  ldr     r3, [r2, #0x24]
00070a86  cmp     r3, #5
00070a88  str     r3, [r4, #0x20]
00070a8a  beq     #0x70ac4
00070a8c  movs    r3, #0x16
00070a8e  str     r3, [r4, #0x1c]
00070a90  ldr     r3, [r2, #0x24]
00070a92  cmp     r3, #0xd
00070a94  str     r3, [r4, #0x20]
00070a96  beq     #0x70b0c
00070a98  ldr     r2, [pc, #0xc8]
00070a9a  add     r2, pc ; -> 0x00067f91  t_d_zap
00070a9c  ldr.w   r3, [r5, #0xa4]
00070aa0  movs    r0, #0
00070aa2  lsls    r3, r3, #3
00070aa4  adds    r3, r3, r5
00070aa6  str     r2, [r3, #4]
00070aa8  ldr.w   r3, [r5, #0xa4]
00070aac  adds    r3, #1
00070aae  str.w   r0, [r5, r3, lsl #3]
00070ab2  b       #0x70a5e
00070ab4  ldr     r3, [r4]
00070ab6  ldr     r3, [r3, #4]
00070ab8  ldr     r3, [r3, #0x18]
00070aba  str     r3, [r4, #0x1c]
00070abc  cbnz    r3, #0x70ad0
00070abe  ldr     r2, [pc, #0xa8]
00070ac0  add     r2, pc ; -> 0x000695f9  t_return_and_4get
00070ac2  b       #0x70a48
00070ac4  ldr     r2, [pc, #0xa4]
00070ac6  add     r2, pc ; -> 0x00069809  t_d_zap_jump
00070ac8  b       #0x70a9c
00070aca  ldr     r2, [pc, #0xa4]
00070acc  add     r2, pc ; -> 0x00069809  t_d_zap_jump
00070ace  b       #0x70a9c
00070ad0  mov     r0, r4
00070ad2  bl      #0x70940 ; -> is_towards_me
00070ad6  ldr.w   r8, [r4, #0x5c]
00070ada  cmp.w   r8, #0
00070ade  beq     #0x70ae6
00070ae0  ldr     r2, [pc, #0x90]
00070ae2  add     r2, pc ; -> 0x0006e5c1  t_caj_towards_me
00070ae4  b       #0x70a48
00070ae6  mov     r0, r4
00070ae8  bl      #0x708a8 ; -> q_is_he_cornered
00070aec  ldr     r6, [r4, #0x5c]
00070aee  cbz     r6, #0x70b14
00070af0  ldr.w   r3, [r5, #0xa4]
00070af4  ldr     r2, [pc, #0x80]
00070af6  mov     r0, r8
00070af8  lsls    r3, r3, #3
00070afa  adds    r3, r3, r5
00070afc  add     r2, pc ; -> 0x0006e501  t_caj_corner
00070afe  str     r2, [r3, #4]
00070b00  ldr.w   r3, [r5, #0xa4]
00070b04  adds    r3, #1
00070b06  str.w   r8, [r5, r3, lsl #3]
00070b0a  b       #0x70a5e
00070b0c  ldr.w   r2, [pc, #0x6c]
00070b10  add     r2, pc ; -> 0x00069789  t_d_lk_hi_zap_jump
00070b12  b       #0x70a9c
00070b14  mov     r0, r4
00070b16  bl      #0x2f3a0 ; -> get_x_dist
00070b1a  ldr     r0, [r4, #0x28]
00070b1c  cmp     r0, #0x5f
00070b1e  bgt     #0x70b2c
00070b20  ldr.w   r2, [pc, #0x5c]
00070b24  ldr.w   r3, [r5, #0xa4]
00070b28  add     r2, pc ; -> 0x00070ea1  t_d_flip_punch_jump
00070b2a  b       #0x70a4c
00070b2c  cmp     r0, #0xaf
00070b2e  ble     #0x70b3a
00070b30  ldr     r2, [pc, #0x50]
00070b32  ldr.w   r3, [r5, #0xa4]
00070b36  add     r2, pc ; -> 0x0006c185  t_return_to_beware
00070b38  b       #0x70a4c
00070b3a  ldr.w   r3, [r5, #0xa4]
00070b3e  movw    r2, #0xc24
00070b42  adds    r3, #1
00070b44  str.w   r2, [r5, r3, lsl #3]
00070b48  ldr.w   r2, [pc, #0x3c]
00070b4c  ldr.w   r3, [r5, #0xa4]
00070b50  add     r2, pc ; -> 0x00069635  t_dont_zap_teles
00070b52  adds    r3, #1
00070b54  str.w   r3, [r5, #0xa4]
00070b58  b       #0x70a4c
00070b5a  nop     
00070b5c  asrs    r2, r0, #0x12
00070b5e  movs    r0, r2
