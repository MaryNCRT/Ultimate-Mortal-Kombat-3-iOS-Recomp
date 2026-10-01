========================================================================
-[FBXMLHandler dealloc]  0x000884b0  164 bytes   FBXMLHandler.m
========================================================================

000884b0  push    {r4, r5, r7, lr}
000884b2  add     r7, sp, #8
000884b4  sub     sp, #8
000884b6  ldr     r3, [pc, #0x78]
000884b8  ldr     r1, [pc, #0x78]
000884ba  mov     r4, r0
000884bc  add     r3, pc ; -> 0x000f6034  OBJC_IVAR_$_FBXMLHandler._stack
000884be  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000884c0  ldr     r3, [r3]
000884c2  ldr     r5, [r1]
000884c4  ldr     r0, [r0, r3]
000884c6  mov     r1, r5
000884c8  blx     #0xddbfc ; -> objc_msgSend
000884cc  ldr     r3, [pc, #0x68]
000884ce  mov     r1, r5
000884d0  add     r3, pc ; -> 0x000f6038  OBJC_IVAR_$_FBXMLHandler._nameStack
000884d2  ldr     r3, [r3]
000884d4  ldr     r0, [r4, r3]
000884d6  blx     #0xddbfc ; -> objc_msgSend
000884da  ldr     r3, [pc, #0x60]
000884dc  mov     r1, r5
000884de  add     r3, pc ; -> 0x000f603c  OBJC_IVAR_$_FBXMLHandler._rootObject
000884e0  ldr     r3, [r3]
000884e2  ldr     r0, [r4, r3]
000884e4  blx     #0xddbfc ; -> objc_msgSend
000884e8  ldr     r3, [pc, #0x54]
000884ea  mov     r1, r5
000884ec  add     r3, pc ; -> 0x000f6040  OBJC_IVAR_$_FBXMLHandler._rootName
000884ee  ldr     r3, [r3]
000884f0  ldr     r0, [r4, r3]
000884f2  blx     #0xddbfc ; -> objc_msgSend
000884f6  ldr     r3, [pc, #0x4c]
000884f8  mov     r1, r5
000884fa  add     r3, pc ; -> 0x000f6044  OBJC_IVAR_$_FBXMLHandler._chars
000884fc  ldr     r3, [r3]
000884fe  ldr     r0, [r4, r3]
00088500  blx     #0xddbfc ; -> objc_msgSend
00088504  ldr     r3, [pc, #0x40]
00088506  mov     r1, r5
00088508  add     r3, pc ; -> 0x000f6048  OBJC_IVAR_$_FBXMLHandler._parseError
0008850a  ldr     r3, [r3]
0008850c  ldr     r0, [r4, r3]
0008850e  blx     #0xddbfc ; -> objc_msgSend
00088512  ldr     r3, [pc, #0x38]
00088514  ldr     r1, [pc, #0x38]
00088516  mov     r0, sp
00088518  add     r3, pc ; -> 0x000fdd54  
0008851a  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
0008851c  ldr     r3, [r3]
0008851e  ldr     r1, [r1]
00088520  str     r4, [sp]
00088522  str     r3, [sp, #4]
00088524  blx     #0xddc08 ; -> objc_msgSendSuper2
00088528  sub.w   sp, r7, #8
0008852c  pop     {r4, r5, r7, pc}
0008852e  nop     
00088530  blt     #0x8861c
00088532  movs    r6, r0
00088534  add     sl, r7
00088536  movs    r7, r0
00088538  blt     #0x88604
0008853a  movs    r6, r0
0008853c  blt     #0x885f4
0008853e  movs    r6, r0
00088540  blt     #0x885e4
00088542  movs    r6, r0
00088544  blt     #0x885d4
00088546  movs    r6, r0
00088548  blt     #0x885c4
0008854a  movs    r6, r0
0008854c  ldr     r0, [r7, r0]
0008854e  movs    r7, r0
00088550  add     sl, r0
00088552  movs    r7, r0
