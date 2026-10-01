========================================================================
ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE16_M_insert_uniqueERKS2_  0x0009bce4  232 bytes   Mayhem.mm
========================================================================

0009bce4  push    {r4, r5, r6, r7, lr}
0009bce6  add     r7, sp, #0xc
0009bce8  push.w  {r8, sl, fp}
0009bcec  sub     sp, #0x10
0009bcee  str     r2, [sp]
0009bcf0  ldr     r2, [r1, #8]
0009bcf2  mov     sl, r0
0009bcf4  mov     fp, r1
0009bcf6  add.w   r6, r1, #4
0009bcfa  cmp     r2, #0
0009bcfc  beq     #0x9bd8a
0009bcfe  ldr     r3, [sp]
0009bd00  mov     r6, r2
0009bd02  ldr.w   r8, [r3]
0009bd06  ldr     r5, [r8, #-0xc]
0009bd0a  mov     r0, r8
0009bd0c  str     r5, [sp, #8]
0009bd0e  ldr     r3, [r6, #0x10]
0009bd10  ldr     r4, [r3, #-0xc]
0009bd14  cmp     r5, r4
0009bd16  ite     hi
0009bd18  addhi   r2, sp, #0xc
0009bd1a  addls   r2, sp, #8
0009bd1c  str     r4, [sp, #0xc]
0009bd1e  ldr     r1, [r6, #0x10]
0009bd20  ldr     r2, [r2]
0009bd22  blx     #0xddb90 ; -> memcmp
0009bd26  cmp     r0, #0
0009bd28  beq     #0x9bd7e
0009bd2a  lsrs    r0, r0, #0x1f
0009bd2c  cbz     r0, #0x9bd36
0009bd2e  ldr     r3, [r6, #8]
0009bd30  cbz     r3, #0x9bd3c
0009bd32  mov     r6, r3
0009bd34  b       #0x9bd06
0009bd36  ldr     r3, [r6, #0xc]
0009bd38  cmp     r3, #0
0009bd3a  bne     #0x9bd32
0009bd3c  cmp     r0, #0
0009bd3e  bne     #0x9bd8a
0009bd40  str     r6, [sp, #4]
0009bd42  ldr     r3, [r6, #0x10]
0009bd44  mov     r1, r8
0009bd46  ldr     r5, [r3, #-0xc]
0009bd4a  str     r5, [sp, #0xc]
0009bd4c  ldr     r4, [r8, #-0xc]
0009bd50  cmp     r5, r4
0009bd52  ite     hi
0009bd54  addhi   r2, sp, #8
0009bd56  addls   r2, sp, #0xc
0009bd58  str     r4, [sp, #8]
0009bd5a  ldr     r0, [r6, #0x10]
0009bd5c  ldr     r2, [r2]
0009bd5e  blx     #0xddb90 ; -> memcmp
0009bd62  cmp     r0, #0
0009bd64  beq     #0x9bdaa
0009bd66  blt     #0x9bdb0
0009bd68  movs    r3, #0
0009bd6a  str.w   r6, [sl]
0009bd6e  strb.w  r3, [sl, #4]
0009bd72  mov     r0, sl
0009bd74  sub.w   sp, r7, #0x18
0009bd78  pop.w   {r8, sl, fp}
0009bd7c  pop     {r4, r5, r6, r7, pc}
0009bd7e  cmp     r5, r4
0009bd80  bhi     #0x9bd36
0009bd82  ite     hs
0009bd84  movhs   r0, #0
0009bd86  movlo   r0, #1
0009bd88  b       #0x9bd2c
0009bd8a  ldr.w   r3, [fp, #0xc]
0009bd8e  cmp     r3, r6
0009bd90  bne     #0x9bdb8
0009bd92  movs    r1, #0
0009bd94  mov     r0, fp
0009bd96  mov     r2, r6
0009bd98  ldr     r3, [sp]
0009bd9a  bl      #0x9bb48 ; -> ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE9_M_insertEPSt18_Rb_tree_node_baseSA_RKS2_
0009bd9e  movs    r3, #1
0009bda0  strb.w  r3, [sl, #4]
0009bda4  str.w   r0, [sl]
0009bda8  b       #0x9bd72
0009bdaa  cmp     r5, r4
0009bdac  bhi     #0x9bd68
0009bdae  bhs     #0x9bd68
0009bdb0  ldr     r2, [sp, #4]
0009bdb2  movs    r1, #0
0009bdb4  mov     r0, fp
0009bdb6  b       #0x9bd98
0009bdb8  mov     r0, r6
0009bdba  blx     #0xdd560 ; -> ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base
0009bdbe  ldr     r3, [sp]
0009bdc0  str     r6, [sp, #4]
0009bdc2  ldr.w   r8, [r3]
0009bdc6  mov     r6, r0
0009bdc8  b       #0x9bd42
0009bdca  nop     
