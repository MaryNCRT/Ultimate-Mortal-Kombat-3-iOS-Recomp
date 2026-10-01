========================================================================
-[EAMTX_Controller StopMTXTimer]  0x000cab98  104 bytes   EAMTX_Controller.mm
========================================================================

000cab98  push    {r4, r5, r7, lr}
000cab9a  add     r7, sp, #8
000cab9c  ldr     r1, [pc, #0x4c]
000cab9e  mov     r5, r0
000caba0  add     r1, pc ; -> 0x000fd78c  '\x16\x05\x0f'
000caba2  ldr     r4, [r1]
000caba4  mov     r1, r4
000caba6  blx     #0xddbfc ; -> objc_msgSend
000cabaa  cbz     r0, #0xcabe8
000cabac  mov     r1, r4
000cabae  mov     r0, r5
000cabb0  blx     #0xddbfc ; -> objc_msgSend
000cabb4  ldr     r1, [pc, #0x38]
000cabb6  add     r1, pc ; -> 0x000fd798  '\r\x07\x0f'
000cabb8  ldr     r1, [r1]
000cabba  blx     #0xddbfc ; -> objc_msgSend
000cabbe  tst.w   r0, #0xff
000cabc2  beq     #0xcabe8
000cabc4  ldr     r0, [pc, #0x2c]
000cabc6  add     r0, pc ; -> 0x00181634  
000cabc8  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000cabcc  mov     r1, r4
000cabce  mov     r0, r5
000cabd0  blx     #0xddbfc ; -> objc_msgSend
000cabd4  ldr     r1, [pc, #0x20]
000cabd6  add     r1, pc ; -> 0x000fc9b0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x38
000cabd8  ldr     r1, [r1]
000cabda  blx     #0xddbfc ; -> objc_msgSend
000cabde  ldr     r3, [pc, #0x1c]
000cabe0  movs    r2, #0
000cabe2  add     r3, pc ; -> 0x000f9154  OBJC_IVAR_$_EAMTX_Controller.bProcessStarted
000cabe4  ldr     r3, [r3]
000cabe6  strb    r2, [r5, r3]
000cabe8  pop     {r4, r5, r7, pc}
000cabea  nop     
000cabec  cmp     r3, #0xe8
000cabee  movs    r3, r0
000cabf0  cmp     r3, #0xde
000cabf2  movs    r3, r0
000cabf4  ldr     r2, [r5, #0x24]
000cabf6  movs    r3, r1
000cabf8  adds    r6, r2, #7
000cabfa  movs    r3, r0
000cabfc  b       #0xca6dc
000cabfe  movs    r2, r0
