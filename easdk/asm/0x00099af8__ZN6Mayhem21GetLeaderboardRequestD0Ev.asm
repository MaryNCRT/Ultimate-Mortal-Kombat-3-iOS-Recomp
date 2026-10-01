========================================================================
ZN6Mayhem21GetLeaderboardRequestD0Ev  0x00099af8  1176 bytes   Mayhem.mm
========================================================================

00099af8  push    {r4, r5, r6, r7, lr}
00099afa  add     r7, sp, #0xc
00099afc  push.w  {r8, sl, fp}
00099b00  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00099b04  sub     sp, #0xbc
00099b06  ldr.w   r3, [pc, #0x464]
00099b0a  str     r0, [sp, #4]
00099b0c  add     r0, sp, #0x7c
00099b0e  add     r3, pc ; -> 0x000f3438  0x0
00099b10  str     r7, [sp, #0x9c]
00099b12  ldr     r3, [r3]
00099b14  str.w   sp, [sp, #0xa4]
00099b18  str     r3, [sp, #0x94]
00099b1a  ldr.w   r3, [pc, #0x454]
00099b1e  add     r3, pc ; -> 0x000ee5ce  GCC_except_table117
00099b20  str     r3, [sp, #0x98]
00099b22  ldr.w   r3, [pc, #0x450]
00099b26  add     r3, pc ; -> 0x00099d38  
00099b28  orr     r3, r3, #1
00099b2c  str     r3, [sp, #0xa0]
00099b2e  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00099b32  ldr.w   r3, [pc, #0x444]
00099b36  ldr     r2, [sp, #4]
00099b38  add     r3, pc ; -> 0x0017da2c  ZTVN6Mayhem21GetLeaderboardRequestE
00099b3a  adds    r3, #8
00099b3c  str     r3, [r2]
00099b3e  ldr     r0, [sp, #4]
00099b40  movs    r3, #5
00099b42  str     r3, [sp, #0x80]
00099b44  bl      #0x8b6a8 ; -> ZN6Mayhem12MayhemThread4waitEv
00099b48  ldr     r3, [sp, #4]
00099b4a  ldr     r4, [sp, #4]
00099b4c  ldr     r3, [r3, #0x74]
00099b4e  str     r3, [sp, #0x6c]
00099b50  ldr     r2, [sp, #0x6c]
00099b52  ldr     r3, [r4, #0x70]
00099b54  cmp     r2, r3
00099b56  str     r3, [sp, #0xb0]
00099b58  str     r3, [sp, #0x68]
00099b5a  beq     #0x99b70
00099b5c  ldr     r3, [sp, #0x68]
00099b5e  ldr     r0, [r3], #4
00099b62  str     r3, [sp, #0x68]
00099b64  blx     #0xdd5a8 ; -> ZdlPv
00099b68  ldr     r4, [sp, #0x6c]
00099b6a  ldr     r2, [sp, #0x68]
00099b6c  cmp     r4, r2
00099b6e  bne     #0x99b5c
00099b70  ldr     r4, [sp, #4]
00099b72  ldr     r3, [r4, #0x70]
00099b74  ldr.w   r2, [r4, #0x9c]
00099b78  str     r3, [r4, #0x74]
00099b7a  ldr.w   r3, [pc, #0x400]
00099b7e  sub.w   r0, r2, #0xc
00099b82  add     r3, pc ; -> 0x000f3370  0x0
00099b84  ldr     r3, [r3]
00099b86  cmp     r0, r3
00099b88  str     r3, [sp, #0x24]
00099b8a  bne.w   #0x99cc2
00099b8e  ldr     r3, [sp, #4]
00099b90  ldr     r2, [sp, #4]
00099b92  ldr     r4, [sp, #4]
00099b94  adds    r2, #0x88
00099b96  str     r2, [sp, #0x34]
00099b98  ldr.w   r3, [r3, #0x88]
00099b9c  str     r3, [sp, #0x3c]
00099b9e  ldr.w   r4, [r4, #0x8c]
00099ba2  cmp     r3, r4
00099ba4  str     r4, [sp, #0x38]
00099ba6  beq     #0x99bc0
00099ba8  ldr     r4, [sp, #0x3c]
00099baa  ldr     r3, [r4]
00099bac  mov     r0, r4
00099bae  ldr     r2, [r3]
00099bb0  movs    r3, #3
00099bb2  str     r3, [sp, #0x80]
00099bb4  blx     r2
00099bb6  ldr     r2, [sp, #0x38]
00099bb8  adds    r4, #8
00099bba  str     r4, [sp, #0x3c]
00099bbc  cmp     r2, r4
00099bbe  bne     #0x99ba8
00099bc0  ldr     r3, [sp, #0x34]
00099bc2  ldr     r0, [r3]
00099bc4  cbz     r0, #0x99bca
00099bc6  blx     #0xdd5a8 ; -> ZdlPv
00099bca  ldr     r2, [sp, #4]
00099bcc  ldr     r4, [sp, #4]
00099bce  ldr     r3, [sp, #4]
00099bd0  adds    r4, #0x7c
00099bd2  str     r4, [sp, #0x4c]
00099bd4  ldr     r2, [r2, #0x7c]
00099bd6  str     r2, [sp, #0x54]
00099bd8  ldr.w   r3, [r3, #0x80]
00099bdc  cmp     r2, r3
00099bde  str     r3, [sp, #0x50]
00099be0  beq     #0x99bfa
00099be2  ldr     r4, [sp, #0x54]
00099be4  ldr     r3, [r4]
00099be6  mov     r0, r4
00099be8  ldr     r2, [r3]
00099bea  movs    r3, #1
00099bec  str     r3, [sp, #0x80]
00099bee  blx     r2
00099bf0  ldr     r2, [sp, #0x50]
00099bf2  adds    r4, #8
00099bf4  str     r4, [sp, #0x54]
00099bf6  cmp     r2, r4
00099bf8  bne     #0x99be2
00099bfa  ldr     r2, [sp, #0x4c]
00099bfc  ldr     r0, [r2]
00099bfe  cbz     r0, #0x99c04
00099c00  blx     #0xdd5a8 ; -> ZdlPv
00099c04  ldr     r3, [sp, #4]
00099c06  ldr     r0, [r3, #0x70]
00099c08  cbz     r0, #0x99c0e
00099c0a  blx     #0xdd5a8 ; -> ZdlPv
00099c0e  ldr     r4, [sp, #4]
00099c10  ldr     r0, [r4, #0x64]
00099c12  cbz     r0, #0x99c18
00099c14  blx     #0xdd5a8 ; -> ZdlPv
00099c18  ldr     r2, [sp, #4]
00099c1a  ldr     r4, [sp, #4]
00099c1c  adds    r4, #0x58
00099c1e  str     r4, [sp, #0x60]
00099c20  ldr     r3, [r2, #0x58]
00099c22  ldr     r4, [r2, #0x5c]
00099c24  cmp     r3, r4
00099c26  str     r4, [sp, #0x64]
00099c28  it      ne
00099c2a  strne   r3, [sp, #0x78]
00099c2c  beq     #0x99c48
00099c2e  ldr     r2, [sp, #0x78]
00099c30  ldr     r4, [sp, #0x24]
00099c32  ldr     r3, [r2]
00099c34  sub.w   r0, r3, #0xc
00099c38  cmp     r4, r0
00099c3a  bne     #0x99c8a
00099c3c  ldr     r2, [sp, #0x78]
00099c3e  ldr     r3, [sp, #0x64]
00099c40  adds    r2, #4
00099c42  cmp     r3, r2
00099c44  str     r2, [sp, #0x78]
00099c46  bne     #0x99c2e
00099c48  ldr     r4, [sp, #0x60]
00099c4a  ldr     r0, [r4]
00099c4c  cbz     r0, #0x99c52
00099c4e  blx     #0xdd5a8 ; -> ZdlPv
00099c52  ldr     r2, [sp, #4]
00099c54  ldr     r4, [sp, #0x24]
00099c56  ldr     r3, [r2, #0x50]
00099c58  sub.w   r0, r3, #0xc
00099c5c  cmp     r4, r0
00099c5e  bne     #0x99cee
00099c60  ldr     r0, [sp, #4]
00099c62  mov.w   r3, #-1
00099c66  str     r3, [sp, #0x80]
00099c68  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
00099c6c  ldr     r0, [sp, #4]
00099c6e  blx     #0xdd5a8 ; -> ZdlPv
00099c72  add     r0, sp, #0x7c
00099c74  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00099c78  sub.w   sp, r7, #0x58
00099c7c  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00099c80  sub.w   sp, r7, #0x18
00099c84  pop.w   {r8, sl, fp}
00099c88  pop     {r4, r5, r6, r7, pc}
00099c8a  subs    r2, r3, #4
00099c8c  ldr     r3, [r3, #-0x4]
00099c90  subs    r1, r3, #1
00099c92  dmb     ish
00099c96  mov     ip, r3
00099c98  ldrex   lr, [r2]
00099c9c  cmp     lr, r3
00099c9e  beq     #0x99cb4
00099ca0  cmp     lr, ip
00099ca2  mov     r3, lr
00099ca4  bne     #0x99c90
00099ca6  cmp.w   lr, #0
00099caa  bgt     #0x99c3c
00099cac  add     r1, sp, #0xb8
00099cae  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00099cb2  b       #0x99c3c
00099cb4  strex   r4, r1, [r2]
00099cb8  cmp     r4, #0
00099cba  bne     #0x99c98
00099cbc  dmb     ish
00099cc0  b       #0x99ca0
00099cc2  ldr     r3, [r2, #-0x4]
00099cc6  subs    r1, r2, #4
00099cc8  subs    r2, r3, #1
00099cca  dmb     ish
00099cce  mov     ip, r3
00099cd0  ldrex   r4, [r1]
00099cd4  cmp     r4, r3
00099cd6  beq     #0x99d28
00099cd8  cmp     r4, ip
00099cda  mov     r3, r4
00099cdc  bne     #0x99cc8
00099cde  cmp     r4, #0
00099ce0  bgt.w   #0x99b8e
00099ce4  add.w   r1, sp, #0xba
00099ce8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00099cec  b       #0x99b8e
00099cee  subs    r2, r3, #4
00099cf0  ldr     r3, [r3, #-0x4]
00099cf4  subs    r1, r3, #1
00099cf6  dmb     ish
00099cfa  mov     ip, r3
00099cfc  ldrex   r4, [r2]
00099d00  cmp     r4, r3
00099d02  beq     #0x99d18
00099d04  cmp     r4, ip
00099d06  mov     r3, r4
00099d08  bne     #0x99cf4
00099d0a  cmp     r4, #0
00099d0c  bgt     #0x99c60
00099d0e  add.w   r1, sp, #0xb6
00099d12  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00099d16  b       #0x99c60
00099d18  strex   lr, r1, [r2]
00099d1c  cmp.w   lr, #0
00099d20  bne     #0x99cfc
00099d22  dmb     ish
00099d26  b       #0x99d04
00099d28  strex   lr, r2, [r1]
00099d2c  cmp.w   lr, #0
00099d30  bne     #0x99cd0
00099d32  dmb     ish
00099d36  b       #0x99cd8
00099d38  ldr     r3, [sp, #0x80]
00099d3a  ldr     r4, [sp, #0x84]
00099d3c  cmp     r3, #1
00099d3e  str     r4, [sp]
00099d40  beq.w   #0x99ee8
00099d44  cmp     r3, #2
00099d46  beq.w   #0x99ede
00099d4a  cmp     r3, #3
00099d4c  beq.w   #0x99e56
00099d50  cmp     r3, #4
00099d52  beq     #0x99df6
00099d54  ldr     r4, [sp, #0x4c]
00099d56  ldr     r0, [r4]
00099d58  cbz     r0, #0x99d5e
00099d5a  blx     #0xdd5a8 ; -> ZdlPv
00099d5e  ldr     r2, [sp]
00099d60  ldr     r3, [sp, #4]
00099d62  str     r2, [sp, #0x14]
00099d64  ldr     r0, [r3, #0x70]
00099d66  cbz     r0, #0x99d6c
00099d68  blx     #0xdd5a8 ; -> ZdlPv
00099d6c  ldr     r2, [sp, #0x14]
00099d6e  ldr     r3, [sp, #4]
00099d70  str     r2, [sp, #0x18]
00099d72  ldr     r0, [r3, #0x64]
00099d74  cbz     r0, #0x99d7a
00099d76  blx     #0xdd5a8 ; -> ZdlPv
00099d7a  ldr     r2, [sp, #0x18]
00099d7c  ldr     r4, [sp, #4]
00099d7e  ldr     r3, [sp, #4]
00099d80  str     r2, [sp, #0x1c]
00099d82  adds    r3, #0x58
00099d84  str     r3, [sp, #0x58]
00099d86  ldr     r2, [r4, #0x58]
00099d88  ldr.w   lr, [r4, #0x5c]
00099d8c  cmp     r2, lr
00099d8e  str.w   lr, [sp, #0x5c]
00099d92  beq     #0x99dba
00099d94  ldr     r3, [pc, #0x1e8]
00099d96  str     r2, [sp, #0x74]
00099d98  add     r3, pc ; -> 0x000f3370  0x0
00099d9a  ldr     r3, [r3]
00099d9c  str     r3, [sp, #0x70]
00099d9e  ldr     r4, [sp, #0x74]
00099da0  ldr     r2, [sp, #0x70]
00099da2  ldr     r3, [r4]
00099da4  sub.w   r0, r3, #0xc
00099da8  cmp     r0, r2
00099daa  bne.w   #0x99ef4
00099dae  ldr     r2, [sp, #0x74]
00099db0  ldr     r3, [sp, #0x5c]
00099db2  adds    r2, #4
00099db4  cmp     r3, r2
00099db6  str     r2, [sp, #0x74]
00099db8  bne     #0x99d9e
00099dba  ldr     r4, [sp, #0x58]
00099dbc  ldr     r0, [r4]
00099dbe  cbz     r0, #0x99dc4
00099dc0  blx     #0xdd5a8 ; -> ZdlPv
00099dc4  ldr     r3, [sp, #4]
00099dc6  ldr     r2, [sp, #0x1c]
00099dc8  str     r2, [sp, #0x20]
00099dca  ldr     r1, [r3, #0x50]
00099dcc  ldr     r3, [pc, #0x1b4]
00099dce  sub.w   r0, r1, #0xc
00099dd2  add     r3, pc ; -> 0x000f3370  0x0
00099dd4  ldr     r3, [r3]
00099dd6  cmp     r0, r3
00099dd8  bne.w   #0x99f30
00099ddc  ldr     r2, [sp, #0x20]
00099dde  ldr     r0, [sp, #4]
00099de0  movs    r3, #0
00099de2  str     r3, [sp, #0x80]
00099de4  str     r2, [sp]
00099de6  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
00099dea  ldr     r0, [sp]
00099dec  mov.w   r3, #-1
00099df0  str     r3, [sp, #0x80]
00099df2  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00099df6  ldr     r3, [sp, #4]
00099df8  ldr     r2, [sp]
00099dfa  str     r2, [sp, #8]
00099dfc  ldr.w   r1, [r3, #0x9c]
00099e00  ldr.w   r3, [pc, #0x184]
00099e04  sub.w   r0, r1, #0xc
00099e08  add     r3, pc ; -> 0x000f3370  0x0
00099e0a  ldr     r3, [r3]
00099e0c  cmp     r0, r3
00099e0e  bne     #0x99ea4
00099e10  ldr     r2, [sp, #8]
00099e12  ldr     r4, [sp, #4]
00099e14  ldr     r3, [sp, #4]
00099e16  str     r2, [sp, #0xc]
00099e18  adds    r3, #0x88
00099e1a  ldr     r2, [sp, #4]
00099e1c  str     r3, [sp, #0x28]
00099e1e  ldr.w   r4, [r4, #0x88]
00099e22  str     r4, [sp, #0x30]
00099e24  ldr.w   r2, [r2, #0x8c]
00099e28  cmp     r4, r2
00099e2a  str     r2, [sp, #0x2c]
00099e2c  beq     #0x99e46
00099e2e  ldr     r4, [sp, #0x30]
00099e30  ldr     r3, [r4]
00099e32  mov     r0, r4
00099e34  ldr     r2, [r3]
00099e36  movs    r3, #4
00099e38  str     r3, [sp, #0x80]
00099e3a  blx     r2
00099e3c  ldr     r2, [sp, #0x2c]
00099e3e  adds    r4, #8
00099e40  str     r4, [sp, #0x30]
00099e42  cmp     r2, r4
00099e44  bne     #0x99e2e
00099e46  ldr     r3, [sp, #0x28]
00099e48  ldr     r0, [r3]
00099e4a  cbz     r0, #0x99e50
00099e4c  blx     #0xdd5a8 ; -> ZdlPv
00099e50  ldr     r4, [sp, #0xc]
00099e52  str     r4, [sp]
00099e54  b       #0x99e60
00099e56  ldr     r2, [sp, #0x28]
00099e58  ldr     r0, [r2]
00099e5a  cbz     r0, #0x99e60
00099e5c  blx     #0xdd5a8 ; -> ZdlPv
00099e60  ldr     r2, [sp]
00099e62  ldr     r4, [sp, #4]
00099e64  ldr     r3, [sp, #4]
00099e66  str     r2, [sp, #0x10]
00099e68  adds    r3, #0x7c
00099e6a  ldr     r2, [sp, #4]
00099e6c  str     r3, [sp, #0x40]
00099e6e  ldr     r4, [r4, #0x7c]
00099e70  str     r4, [sp, #0x48]
00099e72  ldr.w   r2, [r2, #0x80]
00099e76  cmp     r4, r2
00099e78  str     r2, [sp, #0x44]
00099e7a  beq     #0x99e94
00099e7c  ldr     r4, [sp, #0x48]
00099e7e  ldr     r3, [r4]
00099e80  mov     r0, r4
00099e82  ldr     r2, [r3]
00099e84  movs    r3, #2
00099e86  str     r3, [sp, #0x80]
00099e88  blx     r2
00099e8a  ldr     r2, [sp, #0x44]
00099e8c  adds    r4, #8
00099e8e  str     r4, [sp, #0x48]
00099e90  cmp     r2, r4
00099e92  bne     #0x99e7c
00099e94  ldr     r3, [sp, #0x40]
00099e96  ldr     r0, [r3]
00099e98  cbz     r0, #0x99e9e
00099e9a  blx     #0xdd5a8 ; -> ZdlPv
00099e9e  ldr     r4, [sp, #0x10]
00099ea0  str     r4, [sp]
00099ea2  b       #0x99d5e
00099ea4  ldr     r3, [r1, #-0x4]
00099ea8  subs    r2, r1, #4
00099eaa  subs    r1, r3, #1
00099eac  dmb     ish
00099eb0  mov     ip, r3
00099eb2  ldrex   r4, [r2]
00099eb6  cmp     r4, r3
00099eb8  beq     #0x99ece
00099eba  cmp     r4, ip
00099ebc  mov     r3, r4
00099ebe  bne     #0x99eaa
00099ec0  cmp     r4, #0
00099ec2  bgt     #0x99e10
00099ec4  add.w   r1, sp, #0xbb
00099ec8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00099ecc  b       #0x99e10
00099ece  strex   lr, r1, [r2]
00099ed2  cmp.w   lr, #0
00099ed6  bne     #0x99eb2
00099ed8  dmb     ish
00099edc  b       #0x99eba
00099ede  ldr     r4, [sp, #0x34]
00099ee0  ldr     r0, [r4]
00099ee2  cmp     r0, #0
00099ee4  bne     #0x99e5c
00099ee6  b       #0x99e60
00099ee8  ldr     r2, [sp, #0x40]
00099eea  ldr     r0, [r2]
00099eec  cmp     r0, #0
00099eee  bne.w   #0x99d5a
00099ef2  b       #0x99d5e
00099ef4  subs    r2, r3, #4
00099ef6  ldr     r3, [r3, #-0x4]
00099efa  subs    r1, r3, #1
00099efc  dmb     ish
00099f00  mov     ip, r3
00099f02  ldrex   r4, [r2]
00099f06  cmp     r4, r3
00099f08  beq     #0x99f20
00099f0a  cmp     r4, ip
00099f0c  mov     r3, r4
00099f0e  bne     #0x99efa
00099f10  cmp     r4, #0
00099f12  bgt.w   #0x99dae
00099f16  add.w   r1, sp, #0xb9
00099f1a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00099f1e  b       #0x99dae
00099f20  strex   lr, r1, [r2]
00099f24  cmp.w   lr, #0
00099f28  bne     #0x99f02
00099f2a  dmb     ish
00099f2e  b       #0x99f0a
00099f30  ldr     r3, [r1, #-0x4]
00099f34  subs    r2, r1, #4
00099f36  subs    r1, r3, #1
00099f38  dmb     ish
00099f3c  mov     ip, r3
00099f3e  ldrex   r4, [r2]
00099f42  cmp     r4, r3
00099f44  beq     #0x99f5c
00099f46  cmp     r4, ip
00099f48  mov     r3, r4
00099f4a  bne     #0x99f36
00099f4c  cmp     r4, #0
00099f4e  bgt.w   #0x99ddc
00099f52  add.w   r1, sp, #0xb7
00099f56  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00099f5a  b       #0x99ddc
00099f5c  strex   lr, r1, [r2]
00099f60  cmp.w   lr, #0
00099f64  bne     #0x99f3e
00099f66  dmb     ish
00099f6a  b       #0x99f46
00099f6c  ldr     r1, [sp, #0x98]
00099f6e  movs    r5, r0
00099f70  ldr     r2, [pc, #0x2b0]
00099f72  movs    r5, r0
00099f74  lsls    r6, r1, #8
00099f76  movs    r0, r0
00099f78  subs    r6, #0xf0
00099f7a  movs    r6, r1
00099f7c  str     r7, [sp, #0x3a8]
00099f7e  movs    r5, r0
00099f80  str     r5, [sp, #0x350]
00099f82  movs    r5, r0
00099f84  str     r5, [sp, #0x268]
00099f86  movs    r5, r0
00099f88  str     r5, [sp, #0x190]
00099f8a  movs    r5, r0
00099f8c  nop     
00099f8e  nop     
