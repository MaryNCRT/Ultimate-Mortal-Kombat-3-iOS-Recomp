========================================================================
MTX_GetLoggingDisable  0x000be22c  36 bytes   EAMTX_Main.mm
========================================================================

000be22c  push    {r7, lr}
000be22e  add     r7, sp, #0
000be230  bl      #0xbd408 ; -> Z18CheckMTXControllerv
000be234  ldr     r0, [pc, #0x10]
000be236  ldr     r1, [pc, #0x14]
000be238  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000be23a  add     r1, pc ; -> 0x000fd6bc  
000be23c  ldr     r0, [r0]
000be23e  ldr     r1, [r1]
000be240  blx     #0xddbfc ; -> objc_msgSend
000be244  pop     {r7, pc}
000be246  nop     
000be248  udf     #0xac
000be24a  movs    r4, r5
000be24c  orns    r0, lr, #0x830000
