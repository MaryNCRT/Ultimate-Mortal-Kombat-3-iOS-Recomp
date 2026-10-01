========================================================================
ZNK6Mayhem4Stat11GetMayhemIDEv  0x0008ad48  20 bytes   Mayhem.mm
========================================================================

0008ad48  ldr     r0, [r0, #4]
0008ad4a  cbz     r0, #0x8ad50
0008ad4c  adds    r0, #4
0008ad4e  bx      lr
0008ad50  ldr     r0, [pc, #4]
0008ad52  add     r0, pc ; -> 0x00379c18  ZN6Mayhem4Stat16GET_STRING_ERRORE
0008ad54  b       #0x8ad4e
0008ad56  nop     
0008ad58  cdp     p0, #0xc, c0, c2, c14, #1
