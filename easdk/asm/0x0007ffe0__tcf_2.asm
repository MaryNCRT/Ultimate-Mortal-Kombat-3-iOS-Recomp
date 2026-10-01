========================================================================
tcf_2  0x0007ffe0  44 bytes   EASDK_Handler.mm
========================================================================

0007ffe0  push    {r4, r5, r7, lr}
0007ffe2  add     r7, sp, #8
0007ffe4  ldr     r3, [pc, #0x20]
0007ffe6  add     r3, pc ; -> 0x00379b44  m_pendingMayhemUser
0007ffe8  ldr     r4, [r3]
0007ffea  cbz     r4, #0x7fffa
0007ffec  ldr     r3, [r4, #8]
0007ffee  add.w   r5, r4, #8
0007fff2  mov     r0, r5
0007fff4  ldr     r3, [r3, #8]
0007fff6  blx     r3
0007fff8  cbnz    r0, #0x7fffc
0007fffa  pop     {r4, r5, r7, pc}
0007fffc  ldr     r3, [r4, #8]
0007fffe  mov     r0, r5
00080000  ldr     r3, [r3, #4]
00080002  blx     r3
00080004  b       #0x7fffa
00080006  nop     
00080008  ldr     r3, [sp, #0x168]
0008000a  movs    r7, r5
