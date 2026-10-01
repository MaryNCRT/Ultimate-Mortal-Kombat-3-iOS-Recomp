========================================================================
-[Social_Info loadPrevFBUid]  0x000d6be4  140 bytes   Social_Info.mm
========================================================================

000d6be4  push    {r4, r5, r6, r7, lr}
000d6be6  add     r7, sp, #0xc
000d6be8  str     r8, [sp, #-0x4]!
000d6bec  ldr     r0, [pc, #0x5c]
000d6bee  ldr     r4, [pc, #0x60]
000d6bf0  add     r0, pc ; -> 0x00181c84  
000d6bf2  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d6bf6  ldr     r0, [pc, #0x5c]
000d6bf8  ldr     r1, [pc, #0x5c]
000d6bfa  add     r4, pc ; -> 0x00181c94  
000d6bfc  add     r0, pc ; -> 0x000fdc2c  
000d6bfe  add     r1, pc ; -> 0x000fd008  ':Z\x0e'
000d6c00  ldr     r0, [r0]
000d6c02  ldr     r1, [r1]
000d6c04  blx     #0xddbfc ; -> objc_msgSend
000d6c08  ldr     r1, [pc, #0x50]
000d6c0a  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d6c0c  ldr     r5, [r1]
000d6c0e  mov     r8, r0
000d6c10  ldr     r0, [pc, #0x4c]
000d6c12  add     r0, pc ; -> 0x000fdb5c  
000d6c14  ldr     r6, [r0]
000d6c16  blx     #0xdd41c ; -> NSTemporaryDirectory
000d6c1a  mov     r1, r5
000d6c1c  mov     r2, r4
000d6c1e  mov     r3, r0
000d6c20  mov     r0, r6
000d6c22  blx     #0xddbfc ; -> objc_msgSend
000d6c26  ldr     r1, [pc, #0x3c]
000d6c28  add     r1, pc ; -> 0x000fd21c  
000d6c2a  ldr     r1, [r1]
000d6c2c  mov     r2, r0
000d6c2e  mov     r0, r8
000d6c30  blx     #0xddbfc ; -> objc_msgSend
000d6c34  ldr     r1, [pc, #0x30]
000d6c36  add     r1, pc ; -> 0x000fcad0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x158
000d6c38  ldr     r1, [r1]
000d6c3a  mov     r2, r0
000d6c3c  ldr     r0, [pc, #0x2c]
000d6c3e  add     r0, pc ; -> 0x000fdb8c  
000d6c40  ldr     r0, [r0]
000d6c42  blx     #0xddbfc ; -> objc_msgSend
000d6c46  ldr     r8, [sp], #4
000d6c4a  pop     {r4, r5, r6, r7, pc}
000d6c4c  sub     sp, #0x40
000d6c4e  movs    r2, r1
000d6c50  sub     sp, #0x58
000d6c52  movs    r2, r1
000d6c54  strb    r4, [r5]
000d6c56  movs    r2, r0
000d6c58  str     r6, [r0, #0x40]
000d6c5a  movs    r2, r0
000d6c5c  ldrsh   r2, [r2, r2]
000d6c5e  movs    r2, r0
000d6c60  ldr     r6, [r0, #0x74]
000d6c62  movs    r2, r0
000d6c64  str     r0, [r6, #0x5c]
000d6c66  movs    r2, r0
000d6c68  ldrsh   r6, [r2, r2]
000d6c6a  movs    r2, r0
000d6c6c  ldr     r2, [r1, #0x74]
000d6c6e  movs    r2, r0
