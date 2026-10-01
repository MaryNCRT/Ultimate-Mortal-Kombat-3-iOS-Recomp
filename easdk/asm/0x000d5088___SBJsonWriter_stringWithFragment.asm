========================================================================
-[SBJsonWriter stringWithFragment  0x000d5088  100 bytes   SBJsonWriter.mm
========================================================================

000d5088  push    {r4, r5, r6, r7, lr}
000d508a  add     r7, sp, #0xc
000d508c  ldr     r1, [pc, #0x48]
000d508e  mov     r4, r0
000d5090  mov     r6, r2
000d5092  add     r1, pc ; -> 0x000fd928  
000d5094  ldr     r1, [r1]
000d5096  blx     #0xddbfc ; -> objc_msgSend
000d509a  ldr     r3, [pc, #0x40]
000d509c  ldr     r0, [pc, #0x40]
000d509e  ldr     r1, [pc, #0x44]
000d50a0  add     r3, pc ; -> 0x000f32dc  OBJC_IVAR_$_SBJsonBase.depth
000d50a2  add     r0, pc ; -> 0x000fdbf8  
000d50a4  ldr     r3, [r3]
000d50a6  add     r1, pc ; -> 0x000fcea0  
000d50a8  movs    r2, #0
000d50aa  ldr     r1, [r1]
000d50ac  ldr     r3, [r3]
000d50ae  ldr     r0, [r0]
000d50b0  str     r2, [r4, r3]
000d50b2  adds    r2, #0x80
000d50b4  blx     #0xddbfc ; -> objc_msgSend
000d50b8  ldr     r1, [pc, #0x2c]
000d50ba  mov     r2, r6
000d50bc  add     r1, pc ; -> 0x000fd924  
000d50be  ldr     r1, [r1]
000d50c0  mov     r5, r0
000d50c2  mov     r3, r5
000d50c4  mov     r0, r4
000d50c6  blx     #0xddbfc ; -> objc_msgSend
000d50ca  uxtb    r0, r0
000d50cc  cmp     r0, #0
000d50ce  ite     ne
000d50d0  movne   r0, r5
000d50d2  moveq   r0, #0
000d50d4  pop     {r4, r5, r6, r7, pc}
000d50d6  nop     
000d50d8  ldrh    r2, [r2, #4]
000d50da  movs    r2, r0
000d50dc  b       #0xd5550
000d50de  movs    r1, r0
000d50e0  ldrh    r2, [r2, #0x1a]
000d50e2  movs    r2, r0
000d50e4  ldrb    r6, [r6, #0x17]
000d50e6  movs    r2, r0
000d50e8  ldrh    r4, [r4, #2]
000d50ea  movs    r2, r0
