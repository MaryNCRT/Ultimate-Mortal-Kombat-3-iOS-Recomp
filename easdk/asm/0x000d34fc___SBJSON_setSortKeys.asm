========================================================================
-[SBJSON setSortKeys  0x000d34fc  36 bytes   SBJSON.m
========================================================================

000d34fc  push    {r7, lr}
000d34fe  add     r7, sp, #0
000d3500  ldr     r3, [pc, #0x14]
000d3502  ldr     r1, [pc, #0x18]
000d3504  sxtb    r2, r2
000d3506  add     r3, pc ; -> 0x000fa88c  OBJC_IVAR_$_SBJSON.jsonWriter
000d3508  add     r1, pc ; -> 0x000fd748  
000d350a  ldr     r3, [r3]
000d350c  ldr     r1, [r1]
000d350e  ldr     r0, [r0, r3]
000d3510  blx     #0xddbfc ; -> objc_msgSend
000d3514  pop     {r7, pc}
000d3516  nop     
000d3518  strb    r2, [r0, #0xe]
000d351a  movs    r2, r0
000d351c  adr     r2, #0xf0
000d351e  movs    r2, r0
