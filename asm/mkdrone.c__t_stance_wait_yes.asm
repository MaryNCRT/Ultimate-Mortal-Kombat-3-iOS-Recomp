========================================================================
t_stance_wait_yes  0x00071fe4  240 bytes   mkdrone.c
========================================================================

00071fe4  push    {r4, r5, r7, lr}
00071fe6  add     r7, sp, #8
00071fe8  ldr.w   r3, [r0, #0xa4]
00071fec  movw    r2, #0x637
00071ff0  mov     r4, r0
00071ff2  adds    r3, #1
00071ff4  ldr.w   r5, [r0, #0x108]
00071ff8  ldr.w   r3, [r0, r3, lsl #3]
00071ffc  cmp     r3, r2
00071ffe  beq     #0x72066
00072000  adds    r2, #6
00072002  cmp     r3, r2
00072004  beq     #0x7204a
00072006  cbnz    r3, #0x72044
00072008  mov     r0, r5
0007200a  bl      #0x71e0c ; -> d_stance_setup
0007200e  mov     r0, r5
00072010  bl      #0x5a680 ; -> next_anirate
00072014  ldr.w   r3, [r4, #0xa4]
00072018  movw    r2, #0x637
0007201c  adds    r3, #1
0007201e  str.w   r2, [r4, r3, lsl #3]
00072022  ldr     r2, [pc, #0xa4]
00072024  ldr.w   r3, [r4, #0xa4]
00072028  add     r2, pc ; -> 0x0006c40d  t_d_beware
0007202a  adds    r3, #1
0007202c  str.w   r3, [r4, #0xa4]
00072030  lsls    r3, r3, #3
00072032  adds    r3, r3, r4
00072034  movs    r0, #0
00072036  str     r2, [r3, #4]
00072038  ldr.w   r3, [r4, #0xa4]
0007203c  adds    r3, #1
0007203e  str.w   r0, [r4, r3, lsl #3]
00072042  b       #0x72048
00072044  mvn     r0, #2
00072048  pop     {r4, r5, r7, pc}
0007204a  ldr     r3, [r5, #0x44]
0007204c  subs    r3, #1
0007204e  cmp     r3, #0
00072050  str     r3, [r5, #0x44]
00072052  bgt     #0x7200e
00072054  ldr.w   r3, [r0, #0xa4]
00072058  cmp     r3, #0
0007205a  bgt     #0x720a0
0007205c  ldr.w   r2, [pc, #0x6c]
00072060  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00072062  ldr     r2, [r2]
00072064  b       #0x72030
00072066  ldr.w   r1, [r0, #0xf8]
0007206a  ldr     r2, [r5, #0x44]
0007206c  lsls    r3, r1, #2
0007206e  adds    r3, r3, r0
00072070  str.w   r2, [r3, #0xa8]
00072074  adds    r3, r1, #1
00072076  str.w   r3, [r0, #0xf8]
0007207a  mov     r0, r5
0007207c  ldr     r3, [r5, #0x48]
0007207e  blx     r3
00072080  ldr.w   r3, [r4, #0xf8]
00072084  subs    r3, #1
00072086  str.w   r3, [r4, #0xf8]
0007208a  lsls    r3, r3, #2
0007208c  adds    r3, r3, r4
0007208e  ldr     r0, [r5, #0x5c]
00072090  ldr.w   r3, [r3, #0xa8]
00072094  str     r3, [r5, #0x44]
00072096  cbz     r0, #0x720aa
00072098  ldr.w   r3, [r4, #0xa4]
0007209c  cmp     r3, #0
0007209e  ble     #0x720c0
000720a0  subs    r3, #1
000720a2  movs    r0, #0
000720a4  str.w   r3, [r4, #0xa4]
000720a8  b       #0x72048
000720aa  ldr.w   r3, [r4, #0xa4]
000720ae  movs    r0, #1
000720b0  movw    r2, #0x63d
000720b4  adds    r3, #1
000720b6  str.w   r2, [r4, r3, lsl #3]
000720ba  str.w   r0, [r4, #0xfc]
000720be  b       #0x72048
000720c0  ldr     r2, [pc, #0xc]
000720c2  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000720c4  b       #0x72062
000720c6  nop     
000720c8  adr     r3, #0x384
