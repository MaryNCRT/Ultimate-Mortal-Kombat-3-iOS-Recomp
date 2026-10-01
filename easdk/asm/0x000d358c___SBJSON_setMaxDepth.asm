========================================================================
-[SBJSON setMaxDepth  0x000d358c  60 bytes   SBJSON.m
========================================================================

000d358c  push    {r4, r5, r6, r7, lr}
000d358e  add     r7, sp, #0xc
000d3590  ldr     r3, [pc, #0x28]
000d3592  ldr     r1, [pc, #0x2c]
000d3594  mov     r5, r0
000d3596  add     r3, pc ; -> 0x000fa888  OBJC_IVAR_$_SBJSON.jsonParser
000d3598  add     r1, pc ; -> 0x000fd770  
000d359a  ldr     r3, [r3]
000d359c  ldr     r4, [r1]
000d359e  mov     r6, r2
000d35a0  ldr     r0, [r0, r3]
000d35a2  mov     r1, r4
000d35a4  blx     #0xddbfc ; -> objc_msgSend
000d35a8  ldr     r3, [pc, #0x18]
000d35aa  mov     r1, r4
000d35ac  mov     r2, r6
000d35ae  add     r3, pc ; -> 0x000fa88c  OBJC_IVAR_$_SBJSON.jsonWriter
000d35b0  ldr     r0, [r3]
000d35b2  ldr     r0, [r5, r0]
000d35b4  blx     #0xddbfc ; -> objc_msgSend
000d35b8  pop     {r4, r5, r6, r7, pc}
000d35ba  nop     
000d35bc  strb    r6, [r5, #0xb]
000d35be  movs    r2, r0
000d35c0  adr     r1, #0x350
000d35c2  movs    r2, r0
000d35c4  strb    r2, [r3, #0xb]
000d35c6  movs    r2, r0
