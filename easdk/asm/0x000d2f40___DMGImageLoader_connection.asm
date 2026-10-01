========================================================================
-[DMGImageLoader connection  0x000d2f40  204 bytes   DMGImageLoader.mm
========================================================================

000d2f40  push    {r4, r5, r6, r7, lr}
000d2f42  add     r7, sp, #0xc
000d2f44  str     r8, [sp, #-0x4]!
000d2f48  ldr     r5, [pc, #0x94]
000d2f4a  mov     r8, r2
000d2f4c  mov     r4, r0
000d2f4e  add     r5, pc ; -> 0x000fa700  OBJC_IVAR_$_DMGImageLoader.prevFileName
000d2f50  ldr     r2, [r5]
000d2f52  ldr     r2, [r0, r2]
000d2f54  cmp     r2, #0
000d2f56  beq     #0xd2fd4
000d2f58  ldr     r6, [pc, #0x88]
000d2f5a  ldr     r1, [pc, #0x8c]
000d2f5c  add     r6, pc ; -> 0x000fa6fc  OBJC_IVAR_$_DMGImageLoader.fileName
000d2f5e  add     r1, pc ; -> 0x000fcc64  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2ec
000d2f60  ldr     r3, [r6]
000d2f62  ldr     r1, [r1]
000d2f64  ldr     r0, [r0, r3]
000d2f66  blx     #0xddbfc ; -> objc_msgSend
000d2f6a  tst.w   r0, #0xff
000d2f6e  beq     #0xd2fd4
000d2f70  ldr     r3, [pc, #0x78]
000d2f72  add     r3, pc ; -> 0x000fa714  OBJC_IVAR_$_DMGImageLoader.noOfAttempts
000d2f74  ldr     r3, [r3]
000d2f76  ldr     r3, [r4, r3]
000d2f78  cmp     r3, #2
000d2f7a  ble     #0xd2f9c
000d2f7c  ldr     r3, [pc, #0x70]
000d2f7e  ldr     r1, [pc, #0x74]
000d2f80  add     r3, pc ; -> 0x000fa6f4  OBJC_IVAR_$_DMGImageLoader.cachedImagesList
000d2f82  add     r1, pc ; -> 0x000fcefc  '\x11B\x0e'
000d2f84  ldr     r3, [r3]
000d2f86  ldr     r1, [r1]
000d2f88  ldr     r0, [r4, r3]
000d2f8a  ldr     r3, [r6]
000d2f8c  ldr     r2, [r4, r3]
000d2f8e  blx     #0xddbfc ; -> objc_msgSend
000d2f92  ldr     r3, [r6]
000d2f94  movs    r2, #0
000d2f96  str     r2, [r4, r3]
000d2f98  ldr     r3, [r5]
000d2f9a  str     r2, [r4, r3]
000d2f9c  ldr     r3, [pc, #0x58]
000d2f9e  add     r3, pc ; -> 0x000fa714  OBJC_IVAR_$_DMGImageLoader.noOfAttempts
000d2fa0  ldr     r2, [r3]
000d2fa2  ldr     r3, [r4, r2]
000d2fa4  adds    r3, #1
000d2fa6  str     r3, [r4, r2]
000d2fa8  ldr     r3, [pc, #0x50]
000d2faa  movs    r2, #0
000d2fac  ldr     r1, [pc, #0x50]
000d2fae  add     r3, pc ; -> 0x000fa70c  OBJC_IVAR_$_DMGImageLoader.requestStarted
000d2fb0  ldr     r3, [r3]
000d2fb2  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d2fb4  strb    r2, [r4, r3]
000d2fb6  ldr     r3, [pc, #0x4c]
000d2fb8  add     r3, pc ; -> 0x000fa710  OBJC_IVAR_$_DMGImageLoader.loadedData
000d2fba  ldr     r0, [r3]
000d2fbc  ldr     r0, [r4, r0]
000d2fbe  ldr     r4, [r1]
000d2fc0  mov     r1, r4
000d2fc2  blx     #0xddbfc ; -> objc_msgSend
000d2fc6  mov     r0, r8
000d2fc8  mov     r1, r4
000d2fca  blx     #0xddbfc ; -> objc_msgSend
000d2fce  ldr     r8, [sp], #4
000d2fd2  pop     {r4, r5, r6, r7, pc}
000d2fd4  ldr     r3, [pc, #0x30]
000d2fd6  movs    r2, #0
000d2fd8  add     r3, pc ; -> 0x000fa714  OBJC_IVAR_$_DMGImageLoader.noOfAttempts
000d2fda  ldr     r3, [r3]
000d2fdc  str     r2, [r4, r3]
000d2fde  b       #0xd2fa8
000d2fe0  strb    r6, [r5, #0x1e]
000d2fe2  movs    r2, r0
000d2fe4  strb    r4, [r3, #0x1e]
000d2fe6  movs    r2, r0
000d2fe8  ldr     r5, [sp, #8]
000d2fea  movs    r2, r0
000d2fec  strb    r6, [r3, #0x1e]
000d2fee  movs    r2, r0
000d2ff0  strb    r0, [r6, #0x1d]
000d2ff2  movs    r2, r0
000d2ff4  ldr     r7, [sp, #0x1d8]
000d2ff6  movs    r2, r0
000d2ff8  strb    r2, [r6, #0x1d]
000d2ffa  movs    r2, r0
000d2ffc  strb    r2, [r3, #0x1d]
000d2ffe  movs    r2, r0
000d3000  ldr     r1, [sp, #0x318]
000d3002  movs    r2, r0
000d3004  strb    r4, [r2, #0x1d]
000d3006  movs    r2, r0
000d3008  strb    r0, [r7, #0x1c]
000d300a  movs    r2, r0
