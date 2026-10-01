========================================================================
-[DMGController logServer  0x000cef28  60 bytes   DMGController.mm
========================================================================

000cef28  push    {r4, r5, r7, lr}
000cef2a  add     r7, sp, #8
000cef2c  sub     sp, #8
000cef2e  ldr     r0, [pc, #0x2c]
000cef30  ldr     r1, [pc, #0x2c]
000cef32  mov     r4, r2
000cef34  add     r0, pc ; -> 0x000fdbb4  
000cef36  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000cef38  ldr     r0, [r0]
000cef3a  ldr     r1, [r1]
000cef3c  mov     r5, r3
000cef3e  blx     #0xddbfc ; -> objc_msgSend
000cef42  ldr     r3, [sp, #0x20]
000cef44  mov     r1, r5
000cef46  ldr     r2, [sp, #0x18]
000cef48  str     r3, [sp]
000cef4a  ldr     r3, [sp, #0x1c]
000cef4c  str     r0, [sp, #4]
000cef4e  mov     r0, r4
000cef50  bl      #0xbe81c ; -> Z15MTX_LogEAServeriiP8NSStringiS0_P6NSDate
000cef54  sub.w   sp, r7, #8
000cef58  pop     {r4, r5, r7, pc}
000cef5a  nop     
000cef5c  ldcl    p0, c0, [ip], #-8
000cef60  bgt     #0xcee80
000cef62  movs    r2, r0
