========================================================================
-[XMLParser dealloc]  0x0008b2d8  72 bytes   Mayhem.mm
========================================================================

0008b2d8  push    {r4, r7, lr}
0008b2da  add     r7, sp, #4
0008b2dc  sub     sp, #8
0008b2de  ldr     r3, [pc, #0x30]
0008b2e0  ldr     r1, [pc, #0x30]
0008b2e2  mov     r4, r0
0008b2e4  add     r3, pc ; -> 0x000f642c  OBJC_IVAR_$_XMLParser.m_dictionary
0008b2e6  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
0008b2e8  ldr     r3, [r3]
0008b2ea  ldr     r1, [r1]
0008b2ec  ldr     r0, [r0, r3]
0008b2ee  blx     #0xddbfc ; -> objc_msgSend
0008b2f2  ldr     r3, [pc, #0x24]
0008b2f4  ldr     r1, [pc, #0x24]
0008b2f6  mov     r0, sp
0008b2f8  add     r3, pc ; -> 0x000fdd5c  
0008b2fa  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
0008b2fc  ldr     r3, [r3]
0008b2fe  ldr     r1, [r1]
0008b300  str     r4, [sp]
0008b302  str     r3, [sp, #4]
0008b304  blx     #0xddc08 ; -> objc_msgSendSuper2
0008b308  sub.w   sp, r7, #4
0008b30c  pop     {r4, r7, pc}
0008b30e  nop     
0008b310  cbz     r4, #0x8b324
0008b312  movs    r6, r0
0008b314  asrs    r2, r2, #0x1a
0008b316  movs    r7, r0
0008b318  cmp     r2, #0x60
0008b31a  movs    r7, r0
0008b31c  asrs    r2, r4, #0x1a
0008b31e  movs    r7, r0
