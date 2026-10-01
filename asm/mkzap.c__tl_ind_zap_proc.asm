========================================================================
tl_ind_zap_proc  0x00076d78  256 bytes   mkzap.c
========================================================================

00076d78  push    {r4, r5, r6, r7, lr}
00076d7a  add     r7, sp, #0xc
00076d7c  str     r8, [sp, #-0x4]!
00076d80  ldr.w   r2, [r0, #0xa4]
00076d84  movw    r8, #0x116b
00076d88  mov     r5, r0
00076d8a  adds    r3, r2, #1
00076d8c  ldr.w   r4, [r0, #0x108]
00076d90  ldr.w   r6, [r0, r3, lsl #3]
00076d94  cmp     r6, r8
00076d96  beq     #0x76e24
00076d98  movw    r3, #0x1176
00076d9c  cmp     r6, r3
00076d9e  beq     #0x76e0a
00076da0  cbz     r6, #0x76dac
00076da2  mvn     r0, #2
00076da6  ldr     r8, [sp], #4
00076daa  pop     {r4, r5, r6, r7, pc}
00076dac  movs    r3, #0x24
00076dae  mov     r0, r4
00076db0  str     r3, [r4, #0x40]
00076db2  subs    r3, #0x21
00076db4  str     r3, [r4, #0x54]
00076db6  bl      #0x554a8 ; -> find_ani_part_a14
00076dba  mov     r0, r4
00076dbc  bl      #0x59e24 ; -> do_next_a9_frame
00076dc0  mov     r0, r4
00076dc2  movs    r3, #1
00076dc4  str     r3, [r4, #0x1c]
00076dc6  bl      #0x57be4 ; -> ochar_sound
00076dca  mov.w   r3, #0xa0000
00076dce  mov     r0, r4
00076dd0  str     r3, [r4, #0x1c]
00076dd2  movs    r3, #4
00076dd4  str     r3, [r4, #0x20]
00076dd6  bl      #0x75d6c ; -> set_proj_vel
00076dda  movs    r3, #0x12
00076ddc  str     r3, [r4, #0x48]
00076dde  ldr.w   r3, [r5, #0xa4]
00076de2  ldr     r2, [pc, #0x84]
00076de4  mov     r0, r6
00076de6  adds    r3, #1
00076de8  add     r2, pc ; -> 0x0007562d  tl_projectile_flight
00076dea  str.w   r8, [r5, r3, lsl #3]
00076dee  ldr.w   r3, [r5, #0xa4]
00076df2  adds    r3, #1
00076df4  str.w   r3, [r5, #0xa4]
00076df8  lsls    r3, r3, #3
00076dfa  adds    r3, r3, r5
00076dfc  str     r2, [r3, #4]
00076dfe  ldr.w   r3, [r5, #0xa4]
00076e02  adds    r3, #1
00076e04  str.w   r6, [r5, r3, lsl #3]
00076e08  b       #0x76da6
00076e0a  ldr.w   r1, [pc, #0x60]
00076e0e  add     r1, pc ; -> 0x00075665  tl_delete_proj_and_die
00076e10  lsls    r3, r2, #3
00076e12  adds    r3, r3, r5
00076e14  movs    r0, #0
00076e16  str     r1, [r3, #4]
00076e18  ldr.w   r3, [r5, #0xa4]
00076e1c  adds    r3, #1
00076e1e  str.w   r0, [r5, r3, lsl #3]
00076e22  b       #0x76da6
00076e24  ldr.w   r3, [pc, #0x48]
00076e28  mov     r0, r4
00076e2a  movs    r6, #4
00076e2c  str     r3, [r4, #0x1c]
00076e2e  bl      #0x57c18 ; -> hob_ochar_sound
00076e32  ldr     r0, [r4, #8]
00076e34  bl      #0x55a60 ; -> stop_a8
00076e38  mov     r0, r4
00076e3a  movs    r3, #0x24
00076e3c  str     r6, [r4, #0x54]
00076e3e  str     r3, [r4, #0x40]
00076e40  bl      #0x554a8 ; -> find_ani_part_a14
00076e44  str     r6, [r4, #0x1c]
00076e46  ldr.w   r3, [r5, #0xa4]
00076e4a  movw    r2, #0x1176
00076e4e  adds    r3, #1
00076e50  str.w   r2, [r5, r3, lsl #3]
00076e54  ldr.w   r3, [r5, #0xa4]
00076e58  adds    r2, r3, #1
00076e5a  ldr.w   r3, [pc, #0x18]
00076e5e  str.w   r2, [r5, #0xa4]
00076e62  add     r3, pc ; -> 0x000f37cc  t_mframew
00076e64  ldr     r1, [r3]
00076e66  b       #0x76e10
00076e68  ttat    pc, r1
00076e6c  ldrex   pc, [r3, #0x3fc]
00076e70  movs    r4, r0
00076e72  movs    r3, r0
00076e74  ldm     r1, {r1, r2, r5, r6}
00076e76  movs    r7, r0
