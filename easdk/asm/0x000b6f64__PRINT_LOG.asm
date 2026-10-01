========================================================================
PRINT_LOG  0x000b6f64  32 bytes   EAMTX_Main.mm
========================================================================

000b6f64  push    {r7, lr}
000b6f66  add     r7, sp, #0
000b6f68  ldr     r3, [pc, #0x10]
000b6f6a  mov     r1, r0
000b6f6c  add     r3, pc ; -> 0x0038c1a8  m_bDebugEnabled
000b6f6e  ldrb    r3, [r3]
000b6f70  cbz     r3, #0xb6f7a
000b6f72  ldr     r0, [pc, #0xc]
000b6f74  add     r0, pc ; -> 0x0017ef54  
000b6f76  blx     #0xdd3e0 ; -> NSLog
000b6f7a  pop     {r7, pc}
000b6f7c  strh    r0, [r7, r0]
000b6f7e  movs    r5, r5
000b6f80  ldrb    r4, [r3, #0x1f]
000b6f82  movs    r4, r1
