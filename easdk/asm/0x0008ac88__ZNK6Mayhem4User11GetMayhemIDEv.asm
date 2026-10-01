========================================================================
ZNK6Mayhem4User11GetMayhemIDEv  0x0008ac88  16 bytes   Mayhem.mm
========================================================================

0008ac88  ldr     r0, [r0, #4]
0008ac8a  cbz     r0, #0x8ac8e
0008ac8c  bx      lr
0008ac8e  ldr     r0, [pc, #4]
0008ac90  add     r0, pc ; -> 0x00379bfc  ZN6Mayhem4User16GET_STRING_ERRORE
0008ac92  b       #0x8ac8c
0008ac94  vhadd.s32 d16, d8, d30
