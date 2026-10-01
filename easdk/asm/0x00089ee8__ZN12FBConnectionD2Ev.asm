========================================================================
ZN12FBConnectionD2Ev  0x00089ee8  856 bytes   FBConnection.mm
========================================================================

00089ee8  push    {r4, r5, r6, r7, lr}
00089eea  add     r7, sp, #0xc
00089eec  push.w  {r8, sl, fp}
00089ef0  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00089ef4  sub     sp, #0x78
00089ef6  ldr     r3, [pc, #0x324]
00089ef8  str     r0, [sp]
00089efa  add     r0, sp, #0x3c
00089efc  add     r3, pc ; -> 0x000f301c  0x0
00089efe  str     r7, [sp, #0x5c]
00089f00  ldr     r3, [r3]
00089f02  str.w   sp, [sp, #0x64]
00089f06  str     r3, [sp, #0x54]
00089f08  ldr     r3, [pc, #0x314]
00089f0a  add     r3, pc ; -> 0x000ee1c6  GCC_except_table6
00089f0c  str     r3, [sp, #0x58]
00089f0e  ldr     r3, [pc, #0x314]
00089f10  add     r3, pc ; -> 0x0008a0a8  
00089f12  orr     r3, r3, #1
00089f16  str     r3, [sp, #0x60]
00089f18  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00089f1c  ldr     r1, [pc, #0x308]
00089f1e  ldr     r2, [sp]
00089f20  ldr     r3, [pc, #0x308]
00089f22  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
00089f24  add     r3, pc ; -> 0x0017da0c  ZTV12FBConnection
00089f26  adds    r3, #8
00089f28  ldr     r0, [r2, #0x14]
00089f2a  str     r3, [r2]
00089f2c  ldr     r1, [r1]
00089f2e  movs    r3, #1
00089f30  str     r3, [sp, #0x40]
00089f32  blx     #0xddbfc ; -> objc_msgSend
00089f36  ldr     r3, [sp]
00089f38  ldr     r2, [sp]
00089f3a  adds    r2, #0x1c
00089f3c  str     r2, [sp, #0x1c]
00089f3e  ldr     r2, [r3, #0x1c]
00089f40  ldr     r4, [r3, #0x20]
00089f42  cmp     r2, r4
00089f44  str     r4, [sp, #0x20]
00089f46  beq     #0x89fba
00089f48  ldr     r3, [pc, #0x2e4]
00089f4a  str     r2, [sp, #0x34]
00089f4c  add     r3, pc ; -> 0x000f3370  0x0
00089f4e  ldr     r3, [r3]
00089f50  str     r3, [sp, #0x2c]
00089f52  ldr     r2, [sp, #0x34]
00089f54  ldr     r4, [sp, #0x2c]
00089f56  str     r2, [sp, #0x38]
00089f58  ldr     r3, [r2, #0xc]
00089f5a  sub.w   r0, r3, #0xc
00089f5e  cmp     r4, r0
00089f60  bne     #0x89fc4
00089f62  ldr     r2, [sp, #0x38]
00089f64  ldr     r4, [sp, #0x2c]
00089f66  ldr     r3, [r2, #8]
00089f68  sub.w   r0, r3, #0xc
00089f6c  cmp     r4, r0
00089f6e  bne     #0x89ff0
00089f70  ldr     r2, [sp, #0x34]
00089f72  ldr     r3, [sp, #0x20]
00089f74  adds    r2, #0x10
00089f76  cmp     r3, r2
00089f78  str     r2, [sp, #0x34]
00089f7a  bne     #0x89f52
00089f7c  ldr     r4, [sp, #0x1c]
00089f7e  ldr     r0, [r4]
00089f80  cbz     r0, #0x89f86
00089f82  blx     #0xdd5a8 ; -> ZdlPv
00089f86  ldr     r2, [sp]
00089f88  ldr     r4, [sp, #0x2c]
00089f8a  ldr     r3, [r2, #0x10]
00089f8c  sub.w   r0, r3, #0xc
00089f90  cmp     r4, r0
00089f92  bne     #0x8a05e
00089f94  ldr     r2, [sp]
00089f96  ldr     r4, [sp, #0x2c]
00089f98  ldr     r3, [r2, #0xc]
00089f9a  sub.w   r0, r3, #0xc
00089f9e  cmp     r4, r0
00089fa0  bne     #0x8a036
00089fa2  add     r0, sp, #0x3c
00089fa4  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00089fa8  sub.w   sp, r7, #0x58
00089fac  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00089fb0  sub.w   sp, r7, #0x18
00089fb4  pop.w   {r8, sl, fp}
00089fb8  pop     {r4, r5, r6, r7, pc}
00089fba  ldr     r3, [pc, #0x278]
00089fbc  add     r3, pc ; -> 0x000f3370  0x0
00089fbe  ldr     r3, [r3]
00089fc0  str     r3, [sp, #0x2c]
00089fc2  b       #0x89f7c
00089fc4  subs    r2, r3, #4
00089fc6  ldr     r3, [r3, #-0x4]
00089fca  subs    r1, r3, #1
00089fcc  dmb     ish
00089fd0  mov     ip, r3
00089fd2  ldrex   lr, [r2]
00089fd6  cmp     lr, r3
00089fd8  beq     #0x8a028
00089fda  cmp     lr, ip
00089fdc  mov     r3, lr
00089fde  bne     #0x89fca
00089fe0  cmp.w   lr, #0
00089fe4  bgt     #0x89f62
00089fe6  add.w   r1, sp, #0x75
00089fea  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089fee  b       #0x89f62
00089ff0  subs    r2, r3, #4
00089ff2  ldr     r3, [r3, #-0x4]
00089ff6  subs    r1, r3, #1
00089ff8  dmb     ish
00089ffc  mov     ip, r3
00089ffe  ldrex   lr, [r2]
0008a002  cmp     lr, r3
0008a004  beq     #0x8a01a
0008a006  cmp     lr, ip
0008a008  mov     r3, lr
0008a00a  bne     #0x89ff6
0008a00c  cmp.w   lr, #0
0008a010  bgt     #0x89f70
0008a012  add     r1, sp, #0x74
0008a014  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a018  b       #0x89f70
0008a01a  strex   r4, r1, [r2]
0008a01e  cmp     r4, #0
0008a020  bne     #0x89ffe
0008a022  dmb     ish
0008a026  b       #0x8a006
0008a028  strex   r4, r1, [r2]
0008a02c  cmp     r4, #0
0008a02e  bne     #0x89fd2
0008a030  dmb     ish
0008a034  b       #0x89fda
0008a036  subs    r2, r3, #4
0008a038  ldr     r3, [r3, #-0x4]
0008a03c  subs    r1, r3, #1
0008a03e  dmb     ish
0008a042  mov     ip, r3
0008a044  ldrex   r4, [r2]
0008a048  cmp     r4, r3
0008a04a  beq     #0x8a098
0008a04c  cmp     r4, ip
0008a04e  mov     r3, r4
0008a050  bne     #0x8a03c
0008a052  cmp     r4, #0
0008a054  bgt     #0x89fa2
0008a056  add     r1, sp, #0x70
0008a058  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a05c  b       #0x89fa2
0008a05e  subs    r2, r3, #4
0008a060  ldr     r3, [r3, #-0x4]
0008a064  subs    r1, r3, #1
0008a066  dmb     ish
0008a06a  mov     ip, r3
0008a06c  ldrex   r4, [r2]
0008a070  cmp     r4, r3
0008a072  beq     #0x8a088
0008a074  cmp     r4, ip
0008a076  mov     r3, r4
0008a078  bne     #0x8a064
0008a07a  cmp     r4, #0
0008a07c  bgt     #0x89f94
0008a07e  add.w   r1, sp, #0x72
0008a082  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a086  b       #0x89f94
0008a088  strex   lr, r1, [r2]
0008a08c  cmp.w   lr, #0
0008a090  bne     #0x8a06c
0008a092  dmb     ish
0008a096  b       #0x8a074
0008a098  strex   lr, r1, [r2]
0008a09c  cmp.w   lr, #0
0008a0a0  bne     #0x8a044
0008a0a2  dmb     ish
0008a0a6  b       #0x8a04c
0008a0a8  ldr     r3, [sp, #0x44]
0008a0aa  ldr     r4, [sp]
0008a0ac  str     r3, [sp, #4]
0008a0ae  ldr     r3, [sp]
0008a0b0  adds    r4, #0x1c
0008a0b2  str     r4, [sp, #0x10]
0008a0b4  ldr     r2, [r3, #0x1c]
0008a0b6  ldr     r4, [r3, #0x20]
0008a0b8  cmp     r2, r4
0008a0ba  str     r4, [sp, #0x14]
0008a0bc  beq     #0x8a0f2
0008a0be  ldr     r3, [pc, #0x178]
0008a0c0  str     r2, [sp, #0x30]
0008a0c2  add     r3, pc ; -> 0x000f3370  0x0
0008a0c4  ldr     r3, [r3]
0008a0c6  str     r3, [sp, #0x28]
0008a0c8  ldr     r2, [sp, #0x30]
0008a0ca  ldr     r4, [sp, #0x28]
0008a0cc  str     r2, [sp, #0x18]
0008a0ce  ldr     r3, [r2, #0xc]
0008a0d0  sub.w   r0, r3, #0xc
0008a0d4  cmp     r0, r4
0008a0d6  bne     #0x8a15e
0008a0d8  ldr     r2, [sp, #0x18]
0008a0da  ldr     r4, [sp, #0x28]
0008a0dc  ldr     r3, [r2, #8]
0008a0de  sub.w   r0, r3, #0xc
0008a0e2  cmp     r0, r4
0008a0e4  bne     #0x8a132
0008a0e6  ldr     r2, [sp, #0x30]
0008a0e8  ldr     r3, [sp, #0x14]
0008a0ea  adds    r2, #0x10
0008a0ec  cmp     r3, r2
0008a0ee  str     r2, [sp, #0x30]
0008a0f0  bne     #0x8a0c8
0008a0f2  ldr     r4, [sp, #0x10]
0008a0f4  ldr     r0, [r4]
0008a0f6  cbz     r0, #0x8a0fc
0008a0f8  blx     #0xdd5a8 ; -> ZdlPv
0008a0fc  ldr     r3, [sp]
0008a0fe  ldr     r2, [sp, #4]
0008a100  str     r2, [sp, #8]
0008a102  ldr     r1, [r3, #0x10]
0008a104  ldr     r3, [pc, #0x134]
0008a106  sub.w   r0, r1, #0xc
0008a10a  add     r3, pc ; -> 0x000f3370  0x0
0008a10c  ldr     r3, [r3]
0008a10e  cmp     r0, r3
0008a110  str     r3, [sp, #0x24]
0008a112  bne     #0x8a1c2
0008a114  ldr     r2, [sp, #8]
0008a116  ldr     r4, [sp]
0008a118  str     r2, [sp, #0xc]
0008a11a  ldr     r3, [r4, #0xc]
0008a11c  ldr     r2, [sp, #0x24]
0008a11e  sub.w   r0, r3, #0xc
0008a122  cmp     r2, r0
0008a124  bne     #0x8a198
0008a126  ldr     r0, [sp, #0xc]
0008a128  mov.w   r3, #-1
0008a12c  str     r3, [sp, #0x40]
0008a12e  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008a132  subs    r2, r3, #4
0008a134  ldr     r3, [r3, #-0x4]
0008a138  subs    r1, r3, #1
0008a13a  dmb     ish
0008a13e  mov     ip, r3
0008a140  ldrex   lr, [r2]
0008a144  cmp     lr, r3
0008a146  beq     #0x8a18a
0008a148  cmp     lr, ip
0008a14a  mov     r3, lr
0008a14c  bne     #0x8a138
0008a14e  cmp.w   lr, #0
0008a152  bgt     #0x8a0e6
0008a154  add.w   r1, sp, #0x76
0008a158  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a15c  b       #0x8a0e6
0008a15e  subs    r2, r3, #4
0008a160  ldr     r3, [r3, #-0x4]
0008a164  subs    r1, r3, #1
0008a166  dmb     ish
0008a16a  mov     ip, r3
0008a16c  ldrex   lr, [r2]
0008a170  cmp     lr, r3
0008a172  beq     #0x8a1fc
0008a174  cmp     lr, ip
0008a176  mov     r3, lr
0008a178  bne     #0x8a164
0008a17a  cmp.w   lr, #0
0008a17e  bgt     #0x8a0d8
0008a180  add.w   r1, sp, #0x77
0008a184  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a188  b       #0x8a0d8
0008a18a  strex   r4, r1, [r2]
0008a18e  cmp     r4, #0
0008a190  bne     #0x8a140
0008a192  dmb     ish
0008a196  b       #0x8a148
0008a198  subs    r2, r3, #4
0008a19a  ldr     r3, [r3, #-0x4]
0008a19e  subs    r1, r3, #1
0008a1a0  dmb     ish
0008a1a4  mov     ip, r3
0008a1a6  ldrex   r4, [r2]
0008a1aa  cmp     r4, r3
0008a1ac  beq     #0x8a1ec
0008a1ae  cmp     r4, ip
0008a1b0  mov     r3, r4
0008a1b2  bne     #0x8a19e
0008a1b4  cmp     r4, #0
0008a1b6  bgt     #0x8a126
0008a1b8  add.w   r1, sp, #0x71
0008a1bc  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a1c0  b       #0x8a126
0008a1c2  ldr     r3, [r1, #-0x4]
0008a1c6  subs    r2, r1, #4
0008a1c8  subs    r1, r3, #1
0008a1ca  dmb     ish
0008a1ce  mov     ip, r3
0008a1d0  ldrex   r4, [r2]
0008a1d4  cmp     r4, r3
0008a1d6  beq     #0x8a20a
0008a1d8  cmp     r4, ip
0008a1da  mov     r3, r4
0008a1dc  bne     #0x8a1c8
0008a1de  cmp     r4, #0
0008a1e0  bgt     #0x8a114
0008a1e2  add.w   r1, sp, #0x73
0008a1e6  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a1ea  b       #0x8a114
0008a1ec  strex   lr, r1, [r2]
0008a1f0  cmp.w   lr, #0
0008a1f4  bne     #0x8a1a6
0008a1f6  dmb     ish
0008a1fa  b       #0x8a1ae
0008a1fc  strex   r4, r1, [r2]
0008a200  cmp     r4, #0
0008a202  bne     #0x8a16c
0008a204  dmb     ish
0008a208  b       #0x8a174
0008a20a  strex   lr, r1, [r2]
0008a20e  cmp.w   lr, #0
0008a212  bne     #0x8a1d0
0008a214  dmb     ish
0008a218  b       #0x8a1d8
0008a21a  nop     
0008a21c  str     r1, [sp, #0x70]
0008a21e  movs    r6, r0
0008a220  cmp     r0, r7
0008a222  movs    r6, r0
0008a224  lsls    r4, r2, #6
0008a226  movs    r0, r0
0008a228  cmp     r2, #0x56
0008a22a  movs    r7, r0
0008a22c  subs    r2, #0xe4
0008a22e  movs    r7, r1
0008a230  str     r4, [sp, #0x80]
0008a232  movs    r6, r0
0008a234  str     r3, [sp, #0x2c0]
0008a236  movs    r6, r0
0008a238  str     r2, [sp, #0x2a8]
0008a23a  movs    r6, r0
0008a23c  str     r2, [sp, #0x188]
0008a23e  movs    r6, r0
