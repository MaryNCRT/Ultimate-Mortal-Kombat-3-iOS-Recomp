========================================================================
MyXmlOutputCloseCallback  0x000d9460  24 bytes   CXMLNode.m
========================================================================

000d9460  push    {r7, lr}
000d9462  add     r7, sp, #0
000d9464  ldr     r1, [pc, #0xc]
000d9466  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d9468  ldr     r1, [r1]
000d946a  blx     #0xddbfc ; -> objc_msgSend
000d946e  movs    r0, #0
000d9470  pop     {r7, pc}
000d9472  nop     
000d9474  adds    r5, #0x12
000d9476  movs    r2, r0
