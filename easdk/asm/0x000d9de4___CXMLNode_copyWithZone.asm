========================================================================
-[CXMLNode copyWithZone  0x000d9de4  80 bytes   CXMLNode.m
========================================================================

000d9de4  push    {r4, r5, r7, lr}
000d9de6  add     r7, sp, #8
000d9de8  ldr     r3, [pc, #0x38]
000d9dea  mov     r4, r0
000d9dec  movs    r1, #1
000d9dee  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9df0  ldr     r3, [r3]
000d9df2  ldr     r0, [r0, r3]
000d9df4  blx     #0xdde48 ; -> xmlCopyNode
000d9df8  ldr     r1, [pc, #0x2c]
000d9dfa  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
000d9dfc  ldr     r1, [r1]
000d9dfe  mov     r5, r0
000d9e00  mov     r0, r4
000d9e02  blx     #0xddbfc ; -> objc_msgSend
000d9e06  ldr     r1, [pc, #0x24]
000d9e08  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d9e0a  ldr     r1, [r1]
000d9e0c  blx     #0xddbfc ; -> objc_msgSend
000d9e10  ldr     r1, [pc, #0x1c]
000d9e12  mov     r2, r5
000d9e14  movs    r3, #1
000d9e16  add     r1, pc ; -> 0x000fda08  
000d9e18  ldr     r1, [r1]
000d9e1a  blx     #0xddbfc ; -> objc_msgSend
000d9e1e  str     r0, [r5]
000d9e20  pop     {r4, r5, r7, pc}
000d9e22  nop     
000d9e24  movs    r2, #0x36
000d9e26  movs    r2, r0
000d9e28  cmp     r4, #0xe
000d9e2a  movs    r2, r0
000d9e2c  cmp     r3, #0x78
000d9e2e  movs    r2, r0
000d9e30  subs    r3, #0xee
000d9e32  movs    r2, r0
