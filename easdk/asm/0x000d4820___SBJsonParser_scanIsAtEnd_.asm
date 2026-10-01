========================================================================
-[SBJsonParser scanIsAtEnd]  0x000d4820  64 bytes   SBJsonParser.mm
========================================================================

000d4820  push    {r4, r5, r6, r7, lr}
000d4822  add     r7, sp, #0xc
000d4824  ldr     r6, [pc, #0x34]
000d4826  mov     r5, r0
000d4828  b       #0xd4832
000d482a  ldr     r2, [r4]
000d482c  ldr     r3, [r5, r2]
000d482e  adds    r3, #1
000d4830  str     r3, [r5, r2]
000d4832  mov     r4, r6
000d4834  add     r4, pc
000d4836  mov.w   r1, #0x4000
000d483a  ldr     r3, [r4]
000d483c  ldr     r3, [r5, r3]
000d483e  ldrsb.w r0, [r3]
000d4842  bl      #0xd3f9c ; -> ZL8__istypeim
000d4846  cmp     r0, #0
000d4848  bne     #0xd482a
000d484a  ldr     r0, [r4]
000d484c  ldr     r0, [r5, r0]
000d484e  ldrsb.w r0, [r0]
000d4852  rsbs.w  r0, r0, #1
000d4856  it      lo
000d4858  movlo   r0, #0
000d485a  pop     {r4, r5, r6, r7, pc}
000d485c  str     r0, [r1, #0x30]
000d485e  movs    r2, r0
