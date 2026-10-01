========================================================================
-[Social_Info getParamsData]  0x000d6a18  120 bytes   Social_Info.mm
========================================================================

000d6a18  push    {r4, r5, r7, lr}
000d6a1a  add     r7, sp, #8
000d6a1c  ldr     r3, [pc, #0x50]
000d6a1e  mov     r5, r0
000d6a20  ldr     r1, [pc, #0x50]
000d6a22  add     r3, pc ; -> 0x000fae6c  OBJC_IVAR_$_Social_Info.params
000d6a24  ldr     r0, [pc, #0x50]
000d6a26  ldr     r3, [r3]
000d6a28  ldr     r2, [pc, #0x50]
000d6a2a  add     r0, pc ; -> 0x000fdb5c  
000d6a2c  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d6a2e  add     r2, pc ; -> 0x00181c54  
000d6a30  ldr     r1, [r1]
000d6a32  ldr     r3, [r5, r3]
000d6a34  ldr     r0, [r0]
000d6a36  blx     #0xddbfc ; -> objc_msgSend
000d6a3a  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d6a3e  ldr     r1, [pc, #0x40]
000d6a40  mov     r0, r5
000d6a42  add     r1, pc ; -> 0x000fd7e4  '\x18\n\x0f'
000d6a44  ldr     r4, [r1]
000d6a46  mov     r1, r4
000d6a48  blx     #0xddbfc ; -> objc_msgSend
000d6a4c  cbz     r0, #0xd6a5c
000d6a4e  mov     r1, r4
000d6a50  mov     r0, r5
000d6a52  blx     #0xddbfc ; -> objc_msgSend
000d6a56  ldr     r1, [pc, #0x2c]
000d6a58  add     r1, pc ; -> 0x000fcd10  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x398
000d6a5a  b       #0xd6a64
000d6a5c  ldr     r0, [pc, #0x28]
000d6a5e  ldr     r1, [pc, #0x2c]
000d6a60  add     r0, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000d6a62  add     r1, pc ; -> 0x000fcd10  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x398
000d6a64  ldr     r1, [r1]
000d6a66  movs    r2, #4
000d6a68  blx     #0xddbfc ; -> objc_msgSend
000d6a6c  pop     {r4, r5, r7, pc}
000d6a6e  nop     
000d6a70  add     r6, r8
000d6a72  movs    r2, r0
000d6a74  str     r0, [r6, #4]
000d6a76  movs    r2, r0
000d6a78  strb    r6, [r5, #4]
000d6a7a  movs    r2, r0
000d6a7c  sxth    r2, r4
000d6a7e  movs    r2, r1
000d6a80  ldr     r6, [r3, #0x58]
000d6a82  movs    r2, r0
000d6a84  str     r4, [r6, #0x28]
000d6a86  movs    r2, r0
000d6a88  ldrb    r0, [r2, #2]
000d6a8a  movs    r2, r1
000d6a8c  str     r2, [r5, #0x28]
000d6a8e  movs    r2, r0
