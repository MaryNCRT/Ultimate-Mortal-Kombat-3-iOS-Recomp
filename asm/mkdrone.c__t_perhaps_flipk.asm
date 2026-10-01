========================================================================
t_perhaps_flipk  0x00070d30  176 bytes   mkdrone.c
========================================================================

00070d30  push    {r4, r5, r6, r7, lr}
00070d32  add     r7, sp, #0xc
00070d34  ldr.w   r2, [r0, #0xa4]
00070d38  mov     r4, r0
00070d3a  ldr.w   r5, [r0, #0x108]
00070d3e  adds    r3, r2, #1
00070d40  ldr.w   r6, [r0, r3, lsl #3]
00070d44  cbnz    r6, #0x70d72
00070d46  mov     r0, r5
00070d48  bl      #0x2f3a0 ; -> get_x_dist
00070d4c  ldr     r3, [r5, #0x28]
00070d4e  cmp     r3, #0xb4
00070d50  ble     #0x70d9a
00070d52  cmp     r3, #0xf0
00070d54  ble     #0x70da0
00070d56  ldr     r2, [pc, #0x74]
00070d58  add     r2, pc ; -> 0x000677b9  t_stalk_in_close
00070d5a  ldr.w   r3, [r4, #0xa4]
00070d5e  lsls    r3, r3, #3
00070d60  adds    r3, r3, r4
00070d62  mov     r0, r6
00070d64  str     r2, [r3, #4]
00070d66  ldr.w   r3, [r4, #0xa4]
00070d6a  adds    r3, #1
00070d6c  str.w   r6, [r4, r3, lsl #3]
00070d70  pop     {r4, r5, r6, r7, pc}
00070d72  movw    r3, #0x5c1
00070d76  cmp     r6, r3
00070d78  it      ne
00070d7a  mvnne   r0, #2
00070d7e  bne     #0x70d70
00070d80  ldr     r3, [pc, #0x4c]
00070d82  movs    r0, #0
00070d84  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00070d86  ldr     r1, [r3]
00070d88  lsls    r3, r2, #3
00070d8a  adds    r3, r3, r4
00070d8c  str     r1, [r3, #4]
00070d8e  ldr.w   r3, [r4, #0xa4]
00070d92  adds    r3, #1
00070d94  str.w   r0, [r4, r3, lsl #3]
00070d98  b       #0x70d70
00070d9a  ldr     r2, [pc, #0x38]
00070d9c  add     r2, pc ; -> 0x000677b9  t_stalk_in_close
00070d9e  b       #0x70d5a
00070da0  mov     r0, r5
00070da2  bl      #0x70cf8 ; -> frontflip_setup
00070da6  ldr.w   r3, [pc, #0x30]
00070daa  movw    r2, #0x5c1
00070dae  add     r3, pc ; -> 0x00070541  t_flipk_scan
00070db0  str     r3, [r5, #0x34]
00070db2  ldr.w   r3, [r4, #0xa4]
00070db6  adds    r3, #1
00070db8  str.w   r2, [r4, r3, lsl #3]
00070dbc  ldr     r2, [pc, #0x1c]
00070dbe  ldr.w   r3, [r4, #0xa4]
00070dc2  add     r2, pc ; -> 0x00070e4d  t_d_fflip_scan_jsrp
00070dc4  adds    r3, #1
00070dc6  str.w   r3, [r4, #0xa4]
00070dca  b       #0x70d5e
00070dcc  ldr     r5, [r3, #0x24]
