========================================================================
ZN6Mayhem15PostUserRequestC2ERKSs  0x0008dee4  460 bytes   Mayhem.mm
========================================================================

0008dee4  push    {r4, r5, r6, r7, lr}
0008dee6  add     r7, sp, #0xc
0008dee8  push.w  {r8, sl, fp}
0008deec  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008def0  sub     sp, #0x58
0008def2  ldr     r3, [pc, #0x1a4]
0008def4  str     r0, [sp, #8]
0008def6  add     r0, sp, #0x20
0008def8  add     r3, pc ; -> 0x000f3438  0x0
0008defa  str     r1, [sp, #4]
0008defc  ldr     r3, [r3]
0008defe  str     r7, [sp, #0x40]
0008df00  str.w   sp, [sp, #0x48]
0008df04  str     r3, [sp, #0x38]
0008df06  ldr     r3, [pc, #0x194]
0008df08  add     r3, pc ; -> 0x000ee2e2  GCC_except_table43
0008df0a  str     r3, [sp, #0x3c]
0008df0c  ldr     r3, [pc, #0x190]
0008df0e  add     r3, pc ; -> 0x0008df8c  
0008df10  orr     r3, r3, #1
0008df14  str     r3, [sp, #0x44]
0008df16  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008df1a  ldr     r0, [sp, #8]
0008df1c  mov.w   r3, #-1
0008df20  str     r3, [sp, #0x24]
0008df22  bl      #0x8d014 ; -> ZN6Mayhem11UserRequestC2Ev
0008df26  ldr     r1, [sp, #8]
0008df28  ldr     r3, [pc, #0x178]
0008df2a  add.w   r0, r1, #0x5c
0008df2e  add     r3, pc ; -> 0x0017db30  ZTVN6Mayhem15PostUserRequestE
0008df30  adds    r3, #8
0008df32  str     r3, [r1]
0008df34  ldr     r3, [pc, #0x170]
0008df36  add     r3, pc ; -> 0x0017db30  ZTVN6Mayhem15PostUserRequestE
0008df38  adds    r3, #0x28
0008df3a  str     r3, [r1, #8]
0008df3c  ldr     r3, [pc, #0x16c]
0008df3e  add     r3, pc ; -> 0x000f3370  0x0
0008df40  ldr     r3, [r3]
0008df42  add.w   r2, r3, #0xc
0008df46  str     r3, [sp, #0x18]
0008df48  str     r2, [sp, #0x1c]
0008df4a  str     r2, [r1, #0x58]
0008df4c  movs    r3, #2
0008df4e  ldr     r1, [sp, #4]
0008df50  str     r3, [sp, #0x24]
0008df52  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008df56  ldr     r1, [sp, #8]
0008df58  mov.w   r3, #-1
0008df5c  mov.w   r4, #-1
0008df60  add.w   r0, r1, #8
0008df64  str     r3, [r1, #0x60]
0008df66  str     r4, [r1, #0x64]
0008df68  ldr     r2, [sp, #0x1c]
0008df6a  movs    r3, #1
0008df6c  str     r2, [r1, #0x68]
0008df6e  str     r3, [sp, #0x24]
0008df70  bl      #0x8b6b8 ; -> ZN6Mayhem12MayhemThread5startEv
0008df74  add     r0, sp, #0x20
0008df76  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008df7a  sub.w   sp, r7, #0x58
0008df7e  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008df82  sub.w   sp, r7, #0x18
0008df86  pop.w   {r8, sl, fp}
0008df8a  pop     {r4, r5, r6, r7, pc}
0008df8c  ldr     r3, [sp, #0x28]
0008df8e  str     r3, [sp]
0008df90  ldr     r3, [sp, #0x24]
0008df92  cmp     r3, #1
0008df94  beq     #0x8dfbe
0008df96  ldr     r4, [sp]
0008df98  ldr     r1, [sp, #8]
0008df9a  ldr     r2, [sp, #0x18]
0008df9c  str     r4, [sp, #0xc]
0008df9e  ldr     r3, [r1, #0x68]
0008dfa0  sub.w   r0, r3, #0xc
0008dfa4  cmp     r2, r0
0008dfa6  bne     #0x8e016
0008dfa8  ldr     r1, [sp, #0xc]
0008dfaa  ldr     r2, [sp, #8]
0008dfac  ldr     r4, [sp, #0x18]
0008dfae  str     r1, [sp, #0x10]
0008dfb0  ldr     r3, [r2, #0x5c]
0008dfb2  sub.w   r0, r3, #0xc
0008dfb6  cmp     r4, r0
0008dfb8  bne     #0x8dfea
0008dfba  ldr     r1, [sp, #0x10]
0008dfbc  str     r1, [sp]
0008dfbe  ldr     r2, [sp]
0008dfc0  ldr     r4, [sp, #8]
0008dfc2  ldr     r1, [sp, #0x18]
0008dfc4  str     r2, [sp, #0x14]
0008dfc6  ldr     r3, [r4, #0x58]
0008dfc8  sub.w   r0, r3, #0xc
0008dfcc  cmp     r1, r0
0008dfce  bne     #0x8e040
0008dfd0  ldr     r1, [sp, #0x14]
0008dfd2  ldr     r0, [sp, #8]
0008dfd4  movs    r3, #0
0008dfd6  str     r3, [sp, #0x24]
0008dfd8  str     r1, [sp]
0008dfda  bl      #0x8c8d8 ; -> ZN6Mayhem11UserRequestD2Ev
0008dfde  ldr     r0, [sp]
0008dfe0  mov.w   r3, #-1
0008dfe4  str     r3, [sp, #0x24]
0008dfe6  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008dfea  subs    r2, r3, #4
0008dfec  ldr     r3, [r3, #-0x4]
0008dff0  subs    r1, r3, #1
0008dff2  dmb     ish
0008dff6  mov     ip, r3
0008dff8  ldrex   lr, [r2]
0008dffc  cmp     lr, r3
0008dffe  beq     #0x8e07a
0008e000  cmp     lr, ip
0008e002  mov     r3, lr
0008e004  bne     #0x8dff0
0008e006  cmp.w   lr, #0
0008e00a  bgt     #0x8dfba
0008e00c  add.w   r1, sp, #0x56
0008e010  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e014  b       #0x8dfba
0008e016  subs    r2, r3, #4
0008e018  ldr     r3, [r3, #-0x4]
0008e01c  subs    r1, r3, #1
0008e01e  dmb     ish
0008e022  mov     ip, r3
0008e024  ldrex   r4, [r2]
0008e028  cmp     r4, r3
0008e02a  beq     #0x8e06a
0008e02c  cmp     r4, ip
0008e02e  mov     r3, r4
0008e030  bne     #0x8e01c
0008e032  cmp     r4, #0
0008e034  bgt     #0x8dfa8
0008e036  add.w   r1, sp, #0x57
0008e03a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e03e  b       #0x8dfa8
0008e040  subs    r2, r3, #4
0008e042  ldr     r3, [r3, #-0x4]
0008e046  subs    r1, r3, #1
0008e048  dmb     ish
0008e04c  mov     ip, r3
0008e04e  ldrex   r4, [r2]
0008e052  cmp     r4, r3
0008e054  beq     #0x8e088
0008e056  cmp     r4, ip
0008e058  mov     r3, r4
0008e05a  bne     #0x8e046
0008e05c  cmp     r4, #0
0008e05e  bgt     #0x8dfd0
0008e060  add.w   r1, sp, #0x55
0008e064  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e068  b       #0x8dfd0
0008e06a  strex   lr, r1, [r2]
0008e06e  cmp.w   lr, #0
0008e072  bne     #0x8e024
0008e074  dmb     ish
0008e078  b       #0x8e02c
0008e07a  strex   r4, r1, [r2]
0008e07e  cmp     r4, #0
0008e080  bne     #0x8dff8
0008e082  dmb     ish
0008e086  b       #0x8e000
0008e088  strex   lr, r1, [r2]
0008e08c  cmp.w   lr, #0
0008e090  bne     #0x8e04e
0008e092  dmb     ish
0008e096  b       #0x8e056
0008e098  strb    r4, [r7, r4]
0008e09a  movs    r6, r0
0008e09c  lsls    r6, r2, #0xf
0008e09e  movs    r6, r0
0008e0a0  lsls    r2, r7, #1
0008e0a2  movs    r0, r0
