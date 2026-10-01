========================================================================
-[SBJsonParser scanRestOfArray  0x000d4b10  496 bytes   SBJsonParser.mm
========================================================================

000d4b10  push    {r4, r5, r6, r7, lr}
000d4b12  add     r7, sp, #0xc
000d4b14  push.w  {r8, sl, fp}
000d4b18  sub     sp, #0xc
000d4b1a  ldr     r3, [pc, #0x198]
000d4b1c  str     r2, [sp, #4]
000d4b1e  mov     r5, r0
000d4b20  add     r3, pc ; -> 0x000f32d8  OBJC_IVAR_$_SBJsonBase.maxDepth
000d4b22  ldr     r1, [r3]
000d4b24  ldr     r3, [r1]
000d4b26  ldr     r3, [r0, r3]
000d4b28  cmp     r3, #0
000d4b2a  beq.w   #0xd4c6a
000d4b2e  ldr     r3, [pc, #0x188]
000d4b30  add     r3, pc ; -> 0x000f32dc  OBJC_IVAR_$_SBJsonBase.depth
000d4b32  ldr     r3, [r3]
000d4b34  ldr     r3, [r3]
000d4b36  ldr     r2, [r0, r3]
000d4b38  adds    r2, #1
000d4b3a  str     r2, [r0, r3]
000d4b3c  ldr     r3, [r1]
000d4b3e  ldr     r3, [r0, r3]
000d4b40  cmp     r2, r3
000d4b42  bls.w   #0xd4c6a
000d4b46  ldr.w   r1, [pc, #0x174]
000d4b4a  ldr.w   r3, [pc, #0x174]
000d4b4e  movs    r2, #7
000d4b50  add     r1, pc ; -> 0x000fd91c  
000d4b52  add     r3, pc ; -> 0x00182244  
000d4b54  ldr     r1, [r1]
000d4b56  blx     #0xddbfc ; -> objc_msgSend
000d4b5a  movs    r0, #0
000d4b5c  b       #0xd4ca8
000d4b5e  ldr     r2, [r4]
000d4b60  ldr     r3, [r5, r2]
000d4b62  adds    r3, #1
000d4b64  str     r3, [r5, r2]
000d4b66  b       #0xd4b6a
000d4b68  ldr     r6, [pc, #0x158]
000d4b6a  mov     r4, r6
000d4b6c  add     r4, pc
000d4b6e  mov.w   r1, #0x4000
000d4b72  ldr     r3, [r4]
000d4b74  ldr     r3, [r5, r3]
000d4b76  ldrsb.w r0, [r3]
000d4b7a  bl      #0xd3f9c ; -> ZL8__istypeim
000d4b7e  cmp     r0, #0
000d4b80  bne     #0xd4b5e
000d4b82  ldr     r1, [r4]
000d4b84  ldr     r2, [r5, r1]
000d4b86  ldrsb.w r3, [r2]
000d4b8a  cmp     r3, #0x5d
000d4b8c  bne.w   #0xd4c96
000d4b90  adds    r3, r2, #1
000d4b92  cmp     r3, #1
000d4b94  str     r3, [r5, r1]
000d4b96  beq     #0xd4c96
000d4b98  ldr     r3, [pc, #0x12c]
000d4b9a  adds    r0, #1
000d4b9c  add     r3, pc ; -> 0x000f32dc  OBJC_IVAR_$_SBJsonBase.depth
000d4b9e  ldr     r3, [r3]
000d4ba0  ldr     r2, [r3]
000d4ba2  ldr     r3, [r5, r2]
000d4ba4  subs    r3, #1
000d4ba6  str     r3, [r5, r2]
000d4ba8  b       #0xd4ca8
000d4baa  ldr.w   r1, [pc, #0x120]
000d4bae  ldr     r3, [pc, #0x120]
000d4bb0  movs    r2, #3
000d4bb2  add     r1, pc ; -> 0x000fd91c  
000d4bb4  add     r3, pc ; -> 0x00182524  
000d4bb6  ldr     r1, [r1]
000d4bb8  mov     r0, r5
000d4bba  b       #0xd4c62
000d4bbc  ldr     r3, [sp, #4]
000d4bbe  mov     r1, sl
000d4bc0  ldr     r2, [sp, #8]
000d4bc2  ldr     r6, [pc, #0x110]
000d4bc4  ldr     r0, [r3]
000d4bc6  blx     #0xddbfc ; -> objc_msgSend
000d4bca  b       #0xd4bd4
000d4bcc  ldr     r2, [r4]
000d4bce  ldr     r3, [r5, r2]
000d4bd0  adds    r3, #1
000d4bd2  str     r3, [r5, r2]
000d4bd4  mov     r4, r6
000d4bd6  add     r4, pc
000d4bd8  mov.w   r1, #0x4000
000d4bdc  ldr     r3, [r4]
000d4bde  ldr     r3, [r5, r3]
000d4be0  ldrsb.w r0, [r3]
000d4be4  bl      #0xd3f9c ; -> ZL8__istypeim
000d4be8  cmp     r0, #0
000d4bea  bne     #0xd4bcc
000d4bec  ldr     r1, [r4]
000d4bee  ldr     r2, [r5, r1]
000d4bf0  ldrsb.w r3, [r2]
000d4bf4  cmp     r3, #0x2c
000d4bf6  bne     #0xd4c44
000d4bf8  adds    r3, r2, #1
000d4bfa  cmp     r3, #1
000d4bfc  str     r3, [r5, r1]
000d4bfe  beq     #0xd4c44
000d4c00  ldr.w   r8, [pc, #0xd4]
000d4c04  b       #0xd4c0e
000d4c06  ldr     r2, [r4]
000d4c08  ldr     r3, [r5, r2]
000d4c0a  adds    r3, #1
000d4c0c  str     r3, [r5, r2]
000d4c0e  mov     r4, r8
000d4c10  add     r4, pc
000d4c12  mov.w   r1, #0x4000
000d4c16  ldr     r3, [r4]
000d4c18  ldr     r3, [r5, r3]
000d4c1a  ldrsb.w r0, [r3]
000d4c1e  bl      #0xd3f9c ; -> ZL8__istypeim
000d4c22  mov     r6, r0
000d4c24  cmp     r0, #0
000d4c26  bne     #0xd4c06
000d4c28  ldr     r3, [r4]
000d4c2a  ldr     r3, [r5, r3]
000d4c2c  ldrsb.w r3, [r3]
000d4c30  cmp     r3, #0x5d
000d4c32  bne     #0xd4c44
000d4c34  ldr     r1, [pc, #0xa4]
000d4c36  ldr     r3, [pc, #0xa8]
000d4c38  movs    r2, #9
000d4c3a  add     r1, pc ; -> 0x000fd91c  
000d4c3c  add     r3, pc ; -> 0x00182534  
000d4c3e  ldr     r1, [r1]
000d4c40  mov     r0, r5
000d4c42  b       #0xd4c62
000d4c44  ldr     r3, [sp]
000d4c46  add     r3, pc
000d4c48  ldr     r3, [r3]
000d4c4a  ldr     r3, [r5, r3]
000d4c4c  ldrsb.w r6, [r3]
000d4c50  cmp     r6, #0
000d4c52  bne     #0xd4b68
000d4c54  ldr     r1, [pc, #0x8c]
000d4c56  ldr     r3, [pc, #0x90]
000d4c58  movs    r2, #0xb
000d4c5a  add     r1, pc ; -> 0x000fd91c  
000d4c5c  add     r3, pc ; -> 0x00182544  
000d4c5e  ldr     r1, [r1]
000d4c60  mov     r0, r5
000d4c62  blx     #0xddbfc ; -> objc_msgSend
000d4c66  mov     r0, r6
000d4c68  b       #0xd4ca8
000d4c6a  ldr     r0, [pc, #0x80]
000d4c6c  ldr     r1, [pc, #0x80]
000d4c6e  movs    r2, #8
000d4c70  add     r0, pc ; -> 0x000fdb70  
000d4c72  add     r1, pc ; -> 0x000fd944  
000d4c74  ldr     r0, [r0]
000d4c76  ldr     r1, [r1]
000d4c78  blx     #0xddbfc ; -> objc_msgSend
000d4c7c  ldr     r1, [pc, #0x74]
000d4c7e  ldr     r3, [sp, #4]
000d4c80  add     r1, pc ; -> 0x000fd968  '\x15\x19\x0f'
000d4c82  ldr.w   fp, [r1]
000d4c86  ldr     r1, [pc, #0x70]
000d4c88  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000d4c8a  ldr.w   sl, [r1]
000d4c8e  str     r0, [r3]
000d4c90  ldr     r3, [pc, #0x68]
000d4c92  str     r3, [sp]
000d4c94  b       #0xd4c44
000d4c96  mov     r0, r5
000d4c98  mov     r1, fp
000d4c9a  add     r2, sp, #8
000d4c9c  blx     #0xddbfc ; -> objc_msgSend
000d4ca0  uxtb    r6, r0
000d4ca2  cmp     r6, #0
000d4ca4  bne     #0xd4bbc
000d4ca6  b       #0xd4baa
000d4ca8  sub.w   sp, r7, #0x18
000d4cac  pop.w   {r8, sl, fp}
000d4cb0  pop     {r4, r5, r6, r7, pc}
000d4cb2  nop     
000d4cb4  b       #0xd4c20
000d4cb6  movs    r1, r0
000d4cb8  b       #0xd4c0c
000d4cba  movs    r1, r0
000d4cbc  ldrh    r0, [r1, #0x2e]
000d4cbe  movs    r2, r0
000d4cc0  bvs     #0xd4ca0
000d4cc2  movs    r2, r1
000d4cc4  ldrsh   r0, [r2, r7]
000d4cc6  movs    r2, r0
000d4cc8  b       #0xd4b44
000d4cca  movs    r1, r0
000d4ccc  ldrh    r6, [r4, #0x2a]
000d4cce  movs    r2, r0
000d4cd0  bls     #0xd4dac
000d4cd2  movs    r2, r1
000d4cd4  ldrsh   r6, [r4, r5]
000d4cd6  movs    r2, r0
000d4cd8  ldrsh   r4, [r5, r4]
000d4cda  movs    r2, r0
000d4cdc  ldrh    r6, [r3, #0x26]
000d4cde  movs    r2, r0
000d4ce0  bhi     #0xd4ccc
000d4ce2  movs    r2, r1
000d4ce4  ldrh    r6, [r7, #0x24]
000d4ce6  movs    r2, r0
000d4ce8  bhi     #0xd4cb4
000d4cea  movs    r2, r1
000d4cec  ldrh    r4, [r7, #0x36]
000d4cee  movs    r2, r0
000d4cf0  ldrh    r6, [r1, #0x26]
000d4cf2  movs    r2, r0
000d4cf4  ldrh    r4, [r4, #0x26]
000d4cf6  movs    r2, r0
000d4cf8  ldrb    r0, [r7, #0x17]
000d4cfa  movs    r2, r0
000d4cfc  ldrsh   r6, [r6, r3]
000d4cfe  movs    r2, r0
