========================================================================
MTX_SetLoggingDisable  0x000be250  40 bytes   EAMTX_Main.mm
========================================================================

000be250  push    {r4, r7, lr}
000be252  add     r7, sp, #4
000be254  uxtb    r4, r0
000be256  bl      #0xbd408 ; -> Z18CheckMTXControllerv
000be25a  ldr     r0, [pc, #0x14]
000be25c  ldr     r1, [pc, #0x14]
000be25e  mov     r2, r4
000be260  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000be262  add     r1, pc ; -> 0x000fd6c0  
000be264  ldr     r0, [r0]
000be266  ldr     r1, [r1]
000be268  blx     #0xddbfc ; -> objc_msgSend
000be26c  pop     {r4, r7, pc}
000be26e  nop     
000be270  udf     #0x84
000be272  movs    r4, r5
000be274  orrs    r0, sl, #0x830000
