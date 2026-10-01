========================================================================
-[EAMTX_Message show]  0x000d2984  436 bytes   EAMTX_Message.mm
========================================================================

000d2984  push    {r4, r5, r6, r7, lr}
000d2986  add     r7, sp, #0xc
000d2988  str     r8, [sp, #-0x4]!
000d298c  sub     sp, #0x10
000d298e  ldr     r1, [pc, #0x140]
000d2990  mov     r5, r0
000d2992  ldr     r0, [pc, #0x140]
000d2994  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d2996  ldr     r4, [pc, #0x140]
000d2998  ldr     r6, [r1]
000d299a  ldr     r1, [pc, #0x140]
000d299c  add     r0, pc ; -> 0x000fdb5c  
000d299e  add     r4, pc ; -> 0x0017e5c4  
000d29a0  add     r1, pc ; -> 0x000fd79c  
000d29a2  ldr.w   r8, [r0]
000d29a6  ldr     r1, [r1]
000d29a8  mov     r0, r5
000d29aa  blx     #0xddbfc ; -> objc_msgSend
000d29ae  ldr     r1, [pc, #0x130]
000d29b0  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000d29b2  ldr     r1, [r1]
000d29b4  blx     #0xddbfc ; -> objc_msgSend
000d29b8  mov     r2, r4
000d29ba  mov     r1, r6
000d29bc  movs    r6, #0
000d29be  mov     r3, r0
000d29c0  mov     r0, r8
000d29c2  blx     #0xddbfc ; -> objc_msgSend
000d29c6  ldr     r1, [pc, #0x11c]
000d29c8  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000d29ca  ldr     r1, [r1]
000d29cc  mov     r4, r0
000d29ce  ldr     r0, [pc, #0x118]
000d29d0  add     r0, pc ; -> 0x000fdbb4  
000d29d2  ldr     r0, [r0]
000d29d4  blx     #0xddbfc ; -> objc_msgSend
000d29d8  mov     r3, r6
000d29da  movs    r1, #0x12
000d29dc  mov     r2, r4
000d29de  str     r6, [sp]
000d29e0  str     r0, [sp, #4]
000d29e2  movw    r0, #0x7543
000d29e6  bl      #0xbe81c ; -> Z15MTX_LogEAServeriiP8NSStringiS0_P6NSDate
000d29ea  ldr     r3, [pc, #0x100]
000d29ec  add     r3, pc ; -> 0x000f3348  mIAMView
000d29ee  ldr.w   r8, [r3]
000d29f2  ldr.w   r0, [r8]
000d29f6  cbz     r0, #0xd2a06
000d29f8  ldr     r1, [pc, #0xf4]
000d29fa  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d29fc  ldr     r1, [r1]
000d29fe  blx     #0xddbfc ; -> objc_msgSend
000d2a02  str.w   r6, [r8]
000d2a06  ldr     r3, [pc, #0xec]
000d2a08  add     r3, pc ; -> 0x000fa2cc  OBJC_IVAR_$_EAMTX_Message.mURL
000d2a0a  ldr     r3, [r3]
000d2a0c  ldr     r4, [r5, r3]
000d2a0e  cbz     r4, #0xd2a64
000d2a10  ldr     r0, [pc, #0xe4]
000d2a12  ldr     r1, [pc, #0xe8]
000d2a14  add     r0, pc ; -> 0x000fdc4c  
000d2a16  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d2a18  ldr     r0, [r0]
000d2a1a  ldr     r1, [r1]
000d2a1c  blx     #0xddbfc ; -> objc_msgSend
000d2a20  ldr     r3, [pc, #0xdc]
000d2a22  ldr.w   ip, [pc, #0xe0]
000d2a26  ldr     r1, [pc, #0xe0]
000d2a28  add     r3, pc ; -> 0x000fa2d0  OBJC_IVAR_$_EAMTX_Message.mTitle
000d2a2a  add     ip, pc ; -> 0x000fa2d8  OBJC_IVAR_$_EAMTX_Message.mBut1Title
000d2a2c  ldr     r3, [r3]
000d2a2e  add     r1, pc ; -> 0x000fd160  'my\x0e'
000d2a30  ldr     r1, [r1]
000d2a32  ldr     r2, [r5, r3]
000d2a34  ldr     r3, [pc, #0xd4]
000d2a36  add     r3, pc ; -> 0x000fa2d4  OBJC_IVAR_$_EAMTX_Message.mMessage
000d2a38  ldr     r3, [r3]
000d2a3a  str     r5, [sp]
000d2a3c  ldr.w   ip, [ip]
000d2a40  ldr     r3, [r5, r3]
000d2a42  ldr.w   ip, [r5, ip]
000d2a46  str.w   ip, [sp, #4]
000d2a4a  ldr.w   ip, [pc, #0xc4]
000d2a4e  add     ip, pc ; -> 0x000fa2dc  OBJC_IVAR_$_EAMTX_Message.mBut2Title
000d2a50  ldr.w   ip, [ip]
000d2a54  str     r6, [sp, #0xc]
000d2a56  ldr.w   ip, [r5, ip]
000d2a5a  str.w   ip, [sp, #8]
000d2a5e  blx     #0xddbfc ; -> objc_msgSend
000d2a62  b       #0xd2aa4
000d2a64  ldr     r0, [pc, #0xac]
000d2a66  ldr     r1, [pc, #0xb0]
000d2a68  add     r0, pc ; -> 0x000fdc4c  
000d2a6a  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d2a6c  ldr     r0, [r0]
000d2a6e  ldr     r1, [r1]
000d2a70  blx     #0xddbfc ; -> objc_msgSend
000d2a74  ldr     r3, [pc, #0xa4]
000d2a76  ldr.w   ip, [pc, #0xa8]
000d2a7a  ldr     r1, [pc, #0xa8]
000d2a7c  add     r3, pc ; -> 0x000fa2d0  OBJC_IVAR_$_EAMTX_Message.mTitle
000d2a7e  add     ip, pc ; -> 0x000fa2d8  OBJC_IVAR_$_EAMTX_Message.mBut1Title
000d2a80  ldr     r3, [r3]
000d2a82  add     r1, pc ; -> 0x000fd160  'my\x0e'
000d2a84  ldr     r1, [r1]
000d2a86  ldr     r2, [r5, r3]
000d2a88  ldr     r3, [pc, #0x9c]
000d2a8a  add     r3, pc ; -> 0x000fa2d4  OBJC_IVAR_$_EAMTX_Message.mMessage
000d2a8c  ldr     r3, [r3]
000d2a8e  str     r5, [sp]
000d2a90  ldr.w   ip, [ip]
000d2a94  str     r4, [sp, #8]
000d2a96  ldr     r3, [r5, r3]
000d2a98  ldr.w   ip, [r5, ip]
000d2a9c  str.w   ip, [sp, #4]
000d2aa0  blx     #0xddbfc ; -> objc_msgSend
000d2aa4  str.w   r0, [r8]
000d2aa8  ldr     r0, [pc, #0x80]
000d2aaa  ldr     r1, [pc, #0x84]
000d2aac  add     r0, pc ; -> 0x000f3348  mIAMView
000d2aae  add     r1, pc ; -> 0x000fcd8c  
000d2ab0  ldr     r0, [r0]
000d2ab2  ldr     r1, [r1]
000d2ab4  ldr     r0, [r0]
000d2ab6  blx     #0xddbfc ; -> objc_msgSend
000d2aba  ldr     r1, [pc, #0x78]
000d2abc  mov     r0, r5
000d2abe  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000d2ac0  ldr     r1, [r1]
000d2ac2  blx     #0xddbfc ; -> objc_msgSend
000d2ac6  sub.w   sp, r7, #0x10
000d2aca  ldr     r8, [sp], #4
000d2ace  pop     {r4, r5, r6, r7, pc}
000d2ad0  adr     r1, #0x20
000d2ad2  movs    r2, r0
000d2ad4  cbz     r4, #0xd2b06
000d2ad6  movs    r2, r0
000d2ad8  pop     {r1, r5}
000d2ada  movs    r2, r1
000d2adc  add     r5, sp, #0x3e0
000d2ade  movs    r2, r0
000d2ae0  adr     r1, #0xd0
000d2ae2  movs    r2, r0
000d2ae4  adr     r1, #0x3f0
000d2ae6  movs    r2, r0
000d2ae8  cbz     r0, #0xd2b24
000d2aea  movs    r2, r0
000d2aec  lsrs    r0, r3, #5
000d2aee  movs    r2, r0
000d2af0  ldr     r7, [sp, #0x1f8]
000d2af2  movs    r2, r0
000d2af4  ldrb    r0, [r0, #3]
000d2af6  movs    r2, r0
000d2af8  sxth    r4, r6
000d2afa  movs    r2, r0
000d2afc  ldr     r7, [sp, #0x1a8]
000d2afe  movs    r2, r0
000d2b00  ldrb    r4, [r4, #2]
000d2b02  movs    r2, r0
000d2b04  ldrb    r2, [r5, #2]
000d2b06  movs    r2, r0
000d2b08  adr     r7, #0xb8
000d2b0a  movs    r2, r0
000d2b0c  ldrb    r2, [r3, #2]
000d2b0e  movs    r2, r0
000d2b10  ldrb    r2, [r1, #2]
000d2b12  movs    r2, r0
000d2b14  cbz     r0, #0xd2b50
000d2b16  movs    r2, r0
000d2b18  ldr     r7, [sp, #0x58]
000d2b1a  movs    r2, r0
000d2b1c  ldrb    r0, [r2, #1]
000d2b1e  movs    r2, r0
000d2b20  ldrb    r6, [r2, #1]
000d2b22  movs    r2, r0
000d2b24  adr     r6, #0x368
000d2b26  movs    r2, r0
000d2b28  ldrb    r6, [r0, #1]
000d2b2a  movs    r2, r0
000d2b2c  lsrs    r0, r3, #2
000d2b2e  movs    r2, r0
000d2b30  adr     r2, #0x368
000d2b32  movs    r2, r0
000d2b34  adr     r2, #0x38
000d2b36  movs    r2, r0
