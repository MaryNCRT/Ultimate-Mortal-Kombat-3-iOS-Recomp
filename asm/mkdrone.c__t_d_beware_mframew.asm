========================================================================
t_d_beware_mframew  0x0006cf94  188 bytes   mkdrone.c
========================================================================

0006cf94  push    {r4, r7, lr}
0006cf96  add     r7, sp, #4
0006cf98  mov     r4, r0
0006cf9a  ldr.w   r3, [r4, #0xa4]
0006cf9e  movw    r2, #0x1490
0006cfa2  ldr.w   r0, [r0, #0x108]
0006cfa6  adds    r3, #1
0006cfa8  ldr.w   r3, [r4, r3, lsl #3]
0006cfac  cmp     r3, r2
0006cfae  beq     #0x6cffa
0006cfb0  adds    r2, #2
0006cfb2  cmp     r3, r2
0006cfb4  beq     #0x6cfde
0006cfb6  cbnz    r3, #0x6cfd8
0006cfb8  ldr     r2, [r0]
0006cfba  str     r3, [r0, #0x48]
0006cfbc  str     r3, [r2, #0x5c]
0006cfbe  bl      #0x553a0 ; -> init_anirate
0006cfc2  ldr.w   r3, [r4, #0xa4]
0006cfc6  movs    r0, #1
0006cfc8  movw    r2, #0x1490
0006cfcc  adds    r3, #1
0006cfce  str.w   r2, [r4, r3, lsl #3]
0006cfd2  str.w   r0, [r4, #0xfc]
0006cfd6  b       #0x6cfdc
0006cfd8  mvn     r0, #2
0006cfdc  pop     {r4, r7, pc}
0006cfde  ldr     r3, [r0, #0x40]
0006cfe0  ldr     r2, [r3]
0006cfe2  str     r2, [r0, #0x20]
0006cfe4  cmp     r2, #0
0006cfe6  bne     #0x6cfc2
0006cfe8  ldr.w   r3, [r4, #0xa4]
0006cfec  cmp     r3, #0
0006cfee  ble     #0x6d02e
0006cff0  subs    r3, #1
0006cff2  mov     r0, r2
0006cff4  str.w   r3, [r4, #0xa4]
0006cff8  b       #0x6cfdc
0006cffa  bl      #0x5a680 ; -> next_anirate
0006cffe  ldr.w   r3, [r4, #0xa4]
0006d002  movw    r2, #0x1492
0006d006  movs    r0, #0
0006d008  adds    r3, #1
0006d00a  str.w   r2, [r4, r3, lsl #3]
0006d00e  ldr.w   r3, [r4, #0xa4]
0006d012  ldr     r2, [pc, #0x34]
0006d014  adds    r3, #1
0006d016  str.w   r3, [r4, #0xa4]
0006d01a  lsls    r3, r3, #3
0006d01c  adds    r3, r3, r4
0006d01e  add     r2, pc ; -> 0x0006c40d  t_d_beware
0006d020  str     r2, [r3, #4]
0006d022  ldr.w   r3, [r4, #0xa4]
0006d026  adds    r3, #1
0006d028  str.w   r0, [r4, r3, lsl #3]
0006d02c  b       #0x6cfdc
0006d02e  ldr     r1, [pc, #0x1c]
0006d030  lsls    r3, r3, #3
0006d032  adds    r3, r3, r4
0006d034  add     r1, pc ; -> 0x000f3708  t_local_reaction_exit
0006d036  mov     r0, r2
0006d038  ldr     r1, [r1]
0006d03a  str     r1, [r3, #4]
0006d03c  ldr.w   r3, [r4, #0xa4]
0006d040  adds    r3, #1
0006d042  str.w   r2, [r4, r3, lsl #3]
0006d046  b       #0x6cfdc
0006d048  bl      #0x45904a
0006d04c  str     r0, [r2, #0x6c]
0006d04e  movs    r0, r1
