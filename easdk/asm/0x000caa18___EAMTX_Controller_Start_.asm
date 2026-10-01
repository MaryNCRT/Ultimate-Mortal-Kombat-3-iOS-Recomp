========================================================================
-[EAMTX_Controller Start]  0x000caa18  384 bytes   EAMTX_Controller.mm
========================================================================

000caa18  push    {r4, r5, r6, r7, lr}
000caa1a  add     r7, sp, #0xc
000caa1c  push.w  {r8, sl, fp}
000caa20  ldr     r3, [pc, #0x11c]
000caa22  mov.w   fp, #0
000caa26  mov     r4, r0
000caa28  add     r3, pc ; -> 0x000f912c  OBJC_IVAR_$_EAMTX_Controller.iCurrState
000caa2a  ldr     r3, [r3]
000caa2c  str.w   fp, [r0, r3]
000caa30  ldr     r3, [pc, #0x110]
000caa32  add     r3, pc ; -> 0x000f9130  OBJC_IVAR_$_EAMTX_Controller.iReturnState
000caa34  ldr     r3, [r3]
000caa36  str.w   fp, [r0, r3]
000caa3a  bl      #0xbe3cc ; -> Z28MTX_GetNetworkConnectionTypev
000caa3e  ldr     r3, [pc, #0x108]
000caa40  ldr     r1, [pc, #0x108]
000caa42  movs    r2, #1
000caa44  add     r3, pc ; -> 0x000f332c  connectionType
000caa46  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000caa48  ldr     r3, [r3]
000caa4a  ldr     r1, [r1]
000caa4c  str     r0, [r3]
000caa4e  ldr     r3, [pc, #0x100]
000caa50  ldr     r0, [pc, #0x100]
000caa52  add     r3, pc ; -> 0x000f9134  OBJC_IVAR_$_EAMTX_Controller.bRequestInPending
000caa54  add     r0, pc ; -> 0x000fdbb4  
000caa56  ldr     r3, [r3]
000caa58  ldr     r0, [r0]
000caa5a  strb.w  fp, [r4, r3]
000caa5e  ldr     r3, [pc, #0xf8]
000caa60  add     r3, pc ; -> 0x000f9150  OBJC_IVAR_$_EAMTX_Controller.bReceivedResponse
000caa62  ldr     r3, [r3]
000caa64  strb    r2, [r4, r3]
000caa66  ldr     r3, [pc, #0xf4]
000caa68  add     r3, pc ; -> 0x0038c1e4  bDBCreated
000caa6a  strb.w  fp, [r3]
000caa6e  blx     #0xddbfc ; -> objc_msgSend
000caa72  ldr     r1, [pc, #0xec]
000caa74  ldr     r3, [pc, #0xec]
000caa76  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000caa78  add     r3, pc ; -> 0x0038c1dc  appStartTime
000caa7a  ldr     r1, [r1]
000caa7c  str     r0, [r3]
000caa7e  blx     #0xddbfc ; -> objc_msgSend
000caa82  bl      #0xc1b14 ; -> Z16LoadProductsDatav
000caa86  ldr     r0, [pc, #0xe0]
000caa88  ldr     r1, [pc, #0xe0]
000caa8a  mov     r2, fp
000caa8c  add     r0, pc ; -> 0x000f3324  mtxUserInfo
000caa8e  add     r1, pc ; -> 0x000fd418  
000caa90  ldr     r0, [r0]
000caa92  ldr     r1, [r1]
000caa94  ldr     r0, [r0]
000caa96  blx     #0xddbfc ; -> objc_msgSend
000caa9a  ldr     r0, [pc, #0xd4]
000caa9c  ldr     r1, [pc, #0xd4]
000caa9e  ldr     r3, [pc, #0xd8]
000caaa0  add     r0, pc ; -> 0x000fdb70  
000caaa2  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000caaa4  ldr.w   sl, [r0]
000caaa8  ldr     r6, [r1]
000caaaa  add     r3, pc ; -> 0x000f8c14  OBJC_IVAR_$_EAMTX_Controller.requestsQ
000caaac  mov     r0, sl
000caaae  mov     r1, r6
000caab0  ldr.w   r8, [r3]
000caab4  blx     #0xddbfc ; -> objc_msgSend
000caab8  ldr     r1, [pc, #0xc0]
000caaba  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000caabc  ldr     r5, [r1]
000caabe  mov     r1, r5
000caac0  blx     #0xddbfc ; -> objc_msgSend
000caac4  ldr     r3, [pc, #0xb8]
000caac6  mov     r1, r6
000caac8  add     r3, pc ; -> 0x000f8c18  OBJC_IVAR_$_EAMTX_Controller.responseQ
000caaca  str.w   r0, [r4, r8]
000caace  mov     r0, sl
000caad0  ldr.w   r8, [r3]
000caad4  blx     #0xddbfc ; -> objc_msgSend
000caad8  mov     r1, r5
000caada  blx     #0xddbfc ; -> objc_msgSend
000caade  ldr     r3, [pc, #0xa4]
000caae0  mov     r1, r6
000caae2  add     r3, pc ; -> 0x000f8c1c  OBJC_IVAR_$_EAMTX_Controller.networkRequests
000caae4  str.w   r0, [r4, r8]
000caae8  ldr     r0, [pc, #0x9c]
000caaea  ldr.w   sl, [r3]
000caaee  add     r0, pc ; -> 0x000fdbf4  
000caaf0  ldr.w   r8, [r0]
000caaf4  mov     r0, r8
000caaf6  blx     #0xddbfc ; -> objc_msgSend
000caafa  mov     r1, r5
000caafc  blx     #0xddbfc ; -> objc_msgSend
000cab00  ldr     r3, [pc, #0x88]
000cab02  mov     r1, r6
000cab04  add     r3, pc ; -> 0x000f8c20  OBJC_IVAR_$_EAMTX_Controller.networkObjsDict
000cab06  str.w   r0, [r4, sl]
000cab0a  mov     r0, r8
000cab0c  ldr.w   sl, [r3]
000cab10  blx     #0xddbfc ; -> objc_msgSend
000cab14  mov     r1, r5
000cab16  blx     #0xddbfc ; -> objc_msgSend
000cab1a  ldr     r3, [pc, #0x74]
000cab1c  add     r3, pc ; -> 0x000f9154  OBJC_IVAR_$_EAMTX_Controller.bProcessStarted
000cab1e  str.w   r0, [r4, sl]
000cab22  ldr     r3, [r3]
000cab24  strb.w  fp, [r4, r3]
000cab28  ldr     r3, [pc, #0x68]
000cab2a  add     r3, pc ; -> 0x000f9158  OBJC_IVAR_$_EAMTX_Controller.mFreeSpace
000cab2c  ldr     r0, [r3]
000cab2e  adds    r4, r4, r0
000cab30  bl      #0xbe47c ; -> Z12getFreeSpacev
000cab34  stm.w   r4, {r0, r1}
000cab38  pop.w   {r8, sl, fp}
000cab3c  pop     {r4, r5, r6, r7, pc}
000cab3e  nop     
000cab40  b       #0xca944
000cab42  movs    r2, r0
000cab44  b       #0xca93c ; -> -[EAMTX_Controller isUIDReqInQ]
000cab46  movs    r2, r0
000cab48  ldrh    r4, [r4, #6]
000cab4a  movs    r2, r0
000cab4c  movs    r1, #0x7e
000cab4e  movs    r3, r0
000cab50  b       #0xca910
000cab52  movs    r2, r0
000cab54  adds    r1, #0x5c
000cab56  movs    r3, r0
000cab58  b       #0xca934
000cab5a  movs    r2, r0
000cab5c  asrs    r0, r7, #0x1d
000cab5e  movs    r4, r5
000cab60  movs    r2, #0x56
000cab62  movs    r3, r0
000cab64  asrs    r0, r4, #0x1d
000cab66  movs    r4, r5
000cab68  ldrh    r4, [r2, #4]
000cab6a  movs    r2, r0
000cab6c  cmp     r1, #0x86
000cab6e  movs    r3, r0
000cab70  adds    r0, #0xcc
000cab72  movs    r3, r0
000cab74  subs    r6, r3, #3
000cab76  movs    r3, r0
000cab78  b       #0xcae48
000cab7a  movs    r2, r0
000cab7c  subs    r2, r0, #3
000cab7e  movs    r3, r0
000cab80  b       #0xcae1c
000cab82  movs    r2, r0
000cab84  b       #0xcadf4
000cab86  movs    r2, r0
000cab88  adds    r1, #2
000cab8a  movs    r3, r0
000cab8c  b       #0xcadc0
000cab8e  movs    r2, r0
000cab90  b       #0xca7fc
000cab92  movs    r2, r0
000cab94  b       #0xca7ec
000cab96  movs    r2, r0
