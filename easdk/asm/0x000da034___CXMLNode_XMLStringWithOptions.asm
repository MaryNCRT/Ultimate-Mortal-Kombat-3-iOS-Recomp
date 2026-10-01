========================================================================
-[CXMLNode XMLStringWithOptions  0x000da034  192 bytes   CXMLNode.m
========================================================================

000da034  push    {r4, r5, r6, r7, lr}
000da036  add     r7, sp, #0xc
000da038  str     r8, [sp, #-0x4]!
000da03c  sub     sp, #8
000da03e  ldr     r1, [pc, #0x8c]
000da040  mov     r8, r0
000da042  ldr     r0, [pc, #0x8c]
000da044  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000da046  ldr     r6, [r1]
000da048  add     r0, pc ; -> 0x000fdbbc  
000da04a  ldr     r0, [r0]
000da04c  mov     r1, r6
000da04e  blx     #0xddbfc ; -> objc_msgSend
000da052  ldr     r1, [pc, #0x80]
000da054  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000da056  ldr     r1, [r1]
000da058  blx     #0xddbfc ; -> objc_msgSend
000da05c  ldr     r1, [pc, #0x78]
000da05e  movs    r3, #0
000da060  add     r1, pc ; -> 0x000d9461  MyXmlOutputCloseCallback
000da062  mov     r4, r0
000da064  ldr     r0, [pc, #0x74]
000da066  mov     r2, r4
000da068  add     r0, pc ; -> 0x000d9479  MyXmlOutputWriteCallback
000da06a  blx     #0xddec0 ; -> xmlOutputBufferCreateIO
000da06e  ldr     r3, [pc, #0x70]
000da070  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000da072  mov     r5, r0
000da074  ldr     r0, [r3]
000da076  movs    r3, #0
000da078  ldr.w   r2, [r8, r0]
000da07c  ldr     r0, [pc, #0x64]
000da07e  ldr     r1, [r2, #0x20]
000da080  add     r0, pc ; -> 0x000ed78c  'utf-8'
000da082  str     r0, [sp, #4]
000da084  mov     r0, r5
000da086  str     r3, [sp]
000da088  blx     #0xdde9c ; -> xmlNodeDumpOutput
000da08c  mov     r0, r5
000da08e  blx     #0xddecc ; -> xmlOutputBufferFlush
000da092  ldr     r0, [pc, #0x54]
000da094  mov     r1, r6
000da096  add     r0, pc ; -> 0x000fdb5c  
000da098  ldr     r0, [r0]
000da09a  blx     #0xddbfc ; -> objc_msgSend
000da09e  ldr     r1, [pc, #0x4c]
000da0a0  mov     r2, r4
000da0a2  movs    r3, #4
000da0a4  add     r1, pc ; -> 0x000fcfb4  '_U\x0e'
000da0a6  ldr     r1, [r1]
000da0a8  blx     #0xddbfc ; -> objc_msgSend
000da0ac  ldr     r1, [pc, #0x40]
000da0ae  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000da0b0  ldr     r1, [r1]
000da0b2  blx     #0xddbfc ; -> objc_msgSend
000da0b6  mov     r4, r0
000da0b8  mov     r0, r5
000da0ba  blx     #0xddeb4 ; -> xmlOutputBufferClose
000da0be  mov     r0, r4
000da0c0  sub.w   sp, r7, #0x10
000da0c4  ldr     r8, [sp], #4
000da0c8  pop     {r4, r5, r6, r7, pc}
000da0ca  nop     
000da0cc  cmp     r1, #0x3c
000da0ce  movs    r2, r0
000da0d0  subs    r3, #0x70
000da0d2  movs    r2, r0
000da0d4  cmp     r1, #0x28
000da0d6  movs    r2, r0
000da0d8  bl      #0x4d80da
000da0dc  bl      #0xffce80de
000da0e0  subs    r4, r6, #6
000da0e2  movs    r2, r0
000da0e4  adds    r7, #8
000da0e6  movs    r1, r0
000da0e8  subs    r2, #0xc2
000da0ea  movs    r2, r0
000da0ec  cmp     r7, #0xc
000da0ee  movs    r2, r0
000da0f0  cmp     r1, #0xa6
000da0f2  movs    r2, r0
