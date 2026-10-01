========================================================================
ZNK6Mayhem4User14GetDisplayNameEv  0x0008ac98  20 bytes   Mayhem.mm
========================================================================

0008ac98  ldr     r0, [r0, #4]
0008ac9a  cbz     r0, #0x8aca0
0008ac9c  adds    r0, #0x18
0008ac9e  bx      lr
0008aca0  ldr     r0, [pc, #4]
0008aca2  add     r0, pc ; -> 0x00379bfc  ZN6Mayhem4User16GET_STRING_ERRORE
0008aca4  b       #0x8ac9e
0008aca6  nop     
0008aca8  vhadd.s16 d16, d6, d30
