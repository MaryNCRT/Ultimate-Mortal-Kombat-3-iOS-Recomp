========================================================================
t_f_jade  0x000a6ec8  300 bytes   mkfriend.c
========================================================================

000a6ec8  push    {r4, r5, r6, r7, lr}
000a6eca  add     r7, sp, #0xc
000a6ecc  ldr.w   r3, [r0, #0xa4]
000a6ed0  movw    r2, #0x13b
000a6ed4  mov     r5, r0
000a6ed6  adds    r3, #1
000a6ed8  ldr.w   r4, [r0, #0x108]
000a6edc  ldr.w   r6, [r0, r3, lsl #3]
000a6ee0  cmp     r6, r2
000a6ee2  beq     #0xa6f10
000a6ee4  ble     #0xa6efa
000a6ee6  movw    r3, #0x149
000a6eea  cmp     r6, r3
000a6eec  beq     #0xa6fb6
000a6eee  adds    r3, #6
000a6ef0  cmp     r6, r3
000a6ef2  beq     #0xa6f22
000a6ef4  mvn     r0, #2
000a6ef8  b       #0xa6f6e
000a6efa  cmp     r6, #0
000a6efc  beq     #0xa6f70
000a6efe  cmp.w   r6, #0x13a
000a6f02  bne     #0xa6ef4
000a6f04  str.w   r2, [r0, r3, lsl #3]
000a6f08  movs    r0, #0x10
000a6f0a  str.w   r0, [r5, #0xfc]
000a6f0e  b       #0xa6f6e
000a6f10  ldr     r1, [pc, #0xcc]
000a6f12  mov     r0, r4
000a6f14  add     r1, pc ; -> 0x000a58b1  t_friend_ender
000a6f16  bl      #0x58a10 ; -> NewThread
000a6f1a  ldr     r2, [r4, #0x40]
000a6f1c  subs    r3, r2, #4
000a6f1e  str     r2, [r4, #0x48]
000a6f20  str     r3, [r4, #0x44]
000a6f22  ldr     r3, [r4, #0x48]
000a6f24  mov     r0, r4
000a6f26  str     r3, [r4, #0x40]
000a6f28  bl      #0x59e24 ; -> do_next_a9_frame
000a6f2c  ldr     r3, [pc, #0xb4]
000a6f2e  movs    r0, #0
000a6f30  str     r0, [r4, #0x1c]
000a6f32  movw    r2, #0x149
000a6f36  str     r3, [r4, #0x20]
000a6f38  add.w   r3, r3, #0xa9000
000a6f3c  str     r3, [r4, #0x24]
000a6f3e  movw    r3, #0xfff
000a6f42  str     r3, [r4, #0x28]
000a6f44  ldr.w   r3, [r5, #0xa4]
000a6f48  adds    r3, #1
000a6f4a  str.w   r2, [r5, r3, lsl #3]
000a6f4e  ldr.w   r3, [r5, #0xa4]
000a6f52  adds    r2, r3, #1
000a6f54  ldr     r3, [pc, #0x90]
000a6f56  str.w   r2, [r5, #0xa4]
000a6f5a  add     r3, pc ; -> 0x000f3720  t_flight
000a6f5c  ldr     r1, [r3]
000a6f5e  lsls    r3, r2, #3
000a6f60  adds    r3, r3, r5
000a6f62  str     r1, [r3, #4]
000a6f64  ldr.w   r3, [r5, #0xa4]
000a6f68  adds    r3, #1
000a6f6a  str.w   r0, [r5, r3, lsl #3]
000a6f6e  pop     {r4, r5, r6, r7, pc}
000a6f70  mov     r0, r4
000a6f72  bl      #0xa0fbc ; -> kill_and_stop_scrolling
000a6f76  mov     r0, r4
000a6f78  movs    r3, #0xd
000a6f7a  str     r3, [r4, #0x40]
000a6f7c  bl      #0x55228 ; -> get_char_ani2
000a6f80  ldr     r3, [pc, #0x68]
000a6f82  mov.w   r2, #0x13a
000a6f86  mov     r0, r6
000a6f88  str     r3, [r4, #0x1c]
000a6f8a  ldr.w   r3, [r5, #0xa4]
000a6f8e  adds    r3, #1
000a6f90  str.w   r2, [r5, r3, lsl #3]
000a6f94  ldr.w   r3, [r5, #0xa4]
000a6f98  adds    r2, r3, #1
000a6f9a  ldr     r3, [pc, #0x54]
000a6f9c  str.w   r2, [r5, #0xa4]
000a6fa0  add     r3, pc ; -> 0x000f36b8  t_animate_a0_frames
000a6fa2  ldr     r1, [r3]
000a6fa4  lsls    r3, r2, #3
000a6fa6  adds    r3, r3, r5
000a6fa8  str     r1, [r3, #4]
000a6faa  ldr.w   r3, [r5, #0xa4]
000a6fae  adds    r3, #1
000a6fb0  str.w   r6, [r5, r3, lsl #3]
000a6fb4  b       #0xa6f6e
000a6fb6  mov     r0, r4
000a6fb8  movs    r1, #0xc
000a6fba  bl      #0x57dd0 ; -> tsound_func
000a6fbe  ldr     r3, [r4, #0x44]
000a6fc0  mov     r0, r4
000a6fc2  str     r3, [r4, #0x40]
000a6fc4  bl      #0x59e24 ; -> do_next_a9_frame
000a6fc8  ldr.w   r3, [r5, #0xa4]
000a6fcc  movs    r0, #3
000a6fce  movw    r2, #0x14f
000a6fd2  adds    r3, #1
000a6fd4  str.w   r2, [r5, r3, lsl #3]
000a6fd8  str.w   r0, [r5, #0xfc]
000a6fdc  b       #0xa6f6e
000a6fde  nop     
