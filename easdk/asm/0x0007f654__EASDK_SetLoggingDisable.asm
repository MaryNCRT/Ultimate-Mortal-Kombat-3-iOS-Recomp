========================================================================
EASDK_SetLoggingDisable  0x0007f654  72 bytes   EASDK_Handler.mm
========================================================================

0007f654  push    {r7, lr}
0007f656  add     r7, sp, #0
0007f658  ldr     r2, [pc, #0x30]
0007f65a  add     r2, pc ; -> 0x00175894  loggingDone
0007f65c  ldr     r3, [r2]
0007f65e  cbz     r3, #0x7f662
0007f660  pop     {r7, pc}
0007f662  subs    r0, #0
0007f664  it      ne
0007f666  movne   r0, #1
0007f668  adds    r3, #1
0007f66a  str     r3, [r2]
0007f66c  bl      #0xbe250 ; -> Z21MTX_SetLoggingDisableb
0007f670  bl      #0xbe22c ; -> Z21MTX_GetLoggingDisablev
0007f674  cbz     r0, #0x7f684
0007f676  ldr     r1, [pc, #0x18]
0007f678  add     r1, pc ; -> 0x0017e664  
0007f67a  ldr     r0, [pc, #0x18]
0007f67c  add     r0, pc ; -> 0x0017e684  
0007f67e  blx     #0xdd3e0 ; -> NSLog
0007f682  b       #0x7f660
0007f684  ldr     r1, [pc, #0x10]
0007f686  add     r1, pc ; -> 0x0017e674  
0007f688  b       #0x7f67a
0007f68a  nop     
0007f68c  str     r6, [r6, #0x20]
0007f68e  movs    r7, r1
0007f690  vaddl.s32 q8, d8, d15
0007f694  and     r0, r4, #0xf
0007f698  vaddl.s32 q8, d10, d15
