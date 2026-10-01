========================================================================
EASDK_GetTickerUrl  0x0007ed00  60 bytes   EASDK_Handler.mm
========================================================================

0007ed00  push    {r4, r7, lr}
0007ed02  add     r7, sp, #4
0007ed04  sub     sp, #4
0007ed06  ldr     r3, [pc, #0x28]
0007ed08  ldr     r1, [pc, #0x28]
0007ed0a  ldr     r4, [pc, #0x2c]
0007ed0c  add     r3, pc ; -> 0x000f3368  OBJC_IVAR_$_EAMTX_Ticker.m_URL
0007ed0e  add     r1, pc ; -> 0x000fcbc4  'Rm\x0e'
0007ed10  ldr     r3, [r3]
0007ed12  add     r4, pc ; -> 0x00375b34  convBuffer
0007ed14  ldr     r1, [r1]
0007ed16  mov     r2, r4
0007ed18  ldr     r3, [r3]
0007ed1a  ldr     r0, [r0, r3]
0007ed1c  movs    r3, #4
0007ed1e  str     r3, [sp]
0007ed20  mov.w   r3, #0x4000
0007ed24  blx     #0xddbfc ; -> objc_msgSend
0007ed28  mov     r0, r4
0007ed2a  sub.w   sp, r7, #4
0007ed2e  pop     {r4, r7, pc}
0007ed30  mov     r0, fp
0007ed32  movs    r7, r0
0007ed34  udf     #0xb2
0007ed36  movs    r7, r0
0007ed38  ldr     r6, [r3, #0x60]
0007ed3a  movs    r7, r5
