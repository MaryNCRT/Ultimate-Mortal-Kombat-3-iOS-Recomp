========================================================================
ZN6Mayhem22getMayhemVersionStringEv  0x0008d4c8  668 bytes   Mayhem.mm
========================================================================

0008d4c8  push    {r4, r5, r6, r7, lr}
0008d4ca  add     r7, sp, #0xc
0008d4cc  push.w  {r8, sl, fp}
0008d4d0  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008d4d4  sub     sp, #0x68
0008d4d6  ldr     r3, [pc, #0x264]
0008d4d8  str     r0, [sp]
0008d4da  add     r0, sp, #0x24
0008d4dc  add     r3, pc ; -> 0x000f3438  0x0
0008d4de  str     r7, [sp, #0x44]
0008d4e0  ldr     r3, [r3]
0008d4e2  str.w   sp, [sp, #0x4c]
0008d4e6  str     r3, [sp, #0x3c]
0008d4e8  ldr     r3, [pc, #0x254]
0008d4ea  add     r3, pc ; -> 0x000ee2ba  GCC_except_table36
0008d4ec  str     r3, [sp, #0x40]
0008d4ee  ldr     r3, [pc, #0x254]
0008d4f0  add     r3, pc ; -> 0x0008d646  
0008d4f2  orr     r3, r3, #1
0008d4f6  str     r3, [sp, #0x48]
0008d4f8  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008d4fc  ldr     r3, [pc, #0x248]
0008d4fe  ldr     r2, [sp]
0008d500  add     r3, pc ; -> 0x000f3370  0x0
0008d502  ldr     r3, [r3]
0008d504  str     r2, [sp, #0x1c]
0008d506  str     r3, [sp, #0x18]
0008d508  adds    r3, #0xc
0008d50a  str     r3, [r2]
0008d50c  movs    r3, #3
0008d50e  str     r3, [sp, #0x28]
0008d510  blx     #0xdd110 ; -> CFBundleGetMainBundle
0008d514  ldr     r1, [pc, #0x234]
0008d516  add     r1, pc ; -> 0x000f3434  0x0
0008d518  ldr     r1, [r1]
0008d51a  ldr     r1, [r1]
0008d51c  blx     #0xdd11c ; -> CFBundleGetValueForInfoDictionaryKey
0008d520  str     r0, [sp, #8]
0008d522  add     r0, sp, #0x5c
0008d524  bl      #0x8c02c ; -> ZN6Mayhem17getMayhemPlatformEv
0008d528  movs    r3, #2
0008d52a  ldr     r0, [sp]
0008d52c  str     r3, [sp, #0x28]
0008d52e  add     r1, sp, #0x5c
0008d530  blx     #0xdd518 ; -> ZNSs6assignERKSs
0008d534  ldr     r3, [sp, #0x5c]
0008d536  ldr     r4, [sp, #0x18]
0008d538  sub.w   r0, r3, #0xc
0008d53c  cmp     r4, r0
0008d53e  bne     #0x8d5d2
0008d540  ldr     r1, [pc, #0x20c]
0008d542  movs    r3, #3
0008d544  ldr     r0, [sp, #0x1c]
0008d546  add     r1, pc ; -> 0x00175c88  '_'
0008d548  str     r3, [sp, #0x28]
0008d54a  movs    r2, #1
0008d54c  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
0008d550  movs    r3, #3
0008d552  add     r0, sp, #0x58
0008d554  str     r3, [sp, #0x28]
0008d556  bl      #0x8bcd4 ; -> ZN6Mayhem22getMayhemGameNameShortEv
0008d55a  movs    r3, #1
0008d55c  ldr     r0, [sp, #0x1c]
0008d55e  str     r3, [sp, #0x28]
0008d560  add     r1, sp, #0x58
0008d562  blx     #0xdd500 ; -> ZNSs6appendERKSs
0008d566  ldr     r3, [sp, #0x58]
0008d568  ldr     r2, [sp, #0x18]
0008d56a  sub.w   r0, r3, #0xc
0008d56e  cmp     r2, r0
0008d570  bne     #0x8d5fe
0008d572  ldr     r1, [pc, #0x1e0]
0008d574  movs    r3, #3
0008d576  ldr     r0, [sp, #0x1c]
0008d578  add     r1, pc ; -> 0x00175c8c  '_'
0008d57a  str     r3, [sp, #0x28]
0008d57c  movs    r2, #1
0008d57e  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
0008d582  ldr     r3, [pc, #0x1d4]
0008d584  ldr     r0, [pc, #0x1d4]
0008d586  ldr     r1, [pc, #0x1d8]
0008d588  add     r3, pc ; -> 0x000fcf68  
0008d58a  add     r0, pc ; -> 0x000fdb5c  
0008d58c  ldr     r3, [r3]
0008d58e  add     r1, pc ; -> 0x000fcf58  
0008d590  ldr     r0, [r0]
0008d592  ldr     r1, [r1]
0008d594  str     r3, [sp, #4]
0008d596  movs    r3, #3
0008d598  str     r3, [sp, #0x28]
0008d59a  blx     #0xddbfc ; -> objc_msgSend
0008d59e  mov     r2, r0
0008d5a0  ldr     r1, [sp, #4]
0008d5a2  ldr     r0, [sp, #8]
0008d5a4  blx     #0xddbfc ; -> objc_msgSend
0008d5a8  str     r0, [sp, #0x20]
0008d5aa  blx     #0xdde0c ; -> strlen
0008d5ae  ldr     r1, [sp, #0x20]
0008d5b0  mov     r2, r0
0008d5b2  ldr     r0, [sp, #0x1c]
0008d5b4  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
0008d5b8  add     r0, sp, #0x24
0008d5ba  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008d5be  ldr     r0, [sp]
0008d5c0  sub.w   sp, r7, #0x58
0008d5c4  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008d5c8  sub.w   sp, r7, #0x18
0008d5cc  pop.w   {r8, sl, fp}
0008d5d0  pop     {r4, r5, r6, r7, pc}
0008d5d2  subs    r2, r3, #4
0008d5d4  ldr     r3, [r3, #-0x4]
0008d5d8  subs    r1, r3, #1
0008d5da  dmb     ish
0008d5de  mov     ip, r3
0008d5e0  ldrex   lr, [r2]
0008d5e4  cmp     lr, r3
0008d5e6  beq     #0x8d638
0008d5e8  cmp     lr, ip
0008d5ea  mov     r3, lr
0008d5ec  bne     #0x8d5d8
0008d5ee  cmp.w   lr, #0
0008d5f2  bgt     #0x8d540
0008d5f4  add.w   r1, sp, #0x67
0008d5f8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d5fc  b       #0x8d540
0008d5fe  subs    r2, r3, #4
0008d600  ldr     r3, [r3, #-0x4]
0008d604  subs    r1, r3, #1
0008d606  dmb     ish
0008d60a  mov     ip, r3
0008d60c  ldrex   r4, [r2]
0008d610  cmp     r4, r3
0008d612  beq     #0x8d628
0008d614  cmp     r4, ip
0008d616  mov     r3, r4
0008d618  bne     #0x8d604
0008d61a  cmp     r4, #0
0008d61c  bgt     #0x8d572
0008d61e  add.w   r1, sp, #0x65
0008d622  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d626  b       #0x8d572
0008d628  strex   lr, r1, [r2]
0008d62c  cmp.w   lr, #0
0008d630  bne     #0x8d60c
0008d632  dmb     ish
0008d636  b       #0x8d614
0008d638  strex   r4, r1, [r2]
0008d63c  cmp     r4, #0
0008d63e  bne     #0x8d5e0
0008d640  dmb     ish
0008d644  b       #0x8d5e8
0008d646  ldr     r3, [sp, #0x28]
0008d648  ldr     r0, [sp, #0x2c]
0008d64a  cmp     r3, #1
0008d64c  beq     #0x8d67e
0008d64e  cmp     r3, #2
0008d650  beq     #0x8d662
0008d652  ldr     r3, [sp, #0x58]
0008d654  ldr     r2, [sp, #0x18]
0008d656  str     r0, [sp, #0x10]
0008d658  sub.w   r0, r3, #0xc
0008d65c  cmp     r2, r0
0008d65e  bne     #0x8d690
0008d660  ldr     r0, [sp, #0x10]
0008d662  ldr     r2, [sp, #0x1c]
0008d664  str     r0, [sp, #0x14]
0008d666  ldr     r4, [sp, #0x18]
0008d668  ldr     r3, [r2]
0008d66a  sub.w   r0, r3, #0xc
0008d66e  cmp     r4, r0
0008d670  bne     #0x8d6b8
0008d672  ldr     r0, [sp, #0x14]
0008d674  mov.w   r3, #-1
0008d678  str     r3, [sp, #0x28]
0008d67a  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008d67e  ldr     r3, [sp, #0x5c]
0008d680  ldr     r2, [sp, #0x18]
0008d682  str     r0, [sp, #0xc]
0008d684  sub.w   r0, r3, #0xc
0008d688  cmp     r2, r0
0008d68a  bne     #0x8d6e4
0008d68c  ldr     r0, [sp, #0xc]
0008d68e  b       #0x8d662
0008d690  subs    r2, r3, #4
0008d692  ldr     r3, [r3, #-0x4]
0008d696  subs    r1, r3, #1
0008d698  dmb     ish
0008d69c  mov     ip, r3
0008d69e  ldrex   r4, [r2]
0008d6a2  cmp     r4, r3
0008d6a4  beq     #0x8d71c
0008d6a6  cmp     r4, ip
0008d6a8  mov     r3, r4
0008d6aa  bne     #0x8d696
0008d6ac  cmp     r4, #0
0008d6ae  bgt     #0x8d660
0008d6b0  add     r1, sp, #0x64
0008d6b2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d6b6  b       #0x8d660
0008d6b8  subs    r2, r3, #4
0008d6ba  ldr     r3, [r3, #-0x4]
0008d6be  subs    r1, r3, #1
0008d6c0  dmb     ish
0008d6c4  mov     ip, r3
0008d6c6  ldrex   lr, [r2]
0008d6ca  cmp     lr, r3
0008d6cc  beq     #0x8d70e
0008d6ce  cmp     lr, ip
0008d6d0  mov     r3, lr
0008d6d2  bne     #0x8d6be
0008d6d4  cmp.w   lr, #0
0008d6d8  bgt     #0x8d672
0008d6da  add.w   r1, sp, #0x63
0008d6de  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d6e2  b       #0x8d672
0008d6e4  subs    r2, r3, #4
0008d6e6  ldr     r3, [r3, #-0x4]
0008d6ea  subs    r1, r3, #1
0008d6ec  dmb     ish
0008d6f0  mov     ip, r3
0008d6f2  ldrex   r4, [r2]
0008d6f6  cmp     r4, r3
0008d6f8  beq     #0x8d72c
0008d6fa  cmp     r4, ip
0008d6fc  mov     r3, r4
0008d6fe  bne     #0x8d6ea
0008d700  cmp     r4, #0
0008d702  bgt     #0x8d68c
0008d704  add.w   r1, sp, #0x66
0008d708  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d70c  b       #0x8d68c
0008d70e  strex   r4, r1, [r2]
0008d712  cmp     r4, #0
0008d714  bne     #0x8d6c6
0008d716  dmb     ish
0008d71a  b       #0x8d6ce
0008d71c  strex   lr, r1, [r2]
0008d720  cmp.w   lr, #0
0008d724  bne     #0x8d69e
0008d726  dmb     ish
0008d72a  b       #0x8d6a6
0008d72c  strex   lr, r1, [r2]
0008d730  cmp.w   lr, #0
0008d734  bne     #0x8d6f2
0008d736  dmb     ish
0008d73a  b       #0x8d6fa
0008d73c  ldrsh   r0, [r3, r5]
0008d73e  movs    r6, r0
0008d740  lsrs    r4, r1, #0x17
0008d742  movs    r6, r0
0008d744  lsls    r2, r2, #5
0008d746  movs    r0, r0
0008d748  ldrsh   r4, [r5, r1]
0008d74a  movs    r6, r0
0008d74c  ldrsh   r2, [r3, r4]
0008d74e  movs    r6, r0
0008d750  strh    r6, [r7, #0x38]
0008d752  movs    r6, r1
0008d754  strh    r0, [r2, #0x38]
0008d756  movs    r6, r1
