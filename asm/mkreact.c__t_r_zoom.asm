========================================================================
t_r_zoom  0x0004123c  128 bytes   mkreact.c
========================================================================

0004123c  ldr.w   ip, [r0, #0xa4]
00041240  ldr.w   r2, [r0, #0x108]
00041244  add.w   r3, ip, #1
00041248  ldr.w   r1, [r0, r3, lsl #3]
0004124c  cbnz    r1, #0x41286
0004124e  str     r1, [r2, #0x30]
00041250  str     r1, [r2, #0x38]
00041252  movs    r3, #1
00041254  str     r3, [r2, #0x34]
00041256  ldr.w   r3, [r0, #0xa4]
0004125a  movw    r2, #0x43a
0004125e  adds    r3, #1
00041260  str.w   r2, [r0, r3, lsl #3]
00041264  ldr.w   r3, [r0, #0xa4]
00041268  ldr     r2, [pc, #0x48]
0004126a  adds    r3, #1
0004126c  str.w   r3, [r0, #0xa4]
00041270  lsls    r3, r3, #3
00041272  adds    r3, r3, r0
00041274  add     r2, pc ; -> 0x00044b85  t_reaction_start
00041276  str     r2, [r3, #4]
00041278  ldr.w   r3, [r0, #0xa4]
0004127c  adds    r3, #1
0004127e  str.w   r1, [r0, r3, lsl #3]
00041282  mov     r0, r1
00041284  bx      lr
00041286  movw    r3, #0x43a
0004128a  cmp     r1, r3
0004128c  it      ne
0004128e  mvnne   r0, #2
00041292  bne     #0x41284
00041294  ldr.w   r2, [pc, #0x20]
00041298  lsl.w   r3, ip, #3
0004129c  adds    r3, r3, r0
0004129e  add     r2, pc ; -> 0x00041e95  t_suspend_wait_action
000412a0  str     r2, [r3, #4]
000412a2  ldr.w   r3, [r0, #0xa4]
000412a6  movs    r1, #0
000412a8  adds    r3, #1
000412aa  str.w   r1, [r0, r3, lsl #3]
000412ae  mov     r0, r1
000412b0  b       #0x41284
000412b2  nop     
000412b4  subs    r1, #0xd
000412b6  movs    r0, r0
000412b8  lsrs    r3, r6, #0xf
000412ba  movs    r0, r0
