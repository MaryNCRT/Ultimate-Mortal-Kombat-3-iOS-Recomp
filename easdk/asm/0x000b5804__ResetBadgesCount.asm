========================================================================
ResetBadgesCount  0x000b5804  72 bytes   EAMTX_Main.mm
========================================================================

000b5804  push    {r4, r5, r7, lr}
000b5806  add     r7, sp, #8
000b5808  ldr     r4, [pc, #0x34]
000b580a  mov     r5, r0
000b580c  rsbs.w  r3, r5, #1
000b5810  it      lo
000b5812  movlo   r3, #0
000b5814  add     r4, pc ; -> 0x0038c194  m_BadgesDict
000b5816  ldr     r0, [r4]
000b5818  cmp     r0, #0
000b581a  it      eq
000b581c  orreq   r3, r3, #1
000b5820  cbnz    r3, #0xb583e
000b5822  ldr     r1, [pc, #0x20]
000b5824  mov     r2, r5
000b5826  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000b5828  ldr     r1, [r1]
000b582a  blx     #0xddbfc ; -> objc_msgSend
000b582e  cbz     r0, #0xb583e
000b5830  ldr     r1, [pc, #0x14]
000b5832  ldr     r0, [r4]
000b5834  mov     r2, r5
000b5836  add     r1, pc ; -> 0x000fcefc  '\x11B\x0e'
000b5838  ldr     r1, [r1]
000b583a  blx     #0xddbfc ; -> objc_msgSend
000b583e  pop     {r4, r5, r7, pc}
000b5840  ldr     r4, [r7, #0x14]
000b5842  movs    r5, r5
000b5844  strb    r6, [r0, #0xb]
000b5846  movs    r4, r0
000b5848  strb    r2, [r0, #0x1b]
000b584a  movs    r4, r0
