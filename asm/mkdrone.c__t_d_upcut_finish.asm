========================================================================
t_d_upcut_finish  0x00068fe8  232 bytes   mkdrone.c
========================================================================

00068fe8  push    {r4, r5, r7, lr}
00068fea  add     r7, sp, #8
00068fec  ldr.w   r3, [r0, #0xa4]
00068ff0  mov     r4, r0
00068ff2  ldr.w   r5, [r0, #0x108]
00068ff6  adds    r3, #1
00068ff8  movw    r2, #0x97d
00068ffc  ldr.w   r0, [r0, r3, lsl #3]
00069000  cmp     r0, r2
00069002  beq     #0x69066
00069004  ble     #0x6901c
00069006  movw    r2, #0x97e
0006900a  cmp     r0, r2
0006900c  beq     #0x69094
0006900e  movw    r3, #0x97f
00069012  cmp     r0, r3
00069014  beq     #0x6904e
00069016  mvn     r0, #2
0006901a  pop     {r4, r5, r7, pc}
0006901c  cmp     r0, #0
0006901e  bne     #0x69016
00069020  movs    r3, #0x10
00069022  str     r3, [r5, #0x44]
00069024  ldr.w   r3, [r4, #0xa4]
00069028  adds    r3, #1
0006902a  str.w   r2, [r4, r3, lsl #3]
0006902e  ldr     r2, [pc, #0x90]
00069030  ldr.w   r3, [r4, #0xa4]
00069034  add     r2, pc ; -> 0x000720d5  t_d_stance_pause
00069036  adds    r3, #1
00069038  str.w   r3, [r4, #0xa4]
0006903c  lsls    r3, r3, #3
0006903e  adds    r3, r3, r4
00069040  str     r2, [r3, #4]
00069042  ldr.w   r3, [r4, #0xa4]
00069046  adds    r3, #1
00069048  str.w   r0, [r4, r3, lsl #3]
0006904c  b       #0x6901a
0006904e  mov     r0, r5
00069050  bl      #0x68ea0 ; -> q_is_he_dizzy
00069054  ldr     r0, [r5, #0x5c]
00069056  cbnz    r0, #0x690a4
00069058  ldr.w   r3, [pc, #0x68]
0006905c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006905e  ldr     r2, [r3]
00069060  ldr.w   r3, [r4, #0xa4]
00069064  b       #0x6903c
00069066  movw    r2, #0x97e
0006906a  str.w   r2, [r4, r3, lsl #3]
0006906e  ldr.w   r3, [r4, #0xa4]
00069072  movs    r0, #0
00069074  adds    r2, r3, #1
00069076  ldr.w   r3, [pc, #0x50]
0006907a  str.w   r2, [r4, #0xa4]
0006907e  add     r3, pc ; -> 0x000f3884  t_do_duck
00069080  ldr     r1, [r3]
00069082  lsls    r3, r2, #3
00069084  adds    r3, r3, r4
00069086  str     r1, [r3, #4]
00069088  ldr.w   r3, [r4, #0xa4]
0006908c  adds    r3, #1
0006908e  str.w   r0, [r4, r3, lsl #3]
00069092  b       #0x6901a
00069094  movs    r0, #8
00069096  movw    r2, #0x97f
0006909a  str.w   r2, [r4, r3, lsl #3]
0006909e  str.w   r0, [r4, #0xfc]
000690a2  b       #0x6901a
000690a4  ldr.w   r3, [r4, #0xa4]
000690a8  ldr     r2, [pc, #0x20]
000690aa  movs    r0, #0
000690ac  lsls    r3, r3, #3
000690ae  adds    r3, r3, r4
000690b0  add     r2, pc ; -> 0x000676a1  t_d_uppercut
000690b2  str     r2, [r3, #4]
000690b4  ldr.w   r3, [r4, #0xa4]
000690b8  adds    r3, #1
000690ba  str.w   r0, [r4, r3, lsl #3]
000690be  b       #0x6901a
000690c0  str     r0, [sp, #0x274]
000690c2  movs    r0, r0
000690c4  adr     r6, #0x2a0
000690c6  movs    r0, r1
000690c8  add     r0, sp, #8
000690ca  movs    r0, r1
000690cc  b       #0x68caa
