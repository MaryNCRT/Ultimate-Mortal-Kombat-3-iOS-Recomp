========================================================================
ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE9_M_insertEPSt18_Rb_tree_node_baseSA_RKS2_  0x0009bb48  412 bytes   Mayhem.mm
========================================================================

0009bb48  push    {r4, r5, r6, r7, lr}
0009bb4a  add     r7, sp, #0xc
0009bb4c  push.w  {r8, sl, fp}
0009bb50  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009bb54  sub     sp, #0x6c
0009bb56  str     r3, [sp, #4]
0009bb58  ldr     r3, [pc, #0x178]
0009bb5a  str     r0, [sp, #0x10]
0009bb5c  add     r0, sp, #0x2c
0009bb5e  add     r3, pc ; -> 0x000f3438  0x0
0009bb60  str     r2, [sp, #8]
0009bb62  ldr     r3, [r3]
0009bb64  str     r1, [sp, #0xc]
0009bb66  str     r7, [sp, #0x4c]
0009bb68  str.w   sp, [sp, #0x54]
0009bb6c  str     r3, [sp, #0x44]
0009bb6e  ldr     r3, [pc, #0x168]
0009bb70  add     r3, pc ; -> 0x000ee25c  GCC_except_table18
0009bb72  str     r3, [sp, #0x48]
0009bb74  ldr     r3, [pc, #0x164]
0009bb76  add     r3, pc ; -> 0x0009bc4c  
0009bb78  orr     r3, r3, #1
0009bb7c  str     r3, [sp, #0x50]
0009bb7e  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009bb82  ldr     r2, [sp, #0xc]
0009bb84  cmp     r2, #0
0009bb86  beq     #0x9bbf4
0009bb88  movs    r4, #1
0009bb8a  str     r4, [sp, #0x14]
0009bb8c  movs    r0, #0x18
0009bb8e  mov.w   r3, #-1
0009bb92  str     r3, [sp, #0x30]
0009bb94  blx     #0xdd5c0 ; -> Znwm
0009bb98  adds.w  r3, r0, #0x10
0009bb9c  str     r0, [sp, #0x18]
0009bb9e  beq     #0x9bbc0
0009bba0  str     r3, [sp, #0x28]
0009bba2  ldr     r0, [sp, #0x28]
0009bba4  movs    r3, #2
0009bba6  ldr     r1, [sp, #4]
0009bba8  str     r3, [sp, #0x30]
0009bbaa  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009bbae  ldr     r3, [sp, #4]
0009bbb0  ldr     r2, [sp, #0x18]
0009bbb2  adds    r1, r3, #4
0009bbb4  add.w   r0, r2, #0x14
0009bbb8  movs    r3, #1
0009bbba  str     r3, [sp, #0x30]
0009bbbc  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009bbc0  ldr     r4, [sp, #0x10]
0009bbc2  ldr     r0, [sp, #0x14]
0009bbc4  ldr     r1, [sp, #0x18]
0009bbc6  adds    r3, r4, #4
0009bbc8  mov.w   r2, #-1
0009bbcc  str     r2, [sp, #0x30]
0009bbce  ldr     r2, [sp, #8]
0009bbd0  blx     #0xdd590 ; -> ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_
0009bbd4  ldr     r3, [r4, #0x14]
0009bbd6  add     r0, sp, #0x2c
0009bbd8  adds    r3, #1
0009bbda  str     r3, [r4, #0x14]
0009bbdc  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009bbe0  ldr     r0, [sp, #0x18]
0009bbe2  sub.w   sp, r7, #0x58
0009bbe6  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009bbea  sub.w   sp, r7, #0x18
0009bbee  pop.w   {r8, sl, fp}
0009bbf2  pop     {r4, r5, r6, r7, pc}
0009bbf4  ldr     r4, [sp, #0x10]
0009bbf6  ldr     r2, [sp, #8]
0009bbf8  adds    r3, r4, #4
0009bbfa  cmp     r3, r2
0009bbfc  beq     #0x9bb88
0009bbfe  ldr     r4, [sp, #4]
0009bc00  add.w   r1, r2, #0x10
0009bc04  ldr     r3, [r4]
0009bc06  ldr     r3, [r3, #-0xc]
0009bc0a  str     r3, [sp, #0x20]
0009bc0c  str     r3, [sp, #0x64]
0009bc0e  ldr     r3, [r2, #0x10]
0009bc10  ldr     r2, [sp, #0x20]
0009bc12  ldr     r3, [r3, #-0xc]
0009bc16  cmp     r2, r3
0009bc18  str     r3, [sp, #0x1c]
0009bc1a  str     r3, [sp, #0x60]
0009bc1c  ldr     r3, [sp, #4]
0009bc1e  ite     hi
0009bc20  addhi   r2, sp, #0x60
0009bc22  addls   r2, sp, #0x64
0009bc24  ldr     r1, [r1]
0009bc26  ldr     r2, [r2]
0009bc28  ldr     r0, [r3]
0009bc2a  blx     #0xddb90 ; -> memcmp
0009bc2e  cbnz    r0, #0x9bc3a
0009bc30  ldr     r4, [sp, #0x20]
0009bc32  ldr     r2, [sp, #0x1c]
0009bc34  cmp     r4, r2
0009bc36  bls     #0x9bc44
0009bc38  adds    r0, #1
0009bc3a  cmp     r0, #0
0009bc3c  blt     #0x9bb88
0009bc3e  movs    r3, #0
0009bc40  str     r3, [sp, #0x14]
0009bc42  b       #0x9bb8c
0009bc44  it      lo
0009bc46  movlo.w r0, #-1
0009bc4a  b       #0x9bc3a
0009bc4c  ldr     r3, [sp, #0x30]
0009bc4e  ldr     r4, [sp, #0x34]
0009bc50  cmp     r3, #1
0009bc52  str     r4, [sp]
0009bc54  beq     #0x9bc72
0009bc56  cmp     r3, #2
0009bc58  beq     #0x9bcb0
0009bc5a  ldr     r2, [sp, #0x28]
0009bc5c  ldr     r3, [pc, #0x80]
0009bc5e  str     r4, [sp, #0x24]
0009bc60  add     r3, pc ; -> 0x000f3370  0x0
0009bc62  ldr     r1, [r2]
0009bc64  ldr     r3, [r3]
0009bc66  sub.w   r0, r1, #0xc
0009bc6a  cmp     r0, r3
0009bc6c  bne     #0x9bc86
0009bc6e  ldr     r2, [sp, #0x24]
0009bc70  str     r2, [sp]
0009bc72  ldr     r0, [sp]
0009bc74  blx     #0xdd5e4 ; -> cxa_begin_catch
0009bc78  ldr     r0, [sp, #0x18]
0009bc7a  blx     #0xdd5a8 ; -> ZdlPv
0009bc7e  movs    r3, #3
0009bc80  str     r3, [sp, #0x30]
0009bc82  blx     #0xdd5fc ; -> cxa_rethrow
0009bc86  ldr     r3, [r1, #-0x4]
0009bc8a  subs    r2, r1, #4
0009bc8c  subs    r1, r3, #1
0009bc8e  dmb     ish
0009bc92  mov     ip, r3
0009bc94  ldrex   r4, [r2]
0009bc98  cmp     r4, r3
0009bc9a  beq     #0x9bcc4
0009bc9c  cmp     r4, ip
0009bc9e  mov     r3, r4
0009bca0  bne     #0x9bc8c
0009bca2  cmp     r4, #0
0009bca4  bgt     #0x9bc6e
0009bca6  add.w   r1, sp, #0x6b
0009bcaa  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009bcae  b       #0x9bc6e
0009bcb0  movs    r3, #0
0009bcb2  str     r3, [sp, #0x30]
0009bcb4  blx     #0xdd5f0 ; -> cxa_end_catch
0009bcb8  ldr     r0, [sp]
0009bcba  mov.w   r3, #-1
0009bcbe  str     r3, [sp, #0x30]
0009bcc0  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009bcc4  strex   lr, r1, [r2]
0009bcc8  cmp.w   lr, #0
0009bccc  bne     #0x9bc94
0009bcce  dmb     ish
0009bcd2  b       #0x9bc9c
0009bcd4  ldrb    r6, [r2, #3]
0009bcd6  movs    r5, r0
0009bcd8  movs    r6, #0xe8
0009bcda  movs    r5, r0
0009bcdc  lsls    r2, r2, #3
0009bcde  movs    r0, r0
0009bce0  strb    r4, [r1, #0x1c]
0009bce2  movs    r5, r0
