========================================================================
-[XMLElement addText  0x0008b00c  72 bytes   Mayhem.mm
========================================================================

0008b00c  push    {r4, r5, r7, lr}
0008b00e  add     r7, sp, #8
0008b010  ldr     r3, [pc, #0x30]
0008b012  mov     r5, r0
0008b014  add     r3, pc ; -> 0x000f6444  OBJC_IVAR_$_XMLElement.m_text
0008b016  ldr     r4, [r3]
0008b018  ldr     r0, [r0, r4]
0008b01a  cbz     r0, #0x8b02a
0008b01c  ldr     r1, [pc, #0x28]
0008b01e  add     r1, pc ; -> 0x000fcfe4  
0008b020  ldr     r1, [r1]
0008b022  blx     #0xddbfc ; -> objc_msgSend
0008b026  str     r0, [r5, r4]
0008b028  pop     {r4, r5, r7, pc}
0008b02a  ldr     r1, [pc, #0x20]
0008b02c  mov     r0, r2
0008b02e  add     r1, pc ; -> 0x000fce18  
0008b030  ldr     r1, [r1]
0008b032  blx     #0xddbfc ; -> objc_msgSend
0008b036  ldr     r1, [pc, #0x18]
0008b038  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0008b03a  ldr     r1, [r1]
0008b03c  blx     #0xddbfc ; -> objc_msgSend
0008b040  str     r0, [r5, r4]
0008b042  b       #0x8b028
0008b044  push    {r2, r3, r5}
0008b046  movs    r6, r0
0008b048  subs    r2, r0, #7
0008b04a  movs    r7, r0
0008b04c  adds    r6, r4, #7
0008b04e  movs    r7, r0
0008b050  subs    r4, r3, r0
0008b052  movs    r7, r0
