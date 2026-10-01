========================================================================
ZN6Mayhem4User11FillFromXMLEPvRKSs  0x000929d8  2920 bytes   Mayhem.mm
========================================================================

000929d8  push    {r4, r5, r6, r7, lr}
000929da  add     r7, sp, #0xc
000929dc  push.w  {r8, sl, fp}
000929e0  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
000929e4  sub     sp, #0x104
000929e6  ldr.w   r3, [pc, #0xabc]
000929ea  str     r0, [sp, #8]
000929ec  add     r0, sp, #0x98
000929ee  add     r3, pc ; -> 0x000f3438  0x0
000929f0  str     r1, [sp, #4]
000929f2  ldr     r3, [r3]
000929f4  str     r2, [sp]
000929f6  str     r7, [sp, #0xb8]
000929f8  str.w   sp, [sp, #0xc0]
000929fc  str     r3, [sp, #0xb0]
000929fe  ldr.w   r3, [pc, #0xaa8]
00092a02  add     r3, pc ; -> 0x000ee44e  GCC_except_table81
00092a04  str     r3, [sp, #0xb4]
00092a06  ldr.w   r3, [pc, #0xaa4]
00092a0a  add     r3, pc ; -> 0x00093246  
00092a0c  orr     r3, r3, #1
00092a10  str     r3, [sp, #0xbc]
00092a12  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00092a16  ldr.w   r3, [pc, #0xa98]
00092a1a  ldr     r0, [sp, #4]
00092a1c  mov.w   r2, #-1
00092a20  add     r3, pc ; -> 0x000fcfa0  
00092a22  str     r2, [sp, #0x9c]
00092a24  ldr     r3, [r3]
00092a26  mov     r1, r3
00092a28  str     r3, [sp, #0xc]
00092a2a  blx     #0xddbfc ; -> objc_msgSend
00092a2e  ldr.w   r3, [pc, #0xa84]
00092a32  ldr.w   r2, [pc, #0xa84]
00092a36  add     r3, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
00092a38  add     r2, pc ; -> 0x0017f1c4  
00092a3a  ldr     r3, [r3]
00092a3c  mov     r1, r3
00092a3e  str     r3, [sp, #0x10]
00092a40  blx     #0xddbfc ; -> objc_msgSend
00092a44  ldr.w   r3, [pc, #0xa74]
00092a48  movs    r2, #0
00092a4a  add     r3, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
00092a4c  ldr     r3, [r3]
00092a4e  mov     r1, r3
00092a50  str     r3, [sp, #0x14]
00092a52  blx     #0xddbfc ; -> objc_msgSend
00092a56  ldr     r1, [sp, #0xc]
00092a58  str     r0, [sp, #0x18]
00092a5a  ldr     r0, [sp, #4]
00092a5c  blx     #0xddbfc ; -> objc_msgSend
00092a60  ldr.w   r2, [pc, #0xa5c]
00092a64  ldr     r1, [sp, #0x10]
00092a66  add     r2, pc ; -> 0x0017f1d4  
00092a68  blx     #0xddbfc ; -> objc_msgSend
00092a6c  movs    r2, #0
00092a6e  ldr     r1, [sp, #0x14]
00092a70  blx     #0xddbfc ; -> objc_msgSend
00092a74  ldr     r1, [sp, #0xc]
00092a76  str     r0, [sp, #0x1c]
00092a78  ldr     r0, [sp, #4]
00092a7a  blx     #0xddbfc ; -> objc_msgSend
00092a7e  ldr.w   r2, [pc, #0xa44]
00092a82  ldr     r1, [sp, #0x10]
00092a84  add     r2, pc ; -> 0x0017f1e4  
00092a86  blx     #0xddbfc ; -> objc_msgSend
00092a8a  movs    r2, #0
00092a8c  ldr     r1, [sp, #0x14]
00092a8e  blx     #0xddbfc ; -> objc_msgSend
00092a92  ldr     r1, [sp, #0xc]
00092a94  str     r0, [sp, #0x20]
00092a96  ldr     r0, [sp, #4]
00092a98  blx     #0xddbfc ; -> objc_msgSend
00092a9c  ldr.w   r2, [pc, #0xa28]
00092aa0  ldr     r1, [sp, #0x10]
00092aa2  add     r2, pc ; -> 0x0017f1f4  
00092aa4  blx     #0xddbfc ; -> objc_msgSend
00092aa8  movs    r2, #0
00092aaa  ldr     r1, [sp, #0x14]
00092aac  blx     #0xddbfc ; -> objc_msgSend
00092ab0  ldr     r1, [sp, #0xc]
00092ab2  str     r0, [sp, #0x24]
00092ab4  ldr     r0, [sp, #4]
00092ab6  blx     #0xddbfc ; -> objc_msgSend
00092aba  ldr.w   r2, [pc, #0xa10]
00092abe  ldr     r1, [sp, #0x10]
00092ac0  add     r2, pc ; -> 0x0017f204  
00092ac2  blx     #0xddbfc ; -> objc_msgSend
00092ac6  movs    r2, #0
00092ac8  ldr     r1, [sp, #0x14]
00092aca  blx     #0xddbfc ; -> objc_msgSend
00092ace  ldr     r1, [sp, #0xc]
00092ad0  str     r0, [sp, #0x28]
00092ad2  ldr     r0, [sp, #4]
00092ad4  blx     #0xddbfc ; -> objc_msgSend
00092ad8  ldr.w   r2, [pc, #0x9f4]
00092adc  ldr     r1, [sp, #0x10]
00092ade  add     r2, pc ; -> 0x0017f214  
00092ae0  blx     #0xddbfc ; -> objc_msgSend
00092ae4  movs    r2, #0
00092ae6  ldr     r1, [sp, #0x14]
00092ae8  blx     #0xddbfc ; -> objc_msgSend
00092aec  ldr     r1, [sp, #0xc]
00092aee  str     r0, [sp, #0x2c]
00092af0  ldr     r0, [sp, #4]
00092af2  blx     #0xddbfc ; -> objc_msgSend
00092af6  ldr.w   r2, [pc, #0x9dc]
00092afa  ldr     r1, [sp, #0x10]
00092afc  add     r2, pc ; -> 0x0017f224  
00092afe  blx     #0xddbfc ; -> objc_msgSend
00092b02  movs    r2, #0
00092b04  ldr     r1, [sp, #0x14]
00092b06  blx     #0xddbfc ; -> objc_msgSend
00092b0a  ldr.w   r3, [pc, #0x9cc]
00092b0e  add     r3, pc ; -> 0x000fcc28  'tS\x0e'
00092b10  ldr     r3, [r3]
00092b12  mov     r1, r3
00092b14  str     r3, [sp, #0x34]
00092b16  str     r0, [sp, #0x30]
00092b18  ldr     r0, [sp, #0x18]
00092b1a  blx     #0xddbfc ; -> objc_msgSend
00092b1e  ldr     r1, [sp, #0x34]
00092b20  str     r0, [sp, #0x3c]
00092b22  ldr     r0, [sp, #0x1c]
00092b24  blx     #0xddbfc ; -> objc_msgSend
00092b28  ldr     r1, [sp, #0x34]
00092b2a  str     r0, [sp, #0x40]
00092b2c  ldr     r0, [sp, #0x20]
00092b2e  blx     #0xddbfc ; -> objc_msgSend
00092b32  ldr     r1, [sp, #0x34]
00092b34  str     r0, [sp, #0x44]
00092b36  ldr     r0, [sp, #0x24]
00092b38  blx     #0xddbfc ; -> objc_msgSend
00092b3c  ldr     r1, [sp, #0x34]
00092b3e  str     r0, [sp, #0x48]
00092b40  ldr     r0, [sp, #0x28]
00092b42  blx     #0xddbfc ; -> objc_msgSend
00092b46  ldr     r1, [sp, #0x34]
00092b48  str     r0, [sp, #0x4c]
00092b4a  ldr     r0, [sp, #0x2c]
00092b4c  blx     #0xddbfc ; -> objc_msgSend
00092b50  ldr     r1, [sp, #0x34]
00092b52  str     r0, [sp, #0x50]
00092b54  ldr     r0, [sp, #0x30]
00092b56  blx     #0xddbfc ; -> objc_msgSend
00092b5a  str     r0, [sp, #0x54]
00092b5c  movs    r0, #0x1c
00092b5e  blx     #0xdd5c0 ; -> Znwm
00092b62  ldr.w   r3, [pc, #0x978]
00092b66  add     r3, pc ; -> 0x000f3370  0x0
00092b68  ldr     r3, [r3]
00092b6a  str     r3, [sp, #0x78]
00092b6c  adds    r3, #0xc
00092b6e  str     r0, [sp, #0x58]
00092b70  str     r3, [r0]
00092b72  ldr     r4, [sp, #0x58]
00092b74  str     r3, [r4, #4]
00092b76  str     r3, [r4, #8]
00092b78  str     r3, [r4, #0xc]
00092b7a  str     r3, [r4, #0x10]
00092b7c  str     r3, [r4, #0x14]
00092b7e  str     r3, [r4, #0x18]
00092b80  ldr     r2, [sp, #0x3c]
00092b82  cmp     r2, #0
00092b84  beq.w   #0x92ece
00092b88  ldr.w   r3, [pc, #0x954]
00092b8c  ldr.w   r0, [pc, #0x954]
00092b90  ldr.w   r1, [pc, #0x954]
00092b94  add     r3, pc ; -> 0x000fcf68  
00092b96  add     r0, pc ; -> 0x000fdb5c  
00092b98  ldr     r3, [r3]
00092b9a  add     r1, pc ; -> 0x000fcf58  
00092b9c  ldr     r0, [r0]
00092b9e  ldr     r1, [r1]
00092ba0  str     r3, [sp, #0x38]
00092ba2  blx     #0xddbfc ; -> objc_msgSend
00092ba6  ldr     r1, [sp, #0x38]
00092ba8  mov     r2, r0
00092baa  ldr     r0, [sp, #0x3c]
00092bac  blx     #0xddbfc ; -> objc_msgSend
00092bb0  add     r2, sp, #0x100
00092bb2  movs    r3, #0xe
00092bb4  adds    r2, #3
00092bb6  str     r3, [sp, #0x9c]
00092bb8  mov     r1, r0
00092bba  add     r0, sp, #0xe4
00092bbc  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00092bc0  movs    r3, #0xd
00092bc2  ldr     r0, [sp, #0x58]
00092bc4  str     r3, [sp, #0x9c]
00092bc6  add     r1, sp, #0xe4
00092bc8  blx     #0xdd518 ; -> ZNSs6assignERKSs
00092bcc  ldr     r3, [sp, #0xe4]
00092bce  ldr     r4, [sp, #0x78]
00092bd0  sub.w   r0, r3, #0xc
00092bd4  cmp     r4, r0
00092bd6  bne.w   #0x92ede
00092bda  ldr     r3, [sp, #0x40]
00092bdc  cbz     r3, #0x92c38
00092bde  ldr.w   r3, [pc, #0x90c]
00092be2  ldr.w   r0, [pc, #0x90c]
00092be6  ldr.w   r1, [pc, #0x90c]
00092bea  add     r3, pc ; -> 0x000fcf68  
00092bec  add     r0, pc ; -> 0x000fdb5c  
00092bee  ldr     r3, [r3]
00092bf0  add     r1, pc ; -> 0x000fcf58  
00092bf2  ldr     r0, [r0]
00092bf4  ldr     r1, [r1]
00092bf6  str     r3, [sp, #0x80]
00092bf8  mov.w   r3, #-1
00092bfc  str     r3, [sp, #0x9c]
00092bfe  blx     #0xddbfc ; -> objc_msgSend
00092c02  ldr     r1, [sp, #0x80]
00092c04  mov     r2, r0
00092c06  ldr     r0, [sp, #0x40]
00092c08  blx     #0xddbfc ; -> objc_msgSend
00092c0c  movs    r3, #0xc
00092c0e  add.w   r2, sp, #0x102
00092c12  str     r3, [sp, #0x9c]
00092c14  mov     r1, r0
00092c16  add     r0, sp, #0xe0
00092c18  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00092c1c  ldr     r4, [sp, #0x58]
00092c1e  movs    r3, #0xb
00092c20  add     r1, sp, #0xe0
00092c22  adds    r0, r4, #4
00092c24  str     r3, [sp, #0x9c]
00092c26  blx     #0xdd518 ; -> ZNSs6assignERKSs
00092c2a  ldr     r3, [sp, #0xe0]
00092c2c  ldr     r2, [sp, #0x78]
00092c2e  sub.w   r0, r3, #0xc
00092c32  cmp     r2, r0
00092c34  bne.w   #0x93080
00092c38  ldr     r2, [sp, #0x44]
00092c3a  cbz     r2, #0x92c98
00092c3c  ldr.w   r3, [pc, #0x8b8]
00092c40  ldr.w   r0, [pc, #0x8b8]
00092c44  ldr.w   r1, [pc, #0x8b8]
00092c48  add     r3, pc ; -> 0x000fcf68  
00092c4a  add     r0, pc ; -> 0x000fdb5c  
00092c4c  ldr     r3, [r3]
00092c4e  add     r1, pc ; -> 0x000fcf58  
00092c50  ldr     r0, [r0]
00092c52  ldr     r1, [r1]
00092c54  str     r3, [sp, #0x84]
00092c56  mov.w   r3, #-1
00092c5a  str     r3, [sp, #0x9c]
00092c5c  blx     #0xddbfc ; -> objc_msgSend
00092c60  ldr     r1, [sp, #0x84]
00092c62  mov     r2, r0
00092c64  ldr     r0, [sp, #0x44]
00092c66  blx     #0xddbfc ; -> objc_msgSend
00092c6a  add     r2, sp, #0x100
00092c6c  movs    r3, #0xa
00092c6e  adds    r2, #1
00092c70  str     r3, [sp, #0x9c]
00092c72  mov     r1, r0
00092c74  add     r0, sp, #0xdc
00092c76  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00092c7a  ldr     r3, [sp, #0x58]
00092c7c  add     r1, sp, #0xdc
00092c7e  add.w   r0, r3, #8
00092c82  movs    r3, #9
00092c84  str     r3, [sp, #0x9c]
00092c86  blx     #0xdd518 ; -> ZNSs6assignERKSs
00092c8a  ldr     r3, [sp, #0xdc]
00092c8c  ldr     r4, [sp, #0x78]
00092c8e  sub.w   r0, r3, #0xc
00092c92  cmp     r4, r0
00092c94  bne.w   #0x930de
00092c98  ldr     r2, [sp, #0x48]
00092c9a  cbz     r2, #0x92cf6
00092c9c  ldr.w   r3, [pc, #0x864]
00092ca0  ldr.w   r0, [pc, #0x864]
00092ca4  ldr.w   r1, [pc, #0x864]
00092ca8  add     r3, pc ; -> 0x000fcf68  
00092caa  add     r0, pc ; -> 0x000fdb5c  
00092cac  ldr     r3, [r3]
00092cae  add     r1, pc ; -> 0x000fcf58  
00092cb0  ldr     r0, [r0]
00092cb2  ldr     r1, [r1]
00092cb4  str     r3, [sp, #0x88]
00092cb6  mov.w   r3, #-1
00092cba  str     r3, [sp, #0x9c]
00092cbc  blx     #0xddbfc ; -> objc_msgSend
00092cc0  ldr     r1, [sp, #0x88]
00092cc2  mov     r2, r0
00092cc4  ldr     r0, [sp, #0x48]
00092cc6  blx     #0xddbfc ; -> objc_msgSend
00092cca  movs    r3, #8
00092ccc  add     r2, sp, #0x100
00092cce  str     r3, [sp, #0x9c]
00092cd0  mov     r1, r0
00092cd2  add     r0, sp, #0xd8
00092cd4  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00092cd8  ldr     r3, [sp, #0x58]
00092cda  add     r1, sp, #0xd8
00092cdc  add.w   r0, r3, #0xc
00092ce0  movs    r3, #7
00092ce2  str     r3, [sp, #0x9c]
00092ce4  blx     #0xdd518 ; -> ZNSs6assignERKSs
00092ce8  ldr     r3, [sp, #0xd8]
00092cea  ldr     r4, [sp, #0x78]
00092cec  sub.w   r0, r3, #0xc
00092cf0  cmp     r4, r0
00092cf2  bne.w   #0x93138
00092cf6  ldr     r2, [sp, #0x4c]
00092cf8  cbz     r2, #0x92d56
00092cfa  ldr.w   r3, [pc, #0x814]
00092cfe  ldr.w   r0, [pc, #0x814]
00092d02  ldr.w   r1, [pc, #0x814]
00092d06  add     r3, pc ; -> 0x000fcf68  
00092d08  add     r0, pc ; -> 0x000fdb5c  
00092d0a  ldr     r3, [r3]
00092d0c  add     r1, pc ; -> 0x000fcf58  
00092d0e  ldr     r0, [r0]
00092d10  ldr     r1, [r1]
00092d12  str     r3, [sp, #0x8c]
00092d14  mov.w   r3, #-1
00092d18  str     r3, [sp, #0x9c]
00092d1a  blx     #0xddbfc ; -> objc_msgSend
00092d1e  ldr     r1, [sp, #0x8c]
00092d20  mov     r2, r0
00092d22  ldr     r0, [sp, #0x4c]
00092d24  blx     #0xddbfc ; -> objc_msgSend
00092d28  movs    r3, #6
00092d2a  add.w   r2, sp, #0xff
00092d2e  str     r3, [sp, #0x9c]
00092d30  mov     r1, r0
00092d32  add     r0, sp, #0xd4
00092d34  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00092d38  ldr     r3, [sp, #0x58]
00092d3a  add     r1, sp, #0xd4
00092d3c  add.w   r0, r3, #0x10
00092d40  movs    r3, #5
00092d42  str     r3, [sp, #0x9c]
00092d44  blx     #0xdd518 ; -> ZNSs6assignERKSs
00092d48  ldr     r3, [sp, #0xd4]
00092d4a  ldr     r4, [sp, #0x78]
00092d4c  sub.w   r0, r3, #0xc
00092d50  cmp     r4, r0
00092d52  bne.w   #0x9310c
00092d56  ldr     r2, [sp, #0x50]
00092d58  cbz     r2, #0x92db6
00092d5a  ldr.w   r3, [pc, #0x7c0]
00092d5e  ldr.w   r0, [pc, #0x7c0]
00092d62  ldr.w   r1, [pc, #0x7c0]
00092d66  add     r3, pc ; -> 0x000fcf68  
00092d68  add     r0, pc ; -> 0x000fdb5c  
00092d6a  ldr     r3, [r3]
00092d6c  add     r1, pc ; -> 0x000fcf58  
00092d6e  ldr     r0, [r0]
00092d70  ldr     r1, [r1]
00092d72  str     r3, [sp, #0x90]
00092d74  mov.w   r3, #-1
00092d78  str     r3, [sp, #0x9c]
00092d7a  blx     #0xddbfc ; -> objc_msgSend
00092d7e  ldr     r1, [sp, #0x90]
00092d80  mov     r2, r0
00092d82  ldr     r0, [sp, #0x50]
00092d84  blx     #0xddbfc ; -> objc_msgSend
00092d88  movs    r3, #4
00092d8a  add.w   r2, sp, #0xfe
00092d8e  str     r3, [sp, #0x9c]
00092d90  mov     r1, r0
00092d92  add     r0, sp, #0xd0
00092d94  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00092d98  ldr     r3, [sp, #0x58]
00092d9a  add     r1, sp, #0xd0
00092d9c  add.w   r0, r3, #0x14
00092da0  movs    r3, #3
00092da2  str     r3, [sp, #0x9c]
00092da4  blx     #0xdd518 ; -> ZNSs6assignERKSs
00092da8  ldr     r3, [sp, #0xd0]
00092daa  ldr     r4, [sp, #0x78]
00092dac  sub.w   r0, r3, #0xc
00092db0  cmp     r4, r0
00092db2  bne.w   #0x930ae
00092db6  ldr     r2, [sp, #0x54]
00092db8  cbz     r2, #0x92e14
00092dba  ldr.w   r3, [pc, #0x76c]
00092dbe  ldr.w   r0, [pc, #0x76c]
00092dc2  ldr.w   r1, [pc, #0x76c]
00092dc6  add     r3, pc ; -> 0x000fcf68  
00092dc8  add     r0, pc ; -> 0x000fdb5c  
00092dca  ldr     r3, [r3]
00092dcc  add     r1, pc ; -> 0x000fcf58  
00092dce  ldr     r0, [r0]
00092dd0  ldr     r1, [r1]
00092dd2  str     r3, [sp, #0x94]
00092dd4  mov.w   r3, #-1
00092dd8  str     r3, [sp, #0x9c]
00092dda  blx     #0xddbfc ; -> objc_msgSend
00092dde  ldr     r1, [sp, #0x94]
00092de0  mov     r2, r0
00092de2  ldr     r0, [sp, #0x54]
00092de4  blx     #0xddbfc ; -> objc_msgSend
00092de8  movs    r3, #2
00092dea  add.w   r2, sp, #0xfd
00092dee  str     r3, [sp, #0x9c]
00092df0  mov     r1, r0
00092df2  add     r0, sp, #0xcc
00092df4  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00092df8  ldr     r3, [sp, #0x58]
00092dfa  add     r1, sp, #0xcc
00092dfc  add.w   r0, r3, #0x18
00092e00  movs    r3, #1
00092e02  str     r3, [sp, #0x9c]
00092e04  blx     #0xdd518 ; -> ZNSs6assignERKSs
00092e08  ldr     r3, [sp, #0xcc]
00092e0a  ldr     r4, [sp, #0x78]
00092e0c  sub.w   r0, r3, #0xc
00092e10  cmp     r4, r0
00092e12  bne     #0x92f0c
00092e14  ldr.w   r0, [pc, #0x71c]
00092e18  ldr     r1, [sp, #0x58]
00092e1a  mov.w   r3, #-1
00092e1e  add     r0, pc ; -> 0x00379be4  ZN6Mayhem4User14s_userDatabaseE
00092e20  str     r3, [sp, #0x9c]
00092e22  bl      #0x8f3dc ; -> ZN6Mayhem12UserDatabase11GetUserInfoERKSs
00092e26  cmp     r0, #0
00092e28  beq     #0x92e9c
00092e2a  str     r0, [sp, #0x7c]
00092e2c  ldr     r3, [r0, #0x18]
00092e2e  ldr     r2, [sp, #0x78]
00092e30  sub.w   r0, r3, #0xc
00092e34  cmp     r2, r0
00092e36  bne.w   #0x92ff4
00092e3a  ldr     r2, [sp, #0x7c]
00092e3c  ldr     r4, [sp, #0x78]
00092e3e  ldr     r3, [r2, #0x14]
00092e40  sub.w   r0, r3, #0xc
00092e44  cmp     r4, r0
00092e46  bne.w   #0x92fc4
00092e4a  ldr     r2, [sp, #0x7c]
00092e4c  ldr     r4, [sp, #0x78]
00092e4e  ldr     r3, [r2, #0x10]
00092e50  sub.w   r0, r3, #0xc
00092e54  cmp     r4, r0
00092e56  bne.w   #0x92f96
00092e5a  ldr     r2, [sp, #0x7c]
00092e5c  ldr     r4, [sp, #0x78]
00092e5e  ldr     r3, [r2, #0xc]
00092e60  sub.w   r0, r3, #0xc
00092e64  cmp     r4, r0
00092e66  bne     #0x92f66
00092e68  ldr     r2, [sp, #0x7c]
00092e6a  ldr     r4, [sp, #0x78]
00092e6c  ldr     r3, [r2, #8]
00092e6e  sub.w   r0, r3, #0xc
00092e72  cmp     r4, r0
00092e74  bne.w   #0x93052
00092e78  ldr     r2, [sp, #0x7c]
00092e7a  ldr     r4, [sp, #0x78]
00092e7c  ldr     r3, [r2, #4]
00092e7e  sub.w   r0, r3, #0xc
00092e82  cmp     r4, r0
00092e84  bne.w   #0x93022
00092e88  ldr     r2, [sp, #0x7c]
00092e8a  ldr     r4, [sp, #0x78]
00092e8c  ldr     r3, [r2]
00092e8e  sub.w   r0, r3, #0xc
00092e92  cmp     r4, r0
00092e94  bne     #0x92f3a
00092e96  ldr     r0, [sp, #0x7c]
00092e98  blx     #0xdd5a8 ; -> ZdlPv
00092e9c  ldr     r1, [sp, #0x58]
00092e9e  ldr.w   r0, [pc, #0x698]
00092ea2  mov.w   r3, #-1
00092ea6  str     r3, [sp, #0x9c]
00092ea8  mov     r2, r1
00092eaa  add     r0, pc ; -> 0x00379be4  ZN6Mayhem4User14s_userDatabaseE
00092eac  bl      #0x8c1d8 ; -> ZN6Mayhem12UserDatabase11AddUserInfoERKSsPNS_8UserInfoE
00092eb0  ldr     r3, [sp, #0x58]
00092eb2  ldr     r2, [sp, #8]
00092eb4  add     r0, sp, #0x98
00092eb6  str     r3, [r2, #4]
00092eb8  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00092ebc  sub.w   sp, r7, #0x58
00092ec0  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00092ec4  sub.w   sp, r7, #0x18
00092ec8  pop.w   {r8, sl, fp}
00092ecc  pop     {r4, r5, r6, r7, pc}
00092ece  ldr     r0, [sp, #0x58]
00092ed0  ldr     r1, [sp]
00092ed2  mov.w   r2, #-1
00092ed6  str     r2, [sp, #0x9c]
00092ed8  blx     #0xdd518 ; -> ZNSs6assignERKSs
00092edc  b       #0x92bda
00092ede  subs    r2, r3, #4
00092ee0  ldr     r3, [r3, #-0x4]
00092ee4  subs    r1, r3, #1
00092ee6  dmb     ish
00092eea  mov     ip, r3
00092eec  ldrex   lr, [r2]
00092ef0  cmp     lr, r3
00092ef2  beq.w   #0x931e8
00092ef6  cmp     lr, ip
00092ef8  mov     r3, lr
00092efa  bne     #0x92ee4
00092efc  cmp.w   lr, #0
00092f00  bgt.w   #0x92bda
00092f04  add     r1, sp, #0xfc
00092f06  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00092f0a  b       #0x92bda
00092f0c  subs    r2, r3, #4
00092f0e  ldr     r3, [r3, #-0x4]
00092f12  subs    r1, r3, #1
00092f14  dmb     ish
00092f18  mov     ip, r3
00092f1a  ldrex   lr, [r2]
00092f1e  cmp     lr, r3
00092f20  beq.w   #0x931d8
00092f24  cmp     lr, ip
00092f26  mov     r3, lr
00092f28  bne     #0x92f12
00092f2a  cmp.w   lr, #0
00092f2e  bgt.w   #0x92e14
00092f32  add     r1, sp, #0xf0
00092f34  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00092f38  b       #0x92e14
00092f3a  subs    r2, r3, #4
00092f3c  ldr     r3, [r3, #-0x4]
00092f40  subs    r1, r3, #1
00092f42  dmb     ish
00092f46  mov     ip, r3
00092f48  ldrex   lr, [r2]
00092f4c  cmp     lr, r3
00092f4e  beq.w   #0x931c8
00092f52  cmp     lr, ip
00092f54  mov     r3, lr
00092f56  bne     #0x92f40
00092f58  cmp.w   lr, #0
00092f5c  bgt     #0x92e96
00092f5e  add     r1, sp, #0xe8
00092f60  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00092f64  b       #0x92e96
00092f66  subs    r2, r3, #4
00092f68  ldr     r3, [r3, #-0x4]
00092f6c  subs    r1, r3, #1
00092f6e  dmb     ish
00092f72  mov     ip, r3
00092f74  ldrex   lr, [r2]
00092f78  cmp     lr, r3
00092f7a  beq.w   #0x931b8
00092f7e  cmp     lr, ip
00092f80  mov     r3, lr
00092f82  bne     #0x92f6c
00092f84  cmp.w   lr, #0
00092f88  bgt.w   #0x92e68
00092f8c  add.w   r1, sp, #0xeb
00092f90  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00092f94  b       #0x92e68
00092f96  subs    r2, r3, #4
00092f98  ldr     r3, [r3, #-0x4]
00092f9c  subs    r1, r3, #1
00092f9e  dmb     ish
00092fa2  mov     ip, r3
00092fa4  ldrex   lr, [r2]
00092fa8  cmp     lr, r3
00092faa  beq.w   #0x931a8
00092fae  cmp     lr, ip
00092fb0  mov     r3, lr
00092fb2  bne     #0x92f9c
00092fb4  cmp.w   lr, #0
00092fb8  bgt.w   #0x92e5a
00092fbc  add     r1, sp, #0xec
00092fbe  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00092fc2  b       #0x92e5a
00092fc4  subs    r2, r3, #4
00092fc6  ldr     r3, [r3, #-0x4]
00092fca  subs    r1, r3, #1
00092fcc  dmb     ish
00092fd0  mov     ip, r3
00092fd2  ldrex   lr, [r2]
00092fd6  cmp     lr, r3
00092fd8  beq.w   #0x93198
00092fdc  cmp     lr, ip
00092fde  mov     r3, lr
00092fe0  bne     #0x92fca
00092fe2  cmp.w   lr, #0
00092fe6  bgt.w   #0x92e4a
00092fea  add.w   r1, sp, #0xed
00092fee  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00092ff2  b       #0x92e4a
00092ff4  subs    r2, r3, #4
00092ff6  ldr     r3, [r3, #-0x4]
00092ffa  subs    r1, r3, #1
00092ffc  dmb     ish
00093000  mov     ip, r3
00093002  ldrex   r4, [r2]
00093006  cmp     r4, r3
00093008  beq.w   #0x93186
0009300c  cmp     r4, ip
0009300e  mov     r3, r4
00093010  bne     #0x92ffa
00093012  cmp     r4, #0
00093014  bgt.w   #0x92e3a
00093018  add.w   r1, sp, #0xee
0009301c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00093020  b       #0x92e3a
00093022  subs    r2, r3, #4
00093024  ldr     r3, [r3, #-0x4]
00093028  subs    r1, r3, #1
0009302a  dmb     ish
0009302e  mov     ip, r3
00093030  ldrex   lr, [r2]
00093034  cmp     lr, r3
00093036  beq.w   #0x93176
0009303a  cmp     lr, ip
0009303c  mov     r3, lr
0009303e  bne     #0x93028
00093040  cmp.w   lr, #0
00093044  bgt.w   #0x92e88
00093048  add.w   r1, sp, #0xe9
0009304c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00093050  b       #0x92e88
00093052  subs    r2, r3, #4
00093054  ldr     r3, [r3, #-0x4]
00093058  subs    r1, r3, #1
0009305a  dmb     ish
0009305e  mov     ip, r3
00093060  ldrex   lr, [r2]
00093064  cmp     lr, r3
00093066  beq     #0x93166
00093068  cmp     lr, ip
0009306a  mov     r3, lr
0009306c  bne     #0x93058
0009306e  cmp.w   lr, #0
00093072  bgt.w   #0x92e78
00093076  add.w   r1, sp, #0xea
0009307a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009307e  b       #0x92e78
00093080  subs    r2, r3, #4
00093082  ldr     r3, [r3, #-0x4]
00093086  subs    r1, r3, #1
00093088  dmb     ish
0009308c  mov     ip, r3
0009308e  ldrex   r4, [r2]
00093092  cmp     r4, r3
00093094  beq.w   #0x93234
00093098  cmp     r4, ip
0009309a  mov     r3, r4
0009309c  bne     #0x93086
0009309e  cmp     r4, #0
000930a0  bgt.w   #0x92c38
000930a4  add.w   r1, sp, #0xfa
000930a8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000930ac  b       #0x92c38
000930ae  subs    r2, r3, #4
000930b0  ldr     r3, [r3, #-0x4]
000930b4  subs    r1, r3, #1
000930b6  dmb     ish
000930ba  mov     ip, r3
000930bc  ldrex   lr, [r2]
000930c0  cmp     lr, r3
000930c2  beq.w   #0x93224
000930c6  cmp     lr, ip
000930c8  mov     r3, lr
000930ca  bne     #0x930b4
000930cc  cmp.w   lr, #0
000930d0  bgt.w   #0x92db6
000930d4  add.w   r1, sp, #0xf2
000930d8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000930dc  b       #0x92db6
000930de  subs    r2, r3, #4
000930e0  ldr     r3, [r3, #-0x4]
000930e4  subs    r1, r3, #1
000930e6  dmb     ish
000930ea  mov     ip, r3
000930ec  ldrex   lr, [r2]
000930f0  cmp     lr, r3
000930f2  beq.w   #0x93214
000930f6  cmp     lr, ip
000930f8  mov     r3, lr
000930fa  bne     #0x930e4
000930fc  cmp.w   lr, #0
00093100  bgt.w   #0x92c98
00093104  add     r1, sp, #0xf8
00093106  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009310a  b       #0x92c98
0009310c  subs    r2, r3, #4
0009310e  ldr     r3, [r3, #-0x4]
00093112  subs    r1, r3, #1
00093114  dmb     ish
00093118  mov     ip, r3
0009311a  ldrex   lr, [r2]
0009311e  cmp     lr, r3
00093120  beq     #0x93206
00093122  cmp     lr, ip
00093124  mov     r3, lr
00093126  bne     #0x93112
00093128  cmp.w   lr, #0
0009312c  bgt.w   #0x92d56
00093130  add     r1, sp, #0xf4
00093132  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00093136  b       #0x92d56
00093138  subs    r2, r3, #4
0009313a  ldr     r3, [r3, #-0x4]
0009313e  subs    r1, r3, #1
00093140  dmb     ish
00093144  mov     ip, r3
00093146  ldrex   lr, [r2]
0009314a  cmp     lr, r3
0009314c  beq     #0x931f8
0009314e  cmp     lr, ip
00093150  mov     r3, lr
00093152  bne     #0x9313e
00093154  cmp.w   lr, #0
00093158  bgt.w   #0x92cf6
0009315c  add.w   r1, sp, #0xf6
00093160  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00093164  b       #0x92cf6
00093166  strex   r4, r1, [r2]
0009316a  cmp     r4, #0
0009316c  bne.w   #0x93060
00093170  dmb     ish
00093174  b       #0x93068
00093176  strex   r4, r1, [r2]
0009317a  cmp     r4, #0
0009317c  bne.w   #0x93030
00093180  dmb     ish
00093184  b       #0x9303a
00093186  strex   lr, r1, [r2]
0009318a  cmp.w   lr, #0
0009318e  bne.w   #0x93002
00093192  dmb     ish
00093196  b       #0x9300c
00093198  strex   r4, r1, [r2]
0009319c  cmp     r4, #0
0009319e  bne.w   #0x92fd2
000931a2  dmb     ish
000931a6  b       #0x92fdc
000931a8  strex   r4, r1, [r2]
000931ac  cmp     r4, #0
000931ae  bne.w   #0x92fa4
000931b2  dmb     ish
000931b6  b       #0x92fae
000931b8  strex   r4, r1, [r2]
000931bc  cmp     r4, #0
000931be  bne.w   #0x92f74
000931c2  dmb     ish
000931c6  b       #0x92f7e
000931c8  strex   r4, r1, [r2]
000931cc  cmp     r4, #0
000931ce  bne.w   #0x92f48
000931d2  dmb     ish
000931d6  b       #0x92f52
000931d8  strex   r4, r1, [r2]
000931dc  cmp     r4, #0
000931de  bne.w   #0x92f1a
000931e2  dmb     ish
000931e6  b       #0x92f24
000931e8  strex   r4, r1, [r2]
000931ec  cmp     r4, #0
000931ee  bne.w   #0x92eec
000931f2  dmb     ish
000931f6  b       #0x92ef6
000931f8  strex   r4, r1, [r2]
000931fc  cmp     r4, #0
000931fe  bne     #0x93146
00093200  dmb     ish
00093204  b       #0x9314e
00093206  strex   r4, r1, [r2]
0009320a  cmp     r4, #0
0009320c  bne     #0x9311a
0009320e  dmb     ish
00093212  b       #0x93122
00093214  strex   r4, r1, [r2]
00093218  cmp     r4, #0
0009321a  bne.w   #0x930ec
0009321e  dmb     ish
00093222  b       #0x930f6
00093224  strex   r4, r1, [r2]
00093228  cmp     r4, #0
0009322a  bne.w   #0x930bc
0009322e  dmb     ish
00093232  b       #0x930c6
00093234  strex   lr, r1, [r2]
00093238  cmp.w   lr, #0
0009323c  bne.w   #0x9308e
00093240  dmb     ish
00093244  b       #0x93098
00093246  ldr     r3, [sp, #0x9c]
00093248  ldr     r0, [sp, #0xa0]
0009324a  cmp     r3, #1
0009324c  beq     #0x93292
0009324e  cmp     r3, #2
00093250  beq.w   #0x9340c
00093254  cmp     r3, #3
00093256  beq     #0x93292
00093258  cmp     r3, #4
0009325a  beq.w   #0x933fa
0009325e  cmp     r3, #5
00093260  beq     #0x93292
00093262  cmp     r3, #6
00093264  beq     #0x93362
00093266  cmp     r3, #7
00093268  beq     #0x93292
0009326a  cmp     r3, #8
0009326c  beq     #0x93350
0009326e  cmp     r3, #9
00093270  beq     #0x93292
00093272  cmp     r3, #0xa
00093274  beq     #0x932da
00093276  cmp     r3, #0xb
00093278  beq     #0x93292
0009327a  cmp     r3, #0xc
0009327c  beq     #0x932c8
0009327e  cmp     r3, #0xd
00093280  beq     #0x93292
00093282  ldr     r3, [sp, #0xcc]
00093284  ldr     r2, [sp, #0x78]
00093286  str     r0, [sp, #0x74]
00093288  sub.w   r0, r3, #0xc
0009328c  cmp     r2, r0
0009328e  bne     #0x9329c
00093290  ldr     r0, [sp, #0x74]
00093292  mov.w   r3, #-1
00093296  str     r3, [sp, #0x9c]
00093298  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009329c  subs    r2, r3, #4
0009329e  ldr     r3, [r3, #-0x4]
000932a2  subs    r1, r3, #1
000932a4  dmb     ish
000932a8  mov     ip, r3
000932aa  ldrex   r4, [r2]
000932ae  cmp     r4, r3
000932b0  beq.w   #0x933d8
000932b4  cmp     r4, ip
000932b6  mov     r3, r4
000932b8  bne     #0x932a2
000932ba  cmp     r4, #0
000932bc  bgt     #0x93290
000932be  add.w   r1, sp, #0xef
000932c2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000932c6  b       #0x93290
000932c8  ldr     r3, [sp, #0xe4]
000932ca  ldr     r2, [sp, #0x78]
000932cc  str     r0, [sp, #0x5c]
000932ce  sub.w   r0, r3, #0xc
000932d2  cmp     r2, r0
000932d4  bne     #0x932ec
000932d6  ldr     r0, [sp, #0x5c]
000932d8  b       #0x93292
000932da  ldr     r3, [sp, #0xe0]
000932dc  ldr     r2, [sp, #0x78]
000932de  str     r0, [sp, #0x60]
000932e0  sub.w   r0, r3, #0xc
000932e4  cmp     r2, r0
000932e6  bne     #0x93316
000932e8  ldr     r0, [sp, #0x60]
000932ea  b       #0x93292
000932ec  subs    r2, r3, #4
000932ee  ldr     r3, [r3, #-0x4]
000932f2  subs    r1, r3, #1
000932f4  dmb     ish
000932f8  mov     ip, r3
000932fa  ldrex   r4, [r2]
000932fe  cmp     r4, r3
00093300  beq     #0x93340
00093302  cmp     r4, ip
00093304  mov     r3, r4
00093306  bne     #0x932f2
00093308  cmp     r4, #0
0009330a  bgt     #0x932d6
0009330c  add.w   r1, sp, #0xfb
00093310  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00093314  b       #0x932d6
00093316  subs    r2, r3, #4
00093318  ldr     r3, [r3, #-0x4]
0009331c  subs    r1, r3, #1
0009331e  dmb     ish
00093322  mov     ip, r3
00093324  ldrex   r4, [r2]
00093328  cmp     r4, r3
0009332a  beq     #0x933ea
0009332c  cmp     r4, ip
0009332e  mov     r3, r4
00093330  bne     #0x9331c
00093332  cmp     r4, #0
00093334  bgt     #0x932e8
00093336  add.w   r1, sp, #0xf9
0009333a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009333e  b       #0x932e8
00093340  strex   lr, r1, [r2]
00093344  cmp.w   lr, #0
00093348  bne     #0x932fa
0009334a  dmb     ish
0009334e  b       #0x93302
00093350  ldr     r3, [sp, #0xdc]
00093352  ldr     r2, [sp, #0x78]
00093354  str     r0, [sp, #0x64]
00093356  sub.w   r0, r3, #0xc
0009335a  cmp     r2, r0
0009335c  bne     #0x93374
0009335e  ldr     r0, [sp, #0x64]
00093360  b       #0x93292
00093362  ldr     r3, [sp, #0xd8]
00093364  ldr     r2, [sp, #0x78]
00093366  str     r0, [sp, #0x68]
00093368  sub.w   r0, r3, #0xc
0009336c  cmp     r2, r0
0009336e  bne     #0x9339e
00093370  ldr     r0, [sp, #0x68]
00093372  b       #0x93292
00093374  subs    r2, r3, #4
00093376  ldr     r3, [r3, #-0x4]
0009337a  subs    r1, r3, #1
0009337c  dmb     ish
00093380  mov     ip, r3
00093382  ldrex   r4, [r2]
00093386  cmp     r4, r3
00093388  beq     #0x933c8
0009338a  cmp     r4, ip
0009338c  mov     r3, r4
0009338e  bne     #0x9337a
00093390  cmp     r4, #0
00093392  bgt     #0x9335e
00093394  add.w   r1, sp, #0xf7
00093398  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009339c  b       #0x9335e
0009339e  subs    r2, r3, #4
000933a0  ldr     r3, [r3, #-0x4]
000933a4  subs    r1, r3, #1
000933a6  dmb     ish
000933aa  mov     ip, r3
000933ac  ldrex   r4, [r2]
000933b0  cmp     r4, r3
000933b2  beq     #0x93482
000933b4  cmp     r4, ip
000933b6  mov     r3, r4
000933b8  bne     #0x933a4
000933ba  cmp     r4, #0
000933bc  bgt     #0x93370
000933be  add.w   r1, sp, #0xf5
000933c2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000933c6  b       #0x93370
000933c8  strex   lr, r1, [r2]
000933cc  cmp.w   lr, #0
000933d0  bne     #0x93382
000933d2  dmb     ish
000933d6  b       #0x9338a
000933d8  strex   lr, r1, [r2]
000933dc  cmp.w   lr, #0
000933e0  bne.w   #0x932aa
000933e4  dmb     ish
000933e8  b       #0x932b4
000933ea  strex   lr, r1, [r2]
000933ee  cmp.w   lr, #0
000933f2  bne     #0x93324
000933f4  dmb     ish
000933f8  b       #0x9332c
000933fa  ldr     r3, [sp, #0xd4]
000933fc  ldr     r2, [sp, #0x78]
000933fe  str     r0, [sp, #0x6c]
00093400  sub.w   r0, r3, #0xc
00093404  cmp     r2, r0
00093406  bne     #0x9341e
00093408  ldr     r0, [sp, #0x6c]
0009340a  b       #0x93292
0009340c  ldr     r3, [sp, #0xd0]
0009340e  ldr     r2, [sp, #0x78]
00093410  str     r0, [sp, #0x70]
00093412  sub.w   r0, r3, #0xc
00093416  cmp     r2, r0
00093418  bne     #0x93448
0009341a  ldr     r0, [sp, #0x70]
0009341c  b       #0x93292
0009341e  subs    r2, r3, #4
00093420  ldr     r3, [r3, #-0x4]
00093424  subs    r1, r3, #1
00093426  dmb     ish
0009342a  mov     ip, r3
0009342c  ldrex   r4, [r2]
00093430  cmp     r4, r3
00093432  beq     #0x93472
00093434  cmp     r4, ip
00093436  mov     r3, r4
00093438  bne     #0x93424
0009343a  cmp     r4, #0
0009343c  bgt     #0x93408
0009343e  add.w   r1, sp, #0xf3
00093442  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00093446  b       #0x93408
00093448  subs    r2, r3, #4
0009344a  ldr     r3, [r3, #-0x4]
0009344e  subs    r1, r3, #1
00093450  dmb     ish
00093454  mov     ip, r3
00093456  ldrex   r4, [r2]
0009345a  cmp     r4, r3
0009345c  beq     #0x93492
0009345e  cmp     r4, ip
00093460  mov     r3, r4
00093462  bne     #0x9344e
00093464  cmp     r4, #0
00093466  bgt     #0x9341a
00093468  add.w   r1, sp, #0xf1
0009346c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00093470  b       #0x9341a
00093472  strex   lr, r1, [r2]
00093476  cmp.w   lr, #0
0009347a  bne     #0x9342c
0009347c  dmb     ish
00093480  b       #0x93434
00093482  strex   lr, r1, [r2]
00093486  cmp.w   lr, #0
0009348a  bne     #0x933ac
0009348c  dmb     ish
00093490  b       #0x933b4
00093492  strex   lr, r1, [r2]
00093496  cmp.w   lr, #0
0009349a  bne     #0x93456
0009349c  dmb     ish
000934a0  b       #0x9345e
000934a2  nop     
000934a4  lsrs    r6, r0, #9
000934a6  movs    r6, r0
000934a8  rev16   r0, r1
000934aa  movs    r5, r0
000934ac  lsrs    r0, r7, #0x20
000934ae  movs    r0, r0
000934b0  adr     r5, #0x1f0
000934b2  movs    r6, r0
000934b4  adr     r0, #0x268
000934b6  movs    r6, r0
000934b8  stm     r7!, {r3, r7}
000934ba  movs    r6, r1
000934bc  adr     r0, #0xb8
000934be  movs    r6, r0
000934c0  stm     r7!, {r1, r3, r5, r6}
000934c2  movs    r6, r1
000934c4  stm     r7!, {r2, r3, r4, r6}
000934c6  movs    r6, r1
000934c8  stm     r7!, {r1, r2, r3, r6}
000934ca  movs    r6, r1
000934cc  stm     r7!, {r6}
000934ce  movs    r6, r1
000934d0  stm     r7!, {r1, r4, r5}
000934d2  movs    r6, r1
000934d4  stm     r7!, {r2, r5}
000934d6  movs    r6, r1
000934d8  adr     r1, #0x58
000934da  movs    r6, r0
000934dc  lsrs    r6, r0, #0x20
000934de  movs    r6, r0
000934e0  adr     r3, #0x340
000934e2  movs    r6, r0
000934e4  add     r7, sp, #0x308
000934e6  movs    r6, r0
000934e8  adr     r3, #0x2e8
000934ea  movs    r6, r0
000934ec  adr     r3, #0x1e8
000934ee  movs    r6, r0
000934f0  add     r7, sp, #0x1b0
000934f2  movs    r6, r0
000934f4  adr     r3, #0x190
000934f6  movs    r6, r0
000934f8  adr     r3, #0x70
000934fa  movs    r6, r0
000934fc  add     r7, sp, #0x38
000934fe  movs    r6, r0
00093500  adr     r3, #0x18
00093502  movs    r6, r0
00093504  adr     r2, #0x2f0
00093506  movs    r6, r0
00093508  add     r6, sp, #0x2b8
0009350a  movs    r6, r0
0009350c  adr     r2, #0x298
0009350e  movs    r6, r0
00093510  adr     r2, #0x178
00093512  movs    r6, r0
00093514  add     r6, sp, #0x140
00093516  movs    r6, r0
00093518  adr     r2, #0x120
0009351a  movs    r6, r0
0009351c  adr     r1, #0x3f8
0009351e  movs    r6, r0
00093520  add     r5, sp, #0x3c0
00093522  movs    r6, r0
00093524  adr     r1, #0x3a0
00093526  movs    r6, r0
00093528  adr     r1, #0x278
0009352a  movs    r6, r0
0009352c  add     r5, sp, #0x240
0009352e  movs    r6, r0
00093530  adr     r1, #0x220
00093532  movs    r6, r0
00093534  ldr     r2, [r0, #0x5c]
00093536  movs    r6, r5
00093538  ldr     r6, [r6, #0x50]
0009353a  movs    r6, r5
0009353c  nop     
0009353e  nop     
