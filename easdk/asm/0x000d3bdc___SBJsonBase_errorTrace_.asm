========================================================================
-[SBJsonBase errorTrace]  0x000d3bdc  24 bytes   SBJsonBase.m
========================================================================

000d3bdc  push    {r7, lr}
000d3bde  add     r7, sp, #0
000d3be0  ldr     r2, [pc, #0xc]
000d3be2  movs    r3, #1
000d3be4  add     r2, pc ; -> 0x000faa08  OBJC_IVAR_$_SBJsonBase.errorTrace
000d3be6  ldr     r2, [r2]
000d3be8  blx     #0xddbf0 ; -> objc_getProperty
000d3bec  pop     {r7, pc}
000d3bee  nop     
000d3bf0  ldr     r0, [r4, #0x60]
000d3bf2  movs    r2, r0
