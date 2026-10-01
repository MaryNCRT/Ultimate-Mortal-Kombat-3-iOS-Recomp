========================================================================
removeSpaces  0x000b63dc  72 bytes   EAMTX_Main.mm
========================================================================

000b63dc  push    {r4, r5, r7, lr}
000b63de  add     r7, sp, #8
000b63e0  ldr     r1, [pc, #0x2c]
000b63e2  ldr     r5, [pc, #0x30]
000b63e4  ldr     r2, [pc, #0x30]
000b63e6  add     r1, pc ; -> 0x000fcaec  '\x19\x1a\x0e'
000b63e8  add     r5, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000b63ea  ldr     r4, [r1]
000b63ec  mov     r3, r5
000b63ee  add     r2, pc ; -> 0x0017ffa4  
000b63f0  mov     r1, r4
000b63f2  blx     #0xddbfc ; -> objc_msgSend
000b63f6  ldr     r2, [pc, #0x24]
000b63f8  mov     r1, r4
000b63fa  mov     r3, r5
000b63fc  add     r2, pc ; -> 0x0017ffb4  
000b63fe  blx     #0xddbfc ; -> objc_msgSend
000b6402  ldr     r2, [pc, #0x1c]
000b6404  mov     r1, r4
000b6406  mov     r3, r5
000b6408  add     r2, pc ; -> 0x0017ffc4  
000b640a  blx     #0xddbfc ; -> objc_msgSend
000b640e  pop     {r4, r5, r7, pc}
000b6410  str     r2, [r0, #0x70]
000b6412  movs    r4, r0
000b6414  ldrb    r0, [r1, #0x1c]
000b6416  movs    r4, r1
000b6418  ldr     r3, [sp, #0x2c8]
000b641a  movs    r4, r1
000b641c  ldr     r3, [sp, #0x2d0]
000b641e  movs    r4, r1
000b6420  ldr     r3, [sp, #0x2e0]
000b6422  movs    r4, r1
