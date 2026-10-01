========================================================================
t_d_zap_now  0x00067fe0  156 bytes   mkdrone.c
========================================================================

00067fe0  push    {r4}
00067fe2  ldr.w   r3, [r0, #0xa4]
00067fe6  ldr.w   r1, [r0, #0x108]
00067fea  adds    r3, #1
00067fec  ldr.w   r4, [r0, r3, lsl #3]
00067ff0  cbz     r4, #0x67ffa
00067ff2  mvn     r0, #2
00067ff6  pop     {r4}
00067ff8  bx      lr
00067ffa  ldr     r3, [r1, #8]
00067ffc  ldr     r2, [pc, #0x6c]
00067ffe  ldr     r3, [r3, #0x24]
00068000  add     r2, pc ; -> 0x00171cd0  ochar_zaps
00068002  ldr.w   r3, [r2, r3, lsl #2]
00068006  cmp     r3, #0
00068008  str     r3, [r1, #0x1c]
0006800a  blt     #0x6804c
0006800c  ldr     r3, [pc, #0x60]
0006800e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00068010  ldr     r2, [r3]
00068012  str     r2, [r1, #0x20]
00068014  ldr.w   r3, [r0, #0xa4]
00068018  lsls    r3, r3, #3
0006801a  adds    r3, r3, r0
0006801c  str     r2, [r3, #4]
0006801e  ldr.w   r3, [r0, #0xa4]
00068022  adds    r3, #1
00068024  str.w   r4, [r0, r3, lsl #3]
00068028  ldr.w   r3, [r0, #0xa4]
0006802c  adds    r2, r3, #1
0006802e  ldr     r3, [pc, #0x44]
00068030  str.w   r2, [r0, #0xa4]
00068034  add     r3, pc ; -> 0x000f314c  t_do_zap
00068036  ldr     r1, [r3]
00068038  lsls    r3, r2, #3
0006803a  adds    r3, r3, r0
0006803c  str     r1, [r3, #4]
0006803e  ldr.w   r3, [r0, #0xa4]
00068042  adds    r3, #1
00068044  str.w   r4, [r0, r3, lsl #3]
00068048  mov     r0, r4
0006804a  b       #0x67ff6
0006804c  ldr.w   r3, [r0, #0xa4]
00068050  ldr.w   r2, [pc, #0x24]
00068054  lsls    r3, r3, #3
00068056  adds    r3, r3, r0
00068058  add     r2, pc ; -> 0x000677b9  t_stalk_in_close
0006805a  str     r2, [r3, #4]
0006805c  ldr.w   r3, [r0, #0xa4]
00068060  adds    r3, #1
00068062  str.w   r4, [r0, r3, lsl #3]
00068066  mov     r0, r4
00068068  b       #0x67ff6
0006806a  nop     
0006806c  ldr     r4, [sp, #0x330]
0006806e  movs    r0, r2
