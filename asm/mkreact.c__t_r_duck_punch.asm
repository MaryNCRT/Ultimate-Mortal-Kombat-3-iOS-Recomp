========================================================================
t_r_duck_punch  0x00048c10  296 bytes   mkreact.c
========================================================================

00048c10  push    {r4, r5, r7, lr}
00048c12  add     r7, sp, #8
00048c14  ldr.w   r3, [r0, #0xa4]
00048c18  mov     r4, r0
00048c1a  ldr.w   r5, [r0, #0x108]
00048c1e  adds    r3, #1
00048c20  movw    r2, #0x643
00048c24  ldr.w   r0, [r0, r3, lsl #3]
00048c28  cmp     r0, r2
00048c2a  beq     #0x48c94
00048c2c  movw    r3, #0x651
00048c30  cmp     r0, r3
00048c32  beq     #0x48c76
00048c34  cbnz    r0, #0x48c70
00048c36  ldr     r3, [pc, #0xe0]
00048c38  add     r3, pc ; -> 0x00042f19  t_r_duck_airpunch
00048c3a  str     r3, [r5, #0x30]
00048c3c  movs    r3, #1
00048c3e  str     r3, [r5, #0x34]
00048c40  ldr     r3, [pc, #0xd8]
00048c42  add     r3, pc ; -> 0x00041681  t_cc_ken_masters
00048c44  str     r3, [r5, #0x38]
00048c46  ldr.w   r3, [r4, #0xa4]
00048c4a  adds    r3, #1
00048c4c  str.w   r2, [r4, r3, lsl #3]
00048c50  ldr     r2, [pc, #0xcc]
00048c52  ldr.w   r3, [r4, #0xa4]
00048c56  add     r2, pc ; -> 0x00044b85  t_reaction_start
00048c58  adds    r3, #1
00048c5a  str.w   r3, [r4, #0xa4]
00048c5e  lsls    r3, r3, #3
00048c60  adds    r3, r3, r4
00048c62  str     r2, [r3, #4]
00048c64  ldr.w   r3, [r4, #0xa4]
00048c68  adds    r3, #1
00048c6a  str.w   r0, [r4, r3, lsl #3]
00048c6e  b       #0x48c74
00048c70  mvn     r0, #2
00048c74  pop     {r4, r5, r7, pc}
00048c76  mov     r0, r5
00048c78  bl      #0x55c04 ; -> stop_me_player
00048c7c  mov     r0, r5
00048c7e  bl      #0x54ce0 ; -> am_i_joy
00048c82  cmp     r0, #0
00048c84  bne     #0x48cf8
00048c86  ldr.w   r3, [pc, #0x9c]
00048c8a  add     r3, pc ; -> 0x000f372c  t_drone_post_duck_hit
00048c8c  ldr     r2, [r3]
00048c8e  ldr.w   r3, [r4, #0xa4]
00048c92  b       #0x48c5e
00048c94  movs    r1, #7
00048c96  mov     r0, r5
00048c98  bl      #0x57dbc ; -> rsnd_func
00048c9c  mov     r0, r5
00048c9e  bl      #0x420e4 ; -> rsnd_react_voice
00048ca2  mov     r0, r5
00048ca4  mov.w   r3, #0x40000
00048ca8  str     r3, [r5, #0x1c]
00048caa  bl      #0x55ab0 ; -> away_x_vel
00048cae  ldr.w   r3, [pc, #0x78]
00048cb2  mov     r0, r5
00048cb4  str     r3, [r5, #0x40]
00048cb6  bl      #0x557e4 ; -> get_my_height
00048cba  ldr     r3, [r5, #0x20]
00048cbc  movw    r2, #0x651
00048cc0  cmp     r3, #0x80
00048cc2  itt     le
00048cc4  ldrle.w r3, [pc, #0x64]
00048cc8  strle   r3, [r5, #0x40]
00048cca  ldr.w   r3, [r4, #0xa4]
00048cce  movs    r0, #0
00048cd0  adds    r3, #1
00048cd2  str.w   r2, [r4, r3, lsl #3]
00048cd6  ldr.w   r3, [r4, #0xa4]
00048cda  adds    r2, r3, #1
00048cdc  ldr     r3, [pc, #0x50]
00048cde  str.w   r2, [r4, #0xa4]
00048ce2  add     r3, pc ; -> 0x000f36d0  t_animate_a9
00048ce4  ldr     r1, [r3]
00048ce6  lsls    r3, r2, #3
00048ce8  adds    r3, r3, r4
00048cea  str     r1, [r3, #4]
00048cec  ldr.w   r3, [r4, #0xa4]
00048cf0  adds    r3, #1
00048cf2  str.w   r0, [r4, r3, lsl #3]
00048cf6  b       #0x48c74
00048cf8  ldr     r3, [pc, #0x38]
00048cfa  movs    r0, #0
00048cfc  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00048cfe  ldr     r2, [r3]
00048d00  ldr.w   r3, [r4, #0xa4]
00048d04  lsls    r3, r3, #3
00048d06  adds    r3, r3, r4
00048d08  str     r2, [r3, #4]
00048d0a  ldr.w   r3, [r4, #0xa4]
00048d0e  adds    r3, #1
00048d10  str.w   r0, [r4, r3, lsl #3]
00048d14  b       #0x48c74
00048d16  nop     
00048d18  adr     r2, #0x374
00048d1a  vshll.u32 q12, d27, #0x1f
