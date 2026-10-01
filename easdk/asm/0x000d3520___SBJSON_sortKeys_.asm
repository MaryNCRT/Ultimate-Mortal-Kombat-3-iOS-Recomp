========================================================================
-[SBJSON sortKeys]  0x000d3520  36 bytes   SBJSON.m
========================================================================

000d3520  push    {r7, lr}
000d3522  add     r7, sp, #0
000d3524  ldr     r3, [pc, #0x14]
000d3526  ldr     r1, [pc, #0x18]
000d3528  add     r3, pc ; -> 0x000fa88c  OBJC_IVAR_$_SBJSON.jsonWriter
000d352a  add     r1, pc ; -> 0x000fd74c  
000d352c  ldr     r3, [r3]
000d352e  ldr     r1, [r1]
000d3530  ldr     r0, [r0, r3]
000d3532  blx     #0xddbfc ; -> objc_msgSend
000d3536  sxtb    r0, r0
000d3538  pop     {r7, pc}
000d353a  nop     
000d353c  strb    r0, [r4, #0xd]
000d353e  movs    r2, r0
000d3540  adr     r2, #0x78
000d3542  movs    r2, r0
