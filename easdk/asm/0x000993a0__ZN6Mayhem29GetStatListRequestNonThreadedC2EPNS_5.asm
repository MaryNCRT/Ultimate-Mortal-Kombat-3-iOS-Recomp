========================================================================
ZN6Mayhem29GetStatListRequestNonThreadedC2EPNS_5TokenERKSsRKSt6vectorISsSaISsEE  0x000993a0  196 bytes   Mayhem.mm
========================================================================

000993a0  push    {r4, r5, r6, r7, lr}
000993a2  add     r7, sp, #0xc
000993a4  push.w  {r8, sl, fp}
000993a8  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
000993ac  sub     sp, #0x48
000993ae  str     r3, [sp, #4]
000993b0  ldr     r3, [pc, #0x9c]
000993b2  str     r0, [sp, #0x10]
000993b4  add     r0, sp, #0x14
000993b6  add     r3, pc ; -> 0x000f3438  0x0
000993b8  str     r2, [sp, #8]
000993ba  ldr     r3, [r3]
000993bc  str     r1, [sp, #0xc]
000993be  str     r7, [sp, #0x34]
000993c0  str.w   sp, [sp, #0x3c]
000993c4  str     r3, [sp, #0x2c]
000993c6  ldr     r3, [pc, #0x8c]
000993c8  add     r3, pc ; -> 0x000ee5ac  GCC_except_table109
000993ca  str     r3, [sp, #0x30]
000993cc  ldr     r3, [pc, #0x88]
000993ce  add     r3, pc ; -> 0x00099434  
000993d0  orr     r3, r3, #1
000993d4  str     r3, [sp, #0x38]
000993d6  blx     #0xdd4ac ; -> Unwind_SjLj_Register
000993da  ldr     r0, [sp, #0x10]
000993dc  ldr     r1, [sp, #0xc]
000993de  mov.w   r3, #-1
000993e2  str     r3, [sp, #0x18]
000993e4  bl      #0x8cd60 ; -> ZN6Mayhem18GetStatListRequestC2EPNS_5TokenE
000993e8  ldr     r3, [pc, #0x70]
000993ea  ldr     r2, [sp, #0x10]
000993ec  ldr     r0, [pc, #0x70]
000993ee  add     r3, pc ; -> 0x0017da48  ZTVN6Mayhem29GetStatListRequestNonThreadedE
000993f0  adds    r3, #8
000993f2  add     r0, pc ; -> 0x0017f3d4  
000993f4  str     r3, [r2]
000993f6  movs    r3, #1
000993f8  str     r3, [sp, #0x18]
000993fa  blx     #0xdd3e0 ; -> NSLog
000993fe  ldr     r3, [sp, #0x10]
00099400  ldr     r1, [sp, #8]
00099402  add.w   r0, r3, #0x54
00099406  blx     #0xdd518 ; -> ZNSs6assignERKSs
0009940a  ldr     r2, [sp, #0x10]
0009940c  ldr     r1, [sp, #4]
0009940e  add.w   r0, r2, #0x5c
00099412  bl      #0x9c99c ; -> ZNSt6vectorISsSaISsEEaSERKS1_
00099416  ldr     r0, [sp, #0x10]
00099418  bl      #0x929bc ; -> ZN6Mayhem18GetStatListRequest3runEv
0009941c  add     r0, sp, #0x14
0009941e  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00099422  sub.w   sp, r7, #0x58
00099426  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009942a  sub.w   sp, r7, #0x18
0009942e  pop.w   {r8, sl, fp}
00099432  pop     {r4, r5, r6, r7, pc}
00099434  ldr     r3, [sp, #0x1c]
00099436  ldr     r0, [sp, #0x10]
00099438  str     r3, [sp]
0009943a  movs    r3, #0
0009943c  str     r3, [sp, #0x18]
0009943e  bl      #0x98f50 ; -> ZN6Mayhem18GetStatListRequestD2Ev
00099442  ldr     r0, [sp]
00099444  mov.w   r3, #-1
00099448  str     r3, [sp, #0x18]
0009944a  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009944e  nop     
00099450  adr     r0, #0x1f8
00099452  movs    r5, r0
00099454  str     r0, [r4, r7]
00099456  movs    r5, r0
00099458  lsls    r2, r4, #1
0009945a  movs    r0, r0
0009945c  mov     r6, sl
0009945e  movs    r6, r1
00099460  ldrsh   r6, [r3, r7]
00099462  movs    r6, r1
