========================================================================
-[XMLParser parser  0x0008adf0  352 bytes   Mayhem.mm
========================================================================

0008adf0  push    {r4, r5, r6, r7, lr}
0008adf2  add     r7, sp, #0xc
0008adf4  push.w  {r8, sl}
0008adf8  mov     r8, r3
0008adfa  ldr     r3, [pc, #0xfc]
0008adfc  mov     r6, r0
0008adfe  ldr.w   sl, [sp, #0x24]
0008ae02  add     r3, pc ; -> 0x000f6430  OBJC_IVAR_$_XMLParser.m_currentElement
0008ae04  ldr     r3, [r3]
0008ae06  ldr     r3, [r0, r3]
0008ae08  cmp     r3, #0
0008ae0a  beq     #0x8ae60
0008ae0c  ldr     r0, [pc, #0xec]
0008ae0e  ldr     r1, [pc, #0xf0]
0008ae10  ldr     r5, [pc, #0xf0]
0008ae12  add     r0, pc ; -> 0x000fdc20  
0008ae14  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0008ae16  ldr     r0, [r0]
0008ae18  ldr     r1, [r1]
0008ae1a  blx     #0xddbfc ; -> objc_msgSend
0008ae1e  ldr     r1, [pc, #0xe8]
0008ae20  mov     r2, r8
0008ae22  add     r5, pc ; -> 0x000f6430  OBJC_IVAR_$_XMLParser.m_currentElement
0008ae24  add     r1, pc ; -> 0x000fcf48  
0008ae26  ldr     r1, [r1]
0008ae28  blx     #0xddbfc ; -> objc_msgSend
0008ae2c  ldr     r1, [pc, #0xdc]
0008ae2e  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0008ae30  ldr     r1, [r1]
0008ae32  blx     #0xddbfc ; -> objc_msgSend
0008ae36  ldr     r1, [pc, #0xd8]
0008ae38  mov     r2, sl
0008ae3a  add     r1, pc ; -> 0x000fcfd4  
0008ae3c  ldr     r1, [r1]
0008ae3e  mov     r4, r0
0008ae40  blx     #0xddbfc ; -> objc_msgSend
0008ae44  ldr     r1, [pc, #0xcc]
0008ae46  ldr     r3, [r5]
0008ae48  mov     r2, r8
0008ae4a  add     r1, pc ; -> 0x000fcfd0  
0008ae4c  ldr     r0, [r6, r3]
0008ae4e  ldr     r1, [r1]
0008ae50  mov     r3, r4
0008ae52  blx     #0xddbfc ; -> objc_msgSend
0008ae56  ldr     r3, [r5]
0008ae58  str     r4, [r6, r3]
0008ae5a  pop.w   {r8, sl}
0008ae5e  pop     {r4, r5, r6, r7, pc}
0008ae60  ldr     r3, [pc, #0xb4]
0008ae62  ldr     r1, [pc, #0xb8]
0008ae64  mov     r2, r8
0008ae66  add     r3, pc ; -> 0x000f642c  OBJC_IVAR_$_XMLParser.m_dictionary
0008ae68  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
0008ae6a  ldr     r3, [r3]
0008ae6c  ldr     r1, [r1]
0008ae6e  ldr     r0, [r0, r3]
0008ae70  blx     #0xddbfc ; -> objc_msgSend
0008ae74  cbz     r0, #0x8aec4
0008ae76  mov     r5, r0
0008ae78  ldr     r0, [pc, #0xa4]
0008ae7a  ldr     r1, [pc, #0xa8]
0008ae7c  add     r0, pc ; -> 0x000fdc20  
0008ae7e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0008ae80  ldr     r0, [r0]
0008ae82  ldr     r1, [r1]
0008ae84  blx     #0xddbfc ; -> objc_msgSend
0008ae88  ldr     r1, [pc, #0x9c]
0008ae8a  mov     r2, r8
0008ae8c  add     r1, pc ; -> 0x000fcf48  
0008ae8e  ldr     r1, [r1]
0008ae90  blx     #0xddbfc ; -> objc_msgSend
0008ae94  ldr     r1, [pc, #0x94]
0008ae96  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0008ae98  ldr     r1, [r1]
0008ae9a  blx     #0xddbfc ; -> objc_msgSend
0008ae9e  ldr     r1, [pc, #0x90]
0008aea0  mov     r2, sl
0008aea2  add     r1, pc ; -> 0x000fcfd4  
0008aea4  ldr     r1, [r1]
0008aea6  mov     r4, r0
0008aea8  blx     #0xddbfc ; -> objc_msgSend
0008aeac  ldr     r1, [pc, #0x84]
0008aeae  mov     r0, r5
0008aeb0  mov     r2, r4
0008aeb2  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
0008aeb4  ldr     r1, [r1]
0008aeb6  blx     #0xddbfc ; -> objc_msgSend
0008aeba  ldr     r3, [pc, #0x7c]
0008aebc  add     r3, pc ; -> 0x000f6430  OBJC_IVAR_$_XMLParser.m_currentElement
0008aebe  ldr     r3, [r3]
0008aec0  str     r4, [r6, r3]
0008aec2  b       #0x8ae5a
0008aec4  ldr     r0, [pc, #0x74]
0008aec6  ldr     r1, [pc, #0x78]
0008aec8  add     r0, pc ; -> 0x000fdb70  
0008aeca  add     r1, pc ; -> 0x000fcfe8  
0008aecc  ldr     r0, [r0]
0008aece  ldr     r1, [r1]
0008aed0  blx     #0xddbfc ; -> objc_msgSend
0008aed4  ldr     r1, [pc, #0x6c]
0008aed6  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0008aed8  ldr     r1, [r1]
0008aeda  blx     #0xddbfc ; -> objc_msgSend
0008aede  ldr     r3, [pc, #0x68]
0008aee0  ldr     r1, [pc, #0x68]
0008aee2  add     r3, pc ; -> 0x000f642c  OBJC_IVAR_$_XMLParser.m_dictionary
0008aee4  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
0008aee6  ldr     r3, [r3]
0008aee8  ldr     r1, [r1]
0008aeea  mov     r5, r0
0008aeec  mov     r2, r5
0008aeee  ldr     r0, [r6, r3]
0008aef0  mov     r3, r8
0008aef2  blx     #0xddbfc ; -> objc_msgSend
0008aef6  b       #0x8ae78
