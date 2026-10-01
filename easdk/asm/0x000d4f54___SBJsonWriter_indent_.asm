========================================================================
-[SBJsonWriter indent]  0x000d4f54  72 bytes   SBJsonWriter.mm
========================================================================

000d4f54  push    {r7, lr}
000d4f56  add     r7, sp, #0
000d4f58  sub     sp, #4
000d4f5a  ldr     r2, [pc, #0x30]
000d4f5c  mov     ip, r0
000d4f5e  ldr     r1, [pc, #0x30]
000d4f60  add     r2, pc ; -> 0x000f32dc  OBJC_IVAR_$_SBJsonBase.depth
000d4f62  ldr     r0, [pc, #0x30]
000d4f64  ldr     r2, [r2]
000d4f66  ldr     r3, [pc, #0x30]
000d4f68  add     r1, pc ; -> 0x000fd918  
000d4f6a  add     r0, pc ; -> 0x00181954  
000d4f6c  ldr     r2, [r2]
000d4f6e  add     r3, pc ; -> 0x0017ffa4  
000d4f70  ldr     r1, [r1]
000d4f72  ldr.w   r2, [ip, r2]
000d4f76  mov.w   ip, #0
000d4f7a  str.w   ip, [sp]
000d4f7e  lsls    r2, r2, #1
000d4f80  adds    r2, #1
000d4f82  blx     #0xddbfc ; -> objc_msgSend
000d4f86  sub.w   sp, r7, #0
000d4f8a  pop     {r7, pc}
000d4f8c  b       #0xd5680
000d4f8e  movs    r1, r0
000d4f90  ldrh    r4, [r5, #0xc]
000d4f92  movs    r2, r0
000d4f94  ldm     r1, {r1, r2, r5, r6, r7}
000d4f96  movs    r2, r1
000d4f98  add     sp, #0xc8
000d4f9a  movs    r2, r1
