========================================================================
-[XMLParser parser  0x0008adcc  36 bytes   Mayhem.mm
========================================================================

0008adcc  push    {r4, r5, r7, lr}
0008adce  add     r7, sp, #8
0008add0  ldr     r3, [pc, #0x14]
0008add2  ldr     r1, [pc, #0x18]
0008add4  mov     r5, r0
0008add6  add     r3, pc ; -> 0x000f6430  OBJC_IVAR_$_XMLParser.m_currentElement
0008add8  add     r1, pc ; -> 0x000fcfcc  '\x1aT\x0e'
0008adda  ldr     r4, [r3]
0008addc  ldr     r1, [r1]
0008adde  ldr     r0, [r0, r4]
0008ade0  blx     #0xddbfc ; -> objc_msgSend
0008ade4  str     r0, [r5, r4]
0008ade6  pop     {r4, r5, r7, pc}
