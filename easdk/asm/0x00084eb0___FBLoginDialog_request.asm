========================================================================
-[FBLoginDialog request  0x00084eb0  300 bytes   FBLoginDialog.m
========================================================================

00084eb0  push    {r4, r5, r6, r7, lr}
00084eb2  add     r7, sp, #0xc
00084eb4  push.w  {r8, sl, fp}
00084eb8  sub     sp, #0x10
00084eba  ldr     r1, [pc, #0xe4]
00084ebc  ldr     r2, [pc, #0xe4]
00084ebe  mov     r6, r0
00084ec0  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
00084ec2  mov     r0, r3
00084ec4  ldr     r4, [r1]
00084ec6  add     r2, pc ; -> 0x0017e974  
00084ec8  mov     r5, r3
00084eca  mov     r1, r4
00084ecc  blx     #0xddbfc ; -> objc_msgSend
00084ed0  ldr     r1, [pc, #0xd4]
00084ed2  add     r1, pc ; -> 0x000fcdb4  
00084ed4  ldr     r1, [r1]
00084ed6  blx     #0xddbfc ; -> objc_msgSend
00084eda  ldr     r2, [pc, #0xd0]
00084edc  add     r2, pc ; -> 0x0017e984  
00084ede  mov     sl, r0
00084ee0  mov     fp, r1
00084ee2  mov     r0, r5
00084ee4  mov     r1, r4
00084ee6  blx     #0xddbfc ; -> objc_msgSend
00084eea  ldr     r2, [pc, #0xc4]
00084eec  mov     r1, r4
00084eee  add     r2, pc ; -> 0x0017e994  
00084ef0  str     r0, [sp, #0xc]
00084ef2  mov     r0, r5
00084ef4  blx     #0xddbfc ; -> objc_msgSend
00084ef8  ldr     r2, [pc, #0xb8]
00084efa  mov     r1, r4
00084efc  add     r2, pc ; -> 0x0017e9a4  
00084efe  mov     r8, r0
00084f00  mov     r0, r5
00084f02  blx     #0xddbfc ; -> objc_msgSend
00084f06  ldr     r1, [pc, #0xb0]
00084f08  add     r1, pc ; -> 0x000fc9e8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x70
00084f0a  ldr     r1, [r1]
00084f0c  blx     #0xddbfc ; -> objc_msgSend
00084f10  vmov    s14, r0
00084f14  vcvt.f64.f32 d7, s14
00084f18  vcmp.f64 d7, #0
00084f1c  vmrs    apsr_nzcv, fpscr
00084f20  bne     #0x84f86
00084f22  movs    r5, #0
00084f24  ldr     r4, [pc, #0x94]
00084f26  ldr     r1, [pc, #0x98]
00084f28  add     r4, pc ; -> 0x000f5520  OBJC_IVAR_$_FBLoginDialog._getSessionRequest
00084f2a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
00084f2c  ldr     r3, [r4]
00084f2e  ldr     r1, [r1]
00084f30  ldr     r0, [r6, r3]
00084f32  blx     #0xddbfc ; -> objc_msgSend
00084f36  ldr     r3, [r4]
00084f38  movs    r2, #0
00084f3a  ldr     r1, [pc, #0x88]
00084f3c  str     r2, [r6, r3]
00084f3e  ldr     r3, [pc, #0x88]
00084f40  add     r1, pc ; -> 0x000fcdac  
00084f42  mov     r2, sl
00084f44  add     r3, pc ; -> 0x000f342c  OBJC_IVAR_$_FBDialog._session
00084f46  ldr     r1, [r1]
00084f48  ldr     r4, [r3]
00084f4a  ldr     r3, [r4]
00084f4c  str.w   r8, [sp, #4]
00084f50  str     r5, [sp, #8]
00084f52  ldr     r0, [r6, r3]
00084f54  ldr     r3, [sp, #0xc]
00084f56  str     r3, [sp]
00084f58  mov     r3, fp
00084f5a  blx     #0xddbfc ; -> objc_msgSend
00084f5e  ldr     r1, [pc, #0x6c]
00084f60  ldr     r3, [r4]
00084f62  add     r1, pc ; -> 0x000fcda8  
00084f64  ldr     r0, [r6, r3]
00084f66  ldr     r1, [r1]
00084f68  blx     #0xddbfc ; -> objc_msgSend
00084f6c  ldr     r1, [pc, #0x60]
00084f6e  movs    r2, #1
00084f70  mov     r0, r6
00084f72  add     r1, pc ; -> 0x000fcce0  "('\x0e"
00084f74  mov     r3, r2
00084f76  ldr     r1, [r1]
00084f78  blx     #0xddbfc ; -> objc_msgSend
00084f7c  sub.w   sp, r7, #0x18
00084f80  pop.w   {r8, sl, fp}
00084f84  pop     {r4, r5, r6, r7, pc}
00084f86  ldr     r0, [pc, #0x4c]
00084f88  ldr     r1, [pc, #0x4c]
00084f8a  vmov    r2, r3, d7
00084f8e  add     r0, pc ; -> 0x000fdbb4  
00084f90  add     r1, pc ; -> 0x000fcdb0  'a4\x0e'
00084f92  ldr     r0, [r0]
00084f94  ldr     r1, [r1]
00084f96  blx     #0xddbfc ; -> objc_msgSend
00084f9a  mov     r5, r0
00084f9c  b       #0x84f24
00084f9e  nop     
00084fa0  ldrb    r0, [r2, #0x10]
00084fa2  movs    r7, r0
00084fa4  ldr     r2, [sp, #0x2a8]
00084fa6  movs    r7, r1
00084fa8  ldrb    r6, [r3, #0x1b]
00084faa  movs    r7, r0
00084fac  ldr     r2, [sp, #0x290]
00084fae  movs    r7, r1
00084fb0  ldr     r2, [sp, #0x288]
00084fb2  movs    r7, r1
00084fb4  ldr     r2, [sp, #0x290]
00084fb6  movs    r7, r1
00084fb8  ldrb    r4, [r3, #0xb]
00084fba  movs    r7, r0
00084fbc  lsls    r4, r6, #0x17
00084fbe  movs    r7, r0
00084fc0  ldrb    r6, [r1, #9]
00084fc2  movs    r7, r0
00084fc4  ldrb    r0, [r5, #0x19]
00084fc6  movs    r7, r0
00084fc8  b       #0x84994 ; -> -[FBLoginButton touchUpInside]
00084fca  movs    r6, r0
00084fcc  ldrb    r2, [r0, #0x19]
00084fce  movs    r7, r0
00084fd0  ldrb    r2, [r5, #0x15]
00084fd2  movs    r7, r0
00084fd4  ldrh    r2, [r4, #0x20]
00084fd6  movs    r7, r0
00084fd8  ldrb    r4, [r3, #0x18]
00084fda  movs    r7, r0
