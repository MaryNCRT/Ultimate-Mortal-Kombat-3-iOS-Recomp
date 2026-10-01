========================================================================
-[XMLElement init  0x0008b054  72 bytes   Mayhem.mm
========================================================================

0008b054  push    {r4, r5, r7, lr}
0008b056  add     r7, sp, #8
0008b058  ldr     r3, [pc, #0x2c]
0008b05a  mov     r4, r0
0008b05c  ldr     r1, [pc, #0x2c]
0008b05e  add     r3, pc ; -> 0x000f6438  OBJC_IVAR_$_XMLElement.m_name
0008b060  ldr     r3, [r3]
0008b062  add     r1, pc ; -> 0x000fcfe8  
0008b064  ldr     r1, [r1]
0008b066  str     r2, [r0, r3]
0008b068  ldr     r0, [pc, #0x24]
0008b06a  ldr     r3, [pc, #0x28]
0008b06c  add     r0, pc ; -> 0x000fdbf4  
0008b06e  add     r3, pc ; -> 0x000f6440  OBJC_IVAR_$_XMLElement.m_children
0008b070  ldr     r0, [r0]
0008b072  ldr     r5, [r3]
0008b074  blx     #0xddbfc ; -> objc_msgSend
0008b078  ldr     r1, [pc, #0x1c]
0008b07a  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0008b07c  ldr     r1, [r1]
0008b07e  blx     #0xddbfc ; -> objc_msgSend
0008b082  str     r0, [r4, r5]
0008b084  mov     r0, r4
0008b086  pop     {r4, r5, r7, pc}
0008b088  cbz     r6, #0x8b100
0008b08a  movs    r6, r0
0008b08c  subs    r2, r0, #6
0008b08e  movs    r7, r0
0008b090  cmp     r3, #0x84
0008b092  movs    r7, r0
0008b094  cbz     r6, #0x8b10a
0008b096  movs    r6, r0
0008b098  adds    r2, r3, r7
0008b09a  movs    r7, r0
