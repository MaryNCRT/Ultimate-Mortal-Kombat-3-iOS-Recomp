========================================================================
-[SBJSON dealloc]  0x000d38c8  92 bytes   SBJSON.m
========================================================================

000d38c8  push    {r4, r5, r7, lr}
000d38ca  add     r7, sp, #8
000d38cc  sub     sp, #8
000d38ce  ldr     r3, [pc, #0x40]
000d38d0  ldr     r1, [pc, #0x40]
000d38d2  mov     r4, r0
000d38d4  add     r3, pc ; -> 0x000fa88c  OBJC_IVAR_$_SBJSON.jsonWriter
000d38d6  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d38d8  ldr     r3, [r3]
000d38da  ldr     r5, [r1]
000d38dc  ldr     r0, [r0, r3]
000d38de  mov     r1, r5
000d38e0  blx     #0xddbfc ; -> objc_msgSend
000d38e4  ldr     r3, [pc, #0x30]
000d38e6  mov     r1, r5
000d38e8  add     r3, pc ; -> 0x000fa888  OBJC_IVAR_$_SBJSON.jsonParser
000d38ea  ldr     r3, [r3]
000d38ec  ldr     r0, [r4, r3]
000d38ee  blx     #0xddbfc ; -> objc_msgSend
000d38f2  ldr     r3, [pc, #0x28]
000d38f4  ldr     r1, [pc, #0x28]
000d38f6  mov     r0, sp
000d38f8  add     r3, pc ; -> 0x000fddd4  
000d38fa  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000d38fc  ldr     r3, [r3]
000d38fe  ldr     r1, [r1]
000d3900  str     r4, [sp]
000d3902  str     r3, [sp, #4]
000d3904  blx     #0xddc08 ; -> objc_msgSendSuper2
000d3908  sub.w   sp, r7, #8
000d390c  pop     {r4, r5, r7, pc}
000d390e  nop     
000d3910  ldr     r4, [r6, #0x78]
000d3912  movs    r2, r0
000d3914  str     r0, [sp, #0x288]
000d3916  movs    r2, r0
000d3918  ldr     r4, [r3, #0x78]
000d391a  movs    r2, r0
000d391c  adr     r4, #0x360
000d391e  movs    r2, r0
000d3920  str     r0, [sp, #0x288]
000d3922  movs    r2, r0
