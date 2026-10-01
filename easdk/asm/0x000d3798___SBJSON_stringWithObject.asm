========================================================================
-[SBJSON stringWithObject  0x000d3798  184 bytes   SBJSON.m
========================================================================

000d3798  push    {r4, r5, r6, r7, lr}
000d379a  add     r7, sp, #0xc
000d379c  str     r8, [sp, #-0x4]!
000d37a0  tst.w   r3, #0xff
000d37a4  mov     r5, r0
000d37a6  beq     #0xd37b6
000d37a8  ldr     r3, [pc, #0x7c]
000d37aa  ldr     r1, [pc, #0x80]
000d37ac  add     r3, pc ; -> 0x000fa88c  OBJC_IVAR_$_SBJSON.jsonWriter
000d37ae  add     r1, pc ; -> 0x000fd768  
000d37b0  ldr     r3, [r3]
000d37b2  ldr     r0, [r0, r3]
000d37b4  b       #0xd37c2
000d37b6  ldr     r3, [pc, #0x78]
000d37b8  ldr     r1, [pc, #0x78]
000d37ba  add     r3, pc ; -> 0x000fa88c  OBJC_IVAR_$_SBJSON.jsonWriter
000d37bc  add     r1, pc ; -> 0x000fd5dc  
000d37be  ldr     r3, [r3]
000d37c0  ldr     r0, [r0, r3]
000d37c2  ldr     r1, [r1]
000d37c4  blx     #0xddbfc ; -> objc_msgSend
000d37c8  mov     r4, r0
000d37ca  cbnz    r0, #0xd381e
000d37cc  ldr     r3, [pc, #0x68]
000d37ce  ldr     r1, [pc, #0x6c]
000d37d0  add     r3, pc ; -> 0x000f3320  OBJC_IVAR_$_SBJsonBase.errorTrace
000d37d2  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d37d4  ldr.w   r8, [r3]
000d37d8  ldr     r1, [r1]
000d37da  ldr.w   r3, [r8]
000d37de  ldr     r0, [r5, r3]
000d37e0  blx     #0xddbfc ; -> objc_msgSend
000d37e4  ldr     r3, [pc, #0x58]
000d37e6  ldr     r1, [pc, #0x5c]
000d37e8  ldr.w   r6, [r8]
000d37ec  add     r3, pc ; -> 0x000fa88c  OBJC_IVAR_$_SBJSON.jsonWriter
000d37ee  add     r1, pc ; -> 0x000fd76c  
000d37f0  ldr     r3, [r3]
000d37f2  ldr     r1, [r1]
000d37f4  ldr     r0, [r5, r3]
000d37f6  blx     #0xddbfc ; -> objc_msgSend
000d37fa  ldr     r1, [pc, #0x4c]
000d37fc  add     r1, pc ; -> 0x000fcf10  'sF\x0e'
000d37fe  ldr     r1, [r1]
000d3800  blx     #0xddbfc ; -> objc_msgSend
000d3804  ldr     r1, [sp, #0x18]
000d3806  str     r0, [r5, r6]
000d3808  cbz     r1, #0xd381e
000d380a  ldr     r1, [pc, #0x40]
000d380c  ldr.w   r0, [r8]
000d3810  add     r1, pc ; -> 0x000fcf38  '\x12G\x0e'
000d3812  ldr     r0, [r5, r0]
000d3814  ldr     r1, [r1]
000d3816  blx     #0xddbfc ; -> objc_msgSend
000d381a  ldr     r3, [sp, #0x18]
000d381c  str     r0, [r3]
000d381e  mov     r0, r4
000d3820  ldr     r8, [sp], #4
000d3824  pop     {r4, r5, r6, r7, pc}
000d3826  nop     
000d3828  strb    r4, [r3, #3]
000d382a  movs    r2, r0
000d382c  ldr     r7, [sp, #0x2d8]
000d382e  movs    r2, r0
000d3830  strb    r6, [r1, #3]
000d3832  movs    r2, r0
000d3834  ldr     r6, [sp, #0x70]
000d3836  movs    r2, r0
000d3838  smlsd   r0, ip, r1, r0
000d383c  str     r1, [sp, #0x298]
000d383e  movs    r2, r0
000d3840  strb    r4, [r3, #2]
000d3842  movs    r2, r0
000d3844  ldr     r7, [sp, #0x1e8]
000d3846  movs    r2, r0
000d3848  str     r7, [sp, #0x40]
000d384a  movs    r2, r0
000d384c  str     r7, [sp, #0x90]
000d384e  movs    r2, r0
