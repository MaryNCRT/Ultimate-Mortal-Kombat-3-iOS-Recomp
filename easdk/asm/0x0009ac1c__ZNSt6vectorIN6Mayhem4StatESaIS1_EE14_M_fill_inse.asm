========================================================================
ZNSt6vectorIN6Mayhem4StatESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_  0x0009ac1c  680 bytes   Mayhem.mm
========================================================================

0009ac1c  push    {r4, r5, r6, r7, lr}
0009ac1e  add     r7, sp, #0xc
0009ac20  push.w  {r8, sl, fp}
0009ac24  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009ac28  sub     sp, #0xa0
0009ac2a  str     r3, [sp]
0009ac2c  ldr     r3, [pc, #0x284]
0009ac2e  str     r0, [sp, #8]
0009ac30  add     r0, sp, #0x5c
0009ac32  add     r3, pc ; -> 0x000f3438  0x0
0009ac34  str     r1, [sp, #4]
0009ac36  ldr     r3, [r3]
0009ac38  str     r2, [sp, #0x90]
0009ac3a  str     r7, [sp, #0x7c]
0009ac3c  str.w   sp, [sp, #0x84]
0009ac40  str     r3, [sp, #0x74]
0009ac42  ldr     r3, [pc, #0x274]
0009ac44  add     r3, pc ; -> 0x000ee1e8  GCC_except_table4
0009ac46  str     r3, [sp, #0x78]
0009ac48  ldr     r3, [pc, #0x270]
0009ac4a  add     r3, pc ; -> 0x0009aea8  
0009ac4c  orr     r3, r3, #1
0009ac50  str     r3, [sp, #0x80]
0009ac52  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009ac56  ldr     r0, [sp, #4]
0009ac58  ldr     r1, [sp, #0x90]
0009ac5a  str     r0, [sp, #0x44]
0009ac5c  cmp     r1, #0
0009ac5e  beq.w   #0x9ad78
0009ac62  ldr     r3, [sp, #8]
0009ac64  ldr     r2, [r3, #4]
0009ac66  ldr     r3, [r3, #8]
0009ac68  subs    r3, r3, r2
0009ac6a  cmp.w   r1, r3, asr #3
0009ac6e  bls.w   #0x9ad90
0009ac72  ldr     r0, [sp, #8]
0009ac74  ldr     r3, [r0]
0009ac76  rsb     r3, r3, r2
0009ac7a  asrs    r2, r3, #3
0009ac7c  mvn     r3, #0xe0000000
0009ac80  subs    r3, r3, r2
0009ac82  cmp     r1, r3
0009ac84  str     r2, [sp, #0x9c]
0009ac86  bhi.w   #0x9ae90
0009ac8a  cmp     r1, r2
0009ac8c  ite     hi
0009ac8e  addhi   r3, sp, #0x90
0009ac90  addls   r3, sp, #0x9c
0009ac92  ldr     r3, [r3]
0009ac94  adds    r3, r2, r3
0009ac96  itt     hs
0009ac98  mvnhs   r1, #7
0009ac9c  strhs   r1, [sp, #0x48]
0009ac9e  bhs     #0x9acac
0009aca0  cmp.w   r3, #0x20000000
0009aca4  bhs.w   #0x9ae9e
0009aca8  lsls    r3, r3, #3
0009acaa  str     r3, [sp, #0x48]
0009acac  ldr     r0, [sp, #0x48]
0009acae  mov.w   r3, #-1
0009acb2  str     r3, [sp, #0x60]
0009acb4  blx     #0xdd5c0 ; -> Znwm
0009acb8  ldr     r2, [sp, #8]
0009acba  ldr     r3, [sp, #0x44]
0009acbc  str     r0, [sp, #0x14]
0009acbe  ldr     r2, [r2]
0009acc0  cmp     r3, r2
0009acc2  str     r2, [sp, #0x34]
0009acc4  it      eq
0009acc6  streq   r0, [sp, #0x54]
0009acc8  beq     #0x9acec
0009acca  ldr     r0, [sp, #0x14]
0009accc  str     r0, [sp, #0x54]
0009acce  ldr     r1, [sp, #0x54]
0009acd0  cbz     r1, #0x9acda
0009acd2  mov     r0, r1
0009acd4  ldr     r1, [sp, #0x34]
0009acd6  bl      #0x8ad3c ; -> ZN6Mayhem4StatC1ERKS0_
0009acda  ldr     r2, [sp, #0x34]
0009acdc  ldr     r3, [sp, #0x54]
0009acde  ldr     r0, [sp, #0x44]
0009ace0  adds    r2, #8
0009ace2  adds    r3, #8
0009ace4  cmp     r0, r2
0009ace6  str     r2, [sp, #0x34]
0009ace8  str     r3, [sp, #0x54]
0009acea  bne     #0x9acce
0009acec  ldr     r1, [sp, #0x90]
0009acee  ldr     r2, [sp]
0009acf0  ldrb.w  r3, [sp, #0x3b]
0009acf4  ldr     r0, [sp, #0x54]
0009acf6  bl      #0x9a8b8 ; -> ZSt26__uninitialized_fill_n_auxIPN6Mayhem4StatEmS1_EvT_T0_RKT1_St12__false_type
0009acfa  ldr     r3, [sp, #0x90]
0009acfc  ldr     r2, [sp, #8]
0009acfe  ldr     r1, [sp, #0x54]
0009ad00  lsls    r3, r3, #3
0009ad02  add     r3, r1
0009ad04  str     r3, [sp, #0x18]
0009ad06  ldr     r3, [sp, #0x44]
0009ad08  ldr     r2, [r2, #4]
0009ad0a  cmp     r3, r2
0009ad0c  str     r2, [sp, #0x3c]
0009ad0e  beq     #0x9ad34
0009ad10  str     r3, [sp, #0x50]
0009ad12  ldr     r0, [sp, #0x18]
0009ad14  cbz     r0, #0x9ad1c
0009ad16  ldr     r1, [sp, #0x50]
0009ad18  bl      #0x8ad3c ; -> ZN6Mayhem4StatC1ERKS0_
0009ad1c  ldr     r2, [sp, #0x50]
0009ad1e  ldr     r1, [sp, #0x18]
0009ad20  ldr     r3, [sp, #0x3c]
0009ad22  adds    r2, #8
0009ad24  adds    r1, #8
0009ad26  cmp     r3, r2
0009ad28  str     r1, [sp, #0x18]
0009ad2a  str     r2, [sp, #0x50]
0009ad2c  bne     #0x9ad12
0009ad2e  ldr     r0, [sp, #8]
0009ad30  ldr     r0, [r0, #4]
0009ad32  str     r0, [sp, #0x44]
0009ad34  ldr     r1, [sp, #8]
0009ad36  ldr     r2, [sp, #0x44]
0009ad38  ldr     r1, [r1]
0009ad3a  cmp     r1, r2
0009ad3c  str     r1, [sp, #0x40]
0009ad3e  beq     #0x9ad5e
0009ad40  ldr     r0, [sp, #0x40]
0009ad42  ldr     r3, [r0]
0009ad44  ldr     r2, [r3]
0009ad46  movs    r3, #1
0009ad48  str     r3, [sp, #0x60]
0009ad4a  blx     r2
0009ad4c  ldr     r1, [sp, #0x40]
0009ad4e  ldr     r2, [sp, #0x44]
0009ad50  adds    r1, #8
0009ad52  cmp     r1, r2
0009ad54  str     r1, [sp, #0x40]
0009ad56  bne     #0x9ad40
0009ad58  ldr     r3, [sp, #8]
0009ad5a  ldr     r3, [r3]
0009ad5c  str     r3, [sp, #0x44]
0009ad5e  ldr     r0, [sp, #0x44]
0009ad60  cbz     r0, #0x9ad66
0009ad62  blx     #0xdd5a8 ; -> ZdlPv
0009ad66  ldr     r2, [sp, #0x14]
0009ad68  ldr     r1, [sp, #8]
0009ad6a  str     r2, [r1]
0009ad6c  ldr     r3, [sp, #0x18]
0009ad6e  str     r3, [r1, #4]
0009ad70  ldr     r0, [sp, #0x48]
0009ad72  add.w   r3, r2, r0
0009ad76  str     r3, [r1, #8]
0009ad78  add     r0, sp, #0x5c
0009ad7a  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009ad7e  sub.w   sp, r7, #0x58
0009ad82  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009ad86  sub.w   sp, r7, #0x18
0009ad8a  pop.w   {r8, sl, fp}
0009ad8e  pop     {r4, r5, r6, r7, pc}
0009ad90  add     r0, sp, #0x94
0009ad92  ldr     r1, [sp]
0009ad94  bl      #0x8ad3c ; -> ZN6Mayhem4StatC1ERKS0_
0009ad98  ldr     r0, [sp, #8]
0009ad9a  ldr     r1, [sp, #0x44]
0009ad9c  ldr     r0, [r0, #4]
0009ad9e  str     r1, [sp, #0x1c]
0009ada0  rsb     r3, r1, r0
0009ada4  ldr     r1, [sp, #0x90]
0009ada6  asrs    r3, r3, #3
0009ada8  str     r0, [sp, #0x10]
0009adaa  cmp     r3, r1
0009adac  str     r3, [sp, #0xc]
0009adae  bls     #0x9ae2e
0009adb0  lsls    r1, r1, #3
0009adb2  rsb     r1, r1, r0
0009adb6  cmp     r0, r1
0009adb8  str     r1, [sp, #0x20]
0009adba  beq     #0x9adde
0009adbc  str     r0, [sp, #0x58]
0009adbe  b       #0x9adc6
0009adc0  ldr     r1, [sp, #0x58]
0009adc2  adds    r1, #8
0009adc4  str     r1, [sp, #0x58]
0009adc6  ldr     r2, [sp, #0x58]
0009adc8  cbz     r2, #0x9add2
0009adca  mov     r0, r2
0009adcc  ldr     r1, [sp, #0x20]
0009adce  bl      #0x8ad3c ; -> ZN6Mayhem4StatC1ERKS0_
0009add2  ldr     r3, [sp, #0x20]
0009add4  ldr     r0, [sp, #0x10]
0009add6  adds    r3, #8
0009add8  cmp     r0, r3
0009adda  str     r3, [sp, #0x20]
0009addc  bne     #0x9adc0
0009adde  ldr     r3, [sp, #0x90]
0009ade0  ldr     r0, [sp, #8]
0009ade2  lsls    r2, r3, #3
0009ade4  ldr     r3, [r0, #4]
0009ade6  adds    r3, r3, r2
0009ade8  str     r3, [r0, #4]
0009adea  ldr     r1, [sp, #0x10]
0009adec  ldr     r0, [sp, #0x1c]
0009adee  rsb     r2, r2, r1
0009adf2  rsb     r3, r0, r2
0009adf6  str     r2, [sp, #0x24]
0009adf8  asrs    r3, r3, #3
0009adfa  cmp     r3, #0
0009adfc  str     r3, [sp, #0x28]
0009adfe  ble     #0x9ae1e
0009ae00  ldr     r1, [sp, #0x10]
0009ae02  ldr     r2, [sp, #0x24]
0009ae04  subs    r1, #8
0009ae06  subs    r2, #8
0009ae08  str     r1, [sp, #0x10]
0009ae0a  mov     r0, r1
0009ae0c  mov     r1, r2
0009ae0e  str     r2, [sp, #0x24]
0009ae10  bl      #0x8ad6c ; -> ZN6Mayhem4StataSERKS0_
0009ae14  ldr     r3, [sp, #0x28]
0009ae16  adds.w  r3, r3, #-1
0009ae1a  str     r3, [sp, #0x28]
0009ae1c  bne     #0x9ae00
0009ae1e  ldr     r1, [sp, #0x90]
0009ae20  ldr     r0, [sp, #0x44]
0009ae22  add     r2, sp, #0x94
0009ae24  lsls    r1, r1, #3
0009ae26  add     r1, r0
0009ae28  bl      #0x9a66c ; -> ZSt4fillIPN6Mayhem4StatES1_EvT_S3_RKT0_
0009ae2c  b       #0x9ad78
0009ae2e  ldr     r2, [sp, #0xc]
0009ae30  ldr     r0, [sp, #0x10]
0009ae32  ldrb.w  r3, [sp, #0x2f]
0009ae36  subs    r1, r1, r2
0009ae38  add     r2, sp, #0x94
0009ae3a  bl      #0x9a8b8 ; -> ZSt26__uninitialized_fill_n_auxIPN6Mayhem4StatEmS1_EvT_T0_RKT1_St12__false_type
0009ae3e  ldr     r1, [sp, #8]
0009ae40  ldr     r3, [sp, #0x90]
0009ae42  ldr     r0, [sp, #0xc]
0009ae44  ldr     r2, [r1, #4]
0009ae46  subs    r3, r3, r0
0009ae48  lsls    r3, r3, #3
0009ae4a  adds    r3, r3, r2
0009ae4c  str     r3, [sp, #0x30]
0009ae4e  str     r3, [r1, #4]
0009ae50  ldr     r2, [sp, #0x44]
0009ae52  ldr     r3, [sp, #0x10]
0009ae54  cmp     r2, r3
0009ae56  beq     #0x9ae78
0009ae58  str     r2, [sp, #0x4c]
0009ae5a  b       #0x9ae62
0009ae5c  ldr     r3, [sp, #0x30]
0009ae5e  adds    r3, #8
0009ae60  str     r3, [sp, #0x30]
0009ae62  ldr     r0, [sp, #0x30]
0009ae64  cbz     r0, #0x9ae6c
0009ae66  ldr     r1, [sp, #0x4c]
0009ae68  bl      #0x8ad3c ; -> ZN6Mayhem4StatC1ERKS0_
0009ae6c  ldr     r1, [sp, #0x4c]
0009ae6e  ldr     r2, [sp, #0x10]
0009ae70  adds    r1, #8
0009ae72  cmp     r2, r1
0009ae74  str     r1, [sp, #0x4c]
0009ae76  bne     #0x9ae5c
0009ae78  ldr     r1, [sp, #8]
0009ae7a  ldr     r0, [sp, #0xc]
0009ae7c  ldr     r2, [r1, #4]
0009ae7e  lsls    r3, r0, #3
0009ae80  add     r3, r2
0009ae82  str     r3, [r1, #4]
0009ae84  ldr     r0, [sp, #0x44]
0009ae86  ldr     r1, [sp, #0x10]
0009ae88  add     r2, sp, #0x94
0009ae8a  bl      #0x9a66c ; -> ZSt4fillIPN6Mayhem4StatES1_EvT_S3_RKT0_
0009ae8e  b       #0x9ad78
0009ae90  ldr     r0, [pc, #0x2c]
0009ae92  mov.w   r3, #-1
0009ae96  str     r3, [sp, #0x60]
0009ae98  add     r0, pc ; -> 0x00175c30  'vector::_M_fill_insert'
0009ae9a  blx     #0xdd578 ; -> ZSt20__throw_length_errorPKc
0009ae9e  mov.w   r3, #-1
0009aea2  str     r3, [sp, #0x60]
0009aea4  blx     #0xdd554 ; -> ZSt17__throw_bad_allocv
0009aea8  ldr     r0, [sp, #0x64]
0009aeaa  mov.w   r3, #-1
0009aeae  str     r3, [sp, #0x60]
0009aeb0  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009aeb4  ldrh    r2, [r0]
0009aeb6  movs    r5, r0
0009aeb8  adds    r5, #0xa0
0009aeba  movs    r5, r0
0009aebc  lsls    r2, r3, #9
0009aebe  movs    r0, r0
0009aec0  add     r5, sp, #0x250
0009aec2  movs    r5, r1
