========================================================================
-[SBJSON setHumanReadable  0x000d3544  36 bytes   SBJSON.m
========================================================================

000d3544  push    {r7, lr}
000d3546  add     r7, sp, #0
000d3548  ldr     r3, [pc, #0x14]
000d354a  ldr     r1, [pc, #0x18]
000d354c  sxtb    r2, r2
000d354e  add     r3, pc ; -> 0x000fa88c  OBJC_IVAR_$_SBJSON.jsonWriter
000d3550  add     r1, pc ; -> 0x000fd750  
000d3552  ldr     r3, [r3]
000d3554  ldr     r1, [r1]
000d3556  ldr     r0, [r0, r3]
000d3558  blx     #0xddbfc ; -> objc_msgSend
000d355c  pop     {r7, pc}
000d355e  nop     
000d3560  strb    r2, [r7, #0xc]
000d3562  movs    r2, r0
000d3564  adr     r1, #0x3f0
000d3566  movs    r2, r0
