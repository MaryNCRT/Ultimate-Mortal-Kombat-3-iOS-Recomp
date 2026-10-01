========================================================================
-[FacebookAgent getLoginButton  0x000dc7fc  56 bytes   FacebookAgent.mm
========================================================================

000dc7fc  push    {r4, r5, r7, lr}
000dc7fe  add     r7, sp, #8
000dc800  ldr     r5, [pc, #0x24]
000dc802  ldr     r1, [pc, #0x28]
000dc804  mov     r4, r0
000dc806  add     r5, pc ; -> 0x000fc8b4  OBJC_IVAR_$_FacebookAgent.fbButton
000dc808  add     r1, pc ; -> 0x000fd9e4  
000dc80a  ldr     r3, [r5]
000dc80c  ldr     r1, [r1]
000dc80e  ldr     r0, [r0, r3]
000dc810  blx     #0xddbfc ; -> objc_msgSend
000dc814  ldr     r1, [pc, #0x18]
000dc816  ldr     r3, [r5]
000dc818  add     r1, pc ; -> 0x000fcd68  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3f0
000dc81a  ldr     r0, [r4, r3]
000dc81c  ldr     r1, [r1]
000dc81e  blx     #0xddbfc ; -> objc_msgSend
000dc822  ldr     r0, [r5]
000dc824  ldr     r0, [r4, r0]
000dc826  pop     {r4, r5, r7, pc}
000dc828  lsls    r2, r5, #2
000dc82a  movs    r2, r0
000dc82c  asrs    r0, r3, #7
000dc82e  movs    r2, r0
000dc830  lsls    r4, r1, #0x15
000dc832  movs    r2, r0
