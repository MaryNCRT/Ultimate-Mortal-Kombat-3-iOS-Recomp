========================================================================
-[EAMTX_MMTracking connectionDidFinishLoading  0x000dcd5c  192 bytes   EAMTX_MMTracking.mm
========================================================================

000dcd5c  push    {r4, r5, r6, r7, lr}
000dcd5e  add     r7, sp, #0xc
000dcd60  str     r8, [sp, #-0x4]!
000dcd64  ldr     r3, [pc, #0x80]
000dcd66  add     r3, pc ; -> 0x000fc978  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn
000dcd68  ldr     r3, [r3]
000dcd6a  ldr     r3, [r0, r3]
000dcd6c  cmp     r3, r2
000dcd6e  bne     #0xdcde0
000dcd70  ldr     r0, [pc, #0x78]
000dcd72  ldr     r4, [pc, #0x7c]
000dcd74  add     r0, pc ; -> 0x00181d74  
000dcd76  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000dcd7a  ldr     r0, [pc, #0x78]
000dcd7c  ldr     r1, [pc, #0x78]
000dcd7e  add     r4, pc ; -> 0x00181d84  
000dcd80  add     r0, pc ; -> 0x000fdb84  
000dcd82  add     r1, pc ; -> 0x000fcae0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x168
000dcd84  ldr     r0, [r0]
000dcd86  ldr     r1, [r1]
000dcd88  blx     #0xddbfc ; -> objc_msgSend
000dcd8c  ldr     r1, [pc, #0x6c]
000dcd8e  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000dcd90  ldr     r1, [r1]
000dcd92  mov     r8, r0
000dcd94  ldr     r0, [pc, #0x68]
000dcd96  add     r0, pc ; -> 0x000fdb60  
000dcd98  ldr     r0, [r0]
000dcd9a  blx     #0xddbfc ; -> objc_msgSend
000dcd9e  ldr     r1, [pc, #0x64]
000dcda0  ldr     r3, [pc, #0x64]
000dcda2  ldr     r2, [pc, #0x68]
000dcda4  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000dcda6  add     r3, pc ; -> 0x000fdb5c  
000dcda8  ldr     r5, [r1]
000dcdaa  ldr     r1, [pc, #0x64]
000dcdac  add     r2, pc ; -> 0x00181d94  
000dcdae  ldr     r6, [r3]
000dcdb0  add     r1, pc ; -> 0x000fd00c  'LZ\x0e'
000dcdb2  ldr     r1, [r1]
000dcdb4  blx     #0xddbfc ; -> objc_msgSend
000dcdb8  mov     r1, r5
000dcdba  mov     r2, r4
000dcdbc  mov     r3, r0
000dcdbe  mov     r0, r6
000dcdc0  blx     #0xddbfc ; -> objc_msgSend
000dcdc4  ldr     r1, [pc, #0x4c]
000dcdc6  movs    r2, #1
000dcdc8  add     r1, pc ; -> 0x000fd7f0  
000dcdca  ldr     r1, [r1]
000dcdcc  mov     r3, r0
000dcdce  mov     r0, r8
000dcdd0  blx     #0xddbfc ; -> objc_msgSend
000dcdd4  ldr     r1, [pc, #0x40]
000dcdd6  mov     r0, r8
000dcdd8  add     r1, pc ; -> 0x000fcef8  '\x05B\x0e'
000dcdda  ldr     r1, [r1]
000dcddc  blx     #0xddbfc ; -> objc_msgSend
000dcde0  ldr     r8, [sp], #4
000dcde4  pop     {r4, r5, r6, r7, pc}
000dcde6  nop     
