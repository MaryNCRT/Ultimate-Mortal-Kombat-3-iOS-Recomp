========================================================================
t_r_duck_kickl  0x000489c0  296 bytes   mkreact.c
========================================================================

000489c0  push    {r4, r5, r7, lr}
000489c2  add     r7, sp, #8
000489c4  ldr.w   r3, [r0, #0xa4]
000489c8  mov     r4, r0
000489ca  ldr.w   r5, [r0, #0x108]
000489ce  adds    r3, #1
000489d0  movw    r2, #0x692
000489d4  ldr.w   r0, [r0, r3, lsl #3]
000489d8  cmp     r0, r2
000489da  beq     #0x48a44
000489dc  movw    r3, #0x69f
000489e0  cmp     r0, r3
000489e2  beq     #0x48a26
000489e4  cbnz    r0, #0x48a20
000489e6  ldr     r3, [pc, #0xe0]
000489e8  add     r3, pc ; -> 0x000416f5  t_r_airborn_duck_kick
000489ea  str     r3, [r5, #0x30]
000489ec  movs    r3, #1
000489ee  str     r3, [r5, #0x34]
000489f0  ldr     r3, [pc, #0xd8]
000489f2  add     r3, pc ; -> 0x00041681  t_cc_ken_masters
000489f4  str     r3, [r5, #0x38]
000489f6  ldr.w   r3, [r4, #0xa4]
000489fa  adds    r3, #1
000489fc  str.w   r2, [r4, r3, lsl #3]
00048a00  ldr     r2, [pc, #0xcc]
00048a02  ldr.w   r3, [r4, #0xa4]
00048a06  add     r2, pc ; -> 0x00044b85  t_reaction_start
00048a08  adds    r3, #1
00048a0a  str.w   r3, [r4, #0xa4]
00048a0e  lsls    r3, r3, #3
00048a10  adds    r3, r3, r4
00048a12  str     r2, [r3, #4]
00048a14  ldr.w   r3, [r4, #0xa4]
00048a18  adds    r3, #1
00048a1a  str.w   r0, [r4, r3, lsl #3]
00048a1e  b       #0x48a24
00048a20  mvn     r0, #2
00048a24  pop     {r4, r5, r7, pc}
00048a26  mov     r0, r5
00048a28  bl      #0x55c04 ; -> stop_me_player
00048a2c  mov     r0, r5
00048a2e  bl      #0x54ce0 ; -> am_i_joy
00048a32  cmp     r0, #0
00048a34  bne     #0x48aa8
00048a36  ldr.w   r3, [pc, #0x9c]
00048a3a  add     r3, pc ; -> 0x000f372c  t_drone_post_duck_hit
00048a3c  ldr     r2, [r3]
00048a3e  ldr.w   r3, [r4, #0xa4]
00048a42  b       #0x48a0e
00048a44  movs    r1, #7
00048a46  mov     r0, r5
00048a48  bl      #0x57dbc ; -> rsnd_func
00048a4c  mov     r0, r5
00048a4e  bl      #0x420e4 ; -> rsnd_react_voice
00048a52  mov     r0, r5
00048a54  mov.w   r3, #0x30000
00048a58  str     r3, [r5, #0x1c]
00048a5a  bl      #0x55ab0 ; -> away_x_vel
00048a5e  ldr.w   r3, [pc, #0x78]
00048a62  mov     r0, r5
00048a64  str     r3, [r5, #0x40]
00048a66  bl      #0x557e4 ; -> get_my_height
00048a6a  ldr     r3, [r5, #0x20]
00048a6c  movw    r2, #0x69f
00048a70  cmp     r3, #0x80
00048a72  itt     le
00048a74  ldrle.w r3, [pc, #0x64]
00048a78  strle   r3, [r5, #0x40]
00048a7a  ldr.w   r3, [r4, #0xa4]
00048a7e  movs    r0, #0
00048a80  adds    r3, #1
00048a82  str.w   r2, [r4, r3, lsl #3]
00048a86  ldr.w   r3, [r4, #0xa4]
00048a8a  adds    r2, r3, #1
00048a8c  ldr     r3, [pc, #0x50]
00048a8e  str.w   r2, [r4, #0xa4]
00048a92  add     r3, pc ; -> 0x000f36d0  t_animate_a9
00048a94  ldr     r1, [r3]
00048a96  lsls    r3, r2, #3
00048a98  adds    r3, r3, r4
00048a9a  str     r1, [r3, #4]
00048a9c  ldr.w   r3, [r4, #0xa4]
00048aa0  adds    r3, #1
00048aa2  str.w   r0, [r4, r3, lsl #3]
00048aa6  b       #0x48a24
00048aa8  ldr     r3, [pc, #0x38]
00048aaa  movs    r0, #0
00048aac  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00048aae  ldr     r2, [r3]
00048ab0  ldr.w   r3, [r4, #0xa4]
00048ab4  lsls    r3, r3, #3
00048ab6  adds    r3, r3, r4
00048ab8  str     r2, [r3, #4]
00048aba  ldr.w   r3, [r4, #0xa4]
00048abe  adds    r3, #1
00048ac0  str.w   r0, [r4, r3, lsl #3]
00048ac4  b       #0x48a24
00048ac6  nop     
00048ac8  ldrh    r1, [r1, #0x28]
