========================================================================
t_r_flip_punch  0x00043a38  228 bytes   mkreact.c
========================================================================

00043a38  push    {r4, r5, r6, r7, lr}
00043a3a  add     r7, sp, #0xc
00043a3c  str     r8, [sp, #-0x4]!
00043a40  ldr.w   r2, [r0, #0xa4]
00043a44  movw    r8, #0xdc3
00043a48  mov     r4, r0
00043a4a  adds    r3, r2, #1
00043a4c  ldr.w   r5, [r0, #0x108]
00043a50  ldr.w   r6, [r0, r3, lsl #3]
00043a54  cmp     r6, r8
00043a56  beq     #0x43ad0
00043a58  movw    r3, #0xdc9
00043a5c  cmp     r6, r3
00043a5e  beq     #0x43ab6
00043a60  cbz     r6, #0x43a6c
00043a62  mvn     r0, #2
00043a66  ldr     r8, [sp], #4
00043a6a  pop     {r4, r5, r6, r7, pc}
00043a6c  mov     r0, r5
00043a6e  bl      #0x420e4 ; -> rsnd_react_voice
00043a72  mov     r0, r5
00043a74  mov.w   r3, #0x40004
00043a78  str     r3, [r5, #0x48]
00043a7a  bl      #0x581e0 ; -> shake_a11
00043a7e  ldr     r3, [pc, #0x88]
00043a80  str     r6, [r5, #0x38]
00043a82  ldr     r2, [pc, #0x88]
00043a84  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
00043a86  str     r3, [r5, #0x30]
00043a88  movs    r3, #1
00043a8a  str     r3, [r5, #0x34]
00043a8c  ldr.w   r3, [r4, #0xa4]
00043a90  add     r2, pc ; -> 0x00044b85  t_reaction_start
00043a92  mov     r0, r6
00043a94  adds    r3, #1
00043a96  str.w   r8, [r4, r3, lsl #3]
00043a9a  ldr.w   r3, [r4, #0xa4]
00043a9e  adds    r3, #1
00043aa0  str.w   r3, [r4, #0xa4]
00043aa4  lsls    r3, r3, #3
00043aa6  adds    r3, r3, r4
00043aa8  str     r2, [r3, #4]
00043aaa  ldr.w   r3, [r4, #0xa4]
00043aae  adds    r3, #1
00043ab0  str.w   r6, [r4, r3, lsl #3]
00043ab4  b       #0x43a66
00043ab6  ldr     r3, [pc, #0x58]
00043ab8  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00043aba  ldr     r1, [r3]
00043abc  lsls    r3, r2, #3
00043abe  adds    r3, r3, r4
00043ac0  movs    r0, #0
00043ac2  str     r1, [r3, #4]
00043ac4  ldr.w   r3, [r4, #0xa4]
00043ac8  adds    r3, #1
00043aca  str.w   r0, [r4, r3, lsl #3]
00043ace  b       #0x43a66
00043ad0  mov     r0, r5
00043ad2  movs    r1, #8
00043ad4  bl      #0x57dbc ; -> rsnd_func
00043ad8  mov     r0, r5
00043ada  mov.w   r3, #0x10000
00043ade  str     r3, [r5, #0x1c]
00043ae0  bl      #0x55ab0 ; -> away_x_vel
00043ae4  ldr     r3, [pc, #0x2c]
00043ae6  movw    r2, #0xdc9
00043aea  str     r3, [r5, #0x40]
00043aec  ldr.w   r3, [r4, #0xa4]
00043af0  adds    r3, #1
00043af2  str.w   r2, [r4, r3, lsl #3]
00043af6  ldr.w   r3, [r4, #0xa4]
00043afa  adds    r2, r3, #1
00043afc  ldr.w   r3, [pc, #0x18]
00043b00  str.w   r2, [r4, #0xa4]
00043b04  add     r3, pc ; -> 0x000f36d0  t_animate_a9
00043b06  b       #0x43aba
00043b08  stcl    p15, c15, [sb, #0x3fc]
00043b0c  asrs    r1, r6, #3
00043b0e  movs    r0, r0
00043b10  mcrr2   p0, #0, r0, ip, c10
00043b14  movs    r4, r3
00043b16  movs    r4, r0
00043b18  smlal   r0, r0, r8, sl
