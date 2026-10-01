========================================================================
-[FBStreamDialog initWithSession  0x00087bb8  100 bytes   FBStreamDialog.m
========================================================================

00087bb8  push    {r7, lr}
00087bba  add     r7, sp, #0
00087bbc  sub     sp, #8
00087bbe  ldr     r3, [pc, #0x40]
00087bc0  ldr     r1, [pc, #0x40]
00087bc2  str     r0, [sp]
00087bc4  add     r3, pc ; -> 0x000fdd50  
00087bc6  add     r1, pc ; -> 0x000fccd8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x360
00087bc8  ldr     r3, [r3]
00087bca  ldr     r1, [r1]
00087bcc  mov     r0, sp
00087bce  str     r3, [sp, #4]
00087bd0  blx     #0xddc08 ; -> objc_msgSendSuper2
00087bd4  cbz     r0, #0x87bfa
00087bd6  ldr     r3, [pc, #0x30]
00087bd8  ldr     r2, [pc, #0x30]
00087bda  add     r3, pc ; -> 0x000f5e9c  OBJC_IVAR_$_FBStreamDialog._attachment
00087bdc  add     r2, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
00087bde  ldr     r3, [r3]
00087be0  str     r2, [r0, r3]
00087be2  ldr     r3, [pc, #0x2c]
00087be4  add     r3, pc ; -> 0x000f5e98  OBJC_IVAR_$_FBStreamDialog._actionLinks
00087be6  ldr     r3, [r3]
00087be8  str     r2, [r0, r3]
00087bea  ldr     r3, [pc, #0x28]
00087bec  add     r3, pc ; -> 0x000f5e94  OBJC_IVAR_$_FBStreamDialog._targetId
00087bee  ldr     r3, [r3]
00087bf0  str     r2, [r0, r3]
00087bf2  ldr     r3, [pc, #0x24]
00087bf4  add     r3, pc ; -> 0x000f5e90  OBJC_IVAR_$_FBStreamDialog._userMessagePrompt
00087bf6  ldr     r3, [r3]
00087bf8  str     r2, [r0, r3]
00087bfa  sub.w   sp, r7, #0
00087bfe  pop     {r7, pc}
00087c00  str     r0, [r1, #0x18]
00087c02  movs    r7, r0
00087c04  str     r6, [r1, r4]
00087c06  movs    r7, r0
00087c08  b       #0x88188
00087c0a  movs    r6, r0
00087c0c  str     r4, [r2, #0x70]
00087c0e  movs    r7, r1
00087c10  b       #0x88174
00087c12  movs    r6, r0
00087c14  b       #0x88160
00087c16  movs    r6, r0
00087c18  b       #0x8814c
00087c1a  movs    r6, r0
