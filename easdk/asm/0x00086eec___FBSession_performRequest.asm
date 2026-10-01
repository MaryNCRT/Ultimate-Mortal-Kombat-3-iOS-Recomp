========================================================================
-[FBSession performRequest  0x00086eec  260 bytes   FBSession.m
========================================================================

00086eec  push    {r4, r5, r6, r7, lr}
00086eee  add     r7, sp, #0xc
00086ef0  str     r8, [sp, #-0x4]!
00086ef4  sxtb    r4, r3
00086ef6  ldr     r3, [pc, #0xc4]
00086ef8  ldr     r1, [pc, #0xc4]
00086efa  mov     r5, r0
00086efc  add     r3, pc ; -> 0x000f5d28  OBJC_IVAR_$_FBSession._lastRequestTime
00086efe  add     r1, pc ; -> 0x000fcef4  
00086f00  ldr     r3, [r3]
00086f02  ldr     r1, [r1]
00086f04  mov     r6, r2
00086f06  ldr     r0, [r0, r3]
00086f08  blx     #0xddbfc ; -> objc_msgSend
00086f0c  vmov    d7, r0, r1
00086f10  vcmp.f64 d7, #0
00086f14  vmrs    apsr_nzcv, fpscr
00086f18  beq     #0x86f28
00086f1a  vmov.f64 d6, #-2.000000e+00
00086f1e  vcmp.f64 d7, d6
00086f22  vmrs    apsr_nzcv, fpscr
00086f26  bgt     #0x86f7e
00086f28  ldr     r1, [pc, #0x98]
00086f2a  ldr     r2, [pc, #0x9c]
00086f2c  mov     r0, r6
00086f2e  add     r1, pc ; -> 0x000fcee0  
00086f30  add     r2, pc ; -> 0x000fcee4  
00086f32  ldr     r1, [r1]
00086f34  ldr     r2, [r2]
00086f36  blx     #0xddbfc ; -> objc_msgSend
00086f3a  ldr     r3, [pc, #0x90]
00086f3c  ldr     r4, [pc, #0x90]
00086f3e  ldr     r1, [pc, #0x94]
00086f40  add     r3, pc ; -> 0x000f5d2c  OBJC_IVAR_$_FBSession._requestBurstCount
00086f42  add     r4, pc ; -> 0x000f5d28  OBJC_IVAR_$_FBSession._lastRequestTime
00086f44  ldr     r3, [r3]
00086f46  mov.w   r8, #1
00086f4a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
00086f4c  str.w   r8, [r5, r3]
00086f50  ldr     r3, [r4]
00086f52  ldr     r1, [r1]
00086f54  ldr     r0, [r5, r3]
00086f56  blx     #0xddbfc ; -> objc_msgSend
00086f5a  ldr     r1, [pc, #0x7c]
00086f5c  mov     r0, r6
00086f5e  ldr     r4, [r4]
00086f60  add     r1, pc ; -> 0x000fcedc  
00086f62  ldr     r1, [r1]
00086f64  blx     #0xddbfc ; -> objc_msgSend
00086f68  ldr     r1, [pc, #0x70]
00086f6a  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
00086f6c  ldr     r1, [r1]
00086f6e  blx     #0xddbfc ; -> objc_msgSend
00086f72  str     r0, [r5, r4]
00086f74  mov     r0, r8
00086f76  sxtb    r0, r0
00086f78  ldr     r8, [sp], #4
00086f7c  pop     {r4, r5, r6, r7, pc}
00086f7e  ldr     r3, [pc, #0x60]
00086f80  add     r3, pc ; -> 0x000f5d2c  OBJC_IVAR_$_FBSession._requestBurstCount
00086f82  ldr     r2, [r3]
00086f84  ldr     r3, [r5, r2]
00086f86  adds    r3, #1
00086f88  cmp     r3, #3
00086f8a  str     r3, [r5, r2]
00086f8c  ble     #0x86fa6
00086f8e  cbnz    r4, #0x86f94
00086f90  mov     r0, r4
00086f92  b       #0x86f76
00086f94  ldr     r1, [pc, #0x4c]
00086f96  mov     r0, r5
00086f98  mov     r2, r6
00086f9a  add     r1, pc ; -> 0x000fcee8  '>@\x0e'
00086f9c  ldr     r1, [r1]
00086f9e  blx     #0xddbfc ; -> objc_msgSend
00086fa2  movs    r0, #0
00086fa4  b       #0x86f76
00086fa6  ldr     r1, [pc, #0x40]
00086fa8  ldr     r2, [pc, #0x40]
00086faa  mov     r0, r6
00086fac  add     r1, pc ; -> 0x000fcee0  
00086fae  add     r2, pc ; -> 0x000fcee4  
00086fb0  ldr     r1, [r1]
00086fb2  ldr     r2, [r2]
00086fb4  blx     #0xddbfc ; -> objc_msgSend
00086fb8  movs    r0, #1
00086fba  b       #0x86f76
00086fbc  cdp     p0, #2, c0, c8, c6, #0
00086fc0  ldrsh   r2, [r6, r7]
00086fc2  movs    r7, r0
00086fc4  ldrsh   r6, [r5, r6]
00086fc6  movs    r7, r0
00086fc8  ldrsh   r0, [r6, r6]
00086fca  movs    r7, r0
00086fcc  stcl    p0, c0, [r8, #0x18]!
00086fd0  stcl    p0, c0, [r2, #0x18]!
00086fd4  ldrh    r6, [r5, r0]
00086fd6  movs    r7, r0
00086fd8  ldrsh   r0, [r7, r5]
00086fda  movs    r7, r0
00086fdc  ldrb    r2, [r4, r5]
00086fde  movs    r7, r0
00086fe0  stc     p0, c0, [r8, #0x18]!
00086fe4  ldrsh   r2, [r1, r5]
00086fe6  movs    r7, r0
00086fe8  ldrsh   r0, [r6, r4]
00086fea  movs    r7, r0
00086fec  ldrsh   r2, [r6, r4]
00086fee  movs    r7, r0
