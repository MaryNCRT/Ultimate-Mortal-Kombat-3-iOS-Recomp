========================================================================
ZNSt6vectorI8FBFriendSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_  0x0008a24c  2356 bytes   FBConnection.mm
========================================================================

0008a24c  push    {r4, r5, r6, r7, lr}
0008a24e  add     r7, sp, #0xc
0008a250  push.w  {r8, sl, fp}
0008a254  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008a258  sub     sp, #0x104
0008a25a  ldr.w   r3, [pc, #0x8e8]
0008a25e  str     r0, [sp, #0xc]
0008a260  add     r0, sp, #0xac
0008a262  add     r3, pc ; -> 0x000f301c  0x0
0008a264  str     r1, [sp, #8]
0008a266  ldr     r3, [r3]
0008a268  str     r2, [sp, #4]
0008a26a  str     r7, [sp, #0xcc]
0008a26c  str.w   sp, [sp, #0xd4]
0008a270  str     r3, [sp, #0xc4]
0008a272  ldr.w   r3, [pc, #0x8d4]
0008a276  add     r3, pc ; -> 0x000ee178  GCC_except_table1
0008a278  str     r3, [sp, #0xc8]
0008a27a  ldr.w   r3, [pc, #0x8d0]
0008a27e  add     r3, pc ; -> 0x0008a63a  
0008a280  orr     r3, r3, #1
0008a284  str     r3, [sp, #0xd0]
0008a286  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008a28a  ldr     r1, [sp, #8]
0008a28c  ldr     r2, [sp, #0xc]
0008a28e  ldr     r4, [sp, #0xc]
0008a290  str     r1, [sp, #0x64]
0008a292  ldr     r2, [r2, #4]
0008a294  str     r2, [sp, #0x10]
0008a296  ldr     r3, [r4, #8]
0008a298  cmp     r2, r3
0008a29a  beq.w   #0x8a3a6
0008a29e  str     r2, [sp, #0x20]
0008a2a0  cbz     r2, #0x8a2ca
0008a2a2  mov     r0, r2
0008a2a4  sub.w   r1, r2, #0x10
0008a2a8  ldm     r1, {r1, r2}
0008a2aa  stm     r0!, {r1, r2}
0008a2ac  ldr     r3, [sp, #0x10]
0008a2ae  sub.w   r1, r3, #8
0008a2b2  movs    r3, #0xb
0008a2b4  str     r3, [sp, #0xb0]
0008a2b6  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008a2ba  ldr     r4, [sp, #0x10]
0008a2bc  movs    r3, #0xa
0008a2be  str     r3, [sp, #0xb0]
0008a2c0  add.w   r0, r4, #0xc
0008a2c4  subs    r1, r4, #4
0008a2c6  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008a2ca  ldr     r2, [sp, #0xc]
0008a2cc  add     r0, sp, #0xe8
0008a2ce  ldr     r3, [r2, #4]
0008a2d0  adds    r3, #0x10
0008a2d2  str     r3, [r2, #4]
0008a2d4  ldr     r1, [sp, #4]
0008a2d6  ldm     r1!, {r3, r4}
0008a2d8  str     r3, [sp, #0xe0]
0008a2da  str     r4, [sp, #0xe4]
0008a2dc  mov.w   r3, #-1
0008a2e0  str     r3, [sp, #0xb0]
0008a2e2  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008a2e6  ldr     r4, [sp, #4]
0008a2e8  movs    r3, #9
0008a2ea  add     r0, sp, #0xec
0008a2ec  add.w   r1, r4, #0xc
0008a2f0  str     r3, [sp, #0xb0]
0008a2f2  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008a2f6  ldr     r2, [sp, #0xc]
0008a2f8  ldr     r4, [sp, #0x64]
0008a2fa  ldr     r2, [r2, #4]
0008a2fc  sub.w   r3, r2, #0x20
0008a300  str     r3, [sp, #0x30]
0008a302  subs    r3, r3, r4
0008a304  str     r2, [sp, #0xa4]
0008a306  asrs    r3, r3, #4
0008a308  cmp     r3, #0
0008a30a  str     r2, [sp, #0xa8]
0008a30c  str     r3, [sp, #0x34]
0008a30e  ble     #0x8a34c
0008a310  ldr     r1, [sp, #0xa8]
0008a312  ldr     r2, [sp, #0xa4]
0008a314  ldr     r4, [sp, #0x30]
0008a316  rsb     r3, r2, r1
0008a31a  adds    r3, r3, r4
0008a31c  subs    r4, #0x10
0008a31e  str     r3, [sp, #0x2c]
0008a320  mov     r1, r4
0008a322  str     r4, [sp, #0x30]
0008a324  mov     r0, r3
0008a326  ldm     r1!, {r2, r3}
0008a328  stm     r0!, {r2, r3}
0008a32a  movs    r3, #0xd
0008a32c  str     r3, [sp, #0xb0]
0008a32e  blx     #0xdd518 ; -> ZNSs6assignERKSs
0008a332  ldr     r3, [sp, #0x2c]
0008a334  ldr     r4, [sp, #0x30]
0008a336  add.w   r0, r3, #0xc
0008a33a  add.w   r1, r4, #0xc
0008a33e  blx     #0xdd518 ; -> ZNSs6assignERKSs
0008a342  ldr     r1, [sp, #0x34]
0008a344  adds.w  r1, r1, #-1
0008a348  str     r1, [sp, #0x34]
0008a34a  bne     #0x8a310
0008a34c  add     r2, sp, #0xe0
0008a34e  ldm     r2, {r2, r3}
0008a350  ldr     r0, [sp, #0x64]
0008a352  add     r1, sp, #0xe8
0008a354  stm     r0!, {r2, r3}
0008a356  movs    r3, #0xd
0008a358  str     r3, [sp, #0xb0]
0008a35a  blx     #0xdd518 ; -> ZNSs6assignERKSs
0008a35e  ldr     r3, [sp, #0x64]
0008a360  add     r1, sp, #0xec
0008a362  add.w   r0, r3, #0xc
0008a366  blx     #0xdd518 ; -> ZNSs6assignERKSs
0008a36a  ldr.w   r3, [pc, #0x7e4]
0008a36e  ldr     r2, [sp, #0xec]
0008a370  add     r3, pc ; -> 0x000f3370  0x0
0008a372  sub.w   r0, r2, #0xc
0008a376  ldr     r3, [r3]
0008a378  cmp     r0, r3
0008a37a  str     r3, [sp, #0x3c]
0008a37c  bne.w   #0x8a58a
0008a380  ldr     r3, [sp, #0xe8]
0008a382  ldr     r1, [sp, #0x3c]
0008a384  sub.w   r0, r3, #0xc
0008a388  cmp     r1, r0
0008a38a  bne.w   #0x8a5b6
0008a38e  add     r0, sp, #0xac
0008a390  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008a394  sub.w   sp, r7, #0x58
0008a398  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008a39c  sub.w   sp, r7, #0x18
0008a3a0  pop.w   {r8, sl, fp}
0008a3a4  pop     {r4, r5, r6, r7, pc}
0008a3a6  ldr     r1, [sp, #0xc]
0008a3a8  ldr     r2, [sp, #0x10]
0008a3aa  ldr     r3, [r1]
0008a3ac  rsb     r3, r3, r2
0008a3b0  mvn     r2, #0xf0000000
0008a3b4  asrs    r3, r3, #4
0008a3b6  cmp     r3, r2
0008a3b8  beq.w   #0x8a61a
0008a3bc  mov     r2, r3
0008a3be  cmp     r3, #0
0008a3c0  bne.w   #0x8a530
0008a3c4  adds    r3, #1
0008a3c6  cmp     r3, r2
0008a3c8  itt     lo
0008a3ca  mvnlo   r3, #0xf
0008a3ce  strlo   r3, [sp, #0x68]
0008a3d0  blo     #0x8a3de
0008a3d2  cmp.w   r3, #0x10000000
0008a3d6  bhs.w   #0x8a610
0008a3da  lsls    r3, r3, #4
0008a3dc  str     r3, [sp, #0x68]
0008a3de  ldr     r0, [sp, #0x68]
0008a3e0  mov.w   r3, #-1
0008a3e4  str     r3, [sp, #0xb0]
0008a3e6  blx     #0xdd5c0 ; -> Znwm
0008a3ea  ldr     r4, [sp, #0xc]
0008a3ec  ldr     r1, [sp, #0x64]
0008a3ee  str     r0, [sp, #0x14]
0008a3f0  str     r0, [sp, #0x40]
0008a3f2  str     r0, [sp, #0x18]
0008a3f4  ldr     r4, [r4]
0008a3f6  cmp     r1, r4
0008a3f8  str     r4, [sp, #0x44]
0008a3fa  it      eq
0008a3fc  streq   r0, [sp, #0x8c]
0008a3fe  beq     #0x8a446
0008a400  ldr     r3, [sp, #0x14]
0008a402  ldr     r2, [sp, #0x14]
0008a404  str     r3, [sp, #0x8c]
0008a406  adds    r2, #0x10
0008a408  str     r2, [sp, #0x7c]
0008a40a  ldr     r4, [sp, #0x8c]
0008a40c  cbz     r4, #0x8a430
0008a40e  ldr     r1, [sp, #0x44]
0008a410  mov     r0, r4
0008a412  ldm     r1!, {r2, r3}
0008a414  stm     r0!, {r2, r3}
0008a416  movs    r3, #7
0008a418  str     r3, [sp, #0xb0]
0008a41a  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008a41e  ldr     r3, [sp, #0x44]
0008a420  add.w   r0, r4, #0xc
0008a424  add.w   r1, r3, #0xc
0008a428  movs    r3, #6
0008a42a  str     r3, [sp, #0xb0]
0008a42c  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008a430  ldr     r2, [sp, #0x44]
0008a432  ldr     r3, [sp, #0x7c]
0008a434  ldr     r1, [sp, #0x64]
0008a436  adds    r2, #0x10
0008a438  adds.w  r4, r3, #0x10
0008a43c  cmp     r1, r2
0008a43e  str     r2, [sp, #0x44]
0008a440  str     r3, [sp, #0x8c]
0008a442  str     r4, [sp, #0x7c]
0008a444  bne     #0x8a40a
0008a446  ldr     r2, [sp, #0x8c]
0008a448  str     r2, [sp, #0x4c]
0008a44a  str     r2, [sp, #0x18]
0008a44c  cbz     r2, #0x8a472
0008a44e  ldr     r1, [sp, #4]
0008a450  ldr     r0, [sp, #0x18]
0008a452  ldm     r1!, {r3, r4}
0008a454  stm     r0!, {r3, r4}
0008a456  movs    r3, #5
0008a458  str     r3, [sp, #0xb0]
0008a45a  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008a45e  ldr     r4, [sp, #0x18]
0008a460  ldr     r2, [sp, #4]
0008a462  movs    r3, #4
0008a464  add.w   r0, r4, #0xc
0008a468  add.w   r1, r2, #0xc
0008a46c  str     r3, [sp, #0xb0]
0008a46e  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008a472  ldr     r3, [sp, #0xc]
0008a474  ldr     r2, [sp, #0x18]
0008a476  ldr     r4, [sp, #0x64]
0008a478  adds    r2, #0x10
0008a47a  str     r2, [sp, #0x18]
0008a47c  ldr     r3, [r3, #4]
0008a47e  str     r2, [sp, #0xa0]
0008a480  cmp     r4, r3
0008a482  str     r3, [sp, #0x54]
0008a484  beq     #0x8a4d0
0008a486  ldr     r1, [sp, #0x8c]
0008a488  str     r4, [sp, #0x74]
0008a48a  str     r2, [sp, #0x9c]
0008a48c  adds    r1, #0x20
0008a48e  str     r1, [sp, #0x78]
0008a490  ldr     r2, [sp, #0x9c]
0008a492  cbz     r2, #0x8a4b8
0008a494  ldr     r1, [sp, #0x74]
0008a496  mov     r0, r2
0008a498  ldm     r1!, {r3, r4}
0008a49a  stm     r0!, {r3, r4}
0008a49c  movs    r3, #2
0008a49e  str     r3, [sp, #0xb0]
0008a4a0  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008a4a4  ldr     r4, [sp, #0x9c]
0008a4a6  ldr     r2, [sp, #0x74]
0008a4a8  movs    r3, #1
0008a4aa  add.w   r0, r4, #0xc
0008a4ae  add.w   r1, r2, #0xc
0008a4b2  str     r3, [sp, #0xb0]
0008a4b4  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008a4b8  ldr     r3, [sp, #0x74]
0008a4ba  ldr     r2, [sp, #0x78]
0008a4bc  ldr     r1, [sp, #0x54]
0008a4be  adds    r3, #0x10
0008a4c0  adds.w  r4, r2, #0x10
0008a4c4  cmp     r1, r3
0008a4c6  str     r2, [sp, #0x9c]
0008a4c8  str     r3, [sp, #0x74]
0008a4ca  str     r4, [sp, #0x78]
0008a4cc  bne     #0x8a490
0008a4ce  str     r2, [sp, #0xa0]
0008a4d0  ldr     r3, [sp, #0xc]
0008a4d2  ldr     r2, [r3]
0008a4d4  ldr     r4, [r3, #4]
0008a4d6  cmp     r2, r4
0008a4d8  str     r4, [sp, #0x5c]
0008a4da  beq     #0x8a512
0008a4dc  ldr.w   r3, [pc, #0x674]
0008a4e0  str     r2, [sp, #0x70]
0008a4e2  add     r3, pc ; -> 0x000f3370  0x0
0008a4e4  ldr     r3, [r3]
0008a4e6  str     r3, [sp, #0x6c]
0008a4e8  ldr     r3, [sp, #0x70]
0008a4ea  ldr     r4, [sp, #0x6c]
0008a4ec  str     r3, [sp, #0x98]
0008a4ee  ldr     r3, [r3, #0xc]
0008a4f0  sub.w   r0, r3, #0xc
0008a4f4  cmp     r4, r0
0008a4f6  bne     #0x8a534
0008a4f8  ldr     r1, [sp, #0x98]
0008a4fa  ldr     r2, [sp, #0x6c]
0008a4fc  ldr     r3, [r1, #8]
0008a4fe  sub.w   r0, r3, #0xc
0008a502  cmp     r2, r0
0008a504  bne     #0x8a560
0008a506  ldr     r1, [sp, #0x70]
0008a508  ldr     r2, [sp, #0x5c]
0008a50a  adds    r1, #0x10
0008a50c  cmp     r2, r1
0008a50e  str     r1, [sp, #0x70]
0008a510  bne     #0x8a4e8
0008a512  ldr     r4, [sp, #0xc]
0008a514  ldr     r0, [r4]
0008a516  cbz     r0, #0x8a51c
0008a518  blx     #0xdd5a8 ; -> ZdlPv
0008a51c  ldr     r2, [sp, #0x14]
0008a51e  ldr     r1, [sp, #0xc]
0008a520  str     r2, [r1]
0008a522  ldr     r3, [sp, #0xa0]
0008a524  str     r3, [r1, #4]
0008a526  ldr     r4, [sp, #0x68]
0008a528  add.w   r3, r2, r4
0008a52c  str     r3, [r1, #8]
0008a52e  b       #0x8a38e
0008a530  lsls    r3, r3, #1
0008a532  b       #0x8a3c6
0008a534  subs    r2, r3, #4
0008a536  ldr     r3, [r3, #-0x4]
0008a53a  subs    r1, r3, #1
0008a53c  dmb     ish
0008a540  mov     ip, r3
0008a542  ldrex   lr, [r2]
0008a546  cmp     lr, r3
0008a548  beq     #0x8a5f2
0008a54a  cmp     lr, ip
0008a54c  mov     r3, lr
0008a54e  bne     #0x8a53a
0008a550  cmp.w   lr, #0
0008a554  bgt     #0x8a4f8
0008a556  add.w   r1, sp, #0xf6
0008a55a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a55e  b       #0x8a4f8
0008a560  subs    r2, r3, #4
0008a562  ldr     r3, [r3, #-0x4]
0008a566  subs    r1, r3, #1
0008a568  dmb     ish
0008a56c  mov     ip, r3
0008a56e  ldrex   r4, [r2]
0008a572  cmp     r4, r3
0008a574  beq     #0x8a5e2
0008a576  cmp     r4, ip
0008a578  mov     r3, r4
0008a57a  bne     #0x8a566
0008a57c  cmp     r4, #0
0008a57e  bgt     #0x8a506
0008a580  add.w   r1, sp, #0xf5
0008a584  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a588  b       #0x8a506
0008a58a  ldr     r3, [r2, #-0x4]
0008a58e  subs    r1, r2, #4
0008a590  subs    r2, r3, #1
0008a592  dmb     ish
0008a596  mov     ip, r3
0008a598  ldrex   r4, [r1]
0008a59c  cmp     r4, r3
0008a59e  beq     #0x8a62a
0008a5a0  cmp     r4, ip
0008a5a2  mov     r3, r4
0008a5a4  bne     #0x8a590
0008a5a6  cmp     r4, #0
0008a5a8  bgt.w   #0x8a380
0008a5ac  add.w   r1, sp, #0xff
0008a5b0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a5b4  b       #0x8a380
0008a5b6  subs    r2, r3, #4
0008a5b8  ldr     r3, [r3, #-0x4]
0008a5bc  subs    r1, r3, #1
0008a5be  dmb     ish
0008a5c2  mov     ip, r3
0008a5c4  ldrex   r4, [r2]
0008a5c8  cmp     r4, r3
0008a5ca  beq     #0x8a600
0008a5cc  cmp     r4, ip
0008a5ce  mov     r3, r4
0008a5d0  bne     #0x8a5bc
0008a5d2  cmp     r4, #0
0008a5d4  bgt.w   #0x8a38e
0008a5d8  add.w   r1, sp, #0xfe
0008a5dc  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a5e0  b       #0x8a38e
0008a5e2  strex   lr, r1, [r2]
0008a5e6  cmp.w   lr, #0
0008a5ea  bne     #0x8a56e
0008a5ec  dmb     ish
0008a5f0  b       #0x8a576
0008a5f2  strex   r4, r1, [r2]
0008a5f6  cmp     r4, #0
0008a5f8  bne     #0x8a542
0008a5fa  dmb     ish
0008a5fe  b       #0x8a54a
0008a600  strex   lr, r1, [r2]
0008a604  cmp.w   lr, #0
0008a608  bne     #0x8a5c4
0008a60a  dmb     ish
0008a60e  b       #0x8a5cc
0008a610  mov.w   r3, #-1
0008a614  str     r3, [sp, #0xb0]
0008a616  blx     #0xdd554 ; -> ZSt17__throw_bad_allocv
0008a61a  ldr.w   r0, [pc, #0x53c]
0008a61e  mov.w   r3, #-1
0008a622  str     r3, [sp, #0xb0]
0008a624  add     r0, pc ; -> 0x001759a0  'vector::_M_insert_aux'
0008a626  blx     #0xdd578 ; -> ZSt20__throw_length_errorPKc
0008a62a  strex   lr, r2, [r1]
0008a62e  cmp.w   lr, #0
0008a632  bne     #0x8a598
0008a634  dmb     ish
0008a638  b       #0x8a5a0
0008a63a  ldr     r3, [sp, #0xb0]
0008a63c  ldr     r4, [sp, #0xb4]
0008a63e  cmp     r3, #1
0008a640  str     r4, [sp]
0008a642  beq     #0x8a6a0
0008a644  cmp     r3, #2
0008a646  beq.w   #0x8aaec
0008a64a  cmp     r3, #3
0008a64c  beq.w   #0x8a8b8
0008a650  cmp     r3, #4
0008a652  beq.w   #0x8a8d6
0008a656  cmp     r3, #5
0008a658  beq.w   #0x8a824
0008a65c  cmp     r3, #6
0008a65e  beq.w   #0x8a83e
0008a662  cmp     r3, #7
0008a664  beq.w   #0x8aaec
0008a668  cmp     r3, #8
0008a66a  beq.w   #0x8a9d6
0008a66e  cmp     r3, #9
0008a670  beq.w   #0x8a7dc
0008a674  cmp     r3, #0xa
0008a676  beq.w   #0x8a7d0
0008a67a  cmp     r3, #0xb
0008a67c  beq.w   #0x8a7c8
0008a680  cmp     r3, #0xc
0008a682  beq.w   #0x8a794
0008a686  ldr     r2, [sp, #0x9c]
0008a688  ldr.w   r3, [pc, #0x4d0]
0008a68c  str     r4, [sp, #0x58]
0008a68e  add     r3, pc ; -> 0x000f3370  0x0
0008a690  ldr     r1, [r2, #8]
0008a692  ldr     r3, [r3]
0008a694  sub.w   r0, r1, #0xc
0008a698  cmp     r0, r3
0008a69a  bne     #0x8a6e8
0008a69c  ldr     r1, [sp, #0x58]
0008a69e  str     r1, [sp]
0008a6a0  ldr     r0, [sp]
0008a6a2  blx     #0xdd5e4 ; -> cxa_begin_catch
0008a6a6  ldr     r1, [sp, #0xa0]
0008a6a8  ldr     r2, [sp, #0x9c]
0008a6aa  cmp     r1, r2
0008a6ac  beq     #0x8a6e0
0008a6ae  ldr.w   r3, [pc, #0x4b0]
0008a6b2  add     r3, pc ; -> 0x000f3370  0x0
0008a6b4  ldr     r3, [r3]
0008a6b6  str     r3, [sp, #0x80]
0008a6b8  ldr     r4, [sp, #0xa0]
0008a6ba  ldr     r1, [sp, #0x80]
0008a6bc  ldr     r3, [r4, #0xc]
0008a6be  sub.w   r0, r3, #0xc
0008a6c2  cmp     r0, r1
0008a6c4  bne     #0x8a75c
0008a6c6  ldr     r1, [sp, #0xa0]
0008a6c8  ldr     r2, [sp, #0x80]
0008a6ca  ldr     r3, [r1, #8]
0008a6cc  sub.w   r0, r3, #0xc
0008a6d0  cmp     r0, r2
0008a6d2  bne     #0x8a712
0008a6d4  ldr     r1, [sp, #0xa0]
0008a6d6  ldr     r2, [sp, #0x9c]
0008a6d8  adds    r1, #0x10
0008a6da  cmp     r1, r2
0008a6dc  str     r1, [sp, #0xa0]
0008a6de  bne     #0x8a6b8
0008a6e0  movs    r3, #3
0008a6e2  str     r3, [sp, #0xb0]
0008a6e4  blx     #0xdd5fc ; -> cxa_rethrow
0008a6e8  ldr     r3, [r1, #-0x4]
0008a6ec  subs    r2, r1, #4
0008a6ee  subs    r1, r3, #1
0008a6f0  dmb     ish
0008a6f4  mov     ip, r3
0008a6f6  ldrex   r4, [r2]
0008a6fa  cmp     r4, r3
0008a6fc  beq     #0x8a73c
0008a6fe  cmp     r4, ip
0008a700  mov     r3, r4
0008a702  bne     #0x8a6ee
0008a704  cmp     r4, #0
0008a706  bgt     #0x8a69c
0008a708  add.w   r1, sp, #0xf9
0008a70c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a710  b       #0x8a69c
0008a712  subs    r2, r3, #4
0008a714  ldr     r3, [r3, #-0x4]
0008a718  subs    r1, r3, #1
0008a71a  dmb     ish
0008a71e  mov     ip, r3
0008a720  ldrex   r4, [r2]
0008a724  cmp     r4, r3
0008a726  beq     #0x8a74c
0008a728  cmp     r4, ip
0008a72a  mov     r3, r4
0008a72c  bne     #0x8a718
0008a72e  cmp     r4, #0
0008a730  bgt     #0x8a6d4
0008a732  add.w   r1, sp, #0xf7
0008a736  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a73a  b       #0x8a6d4
0008a73c  strex   lr, r1, [r2]
0008a740  cmp.w   lr, #0
0008a744  bne     #0x8a6f6
0008a746  dmb     ish
0008a74a  b       #0x8a6fe
0008a74c  strex   lr, r1, [r2]
0008a750  cmp.w   lr, #0
0008a754  bne     #0x8a720
0008a756  dmb     ish
0008a75a  b       #0x8a728
0008a75c  subs    r2, r3, #4
0008a75e  ldr     r3, [r3, #-0x4]
0008a762  subs    r1, r3, #1
0008a764  dmb     ish
0008a768  mov     ip, r3
0008a76a  ldrex   r4, [r2]
0008a76e  cmp     r4, r3
0008a770  beq     #0x8a784
0008a772  cmp     r4, ip
0008a774  mov     r3, r4
0008a776  bne     #0x8a762
0008a778  cmp     r4, #0
0008a77a  bgt     #0x8a6c6
0008a77c  add     r1, sp, #0xf8
0008a77e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a782  b       #0x8a6c6
0008a784  strex   lr, r1, [r2]
0008a788  cmp.w   lr, #0
0008a78c  bne     #0x8a76a
0008a78e  dmb     ish
0008a792  b       #0x8a772
0008a794  ldr     r3, [pc, #0x3cc]
0008a796  ldr     r1, [sp, #0xec]
0008a798  ldr     r4, [sp]
0008a79a  add     r3, pc ; -> 0x000f3370  0x0
0008a79c  sub.w   r0, r1, #0xc
0008a7a0  ldr     r3, [r3]
0008a7a2  str     r4, [sp, #0x1c]
0008a7a4  cmp     r0, r3
0008a7a6  str     r3, [sp, #0x38]
0008a7a8  bne.w   #0x8a9ee
0008a7ac  ldr     r3, [sp, #0xe8]
0008a7ae  ldr     r1, [sp, #0x38]
0008a7b0  sub.w   r0, r3, #0xc
0008a7b4  cmp     r1, r0
0008a7b6  bne     #0x8a7fa
0008a7b8  ldr     r1, [sp, #0x1c]
0008a7ba  mov     r0, r1
0008a7bc  mov.w   r3, #-1
0008a7c0  str     r1, [sp]
0008a7c2  str     r3, [sp, #0xb0]
0008a7c4  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008a7c8  movs    r3, #0
0008a7ca  str     r3, [sp, #0xb0]
0008a7cc  blx     #0xdd5f0 ; -> cxa_end_catch
0008a7d0  ldr     r0, [sp]
0008a7d2  mov.w   r3, #-1
0008a7d6  str     r3, [sp, #0xb0]
0008a7d8  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008a7dc  ldr     r1, [sp]
0008a7de  ldr     r2, [sp, #0x20]
0008a7e0  ldr     r3, [pc, #0x384]
0008a7e2  str     r1, [sp, #0x24]
0008a7e4  add     r3, pc ; -> 0x000f3370  0x0
0008a7e6  ldr     r1, [r2, #8]
0008a7e8  ldr     r3, [r3]
0008a7ea  sub.w   r0, r1, #0xc
0008a7ee  cmp     r0, r3
0008a7f0  bne.w   #0x8aa1c
0008a7f4  ldr     r1, [sp, #0x24]
0008a7f6  str     r1, [sp]
0008a7f8  b       #0x8a7d0
0008a7fa  subs    r2, r3, #4
0008a7fc  ldr     r3, [r3, #-0x4]
0008a800  subs    r1, r3, #1
0008a802  dmb     ish
0008a806  mov     ip, r3
0008a808  ldrex   r4, [r2]
0008a80c  cmp     r4, r3
0008a80e  beq.w   #0x8ab24
0008a812  cmp     r4, ip
0008a814  mov     r3, r4
0008a816  bne     #0x8a800
0008a818  cmp     r4, #0
0008a81a  bgt     #0x8a7b8
0008a81c  add     r1, sp, #0x100
0008a81e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a822  b       #0x8a7b8
0008a824  ldr     r4, [sp]
0008a826  ldr     r2, [sp, #0x8c]
0008a828  ldr     r3, [pc, #0x340]
0008a82a  str     r4, [sp, #0x48]
0008a82c  add     r3, pc ; -> 0x000f3370  0x0
0008a82e  ldr     r1, [r2, #8]
0008a830  ldr     r3, [r3]
0008a832  sub.w   r0, r1, #0xc
0008a836  cmp     r0, r3
0008a838  bne     #0x8a88c
0008a83a  ldr     r1, [sp, #0x48]
0008a83c  str     r1, [sp]
0008a83e  ldr     r0, [sp]
0008a840  blx     #0xdd5e4 ; -> cxa_begin_catch
0008a844  ldr     r3, [sp, #0x14]
0008a846  ldr     r4, [sp, #0x8c]
0008a848  cmp     r3, r4
0008a84a  beq     #0x8a884
0008a84c  ldr.w   r3, [pc, #0x320]
0008a850  ldr     r1, [sp, #0x14]
0008a852  add     r3, pc ; -> 0x000f3370  0x0
0008a854  ldr     r3, [r3]
0008a856  str     r1, [sp, #0x90]
0008a858  str     r3, [sp, #0x88]
0008a85a  ldr     r2, [sp, #0x90]
0008a85c  ldr     r4, [sp, #0x88]
0008a85e  ldr     r3, [r2, #0xc]
0008a860  sub.w   r0, r3, #0xc
0008a864  cmp     r0, r4
0008a866  bne.w   #0x8aaa0
0008a86a  ldr     r1, [sp, #0x90]
0008a86c  ldr     r2, [sp, #0x88]
0008a86e  ldr     r3, [r1, #8]
0008a870  sub.w   r0, r3, #0xc
0008a874  cmp     r0, r2
0008a876  bne     #0x8a92a
0008a878  ldr     r1, [sp, #0x90]
0008a87a  ldr     r2, [sp, #0x8c]
0008a87c  adds    r1, #0x10
0008a87e  cmp     r1, r2
0008a880  str     r1, [sp, #0x90]
0008a882  bne     #0x8a85a
0008a884  movs    r3, #8
0008a886  str     r3, [sp, #0xb0]
0008a888  blx     #0xdd5fc ; -> cxa_rethrow
0008a88c  ldr     r3, [r1, #-0x4]
0008a890  subs    r2, r1, #4
0008a892  subs    r1, r3, #1
0008a894  dmb     ish
0008a898  mov     ip, r3
0008a89a  ldrex   r4, [r2]
0008a89e  cmp     r4, r3
0008a8a0  beq.w   #0x8aada
0008a8a4  cmp     r4, ip
0008a8a6  mov     r3, r4
0008a8a8  bne     #0x8a892
0008a8aa  cmp     r4, #0
0008a8ac  bgt     #0x8a83a
0008a8ae  add.w   r1, sp, #0xfd
0008a8b2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a8b6  b       #0x8a83a
0008a8b8  ldr     r3, [sp]
0008a8ba  ldr     r4, [sp, #0x4c]
0008a8bc  str     r3, [sp, #0x50]
0008a8be  ldr.w   r3, [pc, #0x2b4]
0008a8c2  ldr     r1, [r4, #8]
0008a8c4  add     r3, pc ; -> 0x000f3370  0x0
0008a8c6  sub.w   r0, r1, #0xc
0008a8ca  ldr     r3, [r3]
0008a8cc  cmp     r0, r3
0008a8ce  bne.w   #0x8aaf6
0008a8d2  ldr     r1, [sp, #0x50]
0008a8d4  str     r1, [sp]
0008a8d6  ldr     r0, [sp]
0008a8d8  blx     #0xdd5e4 ; -> cxa_begin_catch
0008a8dc  ldr     r3, [sp, #0x18]
0008a8de  ldr     r4, [sp, #0x14]
0008a8e0  cmp     r4, r3
0008a8e2  str     r3, [sp, #0x60]
0008a8e4  beq     #0x8a918
0008a8e6  ldr     r3, [pc, #0x290]
0008a8e8  str     r4, [sp, #0x94]
0008a8ea  add     r3, pc ; -> 0x000f3370  0x0
0008a8ec  ldr     r3, [r3]
0008a8ee  str     r3, [sp, #0x84]
0008a8f0  ldr     r1, [sp, #0x94]
0008a8f2  ldr     r2, [sp, #0x84]
0008a8f4  ldr     r3, [r1, #0xc]
0008a8f6  sub.w   r0, r3, #0xc
0008a8fa  cmp     r2, r0
0008a8fc  bne     #0x8a98e
0008a8fe  ldr     r1, [sp, #0x94]
0008a900  ldr     r2, [sp, #0x84]
0008a902  ldr     r3, [r1, #8]
0008a904  sub.w   r0, r3, #0xc
0008a908  cmp     r2, r0
0008a90a  bne     #0x8a954
0008a90c  ldr     r1, [sp, #0x94]
0008a90e  ldr     r2, [sp, #0x60]
0008a910  adds    r1, #0x10
0008a912  cmp     r2, r1
0008a914  str     r1, [sp, #0x94]
0008a916  bne     #0x8a8f0
0008a918  ldr     r3, [sp, #0x40]
0008a91a  cbz     r3, #0x8a922
0008a91c  ldr     r0, [sp, #0x14]
0008a91e  blx     #0xdd5a8 ; -> ZdlPv
0008a922  movs    r3, #0xc
0008a924  str     r3, [sp, #0xb0]
0008a926  blx     #0xdd5fc ; -> cxa_rethrow
0008a92a  subs    r2, r3, #4
0008a92c  ldr     r3, [r3, #-0x4]
0008a930  subs    r1, r3, #1
0008a932  dmb     ish
0008a936  mov     ip, r3
0008a938  ldrex   r4, [r2]
0008a93c  cmp     r4, r3
0008a93e  beq     #0x8a97e
0008a940  cmp     r4, ip
0008a942  mov     r3, r4
0008a944  bne     #0x8a930
0008a946  cmp     r4, #0
0008a948  bgt     #0x8a878
0008a94a  add.w   r1, sp, #0xfb
0008a94e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a952  b       #0x8a878
0008a954  subs    r2, r3, #4
0008a956  ldr     r3, [r3, #-0x4]
0008a95a  subs    r1, r3, #1
0008a95c  dmb     ish
0008a960  mov     ip, r3
0008a962  ldrex   r4, [r2]
0008a966  cmp     r4, r3
0008a968  beq     #0x8a9c6
0008a96a  cmp     r4, ip
0008a96c  mov     r3, r4
0008a96e  bne     #0x8a95a
0008a970  cmp     r4, #0
0008a972  bgt     #0x8a90c
0008a974  add.w   r1, sp, #0xf3
0008a978  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a97c  b       #0x8a90c
0008a97e  strex   lr, r1, [r2]
0008a982  cmp.w   lr, #0
0008a986  bne     #0x8a938
0008a988  dmb     ish
0008a98c  b       #0x8a940
0008a98e  subs    r2, r3, #4
0008a990  ldr     r3, [r3, #-0x4]
0008a994  subs    r1, r3, #1
0008a996  dmb     ish
0008a99a  mov     ip, r3
0008a99c  ldrex   r4, [r2]
0008a9a0  cmp     r4, r3
0008a9a2  beq     #0x8a9b6
0008a9a4  cmp     r4, ip
0008a9a6  mov     r3, r4
0008a9a8  bne     #0x8a994
0008a9aa  cmp     r4, #0
0008a9ac  bgt     #0x8a8fe
0008a9ae  add     r1, sp, #0xf4
0008a9b0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008a9b4  b       #0x8a8fe
0008a9b6  strex   lr, r1, [r2]
0008a9ba  cmp.w   lr, #0
0008a9be  bne     #0x8a99c
0008a9c0  dmb     ish
0008a9c4  b       #0x8a9a4
0008a9c6  strex   lr, r1, [r2]
0008a9ca  cmp.w   lr, #0
0008a9ce  bne     #0x8a962
0008a9d0  dmb     ish
0008a9d4  b       #0x8a96a
0008a9d6  ldr     r1, [sp]
0008a9d8  ldr     r3, [pc, #0x1a0]
0008a9da  add     r3, pc ; -> 0x000f3370  0x0
0008a9dc  str     r1, [sp, #0x28]
0008a9de  ldr     r1, [sp, #0xe8]
0008a9e0  ldr     r3, [r3]
0008a9e2  sub.w   r0, r1, #0xc
0008a9e6  cmp     r0, r3
0008a9e8  bne     #0x8aa48
0008a9ea  ldr     r1, [sp, #0x28]
0008a9ec  b       #0x8a7ba
0008a9ee  ldr     r3, [r1, #-0x4]
0008a9f2  subs    r2, r1, #4
0008a9f4  subs    r1, r3, #1
0008a9f6  dmb     ish
0008a9fa  mov     ip, r3
0008a9fc  ldrex   lr, [r2]
0008aa00  cmp     lr, r3
0008aa02  beq     #0x8aa82
0008aa04  cmp     lr, ip
0008aa06  mov     r3, lr
0008aa08  bne     #0x8a9f4
0008aa0a  cmp.w   lr, #0
0008aa0e  bgt.w   #0x8a7ac
0008aa12  add     r1, sp, #0x100
0008aa14  adds    r1, #1
0008aa16  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008aa1a  b       #0x8a7ac
0008aa1c  ldr     r3, [r1, #-0x4]
0008aa20  subs    r2, r1, #4
0008aa22  subs    r1, r3, #1
0008aa24  dmb     ish
0008aa28  mov     ip, r3
0008aa2a  ldrex   r4, [r2]
0008aa2e  cmp     r4, r3
0008aa30  beq     #0x8aa72
0008aa32  cmp     r4, ip
0008aa34  mov     r3, r4
0008aa36  bne     #0x8aa22
0008aa38  cmp     r4, #0
0008aa3a  bgt.w   #0x8a7f4
0008aa3e  add     r1, sp, #0x100
0008aa40  adds    r1, #3
0008aa42  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008aa46  b       #0x8a7f4
0008aa48  ldr     r3, [r1, #-0x4]
0008aa4c  subs    r2, r1, #4
0008aa4e  subs    r1, r3, #1
0008aa50  dmb     ish
0008aa54  mov     ip, r3
0008aa56  ldrex   r4, [r2]
0008aa5a  cmp     r4, r3
0008aa5c  beq     #0x8aa90
0008aa5e  cmp     r4, ip
0008aa60  mov     r3, r4
0008aa62  bne     #0x8aa4e
0008aa64  cmp     r4, #0
0008aa66  bgt     #0x8a9ea
0008aa68  add.w   r1, sp, #0x102
0008aa6c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008aa70  b       #0x8a9ea
0008aa72  strex   lr, r1, [r2]
0008aa76  cmp.w   lr, #0
0008aa7a  bne     #0x8aa2a
0008aa7c  dmb     ish
0008aa80  b       #0x8aa32
0008aa82  strex   r4, r1, [r2]
0008aa86  cmp     r4, #0
0008aa88  bne     #0x8a9fc
0008aa8a  dmb     ish
0008aa8e  b       #0x8aa04
0008aa90  strex   lr, r1, [r2]
0008aa94  cmp.w   lr, #0
0008aa98  bne     #0x8aa56
0008aa9a  dmb     ish
0008aa9e  b       #0x8aa5e
0008aaa0  subs    r2, r3, #4
0008aaa2  ldr     r3, [r3, #-0x4]
0008aaa6  subs    r1, r3, #1
0008aaa8  dmb     ish
0008aaac  mov     ip, r3
0008aaae  ldrex   lr, [r2]
0008aab2  cmp     lr, r3
0008aab4  beq     #0x8aacc
0008aab6  cmp     lr, ip
0008aab8  mov     r3, lr
0008aaba  bne     #0x8aaa6
0008aabc  cmp.w   lr, #0
0008aac0  bgt.w   #0x8a86a
0008aac4  add     r1, sp, #0xfc
0008aac6  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008aaca  b       #0x8a86a
0008aacc  strex   r4, r1, [r2]
0008aad0  cmp     r4, #0
0008aad2  bne     #0x8aaae
0008aad4  dmb     ish
0008aad8  b       #0x8aab6
0008aada  strex   lr, r1, [r2]
0008aade  cmp.w   lr, #0
0008aae2  bne.w   #0x8a89a
0008aae6  dmb     ish
0008aaea  b       #0x8a8a4
0008aaec  movs    r3, #0
0008aaee  str     r3, [sp, #0xb0]
0008aaf0  blx     #0xdd5f0 ; -> cxa_end_catch
0008aaf4  b       #0x8a8d6
0008aaf6  ldr     r3, [r1, #-0x4]
0008aafa  subs    r2, r1, #4
0008aafc  subs    r1, r3, #1
0008aafe  dmb     ish
0008ab02  mov     ip, r3
0008ab04  ldrex   lr, [r2]
0008ab08  cmp     lr, r3
0008ab0a  beq     #0x8ab36
0008ab0c  cmp     lr, ip
0008ab0e  mov     r3, lr
0008ab10  bne     #0x8aafc
0008ab12  cmp.w   lr, #0
0008ab16  bgt.w   #0x8a8d2
0008ab1a  add.w   r1, sp, #0xfa
0008ab1e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008ab22  b       #0x8a8d2
0008ab24  strex   lr, r1, [r2]
0008ab28  cmp.w   lr, #0
0008ab2c  bne.w   #0x8a808
0008ab30  dmb     ish
0008ab34  b       #0x8a812
0008ab36  strex   r4, r1, [r2]
0008ab3a  cmp     r4, #0
0008ab3c  bne     #0x8ab04
0008ab3e  dmb     ish
0008ab42  b       #0x8ab0c
0008ab44  ldrh    r6, [r6, #0x2c]
0008ab46  movs    r6, r0
0008ab48  subs    r6, #0xfe
0008ab4a  movs    r6, r0
0008ab4c  lsls    r0, r7, #0xe
0008ab4e  movs    r0, r0
0008ab50  ldrh    r4, [r7, #0x3e]
0008ab52  movs    r6, r0
0008ab54  ldrh    r2, [r1, #0x34]
0008ab56  movs    r6, r0
0008ab58  cbz     r0, #0x8abba
0008ab5a  movs    r6, r1
0008ab5c  ldrh    r6, [r3, #0x26]
0008ab5e  movs    r6, r0
0008ab60  ldrh    r2, [r7, #0x24]
0008ab62  movs    r6, r0
0008ab64  ldrh    r2, [r2, #0x1e]
0008ab66  movs    r6, r0
0008ab68  ldrh    r0, [r1, #0x1c]
0008ab6a  movs    r6, r0
0008ab6c  ldrh    r0, [r0, #0x1a]
0008ab6e  movs    r6, r0
0008ab70  ldrh    r2, [r3, #0x18]
0008ab72  movs    r6, r0
0008ab74  ldrh    r0, [r5, #0x14]
0008ab76  movs    r6, r0
0008ab78  ldrh    r2, [r0, #0x14]
0008ab7a  movs    r6, r0
0008ab7c  ldrh    r2, [r2, #0xc]
0008ab7e  movs    r6, r0
