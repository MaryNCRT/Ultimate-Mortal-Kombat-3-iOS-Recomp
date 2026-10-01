========================================================================
t_popup  0x000a5900  144 bytes   mkfriend.c
========================================================================

000a5900  push    {r4, r7, lr}
000a5902  add     r7, sp, #4
000a5904  ldr.w   r3, [r0, #0xa4]
000a5908  mov     r4, r0
000a590a  ldr.w   r2, [r0, #0x108]
000a590e  adds    r3, #1
000a5910  ldr.w   r0, [r0, r3, lsl #3]
000a5914  cmp     r0, #0xbe
000a5916  beq     #0xa597a
000a5918  cmp     r0, #0xbf
000a591a  beq     #0xa5956
000a591c  cbz     r0, #0xa5924
000a591e  mvn     r0, #2
000a5922  pop     {r4, r7, pc}
000a5924  movs    r3, #4
000a5926  str     r3, [r2, #0x1c]
000a5928  ldr.w   r3, [r4, #0xa4]
000a592c  movs    r2, #0xbe
000a592e  adds    r3, #1
000a5930  str.w   r2, [r4, r3, lsl #3]
000a5934  ldr.w   r3, [r4, #0xa4]
000a5938  adds    r2, r3, #1
000a593a  ldr     r3, [pc, #0x4c]
000a593c  str.w   r2, [r4, #0xa4]
000a5940  add     r3, pc ; -> 0x000f37cc  t_mframew
000a5942  ldr     r1, [r3]
000a5944  lsls    r3, r2, #3
000a5946  adds    r3, r3, r4
000a5948  str     r1, [r3, #4]
000a594a  ldr.w   r3, [r4, #0xa4]
000a594e  adds    r3, #1
000a5950  str.w   r0, [r4, r3, lsl #3]
000a5954  b       #0xa5922
000a5956  mov     r0, r2
000a5958  bl      #0x336e8 ; -> death_blow_complete
000a595c  ldr     r3, [pc, #0x2c]
000a595e  movs    r0, #0
000a5960  add     r3, pc ; -> 0x000f3724  t_wait_forever
000a5962  ldr     r2, [r3]
000a5964  ldr.w   r3, [r4, #0xa4]
000a5968  lsls    r3, r3, #3
000a596a  adds    r3, r3, r4
000a596c  str     r2, [r3, #4]
000a596e  ldr.w   r3, [r4, #0xa4]
000a5972  adds    r3, #1
000a5974  str.w   r0, [r4, r3, lsl #3]
000a5978  b       #0xa5922
000a597a  movs    r2, #0xbf
000a597c  movs    r0, #0x30
000a597e  str.w   r2, [r4, r3, lsl #3]
000a5982  str.w   r0, [r4, #0xfc]
000a5986  b       #0xa5922
000a5988  udf     #0x88
000a598a  movs    r4, r0
000a598c  ble     #0xa5910
000a598e  movs    r4, r0
