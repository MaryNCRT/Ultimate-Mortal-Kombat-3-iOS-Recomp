========================================================================
-[SBJSON humanReadable]  0x000d3568  36 bytes   SBJSON.m
========================================================================

000d3568  push    {r7, lr}
000d356a  add     r7, sp, #0
000d356c  ldr     r3, [pc, #0x14]
000d356e  ldr     r1, [pc, #0x18]
000d3570  add     r3, pc ; -> 0x000fa88c  OBJC_IVAR_$_SBJSON.jsonWriter
000d3572  add     r1, pc ; -> 0x000fd754  
000d3574  ldr     r3, [r3]
000d3576  ldr     r1, [r1]
000d3578  ldr     r0, [r0, r3]
000d357a  blx     #0xddbfc ; -> objc_msgSend
000d357e  sxtb    r0, r0
000d3580  pop     {r7, pc}
000d3582  nop     
000d3584  strb    r0, [r3, #0xc]
000d3586  movs    r2, r0
000d3588  adr     r1, #0x378
000d358a  movs    r2, r0
