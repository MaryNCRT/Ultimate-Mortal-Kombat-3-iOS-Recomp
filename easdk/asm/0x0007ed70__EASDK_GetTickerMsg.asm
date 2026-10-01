========================================================================
EASDK_GetTickerMsg  0x0007ed70  32 bytes   EASDK_Handler.mm
========================================================================

0007ed70  push    {r7, lr}
0007ed72  add     r7, sp, #0
0007ed74  ldr     r3, [pc, #0x10]
0007ed76  add     r3, pc ; -> 0x000f3380  OBJC_IVAR_$_EAMTX_Ticker.m_Message
0007ed78  ldr     r3, [r3]
0007ed7a  ldr     r3, [r3]
0007ed7c  ldr     r0, [r0, r3]
0007ed7e  bl      #0x7ed3c ; -> Z19EASDK_GetTickerTextP8NSString
0007ed82  ldr     r0, [pc, #8]
0007ed84  add     r0, pc ; -> 0x00375b34  convBuffer
0007ed86  pop     {r7, pc}
0007ed88  mov     r6, r0
0007ed8a  movs    r7, r0
0007ed8c  ldr     r4, [r5, #0x58]
0007ed8e  movs    r7, r5
