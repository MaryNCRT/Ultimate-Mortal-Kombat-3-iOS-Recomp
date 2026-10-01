========================================================================
ZN6Mayhem15PostUserRequestD0Ev  0x0008e4d4  636 bytes   Mayhem.mm
========================================================================

0008e4d4  push    {r4, r5, r6, r7, lr}
0008e4d6  add     r7, sp, #0xc
0008e4d8  push.w  {r8, sl, fp}
0008e4dc  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008e4e0  sub     sp, #0x58
0008e4e2  ldr     r3, [pc, #0x24c]
0008e4e4  str     r0, [sp, #4]
0008e4e6  add     r0, sp, #0x1c
0008e4e8  add     r3, pc ; -> 0x000f3438  0x0
0008e4ea  str     r7, [sp, #0x3c]
0008e4ec  ldr     r3, [r3]
0008e4ee  str.w   sp, [sp, #0x44]
0008e4f2  str     r3, [sp, #0x34]
0008e4f4  ldr     r3, [pc, #0x23c]
0008e4f6  add     r3, pc ; -> 0x000ee2fc  GCC_except_table47
0008e4f8  str     r3, [sp, #0x38]
0008e4fa  ldr     r3, [pc, #0x23c]
0008e4fc  add     r3, pc ; -> 0x0008e62c  
0008e4fe  orr     r3, r3, #1
0008e502  str     r3, [sp, #0x40]
0008e504  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008e508  ldr     r2, [sp, #4]
0008e50a  ldr     r3, [pc, #0x230]
0008e50c  add.w   r0, r2, #8
0008e510  add     r3, pc ; -> 0x0017db30  ZTVN6Mayhem15PostUserRequestE
0008e512  adds    r3, #8
0008e514  str     r3, [r2]
0008e516  ldr     r3, [pc, #0x228]
0008e518  add     r3, pc ; -> 0x0017db30  ZTVN6Mayhem15PostUserRequestE
0008e51a  adds    r3, #0x28
0008e51c  str     r3, [r2, #8]
0008e51e  movs    r3, #1
0008e520  str     r3, [sp, #0x20]
0008e522  bl      #0x8b6a8 ; -> ZN6Mayhem12MayhemThread4waitEv
0008e526  ldr     r3, [sp, #4]
0008e528  ldr     r2, [r3, #0x68]
0008e52a  ldr     r3, [pc, #0x218]
0008e52c  sub.w   r0, r2, #0xc
0008e530  add     r3, pc ; -> 0x000f3370  0x0
0008e532  ldr     r3, [r3]
0008e534  cmp     r0, r3
0008e536  str     r3, [sp, #0x18]
0008e538  bne     #0x8e580
0008e53a  ldr     r2, [sp, #4]
0008e53c  ldr     r4, [sp, #0x18]
0008e53e  ldr     r3, [r2, #0x5c]
0008e540  sub.w   r0, r3, #0xc
0008e544  cmp     r4, r0
0008e546  bne     #0x8e5d4
0008e548  ldr     r2, [sp, #4]
0008e54a  ldr     r4, [sp, #0x18]
0008e54c  ldr     r3, [r2, #0x58]
0008e54e  sub.w   r0, r3, #0xc
0008e552  cmp     r4, r0
0008e554  bne     #0x8e5aa
0008e556  ldr     r0, [sp, #4]
0008e558  mov.w   r3, #-1
0008e55c  str     r3, [sp, #0x20]
0008e55e  bl      #0x8c8d8 ; -> ZN6Mayhem11UserRequestD2Ev
0008e562  ldr     r0, [sp, #4]
0008e564  blx     #0xdd5a8 ; -> ZdlPv
0008e568  add     r0, sp, #0x1c
0008e56a  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008e56e  sub.w   sp, r7, #0x58
0008e572  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008e576  sub.w   sp, r7, #0x18
0008e57a  pop.w   {r8, sl, fp}
0008e57e  pop     {r4, r5, r6, r7, pc}
0008e580  ldr     r3, [r2, #-0x4]
0008e584  subs    r1, r2, #4
0008e586  subs    r2, r3, #1
0008e588  dmb     ish
0008e58c  mov     ip, r3
0008e58e  ldrex   r4, [r1]
0008e592  cmp     r4, r3
0008e594  beq     #0x8e61c
0008e596  cmp     r4, ip
0008e598  mov     r3, r4
0008e59a  bne     #0x8e586
0008e59c  cmp     r4, #0
0008e59e  bgt     #0x8e53a
0008e5a0  add.w   r1, sp, #0x56
0008e5a4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e5a8  b       #0x8e53a
0008e5aa  subs    r2, r3, #4
0008e5ac  ldr     r3, [r3, #-0x4]
0008e5b0  subs    r1, r3, #1
0008e5b2  dmb     ish
0008e5b6  mov     ip, r3
0008e5b8  ldrex   r4, [r2]
0008e5bc  cmp     r4, r3
0008e5be  beq     #0x8e60c
0008e5c0  cmp     r4, ip
0008e5c2  mov     r3, r4
0008e5c4  bne     #0x8e5b0
0008e5c6  cmp     r4, #0
0008e5c8  bgt     #0x8e556
0008e5ca  add.w   r1, sp, #0x52
0008e5ce  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e5d2  b       #0x8e556
0008e5d4  subs    r2, r3, #4
0008e5d6  ldr     r3, [r3, #-0x4]
0008e5da  subs    r1, r3, #1
0008e5dc  dmb     ish
0008e5e0  mov     ip, r3
0008e5e2  ldrex   r4, [r2]
0008e5e6  cmp     r4, r3
0008e5e8  beq     #0x8e5fc
0008e5ea  cmp     r4, ip
0008e5ec  mov     r3, r4
0008e5ee  bne     #0x8e5da
0008e5f0  cmp     r4, #0
0008e5f2  bgt     #0x8e548
0008e5f4  add     r1, sp, #0x54
0008e5f6  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e5fa  b       #0x8e548
0008e5fc  strex   lr, r1, [r2]
0008e600  cmp.w   lr, #0
0008e604  bne     #0x8e5e2
0008e606  dmb     ish
0008e60a  b       #0x8e5ea
0008e60c  strex   lr, r1, [r2]
0008e610  cmp.w   lr, #0
0008e614  bne     #0x8e5b8
0008e616  dmb     ish
0008e61a  b       #0x8e5c0
0008e61c  strex   lr, r2, [r1]
0008e620  cmp.w   lr, #0
0008e624  bne     #0x8e58e
0008e626  dmb     ish
0008e62a  b       #0x8e596
0008e62c  ldr     r3, [sp, #0x24]
0008e62e  ldr     r4, [sp, #4]
0008e630  str     r3, [sp, #8]
0008e632  ldr     r3, [pc, #0x114]
0008e634  ldr     r1, [r4, #0x68]
0008e636  add     r3, pc ; -> 0x000f3370  0x0
0008e638  sub.w   r0, r1, #0xc
0008e63c  ldr     r3, [r3]
0008e63e  cmp     r0, r3
0008e640  str     r3, [sp, #0x14]
0008e642  bne     #0x8e682
0008e644  ldr     r2, [sp, #8]
0008e646  ldr     r4, [sp, #4]
0008e648  str     r2, [sp, #0xc]
0008e64a  ldr     r3, [r4, #0x5c]
0008e64c  ldr     r2, [sp, #0x14]
0008e64e  sub.w   r0, r3, #0xc
0008e652  cmp     r2, r0
0008e654  bne     #0x8e6d8
0008e656  ldr     r2, [sp, #0xc]
0008e658  ldr     r4, [sp, #4]
0008e65a  str     r2, [sp, #0x10]
0008e65c  ldr     r3, [r4, #0x58]
0008e65e  ldr     r2, [sp, #0x14]
0008e660  sub.w   r0, r3, #0xc
0008e664  cmp     r2, r0
0008e666  bne     #0x8e6ae
0008e668  ldr     r2, [sp, #0x10]
0008e66a  ldr     r0, [sp, #4]
0008e66c  movs    r3, #0
0008e66e  str     r3, [sp, #0x20]
0008e670  str     r2, [sp]
0008e672  bl      #0x8c8d8 ; -> ZN6Mayhem11UserRequestD2Ev
0008e676  ldr     r0, [sp]
0008e678  mov.w   r3, #-1
0008e67c  str     r3, [sp, #0x20]
0008e67e  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008e682  ldr     r3, [r1, #-0x4]
0008e686  subs    r2, r1, #4
0008e688  subs    r1, r3, #1
0008e68a  dmb     ish
0008e68e  mov     ip, r3
0008e690  ldrex   lr, [r2]
0008e694  cmp     lr, r3
0008e696  beq     #0x8e712
0008e698  cmp     lr, ip
0008e69a  mov     r3, lr
0008e69c  bne     #0x8e688
0008e69e  cmp.w   lr, #0
0008e6a2  bgt     #0x8e644
0008e6a4  add.w   r1, sp, #0x57
0008e6a8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e6ac  b       #0x8e644
0008e6ae  subs    r2, r3, #4
0008e6b0  ldr     r3, [r3, #-0x4]
0008e6b4  subs    r1, r3, #1
0008e6b6  dmb     ish
0008e6ba  mov     ip, r3
0008e6bc  ldrex   r4, [r2]
0008e6c0  cmp     r4, r3
0008e6c2  beq     #0x8e702
0008e6c4  cmp     r4, ip
0008e6c6  mov     r3, r4
0008e6c8  bne     #0x8e6b4
0008e6ca  cmp     r4, #0
0008e6cc  bgt     #0x8e668
0008e6ce  add.w   r1, sp, #0x53
0008e6d2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e6d6  b       #0x8e668
0008e6d8  subs    r2, r3, #4
0008e6da  ldr     r3, [r3, #-0x4]
0008e6de  subs    r1, r3, #1
0008e6e0  dmb     ish
0008e6e4  mov     ip, r3
0008e6e6  ldrex   r4, [r2]
0008e6ea  cmp     r4, r3
0008e6ec  beq     #0x8e720
0008e6ee  cmp     r4, ip
0008e6f0  mov     r3, r4
0008e6f2  bne     #0x8e6de
0008e6f4  cmp     r4, #0
0008e6f6  bgt     #0x8e656
0008e6f8  add.w   r1, sp, #0x55
0008e6fc  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e700  b       #0x8e656
0008e702  strex   lr, r1, [r2]
0008e706  cmp.w   lr, #0
0008e70a  bne     #0x8e6bc
0008e70c  dmb     ish
0008e710  b       #0x8e6c4
0008e712  strex   r4, r1, [r2]
0008e716  cmp     r4, #0
0008e718  bne     #0x8e690
0008e71a  dmb     ish
0008e71e  b       #0x8e698
0008e720  strex   lr, r1, [r2]
0008e724  cmp.w   lr, #0
0008e728  bne     #0x8e6e6
0008e72a  dmb     ish
0008e72e  b       #0x8e6ee
0008e730  ldr     r7, [pc, #0x130]
0008e732  movs    r6, r0
0008e734  cdp2    p0, #0, c0, c2, c5, #0
0008e738  lsls    r4, r5, #4
0008e73a  movs    r0, r0
