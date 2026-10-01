========================================================================
ZN13LocaleManagerC2Ev  0x0009f080  1416 bytes   LocaleManager.mm
========================================================================

0009f080  push    {r4, r5, r6, r7, lr}
0009f082  add     r7, sp, #0xc
0009f084  push.w  {r8, sl, fp}
0009f088  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009f08c  sub     sp, #0xb4
0009f08e  ldr.w   r3, [pc, #0x53c]
0009f092  str     r0, [sp, #4]
0009f094  add     r0, sp, #0x80
0009f096  add     r3, pc ; -> 0x000f301c  0x0
0009f098  str     r7, [sp, #0xa0]
0009f09a  ldr     r3, [r3]
0009f09c  str.w   sp, [sp, #0xa8]
0009f0a0  str     r3, [sp, #0x98]
0009f0a2  ldr.w   r3, [pc, #0x52c]
0009f0a6  add     r3, pc ; -> 0x000ee686  GCC_except_table22
0009f0a8  str     r3, [sp, #0x9c]
0009f0aa  ldr.w   r3, [pc, #0x528]
0009f0ae  add     r3, pc ; -> 0x0009f3e4  
0009f0b0  orr     r3, r3, #1
0009f0b4  str     r3, [sp, #0xa4]
0009f0b6  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009f0ba  ldr     r0, [sp, #4]
0009f0bc  ldr.w   r3, [pc, #0x518]
0009f0c0  add     r3, pc ; -> 0x0017df04  ZTV13LocaleManager
0009f0c2  adds    r3, #8
0009f0c4  str     r3, [r0], #4
0009f0c8  mov.w   r3, #-1
0009f0cc  str     r0, [sp, #0x64]
0009f0ce  str     r3, [sp, #0x84]
0009f0d0  bl      #0x9e29c ; -> ZN4midp6ObjectC2Ev
0009f0d4  ldr     r1, [sp, #4]
0009f0d6  ldr.w   r3, [pc, #0x504]
0009f0da  movs    r2, #0xa
0009f0dc  movs    r0, #0x28
0009f0de  add     r3, pc ; -> 0x0017df98  ZTVN4util8VectorSEIN4midp6StringEEE
0009f0e0  adds    r3, #8
0009f0e2  str     r3, [r1, #4]
0009f0e4  movs    r3, #0
0009f0e6  str     r2, [r1, #0xc]
0009f0e8  str     r3, [r1, #0x14]
0009f0ea  str     r3, [r1, #0x18]
0009f0ec  str     r2, [r1, #0x10]
0009f0ee  adds    r3, #3
0009f0f0  str     r3, [sp, #0x84]
0009f0f2  blx     #0xdd5b4 ; -> Znam
0009f0f6  ldr     r2, [sp, #4]
0009f0f8  str     r0, [r2, #0x18]
0009f0fa  cbz     r0, #0x9f122
0009f0fc  ldr     r3, [r2, #0x14]
0009f0fe  cmp     r3, #0
0009f100  ble     #0x9f11a
0009f102  movs    r0, #0
0009f104  mov     r2, r0
0009f106  ldr     r3, [sp, #4]
0009f108  adds    r0, #1
0009f10a  ldr     r1, [r3, #0x18]
0009f10c  ldr     r3, [r2]
0009f10e  str     r3, [r1, r2]
0009f110  ldr     r4, [sp, #4]
0009f112  adds    r2, #4
0009f114  ldr     r3, [r4, #0x14]
0009f116  cmp     r3, r0
0009f118  bgt     #0x9f106
0009f11a  movs    r0, #0
0009f11c  cbz     r0, #0x9f122
0009f11e  blx     #0xdd59c ; -> ZdaPv
0009f122  ldr     r2, [sp, #4]
0009f124  ldr     r1, [r2, #0x14]
0009f126  ldr     r3, [r2, #0x10]
0009f128  cmp     r1, r3
0009f12a  bge     #0x9f140
0009f12c  lsls    r3, r1, #2
0009f12e  ldr     r4, [sp, #4]
0009f130  movs    r2, #0
0009f132  adds    r1, #1
0009f134  ldr     r0, [r4, #0x18]
0009f136  str     r2, [r0, r3]
0009f138  ldr     r2, [r4, #0x10]
0009f13a  adds    r3, #4
0009f13c  cmp     r2, r1
0009f13e  bgt     #0x9f12e
0009f140  ldr     r0, [sp, #4]
0009f142  movs    r1, #0
0009f144  mov.w   r3, #-1
0009f148  str     r1, [r0, #0x1c]
0009f14a  str     r3, [r0, #0x20]
0009f14c  str     r1, [r0, #0x24]
0009f14e  str     r1, [r0, #0x28]
0009f150  str     r1, [r0, #0x2c]
0009f152  ldr     r2, [sp, #4]
0009f154  adds    r3, #0xb
0009f156  str     r3, [sp, #0x84]
0009f158  add.w   r0, r2, #0x30
0009f15c  bl      #0x9e29c ; -> ZN4midp6ObjectC2Ev
0009f160  ldr     r3, [sp, #4]
0009f162  movs    r4, #0
0009f164  str     r4, [r3, #0x38]
0009f166  str     r4, [r3, #0x3c]
0009f168  ldr     r0, [sp, #4]
0009f16a  ldr.w   r3, [pc, #0x474]
0009f16e  add     r3, pc ; -> 0x0017df1c  ZTVN4midp5arrayINS0_INS0_INS_23ReferenceCountedPointerINS_6StringEEEEEEEEE
0009f170  adds    r3, #8
0009f172  str     r3, [r0, #0x30]
0009f174  movs    r3, #9
0009f176  str     r3, [sp, #0x84]
0009f178  blx     #0xdd110 ; -> CFBundleGetMainBundle
0009f17c  blx     #0xdd104 ; -> CFBundleCopyBundleLocalizations
0009f180  str     r0, [sp, #0x18]
0009f182  blx     #0xdd0ec ; -> CFArrayGetCount
0009f186  cmp     r0, r4
0009f188  str     r0, [sp, #8]
0009f18a  ble     #0x9f222
0009f18c  str     r4, [sp, #0x1c]
0009f18e  movs    r3, #9
0009f190  ldr     r0, [sp, #0x18]
0009f192  str     r3, [sp, #0x84]
0009f194  ldr     r1, [sp, #0x1c]
0009f196  blx     #0xdd0f8 ; -> CFArrayGetValueAtIndex
0009f19a  str     r0, [sp, #0xc]
0009f19c  blx     #0xdd158 ; -> CFRetain
0009f1a0  movs    r0, #0x14
0009f1a2  blx     #0xdd5c0 ; -> Znwm
0009f1a6  movs    r3, #8
0009f1a8  str     r0, [sp, #0x10]
0009f1aa  str     r0, [sp, #0x74]
0009f1ac  str     r3, [sp, #0x84]
0009f1ae  ldr     r1, [sp, #0xc]
0009f1b0  bl      #0x9d9b8 ; -> ZN4midp6StringC1EPK10__CFString
0009f1b4  ldr     r1, [sp, #0x74]
0009f1b6  ldr     r2, [sp, #0x10]
0009f1b8  str     r1, [sp, #0x34]
0009f1ba  cbz     r2, #0x9f1c8
0009f1bc  ldr     r0, [sp, #0x74]
0009f1be  ldr     r3, [r0]
0009f1c0  ldr     r2, [r3, #0xc]
0009f1c2  movs    r3, #9
0009f1c4  str     r3, [sp, #0x84]
0009f1c6  blx     r2
0009f1c8  ldr     r4, [sp, #4]
0009f1ca  ldr     r3, [r4, #0x14]
0009f1cc  cmp     r3, #0
0009f1ce  ble     #0x9f2ca
0009f1d0  movs    r4, #0
0009f1d2  str     r4, [sp, #0x38]
0009f1d4  b       #0x9f1d8
0009f1d6  cbnz    r0, #0x9f1fe
0009f1d8  ldr     r0, [sp, #4]
0009f1da  ldr     r1, [sp, #0x38]
0009f1dc  ldr     r3, [r0, #0x18]
0009f1de  ldr.w   r0, [r3, r1, lsl #2]
0009f1e2  movs    r3, #7
0009f1e4  ldr     r1, [sp, #0x74]
0009f1e6  str     r3, [sp, #0x84]
0009f1e8  bl      #0x9dfe0 ; -> ZNK4midp6String6equalsEPS0_
0009f1ec  ldr     r2, [sp, #4]
0009f1ee  ldr     r1, [sp, #0x38]
0009f1f0  adds    r1, #1
0009f1f2  str     r1, [sp, #0x38]
0009f1f4  ldr     r3, [r2, #0x14]
0009f1f6  cmp     r3, r1
0009f1f8  bgt     #0x9f1d6
0009f1fa  cmp     r0, #0
0009f1fc  beq     #0x9f2ca
0009f1fe  ldr     r1, [sp, #0x10]
0009f200  cbz     r1, #0x9f216
0009f202  ldr     r2, [sp, #0x34]
0009f204  ldr     r0, [sp, #0x34]
0009f206  ldr     r3, [r2]
0009f208  ldr     r2, [r3, #8]
0009f20a  movs    r3, #9
0009f20c  str     r3, [sp, #0x84]
0009f20e  blx     r2
0009f210  cmp     r0, #0
0009f212  bne.w   #0x9f318
0009f216  ldr     r0, [sp, #0x1c]
0009f218  ldr     r1, [sp, #8]
0009f21a  adds    r0, #1
0009f21c  cmp     r0, r1
0009f21e  str     r0, [sp, #0x1c]
0009f220  bne     #0x9f18e
0009f222  movs    r3, #9
0009f224  ldr     r0, [sp, #0x18]
0009f226  str     r3, [sp, #0x84]
0009f228  blx     #0xdd14c ; -> CFRelease
0009f22c  ldr     r0, [sp, #4]
0009f22e  movs    r1, #0x10
0009f230  bl      #0x9e758 ; -> ZN13LocaleManager15setStringIdBitsEi
0009f234  movs    r0, #0x14
0009f236  blx     #0xdd5c0 ; -> Znwm
0009f23a  ldr     r1, [pc, #0x3a8]
0009f23c  movs    r3, #6
0009f23e  str     r0, [sp, #0x14]
0009f240  add     r1, pc ; -> 0x0017661c  'microedition.locale'
0009f242  str     r3, [sp, #0x84]
0009f244  bl      #0x9dd84 ; -> ZN4midp6StringC1EPKc
0009f248  movs    r3, #9
0009f24a  ldr     r0, [sp, #0x14]
0009f24c  str     r3, [sp, #0x84]
0009f24e  bl      #0x9d590 ; -> ZN4midp6System11getPropertyEPNS_6StringE
0009f252  str     r0, [sp, #0x48]
0009f254  str     r0, [sp, #0x6c]
0009f256  cbz     r0, #0x9f25e
0009f258  ldr     r3, [r0]
0009f25a  ldr     r3, [r3, #0xc]
0009f25c  blx     r3
0009f25e  movs    r3, #5
0009f260  ldr     r0, [sp, #4]
0009f262  str     r3, [sp, #0x84]
0009f264  ldr     r1, [sp, #0x48]
0009f266  bl      #0x9e9ec ; -> ZNK13LocaleManager16getSupportedLangEPN4midp6StringE
0009f26a  str     r0, [sp, #0x7c]
0009f26c  cmp     r0, #0
0009f26e  beq.w   #0x9f38a
0009f272  ldr     r3, [r0]
0009f274  ldr     r3, [r3, #0xc]
0009f276  blx     r3
0009f278  movs    r3, #4
0009f27a  ldr     r0, [sp, #4]
0009f27c  str     r3, [sp, #0x84]
0009f27e  ldr     r1, [sp, #0x7c]
0009f280  bl      #0x9e8c0 ; -> ZN13LocaleManager9setLocaleEPN4midp6StringE
0009f284  ldr     r4, [sp, #0x7c]
0009f286  cbz     r4, #0x9f29a
0009f288  ldr     r3, [r4]
0009f28a  mov     r0, r4
0009f28c  ldr     r2, [r3, #8]
0009f28e  movs    r3, #5
0009f290  str     r3, [sp, #0x84]
0009f292  blx     r2
0009f294  cmp     r0, #0
0009f296  bne.w   #0x9f3da
0009f29a  ldr     r0, [sp, #0x6c]
0009f29c  cbz     r0, #0x9f2b2
0009f29e  ldr     r1, [sp, #0x48]
0009f2a0  ldr     r3, [r1]
0009f2a2  mov     r0, r1
0009f2a4  ldr     r2, [r3, #8]
0009f2a6  movs    r3, #9
0009f2a8  str     r3, [sp, #0x84]
0009f2aa  blx     r2
0009f2ac  cmp     r0, #0
0009f2ae  bne.w   #0x9f3b4
0009f2b2  add     r0, sp, #0x80
0009f2b4  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009f2b8  sub.w   sp, r7, #0x58
0009f2bc  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009f2c0  sub.w   sp, r7, #0x18
0009f2c4  pop.w   {r8, sl, fp}
0009f2c8  pop     {r4, r5, r6, r7, pc}
0009f2ca  ldr     r4, [sp, #4]
0009f2cc  ldr     r2, [r4, #0x10]
0009f2ce  cmp     r3, r2
0009f2d0  beq     #0x9f324
0009f2d2  ldr     r0, [sp, #4]
0009f2d4  ldr     r3, [r0, #0x14]
0009f2d6  adds    r2, r3, #1
0009f2d8  cmp     r3, #0
0009f2da  str     r2, [r0, #0x14]
0009f2dc  blt     #0x9f3c0
0009f2de  cmp     r2, r3
0009f2e0  blt     #0x9f3c0
0009f2e2  ldr     r4, [sp, #4]
0009f2e4  lsls    r2, r3, #2
0009f2e6  str     r2, [sp, #0x44]
0009f2e8  ldr     r0, [sp, #0x10]
0009f2ea  ldr     r2, [r4, #0x18]
0009f2ec  ldr.w   r3, [r2, r3, lsl #2]
0009f2f0  str     r3, [sp, #0x40]
0009f2f2  cbz     r0, #0x9f302
0009f2f4  ldr     r1, [sp, #0x34]
0009f2f6  ldr     r3, [r1]
0009f2f8  mov     r0, r1
0009f2fa  ldr     r2, [r3, #0xc]
0009f2fc  movs    r3, #7
0009f2fe  str     r3, [sp, #0x84]
0009f300  blx     r2
0009f302  ldr     r2, [sp, #4]
0009f304  ldr     r0, [sp, #0x74]
0009f306  ldr     r4, [sp, #0x44]
0009f308  ldr     r3, [r2, #0x18]
0009f30a  str     r0, [r4, r3]
0009f30c  ldr     r0, [sp, #0x40]
0009f30e  movs    r3, #7
0009f310  str     r3, [sp, #0x84]
0009f312  bl      #0x9f614 ; -> ZN4midp6DECREFEPNS_16ReferenceCountedE
0009f316  b       #0x9f1fe
0009f318  ldr     r4, [sp, #0x34]
0009f31a  ldr     r3, [r4]
0009f31c  mov     r0, r4
0009f31e  ldr     r3, [r3, #4]
0009f320  blx     r3
0009f322  b       #0x9f216
0009f324  ldr     r0, [r4, #0xc]
0009f326  add     r0, r3
0009f328  cmp     r0, r3
0009f32a  ble     #0x9f2d2
0009f32c  ldr     r1, [r4, #0x18]
0009f32e  str     r0, [r4, #0x10]
0009f330  movs    r3, #7
0009f332  lsls    r0, r0, #2
0009f334  str     r1, [sp, #0x3c]
0009f336  str     r3, [sp, #0x84]
0009f338  blx     #0xdd5b4 ; -> Znam
0009f33c  str     r0, [r4, #0x18]
0009f33e  cbz     r0, #0x9f36a
0009f340  ldr     r3, [r4, #0x14]
0009f342  cmp     r3, #0
0009f344  ble     #0x9f360
0009f346  movs    r0, #0
0009f348  mov     r2, r0
0009f34a  ldr     r3, [sp, #4]
0009f34c  ldr     r4, [sp, #0x3c]
0009f34e  adds    r0, #1
0009f350  ldr     r1, [r3, #0x18]
0009f352  ldr     r3, [r2, r4]
0009f354  str     r3, [r1, r2]
0009f356  ldr     r1, [sp, #4]
0009f358  adds    r2, #4
0009f35a  ldr     r3, [r1, #0x14]
0009f35c  cmp     r3, r0
0009f35e  bgt     #0x9f34a
0009f360  ldr     r2, [sp, #0x3c]
0009f362  cbz     r2, #0x9f36a
0009f364  mov     r0, r2
0009f366  blx     #0xdd59c ; -> ZdaPv
0009f36a  ldr     r3, [sp, #4]
0009f36c  ldr     r1, [r3, #0x14]
0009f36e  ldr     r3, [r3, #0x10]
0009f370  cmp     r1, r3
0009f372  bge     #0x9f2d2
0009f374  lsls    r3, r1, #2
0009f376  ldr     r4, [sp, #4]
0009f378  movs    r2, #0
0009f37a  adds    r1, #1
0009f37c  ldr     r0, [r4, #0x18]
0009f37e  str     r2, [r0, r3]
0009f380  ldr     r2, [r4, #0x10]
0009f382  adds    r3, #4
0009f384  cmp     r2, r1
0009f386  bgt     #0x9f376
0009f388  b       #0x9f2d2
0009f38a  ldr     r2, [sp, #4]
0009f38c  ldr     r3, [r2, #0x14]
0009f38e  cmp     r3, #0
0009f390  blt.w   #0x9f4a0
0009f394  ldr     r1, [sp, #4]
0009f396  ldr     r3, [r1, #0x18]
0009f398  ldr     r3, [r3]
0009f39a  str     r3, [sp, #0x70]
0009f39c  cmp     r3, #0
0009f39e  beq.w   #0x9f278
0009f3a2  ldr     r4, [sp, #0x70]
0009f3a4  ldr     r3, [r4]
0009f3a6  mov     r0, r4
0009f3a8  ldr     r2, [r3, #0xc]
0009f3aa  movs    r3, #4
0009f3ac  str     r3, [sp, #0x84]
0009f3ae  blx     r2
0009f3b0  str     r4, [sp, #0x7c]
0009f3b2  b       #0x9f278
0009f3b4  ldr     r2, [sp, #0x48]
0009f3b6  ldr     r3, [r2]
0009f3b8  mov     r0, r2
0009f3ba  ldr     r3, [r3, #4]
0009f3bc  blx     r3
0009f3be  b       #0x9f2b2
0009f3c0  ldr.w   r0, [pc, #0x224]
0009f3c4  ldr     r1, [pc, #0x224]
0009f3c6  ldr.w   r3, [pc, #0x228]
0009f3ca  movs    r2, #7
0009f3cc  add     r0, pc ; -> 0x000e5c7c  ZZNK4util8VectorSEIN4midp6StringEE9elementAtEiE8__func__
0009f3ce  str     r2, [sp, #0x84]
0009f3d0  add     r1, pc ; -> 0x001764b0  '../../src/EA_SDK/util/Vector.h'
0009f3d2  add     r3, pc ; -> 0x001764d0  'false'
0009f3d4  adds    r2, #0x9c
0009f3d6  blx     #0xdd5cc ; -> assert_rtn
0009f3da  ldr     r3, [r4]
0009f3dc  ldr     r0, [sp, #0x7c]
0009f3de  ldr     r3, [r3, #4]
0009f3e0  blx     r3
0009f3e2  b       #0x9f29a
0009f3e4  ldr     r3, [sp, #0x84]
0009f3e6  ldr     r2, [sp, #0x88]
0009f3e8  cmp     r3, #1
0009f3ea  str     r2, [sp]
0009f3ec  beq     #0x9f42c
0009f3ee  cmp     r3, #2
0009f3f0  beq     #0x9f416
0009f3f2  cmp     r3, #3
0009f3f4  beq.w   #0x9f580
0009f3f8  cmp     r3, #4
0009f3fa  beq.w   #0x9f5a4
0009f3fe  cmp     r3, #5
0009f400  beq.w   #0x9f578
0009f404  cmp     r3, #6
0009f406  beq     #0x9f4b8
0009f408  cmp     r3, #7
0009f40a  beq.w   #0x9f56a
0009f40e  cmp     r3, #8
0009f410  beq     #0x9f4dc
0009f412  cmp     r3, #9
0009f414  beq     #0x9f436
0009f416  ldr     r0, [sp, #0x64]
0009f418  movs    r3, #0
0009f41a  str     r3, [sp, #0x84]
0009f41c  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009f420  ldr     r0, [sp]
0009f422  mov.w   r3, #-1
0009f426  str     r3, [sp, #0x84]
0009f428  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009f42c  ldr     r0, [sp, #0x4c]
0009f42e  movs    r3, #0
0009f430  str     r3, [sp, #0x84]
0009f432  bl      #0x9f638 ; -> ZN4midp10array_baseD2Ev
0009f436  ldr     r1, [sp]
0009f438  ldr     r2, [sp, #4]
0009f43a  ldr.w   r3, [pc, #0x1b8]
0009f43e  str     r1, [sp, #0x30]
0009f440  add     r3, pc ; -> 0x0017df98  ZTVN4util8VectorSEIN4midp6StringEEE
0009f442  adds    r3, #8
0009f444  str     r3, [r2, #4]
0009f446  ldr     r3, [r2, #0x14]
0009f448  cmp     r3, #0
0009f44a  ble     #0x9f478
0009f44c  movs    r2, #0
0009f44e  str     r2, [sp, #0x68]
0009f450  ldr     r3, [sp, #4]
0009f452  ldr     r4, [sp, #0x68]
0009f454  ldr     r2, [r3, #0x18]
0009f456  movs    r3, #0
0009f458  ldr.w   r0, [r2, r4, lsl #2]
0009f45c  str.w   r3, [r2, r4, lsl #2]
0009f460  adds    r3, #1
0009f462  str     r3, [sp, #0x84]
0009f464  bl      #0x9f614 ; -> ZN4midp6DECREFEPNS_16ReferenceCountedE
0009f468  ldr     r3, [sp, #0x68]
0009f46a  ldr     r4, [sp, #4]
0009f46c  adds    r3, #1
0009f46e  str     r3, [sp, #0x68]
0009f470  ldr     r0, [sp, #0x68]
0009f472  ldr     r3, [r4, #0x14]
0009f474  cmp     r3, r0
0009f476  bgt     #0x9f450
0009f478  ldr     r1, [sp, #4]
0009f47a  movs    r3, #0
0009f47c  ldr     r0, [r1, #0x18]
0009f47e  str     r3, [r1, #0x14]
0009f480  cbz     r0, #0x9f486
0009f482  blx     #0xdd59c ; -> ZdaPv
0009f486  ldr     r0, [sp, #0x64]
0009f488  movs    r3, #0
0009f48a  str     r3, [sp, #0x84]
0009f48c  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009f490  ldr     r3, [sp, #0x30]
0009f492  str     r3, [sp]
0009f494  ldr     r0, [sp]
0009f496  mov.w   r3, #-1
0009f49a  str     r3, [sp, #0x84]
0009f49c  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009f4a0  ldr.w   r0, [pc, #0x154]
0009f4a4  ldr     r1, [pc, #0x154]
0009f4a6  ldr     r3, [pc, #0x158]
0009f4a8  movs    r2, #4
0009f4aa  add     r0, pc ; -> 0x000e5c7c  ZZNK4util8VectorSEIN4midp6StringEE9elementAtEiE8__func__
0009f4ac  str     r2, [sp, #0x84]
0009f4ae  add     r1, pc ; -> 0x001764b0  '../../src/EA_SDK/util/Vector.h'
0009f4b0  add     r3, pc ; -> 0x001764d0  'false'
0009f4b2  adds    r2, #0x9f
0009f4b4  blx     #0xdd5cc ; -> assert_rtn
0009f4b8  ldr     r1, [sp]
0009f4ba  ldr     r2, [sp, #0x10]
0009f4bc  str     r1, [sp, #0x20]
0009f4be  cbz     r2, #0x9f4d8
0009f4c0  ldr     r4, [sp, #0x34]
0009f4c2  ldr     r3, [r4]
0009f4c4  mov     r0, r4
0009f4c6  ldr     r2, [r3, #8]
0009f4c8  movs    r3, #0
0009f4ca  str     r3, [sp, #0x84]
0009f4cc  blx     r2
0009f4ce  cbz     r0, #0x9f4d8
0009f4d0  ldr     r3, [r4]
0009f4d2  ldr     r0, [sp, #0x34]
0009f4d4  ldr     r3, [r3, #4]
0009f4d6  blx     r3
0009f4d8  ldr     r0, [sp, #0x20]
0009f4da  str     r0, [sp]
0009f4dc  ldr     r3, [sp]
0009f4de  ldr     r0, [sp, #4]
0009f4e0  ldr     r4, [sp, #4]
0009f4e2  str     r3, [sp, #0x2c]
0009f4e4  ldr     r3, [pc, #0x11c]
0009f4e6  adds    r4, #0x30
0009f4e8  str     r4, [sp, #0x4c]
0009f4ea  add     r3, pc ; -> 0x0017df1c  ZTVN4midp5arrayINS0_INS0_INS_23ReferenceCountedPointerINS_6StringEEEEEEEEE
0009f4ec  adds    r3, #8
0009f4ee  str     r3, [r0, #0x30]
0009f4f0  ldr     r1, [r0, #0x38]
0009f4f2  ldr     r2, [sp, #4]
0009f4f4  str     r1, [sp, #0x50]
0009f4f6  ldr     r0, [r2, #0x3c]
0009f4f8  cmp     r0, #0
0009f4fa  beq     #0x9f572
0009f4fc  ldr     r3, [r0, #8]
0009f4fe  str     r3, [sp, #0x60]
0009f500  ldrb    r3, [r0, #0x14]
0009f502  cmp     r3, #0
0009f504  ite     ne
0009f506  movne   r3, #1
0009f508  moveq   r3, #0
0009f50a  str     r3, [sp, #0x5c]
0009f50c  ldr     r4, [sp, #4]
0009f50e  movs    r1, #0
0009f510  movs    r3, #2
0009f512  str     r1, [r4, #0x3c]
0009f514  str     r1, [r4, #0x38]
0009f516  str     r3, [sp, #0x84]
0009f518  bl      #0x9f614 ; -> ZN4midp6DECREFEPNS_16ReferenceCountedE
0009f51c  cbz     r0, #0x9f55a
0009f51e  ldr     r2, [sp, #0x5c]
0009f520  cbz     r2, #0x9f55a
0009f522  ldr     r3, [sp, #0x60]
0009f524  cbz     r3, #0x9f55a
0009f526  ldr     r4, [sp, #0x50]
0009f528  str     r3, [sp, #0x58]
0009f52a  cmp     r4, #0
0009f52c  ble     #0x9f554
0009f52e  movs    r0, #0
0009f530  str     r3, [sp, #0x78]
0009f532  str     r0, [sp, #0x54]
0009f534  ldr     r1, [sp, #0x78]
0009f536  ldr     r3, [r1]
0009f538  mov     r0, r1
0009f53a  ldr     r2, [r3]
0009f53c  movs    r3, #2
0009f53e  str     r3, [sp, #0x84]
0009f540  blx     r2
0009f542  ldr     r2, [sp, #0x54]
0009f544  ldr     r3, [sp, #0x78]
0009f546  ldr     r4, [sp, #0x50]
0009f548  adds    r2, #1
0009f54a  adds    r3, #0x14
0009f54c  cmp     r2, r4
0009f54e  str     r2, [sp, #0x54]
0009f550  str     r3, [sp, #0x78]
0009f552  bne     #0x9f534
0009f554  ldr     r0, [sp, #0x58]
0009f556  blx     #0xdd5a8 ; -> ZdlPv
0009f55a  ldr     r0, [sp, #0x4c]
0009f55c  movs    r3, #0
0009f55e  str     r3, [sp, #0x84]
0009f560  bl      #0x9f638 ; -> ZN4midp10array_baseD2Ev
0009f564  ldr     r0, [sp, #0x2c]
0009f566  str     r0, [sp]
0009f568  b       #0x9f436
0009f56a  ldr     r0, [sp, #0x74]
0009f56c  blx     #0xdd5a8 ; -> ZdlPv
0009f570  b       #0x9f4dc
0009f572  str     r0, [sp, #0x60]
0009f574  str     r0, [sp, #0x5c]
0009f576  b       #0x9f50c
0009f578  ldr     r0, [sp, #0x14]
0009f57a  blx     #0xdd5a8 ; -> ZdlPv
0009f57e  b       #0x9f4dc
0009f580  ldr     r0, [sp]
0009f582  ldr     r1, [sp, #0x7c]
0009f584  str     r0, [sp, #0x24]
0009f586  cbz     r1, #0x9f5a0
0009f588  ldr     r3, [r1]
0009f58a  mov     r0, r1
0009f58c  ldr     r2, [r3, #8]
0009f58e  movs    r3, #0
0009f590  str     r3, [sp, #0x84]
0009f592  blx     r2
0009f594  cbz     r0, #0x9f5a0
0009f596  ldr     r2, [sp, #0x7c]
0009f598  ldr     r3, [r2]
0009f59a  mov     r0, r2
0009f59c  ldr     r3, [r3, #4]
0009f59e  blx     r3
0009f5a0  ldr     r3, [sp, #0x24]
0009f5a2  str     r3, [sp]
0009f5a4  ldr     r1, [sp]
0009f5a6  ldr     r2, [sp, #0x6c]
0009f5a8  str     r1, [sp, #0x28]
0009f5aa  cbz     r2, #0x9f5c4
0009f5ac  ldr     r4, [sp, #0x48]
0009f5ae  ldr     r3, [r4]
0009f5b0  mov     r0, r4
0009f5b2  ldr     r2, [r3, #8]
0009f5b4  movs    r3, #0
0009f5b6  str     r3, [sp, #0x84]
0009f5b8  blx     r2
0009f5ba  cbz     r0, #0x9f5c4
0009f5bc  ldr     r3, [r4]
0009f5be  ldr     r0, [sp, #0x48]
0009f5c0  ldr     r3, [r3, #4]
0009f5c2  blx     r3
0009f5c4  ldr     r0, [sp, #0x28]
0009f5c6  str     r0, [sp]
0009f5c8  b       #0x9f4dc
0009f5ca  nop     
0009f5cc  subs    r7, #0x82
0009f5ce  movs    r5, r0
0009f5d0  rsbs.w  r0, ip, #0x840000
0009f5d4  lsls    r2, r6, #0xc
0009f5d6  movs    r0, r0
0009f5d8  cdp     p0, #4, c0, c0, c13, #0
0009f5dc  cdp     p0, #0xb, c0, c6, c13, #0
0009f5e0  stc     p0, c0, [sl, #0x34]!
0009f5e4  strb    r0, [r3, #0xf]
0009f5e6  movs    r5, r1
0009f5e8  ldr     r4, [r5, #8]
0009f5ea  movs    r4, r0
0009f5ec  strb    r4, [r3, #3]
0009f5ee  movs    r5, r1
0009f5f0  strb    r2, [r7, #3]
0009f5f2  movs    r5, r1
0009f5f4  adcs.w  r0, r4, sp
0009f5f8  str     r6, [r1, #0x7c]
0009f5fa  movs    r4, r0
0009f5fc  ldr     r6, [r7, #0x7c]
0009f5fe  movs    r5, r1
0009f600  strb    r4, [r3]
0009f602  movs    r5, r1
0009f604  bic.w   r0, lr, sp
