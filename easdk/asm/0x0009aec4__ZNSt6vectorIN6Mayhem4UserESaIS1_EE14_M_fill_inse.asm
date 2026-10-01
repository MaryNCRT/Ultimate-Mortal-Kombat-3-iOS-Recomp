========================================================================
ZNSt6vectorIN6Mayhem4UserESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_  0x0009aec4  680 bytes   Mayhem.mm
========================================================================

0009aec4  push    {r4, r5, r6, r7, lr}
0009aec6  add     r7, sp, #0xc
0009aec8  push.w  {r8, sl, fp}
0009aecc  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009aed0  sub     sp, #0xa0
0009aed2  str     r3, [sp]
0009aed4  ldr     r3, [pc, #0x284]
0009aed6  str     r0, [sp, #8]
0009aed8  add     r0, sp, #0x5c
0009aeda  add     r3, pc ; -> 0x000f3438  0x0
0009aedc  str     r1, [sp, #4]
0009aede  ldr     r3, [r3]
0009aee0  str     r2, [sp, #0x90]
0009aee2  str     r7, [sp, #0x7c]
0009aee4  str.w   sp, [sp, #0x84]
0009aee8  str     r3, [sp, #0x74]
0009aeea  ldr     r3, [pc, #0x274]
0009aeec  add     r3, pc ; -> 0x000ee1ee  GCC_except_table7
0009aeee  str     r3, [sp, #0x78]
0009aef0  ldr     r3, [pc, #0x270]
0009aef2  add     r3, pc ; -> 0x0009b150  
0009aef4  orr     r3, r3, #1
0009aef8  str     r3, [sp, #0x80]
0009aefa  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009aefe  ldr     r0, [sp, #4]
0009af00  ldr     r1, [sp, #0x90]
0009af02  str     r0, [sp, #0x44]
0009af04  cmp     r1, #0
0009af06  beq.w   #0x9b020
0009af0a  ldr     r3, [sp, #8]
0009af0c  ldr     r2, [r3, #4]
0009af0e  ldr     r3, [r3, #8]
0009af10  subs    r3, r3, r2
0009af12  cmp.w   r1, r3, asr #3
0009af16  bls.w   #0x9b038
0009af1a  ldr     r0, [sp, #8]
0009af1c  ldr     r3, [r0]
0009af1e  rsb     r3, r3, r2
0009af22  asrs    r2, r3, #3
0009af24  mvn     r3, #0xe0000000
0009af28  subs    r3, r3, r2
0009af2a  cmp     r1, r3
0009af2c  str     r2, [sp, #0x9c]
0009af2e  bhi.w   #0x9b138
0009af32  cmp     r1, r2
0009af34  ite     hi
0009af36  addhi   r3, sp, #0x90
0009af38  addls   r3, sp, #0x9c
0009af3a  ldr     r3, [r3]
0009af3c  adds    r3, r2, r3
0009af3e  itt     hs
0009af40  mvnhs   r1, #7
0009af44  strhs   r1, [sp, #0x48]
0009af46  bhs     #0x9af54
0009af48  cmp.w   r3, #0x20000000
0009af4c  bhs.w   #0x9b146
0009af50  lsls    r3, r3, #3
0009af52  str     r3, [sp, #0x48]
0009af54  ldr     r0, [sp, #0x48]
0009af56  mov.w   r3, #-1
0009af5a  str     r3, [sp, #0x60]
0009af5c  blx     #0xdd5c0 ; -> Znwm
0009af60  ldr     r2, [sp, #8]
0009af62  ldr     r3, [sp, #0x44]
0009af64  str     r0, [sp, #0x14]
0009af66  ldr     r2, [r2]
0009af68  cmp     r3, r2
0009af6a  str     r2, [sp, #0x34]
0009af6c  it      eq
0009af6e  streq   r0, [sp, #0x54]
0009af70  beq     #0x9af94
0009af72  ldr     r0, [sp, #0x14]
0009af74  str     r0, [sp, #0x54]
0009af76  ldr     r1, [sp, #0x54]
0009af78  cbz     r1, #0x9af82
0009af7a  mov     r0, r1
0009af7c  ldr     r1, [sp, #0x34]
0009af7e  bl      #0x8ac74 ; -> ZN6Mayhem4UserC1ERKS0_
0009af82  ldr     r2, [sp, #0x34]
0009af84  ldr     r3, [sp, #0x54]
0009af86  ldr     r0, [sp, #0x44]
0009af88  adds    r2, #8
0009af8a  adds    r3, #8
0009af8c  cmp     r0, r2
0009af8e  str     r2, [sp, #0x34]
0009af90  str     r3, [sp, #0x54]
0009af92  bne     #0x9af76
0009af94  ldr     r1, [sp, #0x90]
0009af96  ldr     r2, [sp]
0009af98  ldrb.w  r3, [sp, #0x3b]
0009af9c  ldr     r0, [sp, #0x54]
0009af9e  bl      #0x9a894 ; -> ZSt26__uninitialized_fill_n_auxIPN6Mayhem4UserEmS1_EvT_T0_RKT1_St12__false_type
0009afa2  ldr     r3, [sp, #0x90]
0009afa4  ldr     r2, [sp, #8]
0009afa6  ldr     r1, [sp, #0x54]
0009afa8  lsls    r3, r3, #3
0009afaa  add     r3, r1
0009afac  str     r3, [sp, #0x18]
0009afae  ldr     r3, [sp, #0x44]
0009afb0  ldr     r2, [r2, #4]
0009afb2  cmp     r3, r2
0009afb4  str     r2, [sp, #0x3c]
0009afb6  beq     #0x9afdc
0009afb8  str     r3, [sp, #0x50]
0009afba  ldr     r0, [sp, #0x18]
0009afbc  cbz     r0, #0x9afc4
0009afbe  ldr     r1, [sp, #0x50]
0009afc0  bl      #0x8ac74 ; -> ZN6Mayhem4UserC1ERKS0_
0009afc4  ldr     r2, [sp, #0x50]
0009afc6  ldr     r1, [sp, #0x18]
0009afc8  ldr     r3, [sp, #0x3c]
0009afca  adds    r2, #8
0009afcc  adds    r1, #8
0009afce  cmp     r3, r2
0009afd0  str     r1, [sp, #0x18]
0009afd2  str     r2, [sp, #0x50]
0009afd4  bne     #0x9afba
0009afd6  ldr     r0, [sp, #8]
0009afd8  ldr     r0, [r0, #4]
0009afda  str     r0, [sp, #0x44]
0009afdc  ldr     r1, [sp, #8]
0009afde  ldr     r2, [sp, #0x44]
0009afe0  ldr     r1, [r1]
0009afe2  cmp     r1, r2
0009afe4  str     r1, [sp, #0x40]
0009afe6  beq     #0x9b006
0009afe8  ldr     r0, [sp, #0x40]
0009afea  ldr     r3, [r0]
0009afec  ldr     r2, [r3]
0009afee  movs    r3, #1
0009aff0  str     r3, [sp, #0x60]
0009aff2  blx     r2
0009aff4  ldr     r1, [sp, #0x40]
0009aff6  ldr     r2, [sp, #0x44]
0009aff8  adds    r1, #8
0009affa  cmp     r1, r2
0009affc  str     r1, [sp, #0x40]
0009affe  bne     #0x9afe8
0009b000  ldr     r3, [sp, #8]
0009b002  ldr     r3, [r3]
0009b004  str     r3, [sp, #0x44]
0009b006  ldr     r0, [sp, #0x44]
0009b008  cbz     r0, #0x9b00e
0009b00a  blx     #0xdd5a8 ; -> ZdlPv
0009b00e  ldr     r2, [sp, #0x14]
0009b010  ldr     r1, [sp, #8]
0009b012  str     r2, [r1]
0009b014  ldr     r3, [sp, #0x18]
0009b016  str     r3, [r1, #4]
0009b018  ldr     r0, [sp, #0x48]
0009b01a  add.w   r3, r2, r0
0009b01e  str     r3, [r1, #8]
0009b020  add     r0, sp, #0x5c
0009b022  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009b026  sub.w   sp, r7, #0x58
0009b02a  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009b02e  sub.w   sp, r7, #0x18
0009b032  pop.w   {r8, sl, fp}
0009b036  pop     {r4, r5, r6, r7, pc}
0009b038  add     r0, sp, #0x94
0009b03a  ldr     r1, [sp]
0009b03c  bl      #0x8ac74 ; -> ZN6Mayhem4UserC1ERKS0_
0009b040  ldr     r0, [sp, #8]
0009b042  ldr     r1, [sp, #0x44]
0009b044  ldr     r0, [r0, #4]
0009b046  str     r1, [sp, #0x1c]
0009b048  rsb     r3, r1, r0
0009b04c  ldr     r1, [sp, #0x90]
0009b04e  asrs    r3, r3, #3
0009b050  str     r0, [sp, #0x10]
0009b052  cmp     r3, r1
0009b054  str     r3, [sp, #0xc]
0009b056  bls     #0x9b0d6
0009b058  lsls    r1, r1, #3
0009b05a  rsb     r1, r1, r0
0009b05e  cmp     r0, r1
0009b060  str     r1, [sp, #0x20]
0009b062  beq     #0x9b086
0009b064  str     r0, [sp, #0x58]
0009b066  b       #0x9b06e
0009b068  ldr     r1, [sp, #0x58]
0009b06a  adds    r1, #8
0009b06c  str     r1, [sp, #0x58]
0009b06e  ldr     r2, [sp, #0x58]
0009b070  cbz     r2, #0x9b07a
0009b072  mov     r0, r2
0009b074  ldr     r1, [sp, #0x20]
0009b076  bl      #0x8ac74 ; -> ZN6Mayhem4UserC1ERKS0_
0009b07a  ldr     r3, [sp, #0x20]
0009b07c  ldr     r0, [sp, #0x10]
0009b07e  adds    r3, #8
0009b080  cmp     r0, r3
0009b082  str     r3, [sp, #0x20]
0009b084  bne     #0x9b068
0009b086  ldr     r3, [sp, #0x90]
0009b088  ldr     r0, [sp, #8]
0009b08a  lsls    r2, r3, #3
0009b08c  ldr     r3, [r0, #4]
0009b08e  adds    r3, r3, r2
0009b090  str     r3, [r0, #4]
0009b092  ldr     r1, [sp, #0x10]
0009b094  ldr     r0, [sp, #0x1c]
0009b096  rsb     r2, r2, r1
0009b09a  rsb     r3, r0, r2
0009b09e  str     r2, [sp, #0x24]
0009b0a0  asrs    r3, r3, #3
0009b0a2  cmp     r3, #0
0009b0a4  str     r3, [sp, #0x28]
0009b0a6  ble     #0x9b0c6
0009b0a8  ldr     r1, [sp, #0x10]
0009b0aa  ldr     r2, [sp, #0x24]
0009b0ac  subs    r1, #8
0009b0ae  subs    r2, #8
0009b0b0  str     r1, [sp, #0x10]
0009b0b2  mov     r0, r1
0009b0b4  mov     r1, r2
0009b0b6  str     r2, [sp, #0x24]
0009b0b8  bl      #0x8ac80 ; -> ZN6Mayhem4UseraSERKS0_
0009b0bc  ldr     r3, [sp, #0x28]
0009b0be  adds.w  r3, r3, #-1
0009b0c2  str     r3, [sp, #0x28]
0009b0c4  bne     #0x9b0a8
0009b0c6  ldr     r1, [sp, #0x90]
0009b0c8  ldr     r0, [sp, #0x44]
0009b0ca  add     r2, sp, #0x94
0009b0cc  lsls    r1, r1, #3
0009b0ce  add     r1, r0
0009b0d0  bl      #0x9a64c ; -> ZSt4fillIPN6Mayhem4UserES1_EvT_S3_RKT0_
0009b0d4  b       #0x9b020
0009b0d6  ldr     r2, [sp, #0xc]
0009b0d8  ldr     r0, [sp, #0x10]
0009b0da  ldrb.w  r3, [sp, #0x2f]
0009b0de  subs    r1, r1, r2
0009b0e0  add     r2, sp, #0x94
0009b0e2  bl      #0x9a894 ; -> ZSt26__uninitialized_fill_n_auxIPN6Mayhem4UserEmS1_EvT_T0_RKT1_St12__false_type
0009b0e6  ldr     r1, [sp, #8]
0009b0e8  ldr     r3, [sp, #0x90]
0009b0ea  ldr     r0, [sp, #0xc]
0009b0ec  ldr     r2, [r1, #4]
0009b0ee  subs    r3, r3, r0
0009b0f0  lsls    r3, r3, #3
0009b0f2  adds    r3, r3, r2
0009b0f4  str     r3, [sp, #0x30]
0009b0f6  str     r3, [r1, #4]
0009b0f8  ldr     r2, [sp, #0x44]
0009b0fa  ldr     r3, [sp, #0x10]
0009b0fc  cmp     r2, r3
0009b0fe  beq     #0x9b120
0009b100  str     r2, [sp, #0x4c]
0009b102  b       #0x9b10a
0009b104  ldr     r3, [sp, #0x30]
0009b106  adds    r3, #8
0009b108  str     r3, [sp, #0x30]
0009b10a  ldr     r0, [sp, #0x30]
0009b10c  cbz     r0, #0x9b114
0009b10e  ldr     r1, [sp, #0x4c]
0009b110  bl      #0x8ac74 ; -> ZN6Mayhem4UserC1ERKS0_
0009b114  ldr     r1, [sp, #0x4c]
0009b116  ldr     r2, [sp, #0x10]
0009b118  adds    r1, #8
0009b11a  cmp     r2, r1
0009b11c  str     r1, [sp, #0x4c]
0009b11e  bne     #0x9b104
0009b120  ldr     r1, [sp, #8]
0009b122  ldr     r0, [sp, #0xc]
0009b124  ldr     r2, [r1, #4]
0009b126  lsls    r3, r0, #3
0009b128  add     r3, r2
0009b12a  str     r3, [r1, #4]
0009b12c  ldr     r0, [sp, #0x44]
0009b12e  ldr     r1, [sp, #0x10]
0009b130  add     r2, sp, #0x94
0009b132  bl      #0x9a64c ; -> ZSt4fillIPN6Mayhem4UserES1_EvT_S3_RKT0_
0009b136  b       #0x9b020
0009b138  ldr     r0, [pc, #0x2c]
0009b13a  mov.w   r3, #-1
0009b13e  str     r3, [sp, #0x60]
0009b140  add     r0, pc ; -> 0x00175c30  'vector::_M_fill_insert'
0009b142  blx     #0xdd578 ; -> ZSt20__throw_length_errorPKc
0009b146  mov.w   r3, #-1
0009b14a  str     r3, [sp, #0x60]
0009b14c  blx     #0xdd554 ; -> ZSt17__throw_bad_allocv
0009b150  ldr     r0, [sp, #0x64]
0009b152  mov.w   r3, #-1
0009b156  str     r3, [sp, #0x60]
0009b158  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009b15c  strh    r2, [r3, #0x2a]
0009b15e  movs    r5, r0
0009b160  adds    r2, #0xfe
0009b162  movs    r5, r0
0009b164  lsls    r2, r3, #9
0009b166  movs    r0, r0
0009b168  add     r2, sp, #0x3b0
0009b16a  movs    r5, r1
