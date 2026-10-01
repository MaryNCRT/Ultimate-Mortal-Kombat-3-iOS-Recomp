========================================================================
-[CXMLDocument initWithData  0x000d8ed0  36 bytes   CXMLDocument.m
========================================================================

000d8ed0  push    {r7, lr}
000d8ed2  add     r7, sp, #0
000d8ed4  sub     sp, #8
000d8ed6  ldr     r1, [pc, #0x18]
000d8ed8  str     r3, [sp]
000d8eda  ldr     r3, [sp, #0x10]
000d8edc  add     r1, pc ; -> 0x000fd858  '7\x0f\x0f'
000d8ede  ldr     r1, [r1]
000d8ee0  str     r3, [sp, #4]
000d8ee2  movs    r3, #4
000d8ee4  blx     #0xddbfc ; -> objc_msgSend
000d8ee8  sub.w   sp, r7, #0
000d8eec  pop     {r7, pc}
000d8eee  nop     
000d8ef0  ldr     r1, [pc, #0x1e0]
000d8ef2  movs    r2, r0
