========================================================================
ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_  0x0009b2a0  308 bytes   Mayhem.mm
========================================================================

0009b2a0  push    {r4, r5, r6, r7, lr}
0009b2a2  add     r7, sp, #0xc
0009b2a4  push.w  {r8, sl, fp}
0009b2a8  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009b2ac  sub     sp, #0x60
0009b2ae  str     r3, [sp, #4]
0009b2b0  ldr     r3, [pc, #0x114]
0009b2b2  str     r0, [sp, #0x10]
0009b2b4  add     r0, sp, #0x24
0009b2b6  add     r3, pc ; -> 0x000f3438  0x0
0009b2b8  str     r2, [sp, #8]
0009b2ba  ldr     r3, [r3]
0009b2bc  str     r1, [sp, #0xc]
0009b2be  str     r7, [sp, #0x44]
0009b2c0  str.w   sp, [sp, #0x4c]
0009b2c4  str     r3, [sp, #0x3c]
0009b2c6  ldr     r3, [pc, #0x104]
0009b2c8  add     r3, pc ; -> 0x000ee208  GCC_except_table9
0009b2ca  str     r3, [sp, #0x40]
0009b2cc  ldr     r3, [pc, #0x100]
0009b2ce  add     r3, pc ; -> 0x0009b394  
0009b2d0  orr     r3, r3, #1
0009b2d4  str     r3, [sp, #0x48]
0009b2d6  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009b2da  ldr     r2, [sp, #0xc]
0009b2dc  cmp     r2, #0
0009b2de  beq     #0x9b33e
0009b2e0  movs    r3, #1
0009b2e2  str     r3, [sp, #0x14]
0009b2e4  movs    r0, #0x18
0009b2e6  mov.w   r3, #-1
0009b2ea  str     r3, [sp, #0x28]
0009b2ec  blx     #0xdd5c0 ; -> Znwm
0009b2f0  str     r0, [sp, #0x18]
0009b2f2  adds    r0, #0x10
0009b2f4  beq     #0x9b308
0009b2f6  movs    r3, #1
0009b2f8  ldr     r1, [sp, #4]
0009b2fa  str     r3, [sp, #0x28]
0009b2fc  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009b300  ldr     r2, [sp, #4]
0009b302  ldr     r3, [r2, #4]
0009b304  ldr     r2, [sp, #0x18]
0009b306  str     r3, [r2, #0x14]
0009b308  ldr     r2, [sp, #0x10]
0009b30a  ldr     r0, [sp, #0x14]
0009b30c  ldr     r1, [sp, #0x18]
0009b30e  adds    r3, r2, #4
0009b310  mov.w   r2, #-1
0009b314  str     r2, [sp, #0x28]
0009b316  ldr     r2, [sp, #8]
0009b318  blx     #0xdd590 ; -> ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_
0009b31c  ldr     r2, [sp, #0x10]
0009b31e  add     r0, sp, #0x24
0009b320  ldr     r3, [r2, #0x14]
0009b322  adds    r3, #1
0009b324  str     r3, [r2, #0x14]
0009b326  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009b32a  ldr     r0, [sp, #0x18]
0009b32c  sub.w   sp, r7, #0x58
0009b330  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009b334  sub.w   sp, r7, #0x18
0009b338  pop.w   {r8, sl, fp}
0009b33c  pop     {r4, r5, r6, r7, pc}
0009b33e  ldr     r2, [sp, #0x10]
0009b340  adds    r3, r2, #4
0009b342  ldr     r2, [sp, #8]
0009b344  cmp     r3, r2
0009b346  beq     #0x9b2e0
0009b348  mov     r1, r2
0009b34a  ldr     r2, [sp, #4]
0009b34c  ldr     r3, [r2]
0009b34e  ldr     r3, [r3, #-0xc]
0009b352  str     r3, [sp, #0x20]
0009b354  str     r3, [sp, #0x5c]
0009b356  ldr     r3, [r1, #0x10]
0009b358  ldr     r2, [sp, #0x20]
0009b35a  ldr     r3, [r3, #-0xc]
0009b35e  cmp     r2, r3
0009b360  str     r3, [sp, #0x1c]
0009b362  str     r3, [sp, #0x58]
0009b364  ldr     r3, [sp, #4]
0009b366  ite     hi
0009b368  addhi   r2, sp, #0x58
0009b36a  addls   r2, sp, #0x5c
0009b36c  ldr     r1, [r1, #0x10]
0009b36e  ldr     r0, [r3]
0009b370  ldr     r2, [r2]
0009b372  blx     #0xddb90 ; -> memcmp
0009b376  cbnz    r0, #0x9b382
0009b378  ldr     r2, [sp, #0x20]
0009b37a  ldr     r3, [sp, #0x1c]
0009b37c  cmp     r2, r3
0009b37e  bls     #0x9b38c
0009b380  adds    r0, #1
0009b382  cmp     r0, #0
0009b384  blt     #0x9b2e0
0009b386  movs    r2, #0
0009b388  str     r2, [sp, #0x14]
0009b38a  b       #0x9b2e4
0009b38c  it      lo
0009b38e  movlo.w r0, #-1
0009b392  b       #0x9b382
0009b394  ldr     r3, [sp, #0x2c]
0009b396  str     r3, [sp]
0009b398  ldr     r3, [sp, #0x28]
0009b39a  cmp     r3, #1
0009b39c  beq     #0x9b3b2
0009b39e  ldr     r0, [sp]
0009b3a0  blx     #0xdd5e4 ; -> cxa_begin_catch
0009b3a4  ldr     r0, [sp, #0x18]
0009b3a6  blx     #0xdd5a8 ; -> ZdlPv
0009b3aa  movs    r3, #2
0009b3ac  str     r3, [sp, #0x28]
0009b3ae  blx     #0xdd5fc ; -> cxa_rethrow
0009b3b2  movs    r3, #0
0009b3b4  str     r3, [sp, #0x28]
0009b3b6  blx     #0xdd5f0 ; -> cxa_end_catch
0009b3ba  ldr     r0, [sp]
0009b3bc  mov.w   r3, #-1
0009b3c0  str     r3, [sp, #0x28]
0009b3c2  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009b3c6  nop     
0009b3c8  strh    r6, [r7, #0xa]
0009b3ca  movs    r5, r0
0009b3cc  cmp     r7, #0x3c
0009b3ce  movs    r5, r0
0009b3d0  lsls    r2, r0, #3
0009b3d2  movs    r0, r0
