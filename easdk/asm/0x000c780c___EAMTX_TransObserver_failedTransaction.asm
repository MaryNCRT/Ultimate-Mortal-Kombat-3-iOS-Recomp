========================================================================
-[EAMTX_TransObserver failedTransaction  0x000c780c  212 bytes   EAMTX_TransObserver.mm
========================================================================

000c780c  push    {r4, r5, r6, r7, lr}
000c780e  add     r7, sp, #0xc
000c7810  push.w  {r8, sl, fp}
000c7814  ldr     r3, [pc, #0x94]
000c7816  mov     fp, r0
000c7818  mov     r5, r2
000c781a  add     r3, pc ; -> 0x000f3280  bRequiredToShowAlert
000c781c  ldr     r3, [r3]
000c781e  ldrb    r3, [r3]
000c7820  cmp     r3, #0
000c7822  bne     #0xc78a6
000c7824  ldr     r1, [pc, #0x88]
000c7826  ldr     r0, [pc, #0x8c]
000c7828  ldr     r4, [pc, #0x8c]
000c782a  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c782c  add     r0, pc ; -> 0x000fdb5c  
000c782e  ldr     r6, [r1]
000c7830  ldr     r1, [pc, #0x88]
000c7832  ldr.w   r8, [r0]
000c7836  mov     r0, r2
000c7838  add     r1, pc ; -> 0x000fd728  
000c783a  add     r4, pc ; -> 0x00181554  
000c783c  ldr.w   sl, [r1]
000c7840  mov     r1, sl
000c7842  blx     #0xddbfc ; -> objc_msgSend
000c7846  mov     r2, r4
000c7848  mov     r1, r6
000c784a  mov     r3, r0
000c784c  mov     r0, r8
000c784e  blx     #0xddbfc ; -> objc_msgSend
000c7852  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c7856  ldr     r0, [pc, #0x68]
000c7858  ldr     r1, [pc, #0x68]
000c785a  add     r0, pc ; -> 0x000fdc6c  
000c785c  add     r1, pc ; -> 0x000fd644  
000c785e  ldr     r0, [r0]
000c7860  ldr     r1, [r1]
000c7862  blx     #0xddbfc ; -> objc_msgSend
000c7866  ldr     r1, [pc, #0x60]
000c7868  mov     r2, r5
000c786a  add     r1, pc ; -> 0x000fd72c  
000c786c  ldr     r1, [r1]
000c786e  blx     #0xddbfc ; -> objc_msgSend
000c7872  mov     r1, sl
000c7874  mov     r0, r5
000c7876  blx     #0xddbfc ; -> objc_msgSend
000c787a  ldr     r1, [pc, #0x50]
000c787c  add     r1, pc ; -> 0x000fcc38  '\\M\x0e'
000c787e  ldr     r1, [r1]
000c7880  blx     #0xddbfc ; -> objc_msgSend
000c7884  cmp     r0, #2
000c7886  bne     #0xc7896
000c7888  ldr     r1, [pc, #0x44]
000c788a  ldr     r3, [pc, #0x48]
000c788c  movs    r2, #0x11
000c788e  add     r1, pc ; -> 0x000fd734  
000c7890  mov     r0, fp
000c7892  ldr     r1, [r1]
000c7894  b       #0xc78a2
000c7896  ldr     r1, [pc, #0x40]
000c7898  ldr     r3, [pc, #0x40]
000c789a  movs    r2, #0x11
000c789c  add     r1, pc ; -> 0x000fd734  
000c789e  mov     r0, fp
000c78a0  ldr     r1, [r1]
000c78a2  blx     #0xddbfc ; -> objc_msgSend
000c78a6  pop.w   {r8, sl, fp}
000c78aa  pop     {r4, r5, r6, r7, pc}
000c78ac  rev16   r2, r4
000c78ae  movs    r2, r0
000c78b0  strh    r2, [r6, r1]
000c78b2  movs    r3, r0
000c78b4  str     r4, [r5, #0x30]
000c78b6  movs    r3, r0
000c78b8  ldr     r5, [sp, #0x58]
000c78ba  movs    r3, r1
000c78bc  ldrsh   r4, [r5, r3]
000c78be  movs    r3, r0
000c78c0  str     r6, [r1, #0x40]
000c78c2  movs    r3, r0
000c78c4  ldrb    r4, [r4, r7]
000c78c6  movs    r3, r0
000c78c8  ldrsh   r6, [r7, r2]
000c78ca  movs    r3, r0
000c78cc  strh    r0, [r7, r6]
000c78ce  movs    r3, r0
000c78d0  ldrsh   r2, [r4, r2]
000c78d2  movs    r3, r0
000c78d4  bl      #0x3c38d6
000c78d8  ldrsh   r4, [r2, r2]
000c78da  movs    r3, r0
000c78dc  mcr     p15, #5, pc, c4, c15, #7
