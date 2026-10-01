========================================================================
MTX_GetMessage  0x000bdf4c  328 bytes   EAMTX_Main.mm
========================================================================

000bdf4c  push    {r4, r5, r6, r7, lr}
000bdf4e  add     r7, sp, #0xc
000bdf50  push.w  {r8, sl}
000bdf54  uxtb.w  r8, r2
000bdf58  mov     r4, r0
000bdf5a  mov     r6, r1
000bdf5c  bl      #0xbd408 ; -> Z18CheckMTXControllerv
000bdf60  ldr     r0, [pc, #0xe4]
000bdf62  ldr     r1, [pc, #0xe8]
000bdf64  ldr     r5, [pc, #0xe8]
000bdf66  add     r0, pc ; -> 0x0038c0e4  mtxController
000bdf68  add     r1, pc ; -> 0x000fd6dc  
000bdf6a  ldr     r0, [r0]
000bdf6c  ldr     r1, [r1]
000bdf6e  blx     #0xddbfc ; -> objc_msgSend
000bdf72  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000bdf74  mov     sl, r0
000bdf76  mov     r0, r4
000bdf78  bl      #0xb6424 ; -> Z15CheckNullStringP8NSObject
000bdf7c  ldr     r1, [pc, #0xd4]
000bdf7e  ldr     r4, [pc, #0xd8]
000bdf80  add     r1, pc ; -> 0x000fd618  
000bdf82  add     r4, pc ; -> 0x0038c1d5  timerForceStopped
000bdf84  ldr     r1, [r1]
000bdf86  mov     r2, r0
000bdf88  ldr     r0, [r5]
000bdf8a  blx     #0xddbfc ; -> objc_msgSend
000bdf8e  ldr     r3, [pc, #0xcc]
000bdf90  ldr     r1, [pc, #0xcc]
000bdf92  ldr     r0, [r5]
000bdf94  add     r3, pc ; -> 0x0038c134  m_iMessageType
000bdf96  add     r1, pc ; -> 0x000fd5e4  
000bdf98  str     r6, [r3]
000bdf9a  ldr     r6, [r1]
000bdf9c  strb.w  r8, [r4]
000bdfa0  mov     r1, r6
000bdfa2  blx     #0xddbfc ; -> objc_msgSend
000bdfa6  ldr     r1, [pc, #0xbc]
000bdfa8  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000bdfaa  ldr     r1, [r1]
000bdfac  blx     #0xddbfc ; -> objc_msgSend
000bdfb0  cbz     r0, #0xbdfea
000bdfb2  ldrsb.w r4, [r4]
000bdfb6  cbz     r4, #0xbdfc6
000bdfb8  ldr     r1, [pc, #0xac]
000bdfba  ldr     r0, [r5]
000bdfbc  add     r1, pc ; -> 0x000fd5e8  
000bdfbe  ldr     r1, [r1]
000bdfc0  blx     #0xddbfc ; -> objc_msgSend
000bdfc4  b       #0xbe03e
000bdfc6  ldr     r0, [pc, #0xa4]
000bdfc8  mov     r1, r6
000bdfca  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000bdfcc  ldr     r0, [r0]
000bdfce  blx     #0xddbfc ; -> objc_msgSend
000bdfd2  ldr     r1, [pc, #0x9c]
000bdfd4  mov     r2, r4
000bdfd6  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000bdfd8  ldr     r1, [r1]
000bdfda  blx     #0xddbfc ; -> objc_msgSend
000bdfde  mov     r1, sl
000bdfe0  mov     r2, r0
000bdfe2  movs    r0, #0x1b
000bdfe4  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bdfe8  b       #0xbe03e
000bdfea  ldr     r0, [pc, #0x88]
000bdfec  ldr     r1, [pc, #0x88]
000bdfee  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000bdff0  add     r1, pc ; -> 0x000fd6b0  
000bdff2  ldr     r0, [r0]
000bdff4  ldr     r1, [r1]
000bdff6  blx     #0xddbfc ; -> objc_msgSend
000bdffa  cmp     r0, #0
000bdffc  bgt     #0xbe02a
000bdffe  ldr     r4, [pc, #0x7c]
000be000  ldr     r1, [pc, #0x7c]
000be002  add     r4, pc ; -> 0x0038c0e4  mtxController
000be004  add     r1, pc ; -> 0x000fd67c  
000be006  ldr     r0, [r4]
000be008  ldr     r1, [r1]
000be00a  blx     #0xddbfc ; -> objc_msgSend
000be00e  cbnz    r0, #0xbe02a
000be010  ldr     r1, [pc, #0x70]
000be012  ldr     r0, [r4]
000be014  movs    r2, #0x1e
000be016  add     r1, pc ; -> 0x000fd6b4  
000be018  ldr     r1, [r1]
000be01a  blx     #0xddbfc ; -> objc_msgSend
000be01e  ldr     r1, [pc, #0x68]
000be020  ldr     r0, [r4]
000be022  movs    r2, #3
000be024  add     r1, pc ; -> 0x000fd6d4  
000be026  ldr     r1, [r1]
000be028  b       #0xbe038
000be02a  ldr     r0, [pc, #0x60]
000be02c  ldr     r1, [pc, #0x60]
000be02e  movs    r2, #0x1e
000be030  add     r0, pc ; -> 0x0038c0e4  mtxController
000be032  add     r1, pc ; -> 0x000fd6d4  
000be034  ldr     r0, [r0]
000be036  ldr     r1, [r1]
000be038  mov     r3, sl
000be03a  blx     #0xddbfc ; -> objc_msgSend
000be03e  mov     r0, sl
000be040  pop.w   {r8, sl}
000be044  pop     {r4, r5, r6, r7, pc}
000be046  nop     
000be048  b       #0xbe340
000be04a  movs    r4, r5
