========================================================================
ZNSt6vectorISsSaISsEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPSsS1_EERKSs  0x0009c28c  1248 bytes   Mayhem.mm
========================================================================

0009c28c  push    {r4, r5, r6, r7, lr}
0009c28e  add     r7, sp, #0xc
0009c290  push.w  {r8, sl, fp}
0009c294  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009c298  sub     sp, #0xbc
0009c29a  ldr.w   r3, [pc, #0x4a8]
0009c29e  str     r0, [sp, #0xc]
0009c2a0  add     r0, sp, #0x7c
0009c2a2  add     r3, pc ; -> 0x000f3438  0x0
0009c2a4  str     r1, [sp, #8]
0009c2a6  ldr     r3, [r3]
0009c2a8  str     r2, [sp, #4]
0009c2aa  str     r7, [sp, #0x9c]
0009c2ac  str.w   sp, [sp, #0xa4]
0009c2b0  str     r3, [sp, #0x94]
0009c2b2  ldr.w   r3, [pc, #0x494]
0009c2b6  add     r3, pc ; -> 0x000ee330  GCC_except_table59
0009c2b8  str     r3, [sp, #0x98]
0009c2ba  ldr.w   r3, [pc, #0x490]
0009c2be  add     r3, pc ; -> 0x0009c538  
0009c2c0  orr     r3, r3, #1
0009c2c4  str     r3, [sp, #0xa0]
0009c2c6  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009c2ca  ldr     r2, [sp, #0xc]
0009c2cc  ldr     r1, [sp, #8]
0009c2ce  str     r1, [sp, #0x38]
0009c2d0  ldr     r0, [r2, #4]
0009c2d2  ldr     r3, [r2, #8]
0009c2d4  cmp     r0, r3
0009c2d6  beq     #0x9c376
0009c2d8  cbz     r0, #0x9c2e4
0009c2da  movs    r3, #6
0009c2dc  subs    r1, r0, #4
0009c2de  str     r3, [sp, #0x80]
0009c2e0  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009c2e4  ldr     r4, [sp, #0xc]
0009c2e6  add     r0, sp, #0xb0
0009c2e8  ldr     r3, [r4, #4]
0009c2ea  adds    r3, #4
0009c2ec  str     r3, [r4, #4]
0009c2ee  ldr     r1, [sp, #4]
0009c2f0  mov.w   r3, #-1
0009c2f4  str     r3, [sp, #0x80]
0009c2f6  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009c2fa  ldr.w   lr, [r4, #4]
0009c2fe  ldr     r4, [sp, #0x38]
0009c300  mov     r1, lr
0009c302  subs    r1, #8
0009c304  rsb     r3, r4, r1
0009c308  str.w   lr, [sp, #0x74]
0009c30c  asrs    r3, r3, #2
0009c30e  cmp     r3, #0
0009c310  str     r1, [sp, #0x1c]
0009c312  str.w   lr, [sp, #0x78]
0009c316  str     r3, [sp, #0x20]
0009c318  ble     #0x9c33e
0009c31a  ldr     r1, [sp, #0x78]
0009c31c  ldr     r2, [sp, #0x74]
0009c31e  ldr     r3, [sp, #0x1c]
0009c320  rsb     r0, r2, r1
0009c324  adds    r0, r0, r3
0009c326  subs    r3, #4
0009c328  str     r3, [sp, #0x1c]
0009c32a  ldr     r1, [sp, #0x1c]
0009c32c  movs    r3, #8
0009c32e  str     r3, [sp, #0x80]
0009c330  blx     #0xdd518 ; -> ZNSs6assignERKSs
0009c334  ldr     r4, [sp, #0x20]
0009c336  adds.w  r4, r4, #-1
0009c33a  str     r4, [sp, #0x20]
0009c33c  bne     #0x9c31a
0009c33e  movs    r3, #8
0009c340  ldr     r0, [sp, #0x38]
0009c342  str     r3, [sp, #0x80]
0009c344  add     r1, sp, #0xb0
0009c346  blx     #0xdd518 ; -> ZNSs6assignERKSs
0009c34a  ldr.w   r3, [pc, #0x404]
0009c34e  ldr     r2, [sp, #0xb0]
0009c350  add     r3, pc ; -> 0x000f3370  0x0
0009c352  sub.w   r0, r2, #0xc
0009c356  ldr     r3, [r3]
0009c358  cmp     r0, r3
0009c35a  bne.w   #0x9c4d2
0009c35e  add     r0, sp, #0x7c
0009c360  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009c364  sub.w   sp, r7, #0x58
0009c368  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009c36c  sub.w   sp, r7, #0x18
0009c370  pop.w   {r8, sl, fp}
0009c374  pop     {r4, r5, r6, r7, pc}
0009c376  ldr     r2, [sp, #0xc]
0009c378  mvn     r3, #0xc0000000
0009c37c  ldr     r1, [r2]
0009c37e  subs    r0, r0, r1
0009c380  asrs    r0, r0, #2
0009c382  cmp     r0, r3
0009c384  beq.w   #0x9c528
0009c388  mov     r3, r0
0009c38a  cmp     r0, #0
0009c38c  bne.w   #0x9c4a4
0009c390  movs    r2, #1
0009c392  cmp     r2, r3
0009c394  itt     lo
0009c396  mvnlo   r3, #3
0009c39a  strlo   r3, [sp, #0x3c]
0009c39c  blo     #0x9c3aa
0009c39e  cmp.w   r2, #0x40000000
0009c3a2  bhs.w   #0x9c51e
0009c3a6  lsls    r2, r2, #2
0009c3a8  str     r2, [sp, #0x3c]
0009c3aa  ldr     r0, [sp, #0x3c]
0009c3ac  mov.w   r3, #-1
0009c3b0  str     r3, [sp, #0x80]
0009c3b2  blx     #0xdd5c0 ; -> Znwm
0009c3b6  ldr     r4, [sp, #0xc]
0009c3b8  ldr     r1, [sp, #0x38]
0009c3ba  str     r0, [sp, #0x10]
0009c3bc  str     r0, [sp, #0x24]
0009c3be  str     r0, [sp, #0x14]
0009c3c0  ldr     r4, [r4]
0009c3c2  cmp     r1, r4
0009c3c4  str     r4, [sp, #0x28]
0009c3c6  it      eq
0009c3c8  streq   r0, [sp, #0x5c]
0009c3ca  beq     #0x9c3fa
0009c3cc  ldr     r3, [sp, #0x10]
0009c3ce  ldr     r2, [sp, #0x10]
0009c3d0  str     r3, [sp, #0x5c]
0009c3d2  adds    r2, #4
0009c3d4  str     r2, [sp, #0x50]
0009c3d6  ldr     r4, [sp, #0x5c]
0009c3d8  cbz     r4, #0x9c3e6
0009c3da  movs    r3, #4
0009c3dc  mov     r0, r4
0009c3de  str     r3, [sp, #0x80]
0009c3e0  ldr     r1, [sp, #0x28]
0009c3e2  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009c3e6  ldr     r1, [sp, #0x28]
0009c3e8  ldr     r2, [sp, #0x50]
0009c3ea  ldr     r4, [sp, #0x38]
0009c3ec  adds    r1, #4
0009c3ee  adds    r3, r2, #4
0009c3f0  cmp     r4, r1
0009c3f2  str     r1, [sp, #0x28]
0009c3f4  str     r2, [sp, #0x5c]
0009c3f6  str     r3, [sp, #0x50]
0009c3f8  bne     #0x9c3d6
0009c3fa  ldr     r1, [sp, #0x5c]
0009c3fc  str     r1, [sp, #0x14]
0009c3fe  cbz     r1, #0x9c40c
0009c400  movs    r3, #3
0009c402  ldr     r0, [sp, #0x14]
0009c404  str     r3, [sp, #0x80]
0009c406  ldr     r1, [sp, #4]
0009c408  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009c40c  ldr     r4, [sp, #0xc]
0009c40e  ldr     r3, [sp, #0x14]
0009c410  ldr     r1, [sp, #0x38]
0009c412  adds    r3, #4
0009c414  str     r3, [sp, #0x14]
0009c416  ldr     r4, [r4, #4]
0009c418  str     r3, [sp, #0x60]
0009c41a  cmp     r1, r4
0009c41c  str     r4, [sp, #0x2c]
0009c41e  it      eq
0009c420  streq   r3, [sp, #0x64]
0009c422  beq     #0x9c456
0009c424  ldr     r2, [sp, #0x38]
0009c426  ldr     r4, [sp, #0x14]
0009c428  ldr     r3, [sp, #0x5c]
0009c42a  str     r2, [sp, #0x48]
0009c42c  adds    r3, #8
0009c42e  str     r4, [sp, #0x64]
0009c430  str     r3, [sp, #0x4c]
0009c432  ldr     r1, [sp, #0x64]
0009c434  cbz     r1, #0x9c442
0009c436  movs    r3, #1
0009c438  mov     r0, r1
0009c43a  str     r3, [sp, #0x80]
0009c43c  ldr     r1, [sp, #0x48]
0009c43e  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009c442  ldr     r4, [sp, #0x48]
0009c444  ldr     r3, [sp, #0x4c]
0009c446  ldr     r2, [sp, #0x2c]
0009c448  adds    r4, #4
0009c44a  adds    r1, r3, #4
0009c44c  cmp     r2, r4
0009c44e  str     r3, [sp, #0x64]
0009c450  str     r4, [sp, #0x48]
0009c452  str     r1, [sp, #0x4c]
0009c454  bne     #0x9c432
0009c456  ldr     r3, [sp, #0xc]
0009c458  ldr     r2, [r3]
0009c45a  ldr     r4, [r3, #4]
0009c45c  cmp     r2, r4
0009c45e  str     r4, [sp, #0x30]
0009c460  beq     #0x9c486
0009c462  ldr     r3, [pc, #0x2f0]
0009c464  str     r2, [sp, #0x44]
0009c466  add     r3, pc ; -> 0x000f3370  0x0
0009c468  ldr     r3, [r3]
0009c46a  str     r3, [sp, #0x70]
0009c46c  ldr     r4, [sp, #0x44]
0009c46e  ldr     r1, [sp, #0x70]
0009c470  ldr     r3, [r4]
0009c472  sub.w   r0, r3, #0xc
0009c476  cmp     r0, r1
0009c478  bne     #0x9c4a8
0009c47a  ldr     r1, [sp, #0x44]
0009c47c  ldr     r2, [sp, #0x30]
0009c47e  adds    r1, #4
0009c480  cmp     r2, r1
0009c482  str     r1, [sp, #0x44]
0009c484  bne     #0x9c46c
0009c486  ldr     r4, [sp, #0xc]
0009c488  ldr     r0, [r4]
0009c48a  cbz     r0, #0x9c490
0009c48c  blx     #0xdd5a8 ; -> ZdlPv
0009c490  ldr     r2, [sp, #0x10]
0009c492  ldr     r1, [sp, #0xc]
0009c494  str     r2, [r1]
0009c496  ldr     r3, [sp, #0x64]
0009c498  str     r3, [r1, #4]
0009c49a  ldr     r4, [sp, #0x3c]
0009c49c  add.w   r3, r2, r4
0009c4a0  str     r3, [r1, #8]
0009c4a2  b       #0x9c35e
0009c4a4  lsls    r2, r0, #1
0009c4a6  b       #0x9c392
0009c4a8  subs    r2, r3, #4
0009c4aa  ldr     r3, [r3, #-0x4]
0009c4ae  subs    r1, r3, #1
0009c4b0  dmb     ish
0009c4b4  mov     ip, r3
0009c4b6  ldrex   r4, [r2]
0009c4ba  cmp     r4, r3
0009c4bc  beq     #0x9c500
0009c4be  cmp     r4, ip
0009c4c0  mov     r3, r4
0009c4c2  bne     #0x9c4ae
0009c4c4  cmp     r4, #0
0009c4c6  bgt     #0x9c47a
0009c4c8  add.w   r1, sp, #0xb7
0009c4cc  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009c4d0  b       #0x9c47a
0009c4d2  ldr     r3, [r2, #-0x4]
0009c4d6  subs    r1, r2, #4
0009c4d8  subs    r2, r3, #1
0009c4da  dmb     ish
0009c4de  mov     ip, r3
0009c4e0  ldrex   lr, [r1]
0009c4e4  cmp     lr, r3
0009c4e6  beq     #0x9c510
0009c4e8  cmp     lr, ip
0009c4ea  mov     r3, lr
0009c4ec  bne     #0x9c4d8
0009c4ee  cmp.w   lr, #0
0009c4f2  bgt.w   #0x9c35e
0009c4f6  add.w   r1, sp, #0xbb
0009c4fa  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009c4fe  b       #0x9c35e
0009c500  strex   lr, r1, [r2]
0009c504  cmp.w   lr, #0
0009c508  bne     #0x9c4b6
0009c50a  dmb     ish
0009c50e  b       #0x9c4be
0009c510  strex   r4, r2, [r1]
0009c514  cmp     r4, #0
0009c516  bne     #0x9c4e0
0009c518  dmb     ish
0009c51c  b       #0x9c4e8
0009c51e  mov.w   r3, #-1
0009c522  str     r3, [sp, #0x80]
0009c524  blx     #0xdd554 ; -> ZSt17__throw_bad_allocv
0009c528  ldr.w   r0, [pc, #0x22c]
0009c52c  add.w   r3, r3, #-0x40000000
0009c530  str     r3, [sp, #0x80]
0009c532  add     r0, pc ; -> 0x00175c18  'vector::_M_insert_aux'
0009c534  blx     #0xdd578 ; -> ZSt20__throw_length_errorPKc
0009c538  ldr     r3, [sp, #0x80]
0009c53a  ldr     r2, [sp, #0x84]
0009c53c  cmp     r3, #1
0009c53e  str     r2, [sp]
0009c540  beq     #0x9c598
0009c542  cmp     r3, #2
0009c544  beq     #0x9c5a0
0009c546  cmp     r3, #3
0009c548  beq.w   #0x9c65e
0009c54c  cmp     r3, #4
0009c54e  beq     #0x9c598
0009c550  cmp     r3, #5
0009c552  beq     #0x9c652
0009c554  cmp     r3, #6
0009c556  beq     #0x9c64a
0009c558  cmp     r3, #7
0009c55a  beq.w   #0x9c698
0009c55e  ldr     r0, [sp]
0009c560  blx     #0xdd5e4 ; -> cxa_begin_catch
0009c564  ldr     r1, [sp, #0x60]
0009c566  ldr     r2, [sp, #0x64]
0009c568  cmp     r1, r2
0009c56a  beq     #0x9c590
0009c56c  ldr.w   r3, [pc, #0x1ec]
0009c570  add     r3, pc ; -> 0x000f3370  0x0
0009c572  ldr     r3, [r3]
0009c574  str     r3, [sp, #0x6c]
0009c576  ldr     r4, [sp, #0x60]
0009c578  ldr     r1, [sp, #0x6c]
0009c57a  ldr     r3, [r4]
0009c57c  sub.w   r0, r3, #0xc
0009c580  cmp     r0, r1
0009c582  bne     #0x9c5e8
0009c584  ldr     r1, [sp, #0x60]
0009c586  ldr     r2, [sp, #0x64]
0009c588  adds    r1, #4
0009c58a  cmp     r1, r2
0009c58c  str     r1, [sp, #0x60]
0009c58e  bne     #0x9c576
0009c590  movs    r3, #2
0009c592  str     r3, [sp, #0x80]
0009c594  blx     #0xdd5fc ; -> cxa_rethrow
0009c598  movs    r3, #0
0009c59a  str     r3, [sp, #0x80]
0009c59c  blx     #0xdd5f0 ; -> cxa_end_catch
0009c5a0  ldr     r0, [sp]
0009c5a2  blx     #0xdd5e4 ; -> cxa_begin_catch
0009c5a6  ldr     r3, [sp, #0x14]
0009c5a8  ldr     r4, [sp, #0x10]
0009c5aa  cmp     r4, r3
0009c5ac  str     r3, [sp, #0x34]
0009c5ae  beq     #0x9c5d6
0009c5b0  ldr.w   r3, [pc, #0x1ac]
0009c5b4  str     r4, [sp, #0x58]
0009c5b6  add     r3, pc ; -> 0x000f3370  0x0
0009c5b8  ldr     r3, [r3]
0009c5ba  str     r3, [sp, #0x68]
0009c5bc  ldr     r1, [sp, #0x58]
0009c5be  ldr     r2, [sp, #0x68]
0009c5c0  ldr     r3, [r1]
0009c5c2  sub.w   r0, r3, #0xc
0009c5c6  cmp     r0, r2
0009c5c8  bne     #0x9c610
0009c5ca  ldr     r1, [sp, #0x58]
0009c5cc  ldr     r2, [sp, #0x34]
0009c5ce  adds    r1, #4
0009c5d0  cmp     r2, r1
0009c5d2  str     r1, [sp, #0x58]
0009c5d4  bne     #0x9c5bc
0009c5d6  ldr     r3, [sp, #0x24]
0009c5d8  cbz     r3, #0x9c5e0
0009c5da  ldr     r0, [sp, #0x10]
0009c5dc  blx     #0xdd5a8 ; -> ZdlPv
0009c5e0  movs    r3, #7
0009c5e2  str     r3, [sp, #0x80]
0009c5e4  blx     #0xdd5fc ; -> cxa_rethrow
0009c5e8  subs    r2, r3, #4
0009c5ea  ldr     r3, [r3, #-0x4]
0009c5ee  subs    r1, r3, #1
0009c5f0  dmb     ish
0009c5f4  mov     ip, r3
0009c5f6  ldrex   r4, [r2]
0009c5fa  cmp     r4, r3
0009c5fc  beq     #0x9c6f6
0009c5fe  cmp     r4, ip
0009c600  mov     r3, r4
0009c602  bne     #0x9c5ee
0009c604  cmp     r4, #0
0009c606  bgt     #0x9c584
0009c608  add     r1, sp, #0xb8
0009c60a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009c60e  b       #0x9c584
0009c610  subs    r2, r3, #4
0009c612  ldr     r3, [r3, #-0x4]
0009c616  subs    r1, r3, #1
0009c618  dmb     ish
0009c61c  mov     ip, r3
0009c61e  ldrex   r4, [r2]
0009c622  cmp     r4, r3
0009c624  beq     #0x9c63a
0009c626  cmp     r4, ip
0009c628  mov     r3, r4
0009c62a  bne     #0x9c616
0009c62c  cmp     r4, #0
0009c62e  bgt     #0x9c5ca
0009c630  add.w   r1, sp, #0xb6
0009c634  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009c638  b       #0x9c5ca
0009c63a  strex   lr, r1, [r2]
0009c63e  cmp.w   lr, #0
0009c642  bne     #0x9c61e
0009c644  dmb     ish
0009c648  b       #0x9c626
0009c64a  movs    r3, #0
0009c64c  str     r3, [sp, #0x80]
0009c64e  blx     #0xdd5f0 ; -> cxa_end_catch
0009c652  ldr     r0, [sp]
0009c654  mov.w   r3, #-1
0009c658  str     r3, [sp, #0x80]
0009c65a  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009c65e  ldr     r0, [sp]
0009c660  blx     #0xdd5e4 ; -> cxa_begin_catch
0009c664  ldr     r2, [sp, #0x10]
0009c666  ldr     r3, [sp, #0x5c]
0009c668  cmp     r2, r3
0009c66a  beq     #0x9c690
0009c66c  ldr     r3, [pc, #0xf4]
0009c66e  str     r2, [sp, #0x54]
0009c670  add     r3, pc ; -> 0x000f3370  0x0
0009c672  ldr     r3, [r3]
0009c674  str     r3, [sp, #0x40]
0009c676  ldr     r4, [sp, #0x54]
0009c678  ldr     r1, [sp, #0x40]
0009c67a  ldr     r3, [r4]
0009c67c  sub.w   r0, r3, #0xc
0009c680  cmp     r0, r1
0009c682  bne     #0x9c6bc
0009c684  ldr     r1, [sp, #0x54]
0009c686  ldr     r2, [sp, #0x5c]
0009c688  adds    r1, #4
0009c68a  cmp     r1, r2
0009c68c  str     r1, [sp, #0x54]
0009c68e  bne     #0x9c676
0009c690  movs    r3, #5
0009c692  str     r3, [sp, #0x80]
0009c694  blx     #0xdd5fc ; -> cxa_rethrow
0009c698  ldr     r1, [sp]
0009c69a  ldr     r3, [pc, #0xcc]
0009c69c  add     r3, pc ; -> 0x000f3370  0x0
0009c69e  str     r1, [sp, #0x18]
0009c6a0  ldr     r1, [sp, #0xb0]
0009c6a2  ldr     r3, [r3]
0009c6a4  sub.w   r0, r1, #0xc
0009c6a8  cmp     r0, r3
0009c6aa  bne     #0x9c708
0009c6ac  ldr     r1, [sp, #0x18]
0009c6ae  mov.w   r3, #-1
0009c6b2  str     r3, [sp, #0x80]
0009c6b4  mov     r0, r1
0009c6b6  str     r1, [sp]
0009c6b8  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009c6bc  subs    r2, r3, #4
0009c6be  ldr     r3, [r3, #-0x4]
0009c6c2  subs    r1, r3, #1
0009c6c4  dmb     ish
0009c6c8  mov     ip, r3
0009c6ca  ldrex   r4, [r2]
0009c6ce  cmp     r4, r3
0009c6d0  beq     #0x9c6e6
0009c6d2  cmp     r4, ip
0009c6d4  mov     r3, r4
0009c6d6  bne     #0x9c6c2
0009c6d8  cmp     r4, #0
0009c6da  bgt     #0x9c684
0009c6dc  add.w   r1, sp, #0xb9
0009c6e0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009c6e4  b       #0x9c684
0009c6e6  strex   lr, r1, [r2]
0009c6ea  cmp.w   lr, #0
0009c6ee  bne     #0x9c6ca
0009c6f0  dmb     ish
0009c6f4  b       #0x9c6d2
0009c6f6  strex   lr, r1, [r2]
0009c6fa  cmp.w   lr, #0
0009c6fe  bne.w   #0x9c5f6
0009c702  dmb     ish
0009c706  b       #0x9c5fe
0009c708  ldr     r3, [r1, #-0x4]
0009c70c  subs    r2, r1, #4
0009c70e  subs    r1, r3, #1
0009c710  dmb     ish
0009c714  mov     ip, r3
0009c716  ldrex   r4, [r2]
0009c71a  cmp     r4, r3
0009c71c  beq     #0x9c732
0009c71e  cmp     r4, ip
0009c720  mov     r3, r4
0009c722  bne     #0x9c70e
0009c724  cmp     r4, #0
0009c726  bgt     #0x9c6ac
0009c728  add.w   r1, sp, #0xba
0009c72c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009c730  b       #0x9c6ac
0009c732  strex   lr, r1, [r2]
0009c736  cmp.w   lr, #0
0009c73a  bne     #0x9c716
0009c73c  dmb     ish
0009c740  b       #0x9c71e
0009c742  nop     
0009c744  strb    r2, [r2, #6]
0009c746  movs    r5, r0
0009c748  movs    r0, #0x76
0009c74a  movs    r5, r0
0009c74c  lsls    r6, r6, #9
0009c74e  movs    r0, r0
0009c750  strb    r4, [r3]
0009c752  movs    r5, r0
0009c754  ldr     r6, [r0, #0x70]
0009c756  movs    r5, r0
0009c758  str     r6, [sp, #0x388]
0009c75a  movs    r5, r1
0009c75c  ldr     r4, [r7, #0x5c]
0009c75e  movs    r5, r0
0009c760  ldr     r6, [r6, #0x58]
0009c762  movs    r5, r0
0009c764  ldr     r4, [r7, #0x4c]
0009c766  movs    r5, r0
0009c768  ldr     r0, [r2, #0x4c]
0009c76a  movs    r5, r0
