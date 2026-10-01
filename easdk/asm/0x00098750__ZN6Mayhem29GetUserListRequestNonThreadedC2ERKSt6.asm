========================================================================
ZN6Mayhem29GetUserListRequestNonThreadedC2ERKSt6vectorIxSaIxEE  0x00098750  296 bytes   Mayhem.mm
========================================================================

00098750  push    {r4, r5, r6, r7, lr}
00098752  add     r7, sp, #0xc
00098754  push.w  {r8, sl, fp}
00098758  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009875c  sub     sp, #0x5c
0009875e  ldr     r3, [pc, #0x104]
00098760  str     r0, [sp, #0xc]
00098762  add     r0, sp, #0x20
00098764  add     r3, pc ; -> 0x000f3438  0x0
00098766  str     r1, [sp, #8]
00098768  ldr     r3, [r3]
0009876a  str     r7, [sp, #0x40]
0009876c  str.w   sp, [sp, #0x48]
00098770  str     r3, [sp, #0x38]
00098772  ldr     r3, [pc, #0xf4]
00098774  add     r3, pc ; -> 0x000ee57c  GCC_except_table104
00098776  str     r3, [sp, #0x3c]
00098778  ldr     r3, [pc, #0xf0]
0009877a  add     r3, pc ; -> 0x0009884a  
0009877c  orr     r3, r3, #1
00098780  str     r3, [sp, #0x44]
00098782  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00098786  ldr     r1, [sp, #0xc]
00098788  mov.w   r3, #-1
0009878c  str     r3, [sp, #0x24]
0009878e  mov     r0, r1
00098790  str     r1, [sp, #0x10]
00098792  bl      #0x8cf64 ; -> ZN6Mayhem18GetUserListRequestC2Ev
00098796  ldr     r2, [sp, #0x10]
00098798  ldr     r3, [pc, #0xd4]
0009879a  add.w   r0, r2, #0x60
0009879e  add     r3, pc ; -> 0x0017dac0  ZTVN6Mayhem29GetUserListRequestNonThreadedE
000987a0  adds    r3, #8
000987a2  str     r3, [r2]
000987a4  ldr     r3, [pc, #0xcc]
000987a6  add     r3, pc ; -> 0x0017dac0  ZTVN6Mayhem29GetUserListRequestNonThreadedE
000987a8  adds    r3, #0x1c
000987aa  str     r3, [r2, #0x10]
000987ac  ldr     r1, [sp, #8]
000987ae  movs    r3, #2
000987b0  str     r3, [sp, #0x24]
000987b2  bl      #0x9ab74 ; -> ZNSt6vectorIxSaIxEEaSERKS1_
000987b6  ldr     r1, [sp, #8]
000987b8  add     r0, sp, #0x54
000987ba  ldr     r2, [r1, #4]
000987bc  ldr     r3, [r1]
000987be  rsb     r3, r3, r2
000987c2  asrs    r3, r3, #3
000987c4  str     r3, [sp, #4]
000987c6  bl      #0x8ac54 ; -> ZN6Mayhem4UserC1Ev
000987ca  ldr     r2, [sp, #0x10]
000987cc  ldr     r3, [sp, #0x10]
000987ce  ldr     r2, [r2, #8]
000987d0  str     r2, [sp, #0x14]
000987d2  ldr     r1, [sp, #0x14]
000987d4  ldr     r2, [r3, #4]
000987d6  rsb     r3, r2, r1
000987da  ldr     r1, [sp, #4]
000987dc  asrs    r3, r3, #3
000987de  cmp     r1, r3
000987e0  bhs     #0x98832
000987e2  lsls    r3, r1, #3
000987e4  adds    r2, r2, r3
000987e6  ldr     r3, [sp, #0x14]
000987e8  str     r2, [sp, #0x18]
000987ea  cmp     r3, r2
000987ec  beq     #0x9880a
000987ee  str     r2, [sp, #0x1c]
000987f0  ldr     r1, [sp, #0x1c]
000987f2  ldr     r3, [r1]
000987f4  mov     r0, r1
000987f6  ldr     r2, [r3]
000987f8  movs    r3, #1
000987fa  str     r3, [sp, #0x24]
000987fc  blx     r2
000987fe  ldr     r2, [sp, #0x1c]
00098800  ldr     r3, [sp, #0x14]
00098802  adds    r2, #8
00098804  cmp     r3, r2
00098806  str     r2, [sp, #0x1c]
00098808  bne     #0x987f0
0009880a  ldr     r3, [sp, #0x18]
0009880c  ldr     r2, [sp, #0xc]
0009880e  str     r3, [r2, #8]
00098810  movs    r3, #2
00098812  ldr     r0, [sp, #0x10]
00098814  str     r3, [sp, #0x24]
00098816  bl      #0x95150 ; -> ZN6Mayhem18GetUserListRequest3runEv
0009881a  add     r0, sp, #0x20
0009881c  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00098820  sub.w   sp, r7, #0x58
00098824  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00098828  sub.w   sp, r7, #0x18
0009882c  pop.w   {r8, sl, fp}
00098830  pop     {r4, r5, r6, r7, pc}
00098832  ldr     r1, [sp, #0x10]
00098834  adds    r0, r1, #4
00098836  ldr     r1, [sp, #4]
00098838  rsb     r2, r3, r1
0009883c  movs    r3, #2
0009883e  ldr     r1, [sp, #0x14]
00098840  str     r3, [sp, #0x24]
00098842  add     r3, sp, #0x54
00098844  bl      #0x9aec4 ; -> ZNSt6vectorIN6Mayhem4UserESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_
00098848  b       #0x98810
0009884a  ldr     r1, [sp, #0x28]
0009884c  ldr     r0, [sp, #0xc]
0009884e  movs    r3, #0
00098850  str     r3, [sp, #0x24]
00098852  str     r1, [sp]
00098854  bl      #0x984fc ; -> ZN6Mayhem18GetUserListRequestD2Ev
00098858  ldr     r0, [sp]
0009885a  mov.w   r3, #-1
0009885e  str     r3, [sp, #0x24]
00098860  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00098864  add     r4, sp, #0x340
00098866  movs    r5, r0
00098868  ldrsh   r4, [r0, r0]
0009886a  movs    r5, r0
0009886c  lsls    r4, r1, #3
0009886e  movs    r0, r0
00098870  strh    r6, [r3, r4]
00098872  movs    r6, r1
00098874  strh    r6, [r2, r4]
00098876  movs    r6, r1
