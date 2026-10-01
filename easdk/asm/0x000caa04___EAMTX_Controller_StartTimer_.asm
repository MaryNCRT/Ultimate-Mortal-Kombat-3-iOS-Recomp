========================================================================
-[EAMTX_Controller StartTimer]  0x000caa04  20 bytes   EAMTX_Controller.mm
========================================================================

000caa04  push    {r7, lr}
000caa06  add     r7, sp, #0
000caa08  ldr     r1, [pc, #8]
000caa0a  add     r1, pc ; -> 0x000fd5d0  
000caa0c  ldr     r1, [r1]
000caa0e  blx     #0xddbfc ; -> objc_msgSend
000caa12  pop     {r7, pc}
000caa14  cmp     r3, #0xc2
000caa16  movs    r3, r0
