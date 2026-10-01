========================================================================
CheckMTXProductsList  0x000b6470  60 bytes   EAMTX_Main.mm
========================================================================

000b6470  push    {r4, r7, lr}
000b6472  add     r7, sp, #4
000b6474  ldr     r4, [pc, #0x24]
000b6476  add     r4, pc ; -> 0x0038c0bc  mtxProdsList
000b6478  ldr     r3, [r4]
000b647a  cbnz    r3, #0xb6498
000b647c  ldr     r0, [pc, #0x20]
000b647e  ldr     r1, [pc, #0x24]
000b6480  add     r0, pc ; -> 0x000fdbf4  
000b6482  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b6484  ldr     r0, [r0]
000b6486  ldr     r1, [r1]
000b6488  blx     #0xddbfc ; -> objc_msgSend
000b648c  ldr     r1, [pc, #0x18]
000b648e  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b6490  ldr     r1, [r1]
000b6492  blx     #0xddbfc ; -> objc_msgSend
000b6496  str     r0, [r4]
000b6498  pop     {r4, r7, pc}
000b649a  nop     
000b649c  ldrb    r2, [r0, r1]
000b649e  movs    r5, r5
000b64a0  strb    r0, [r6, #0x1d]
000b64a2  movs    r4, r0
000b64a4  str     r6, [r7, #0x4c]
000b64a6  movs    r4, r0
000b64a8  str     r6, [r5, #0x4c]
000b64aa  movs    r4, r0
