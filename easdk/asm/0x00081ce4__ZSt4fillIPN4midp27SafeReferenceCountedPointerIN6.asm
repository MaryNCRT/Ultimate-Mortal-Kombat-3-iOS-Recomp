========================================================================
ZSt4fillIPN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEES4_EvT_S6_RKT0_  0x00081ce4  80 bytes   EASDK_Handler.mm
========================================================================

00081ce4  push    {r4, r5, r6, r7, lr}
00081ce6  add     r7, sp, #0xc
00081ce8  push.w  {r8, sl}
00081cec  cmp     r0, r1
00081cee  mov     r6, r0
00081cf0  mov     r8, r1
00081cf2  mov     sl, r2
00081cf4  bne     #0x81cfe
00081cf6  b       #0x81d2e
00081cf8  adds    r6, #4
00081cfa  cmp     r8, r6
00081cfc  beq     #0x81d2e
00081cfe  ldr.w   r4, [sl]
00081d02  cbz     r4, #0x81d0c
00081d04  ldr     r3, [r4]
00081d06  mov     r0, r4
00081d08  ldr     r3, [r3, #0xc]
00081d0a  blx     r3
00081d0c  ldr     r5, [r6]
00081d0e  str     r4, [r6]
00081d10  cmp     r5, #0
00081d12  beq     #0x81cf8
00081d14  ldr     r3, [r5]
00081d16  mov     r0, r5
00081d18  ldr     r3, [r3, #8]
00081d1a  blx     r3
00081d1c  cmp     r0, #0
00081d1e  beq     #0x81cf8
00081d20  ldr     r3, [r5]
00081d22  mov     r0, r5
00081d24  adds    r6, #4
00081d26  ldr     r3, [r3, #4]
00081d28  blx     r3
00081d2a  cmp     r8, r6
00081d2c  bne     #0x81cfe
00081d2e  pop.w   {r8, sl}
00081d32  pop     {r4, r5, r6, r7, pc}
