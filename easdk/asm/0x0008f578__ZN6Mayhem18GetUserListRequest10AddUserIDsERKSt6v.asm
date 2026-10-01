========================================================================
ZN6Mayhem18GetUserListRequest10AddUserIDsERKSt6vectorISsSaISsEE  0x0008f578  376 bytes   Mayhem.mm
========================================================================

0008f578  push    {r4, r5, r6, r7, lr}
0008f57a  add     r7, sp, #0xc
0008f57c  push.w  {r8, sl, fp}
0008f580  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008f584  sub     sp, #0x70
0008f586  ldr     r3, [pc, #0x158]
0008f588  str     r0, [sp, #8]
0008f58a  add     r0, sp, #0x34
0008f58c  add     r3, pc ; -> 0x000f3438  0x0
0008f58e  str     r1, [sp, #4]
0008f590  ldr     r3, [r3]
0008f592  str     r7, [sp, #0x54]
0008f594  str.w   sp, [sp, #0x5c]
0008f598  str     r3, [sp, #0x4c]
0008f59a  ldr     r3, [pc, #0x148]
0008f59c  add     r3, pc ; -> 0x000ee3b4  GCC_except_table65
0008f59e  str     r3, [sp, #0x50]
0008f5a0  ldr     r3, [pc, #0x144]
0008f5a2  add     r3, pc ; -> 0x0008f6d2  
0008f5a4  orr     r3, r3, #1
0008f5a8  str     r3, [sp, #0x58]
0008f5aa  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008f5ae  ldr     r0, [sp, #4]
0008f5b0  ldr     r1, [sp, #4]
0008f5b2  ldr     r0, [r0, #4]
0008f5b4  str     r0, [sp, #0x28]
0008f5b6  ldr     r3, [r1]
0008f5b8  rsb     r3, r3, r0
0008f5bc  add     r0, sp, #0x68
0008f5be  asrs    r2, r3, #2
0008f5c0  asrs    r3, r3, #2
0008f5c2  str     r2, [sp, #0x10]
0008f5c4  str     r3, [sp, #0xc]
0008f5c6  bl      #0x8ac54 ; -> ZN6Mayhem4UserC1Ev
0008f5ca  ldr     r3, [sp, #8]
0008f5cc  ldr     r0, [sp, #8]
0008f5ce  ldr     r1, [sp, #0x10]
0008f5d0  ldr     r3, [r3, #8]
0008f5d2  str     r3, [sp, #0x18]
0008f5d4  ldr     r2, [r0, #4]
0008f5d6  subs    r3, r3, r2
0008f5d8  asrs    r3, r3, #3
0008f5da  cmp     r1, r3
0008f5dc  bhs     #0x8f6b8
0008f5de  lsls    r3, r1, #3
0008f5e0  adds    r2, r2, r3
0008f5e2  ldr     r3, [sp, #0x18]
0008f5e4  str     r2, [sp, #0x1c]
0008f5e6  cmp     r3, r2
0008f5e8  beq     #0x8f604
0008f5ea  str     r2, [sp, #0x30]
0008f5ec  ldr     r0, [sp, #0x30]
0008f5ee  ldr     r3, [r0]
0008f5f0  ldr     r2, [r3]
0008f5f2  movs    r3, #2
0008f5f4  str     r3, [sp, #0x38]
0008f5f6  blx     r2
0008f5f8  ldr     r1, [sp, #0x30]
0008f5fa  ldr     r2, [sp, #0x18]
0008f5fc  adds    r1, #8
0008f5fe  cmp     r2, r1
0008f600  str     r1, [sp, #0x30]
0008f602  bne     #0x8f5ec
0008f604  ldr     r0, [sp, #0x1c]
0008f606  ldr     r3, [sp, #8]
0008f608  str     r0, [r3, #8]
0008f60a  ldr     r2, [sp, #8]
0008f60c  ldr     r1, [sp, #0xc]
0008f60e  mov.w   r3, #-1
0008f612  adds    r2, #0x6c
0008f614  str     r3, [sp, #0x38]
0008f616  mov     r0, r2
0008f618  str     r2, [sp, #0x20]
0008f61a  bl      #0x9c76c ; -> ZNSt6vectorISsSaISsEE7reserveEm
0008f61e  ldr     r3, [sp, #4]
0008f620  ldr     r0, [sp, #0x28]
0008f622  ldr     r3, [r3]
0008f624  cmp     r0, r3
0008f626  str     r3, [sp, #0x2c]
0008f628  beq     #0x8f69e
0008f62a  ldr     r2, [pc, #0xc0]
0008f62c  mov     r1, r3
0008f62e  str     r3, [sp, #0x24]
0008f630  add     r2, pc ; -> 0x00379be4  ZN6Mayhem4User14s_userDatabaseE
0008f632  str     r2, [sp]
0008f634  b       #0x8f676
0008f636  cbz     r1, #0x8f644
0008f638  movs    r3, #1
0008f63a  mov     r0, r1
0008f63c  str     r3, [sp, #0x38]
0008f63e  ldr     r1, [sp, #0x24]
0008f640  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008f644  ldr     r1, [sp, #8]
0008f646  ldr     r3, [r1, #0x70]
0008f648  adds    r3, #4
0008f64a  str     r3, [r1, #0x70]
0008f64c  ldr     r3, [sp, #0x14]
0008f64e  cbz     r3, #0x8f66a
0008f650  ldr     r0, [sp, #8]
0008f652  ldr     r1, [sp, #0x24]
0008f654  ldr     r2, [r0, #4]
0008f656  ldr     r0, [sp, #0x2c]
0008f658  rsb     r3, r0, r1
0008f65c  ldr     r1, [sp, #0x14]
0008f65e  lsls    r3, r3, #1
0008f660  adds    r3, r3, r2
0008f662  str     r1, [r3, #4]
0008f664  ldr     r2, [sp, #0x10]
0008f666  subs    r2, #1
0008f668  str     r2, [sp, #0x10]
0008f66a  ldr     r3, [sp, #0x24]
0008f66c  ldr     r0, [sp, #0x28]
0008f66e  adds    r1, r3, #4
0008f670  cmp     r0, r1
0008f672  beq     #0x8f69e
0008f674  str     r1, [sp, #0x24]
0008f676  ldr     r0, [sp]
0008f678  mov.w   r3, #-1
0008f67c  str     r3, [sp, #0x38]
0008f67e  bl      #0x8f3dc ; -> ZN6Mayhem12UserDatabase11GetUserInfoERKSs
0008f682  str     r0, [sp, #0x14]
0008f684  ldr     r0, [sp, #8]
0008f686  ldr     r1, [r0, #0x70]
0008f688  ldr     r3, [r0, #0x74]
0008f68a  cmp     r1, r3
0008f68c  bne     #0x8f636
0008f68e  mov.w   r2, #-1
0008f692  ldr     r0, [sp, #0x20]
0008f694  str     r2, [sp, #0x38]
0008f696  ldr     r2, [sp, #0x24]
0008f698  bl      #0x9c28c ; -> ZNSt6vectorISsSaISsEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPSsS1_EERKSs
0008f69c  b       #0x8f64c
0008f69e  add     r0, sp, #0x34
0008f6a0  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008f6a4  ldr     r0, [sp, #0x10]
0008f6a6  sub.w   sp, r7, #0x58
0008f6aa  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008f6ae  sub.w   sp, r7, #0x18
0008f6b2  pop.w   {r8, sl, fp}
0008f6b6  pop     {r4, r5, r6, r7, pc}
0008f6b8  ldr     r1, [sp, #8]
0008f6ba  adds    r0, r1, #4
0008f6bc  ldr     r1, [sp, #0x10]
0008f6be  rsb     r2, r3, r1
0008f6c2  mov.w   r3, #-1
0008f6c6  ldr     r1, [sp, #0x18]
0008f6c8  str     r3, [sp, #0x38]
0008f6ca  add     r3, sp, #0x68
0008f6cc  bl      #0x9aec4 ; -> ZNSt6vectorIN6Mayhem4UserESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_
0008f6d0  b       #0x8f60a
0008f6d2  ldr     r0, [sp, #0x3c]
0008f6d4  mov.w   r3, #-1
0008f6d8  str     r3, [sp, #0x38]
0008f6da  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008f6de  nop     
0008f6e0  subs    r6, #0xa8
0008f6e2  movs    r6, r0
0008f6e4  cdp     p0, #1, c0, c4, c5, #0
0008f6e8  lsls    r4, r5, #4
0008f6ea  movs    r0, r0
0008f6ec  adr     r5, #0x2c0
0008f6ee  movs    r6, r5
