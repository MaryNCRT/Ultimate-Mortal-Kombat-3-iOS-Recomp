========================================================================
md5  0x0008b75c  200 bytes   Mayhem.mm
========================================================================

0008b75c  push    {r4, r7, lr}
0008b75e  add     r7, sp, #4
0008b760  sub     sp, #0x4c
0008b762  ldr     r1, [pc, #0xb0]
0008b764  add     r1, pc ; -> 0x000fca20  '\x18V\x0e'
0008b766  ldr     r1, [r1]
0008b768  blx     #0xddbfc ; -> objc_msgSend
0008b76c  mov     r4, r0
0008b76e  blx     #0xdde0c ; -> strlen
0008b772  add     r2, sp, #0x3c
0008b774  mov     r1, r0
0008b776  mov     r0, r4
0008b778  blx     #0xdd0c8 ; -> CC_MD5
0008b77c  ldrb.w  ip, [sp, #0x3d]
0008b780  ldr     r0, [pc, #0x94]
0008b782  ldr     r1, [pc, #0x98]
0008b784  ldr     r2, [pc, #0x98]
0008b786  str.w   ip, [sp]
0008b78a  ldrb.w  ip, [sp, #0x3e]
0008b78e  add     r0, pc ; -> 0x000fdb5c  
0008b790  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
0008b792  add     r2, pc ; -> 0x0017f004  
0008b794  str.w   ip, [sp, #4]
0008b798  ldrb.w  ip, [sp, #0x3f]
0008b79c  ldr     r1, [r1]
0008b79e  ldrb.w  r3, [sp, #0x3c]
0008b7a2  ldr     r0, [r0]
0008b7a4  str.w   ip, [sp, #8]
0008b7a8  ldrb.w  ip, [sp, #0x40]
0008b7ac  str.w   ip, [sp, #0xc]
0008b7b0  ldrb.w  ip, [sp, #0x41]
0008b7b4  str.w   ip, [sp, #0x10]
0008b7b8  ldrb.w  ip, [sp, #0x42]
0008b7bc  str.w   ip, [sp, #0x14]
0008b7c0  ldrb.w  ip, [sp, #0x43]
0008b7c4  str.w   ip, [sp, #0x18]
0008b7c8  ldrb.w  ip, [sp, #0x44]
0008b7cc  str.w   ip, [sp, #0x1c]
0008b7d0  ldrb.w  ip, [sp, #0x45]
0008b7d4  str.w   ip, [sp, #0x20]
0008b7d8  ldrb.w  ip, [sp, #0x46]
0008b7dc  str.w   ip, [sp, #0x24]
0008b7e0  ldrb.w  ip, [sp, #0x47]
0008b7e4  str.w   ip, [sp, #0x28]
0008b7e8  ldrb.w  ip, [sp, #0x48]
0008b7ec  str.w   ip, [sp, #0x2c]
0008b7f0  ldrb.w  ip, [sp, #0x49]
0008b7f4  str.w   ip, [sp, #0x30]
0008b7f8  ldrb.w  ip, [sp, #0x4a]
0008b7fc  str.w   ip, [sp, #0x34]
0008b800  ldrb.w  ip, [sp, #0x4b]
0008b804  str.w   ip, [sp, #0x38]
0008b808  blx     #0xddbfc ; -> objc_msgSend
0008b80c  sub.w   sp, r7, #4
0008b810  pop     {r4, r7, pc}
0008b812  nop     
0008b814  asrs    r0, r7, #0xa
0008b816  movs    r7, r0
0008b818  movs    r3, #0xca
0008b81a  movs    r7, r0
0008b81c  asrs    r4, r1, #0xc
0008b81e  movs    r7, r0
0008b820  subs    r0, #0x6e
0008b822  movs    r7, r1
