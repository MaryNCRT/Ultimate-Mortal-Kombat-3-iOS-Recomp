========================================================================
t_r_summon  0x000487d4  220 bytes   mkreact.c
========================================================================

000487d4  push    {r4, r5, r7, lr}
000487d6  add     r7, sp, #8
000487d8  ldr.w   r2, [r0, #0xa4]
000487dc  mov     r4, r0
000487de  ldr.w   r5, [r0, #0x108]
000487e2  adds    r3, r2, #1
000487e4  movw    r1, #0x5d2
000487e8  ldr.w   r0, [r0, r3, lsl #3]
000487ec  cmp     r0, r1
000487ee  beq     #0x4884c
000487f0  movw    r3, #0x5de
000487f4  cmp     r0, r3
000487f6  beq     #0x48832
000487f8  cbz     r0, #0x48800
000487fa  mvn     r0, #2
000487fe  pop     {r4, r5, r7, pc}
00048800  str     r0, [r5, #0x30]
00048802  str     r0, [r5, #0x38]
00048804  movs    r3, #1
00048806  str     r3, [r5, #0x34]
00048808  ldr.w   r3, [r4, #0xa4]
0004880c  ldr     r2, [pc, #0x90]
0004880e  adds    r3, #1
00048810  add     r2, pc ; -> 0x00044b85  t_reaction_start
00048812  str.w   r1, [r4, r3, lsl #3]
00048816  ldr.w   r3, [r4, #0xa4]
0004881a  adds    r3, #1
0004881c  str.w   r3, [r4, #0xa4]
00048820  lsls    r3, r3, #3
00048822  adds    r3, r3, r4
00048824  str     r2, [r3, #4]
00048826  ldr.w   r3, [r4, #0xa4]
0004882a  adds    r3, #1
0004882c  str.w   r0, [r4, r3, lsl #3]
00048830  b       #0x487fe
00048832  ldr.w   r1, [pc, #0x70]
00048836  add     r1, pc ; -> 0x000425b9  t_reaction_land
00048838  lsls    r3, r2, #3
0004883a  adds    r3, r3, r4
0004883c  movs    r0, #0
0004883e  str     r1, [r3, #4]
00048840  ldr.w   r3, [r4, #0xa4]
00048844  adds    r3, #1
00048846  str.w   r0, [r4, r3, lsl #3]
0004884a  b       #0x487fe
0004884c  mov     r0, r5
0004884e  movs    r3, #2
00048850  str     r3, [r5, #0x1c]
00048852  bl      #0x580a4 ; -> group_sound
00048856  mov     r0, r5
00048858  bl      #0x55388 ; -> face_opponent
0004885c  mov     r0, r5
0004885e  bl      #0x55394 ; -> flip_multi
00048862  ldr.w   r3, [pc, #0x44]
00048866  movw    r2, #0x5de
0004886a  str     r3, [r5, #0x1c]
0004886c  sub.w   r3, r3, #0x60000
00048870  str     r3, [r5, #0x20]
00048872  add.w   r3, r3, #0x96000
00048876  str     r3, [r5, #0x24]
00048878  movs    r3, #5
0004887a  str     r3, [r5, #0x28]
0004887c  adds    r3, #0x19
0004887e  str     r3, [r5, #0x40]
00048880  ldr.w   r3, [r4, #0xa4]
00048884  adds    r3, #1
00048886  str.w   r2, [r4, r3, lsl #3]
0004888a  ldr.w   r3, [r4, #0xa4]
0004888e  adds    r2, r3, #1
00048890  ldr.w   r3, [pc, #0x18]
00048894  str.w   r2, [r4, #0xa4]
00048898  add     r3, pc ; -> 0x000f3720  t_flight
0004889a  ldr     r1, [r3]
0004889c  b       #0x48838
0004889e  nop     
000488a0  stm     r3!, {r0, r4, r5, r6}
