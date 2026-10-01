========================================================================
-[FBDialog shouldRotateToOrientation  0x00082508  56 bytes   FBDialog.m
========================================================================

00082508  ldr     r3, [pc, #0x30]
0008250a  add     r3, pc ; -> 0x000f51dc  OBJC_IVAR_$_FBDialog._orientation
0008250c  ldr     r3, [r3]
0008250e  ldr     r3, [r0, r3]
00082510  cmp     r3, r2
00082512  beq     #0x82538
00082514  subs    r1, r2, #3
00082516  cmp     r2, #1
00082518  ite     ne
0008251a  movne   r3, #0
0008251c  moveq   r3, #1
0008251e  cmp     r1, #1
00082520  it      ls
00082522  orrls   r3, r3, #1
00082526  cbz     r3, #0x8252e
00082528  movs    r0, #1
0008252a  sxtb    r0, r0
0008252c  bx      lr
0008252e  cmp     r2, #2
00082530  ite     ne
00082532  movne   r0, #0
00082534  moveq   r0, #1
00082536  b       #0x8252a
00082538  movs    r0, #0
0008253a  b       #0x8252a
0008253c  cmp     r4, #0xce
0008253e  movs    r7, r0
