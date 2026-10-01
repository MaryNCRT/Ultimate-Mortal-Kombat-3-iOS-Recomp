========================================================================
+[SBJsonWriter initialize]  0x000d50ec  80 bytes   SBJsonWriter.mm
========================================================================

000d50ec  push    {r7, lr}
000d50ee  add     r7, sp, #0
000d50f0  ldr     r0, [pc, #0x30]
000d50f2  ldr     r1, [pc, #0x34]
000d50f4  movs    r2, #0
000d50f6  add     r0, pc ; -> 0x000fdcf4  
000d50f8  add     r1, pc ; -> 0x000fd930  '\\\x18\x0f'
000d50fa  movs    r3, #0x20
000d50fc  ldr     r1, [r1]
000d50fe  ldr     r0, [r0]
000d5100  blx     #0xddbfc ; -> objc_msgSend
000d5104  ldr     r1, [pc, #0x24]
000d5106  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000d5108  ldr     r1, [r1]
000d510a  blx     #0xddbfc ; -> objc_msgSend
000d510e  ldr     r1, [pc, #0x20]
000d5110  ldr     r3, [pc, #0x20]
000d5112  ldr     r2, [pc, #0x24]
000d5114  add     r1, pc ; -> 0x000fd92c  'E\x18\x0f'
000d5116  add     r3, pc ; -> 0x006bc15c  ZL12kEscapeChars
000d5118  add     r2, pc ; -> 0x00182234  
000d511a  ldr     r1, [r1]
000d511c  str     r0, [r3]
000d511e  blx     #0xddbfc ; -> objc_msgSend
000d5122  pop     {r7, pc}
000d5124  ldrh    r2, [r7, #0x1e]
000d5126  movs    r2, r0
000d5128  ldrh    r4, [r6]
000d512a  movs    r2, r0
000d512c  ldrb    r6, [r0, #0xf]
000d512e  movs    r2, r0
000d5130  ldrh    r4, [r2]
000d5132  movs    r2, r0
000d5134  strb    r2, [r0, #1]
000d5136  lsls    r6, r3, #1
000d5138  bne     #0xd516c
000d513a  movs    r2, r1
