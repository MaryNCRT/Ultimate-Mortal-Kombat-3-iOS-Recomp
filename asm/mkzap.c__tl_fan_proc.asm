========================================================================
tl_fan_proc  0x00078c64  448 bytes   mkzap.c
========================================================================

00078c64  push    {r4, r5, r6, r7, lr}
00078c66  add     r7, sp, #0xc
00078c68  str     r8, [sp, #-0x4]!
00078c6c  ldr.w   r3, [r0, #0xa4]
00078c70  movw    r8, #0x5e2
00078c74  mov     r6, r0
00078c76  adds    r3, #1
00078c78  ldr.w   r4, [r0, #0x108]
00078c7c  ldr.w   r5, [r0, r3, lsl #3]
00078c80  cmp     r5, r8
00078c82  beq.w   #0x78d8c
00078c86  ble     #0x78ca0
00078c88  cmp.w   r5, #0x600
00078c8c  beq     #0x78d1a
00078c8e  movw    r3, #0x61b
00078c92  cmp     r5, r3
00078c94  beq     #0x78cf6
00078c96  mvn     r0, #2
00078c9a  ldr     r8, [sp], #4
00078c9e  pop     {r4, r5, r6, r7, pc}
00078ca0  cmp     r5, #0
00078ca2  bne     #0x78c96
00078ca4  movs    r3, #0x24
00078ca6  mov     r0, r4
00078ca8  str     r3, [r4, #0x40]
00078caa  subs    r3, #0x20
00078cac  str     r3, [r4, #0x54]
00078cae  bl      #0x554a8 ; -> find_ani_part_a14
00078cb2  movs    r3, #1
00078cb4  mov     r0, r4
00078cb6  str     r3, [r4, #0x20]
00078cb8  mov.w   r3, #0x80000
00078cbc  str     r3, [r4, #0x1c]
00078cbe  bl      #0x75d6c ; -> set_proj_vel
00078cc2  str     r5, [r4, #0x34]
00078cc4  movs    r3, #0x13
00078cc6  str     r3, [r4, #0x48]
00078cc8  ldr.w   r3, [r6, #0xa4]
00078ccc  ldr.w   r2, [pc, #0x140]
00078cd0  mov     r0, r5
00078cd2  adds    r3, #1
00078cd4  add     r2, pc ; -> 0x00075919  tl_projectile_flight_call
00078cd6  str.w   r8, [r6, r3, lsl #3]
00078cda  ldr.w   r3, [r6, #0xa4]
00078cde  adds    r3, #1
00078ce0  str.w   r3, [r6, #0xa4]
00078ce4  lsls    r3, r3, #3
00078ce6  adds    r3, r3, r6
00078ce8  str     r2, [r3, #4]
00078cea  ldr.w   r3, [r6, #0xa4]
00078cee  adds    r3, #1
00078cf0  str.w   r5, [r6, r3, lsl #3]
00078cf4  b       #0x78c9a
00078cf6  mov     r0, r4
00078cf8  bl      #0x75714 ; -> proj_onscreen_test
00078cfc  cmp     r0, #0
00078cfe  bne     #0x78d70
00078d00  ldr.w   r3, [r6, #0xa4]
00078d04  ldr     r2, [pc, #0x10c]
00078d06  lsls    r3, r3, #3
00078d08  adds    r3, r3, r6
00078d0a  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
00078d0c  str     r2, [r3, #4]
00078d0e  ldr.w   r3, [r6, #0xa4]
00078d12  adds    r3, #1
00078d14  str.w   r0, [r6, r3, lsl #3]
00078d18  b       #0x78c9a
00078d1a  ldr     r0, [r4]
00078d1c  ldr     r0, [r0]
00078d1e  bl      #0x575cc ; -> GetProcFunc
00078d22  ldr     r3, [pc, #0xf4]
00078d24  add     r3, pc ; -> 0x000f33cc  t_rhat_wake
00078d26  ldr     r3, [r3]
00078d28  cmp     r0, r3
00078d2a  beq     #0x78da2
00078d2c  ldr.w   r3, [pc, #0xec]
00078d30  add     r3, pc ; -> 0x000f33c4  t_rhat_sleep
00078d32  ldr     r3, [r3]
00078d34  cmp     r0, r3
00078d36  beq     #0x78da2
00078d38  movs    r3, #5
00078d3a  mov     r0, r4
00078d3c  str     r3, [r4, #0x20]
00078d3e  mov.w   r3, #0xb0000
00078d42  str     r3, [r4, #0x1c]
00078d44  bl      #0x75d6c ; -> set_proj_vel
00078d48  mov     r0, r4
00078d4a  movs    r3, #3
00078d4c  str     r3, [r4, #0x1c]
00078d4e  bl      #0x57be4 ; -> ochar_sound
00078d52  mov     r0, r4
00078d54  movs    r3, #1
00078d56  str     r3, [r4, #0x1c]
00078d58  bl      #0x553a0 ; -> init_anirate
00078d5c  ldr     r2, [pc, #0xc0]
00078d5e  ldr     r3, [r4, #8]
00078d60  str     r2, [r4, #0x20]
00078d62  str     r2, [r3, #0x1c]
00078d64  ldr     r2, [r4, #8]
00078d66  ldr     r3, [r2, #0x18]
00078d68  rsb.w   r3, r3, #0
00078d6c  str     r3, [r2, #0x18]
00078d6e  str     r3, [r4, #0x1c]
00078d70  mov     r0, r4
00078d72  bl      #0x5a680 ; -> next_anirate
00078d76  ldr.w   r3, [r6, #0xa4]
00078d7a  movs    r0, #1
00078d7c  movw    r2, #0x61b
00078d80  adds    r3, #1
00078d82  str.w   r2, [r6, r3, lsl #3]
00078d86  str.w   r0, [r6, #0xfc]
00078d8a  b       #0x78c9a
00078d8c  ldr     r3, [r4, #0x18]
00078d8e  cmp     r3, #0
00078d90  bne     #0x78d48
00078d92  mov     r0, r4
00078d94  adds    r3, #1
00078d96  str     r3, [r4, #0x1c]
00078d98  bl      #0x57be4 ; -> ochar_sound
00078d9c  ldr     r0, [r4, #8]
00078d9e  bl      #0x55a60 ; -> stop_a8
00078da2  ldr     r3, [r4, #8]
00078da4  mov     r0, r4
00078da6  ldrsh.w r2, [r3, #0x12]
00078daa  str     r2, [r4, #0x20]
00078dac  ldr.w   r1, [r6, #0xf8]
00078db0  lsls    r3, r1, #2
00078db2  adds    r3, r3, r6
00078db4  str.w   r2, [r3, #0xa8]
00078db8  adds    r3, r1, #1
00078dba  str.w   r3, [r6, #0xf8]
00078dbe  bl      #0x570f8 ; -> match_me_with_him
00078dc2  mov     r0, r4
00078dc4  bl      #0x55394 ; -> flip_multi
00078dc8  ldr.w   r3, [r6, #0xf8]
00078dcc  mov     r0, r4
00078dce  subs    r3, #1
00078dd0  str.w   r3, [r6, #0xf8]
00078dd4  lsls    r3, r3, #2
00078dd6  adds    r3, r3, r6
00078dd8  ldr     r2, [r4, #8]
00078dda  ldrh.w  r3, [r3, #0xa8]
00078dde  strh    r3, [r2, #0x12]
00078de0  mvn     r3, #0x2f
00078de4  str     r3, [r4, #0x1c]
00078de6  adds    r3, #0x30
00078de8  str     r3, [r4, #0x20]
00078dea  bl      #0x570ac ; -> multi_adjust_xy
00078dee  mov     r0, r4
00078df0  bl      #0x59e24 ; -> do_next_a9_frame
00078df4  mov     r0, r4
00078df6  bl      #0x59e24 ; -> do_next_a9_frame
00078dfa  ldr.w   r3, [r6, #0xa4]
00078dfe  movs    r0, #1
00078e00  mov.w   r2, #0x600
00078e04  adds    r3, #1
00078e06  str.w   r2, [r6, r3, lsl #3]
00078e0a  str.w   r0, [r6, #0xfc]
00078e0e  b       #0x78c9a
00078e10  ldm     r4!, {r0, r6}
