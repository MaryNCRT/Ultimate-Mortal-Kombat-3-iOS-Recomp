========================================================================
-[FBDialog dismiss  0x00082df0  212 bytes   FBDialog.m
========================================================================

00082df0  push    {r4, r5, r6, r7, lr}
00082df2  add     r7, sp, #0xc
00082df4  ldr     r1, [pc, #0x98]
00082df6  ldr     r4, [pc, #0x9c]
00082df8  mov     r5, r0
00082dfa  add     r1, pc ; -> 0x000fccec  '\x164\x0e'
00082dfc  add     r4, pc ; -> 0x000f51c4  OBJC_IVAR_$_FBDialog._loadingURL
00082dfe  ldr     r1, [r1]
00082e00  sxtb    r6, r2
00082e02  blx     #0xddbfc ; -> objc_msgSend
00082e06  ldr     r1, [pc, #0x90]
00082e08  ldr     r3, [r4]
00082e0a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
00082e0c  ldr     r0, [r5, r3]
00082e0e  ldr     r1, [r1]
00082e10  blx     #0xddbfc ; -> objc_msgSend
00082e14  ldr     r3, [r4]
00082e16  movs    r2, #0
00082e18  str     r2, [r5, r3]
00082e1a  cmp     r6, #0
00082e1c  beq     #0x82e80
00082e1e  ldr     r0, [pc, #0x7c]
00082e20  ldr     r1, [pc, #0x7c]
00082e22  mov     r3, r2
00082e24  add     r0, pc ; -> 0x000fdbb8  
00082e26  add     r1, pc ; -> 0x000fcd3c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3c4
00082e28  ldr     r4, [r0]
00082e2a  ldr     r1, [r1]
00082e2c  mov     r0, r4
00082e2e  blx     #0xddbfc ; -> objc_msgSend
00082e32  ldr     r1, [pc, #0x70]
00082e34  ldr     r3, [pc, #0x70]
00082e36  mov     r0, r4
00082e38  add     r1, pc ; -> 0x000fcd38  'k.\x0e'
00082e3a  mov.w   r2, #0x40000000
00082e3e  ldr     r1, [r1]
00082e40  blx     #0xddbfc ; -> objc_msgSend
00082e44  ldr     r1, [pc, #0x64]
00082e46  mov     r0, r4
00082e48  mov     r2, r5
00082e4a  add     r1, pc ; -> 0x000fcd34  'U.\x0e'
00082e4c  ldr     r1, [r1]
00082e4e  blx     #0xddbfc ; -> objc_msgSend
00082e52  ldr     r1, [pc, #0x5c]
00082e54  ldr     r2, [pc, #0x5c]
00082e56  mov     r0, r4
00082e58  add     r1, pc ; -> 0x000fcd2c  '8.\x0e'
00082e5a  add     r2, pc ; -> 0x000fcce8  '7(\x0e'
00082e5c  ldr     r1, [r1]
00082e5e  ldr     r2, [r2]
00082e60  blx     #0xddbfc ; -> objc_msgSend
00082e64  ldr     r1, [pc, #0x50]
00082e66  mov     r0, r5
00082e68  movs    r2, #0
00082e6a  add     r1, pc ; -> 0x000fcce4  '2-\x0e'
00082e6c  ldr     r1, [r1]
00082e6e  blx     #0xddbfc ; -> objc_msgSend
00082e72  ldr     r1, [pc, #0x48]
00082e74  mov     r0, r4
00082e76  add     r1, pc ; -> 0x000fcd28  "'.\x0e"
00082e78  ldr     r1, [r1]
00082e7a  blx     #0xddbfc ; -> objc_msgSend
00082e7e  pop     {r4, r5, r6, r7, pc}
00082e80  ldr     r1, [pc, #0x3c]
00082e82  mov     r0, r5
00082e84  add     r1, pc ; -> 0x000fcce8  '7(\x0e'
00082e86  ldr     r1, [r1]
00082e88  blx     #0xddbfc ; -> objc_msgSend
00082e8c  b       #0x82e7e
00082e8e  nop     
00082e90  ldr     r6, [sp, #0x3b8]
00082e92  movs    r7, r0
00082e94  movs    r3, #0xc4
00082e96  movs    r7, r0
00082e98  ldr     r3, [sp, #0x1b8]
00082e9a  movs    r7, r0
00082e9c  add     r5, sp, #0x240
00082e9e  movs    r7, r0
00082ea0  ldr     r7, [sp, #0x48]
00082ea2  movs    r7, r0
00082ea4  ldr     r6, [sp, #0x3f0]
00082ea6  movs    r7, r0
00082ea8  adds    r3, #0x33
00082eaa  subs    r7, #0xd3
00082eac  ldr     r6, [sp, #0x398]
00082eae  movs    r7, r0
00082eb0  ldr     r6, [sp, #0x340]
00082eb2  movs    r7, r0
00082eb4  ldr     r6, [sp, #0x228]
00082eb6  movs    r7, r0
00082eb8  ldr     r6, [sp, #0x1d8]
00082eba  movs    r7, r0
00082ebc  ldr     r6, [sp, #0x2b8]
00082ebe  movs    r7, r0
00082ec0  ldr     r6, [sp, #0x180]
00082ec2  movs    r7, r0
