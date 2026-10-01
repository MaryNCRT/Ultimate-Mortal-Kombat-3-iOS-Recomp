========================================================================
ZN6Mayhem12StatDatabaseD2Ev  0x000943ac  728 bytes   Mayhem.mm
========================================================================

000943ac  push    {r4, r5, r6, r7, lr}
000943ae  add     r7, sp, #0xc
000943b0  push.w  {r8, sl, fp}
000943b4  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
000943b8  sub     sp, #0x54
000943ba  ldr     r3, [pc, #0x2b8]
000943bc  str     r0, [sp]
000943be  add     r0, sp, #0x18
000943c0  add     r3, pc ; -> 0x000f3438  0x0
000943c2  str     r7, [sp, #0x38]
000943c4  ldr     r3, [r3]
000943c6  str.w   sp, [sp, #0x40]
000943ca  str     r3, [sp, #0x30]
000943cc  ldr     r3, [pc, #0x2a8]
000943ce  add     r3, pc ; -> 0x000ee4a8  GCC_except_table88
000943d0  str     r3, [sp, #0x34]
000943d2  ldr     r3, [pc, #0x2a8]
000943d4  add     r3, pc ; -> 0x0009464a  
000943d6  orr     r3, r3, #1
000943da  str     r3, [sp, #0x3c]
000943dc  blx     #0xdd4ac ; -> Unwind_SjLj_Register
000943e0  ldr     r2, [sp]
000943e2  adds    r4, r2, #4
000943e4  ldr     r3, [r2, #0xc]
000943e6  str     r4, [sp, #0x10]
000943e8  cmp     r4, r3
000943ea  beq     #0x9447e
000943ec  str     r3, [sp, #0x14]
000943ee  b       #0x943f2
000943f0  mov     r3, r0
000943f2  ldr     r3, [r3, #0x14]
000943f4  str     r3, [sp, #8]
000943f6  cmp     r3, #0
000943f8  beq     #0x9446c
000943fa  ldr     r2, [r3, #0x20]
000943fc  ldr     r3, [pc, #0x280]
000943fe  sub.w   r0, r2, #0xc
00094402  add     r3, pc ; -> 0x000f3370  0x0
00094404  ldr     r3, [r3]
00094406  cmp     r0, r3
00094408  str     r3, [sp, #0xc]
0009440a  bne     #0x944a4
0009440c  ldr     r2, [sp, #8]
0009440e  ldr     r4, [sp, #0xc]
00094410  ldr     r3, [r2, #0x1c]
00094412  sub.w   r0, r3, #0xc
00094416  cmp     r4, r0
00094418  bne     #0x944d2
0009441a  ldr     r2, [sp, #8]
0009441c  ldr     r4, [sp, #0xc]
0009441e  ldr     r3, [r2, #0x14]
00094420  sub.w   r0, r3, #0xc
00094424  cmp     r4, r0
00094426  bne     #0x94500
00094428  ldr     r2, [sp, #8]
0009442a  ldr     r4, [sp, #0xc]
0009442c  ldr     r3, [r2, #0x10]
0009442e  sub.w   r0, r3, #0xc
00094432  cmp     r4, r0
00094434  bne     #0x9452c
00094436  ldr     r2, [sp, #8]
00094438  ldr     r4, [sp, #0xc]
0009443a  ldr     r3, [r2, #8]
0009443c  sub.w   r0, r3, #0xc
00094440  cmp     r4, r0
00094442  bne.w   #0x94558
00094446  ldr     r2, [sp, #8]
00094448  ldr     r4, [sp, #0xc]
0009444a  ldr     r3, [r2, #4]
0009444c  sub.w   r0, r3, #0xc
00094450  cmp     r4, r0
00094452  bne.w   #0x94586
00094456  ldr     r2, [sp, #8]
00094458  ldr     r4, [sp, #0xc]
0009445a  ldr     r3, [r2]
0009445c  sub.w   r0, r3, #0xc
00094460  cmp     r4, r0
00094462  bne.w   #0x945b4
00094466  ldr     r0, [sp, #8]
00094468  blx     #0xdd5a8 ; -> ZdlPv
0009446c  movs    r3, #3
0009446e  ldr     r0, [sp, #0x14]
00094470  str     r3, [sp, #0x1c]
00094472  blx     #0xdd56c ; -> ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base
00094476  ldr     r2, [sp, #0x10]
00094478  str     r0, [sp, #0x14]
0009447a  cmp     r2, r0
0009447c  bne     #0x943f0
0009447e  ldr     r4, [sp]
00094480  movs    r3, #1
00094482  ldr     r1, [r4, #8]
00094484  mov     r0, r4
00094486  str     r3, [sp, #0x1c]
00094488  bl      #0x9c060 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E
0009448c  add     r0, sp, #0x18
0009448e  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00094492  sub.w   sp, r7, #0x58
00094496  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009449a  sub.w   sp, r7, #0x18
0009449e  pop.w   {r8, sl, fp}
000944a2  pop     {r4, r5, r6, r7, pc}
000944a4  ldr     r3, [r2, #-0x4]
000944a8  subs    r1, r2, #4
000944aa  subs    r2, r3, #1
000944ac  dmb     ish
000944b0  mov     ip, r3
000944b2  ldrex   lr, [r1]
000944b6  cmp     lr, r3
000944b8  beq.w   #0x94600
000944bc  cmp     lr, ip
000944be  mov     r3, lr
000944c0  bne     #0x944aa
000944c2  cmp.w   lr, #0
000944c6  bgt     #0x9440c
000944c8  add.w   r1, sp, #0x53
000944cc  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000944d0  b       #0x9440c
000944d2  subs    r2, r3, #4
000944d4  ldr     r3, [r3, #-0x4]
000944d8  subs    r1, r3, #1
000944da  dmb     ish
000944de  mov     ip, r3
000944e0  ldrex   lr, [r2]
000944e4  cmp     lr, r3
000944e6  beq.w   #0x945f0
000944ea  cmp     lr, ip
000944ec  mov     r3, lr
000944ee  bne     #0x944d8
000944f0  cmp.w   lr, #0
000944f4  bgt     #0x9441a
000944f6  add.w   r1, sp, #0x52
000944fa  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000944fe  b       #0x9441a
00094500  subs    r2, r3, #4
00094502  ldr     r3, [r3, #-0x4]
00094506  subs    r1, r3, #1
00094508  dmb     ish
0009450c  mov     ip, r3
0009450e  ldrex   lr, [r2]
00094512  cmp     lr, r3
00094514  beq     #0x945e2
00094516  cmp     lr, ip
00094518  mov     r3, lr
0009451a  bne     #0x94506
0009451c  cmp.w   lr, #0
00094520  bgt     #0x94428
00094522  add.w   r1, sp, #0x51
00094526  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009452a  b       #0x94428
0009452c  subs    r2, r3, #4
0009452e  ldr     r3, [r3, #-0x4]
00094532  subs    r1, r3, #1
00094534  dmb     ish
00094538  mov     ip, r3
0009453a  ldrex   lr, [r2]
0009453e  cmp     lr, r3
00094540  beq     #0x9463a
00094542  cmp     lr, ip
00094544  mov     r3, lr
00094546  bne     #0x94532
00094548  cmp.w   lr, #0
0009454c  bgt.w   #0x94436
00094550  add     r1, sp, #0x50
00094552  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094556  b       #0x94436
00094558  subs    r2, r3, #4
0009455a  ldr     r3, [r3, #-0x4]
0009455e  subs    r1, r3, #1
00094560  dmb     ish
00094564  mov     ip, r3
00094566  ldrex   lr, [r2]
0009456a  cmp     lr, r3
0009456c  beq     #0x9462c
0009456e  cmp     lr, ip
00094570  mov     r3, lr
00094572  bne     #0x9455e
00094574  cmp.w   lr, #0
00094578  bgt.w   #0x94446
0009457c  add.w   r1, sp, #0x4f
00094580  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094584  b       #0x94446
00094586  subs    r2, r3, #4
00094588  ldr     r3, [r3, #-0x4]
0009458c  subs    r1, r3, #1
0009458e  dmb     ish
00094592  mov     ip, r3
00094594  ldrex   lr, [r2]
00094598  cmp     lr, r3
0009459a  beq     #0x9461e
0009459c  cmp     lr, ip
0009459e  mov     r3, lr
000945a0  bne     #0x9458c
000945a2  cmp.w   lr, #0
000945a6  bgt.w   #0x94456
000945aa  add.w   r1, sp, #0x4e
000945ae  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000945b2  b       #0x94456
000945b4  subs    r2, r3, #4
000945b6  ldr     r3, [r3, #-0x4]
000945ba  subs    r1, r3, #1
000945bc  dmb     ish
000945c0  mov     ip, r3
000945c2  ldrex   lr, [r2]
000945c6  cmp     lr, r3
000945c8  beq     #0x94610
000945ca  cmp     lr, ip
000945cc  mov     r3, lr
000945ce  bne     #0x945ba
000945d0  cmp.w   lr, #0
000945d4  bgt.w   #0x94466
000945d8  add.w   r1, sp, #0x4d
000945dc  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000945e0  b       #0x94466
000945e2  strex   r4, r1, [r2]
000945e6  cmp     r4, #0
000945e8  bne     #0x9450e
000945ea  dmb     ish
000945ee  b       #0x94516
000945f0  strex   r4, r1, [r2]
000945f4  cmp     r4, #0
000945f6  bne.w   #0x944e0
000945fa  dmb     ish
000945fe  b       #0x944ea
00094600  strex   r4, r2, [r1]
00094604  cmp     r4, #0
00094606  bne.w   #0x944b2
0009460a  dmb     ish
0009460e  b       #0x944bc
00094610  strex   r4, r1, [r2]
00094614  cmp     r4, #0
00094616  bne     #0x945c2
00094618  dmb     ish
0009461c  b       #0x945ca
0009461e  strex   r4, r1, [r2]
00094622  cmp     r4, #0
00094624  bne     #0x94594
00094626  dmb     ish
0009462a  b       #0x9459c
0009462c  strex   r4, r1, [r2]
00094630  cmp     r4, #0
00094632  bne     #0x94566
00094634  dmb     ish
00094638  b       #0x9456e
0009463a  strex   r4, r1, [r2]
0009463e  cmp     r4, #0
00094640  bne.w   #0x9453a
00094644  dmb     ish
00094648  b       #0x94542
0009464a  ldr     r3, [sp, #0x1c]
0009464c  ldr     r0, [sp, #0x20]
0009464e  cmp     r3, #1
00094650  beq     #0x94656
00094652  cmp     r3, #2
00094654  beq     #0x94660
00094656  mov.w   r3, #-1
0009465a  str     r3, [sp, #0x1c]
0009465c  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00094660  ldr     r3, [sp]
00094662  str     r0, [sp, #4]
00094664  ldr     r0, [sp]
00094666  ldr     r1, [r3, #8]
00094668  movs    r3, #2
0009466a  str     r3, [sp, #0x1c]
0009466c  bl      #0x9c060 ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE8_M_eraseEPSt13_Rb_tree_nodeIS5_E
00094670  ldr     r0, [sp, #4]
00094672  b       #0x94656
00094674  orns    r0, r4, #5
00094678  adr     r0, #0x358
0009467a  movs    r5, r0
0009467c  lsls    r2, r6, #9
0009467e  movs    r0, r0
00094680  vhadd.s32 d16, d10, d5
