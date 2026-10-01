========================================================================
-[EAMTX_Category dealloc]  0x000ccdb0  108 bytes   EAMTX_Category.mm
========================================================================

000ccdb0  push    {r4, r5, r7, lr}
000ccdb2  add     r7, sp, #8
000ccdb4  sub     sp, #8
000ccdb6  ldr     r3, [pc, #0x4c]
000ccdb8  ldr     r1, [pc, #0x4c]
000ccdba  mov     r5, r0
000ccdbc  add     r3, pc ; -> 0x000f9300  OBJC_IVAR_$_EAMTX_Category.m_Title
000ccdbe  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000ccdc0  ldr     r3, [r3]
000ccdc2  ldr     r4, [r1]
000ccdc4  ldr     r0, [r0, r3]
000ccdc6  mov     r1, r4
000ccdc8  blx     #0xddbfc ; -> objc_msgSend
000ccdcc  ldr     r3, [pc, #0x3c]
000ccdce  mov     r1, r4
000ccdd0  add     r3, pc ; -> 0x000f9304  OBJC_IVAR_$_EAMTX_Category.m_SelImgData
000ccdd2  ldr     r3, [r3]
000ccdd4  ldr     r0, [r5, r3]
000ccdd6  blx     #0xddbfc ; -> objc_msgSend
000ccdda  ldr     r3, [pc, #0x34]
000ccddc  mov     r1, r4
000ccdde  add     r3, pc ; -> 0x000f9308  OBJC_IVAR_$_EAMTX_Category.m_RegImgData
000ccde0  ldr     r3, [r3]
000ccde2  ldr     r0, [r5, r3]
000ccde4  blx     #0xddbfc ; -> objc_msgSend
000ccde8  ldr     r3, [pc, #0x28]
000ccdea  ldr     r1, [pc, #0x2c]
000ccdec  mov     r0, sp
000ccdee  add     r3, pc ; -> 0x000fddac  
000ccdf0  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000ccdf2  ldr     r3, [r3]
000ccdf4  ldr     r1, [r1]
000ccdf6  str     r5, [sp]
000ccdf8  str     r3, [sp, #4]
000ccdfa  blx     #0xddc08 ; -> objc_msgSendSuper2
000ccdfe  sub.w   sp, r7, #8
000cce02  pop     {r4, r5, r7, pc}
000cce04  stm     r5!, {r6}
000cce06  movs    r2, r0
