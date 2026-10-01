========================================================================
-[ImageLoadingOperation dealloc]  0x000d5764  72 bytes   ImageLoadingOperation.m
========================================================================

000d5764  push    {r4, r7, lr}
000d5766  add     r7, sp, #4
000d5768  sub     sp, #8
000d576a  ldr     r3, [pc, #0x30]
000d576c  ldr     r1, [pc, #0x30]
000d576e  mov     r4, r0
000d5770  add     r3, pc ; -> 0x000fad4c  OBJC_IVAR_$_ImageLoadingOperation.info
000d5772  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d5774  ldr     r3, [r3]
000d5776  ldr     r1, [r1]
000d5778  ldr     r0, [r0, r3]
000d577a  blx     #0xddbfc ; -> objc_msgSend
000d577e  ldr     r3, [pc, #0x24]
000d5780  ldr     r1, [pc, #0x24]
000d5782  mov     r0, sp
000d5784  add     r3, pc ; -> 0x000fdddc  
000d5786  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000d5788  ldr     r3, [r3]
000d578a  ldr     r1, [r1]
000d578c  str     r4, [sp]
000d578e  str     r3, [sp, #4]
000d5790  blx     #0xddc08 ; -> objc_msgSendSuper2
000d5794  sub.w   sp, r7, #4
000d5798  pop     {r4, r7, pc}
000d579a  nop     
000d579c  strb    r0, [r3, r7]
000d579e  movs    r2, r0
000d57a0  strb    r6, [r0, #8]
000d57a2  movs    r2, r0
000d57a4  strh    r4, [r2, #0x32]
000d57a6  movs    r2, r0
000d57a8  strb    r6, [r2, #8]
000d57aa  movs    r2, r0
