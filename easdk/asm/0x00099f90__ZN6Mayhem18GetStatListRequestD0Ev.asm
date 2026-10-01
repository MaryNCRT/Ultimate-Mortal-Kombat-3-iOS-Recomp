========================================================================
ZN6Mayhem18GetStatListRequestD0Ev  0x00099f90  1048 bytes   Mayhem.mm
========================================================================

00099f90  push    {r4, r5, r6, r7, lr}
00099f92  add     r7, sp, #0xc
00099f94  push.w  {r8, sl, fp}
00099f98  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00099f9c  sub     sp, #0x94
00099f9e  ldr     r3, [pc, #0x3e4]
00099fa0  str     r0, [sp, #4]
00099fa2  add     r0, sp, #0x58
00099fa4  add     r3, pc ; -> 0x000f3438  0x0
00099fa6  str     r7, [sp, #0x78]
00099fa8  ldr     r3, [r3]
00099faa  str.w   sp, [sp, #0x80]
00099fae  str     r3, [sp, #0x70]
00099fb0  ldr     r3, [pc, #0x3d4]
00099fb2  add     r3, pc ; -> 0x000ee5dc  GCC_except_table118
00099fb4  str     r3, [sp, #0x74]
00099fb6  ldr     r3, [pc, #0x3d4]
00099fb8  add     r3, pc ; -> 0x0009a18e  
00099fba  orr     r3, r3, #1
00099fbe  str     r3, [sp, #0x7c]
00099fc0  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00099fc4  ldr     r3, [pc, #0x3c8]
00099fc6  ldr     r2, [sp, #4]
00099fc8  add     r3, pc ; -> 0x0017da64  ZTVN6Mayhem18GetStatListRequestE
00099fca  adds    r3, #8
00099fcc  str     r3, [r2]
00099fce  ldr     r0, [sp, #4]
00099fd0  movs    r3, #3
00099fd2  str     r3, [sp, #0x5c]
00099fd4  bl      #0x8b6a8 ; -> ZN6Mayhem12MayhemThread4waitEv
00099fd8  ldr     r3, [sp, #4]
00099fda  ldr     r2, [r3, #0x7c]
00099fdc  ldr     r3, [pc, #0x3b4]
00099fde  sub.w   r0, r2, #0xc
00099fe2  add     r3, pc ; -> 0x000f3370  0x0
00099fe4  ldr     r3, [r3]
00099fe6  cmp     r0, r3
00099fe8  str     r3, [sp, #0x1c]
00099fea  bne     #0x9a0e0
00099fec  ldr     r3, [sp, #4]
00099fee  ldr     r2, [sp, #4]
00099ff0  ldr     r4, [sp, #4]
00099ff2  adds    r2, #0x68
00099ff4  str     r2, [sp, #0x2c]
00099ff6  ldr     r3, [r3, #0x68]
00099ff8  str     r3, [sp, #0x34]
00099ffa  ldr     r4, [r4, #0x6c]
00099ffc  cmp     r3, r4
00099ffe  str     r4, [sp, #0x30]
0009a000  beq     #0x9a01a
0009a002  ldr     r4, [sp, #0x34]
0009a004  ldr     r3, [r4]
0009a006  mov     r0, r4
0009a008  ldr     r2, [r3]
0009a00a  movs    r3, #1
0009a00c  str     r3, [sp, #0x5c]
0009a00e  blx     r2
0009a010  ldr     r2, [sp, #0x30]
0009a012  adds    r4, #8
0009a014  str     r4, [sp, #0x34]
0009a016  cmp     r2, r4
0009a018  bne     #0x9a002
0009a01a  ldr     r2, [sp, #0x2c]
0009a01c  ldr     r0, [r2]
0009a01e  cbz     r0, #0x9a024
0009a020  blx     #0xdd5a8 ; -> ZdlPv
0009a024  ldr     r4, [sp, #4]
0009a026  ldr     r3, [sp, #4]
0009a028  adds    r3, #0x5c
0009a02a  str     r3, [sp, #0x40]
0009a02c  ldr     r3, [r4, #0x5c]
0009a02e  ldr.w   lr, [r4, #0x60]
0009a032  cmp     r3, lr
0009a034  str.w   lr, [sp, #0x44]
0009a038  it      ne
0009a03a  strne   r3, [sp, #0x54]
0009a03c  beq     #0x9a058
0009a03e  ldr     r2, [sp, #0x54]
0009a040  ldr     r4, [sp, #0x1c]
0009a042  ldr     r3, [r2]
0009a044  sub.w   r0, r3, #0xc
0009a048  cmp     r4, r0
0009a04a  bne     #0x9a0a8
0009a04c  ldr     r2, [sp, #0x54]
0009a04e  ldr     r3, [sp, #0x44]
0009a050  adds    r2, #4
0009a052  cmp     r3, r2
0009a054  str     r2, [sp, #0x54]
0009a056  bne     #0x9a03e
0009a058  ldr     r4, [sp, #0x40]
0009a05a  ldr     r0, [r4]
0009a05c  cbz     r0, #0x9a062
0009a05e  blx     #0xdd5a8 ; -> ZdlPv
0009a062  ldr     r2, [sp, #4]
0009a064  ldr     r4, [sp, #0x1c]
0009a066  ldr     r3, [r2, #0x54]
0009a068  sub.w   r0, r3, #0xc
0009a06c  cmp     r4, r0
0009a06e  bne     #0x9a134
0009a070  ldr     r2, [sp, #4]
0009a072  ldr     r4, [sp, #0x1c]
0009a074  ldr     r3, [r2, #0x50]
0009a076  sub.w   r0, r3, #0xc
0009a07a  cmp     r4, r0
0009a07c  bne     #0x9a10c
0009a07e  ldr     r0, [sp, #4]
0009a080  mov.w   r3, #-1
0009a084  str     r3, [sp, #0x5c]
0009a086  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0009a08a  ldr     r0, [sp, #4]
0009a08c  blx     #0xdd5a8 ; -> ZdlPv
0009a090  add     r0, sp, #0x58
0009a092  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009a096  sub.w   sp, r7, #0x58
0009a09a  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009a09e  sub.w   sp, r7, #0x18
0009a0a2  pop.w   {r8, sl, fp}
0009a0a6  pop     {r4, r5, r6, r7, pc}
0009a0a8  subs    r2, r3, #4
0009a0aa  ldr     r3, [r3, #-0x4]
0009a0ae  subs    r1, r3, #1
0009a0b0  dmb     ish
0009a0b4  mov     ip, r3
0009a0b6  ldrex   lr, [r2]
0009a0ba  cmp     lr, r3
0009a0bc  beq     #0x9a0d2
0009a0be  cmp     lr, ip
0009a0c0  mov     r3, lr
0009a0c2  bne     #0x9a0ae
0009a0c4  cmp.w   lr, #0
0009a0c8  bgt     #0x9a04c
0009a0ca  add     r1, sp, #0x90
0009a0cc  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009a0d0  b       #0x9a04c
0009a0d2  strex   r4, r1, [r2]
0009a0d6  cmp     r4, #0
0009a0d8  bne     #0x9a0b6
0009a0da  dmb     ish
0009a0de  b       #0x9a0be
0009a0e0  ldr     r3, [r2, #-0x4]
0009a0e4  subs    r1, r2, #4
0009a0e6  subs    r2, r3, #1
0009a0e8  dmb     ish
0009a0ec  mov     ip, r3
0009a0ee  ldrex   r4, [r1]
0009a0f2  cmp     r4, r3
0009a0f4  beq     #0x9a17e
0009a0f6  cmp     r4, ip
0009a0f8  mov     r3, r4
0009a0fa  bne     #0x9a0e6
0009a0fc  cmp     r4, #0
0009a0fe  bgt.w   #0x99fec
0009a102  add.w   r1, sp, #0x92
0009a106  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009a10a  b       #0x99fec
0009a10c  subs    r2, r3, #4
0009a10e  ldr     r3, [r3, #-0x4]
0009a112  subs    r1, r3, #1
0009a114  dmb     ish
0009a118  mov     ip, r3
0009a11a  ldrex   r4, [r2]
0009a11e  cmp     r4, r3
0009a120  beq     #0x9a16e
0009a122  cmp     r4, ip
0009a124  mov     r3, r4
0009a126  bne     #0x9a112
0009a128  cmp     r4, #0
0009a12a  bgt     #0x9a07e
0009a12c  add     r1, sp, #0x8c
0009a12e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009a132  b       #0x9a07e
0009a134  subs    r2, r3, #4
0009a136  ldr     r3, [r3, #-0x4]
0009a13a  subs    r1, r3, #1
0009a13c  dmb     ish
0009a140  mov     ip, r3
0009a142  ldrex   r4, [r2]
0009a146  cmp     r4, r3
0009a148  beq     #0x9a15e
0009a14a  cmp     r4, ip
0009a14c  mov     r3, r4
0009a14e  bne     #0x9a13a
0009a150  cmp     r4, #0
0009a152  bgt     #0x9a070
0009a154  add.w   r1, sp, #0x8e
0009a158  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009a15c  b       #0x9a070
0009a15e  strex   lr, r1, [r2]
0009a162  cmp.w   lr, #0
0009a166  bne     #0x9a142
0009a168  dmb     ish
0009a16c  b       #0x9a14a
0009a16e  strex   lr, r1, [r2]
0009a172  cmp.w   lr, #0
0009a176  bne     #0x9a11a
0009a178  dmb     ish
0009a17c  b       #0x9a122
0009a17e  strex   lr, r2, [r1]
0009a182  cmp.w   lr, #0
0009a186  bne     #0x9a0ee
0009a188  dmb     ish
0009a18c  b       #0x9a0f6
0009a18e  ldr     r3, [sp, #0x5c]
0009a190  ldr     r4, [sp, #0x60]
0009a192  cmp     r3, #1
0009a194  str     r4, [sp]
0009a196  beq     #0x9a28a
0009a198  cmp     r3, #2
0009a19a  beq     #0x9a230
0009a19c  ldr     r3, [sp, #0x2c]
0009a19e  ldr     r0, [r3]
0009a1a0  cbz     r0, #0x9a1a6
0009a1a2  blx     #0xdd5a8 ; -> ZdlPv
0009a1a6  ldr     r4, [sp]
0009a1a8  ldr     r3, [sp, #4]
0009a1aa  ldr     r2, [sp, #4]
0009a1ac  str     r4, [sp, #0x10]
0009a1ae  adds    r2, #0x5c
0009a1b0  str     r2, [sp, #0x38]
0009a1b2  ldr     r2, [r3, #0x5c]
0009a1b4  ldr     r4, [r3, #0x60]
0009a1b6  cmp     r2, r4
0009a1b8  str     r4, [sp, #0x3c]
0009a1ba  beq     #0x9a1e0
0009a1bc  ldr     r3, [pc, #0x1d8]
0009a1be  str     r2, [sp, #0x50]
0009a1c0  add     r3, pc ; -> 0x000f3370  0x0
0009a1c2  ldr     r3, [r3]
0009a1c4  str     r3, [sp, #0x4c]
0009a1c6  ldr     r2, [sp, #0x50]
0009a1c8  ldr     r4, [sp, #0x4c]
0009a1ca  ldr     r3, [r2]
0009a1cc  sub.w   r0, r3, #0xc
0009a1d0  cmp     r0, r4
0009a1d2  bne     #0x9a2c0
0009a1d4  ldr     r2, [sp, #0x50]
0009a1d6  ldr     r3, [sp, #0x3c]
0009a1d8  adds    r2, #4
0009a1da  cmp     r3, r2
0009a1dc  str     r2, [sp, #0x50]
0009a1de  bne     #0x9a1c6
0009a1e0  ldr     r4, [sp, #0x38]
0009a1e2  ldr     r0, [r4]
0009a1e4  cbz     r0, #0x9a1ea
0009a1e6  blx     #0xdd5a8 ; -> ZdlPv
0009a1ea  ldr     r3, [sp, #4]
0009a1ec  ldr     r2, [sp, #0x10]
0009a1ee  str     r2, [sp, #0x14]
0009a1f0  ldr     r1, [r3, #0x54]
0009a1f2  ldr     r3, [pc, #0x1a8]
0009a1f4  sub.w   r0, r1, #0xc
0009a1f8  add     r3, pc ; -> 0x000f3370  0x0
0009a1fa  ldr     r3, [r3]
0009a1fc  cmp     r0, r3
0009a1fe  str     r3, [sp, #0x48]
0009a200  bne.w   #0x9a336
0009a204  ldr     r2, [sp, #0x14]
0009a206  ldr     r4, [sp, #4]
0009a208  str     r2, [sp, #0x18]
0009a20a  ldr     r3, [r4, #0x50]
0009a20c  ldr     r2, [sp, #0x48]
0009a20e  sub.w   r0, r3, #0xc
0009a212  cmp     r2, r0
0009a214  bne     #0x9a30a
0009a216  ldr     r2, [sp, #0x18]
0009a218  ldr     r0, [sp, #4]
0009a21a  movs    r3, #0
0009a21c  str     r3, [sp, #0x5c]
0009a21e  str     r2, [sp]
0009a220  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0009a224  ldr     r0, [sp]
0009a226  mov.w   r3, #-1
0009a22a  str     r3, [sp, #0x5c]
0009a22c  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009a230  ldr     r3, [sp]
0009a232  ldr     r4, [sp, #4]
0009a234  str     r3, [sp, #8]
0009a236  ldr.w   r3, [pc, #0x168]
0009a23a  ldr     r1, [r4, #0x7c]
0009a23c  add     r3, pc ; -> 0x000f3370  0x0
0009a23e  sub.w   r0, r1, #0xc
0009a242  ldr     r3, [r3]
0009a244  cmp     r0, r3
0009a246  bne     #0x9a294
0009a248  ldr     r2, [sp, #8]
0009a24a  ldr     r4, [sp, #4]
0009a24c  ldr     r3, [sp, #4]
0009a24e  str     r2, [sp, #0xc]
0009a250  adds    r3, #0x68
0009a252  ldr     r2, [sp, #4]
0009a254  str     r3, [sp, #0x20]
0009a256  ldr     r4, [r4, #0x68]
0009a258  str     r4, [sp, #0x28]
0009a25a  ldr     r2, [r2, #0x6c]
0009a25c  cmp     r4, r2
0009a25e  str     r2, [sp, #0x24]
0009a260  beq     #0x9a27a
0009a262  ldr     r4, [sp, #0x28]
0009a264  ldr     r3, [r4]
0009a266  mov     r0, r4
0009a268  ldr     r2, [r3]
0009a26a  movs    r3, #2
0009a26c  str     r3, [sp, #0x5c]
0009a26e  blx     r2
0009a270  ldr     r2, [sp, #0x24]
0009a272  adds    r4, #8
0009a274  str     r4, [sp, #0x28]
0009a276  cmp     r2, r4
0009a278  bne     #0x9a262
0009a27a  ldr     r3, [sp, #0x20]
0009a27c  ldr     r0, [r3]
0009a27e  cbz     r0, #0x9a284
0009a280  blx     #0xdd5a8 ; -> ZdlPv
0009a284  ldr     r4, [sp, #0xc]
0009a286  str     r4, [sp]
0009a288  b       #0x9a1a6
0009a28a  ldr     r2, [sp, #0x20]
0009a28c  ldr     r0, [r2]
0009a28e  cmp     r0, #0
0009a290  bne     #0x9a1a2
0009a292  b       #0x9a1a6
0009a294  ldr     r3, [r1, #-0x4]
0009a298  subs    r2, r1, #4
0009a29a  subs    r1, r3, #1
0009a29c  dmb     ish
0009a2a0  mov     ip, r3
0009a2a2  ldrex   lr, [r2]
0009a2a6  cmp     lr, r3
0009a2a8  beq     #0x9a2fc
0009a2aa  cmp     lr, ip
0009a2ac  mov     r3, lr
0009a2ae  bne     #0x9a29a
0009a2b0  cmp.w   lr, #0
0009a2b4  bgt     #0x9a248
0009a2b6  add.w   r1, sp, #0x93
0009a2ba  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009a2be  b       #0x9a248
0009a2c0  subs    r2, r3, #4
0009a2c2  ldr     r3, [r3, #-0x4]
0009a2c6  subs    r1, r3, #1
0009a2c8  dmb     ish
0009a2cc  mov     ip, r3
0009a2ce  ldrex   lr, [r2]
0009a2d2  cmp     lr, r3
0009a2d4  beq     #0x9a2ee
0009a2d6  cmp     lr, ip
0009a2d8  mov     r3, lr
0009a2da  bne     #0x9a2c6
0009a2dc  cmp.w   lr, #0
0009a2e0  bgt.w   #0x9a1d4
0009a2e4  add.w   r1, sp, #0x91
0009a2e8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009a2ec  b       #0x9a1d4
0009a2ee  strex   r4, r1, [r2]
0009a2f2  cmp     r4, #0
0009a2f4  bne     #0x9a2ce
0009a2f6  dmb     ish
0009a2fa  b       #0x9a2d6
0009a2fc  strex   r4, r1, [r2]
0009a300  cmp     r4, #0
0009a302  bne     #0x9a2a2
0009a304  dmb     ish
0009a308  b       #0x9a2aa
0009a30a  subs    r2, r3, #4
0009a30c  ldr     r3, [r3, #-0x4]
0009a310  subs    r1, r3, #1
0009a312  dmb     ish
0009a316  mov     ip, r3
0009a318  ldrex   r4, [r2]
0009a31c  cmp     r4, r3
0009a31e  beq     #0x9a362
0009a320  cmp     r4, ip
0009a322  mov     r3, r4
0009a324  bne     #0x9a310
0009a326  cmp     r4, #0
0009a328  bgt.w   #0x9a216
0009a32c  add.w   r1, sp, #0x8d
0009a330  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009a334  b       #0x9a216
0009a336  ldr     r3, [r1, #-0x4]
0009a33a  subs    r2, r1, #4
0009a33c  subs    r1, r3, #1
0009a33e  dmb     ish
0009a342  mov     ip, r3
0009a344  ldrex   r4, [r2]
0009a348  cmp     r4, r3
0009a34a  beq     #0x9a372
0009a34c  cmp     r4, ip
0009a34e  mov     r3, r4
0009a350  bne     #0x9a33c
0009a352  cmp     r4, #0
0009a354  bgt.w   #0x9a204
0009a358  add.w   r1, sp, #0x8f
0009a35c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009a360  b       #0x9a204
0009a362  strex   lr, r1, [r2]
0009a366  cmp.w   lr, #0
0009a36a  bne     #0x9a318
0009a36c  dmb     ish
0009a370  b       #0x9a320
0009a372  strex   lr, r1, [r2]
0009a376  cmp.w   lr, #0
0009a37a  bne     #0x9a344
0009a37c  dmb     ish
0009a380  b       #0x9a34c
0009a382  nop     
0009a384  str     r4, [sp, #0x240]
0009a386  movs    r5, r0
0009a388  mov     r6, r4
0009a38a  movs    r5, r0
0009a38c  lsls    r2, r2, #7
0009a38e  movs    r0, r0
0009a390  subs    r2, #0x98
0009a392  movs    r6, r1
0009a394  str     r3, [sp, #0x228]
0009a396  movs    r5, r0
0009a398  str     r1, [sp, #0x2b0]
0009a39a  movs    r5, r0
0009a39c  str     r1, [sp, #0x1d0]
0009a39e  movs    r5, r0
0009a3a0  str     r1, [sp, #0xc0]
0009a3a2  movs    r5, r0
0009a3a4  nop     
0009a3a6  nop     
