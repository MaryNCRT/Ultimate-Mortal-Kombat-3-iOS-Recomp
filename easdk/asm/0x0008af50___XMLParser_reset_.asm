========================================================================
-[XMLParser reset]  0x0008af50  32 bytes   Mayhem.mm
========================================================================

0008af50  push    {r7, lr}
0008af52  add     r7, sp, #0
0008af54  ldr     r3, [pc, #0x10]
0008af56  ldr     r1, [pc, #0x14]
0008af58  add     r3, pc ; -> 0x000f642c  OBJC_IVAR_$_XMLParser.m_dictionary
0008af5a  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
0008af5c  ldr     r3, [r3]
0008af5e  ldr     r1, [r1]
0008af60  ldr     r0, [r0, r3]
0008af62  blx     #0xddbfc ; -> objc_msgSend
0008af66  pop     {r7, pc}
0008af68  push    {r4, r6, r7}
0008af6a  movs    r6, r0
0008af6c  subs    r6, r5, r4
0008af6e  movs    r7, r0
