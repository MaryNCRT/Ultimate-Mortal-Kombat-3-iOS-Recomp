========================================================================
ZNSt6vectorIN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEESaIS4_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS4_S6_EEmRKS4_  0x00081e24  1448 bytes   EASDK_Handler.mm
========================================================================

00081e24  push    {r4, r5, r6, r7, lr}
00081e26  add     r7, sp, #0xc
00081e28  push.w  {r8, sl, fp}
00081e2c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00081e30  sub     sp, #0xf8
00081e32  str     r3, [sp, #4]
00081e34  ldr.w   r3, [pc, #0x584]
00081e38  str     r0, [sp, #0xc]
00081e3a  add     r0, sp, #0xb8
00081e3c  add     r3, pc ; -> 0x000f301c  0x0
00081e3e  str     r2, [sp, #0xec]
00081e40  ldr     r3, [r3]
00081e42  str     r1, [sp, #8]
00081e44  str     r7, [sp, #0xd8]
00081e46  str.w   sp, [sp, #0xe0]
00081e4a  str     r3, [sp, #0xd0]
00081e4c  ldr.w   r3, [pc, #0x570]
00081e50  add     r3, pc ; -> 0x000ee0e8  GCC_except_table7
00081e52  str     r3, [sp, #0xd4]
00081e54  ldr.w   r3, [pc, #0x56c]
00081e58  add     r3, pc ; -> 0x000821b8  
00081e5a  orr     r3, r3, #1
00081e5e  str     r3, [sp, #0xdc]
00081e60  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00081e64  ldr     r0, [sp, #8]
00081e66  ldr     r2, [sp, #0xec]
00081e68  str     r0, [sp, #0x6c]
00081e6a  cmp     r2, #0
00081e6c  beq.w   #0x81f90
00081e70  ldr     r3, [sp, #0xc]
00081e72  ldr     r1, [r3, #4]
00081e74  ldr     r3, [r3, #8]
00081e76  subs    r3, r3, r1
00081e78  cmp.w   r2, r3, asr #2
00081e7c  bhi.w   #0x81fa8
00081e80  ldr     r1, [sp, #4]
00081e82  ldr     r0, [r1]
00081e84  str     r0, [sp, #0xf4]
00081e86  cbz     r0, #0x81e94
00081e88  ldr     r3, [r0]
00081e8a  ldr     r2, [r3, #0xc]
00081e8c  mov.w   r3, #-1
00081e90  str     r3, [sp, #0xbc]
00081e92  blx     r2
00081e94  ldr     r2, [sp, #0xc]
00081e96  ldr     r3, [sp, #0x6c]
00081e98  ldr     r1, [sp, #0xec]
00081e9a  ldr     r2, [r2, #4]
00081e9c  str     r3, [sp, #0x24]
00081e9e  rsb     r3, r3, r2
00081ea2  str     r2, [sp, #0x14]
00081ea4  asrs    r3, r3, #2
00081ea6  cmp     r3, r1
00081ea8  str     r3, [sp, #0x10]
00081eaa  bls.w   #0x82116
00081eae  lsls    r1, r1, #2
00081eb0  rsb     r1, r1, r2
00081eb4  cmp     r2, r1
00081eb6  str     r1, [sp, #0x30]
00081eb8  beq     #0x81eec
00081eba  str     r2, [sp, #0x80]
00081ebc  str     r2, [sp, #0xb4]
00081ebe  b       #0x81ec2
00081ec0  str     r0, [sp, #0xb4]
00081ec2  ldr     r0, [sp, #0x80]
00081ec4  cbz     r0, #0x81eda
00081ec6  ldr     r1, [sp, #0x30]
00081ec8  ldr     r2, [sp, #0x80]
00081eca  ldr     r0, [r1]
00081ecc  str     r0, [r2]
00081ece  cbz     r0, #0x81eda
00081ed0  ldr     r3, [r0]
00081ed2  ldr     r2, [r3, #0xc]
00081ed4  movs    r3, #7
00081ed6  str     r3, [sp, #0xbc]
00081ed8  blx     r2
00081eda  ldr     r3, [sp, #0x30]
00081edc  ldr     r0, [sp, #0x80]
00081ede  ldr     r1, [sp, #0x14]
00081ee0  adds    r3, #4
00081ee2  adds    r0, #4
00081ee4  cmp     r1, r3
00081ee6  str     r3, [sp, #0x30]
00081ee8  str     r0, [sp, #0x80]
00081eea  bne     #0x81ec0
00081eec  ldr     r3, [sp, #0xec]
00081eee  ldr     r0, [sp, #0xc]
00081ef0  lsls    r2, r3, #2
00081ef2  ldr     r3, [r0, #4]
00081ef4  adds    r3, r3, r2
00081ef6  str     r3, [r0, #4]
00081ef8  ldr     r1, [sp, #0x14]
00081efa  ldr     r0, [sp, #0x24]
00081efc  rsb     r2, r2, r1
00081f00  rsb     r3, r0, r2
00081f04  asrs    r3, r3, #2
00081f06  cmp     r3, #0
00081f08  str     r3, [sp, #0x38]
00081f0a  ble.w   #0x820d0
00081f0e  ldr     r3, [sp, #0x14]
00081f10  str     r2, [sp, #0x78]
00081f12  str     r3, [sp, #0x7c]
00081f14  b       #0x81f2e
00081f16  ldr     r1, [sp, #0x78]
00081f18  ldr     r2, [sp, #0x7c]
00081f1a  ldr     r3, [sp, #0x38]
00081f1c  subs    r1, #4
00081f1e  subs    r2, #4
00081f20  adds.w  r3, r3, #-1
00081f24  str     r1, [sp, #0x78]
00081f26  str     r2, [sp, #0x7c]
00081f28  str     r3, [sp, #0x38]
00081f2a  beq.w   #0x820d0
00081f2e  ldr     r0, [sp, #0x78]
00081f30  ldr     r0, [r0, #-0x4]
00081f34  str     r0, [sp, #0x70]
00081f36  cbz     r0, #0x81f42
00081f38  ldr     r3, [r0]
00081f3a  ldr     r2, [r3, #0xc]
00081f3c  movs    r3, #0xe
00081f3e  str     r3, [sp, #0xbc]
00081f40  blx     r2
00081f42  ldr     r1, [sp, #0x7c]
00081f44  ldr     r3, [sp, #0x70]
00081f46  ldr     r2, [sp, #0x7c]
00081f48  ldr     r1, [r1, #-0x4]
00081f4c  str     r1, [sp, #0xb0]
00081f4e  str     r3, [r2, #-0x4]
00081f52  cmp     r1, #0
00081f54  beq     #0x81f16
00081f56  ldr     r3, [r1]
00081f58  ldr     r0, [sp, #0xb0]
00081f5a  ldr     r2, [r3, #8]
00081f5c  movs    r3, #0xe
00081f5e  str     r3, [sp, #0xbc]
00081f60  blx     r2
00081f62  cmp     r0, #0
00081f64  beq     #0x81f16
00081f66  ldr     r0, [sp, #0xb0]
00081f68  ldr     r3, [r0]
00081f6a  ldr     r3, [r3, #4]
00081f6c  blx     r3
00081f6e  b       #0x81f16
00081f70  ldr     r0, [sp, #0xc]
00081f72  ldr     r0, [r0]
00081f74  str     r0, [sp, #0x6c]
00081f76  ldr     r0, [sp, #0x6c]
00081f78  cbz     r0, #0x81f7e
00081f7a  blx     #0xdd5a8 ; -> ZdlPv
00081f7e  ldr     r2, [sp, #0x9c]
00081f80  ldr     r1, [sp, #0xc]
00081f82  str     r2, [r1]
00081f84  ldr     r3, [sp, #0xa8]
00081f86  str     r3, [r1, #4]
00081f88  ldr     r0, [sp, #0x74]
00081f8a  add.w   r3, r2, r0
00081f8e  str     r3, [r1, #8]
00081f90  add     r0, sp, #0xb8
00081f92  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00081f96  sub.w   sp, r7, #0x58
00081f9a  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00081f9e  sub.w   sp, r7, #0x18
00081fa2  pop.w   {r8, sl, fp}
00081fa6  pop     {r4, r5, r6, r7, pc}
00081fa8  ldr     r0, [sp, #0xc]
00081faa  ldr     r3, [r0]
00081fac  rsb     r3, r3, r1
00081fb0  asrs    r1, r3, #2
00081fb2  mvn     r3, #0xc0000000
00081fb6  subs    r3, r3, r1
00081fb8  cmp     r3, r2
00081fba  str     r1, [sp, #0xf0]
00081fbc  blo.w   #0x821aa
00081fc0  cmp     r1, r2
00081fc2  ite     lo
00081fc4  addlo   r3, sp, #0xec
00081fc6  addhs   r3, sp, #0xf0
00081fc8  ldr     r3, [r3]
00081fca  adds    r3, r1, r3
00081fcc  itt     hs
00081fce  mvnhs   r1, #3
00081fd2  strhs   r1, [sp, #0x74]
00081fd4  blo.w   #0x8210a
00081fd8  ldr     r0, [sp, #0x74]
00081fda  mov.w   r3, #-1
00081fde  str     r3, [sp, #0xbc]
00081fe0  blx     #0xdd5c0 ; -> Znwm
00081fe4  ldr     r2, [sp, #0xc]
00081fe6  ldr     r3, [sp, #0x6c]
00081fe8  str     r0, [sp, #0x9c]
00081fea  str     r0, [sp, #0x48]
00081fec  str     r0, [sp, #0x1c]
00081fee  ldr     r2, [r2]
00081ff0  cmp     r3, r2
00081ff2  str     r2, [sp, #0x4c]
00081ff4  it      eq
00081ff6  streq   r0, [sp, #0x18]
00081ff8  beq     #0x8202e
00081ffa  ldr     r1, [sp, #0x9c]
00081ffc  ldr     r0, [sp, #0x9c]
00081ffe  str     r1, [sp, #0x18]
00082000  adds    r0, #4
00082002  str     r0, [sp, #0x94]
00082004  ldr     r2, [sp, #0x18]
00082006  cbz     r2, #0x8201a
00082008  ldr     r3, [sp, #0x4c]
0008200a  ldr     r0, [r3]
0008200c  str     r0, [r2]
0008200e  cbz     r0, #0x8201a
00082010  ldr     r3, [r0]
00082012  ldr     r2, [r3, #0xc]
00082014  movs    r3, #3
00082016  str     r3, [sp, #0xbc]
00082018  blx     r2
0008201a  ldr     r0, [sp, #0x4c]
0008201c  ldr     r1, [sp, #0x94]
0008201e  ldr     r3, [sp, #0x6c]
00082020  adds    r0, #4
00082022  adds    r2, r1, #4
00082024  cmp     r3, r0
00082026  str     r0, [sp, #0x4c]
00082028  str     r1, [sp, #0x18]
0008202a  str     r2, [sp, #0x94]
0008202c  bne     #0x82004
0008202e  ldr     r0, [sp, #0x18]
00082030  movs    r3, #0xc
00082032  ldr     r1, [sp, #0xec]
00082034  str     r3, [sp, #0xbc]
00082036  str     r0, [sp, #0x1c]
00082038  ldr     r2, [sp, #4]
0008203a  ldrb.w  r3, [sp, #0x57]
0008203e  bl      #0x81d34 ; -> ZSt26__uninitialized_fill_n_auxIPN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEEmS4_EvT_T0_RKT1_St12__false_type
00082042  ldr     r3, [sp, #0xec]
00082044  ldr     r1, [sp, #0xc]
00082046  ldr     r0, [sp, #0x1c]
00082048  ldr     r2, [sp, #0x6c]
0008204a  lsls    r3, r3, #2
0008204c  adds    r0, r0, r3
0008204e  str     r0, [sp, #0x1c]
00082050  ldr     r1, [r1, #4]
00082052  str     r0, [sp, #0xa8]
00082054  cmp     r2, r1
00082056  str     r1, [sp, #0x58]
00082058  beq     #0x8208e
0008205a  str     r2, [sp, #0x90]
0008205c  str     r0, [sp, #0xac]
0008205e  ldr     r3, [sp, #0xac]
00082060  cbz     r3, #0x82074
00082062  ldr     r1, [sp, #0x90]
00082064  ldr     r0, [r1]
00082066  str     r0, [r3]
00082068  cbz     r0, #0x82074
0008206a  ldr     r3, [r0]
0008206c  ldr     r2, [r3, #0xc]
0008206e  movs    r3, #1
00082070  str     r3, [sp, #0xbc]
00082072  blx     r2
00082074  ldr     r0, [sp, #0x90]
00082076  ldr     r3, [sp, #0xac]
00082078  ldr     r1, [sp, #0x58]
0008207a  adds    r0, #4
0008207c  adds    r3, #4
0008207e  cmp     r1, r0
00082080  str     r3, [sp, #0xac]
00082082  str     r0, [sp, #0x90]
00082084  bne     #0x8205e
00082086  ldr     r2, [sp, #0xc]
00082088  ldr     r2, [r2, #4]
0008208a  str     r3, [sp, #0xa8]
0008208c  str     r2, [sp, #0x6c]
0008208e  ldr     r0, [sp, #0xc]
00082090  ldr     r1, [sp, #0x6c]
00082092  ldr     r3, [r0]
00082094  cmp     r1, r3
00082096  it      ne
00082098  strne   r3, [sp, #0x8c]
0008209a  bne     #0x820ac
0008209c  b       #0x81f76
0008209e  ldr     r2, [sp, #0x8c]
000820a0  ldr     r3, [sp, #0x6c]
000820a2  adds    r2, #4
000820a4  cmp     r3, r2
000820a6  str     r2, [sp, #0x8c]
000820a8  beq.w   #0x81f70
000820ac  ldr     r0, [sp, #0x8c]
000820ae  ldr     r0, [r0]
000820b0  str     r0, [sp, #0x60]
000820b2  cmp     r0, #0
000820b4  beq     #0x8209e
000820b6  ldr     r3, [r0]
000820b8  ldr     r2, [r3, #8]
000820ba  movs    r3, #9
000820bc  str     r3, [sp, #0xbc]
000820be  blx     r2
000820c0  cmp     r0, #0
000820c2  beq     #0x8209e
000820c4  ldr     r1, [sp, #0x60]
000820c6  ldr     r3, [r1]
000820c8  mov     r0, r1
000820ca  ldr     r3, [r3, #4]
000820cc  blx     r3
000820ce  b       #0x8209e
000820d0  ldr     r1, [sp, #0xec]
000820d2  ldr     r0, [sp, #0x6c]
000820d4  movs    r3, #0xe
000820d6  add     r2, sp, #0xf4
000820d8  lsls    r1, r1, #2
000820da  add     r1, r0
000820dc  str     r3, [sp, #0xbc]
000820de  bl      #0x81ce4 ; -> ZSt4fillIPN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEES4_EvT_S6_RKT0_
000820e2  ldr     r0, [sp, #0xf4]
000820e4  str     r0, [sp, #0x2c]
000820e6  cmp     r0, #0
000820e8  beq.w   #0x81f90
000820ec  ldr     r3, [r0]
000820ee  ldr     r2, [r3, #8]
000820f0  mov.w   r3, #-1
000820f4  str     r3, [sp, #0xbc]
000820f6  blx     r2
000820f8  cmp     r0, #0
000820fa  beq.w   #0x81f90
000820fe  ldr     r1, [sp, #0x2c]
00082100  ldr     r3, [r1]
00082102  mov     r0, r1
00082104  ldr     r3, [r3, #4]
00082106  blx     r3
00082108  b       #0x81f90
0008210a  cmp.w   r3, #0x40000000
0008210e  bhs     #0x821a0
00082110  lsls    r3, r3, #2
00082112  str     r3, [sp, #0x74]
00082114  b       #0x81fd8
00082116  ldr     r2, [sp, #0x10]
00082118  movs    r3, #0xd
0008211a  ldr     r0, [sp, #0x14]
0008211c  subs    r1, r1, r2
0008211e  str     r3, [sp, #0xbc]
00082120  add     r2, sp, #0xf4
00082122  ldrb.w  r3, [sp, #0x3f]
00082126  bl      #0x81d34 ; -> ZSt26__uninitialized_fill_n_auxIPN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEEmS4_EvT_T0_RKT1_St12__false_type
0008212a  ldr     r1, [sp, #0xc]
0008212c  ldr     r3, [sp, #0xec]
0008212e  ldr     r0, [sp, #0x10]
00082130  ldr     r2, [r1, #4]
00082132  subs    r3, r3, r0
00082134  lsls    r3, r3, #2
00082136  adds    r3, r3, r2
00082138  str     r3, [sp, #0x44]
0008213a  str     r3, [r1, #4]
0008213c  ldr     r2, [sp, #0x6c]
0008213e  ldr     r3, [sp, #0x14]
00082140  cmp     r2, r3
00082142  beq     #0x82184
00082144  ldr     r0, [sp, #0x44]
00082146  movs    r1, #0
00082148  str     r1, [sp, #0x88]
0008214a  str     r0, [sp, #0x98]
0008214c  b       #0x82154
0008214e  ldr     r3, [sp, #0x44]
00082150  adds    r3, r3, r0
00082152  str     r3, [sp, #0x98]
00082154  ldr     r2, [sp, #0x44]
00082156  ldr     r0, [sp, #0x88]
00082158  add.w   r3, r2, r0
0008215c  cbz     r3, #0x82172
0008215e  ldr     r1, [sp, #0x6c]
00082160  ldr     r3, [sp, #0x88]
00082162  ldr     r0, [r0, r1]
00082164  str     r0, [r3, r2]
00082166  cbz     r0, #0x82172
00082168  ldr     r3, [r0]
0008216a  ldr     r2, [r3, #0xc]
0008216c  movs    r3, #5
0008216e  str     r3, [sp, #0xbc]
00082170  blx     r2
00082172  ldr     r0, [sp, #0x88]
00082174  ldr     r1, [sp, #0x6c]
00082176  ldr     r2, [sp, #0x14]
00082178  adds    r0, #4
0008217a  add.w   r3, r1, r0
0008217e  cmp     r2, r3
00082180  str     r0, [sp, #0x88]
00082182  bne     #0x8214e
00082184  ldr     r1, [sp, #0xc]
00082186  ldr     r0, [sp, #0x10]
00082188  ldr     r2, [r1, #4]
0008218a  lsls    r3, r0, #2
0008218c  add     r3, r2
0008218e  str     r3, [r1, #4]
00082190  ldr     r0, [sp, #0x6c]
00082192  movs    r3, #0xe
00082194  ldr     r1, [sp, #0x14]
00082196  str     r3, [sp, #0xbc]
00082198  add     r2, sp, #0xf4
0008219a  bl      #0x81ce4 ; -> ZSt4fillIPN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEES4_EvT_S6_RKT0_
0008219e  b       #0x820e2
000821a0  mov.w   r3, #-1
000821a4  str     r3, [sp, #0xbc]
000821a6  blx     #0xdd554 ; -> ZSt17__throw_bad_allocv
000821aa  ldr     r0, [pc, #0x21c]
000821ac  mov.w   r3, #-1
000821b0  str     r3, [sp, #0xbc]
000821b2  add     r0, pc ; -> 0x001757e8  'vector::_M_fill_insert'
000821b4  blx     #0xdd578 ; -> ZSt20__throw_length_errorPKc
000821b8  ldr     r3, [sp, #0xbc]
000821ba  ldr     r2, [sp, #0xc0]
000821bc  cmp     r3, #1
000821be  str     r2, [sp]
000821c0  beq     #0x8226c
000821c2  cmp     r3, #2
000821c4  beq.w   #0x8236c
000821c8  cmp     r3, #3
000821ca  beq     #0x8226c
000821cc  cmp     r3, #4
000821ce  beq.w   #0x82326
000821d2  cmp     r3, #5
000821d4  beq     #0x82232
000821d6  cmp     r3, #6
000821d8  beq.w   #0x822e4
000821dc  cmp     r3, #7
000821de  beq     #0x82232
000821e0  cmp     r3, #8
000821e2  beq     #0x822d8
000821e4  cmp     r3, #9
000821e6  beq     #0x822c4
000821e8  cmp     r3, #0xa
000821ea  beq     #0x822c4
000821ec  cmp     r3, #0xb
000821ee  beq     #0x82274
000821f0  cmp     r3, #0xc
000821f2  beq     #0x8223a
000821f4  cmp     r3, #0xd
000821f6  beq     #0x8223a
000821f8  ldr     r0, [sp]
000821fa  blx     #0xdd5e4 ; -> cxa_begin_catch
000821fe  ldr     r2, [sp, #0xac]
00082200  ldr     r3, [sp, #0xa8]
00082202  cmp     r2, r3
00082204  beq     #0x8222a
00082206  ldr     r0, [sp, #0xa8]
00082208  ldr     r0, [r0]
0008220a  str     r0, [sp, #0x5c]
0008220c  cbz     r0, #0x8221e
0008220e  ldr     r3, [r0]
00082210  ldr     r2, [r3, #8]
00082212  movs    r3, #2
00082214  str     r3, [sp, #0xbc]
00082216  blx     r2
00082218  cmp     r0, #0
0008221a  bne.w   #0x82360
0008221e  ldr     r2, [sp, #0xa8]
00082220  ldr     r3, [sp, #0xac]
00082222  adds    r2, #4
00082224  cmp     r3, r2
00082226  str     r2, [sp, #0xa8]
00082228  bne     #0x82206
0008222a  movs    r3, #2
0008222c  str     r3, [sp, #0xbc]
0008222e  blx     #0xdd5fc ; -> cxa_rethrow
00082232  movs    r3, #0
00082234  str     r3, [sp, #0xbc]
00082236  blx     #0xdd5f0 ; -> cxa_end_catch
0008223a  ldr     r0, [sp]
0008223c  ldr     r1, [sp, #0xf4]
0008223e  str     r0, [sp, #0x20]
00082240  str     r1, [sp, #0x28]
00082242  cbz     r1, #0x8225c
00082244  ldr     r3, [r1]
00082246  mov     r0, r1
00082248  ldr     r2, [r3, #8]
0008224a  movs    r3, #0
0008224c  str     r3, [sp, #0xbc]
0008224e  blx     r2
00082250  cbz     r0, #0x8225c
00082252  ldr     r2, [sp, #0x28]
00082254  ldr     r3, [r2]
00082256  mov     r0, r2
00082258  ldr     r3, [r3, #4]
0008225a  blx     r3
0008225c  ldr     r3, [sp, #0x20]
0008225e  str     r3, [sp]
00082260  ldr     r0, [sp]
00082262  mov.w   r3, #-1
00082266  str     r3, [sp, #0xbc]
00082268  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008226c  movs    r3, #0
0008226e  str     r3, [sp, #0xbc]
00082270  blx     #0xdd5f0 ; -> cxa_end_catch
00082274  ldr     r0, [sp]
00082276  blx     #0xdd5e4 ; -> cxa_begin_catch
0008227a  ldr     r1, [sp, #0x1c]
0008227c  ldr     r2, [sp, #0x9c]
0008227e  cmp     r2, r1
00082280  str     r1, [sp, #0x64]
00082282  beq     #0x822a8
00082284  str     r2, [sp, #0xa4]
00082286  ldr     r3, [sp, #0xa4]
00082288  ldr     r3, [r3]
0008228a  str     r3, [sp, #0x68]
0008228c  cbz     r3, #0x8229c
0008228e  ldr     r3, [r3]
00082290  ldr     r0, [sp, #0x68]
00082292  ldr     r2, [r3, #8]
00082294  movs    r3, #0xa
00082296  str     r3, [sp, #0xbc]
00082298  blx     r2
0008229a  cbnz    r0, #0x822ba
0008229c  ldr     r1, [sp, #0xa4]
0008229e  ldr     r2, [sp, #0x64]
000822a0  adds    r1, #4
000822a2  cmp     r2, r1
000822a4  str     r1, [sp, #0xa4]
000822a6  bne     #0x82286
000822a8  ldr     r3, [sp, #0x48]
000822aa  cbz     r3, #0x822b2
000822ac  ldr     r0, [sp, #0x9c]
000822ae  blx     #0xdd5a8 ; -> ZdlPv
000822b2  movs    r3, #0xb
000822b4  str     r3, [sp, #0xbc]
000822b6  blx     #0xdd5fc ; -> cxa_rethrow
000822ba  ldr     r0, [sp, #0x68]
000822bc  ldr     r3, [r0]
000822be  ldr     r3, [r3, #4]
000822c0  blx     r3
000822c2  b       #0x8229c
000822c4  movs    r3, #0
000822c6  str     r3, [sp, #0xbc]
000822c8  blx     #0xdd5f0 ; -> cxa_end_catch
000822cc  ldr     r0, [sp]
000822ce  mov.w   r3, #-1
000822d2  str     r3, [sp, #0xbc]
000822d4  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
000822d8  ldr     r0, [sp]
000822da  mov.w   r3, #-1
000822de  str     r3, [sp, #0xbc]
000822e0  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
000822e4  ldr     r0, [sp]
000822e6  blx     #0xdd5e4 ; -> cxa_begin_catch
000822ea  ldr     r1, [sp, #0x14]
000822ec  ldr     r2, [sp, #0xb4]
000822ee  cmp     r1, r2
000822f0  beq     #0x82314
000822f2  ldr     r3, [sp, #0x14]
000822f4  ldr     r3, [r3]
000822f6  str     r3, [sp, #0x34]
000822f8  cbz     r3, #0x82308
000822fa  ldr     r3, [r3]
000822fc  ldr     r0, [sp, #0x34]
000822fe  ldr     r2, [r3, #8]
00082300  movs    r3, #8
00082302  str     r3, [sp, #0xbc]
00082304  blx     r2
00082306  cbnz    r0, #0x8231c
00082308  ldr     r1, [sp, #0x14]
0008230a  ldr     r2, [sp, #0xb4]
0008230c  adds    r1, #4
0008230e  cmp     r1, r2
00082310  str     r1, [sp, #0x14]
00082312  bne     #0x822f2
00082314  movs    r3, #8
00082316  str     r3, [sp, #0xbc]
00082318  blx     #0xdd5fc ; -> cxa_rethrow
0008231c  ldr     r0, [sp, #0x34]
0008231e  ldr     r3, [r0]
00082320  ldr     r3, [r3, #4]
00082322  blx     r3
00082324  b       #0x82308
00082326  ldr     r0, [sp]
00082328  blx     #0xdd5e4 ; -> cxa_begin_catch
0008232c  ldr     r2, [sp, #0x44]
0008232e  ldr     r3, [sp, #0x98]
00082330  cmp     r2, r3
00082332  beq     #0x82358
00082334  str     r2, [sp, #0x84]
00082336  ldr     r0, [sp, #0x84]
00082338  ldr     r0, [r0]
0008233a  str     r0, [sp, #0x40]
0008233c  cbz     r0, #0x8234c
0008233e  ldr     r3, [r0]
00082340  ldr     r2, [r3, #8]
00082342  movs    r3, #6
00082344  str     r3, [sp, #0xbc]
00082346  blx     r2
00082348  cmp     r0, #0
0008234a  bne     #0x823a6
0008234c  ldr     r2, [sp, #0x84]
0008234e  ldr     r3, [sp, #0x98]
00082350  adds    r2, #4
00082352  cmp     r2, r3
00082354  str     r2, [sp, #0x84]
00082356  bne     #0x82336
00082358  movs    r3, #6
0008235a  str     r3, [sp, #0xbc]
0008235c  blx     #0xdd5fc ; -> cxa_rethrow
00082360  ldr     r1, [sp, #0x5c]
00082362  ldr     r3, [r1]
00082364  mov     r0, r1
00082366  ldr     r3, [r3, #4]
00082368  blx     r3
0008236a  b       #0x8221e
0008236c  ldr     r0, [sp]
0008236e  blx     #0xdd5e4 ; -> cxa_begin_catch
00082372  ldr     r1, [sp, #0x18]
00082374  ldr     r2, [sp, #0x9c]
00082376  cmp     r1, r2
00082378  beq     #0x8239e
0008237a  str     r2, [sp, #0xa0]
0008237c  ldr     r3, [sp, #0xa0]
0008237e  ldr     r3, [r3]
00082380  str     r3, [sp, #0x50]
00082382  cbz     r3, #0x82392
00082384  ldr     r3, [r3]
00082386  ldr     r0, [sp, #0x50]
00082388  ldr     r2, [r3, #8]
0008238a  movs    r3, #4
0008238c  str     r3, [sp, #0xbc]
0008238e  blx     r2
00082390  cbnz    r0, #0x823b2
00082392  ldr     r1, [sp, #0xa0]
00082394  ldr     r2, [sp, #0x18]
00082396  adds    r1, #4
00082398  cmp     r2, r1
0008239a  str     r1, [sp, #0xa0]
0008239c  bne     #0x8237c
0008239e  movs    r3, #4
000823a0  str     r3, [sp, #0xbc]
000823a2  blx     #0xdd5fc ; -> cxa_rethrow
000823a6  ldr     r1, [sp, #0x40]
000823a8  ldr     r3, [r1]
000823aa  mov     r0, r1
000823ac  ldr     r3, [r3, #4]
000823ae  blx     r3
000823b0  b       #0x8234c
000823b2  ldr     r0, [sp, #0x50]
000823b4  ldr     r3, [r0]
000823b6  ldr     r3, [r3, #4]
000823b8  blx     r3
000823ba  b       #0x82392
000823bc  asrs    r4, r3, #7
000823be  movs    r7, r0
000823c0  stm     r2!, {r2, r4, r7}
000823c2  movs    r6, r0
000823c4  lsls    r4, r3, #0xd
000823c6  movs    r0, r0
000823c8  adds    r6, #0x32
000823ca  movs    r7, r1
