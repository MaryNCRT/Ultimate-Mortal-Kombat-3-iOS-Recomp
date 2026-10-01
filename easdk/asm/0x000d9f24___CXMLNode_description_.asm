========================================================================
-[CXMLNode description]  0x000d9f24  272 bytes   CXMLNode.m
========================================================================

000d9f24  push    {r4, r5, r6, r7, lr}
000d9f26  add     r7, sp, #0xc
000d9f28  push.w  {r8, sl, fp}
000d9f2c  sub     sp, #0x24
000d9f2e  ldr     r3, [pc, #0xc8]
000d9f30  mov     r4, r0
000d9f32  mov     r6, r1
000d9f34  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9f36  ldr     r3, [r3]
000d9f38  ldr     r5, [r0, r3]
000d9f3a  cbnz    r5, #0xd9f8c
000d9f3c  ldr     r0, [pc, #0xbc]
000d9f3e  ldr     r1, [pc, #0xc0]
000d9f40  add     r0, pc ; -> 0x000fdcd4  
000d9f42  add     r1, pc ; -> 0x000fd860  
000d9f44  ldr     r0, [r0]
000d9f46  ldr     r1, [r1]
000d9f48  blx     #0xddbfc ; -> objc_msgSend
000d9f4c  ldr     r1, [pc, #0xb4]
000d9f4e  ldr     r2, [pc, #0xb8]
000d9f50  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d9f52  add     r2, pc ; -> 0x000ed700  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLNode.m'
000d9f54  ldr.w   r8, [r1]
000d9f58  ldr     r1, [pc, #0xb0]
000d9f5a  add     r1, pc ; -> 0x000fd77c  
000d9f5c  ldr     r1, [r1]
000d9f5e  mov     sl, r0
000d9f60  ldr     r0, [pc, #0xac]
000d9f62  add     r0, pc ; -> 0x000fdb5c  
000d9f64  ldr     r0, [r0]
000d9f66  blx     #0xddbfc ; -> objc_msgSend
000d9f6a  ldr     r3, [pc, #0xa8]
000d9f6c  movs    r2, #0xfa
000d9f6e  mov     r1, r8
000d9f70  add     r3, pc ; -> 0x00182684  
000d9f72  str     r2, [sp, #4]
000d9f74  str     r3, [sp, #8]
000d9f76  mov     r2, r6
000d9f78  mov     r3, r4
000d9f7a  str     r5, [sp, #0xc]
000d9f7c  str     r5, [sp, #0x10]
000d9f7e  str     r5, [sp, #0x14]
000d9f80  str     r5, [sp, #0x18]
000d9f82  str     r5, [sp, #0x1c]
000d9f84  str     r0, [sp]
000d9f86  mov     r0, sl
000d9f88  blx     #0xddbfc ; -> objc_msgSend
000d9f8c  ldr     r1, [pc, #0x88]
000d9f8e  ldr     r0, [pc, #0x8c]
000d9f90  ldr.w   r8, [pc, #0x8c]
000d9f94  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d9f96  add     r0, pc ; -> 0x000fdb5c  
000d9f98  ldr.w   fp, [r1]
000d9f9c  ldr     r1, [pc, #0x84]
000d9f9e  ldr     r0, [r0]
000d9fa0  add     r8, pc ; -> 0x00182694  
000d9fa2  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
000d9fa4  str     r0, [sp, #0x20]
000d9fa6  ldr     r1, [r1]
000d9fa8  mov     r0, r4
000d9faa  blx     #0xddbfc ; -> objc_msgSend
000d9fae  blx     #0xdd404 ; -> NSStringFromClass
000d9fb2  ldr     r3, [pc, #0x74]
000d9fb4  ldr     r1, [pc, #0x74]
000d9fb6  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9fb8  add     r1, pc ; -> 0x000fcb70  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1f8
000d9fba  ldr     r3, [r3]
000d9fbc  ldr     r1, [r1]
000d9fbe  ldr     r6, [r4, r3]
000d9fc0  mov     sl, r0
000d9fc2  mov     r0, r4
000d9fc4  blx     #0xddbfc ; -> objc_msgSend
000d9fc8  ldr     r1, [pc, #0x64]
000d9fca  movs    r2, #0
000d9fcc  add     r1, pc ; -> 0x000fda04  
000d9fce  ldr     r1, [r1]
000d9fd0  mov     r5, r0
000d9fd2  mov     r0, r4
000d9fd4  blx     #0xddbfc ; -> objc_msgSend
000d9fd8  mov     r1, fp
000d9fda  mov     r2, r8
000d9fdc  mov     r3, sl
000d9fde  str     r4, [sp]
000d9fe0  str     r6, [sp, #4]
000d9fe2  str     r5, [sp, #8]
000d9fe4  str     r0, [sp, #0xc]
000d9fe6  ldr     r0, [sp, #0x20]
000d9fe8  blx     #0xddbfc ; -> objc_msgSend
000d9fec  sub.w   sp, r7, #0x18
000d9ff0  pop.w   {r8, sl, fp}
000d9ff4  pop     {r4, r5, r6, r7, pc}
000d9ff6  nop     
000d9ff8  movs    r0, #0xf0
000d9ffa  movs    r2, r0
000d9ffc  subs    r5, #0x90
000d9ffe  movs    r2, r0
000da000  subs    r1, #0x1a
000da002  movs    r2, r0
000da004  subs    r1, #8
000da006  movs    r2, r0
000da008  adds    r7, #0xaa
000da00a  movs    r1, r0
000da00c  subs    r0, #0x1e
000da00e  movs    r2, r0
000da010  subs    r3, #0xf6
000da012  movs    r2, r0
000da014  strh    r0, [r2, #0x38]
000da016  movs    r2, r1
000da018  cmp     r3, #8
000da01a  movs    r2, r0
000da01c  subs    r3, #0xc2
000da01e  movs    r2, r0
000da020  strh    r0, [r6, #0x36]
000da022  movs    r2, r1
000da024  cmp     r2, #0x66
000da026  movs    r2, r0
000da028  movs    r0, #0x6e
000da02a  movs    r2, r0
000da02c  cmp     r3, #0xb4
000da02e  movs    r2, r0
000da030  subs    r2, #0x34
000da032  movs    r2, r0
