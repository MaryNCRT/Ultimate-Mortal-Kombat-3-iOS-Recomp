========================================================================
-[SBJsonBase addErrorWithCode  0x000d3a20  304 bytes   SBJsonBase.m
========================================================================

000d3a20  push    {r4, r5, r6, r7, lr}
000d3a22  add     r7, sp, #0xc
000d3a24  push.w  {r8, sl, fp}
000d3a28  sub     sp, #0xc
000d3a2a  mov     sl, r3
000d3a2c  ldr     r3, [pc, #0xd4]
000d3a2e  mov     fp, r2
000d3a30  mov     r6, r0
000d3a32  add     r3, pc ; -> 0x000faa08  OBJC_IVAR_$_SBJsonBase.errorTrace
000d3a34  ldr     r4, [r3]
000d3a36  ldr     r2, [r0, r4]
000d3a38  cbnz    r2, #0xd3a68
000d3a3a  ldr     r0, [pc, #0xcc]
000d3a3c  ldr     r1, [pc, #0xcc]
000d3a3e  add     r0, pc ; -> 0x000fdb70  
000d3a40  add     r1, pc ; -> 0x000fcfe8  
000d3a42  ldr     r0, [r0]
000d3a44  ldr     r1, [r1]
000d3a46  blx     #0xddbfc ; -> objc_msgSend
000d3a4a  ldr     r3, [pc, #0xc4]
000d3a4c  ldr     r1, [pc, #0xc4]
000d3a4e  mov     r2, sl
000d3a50  add     r3, pc ; -> 0x000f3430  0x0
000d3a52  add     r1, pc ; -> 0x000fcdec  '(5\x0e'
000d3a54  ldr     r3, [r3]
000d3a56  ldr     r1, [r1]
000d3a58  ldr     r3, [r3]
000d3a5a  str     r0, [r6, r4]
000d3a5c  ldr     r0, [pc, #0xb8]
000d3a5e  add     r0, pc ; -> 0x000fdb44  
000d3a60  ldr     r0, [r0]
000d3a62  blx     #0xddbfc ; -> objc_msgSend
000d3a66  b       #0xd3aa6
000d3a68  ldr     r1, [pc, #0xb0]
000d3a6a  ldr     r3, [pc, #0xb4]
000d3a6c  ldr     r0, [pc, #0xb4]
000d3a6e  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
000d3a70  add     r3, pc ; -> 0x000f3430  0x0
000d3a72  ldr     r5, [r1]
000d3a74  ldr     r1, [pc, #0xb0]
000d3a76  ldr     r3, [r3]
000d3a78  add     r0, pc ; -> 0x000fdb44  
000d3a7a  add     r1, pc ; -> 0x000fcf38  '\x12G\x0e'
000d3a7c  ldr.w   r8, [r0]
000d3a80  ldr     r1, [r1]
000d3a82  mov     r0, r2
000d3a84  ldr     r4, [r3]
000d3a86  blx     #0xddbfc ; -> objc_msgSend
000d3a8a  ldr     r3, [pc, #0xa0]
000d3a8c  mov     r1, r5
000d3a8e  mov     r2, sl
000d3a90  add     r3, pc ; -> 0x000f32d4  0x0
000d3a92  ldr     r3, [r3]
000d3a94  ldr     r3, [r3]
000d3a96  str     r3, [sp, #4]
000d3a98  movs    r3, #0
000d3a9a  str     r3, [sp, #8]
000d3a9c  mov     r3, r4
000d3a9e  str     r0, [sp]
000d3aa0  mov     r0, r8
000d3aa2  blx     #0xddbfc ; -> objc_msgSend
000d3aa6  mov     r3, r0
000d3aa8  ldr     r1, [pc, #0x84]
000d3aaa  ldr     r0, [pc, #0x88]
000d3aac  ldr     r2, [pc, #0x88]
000d3aae  add     r1, pc ; -> 0x000fce5c  
000d3ab0  add     r0, pc ; -> 0x000fdc04  
000d3ab2  add     r2, pc ; -> 0x0017d058  SBJSONErrorDomain
000d3ab4  ldr     r1, [r1]
000d3ab6  ldr     r2, [r2]
000d3ab8  ldr     r0, [r0]
000d3aba  str     r3, [sp]
000d3abc  mov     r3, fp
000d3abe  blx     #0xddbfc ; -> objc_msgSend
000d3ac2  ldr     r4, [pc, #0x78]
000d3ac4  ldr     r1, [pc, #0x78]
000d3ac6  add     r4, pc ; -> 0x001821e4  
000d3ac8  add     r1, pc ; -> 0x000fd8fc  '+\x17\x0f'
000d3aca  mov     r2, r4
000d3acc  ldr     r1, [r1]
000d3ace  mov     r5, r0
000d3ad0  mov     r0, r6
000d3ad2  blx     #0xddbfc ; -> objc_msgSend
000d3ad6  ldr     r3, [pc, #0x6c]
000d3ad8  ldr     r1, [pc, #0x6c]
000d3ada  mov     r2, r5
000d3adc  add     r3, pc ; -> 0x000faa08  OBJC_IVAR_$_SBJsonBase.errorTrace
000d3ade  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000d3ae0  ldr     r3, [r3]
000d3ae2  ldr     r1, [r1]
000d3ae4  ldr     r0, [r6, r3]
000d3ae6  blx     #0xddbfc ; -> objc_msgSend
000d3aea  ldr     r1, [pc, #0x60]
000d3aec  mov     r0, r6
000d3aee  mov     r2, r4
000d3af0  add     r1, pc ; -> 0x000fd8f8  '\x15\x17\x0f'
000d3af2  ldr     r1, [r1]
000d3af4  blx     #0xddbfc ; -> objc_msgSend
000d3af8  sub.w   sp, r7, #0x18
000d3afc  pop.w   {r8, sl, fp}
000d3b00  pop     {r4, r5, r6, r7, pc}
000d3b02  nop     
000d3b04  ldr     r2, [r2, #0x7c]
000d3b06  movs    r2, r0
000d3b08  adr     r1, #0xb8
000d3b0a  movs    r2, r0
000d3b0c  str     r5, [sp, #0x290]
000d3b0e  movs    r2, r0
