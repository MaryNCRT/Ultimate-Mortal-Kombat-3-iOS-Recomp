========================================================================
-[Social_Info getToken]  0x000d6254  92 bytes   Social_Info.mm
========================================================================

000d6254  push    {r4, r7, lr}
000d6256  add     r7, sp, #4
000d6258  ldr     r3, [pc, #0x3c]
000d625a  mov     r4, r0
000d625c  add     r3, pc ; -> 0x000fb770  OBJC_IVAR_$_Social_Info.renewTokenTimer
000d625e  ldr     r0, [r3]
000d6260  ldr     r0, [r4, r0]
000d6262  cbz     r0, #0xd626e
000d6264  ldr     r1, [pc, #0x34]
000d6266  add     r1, pc ; -> 0x000fc9b0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x38
000d6268  ldr     r1, [r1]
000d626a  blx     #0xddbfc ; -> objc_msgSend
000d626e  ldr     r3, [pc, #0x30]
000d6270  movs    r2, #1
000d6272  ldr     r0, [pc, #0x30]
000d6274  add     r3, pc ; -> 0x000fb778  OBJC_IVAR_$_Social_Info.renewToken
000d6276  ldr     r1, [pc, #0x30]
000d6278  ldr     r3, [r3]
000d627a  add     r0, pc ; -> 0x000f3270  mtxController
000d627c  add     r1, pc ; -> 0x000fd6d4  
000d627e  ldr     r0, [r0]
000d6280  strb    r2, [r4, r3]
000d6282  ldr     r3, [pc, #0x28]
000d6284  ldr     r1, [r1]
000d6286  ldr     r0, [r0]
000d6288  add     r3, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d628a  adds    r2, #0x22
000d628c  ldr     r3, [r3]
000d628e  ldr     r3, [r4, r3]
000d6290  blx     #0xddbfc ; -> objc_msgSend
000d6294  pop     {r4, r7, pc}
000d6296  nop     
000d6298  strb    r0, [r2, r4]
000d629a  movs    r2, r0
000d629c  str     r6, [r0, #0x74]
000d629e  movs    r2, r0
000d62a0  strb    r0, [r0, r4]
000d62a2  movs    r2, r0
000d62a4  ldm     r7, {r1, r4, r5, r6, r7}
000d62a6  movs    r1, r0
000d62a8  strb    r4, [r2, #0x11]
000d62aa  movs    r2, r0
000d62ac  strb    r0, [r5, r3]
000d62ae  movs    r2, r0
