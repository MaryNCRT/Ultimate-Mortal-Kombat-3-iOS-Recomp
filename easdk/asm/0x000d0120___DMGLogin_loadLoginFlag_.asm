========================================================================
-[DMGLogin loadLoginFlag]  0x000d0120  152 bytes   DMGLogin.mm
========================================================================

000d0120  push    {r4, r5, r6, r7, lr}
000d0122  add     r7, sp, #0xc
000d0124  str     r8, [sp, #-0x4]!
000d0128  ldr     r0, [pc, #0x68]
000d012a  ldr     r1, [pc, #0x6c]
000d012c  ldr     r4, [pc, #0x6c]
000d012e  add     r0, pc ; -> 0x000fdc2c  
000d0130  add     r1, pc ; -> 0x000fd008  ':Z\x0e'
000d0132  ldr     r0, [r0]
000d0134  ldr     r1, [r1]
000d0136  blx     #0xddbfc ; -> objc_msgSend
000d013a  ldr     r1, [pc, #0x64]
000d013c  add     r4, pc ; -> 0x00182194  
000d013e  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d0140  ldr     r5, [r1]
000d0142  mov     r8, r0
000d0144  ldr     r0, [pc, #0x5c]
000d0146  add     r0, pc ; -> 0x000fdb5c  
000d0148  ldr     r6, [r0]
000d014a  blx     #0xdd41c ; -> NSTemporaryDirectory
000d014e  mov     r1, r5
000d0150  mov     r2, r4
000d0152  mov     r3, r0
000d0154  mov     r0, r6
000d0156  blx     #0xddbfc ; -> objc_msgSend
000d015a  ldr     r1, [pc, #0x4c]
000d015c  add     r1, pc ; -> 0x000fd21c  
000d015e  ldr     r1, [r1]
000d0160  mov     r2, r0
000d0162  mov     r0, r8
000d0164  blx     #0xddbfc ; -> objc_msgSend
000d0168  ldr     r1, [pc, #0x40]
000d016a  add     r1, pc ; -> 0x000fcad0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x158
000d016c  ldr     r1, [r1]
000d016e  mov     r2, r0
000d0170  ldr     r0, [pc, #0x3c]
000d0172  add     r0, pc ; -> 0x000fdb8c  
000d0174  ldr     r0, [r0]
000d0176  blx     #0xddbfc ; -> objc_msgSend
000d017a  ldr     r1, [pc, #0x38]
000d017c  add     r1, pc ; -> 0x000fd6d0  
000d017e  ldr     r1, [r1]
000d0180  blx     #0xddbfc ; -> objc_msgSend
000d0184  tst.w   r0, #0xff
000d0188  ite     eq
000d018a  moveq   r0, #0
000d018c  movne   r0, #1
000d018e  ldr     r8, [sp], #4
000d0192  pop     {r4, r5, r6, r7, pc}
000d0194  bge     #0xd018c
000d0196  movs    r2, r0
000d0198  ldm     r6, {r2, r4, r6, r7}
000d019a  movs    r2, r0
000d019c  movs    r0, #0x54
000d019e  movs    r3, r1
000d01a0  ldm     r1, {r1, r2, r3, r4, r6}
000d01a2  movs    r2, r0
000d01a4  bge     #0xd01cc
000d01a6  movs    r2, r0
000d01a8  beq     #0xd0124
000d01aa  movs    r2, r0
000d01ac  ldm     r1, {r1, r5, r6}
000d01ae  movs    r2, r0
000d01b0  bge     #0xd01e0
000d01b2  movs    r2, r0
000d01b4  bpl     #0xd0258
000d01b6  movs    r2, r0
