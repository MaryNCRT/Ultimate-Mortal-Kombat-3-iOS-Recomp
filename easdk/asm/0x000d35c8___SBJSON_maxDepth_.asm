========================================================================
-[SBJSON maxDepth]  0x000d35c8  32 bytes   SBJSON.m
========================================================================

000d35c8  push    {r7, lr}
000d35ca  add     r7, sp, #0
000d35cc  ldr     r3, [pc, #0x10]
000d35ce  ldr     r1, [pc, #0x14]
000d35d0  add     r3, pc ; -> 0x000fa888  OBJC_IVAR_$_SBJSON.jsonParser
000d35d2  add     r1, pc ; -> 0x000fd758  
000d35d4  ldr     r3, [r3]
000d35d6  ldr     r1, [r1]
000d35d8  ldr     r0, [r0, r3]
000d35da  blx     #0xddbfc ; -> objc_msgSend
000d35de  pop     {r7, pc}
000d35e0  strb    r4, [r6, #0xa]
000d35e2  movs    r2, r0
000d35e4  adr     r1, #0x208
000d35e6  movs    r2, r0
