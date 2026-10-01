========================================================================
-[SBJSON stringWithObject  0x000d3850  120 bytes   SBJSON.m
========================================================================

000d3850  push    {r4, r5, r6, r7, lr}
000d3852  add     r7, sp, #0xc
000d3854  str     r8, [sp, #-0x4]!
000d3858  ldr     r4, [pc, #0x54]
000d385a  ldr     r1, [pc, #0x58]
000d385c  mov     r6, r0
000d385e  add     r4, pc ; -> 0x000fa88c  OBJC_IVAR_$_SBJSON.jsonWriter
000d3860  add     r1, pc ; -> 0x000fd5dc  
000d3862  ldr     r3, [r4]
000d3864  ldr     r1, [r1]
000d3866  ldr     r0, [r0, r3]
000d3868  blx     #0xddbfc ; -> objc_msgSend
000d386c  mov     r5, r0
000d386e  cbnz    r0, #0xd38a8
000d3870  ldr     r3, [pc, #0x44]
000d3872  ldr     r1, [pc, #0x48]
000d3874  add     r3, pc ; -> 0x000f3320  OBJC_IVAR_$_SBJsonBase.errorTrace
000d3876  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d3878  ldr.w   r8, [r3]
000d387c  ldr     r1, [r1]
000d387e  ldr.w   r3, [r8]
000d3882  ldr     r0, [r6, r3]
000d3884  blx     #0xddbfc ; -> objc_msgSend
000d3888  ldr     r1, [pc, #0x34]
000d388a  ldr     r3, [r4]
000d388c  ldr.w   r8, [r8]
000d3890  add     r1, pc ; -> 0x000fd76c  
000d3892  ldr     r0, [r6, r3]
000d3894  ldr     r1, [r1]
000d3896  blx     #0xddbfc ; -> objc_msgSend
000d389a  ldr     r1, [pc, #0x28]
000d389c  add     r1, pc ; -> 0x000fcf10  'sF\x0e'
000d389e  ldr     r1, [r1]
000d38a0  blx     #0xddbfc ; -> objc_msgSend
000d38a4  str.w   r0, [r6, r8]
000d38a8  mov     r0, r5
000d38aa  ldr     r8, [sp], #4
000d38ae  pop     {r4, r5, r6, r7, pc}
000d38b0  strb    r2, [r5]
000d38b2  movs    r2, r0
000d38b4  ldr     r5, [sp, #0x1e0]
000d38b6  movs    r2, r0
