========================================================================
t_r_duck_kickh  0x00048ae8  296 bytes   mkreact.c
========================================================================

00048ae8  push    {r4, r5, r7, lr}
00048aea  add     r7, sp, #8
00048aec  ldr.w   r3, [r0, #0xa4]
00048af0  mov     r4, r0
00048af2  ldr.w   r5, [r0, #0x108]
00048af6  adds    r3, #1
00048af8  movw    r2, #0x673
00048afc  ldr.w   r0, [r0, r3, lsl #3]
00048b00  cmp     r0, r2
00048b02  beq     #0x48b6c
00048b04  movw    r3, #0x682
00048b08  cmp     r0, r3
00048b0a  beq     #0x48b4e
00048b0c  cbnz    r0, #0x48b48
00048b0e  ldr     r3, [pc, #0xe0]
00048b10  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
00048b12  str     r3, [r5, #0x30]
00048b14  movs    r3, #1
00048b16  str     r3, [r5, #0x34]
00048b18  ldr     r3, [pc, #0xd8]
00048b1a  add     r3, pc ; -> 0x00041681  t_cc_ken_masters
00048b1c  str     r3, [r5, #0x38]
00048b1e  ldr.w   r3, [r4, #0xa4]
00048b22  adds    r3, #1
00048b24  str.w   r2, [r4, r3, lsl #3]
00048b28  ldr     r2, [pc, #0xcc]
00048b2a  ldr.w   r3, [r4, #0xa4]
00048b2e  add     r2, pc ; -> 0x00044b85  t_reaction_start
00048b30  adds    r3, #1
00048b32  str.w   r3, [r4, #0xa4]
00048b36  lsls    r3, r3, #3
00048b38  adds    r3, r3, r4
00048b3a  str     r2, [r3, #4]
00048b3c  ldr.w   r3, [r4, #0xa4]
00048b40  adds    r3, #1
00048b42  str.w   r0, [r4, r3, lsl #3]
00048b46  b       #0x48b4c
00048b48  mvn     r0, #2
00048b4c  pop     {r4, r5, r7, pc}
00048b4e  mov     r0, r5
00048b50  bl      #0x55c04 ; -> stop_me_player
00048b54  mov     r0, r5
00048b56  bl      #0x54ce0 ; -> am_i_joy
00048b5a  cmp     r0, #0
00048b5c  bne     #0x48bd0
00048b5e  ldr.w   r3, [pc, #0x9c]
00048b62  add     r3, pc ; -> 0x000f372c  t_drone_post_duck_hit
00048b64  ldr     r2, [r3]
00048b66  ldr.w   r3, [r4, #0xa4]
00048b6a  b       #0x48b36
00048b6c  movs    r1, #7
00048b6e  mov     r0, r5
00048b70  bl      #0x57dbc ; -> rsnd_func
00048b74  mov     r0, r5
00048b76  bl      #0x420e4 ; -> rsnd_react_voice
00048b7a  mov     r0, r5
00048b7c  mov.w   r3, #0x48000
00048b80  str     r3, [r5, #0x1c]
00048b82  bl      #0x55ab0 ; -> away_x_vel
00048b86  ldr.w   r3, [pc, #0x78]
00048b8a  mov     r0, r5
00048b8c  str     r3, [r5, #0x40]
00048b8e  bl      #0x557e4 ; -> get_my_height
00048b92  ldr     r3, [r5, #0x20]
00048b94  movw    r2, #0x682
00048b98  cmp     r3, #0x80
00048b9a  itt     le
00048b9c  ldrle.w r3, [pc, #0x64]
00048ba0  strle   r3, [r5, #0x40]
00048ba2  ldr.w   r3, [r4, #0xa4]
00048ba6  movs    r0, #0
00048ba8  adds    r3, #1
00048baa  str.w   r2, [r4, r3, lsl #3]
00048bae  ldr.w   r3, [r4, #0xa4]
00048bb2  adds    r2, r3, #1
00048bb4  ldr     r3, [pc, #0x50]
00048bb6  str.w   r2, [r4, #0xa4]
00048bba  add     r3, pc ; -> 0x000f36d0  t_animate_a9
00048bbc  ldr     r1, [r3]
00048bbe  lsls    r3, r2, #3
00048bc0  adds    r3, r3, r4
00048bc2  str     r1, [r3, #4]
00048bc4  ldr.w   r3, [r4, #0xa4]
00048bc8  adds    r3, #1
00048bca  str.w   r0, [r4, r3, lsl #3]
00048bce  b       #0x48b4c
00048bd0  ldr     r3, [pc, #0x38]
00048bd2  movs    r0, #0
00048bd4  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00048bd6  ldr     r2, [r3]
00048bd8  ldr.w   r3, [r4, #0xa4]
00048bdc  lsls    r3, r3, #3
00048bde  adds    r3, r3, r4
00048be0  str     r2, [r3, #4]
00048be2  ldr.w   r3, [r4, #0xa4]
00048be6  adds    r3, #1
00048be8  str.w   r0, [r4, r3, lsl #3]
00048bec  b       #0x48b4c
00048bee  nop     
00048bf0  ldr     r5, [sp, #0xf4]
00048bf2  vtbx.8  d24, {d15, d16, d17, d18}, d19
