========================================================================
t_r_lo_punch  0x00045688  252 bytes   mkreact.c
========================================================================

00045688  push    {r4, r5, r6, r7, lr}
0004568a  add     r7, sp, #0xc
0004568c  str     r8, [sp, #-0x4]!
00045690  ldr.w   r2, [r0, #0xa4]
00045694  movw    r8, #0xe84
00045698  mov     r4, r0
0004569a  adds    r3, r2, #1
0004569c  ldr.w   r5, [r0, #0x108]
000456a0  ldr.w   r6, [r0, r3, lsl #3]
000456a4  cmp     r6, r8
000456a6  beq     #0x45718
000456a8  cmp.w   r6, #0xe90
000456ac  beq     #0x456fe
000456ae  cbz     r6, #0x456ba
000456b0  mvn     r0, #2
000456b4  ldr     r8, [sp], #4
000456b8  pop     {r4, r5, r6, r7, pc}
000456ba  mov     r0, r5
000456bc  bl      #0x41580 ; -> inc_p_block
000456c0  ldr     r3, [pc, #0xa4]
000456c2  ldr.w   r2, [pc, #0xa8]
000456c6  mov     r0, r6
000456c8  add     r3, pc ; -> 0x00042cd5  t_r_airpunch
000456ca  str     r3, [r5, #0x30]
000456cc  movs    r3, #1
000456ce  str     r3, [r5, #0x34]
000456d0  ldr     r3, [pc, #0x9c]
000456d2  add     r2, pc ; -> 0x00044b85  t_reaction_start
000456d4  add     r3, pc ; -> 0x00041605  t_cc_lo_punch
000456d6  str     r3, [r5, #0x38]
000456d8  ldr.w   r3, [r4, #0xa4]
000456dc  adds    r3, #1
000456de  str.w   r8, [r4, r3, lsl #3]
000456e2  ldr.w   r3, [r4, #0xa4]
000456e6  adds    r3, #1
000456e8  str.w   r3, [r4, #0xa4]
000456ec  lsls    r3, r3, #3
000456ee  adds    r3, r3, r4
000456f0  str     r2, [r3, #4]
000456f2  ldr.w   r3, [r4, #0xa4]
000456f6  adds    r3, #1
000456f8  str.w   r6, [r4, r3, lsl #3]
000456fc  b       #0x456b4
000456fe  ldr     r3, [pc, #0x74]
00045700  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00045702  ldr     r1, [r3]
00045704  lsls    r3, r2, #3
00045706  adds    r3, r3, r4
00045708  movs    r0, #0
0004570a  str     r1, [r3, #4]
0004570c  ldr.w   r3, [r4, #0xa4]
00045710  adds    r3, #1
00045712  str.w   r0, [r4, r3, lsl #3]
00045716  b       #0x456b4
00045718  mov     r0, r5
0004571a  bl      #0x420e4 ; -> rsnd_react_voice
0004571e  mov     r0, r5
00045720  movs    r1, #0xc
00045722  bl      #0x57dbc ; -> rsnd_func
00045726  mov     r0, r5
00045728  bl      #0x54dec ; -> dec_my_p_hit
0004572c  ldr     r2, [r5]
0004572e  movw    r3, #0x509
00045732  str     r3, [r5, #0x1c]
00045734  mov     r0, r5
00045736  str     r3, [r2, #0x18]
00045738  ldr     r3, [pc, #0x3c]
0004573a  str     r3, [r5, #0x40]
0004573c  bl      #0x55808 ; -> am_i_short
00045740  cbz     r0, #0x45748
00045742  ldr.w   r3, [pc, #0x38]
00045746  str     r3, [r5, #0x40]
00045748  ldr.w   r3, [r4, #0xa4]
0004574c  mov.w   r2, #0xe90
00045750  adds    r3, #1
00045752  str.w   r2, [r4, r3, lsl #3]
00045756  ldr.w   r3, [r4, #0xa4]
0004575a  adds    r2, r3, #1
0004575c  ldr     r3, [pc, #0x20]
0004575e  str.w   r2, [r4, #0xa4]
00045762  add     r3, pc ; -> 0x000f36d0  t_animate_a9
00045764  b       #0x45702
00045766  nop     
00045768  bvs     #0x4577e
