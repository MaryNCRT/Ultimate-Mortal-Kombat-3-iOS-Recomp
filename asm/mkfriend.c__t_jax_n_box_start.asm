========================================================================
t_jax_n_box_start  0x000a6d6c  112 bytes   mkfriend.c
========================================================================

000a6d6c  push    {r4, r5, r7, lr}
000a6d6e  add     r7, sp, #8
000a6d70  ldr.w   r3, [r0, #0xa4]
000a6d74  mov     r4, r0
000a6d76  ldr.w   r5, [r0, #0x108]
000a6d7a  adds    r3, #1
000a6d7c  ldr.w   r3, [r0, r3, lsl #3]
000a6d80  cbnz    r3, #0xa6da8
000a6d82  mov     r0, r5
000a6d84  bl      #0x57b6c ; -> center_around_me
000a6d88  ldr     r3, [pc, #0x48]
000a6d8a  mov     r0, r5
000a6d8c  add     r3, pc ; -> 0x00177864  a_crank_box
000a6d8e  str     r3, [r5, #0x40]
000a6d90  bl      #0x59e24 ; -> do_next_a9_frame
000a6d94  ldr.w   r3, [r4, #0xa4]
000a6d98  movs    r2, #0xea
000a6d9a  movs    r0, #0x10
000a6d9c  adds    r3, #1
000a6d9e  str.w   r2, [r4, r3, lsl #3]
000a6da2  str.w   r0, [r4, #0xfc]
000a6da6  pop     {r4, r5, r7, pc}
000a6da8  cmp     r3, #0xea
000a6daa  it      ne
000a6dac  mvnne   r0, #2
000a6db0  bne     #0xa6da6
000a6db2  movs    r3, #6
000a6db4  str     r3, [r5, #0x1c]
000a6db6  ldr     r3, [pc, #0x20]
000a6db8  movs    r0, #0
000a6dba  add     r3, pc ; -> 0x000f37cc  t_mframew
000a6dbc  ldr     r2, [r3]
000a6dbe  ldr.w   r3, [r4, #0xa4]
000a6dc2  lsls    r3, r3, #3
000a6dc4  adds    r3, r3, r4
000a6dc6  str     r2, [r3, #4]
000a6dc8  ldr.w   r3, [r4, #0xa4]
000a6dcc  adds    r3, #1
000a6dce  str.w   r0, [r4, r3, lsl #3]
000a6dd2  b       #0xa6da6
000a6dd4  lsrs    r4, r2, #0xb
000a6dd6  movs    r5, r1
000a6dd8  ldm     r2, {r1, r2, r3}
000a6dda  movs    r4, r0
