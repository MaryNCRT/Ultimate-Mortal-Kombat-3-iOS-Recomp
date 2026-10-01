========================================================================
t_d_hang_out  0x00072224  164 bytes   mkdrone.c
========================================================================

00072224  push    {r4, r5, r6, r7, lr}
00072226  add     r7, sp, #0xc
00072228  ldr.w   r2, [r0, #0xa4]
0007222c  mov     r4, r0
0007222e  ldr.w   r5, [r0, #0x108]
00072232  adds    r3, r2, #1
00072234  ldr.w   r6, [r0, r3, lsl #3]
00072238  cmp     r6, #0
0007223a  bne     #0x72292
0007223c  ldr     r3, [pc, #0x7c]
0007223e  mov     r0, r5
00072240  add     r3, pc ; -> 0x000f357c  G
00072242  ldr     r2, [r3]
00072244  ldr.w   r3, [r2, #0x448]
00072248  adds.w  r3, r3, #-1
0007224c  it      pl
0007224e  strpl.w r3, [r2, #0x448]
00072252  movs    r3, #0x80
00072254  str     r3, [r5, #0x1c]
00072256  subs    r3, #0x50
00072258  str     r3, [r5, #0x20]
0007225a  bl      #0x58764 ; -> randu_minimum
0007225e  ldr     r3, [r5, #0x1c]
00072260  movw    r2, #0x2c2
00072264  mov     r0, r6
00072266  str     r3, [r5, #0x44]
00072268  ldr.w   r3, [r4, #0xa4]
0007226c  adds    r3, #1
0007226e  str.w   r2, [r4, r3, lsl #3]
00072272  ldr.w   r3, [r4, #0xa4]
00072276  ldr     r2, [pc, #0x48]
00072278  adds    r3, #1
0007227a  str.w   r3, [r4, #0xa4]
0007227e  lsls    r3, r3, #3
00072280  adds    r3, r3, r4
00072282  add     r2, pc ; -> 0x000720d5  t_d_stance_pause
00072284  str     r2, [r3, #4]
00072286  ldr.w   r3, [r4, #0xa4]
0007228a  adds    r3, #1
0007228c  str.w   r6, [r4, r3, lsl #3]
00072290  pop     {r4, r5, r6, r7, pc}
00072292  movw    r3, #0x2c2
00072296  cmp     r6, r3
00072298  it      ne
0007229a  mvnne   r0, #2
0007229e  bne     #0x72290
000722a0  ldr.w   r3, [pc, #0x20]
000722a4  movs    r0, #0
000722a6  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000722a8  ldr     r1, [r3]
000722aa  lsls    r3, r2, #3
000722ac  adds    r3, r3, r4
000722ae  str     r1, [r3, #4]
000722b0  ldr.w   r3, [r4, #0xa4]
000722b4  adds    r3, #1
000722b6  str.w   r0, [r4, r3, lsl #3]
000722ba  b       #0x72290
000722bc  asrs    r0, r7, #0xc
000722be  movs    r0, r1
000722c0  mcr2    p15, #2, pc, c15, c15, #7
000722c4  asrs    r6, r3, #0x11
000722c6  movs    r0, r1
