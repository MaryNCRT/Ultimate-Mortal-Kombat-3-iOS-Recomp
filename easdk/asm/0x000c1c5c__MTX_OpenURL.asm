========================================================================
MTX_OpenURL  0x000c1c5c  340 bytes   EAMTX_Main.mm
========================================================================

000c1c5c  push    {r4, r5, r6, r7, lr}
000c1c5e  add     r7, sp, #0xc
000c1c60  push.w  {r8, sl, fp}
000c1c64  sub     sp, #0xc
000c1c66  mov     r6, r0
000c1c68  bl      #0xbd408 ; -> Z18CheckMTXControllerv
000c1c6c  ldr     r0, [pc, #0x100]
000c1c6e  ldr     r1, [pc, #0x104]
000c1c70  ldr     r4, [pc, #0x104]
000c1c72  add     r0, pc ; -> 0x000fdb5c  
000c1c74  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c1c76  ldr     r0, [r0]
000c1c78  ldr.w   fp, [r1]
000c1c7c  ldr     r1, [pc, #0xfc]
000c1c7e  add     r4, pc ; -> 0x00180fb4  
000c1c80  str     r0, [sp]
000c1c82  ldr     r0, [pc, #0xfc]
000c1c84  add     r1, pc ; -> 0x000fd6a4  
000c1c86  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000c1c88  ldr     r1, [r1]
000c1c8a  ldr     r0, [r0]
000c1c8c  blx     #0xddbfc ; -> objc_msgSend
000c1c90  mov     r2, r4
000c1c92  mov     r1, fp
000c1c94  mov     r3, r0
000c1c96  ldr     r0, [sp]
000c1c98  blx     #0xddbfc ; -> objc_msgSend
000c1c9c  mov     r4, r0
000c1c9e  cmp     r6, #0
000c1ca0  beq     #0xc1d64
000c1ca2  ldr     r1, [pc, #0xe0]
000c1ca4  ldr     r2, [pc, #0xe0]
000c1ca6  mov     r0, r6
000c1ca8  add     r1, pc ; -> 0x000fcc64  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2ec
000c1caa  add     r2, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000c1cac  ldr     r1, [r1]
000c1cae  blx     #0xddbfc ; -> objc_msgSend
000c1cb2  uxtb.w  sl, r0
000c1cb6  cmp.w   sl, #0
000c1cba  bne     #0xc1d64
000c1cbc  ldr     r2, [pc, #0xcc]
000c1cbe  mov     r3, r4
000c1cc0  add     r0, sp, #4
000c1cc2  add     r2, pc ; -> 0x000fcdc8  
000c1cc4  mov     r1, r6
000c1cc6  ldr.w   r8, [r2]
000c1cca  mov     r2, r8
000c1ccc  blx     #0xddc14 ; -> objc_msgSend_stret
000c1cd0  add     r4, sp, #4
000c1cd2  ldm     r4, {r4, r5}
000c1cd4  cbnz    r4, #0xc1cec
000c1cd6  ldr     r1, [pc, #0xb8]
000c1cd8  subs    r2, r5, #1
000c1cda  mov     r0, r6
000c1cdc  add     r1, pc ; -> 0x000fcdc4  
000c1cde  ldr     r1, [r1]
000c1ce0  blx     #0xddbfc ; -> objc_msgSend
000c1ce4  mov     r1, r4
000c1ce6  mov     r2, r0
000c1ce8  movs    r0, #0x35
000c1cea  b       #0xc1d0c
000c1cec  ldr     r3, [pc, #0xa4]
000c1cee  mov     r1, r6
000c1cf0  mov     r2, r8
000c1cf2  add     r3, pc ; -> 0x00180fc4  
000c1cf4  add     r0, sp, #4
000c1cf6  blx     #0xddc14 ; -> objc_msgSend_stret
000c1cfa  add     r2, sp, #4
000c1cfc  ldm     r2, {r2, r3}
000c1cfe  mvn     r1, #0x80000000
000c1d02  cmp     r2, r1
000c1d04  bne     #0xc1d12
000c1d06  movs    r0, #0x35
000c1d08  mov     r1, sl
000c1d0a  mov     r2, r6
000c1d0c  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000c1d10  b       #0xc1d64
000c1d12  ldr     r2, [pc, #0x84]
000c1d14  mov     r3, r6
000c1d16  mov     r1, fp
000c1d18  add     r2, pc ; -> 0x00180fd4  
000c1d1a  ldr     r0, [sp]
000c1d1c  blx     #0xddbfc ; -> objc_msgSend
000c1d20  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c1d24  ldr     r0, [pc, #0x74]
000c1d26  ldr     r1, [pc, #0x78]
000c1d28  add     r0, pc ; -> 0x000fdb80  
000c1d2a  add     r1, pc ; -> 0x000fcb00  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x188
000c1d2c  ldr     r0, [r0]
000c1d2e  ldr     r1, [r1]
000c1d30  blx     #0xddbfc ; -> objc_msgSend
000c1d34  ldr     r1, [pc, #0x6c]
000c1d36  mov     r2, r6
000c1d38  add     r1, pc ; -> 0x000fcbac  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x234
000c1d3a  ldr     r4, [r1]
000c1d3c  ldr     r1, [pc, #0x68]
000c1d3e  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
000c1d40  ldr     r1, [r1]
000c1d42  mov     r5, r0
000c1d44  ldr     r0, [pc, #0x64]
000c1d46  add     r0, pc ; -> 0x000fdb64  
000c1d48  ldr     r0, [r0]
000c1d4a  blx     #0xddbfc ; -> objc_msgSend
000c1d4e  mov     r1, r4
000c1d50  mov     r2, r0
000c1d52  mov     r0, r5
000c1d54  blx     #0xddbfc ; -> objc_msgSend
000c1d58  tst.w   r0, #0xff
000c1d5c  ite     eq
000c1d5e  moveq   r0, #0
000c1d60  movne   r0, #1
000c1d62  b       #0xc1d66
000c1d64  movs    r0, #1
000c1d66  sub.w   sp, r7, #0x18
000c1d6a  pop.w   {r8, sl, fp}
000c1d6e  pop     {r4, r5, r6, r7, pc}
000c1d70  bkpt    #0xe6
000c1d72  movs    r3, r0
000c1d74  add     r6, sp, #0xa0
000c1d76  movs    r3, r0
