========================================================================
ZN6Mayhem5Token7RefreshEv  0x0008b6e8  20 bytes   Mayhem.mm
========================================================================

0008b6e8  push    {r4, r7, lr}
0008b6ea  add     r7, sp, #4
0008b6ec  movs    r1, #0
0008b6ee  mov     r4, r0
0008b6f0  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
0008b6f4  mov     r0, r4
0008b6f6  bl      #0x8b6b8 ; -> ZN6Mayhem12MayhemThread5startEv
0008b6fa  pop     {r4, r7, pc}
