========================================================================
ZN6Mayhem29GetStatListRequestNonThreadedC2EPNS_5TokenERKSsiS4_ii  0x00099668  208 bytes   Mayhem.mm
========================================================================

00099668  push    {r4, r5, r6, r7, lr}
0009966a  add     r7, sp, #0xc
0009966c  push.w  {r8, sl, fp}
00099670  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00099674  sub     sp, #0x48
00099676  str     r3, [sp, #4]
00099678  ldr     r3, [pc, #0xa8]
0009967a  str     r0, [sp, #0x10]
0009967c  add     r0, sp, #0x14
0009967e  add     r3, pc ; -> 0x000f3438  0x0
00099680  str     r2, [sp, #8]
00099682  ldr     r3, [r3]
00099684  str     r1, [sp, #0xc]
00099686  str     r7, [sp, #0x34]
00099688  str.w   sp, [sp, #0x3c]
0009968c  str     r3, [sp, #0x2c]
0009968e  ldr     r3, [pc, #0x98]
00099690  add     r3, pc ; -> 0x000ee5bc  GCC_except_table111
00099692  str     r3, [sp, #0x30]
00099694  ldr     r3, [pc, #0x94]
00099696  add     r3, pc ; -> 0x0009970a  
00099698  orr     r3, r3, #1
0009969c  str     r3, [sp, #0x38]
0009969e  blx     #0xdd4ac ; -> Unwind_SjLj_Register
000996a2  ldr     r0, [sp, #0x10]
000996a4  ldr     r1, [sp, #0xc]
000996a6  mov.w   r3, #-1
000996aa  str     r3, [sp, #0x18]
000996ac  bl      #0x8cd60 ; -> ZN6Mayhem18GetStatListRequestC2EPNS_5TokenE
000996b0  ldr     r3, [pc, #0x7c]
000996b2  ldr     r2, [sp, #0x10]
000996b4  ldr     r0, [pc, #0x7c]
000996b6  add     r3, pc ; -> 0x0017da48  ZTVN6Mayhem29GetStatListRequestNonThreadedE
000996b8  adds    r3, #8
000996ba  add     r0, pc ; -> 0x0017f3e4  
000996bc  str     r3, [r2]
000996be  movs    r3, #1
000996c0  str     r3, [sp, #0x18]
000996c2  blx     #0xdd3e0 ; -> NSLog
000996c6  ldr     r3, [sp, #0x10]
000996c8  ldr     r1, [sp, #8]
000996ca  add.w   r0, r3, #0x54
000996ce  blx     #0xdd518 ; -> ZNSs6assignERKSs
000996d2  ldr     r2, [sp, #0x10]
000996d4  ldr     r3, [sp, #4]
000996d6  add.w   r0, r2, #0x7c
000996da  str     r3, [r2, #0x58]
000996dc  ldr     r1, [sp, #0xa8]
000996de  blx     #0xdd518 ; -> ZNSs6assignERKSs
000996e2  ldr     r3, [sp, #0xac]
000996e4  ldr     r2, [sp, #0x10]
000996e6  str     r3, [r2, #0x74]
000996e8  ldr     r3, [sp, #0xb0]
000996ea  str     r3, [r2, #0x78]
000996ec  ldr     r0, [sp, #0x10]
000996ee  bl      #0x929bc ; -> ZN6Mayhem18GetStatListRequest3runEv
000996f2  add     r0, sp, #0x14
000996f4  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
000996f8  sub.w   sp, r7, #0x58
000996fc  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00099700  sub.w   sp, r7, #0x18
00099704  pop.w   {r8, sl, fp}
00099708  pop     {r4, r5, r6, r7, pc}
0009970a  ldr     r3, [sp, #0x1c]
0009970c  ldr     r0, [sp, #0x10]
0009970e  str     r3, [sp]
00099710  movs    r3, #0
00099712  str     r3, [sp, #0x18]
00099714  bl      #0x98f50 ; -> ZN6Mayhem18GetStatListRequestD2Ev
00099718  ldr     r0, [sp]
0009971a  mov.w   r3, #-1
0009971e  str     r3, [sp, #0x18]
00099720  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00099724  ldr     r5, [sp, #0x2d8]
00099726  movs    r5, r0
00099728  ldr     r7, [pc, #0xa0]
0009972a  movs    r5, r0
0009972c  lsls    r0, r6, #1
0009972e  movs    r0, r0
00099730  bics    r6, r1
00099732  movs    r6, r1
00099734  ldrb    r6, [r4, r4]
00099736  movs    r6, r1
