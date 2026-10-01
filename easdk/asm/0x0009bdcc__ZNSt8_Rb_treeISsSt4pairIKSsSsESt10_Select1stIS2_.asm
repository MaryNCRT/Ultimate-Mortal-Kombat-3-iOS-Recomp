========================================================================
ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE16_M_insert_uniqueESt17_Rb_tree_iteratorIS2_ERKS2_  0x0009bdcc  456 bytes   Mayhem.mm
========================================================================

0009bdcc  push    {r4, r5, r6, r7, lr}
0009bdce  add     r7, sp, #0xc
0009bdd0  push.w  {r8, sl, fp}
0009bdd4  sub     sp, #0x18
0009bdd6  adds    r3, r0, #4
0009bdd8  cmp     r3, r1
0009bdda  str     r0, [sp, #4]
0009bddc  mov     fp, r1
0009bdde  str     r2, [sp]
0009bde0  mov     r8, r1
0009bde2  beq.w   #0x9befe
0009bde6  ldr     r2, [sp]
0009bde8  ldr     r6, [r2]
0009bdea  ldr     r5, [r6, #-0xc]
0009bdee  mov     r0, r6
0009bdf0  str     r5, [sp, #0x10]
0009bdf2  ldr     r3, [r1, #0x10]
0009bdf4  ldr     r4, [r3, #-0xc]
0009bdf8  cmp     r4, r5
0009bdfa  str     r4, [sp, #0x14]
0009bdfc  ldr.w   sl, [r1, #0x10]
0009be00  ite     lo
0009be02  addlo   r2, sp, #0x14
0009be04  addhs   r2, sp, #0x10
0009be06  mov     r1, sl
0009be08  ldr     r2, [r2]
0009be0a  blx     #0xddb90 ; -> memcmp
0009be0e  cmp     r0, #0
0009be10  bne     #0x9be74
0009be12  cmp     r4, r5
0009be14  blo     #0x9be76
0009be16  bls     #0x9be76
0009be18  ldr     r2, [sp, #4]
0009be1a  ldr     r3, [r2, #0xc]
0009be1c  cmp     r3, fp
0009be1e  it      eq
0009be20  moveq   r0, r2
0009be22  beq     #0x9beae
0009be24  mov     r0, fp
0009be26  blx     #0xdd560 ; -> ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base
0009be2a  ldr     r3, [r0, #0x10]
0009be2c  mov     r8, r0
0009be2e  ldr     r5, [r3, #-0xc]
0009be32  ldr     r3, [sp]
0009be34  str     r5, [sp, #0x14]
0009be36  ldr     r6, [r3]
0009be38  ldr     r4, [r6, #-0xc]
0009be3c  mov     r1, r6
0009be3e  cmp     r4, r5
0009be40  ite     lo
0009be42  addlo   r2, sp, #0x10
0009be44  addhs   r2, sp, #0x14
0009be46  str     r4, [sp, #0x10]
0009be48  ldr     r0, [r0, #0x10]
0009be4a  ldr     r2, [r2]
0009be4c  blx     #0xddb90 ; -> memcmp
0009be50  cmp     r0, #0
0009be52  bne     #0x9bea2
0009be54  cmp     r4, r5
0009be56  blo     #0x9be5a
0009be58  bhi     #0x9bea4
0009be5a  add     r0, sp, #8
0009be5c  ldr     r1, [sp, #4]
0009be5e  ldr     r2, [sp]
0009be60  bl      #0x9bce4 ; -> ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE16_M_insert_uniqueERKS2_
0009be64  ldr.w   r8, [sp, #8]
0009be68  mov     r0, r8
0009be6a  sub.w   sp, r7, #0x18
0009be6e  pop.w   {r8, sl, fp}
0009be72  pop     {r4, r5, r6, r7, pc}
0009be74  blt     #0x9be18
0009be76  ldr     r5, [sl, #-0xc]
0009be7a  mov     r1, r6
0009be7c  str     r5, [sp, #0x10]
0009be7e  ldr     r4, [r6, #-0xc]
0009be82  cmp     r4, r5
0009be84  ite     lo
0009be86  addlo   r2, sp, #0x14
0009be88  addhs   r2, sp, #0x10
0009be8a  str     r4, [sp, #0x14]
0009be8c  ldr.w   r0, [fp, #0x10]
0009be90  ldr     r2, [r2]
0009be92  blx     #0xddb90 ; -> memcmp
0009be96  cmp     r0, #0
0009be98  bne     #0x9bebc
0009be9a  cmp     r4, r5
0009be9c  blo     #0x9be68
0009be9e  bls     #0x9be68
0009bea0  b       #0x9bebe
0009bea2  bge     #0x9be5a
0009bea4  ldr.w   r1, [r8, #0xc]
0009bea8  cmp     r1, #0
0009beaa  beq     #0x9bf66
0009beac  ldr     r0, [sp, #4]
0009beae  mov     r1, fp
0009beb0  mov     r2, fp
0009beb2  ldr     r3, [sp]
0009beb4  bl      #0x9bb48 ; -> ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE9_M_insertEPSt18_Rb_tree_node_baseSA_RKS2_
0009beb8  mov     r8, r0
0009beba  b       #0x9be68
0009bebc  bge     #0x9be68
0009bebe  ldr     r2, [sp, #4]
0009bec0  ldr     r3, [r2, #0x10]
0009bec2  cmp     r3, fp
0009bec4  beq     #0x9bf74
0009bec6  mov     r0, fp
0009bec8  blx     #0xdd56c ; -> ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base
0009becc  ldr     r3, [sp]
0009bece  ldr     r6, [r3]
0009bed0  ldr     r5, [r6, #-0xc]
0009bed4  str     r5, [sp, #0x14]
0009bed6  ldr     r3, [r0, #0x10]
0009bed8  mov     r8, r0
0009beda  ldr     r4, [r3, #-0xc]
0009bede  cmp     r4, r5
0009bee0  ite     lo
0009bee2  addlo   r2, sp, #0x10
0009bee4  addhs   r2, sp, #0x14
0009bee6  str     r4, [sp, #0x10]
0009bee8  ldr     r1, [r0, #0x10]
0009beea  ldr     r2, [r2]
0009beec  mov     r0, r6
0009beee  blx     #0xddb90 ; -> memcmp
0009bef2  cmp     r0, #0
0009bef4  bne     #0x9bf48
0009bef6  cmp     r4, r5
0009bef8  blo     #0x9be5a
0009befa  bls     #0x9be5a
0009befc  b       #0x9bf4a
0009befe  ldr     r3, [r0, #0x14]
0009bf00  cmp     r3, #0
0009bf02  beq     #0x9be5a
0009bf04  ldr.w   r8, [r0, #0x10]
0009bf08  ldr.w   r3, [r8, #0x10]
0009bf0c  ldr     r5, [r3, #-0xc]
0009bf10  str     r5, [sp, #0x14]
0009bf12  ldr     r6, [r2]
0009bf14  ldr     r4, [r6, #-0xc]
0009bf18  mov     r1, r6
0009bf1a  cmp     r4, r5
0009bf1c  ite     lo
0009bf1e  addlo   r2, sp, #0x10
0009bf20  addhs   r2, sp, #0x14
0009bf22  str     r4, [sp, #0x10]
0009bf24  ldr.w   r0, [r8, #0x10]
0009bf28  ldr     r2, [r2]
0009bf2a  blx     #0xddb90 ; -> memcmp
0009bf2e  cmp     r0, #0
0009bf30  bne     #0x9bf60
0009bf32  cmp     r4, r5
0009bf34  blo     #0x9be5a
0009bf36  bls     #0x9be5a
0009bf38  mov     r2, r8
0009bf3a  ldr     r0, [sp, #4]
0009bf3c  movs    r1, #0
0009bf3e  ldr     r3, [sp]
0009bf40  bl      #0x9bb48 ; -> ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE9_M_insertEPSt18_Rb_tree_node_baseSA_RKS2_
0009bf44  mov     r8, r0
0009bf46  b       #0x9be68
0009bf48  bge     #0x9be5a
0009bf4a  ldr.w   r1, [fp, #0xc]
0009bf4e  cbz     r1, #0x9bf84
0009bf50  mov     r1, r8
0009bf52  mov     r2, r8
0009bf54  ldr     r0, [sp, #4]
0009bf56  ldr     r3, [sp]
0009bf58  bl      #0x9bb48 ; -> ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE9_M_insertEPSt18_Rb_tree_node_baseSA_RKS2_
0009bf5c  mov     r8, r0
0009bf5e  b       #0x9be68
0009bf60  bge.w   #0x9be5a
0009bf64  b       #0x9bf38
0009bf66  mov     r2, r8
0009bf68  ldr     r0, [sp, #4]
0009bf6a  ldr     r3, [sp]
0009bf6c  bl      #0x9bb48 ; -> ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE9_M_insertEPSt18_Rb_tree_node_baseSA_RKS2_
0009bf70  mov     r8, r0
0009bf72  b       #0x9be68
0009bf74  mov     r0, r2
0009bf76  movs    r1, #0
0009bf78  mov     r2, fp
0009bf7a  ldr     r3, [sp]
0009bf7c  bl      #0x9bb48 ; -> ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE9_M_insertEPSt18_Rb_tree_node_baseSA_RKS2_
0009bf80  mov     r8, r0
0009bf82  b       #0x9be68
0009bf84  ldr     r0, [sp, #4]
0009bf86  mov     r2, fp
0009bf88  ldr     r3, [sp]
0009bf8a  bl      #0x9bb48 ; -> ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE9_M_insertEPSt18_Rb_tree_node_baseSA_RKS2_
0009bf8e  mov     r8, r0
0009bf90  b       #0x9be68
0009bf92  nop     
