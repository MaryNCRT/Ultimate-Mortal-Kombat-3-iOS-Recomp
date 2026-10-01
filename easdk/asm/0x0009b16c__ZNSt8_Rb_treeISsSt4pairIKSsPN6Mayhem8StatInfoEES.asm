========================================================================
ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE9_M_insertEPSt18_Rb_tree_node_baseSD_RKS5_  0x0009b16c  308 bytes   Mayhem.mm
========================================================================

0009b16c  push    {r4, r5, r6, r7, lr}
0009b16e  add     r7, sp, #0xc
0009b170  push.w  {r8, sl, fp}
0009b174  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009b178  sub     sp, #0x60
0009b17a  str     r3, [sp, #4]
0009b17c  ldr     r3, [pc, #0x114]
0009b17e  str     r0, [sp, #0x10]
0009b180  add     r0, sp, #0x24
0009b182  add     r3, pc ; -> 0x000f3438  0x0
0009b184  str     r2, [sp, #8]
0009b186  ldr     r3, [r3]
0009b188  str     r1, [sp, #0xc]
0009b18a  str     r7, [sp, #0x44]
0009b18c  str.w   sp, [sp, #0x4c]
0009b190  str     r3, [sp, #0x3c]
0009b192  ldr     r3, [pc, #0x104]
0009b194  add     r3, pc ; -> 0x000ee1f4  GCC_except_table8
0009b196  str     r3, [sp, #0x40]
0009b198  ldr     r3, [pc, #0x100]
0009b19a  add     r3, pc ; -> 0x0009b260  
0009b19c  orr     r3, r3, #1
0009b1a0  str     r3, [sp, #0x48]
0009b1a2  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009b1a6  ldr     r2, [sp, #0xc]
0009b1a8  cmp     r2, #0
0009b1aa  beq     #0x9b20a
0009b1ac  movs    r3, #1
0009b1ae  str     r3, [sp, #0x14]
0009b1b0  movs    r0, #0x18
0009b1b2  mov.w   r3, #-1
0009b1b6  str     r3, [sp, #0x28]
0009b1b8  blx     #0xdd5c0 ; -> Znwm
0009b1bc  str     r0, [sp, #0x18]
0009b1be  adds    r0, #0x10
0009b1c0  beq     #0x9b1d4
0009b1c2  movs    r3, #1
0009b1c4  ldr     r1, [sp, #4]
0009b1c6  str     r3, [sp, #0x28]
0009b1c8  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009b1cc  ldr     r2, [sp, #4]
0009b1ce  ldr     r3, [r2, #4]
0009b1d0  ldr     r2, [sp, #0x18]
0009b1d2  str     r3, [r2, #0x14]
0009b1d4  ldr     r2, [sp, #0x10]
0009b1d6  ldr     r0, [sp, #0x14]
0009b1d8  ldr     r1, [sp, #0x18]
0009b1da  adds    r3, r2, #4
0009b1dc  mov.w   r2, #-1
0009b1e0  str     r2, [sp, #0x28]
0009b1e2  ldr     r2, [sp, #8]
0009b1e4  blx     #0xdd590 ; -> ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_
0009b1e8  ldr     r2, [sp, #0x10]
0009b1ea  add     r0, sp, #0x24
0009b1ec  ldr     r3, [r2, #0x14]
0009b1ee  adds    r3, #1
0009b1f0  str     r3, [r2, #0x14]
0009b1f2  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009b1f6  ldr     r0, [sp, #0x18]
0009b1f8  sub.w   sp, r7, #0x58
0009b1fc  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009b200  sub.w   sp, r7, #0x18
0009b204  pop.w   {r8, sl, fp}
0009b208  pop     {r4, r5, r6, r7, pc}
0009b20a  ldr     r2, [sp, #0x10]
0009b20c  adds    r3, r2, #4
0009b20e  ldr     r2, [sp, #8]
0009b210  cmp     r3, r2
0009b212  beq     #0x9b1ac
0009b214  mov     r1, r2
0009b216  ldr     r2, [sp, #4]
0009b218  ldr     r3, [r2]
0009b21a  ldr     r3, [r3, #-0xc]
0009b21e  str     r3, [sp, #0x20]
0009b220  str     r3, [sp, #0x5c]
0009b222  ldr     r3, [r1, #0x10]
0009b224  ldr     r2, [sp, #0x20]
0009b226  ldr     r3, [r3, #-0xc]
0009b22a  cmp     r2, r3
0009b22c  str     r3, [sp, #0x1c]
0009b22e  str     r3, [sp, #0x58]
0009b230  ldr     r3, [sp, #4]
0009b232  ite     hi
0009b234  addhi   r2, sp, #0x58
0009b236  addls   r2, sp, #0x5c
0009b238  ldr     r1, [r1, #0x10]
0009b23a  ldr     r0, [r3]
0009b23c  ldr     r2, [r2]
0009b23e  blx     #0xddb90 ; -> memcmp
0009b242  cbnz    r0, #0x9b24e
0009b244  ldr     r2, [sp, #0x20]
0009b246  ldr     r3, [sp, #0x1c]
0009b248  cmp     r2, r3
0009b24a  bls     #0x9b258
0009b24c  adds    r0, #1
0009b24e  cmp     r0, #0
0009b250  blt     #0x9b1ac
0009b252  movs    r2, #0
0009b254  str     r2, [sp, #0x14]
0009b256  b       #0x9b1b0
0009b258  it      lo
0009b25a  movlo.w r0, #-1
0009b25e  b       #0x9b24e
0009b260  ldr     r3, [sp, #0x2c]
0009b262  str     r3, [sp]
0009b264  ldr     r3, [sp, #0x28]
0009b266  cmp     r3, #1
0009b268  beq     #0x9b27e
0009b26a  ldr     r0, [sp]
0009b26c  blx     #0xdd5e4 ; -> cxa_begin_catch
0009b270  ldr     r0, [sp, #0x18]
0009b272  blx     #0xdd5a8 ; -> ZdlPv
0009b276  movs    r3, #2
0009b278  str     r3, [sp, #0x28]
0009b27a  blx     #0xdd5fc ; -> cxa_rethrow
0009b27e  movs    r3, #0
0009b280  str     r3, [sp, #0x28]
0009b282  blx     #0xdd5f0 ; -> cxa_end_catch
0009b286  ldr     r0, [sp]
0009b288  mov.w   r3, #-1
0009b28c  str     r3, [sp, #0x28]
0009b28e  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009b292  nop     
0009b294  strh    r2, [r6, #0x14]
0009b296  movs    r5, r0
0009b298  adds    r0, #0x5c
0009b29a  movs    r5, r0
0009b29c  lsls    r2, r0, #3
0009b29e  movs    r0, r0
