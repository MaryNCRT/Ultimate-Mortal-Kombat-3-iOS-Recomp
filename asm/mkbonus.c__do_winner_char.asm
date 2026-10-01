========================================================================
do_winner_char  0x0007cc0c  44 bytes   mkbonus.c
========================================================================

0007cc0c  push    {r4, r5, r7, lr}
0007cc0e  add     r7, sp, #8
0007cc10  mov     r4, r0
0007cc12  mov     r5, r1
0007cc14  cbz     r1, #0x7cc26
0007cc16  movs    r0, #3
0007cc18  mov.w   r2, #-1
0007cc1c  mov     r1, r0
0007cc1e  movs    r3, #0
0007cc20  bl      #0x31a28 ; -> MKEvent_Add
0007cc24  pop     {r4, r5, r7, pc}
0007cc26  bl      #0x7cb80 ; -> get_winner_ochar
0007cc2a  movs    r0, #3
0007cc2c  ldr     r2, [r4, #0x1c]
0007cc2e  mov     r1, r0
0007cc30  mov     r3, r5
0007cc32  bl      #0x31a28 ; -> MKEvent_Add
0007cc36  b       #0x7cc24
