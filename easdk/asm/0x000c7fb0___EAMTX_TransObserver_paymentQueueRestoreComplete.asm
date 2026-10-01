========================================================================
-[EAMTX_TransObserver paymentQueueRestoreCompletedTransactionsFinished  0x000c7fb0  260 bytes   EAMTX_TransObserver.mm
========================================================================

000c7fb0  push    {r4, r5, r6, r7, lr}
000c7fb2  add     r7, sp, #0xc
000c7fb4  push.w  {r8, sl, fp}
000c7fb8  ldr     r3, [pc, #0xbc]
000c7fba  mov     sl, r0
000c7fbc  add     r3, pc ; -> 0x000f3280  bRequiredToShowAlert
000c7fbe  ldr     r3, [r3]
000c7fc0  ldrb    r3, [r3]
000c7fc2  cmp     r3, #0
000c7fc4  bne     #0xc8072
000c7fc6  ldr     r0, [pc, #0xb4]
000c7fc8  ldr     r1, [pc, #0xb4]
000c7fca  ldr     r4, [pc, #0xb8]
000c7fcc  add     r0, pc ; -> 0x000fdb5c  
000c7fce  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c7fd0  ldr     r6, [r0]
000c7fd2  ldr     r5, [r1]
000c7fd4  ldr     r0, [pc, #0xb0]
000c7fd6  ldr     r1, [pc, #0xb4]
000c7fd8  add     r4, pc ; -> 0x001815e4  
000c7fda  add     r0, pc ; -> 0x000f3270  mtxController
000c7fdc  add     r1, pc ; -> 0x000fd450  
000c7fde  ldr.w   fp, [r0]
000c7fe2  ldr.w   r8, [r1]
000c7fe6  ldr.w   r0, [fp]
000c7fea  mov     r1, r8
000c7fec  blx     #0xddbfc ; -> objc_msgSend
000c7ff0  mov     r2, r4
000c7ff2  mov     r1, r5
000c7ff4  mov     r3, r0
000c7ff6  mov     r0, r6
000c7ff8  blx     #0xddbfc ; -> objc_msgSend
000c7ffc  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c8000  ldr     r1, [pc, #0x8c]
000c8002  mov     r0, sl
000c8004  add     r1, pc ; -> 0x000fd4ec  
000c8006  ldr     r1, [r1]
000c8008  blx     #0xddbfc ; -> objc_msgSend
000c800c  mov     r4, r0
000c800e  cbz     r0, #0xc8022
000c8010  ldr     r1, [pc, #0x80]
000c8012  mov     r0, sl
000c8014  movs    r2, #0x14
000c8016  add     r1, pc ; -> 0x000fd734  
000c8018  ldr     r3, [pc, #0x7c]
000c801a  ldr     r1, [r1]
000c801c  blx     #0xddbfc ; -> objc_msgSend
000c8020  b       #0xc8072
000c8022  ldr.w   r0, [fp]
000c8026  mov     r1, r8
000c8028  blx     #0xddbfc ; -> objc_msgSend
000c802c  cbnz    r0, #0xc8068
000c802e  ldr     r0, [pc, #0x6c]
000c8030  ldr     r1, [pc, #0x6c]
000c8032  add     r0, pc ; -> 0x000fdb70  
000c8034  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000c8036  ldr     r0, [r0]
000c8038  ldr     r1, [r1]
000c803a  blx     #0xddbfc ; -> objc_msgSend
000c803e  ldr     r1, [pc, #0x64]
000c8040  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000c8042  ldr     r1, [r1]
000c8044  blx     #0xddbfc ; -> objc_msgSend
000c8048  ldr     r3, [pc, #0x5c]
000c804a  add     r3, pc ; -> 0x000f7fcc  OBJC_IVAR_$_EAMTX_TransObserver.requestId
000c804c  ldr     r3, [r3]
000c804e  ldr.w   r1, [sl, r3]
000c8052  mov     r5, r0
000c8054  mov     r2, r5
000c8056  movs    r0, #0x13
000c8058  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000c805c  ldr     r1, [pc, #0x4c]
000c805e  mov     r0, r5
000c8060  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c8062  ldr     r1, [r1]
000c8064  blx     #0xddbfc ; -> objc_msgSend
000c8068  ldr     r3, [pc, #0x44]
000c806a  add     r3, pc ; -> 0x000f7fd0  OBJC_IVAR_$_EAMTX_TransObserver.m_RestoreState
000c806c  ldr     r3, [r3]
000c806e  str.w   r4, [sl, r3]
000c8072  pop.w   {r8, sl, fp}
000c8076  pop     {r4, r5, r6, r7, pc}
000c8078  uxtb    r0, r0
000c807a  movs    r2, r0
000c807c  ldrh    r4, [r1, r6]
000c807e  movs    r3, r0
000c8080  ldr     r2, [pc, #0x338]
000c8082  movs    r3, r0
000c8084  str     r6, [sp, #0x20]
000c8086  movs    r3, r1
000c8088  uxth    r2, r2
000c808a  movs    r2, r0
000c808c  strb    r0, [r6, r1]
000c808e  movs    r3, r0
000c8090  strb    r4, [r4, r3]
000c8092  movs    r3, r0
000c8094  ldrsb   r2, [r3, r4]
000c8096  movs    r3, r0
000c8098  orr.w   pc, sp, pc, ror #31
000c809c  ldrh    r2, [r7, r4]
000c809e  movs    r3, r0
000c80a0  ldr     r1, [pc, #0x130]
000c80a2  movs    r3, r0
000c80a4  ldr     r1, [pc, #0xf0]
000c80a6  movs    r3, r0
