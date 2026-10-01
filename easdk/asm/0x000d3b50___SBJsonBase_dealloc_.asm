========================================================================
-[SBJsonBase dealloc]  0x000d3b50  72 bytes   SBJsonBase.m
========================================================================

000d3b50  push    {r4, r7, lr}
000d3b52  add     r7, sp, #4
000d3b54  sub     sp, #8
000d3b56  ldr     r3, [pc, #0x30]
000d3b58  ldr     r1, [pc, #0x30]
000d3b5a  mov     r4, r0
000d3b5c  add     r3, pc ; -> 0x000faa08  OBJC_IVAR_$_SBJsonBase.errorTrace
000d3b5e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d3b60  ldr     r3, [r3]
000d3b62  ldr     r1, [r1]
000d3b64  ldr     r0, [r0, r3]
000d3b66  blx     #0xddbfc ; -> objc_msgSend
000d3b6a  ldr     r3, [pc, #0x24]
000d3b6c  ldr     r1, [pc, #0x24]
000d3b6e  mov     r0, sp
000d3b70  add     r3, pc ; -> 0x000fddd8  
000d3b72  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000d3b74  ldr     r3, [r3]
000d3b76  ldr     r1, [r1]
000d3b78  str     r4, [sp]
000d3b7a  str     r3, [sp, #4]
000d3b7c  blx     #0xddc08 ; -> objc_msgSendSuper2
000d3b80  sub.w   sp, r7, #4
000d3b84  pop     {r4, r7, pc}
000d3b86  nop     
000d3b88  ldr     r0, [r5, #0x68]
000d3b8a  movs    r2, r0
000d3b8c  ldrh    r2, [r3, #0x30]
000d3b8e  movs    r2, r0
000d3b90  adr     r2, #0x190
000d3b92  movs    r2, r0
000d3b94  ldrh    r2, [r5, #0x30]
000d3b96  movs    r2, r0
