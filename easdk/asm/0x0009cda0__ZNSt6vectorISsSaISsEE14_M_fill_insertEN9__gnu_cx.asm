========================================================================
ZNSt6vectorISsSaISsEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPSsS1_EEmRKSs  0x0009cda0  1716 bytes   Mayhem.mm
========================================================================

0009cda0  push    {r4, r5, r6, r7, lr}
0009cda2  add     r7, sp, #0xc
0009cda4  push.w  {r8, sl, fp}
0009cda8  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009cdac  sub     sp, #0xfc
0009cdae  str     r3, [sp, #4]
0009cdb0  ldr.w   r3, [pc, #0x670]
0009cdb4  str     r0, [sp, #0xc]
0009cdb6  add     r0, sp, #0xb4
0009cdb8  add     r3, pc ; -> 0x000f3438  0x0
0009cdba  str     r1, [sp, #8]
0009cdbc  ldr     r3, [r3]
0009cdbe  str     r2, [sp, #0xe8]
0009cdc0  str     r7, [sp, #0xd4]
0009cdc2  str.w   sp, [sp, #0xdc]
0009cdc6  str     r3, [sp, #0xcc]
0009cdc8  ldr.w   r3, [pc, #0x65c]
0009cdcc  add     r3, pc ; -> 0x000ee37c  GCC_except_table62
0009cdce  str     r3, [sp, #0xd0]
0009cdd0  ldr.w   r3, [pc, #0x658]
0009cdd4  add     r3, pc ; -> 0x0009d10a  
0009cdd6  orr     r3, r3, #1
0009cdda  str     r3, [sp, #0xd8]
0009cddc  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009cde0  ldr     r0, [sp, #8]
0009cde2  ldr     r1, [sp, #0xe8]
0009cde4  str     r0, [sp, #0x54]
0009cde6  cmp     r1, #0
0009cde8  beq.w   #0x9cf2a
0009cdec  ldr     r2, [sp, #0xc]
0009cdee  ldr     r3, [r2, #8]
0009cdf0  ldr     r2, [r2, #4]
0009cdf2  subs    r3, r3, r2
0009cdf4  cmp.w   r1, r3, asr #2
0009cdf8  bls.w   #0x9cf42
0009cdfc  ldr     r0, [sp, #0xc]
0009cdfe  ldr     r3, [r0]
0009ce00  rsb     r3, r3, r2
0009ce04  asrs    r2, r3, #2
0009ce06  mvn     r3, #0xc0000000
0009ce0a  subs    r3, r3, r2
0009ce0c  cmp     r3, r1
0009ce0e  str     r2, [sp, #0xec]
0009ce10  blo.w   #0x9d0f2
0009ce14  cmp     r2, r1
0009ce16  ite     lo
0009ce18  addlo   r3, sp, #0xe8
0009ce1a  addhs   r3, sp, #0xec
0009ce1c  ldr     r3, [r3]
0009ce1e  adds    r3, r2, r3
0009ce20  itt     hs
0009ce22  mvnhs   r1, #3
0009ce26  strhs   r1, [sp, #0x58]
0009ce28  bhs     #0x9ce36
0009ce2a  cmp.w   r3, #0x40000000
0009ce2e  bhs.w   #0x9d100
0009ce32  lsls    r3, r3, #2
0009ce34  str     r3, [sp, #0x58]
0009ce36  ldr     r0, [sp, #0x58]
0009ce38  mov.w   r3, #-1
0009ce3c  str     r3, [sp, #0xb8]
0009ce3e  blx     #0xdd5c0 ; -> Znwm
0009ce42  ldr     r2, [sp, #0xc]
0009ce44  ldr     r3, [sp, #0x54]
0009ce46  str     r0, [sp, #0x80]
0009ce48  str     r0, [sp, #0x3c]
0009ce4a  str     r0, [sp, #0x1c]
0009ce4c  ldr     r2, [r2]
0009ce4e  cmp     r3, r2
0009ce50  str     r2, [sp, #0x40]
0009ce52  it      eq
0009ce54  streq   r0, [sp, #0x18]
0009ce56  beq     #0x9ce86
0009ce58  ldr     r0, [sp, #0x80]
0009ce5a  ldr     r4, [sp, #0x80]
0009ce5c  str     r0, [sp, #0x18]
0009ce5e  adds    r4, #4
0009ce60  str     r4, [sp, #0x74]
0009ce62  ldr     r1, [sp, #0x18]
0009ce64  cbz     r1, #0x9ce72
0009ce66  movs    r3, #3
0009ce68  mov     r0, r1
0009ce6a  str     r3, [sp, #0xb8]
0009ce6c  ldr     r1, [sp, #0x40]
0009ce6e  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009ce72  ldr     r2, [sp, #0x40]
0009ce74  ldr     r3, [sp, #0x74]
0009ce76  ldr     r0, [sp, #0x54]
0009ce78  adds    r2, #4
0009ce7a  adds    r4, r3, #4
0009ce7c  cmp     r0, r2
0009ce7e  str     r2, [sp, #0x40]
0009ce80  str     r3, [sp, #0x18]
0009ce82  str     r4, [sp, #0x74]
0009ce84  bne     #0x9ce62
0009ce86  ldr     r1, [sp, #0x18]
0009ce88  movs    r3, #0xa
0009ce8a  ldr     r2, [sp, #4]
0009ce8c  str     r3, [sp, #0xb8]
0009ce8e  str     r1, [sp, #0x1c]
0009ce90  mov     r0, r1
0009ce92  ldrb.w  r3, [sp, #0x47]
0009ce96  ldr     r1, [sp, #0xe8]
0009ce98  bl      #0x9c168 ; -> ZSt26__uninitialized_fill_n_auxIPSsmSsEvT_T0_RKT1_St12__false_type
0009ce9c  ldr     r3, [sp, #0xe8]
0009ce9e  ldr     r2, [sp, #0x1c]
0009cea0  ldr     r4, [sp, #0x54]
0009cea2  lsls    r3, r3, #2
0009cea4  adds    r2, r2, r3
0009cea6  ldr     r3, [sp, #0xc]
0009cea8  str     r2, [sp, #0x1c]
0009ceaa  ldr     r3, [r3, #4]
0009ceac  str     r2, [sp, #0xa4]
0009ceae  cmp     r4, r3
0009ceb0  str     r3, [sp, #0x48]
0009ceb2  beq     #0x9ceda
0009ceb4  str     r4, [sp, #0x70]
0009ceb6  str     r2, [sp, #0xa0]
0009ceb8  ldr     r0, [sp, #0xa0]
0009ceba  cbz     r0, #0x9cec6
0009cebc  movs    r3, #1
0009cebe  ldr     r1, [sp, #0x70]
0009cec0  str     r3, [sp, #0xb8]
0009cec2  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009cec6  ldr     r3, [sp, #0x70]
0009cec8  ldr     r2, [sp, #0xa0]
0009ceca  ldr     r4, [sp, #0x48]
0009cecc  adds    r3, #4
0009cece  adds    r2, #4
0009ced0  cmp     r4, r3
0009ced2  str     r2, [sp, #0xa0]
0009ced4  str     r3, [sp, #0x70]
0009ced6  bne     #0x9ceb8
0009ced8  str     r2, [sp, #0xa4]
0009ceda  ldr     r0, [sp, #0xc]
0009cedc  ldr     r2, [r0]
0009cede  ldr     r1, [r0, #4]
0009cee0  cmp     r2, r1
0009cee2  str     r1, [sp, #0x4c]
0009cee4  beq     #0x9cf0e
0009cee6  ldr.w   r3, [pc, #0x548]
0009ceea  str     r2, [sp, #0x6c]
0009ceec  add     r3, pc ; -> 0x000f3370  0x0
0009ceee  ldr     r3, [r3]
0009cef0  str     r3, [sp, #0x90]
0009cef2  ldr     r2, [sp, #0x6c]
0009cef4  ldr     r4, [sp, #0x90]
0009cef6  ldr     r3, [r2]
0009cef8  sub.w   r0, r3, #0xc
0009cefc  cmp     r4, r0
0009cefe  bne.w   #0x9d0b6
0009cf02  ldr     r0, [sp, #0x6c]
0009cf04  ldr     r1, [sp, #0x4c]
0009cf06  adds    r0, #4
0009cf08  cmp     r1, r0
0009cf0a  str     r0, [sp, #0x6c]
0009cf0c  bne     #0x9cef2
0009cf0e  ldr     r3, [sp, #0xc]
0009cf10  ldr     r0, [r3]
0009cf12  cbz     r0, #0x9cf18
0009cf14  blx     #0xdd5a8 ; -> ZdlPv
0009cf18  ldr     r0, [sp, #0x80]
0009cf1a  ldr     r4, [sp, #0xc]
0009cf1c  str     r0, [r4]
0009cf1e  ldr     r1, [sp, #0xa4]
0009cf20  str     r1, [r4, #4]
0009cf22  ldr     r2, [sp, #0x58]
0009cf24  add.w   r3, r0, r2
0009cf28  str     r3, [r4, #8]
0009cf2a  add     r0, sp, #0xb4
0009cf2c  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009cf30  sub.w   sp, r7, #0x58
0009cf34  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009cf38  sub.w   sp, r7, #0x18
0009cf3c  pop.w   {r8, sl, fp}
0009cf40  pop     {r4, r5, r6, r7, pc}
0009cf42  ldr     r1, [sp, #4]
0009cf44  add     r0, sp, #0xf0
0009cf46  mov.w   r3, #-1
0009cf4a  str     r3, [sp, #0xb8]
0009cf4c  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009cf50  ldr     r3, [sp, #0xc]
0009cf52  ldr     r4, [sp, #0x54]
0009cf54  ldr     r1, [sp, #0xe8]
0009cf56  ldr     r2, [r3, #4]
0009cf58  str     r4, [sp, #0x24]
0009cf5a  rsb     r3, r4, r2
0009cf5e  str     r2, [sp, #0x14]
0009cf60  asrs    r3, r3, #2
0009cf62  cmp     r3, r1
0009cf64  str     r3, [sp, #0x10]
0009cf66  bls     #0x9d03a
0009cf68  lsls    r1, r1, #2
0009cf6a  rsb     r1, r1, r2
0009cf6e  cmp     r1, r2
0009cf70  str     r1, [sp, #0x28]
0009cf72  str     r2, [sp, #0xa8]
0009cf74  beq     #0x9cfa0
0009cf76  str     r2, [sp, #0xb0]
0009cf78  str     r2, [sp, #0xac]
0009cf7a  str     r2, [sp, #0x60]
0009cf7c  b       #0x9cf80
0009cf7e  str     r2, [sp, #0xac]
0009cf80  ldr     r0, [sp, #0x60]
0009cf82  cbz     r0, #0x9cf8e
0009cf84  movs    r3, #7
0009cf86  ldr     r1, [sp, #0x28]
0009cf88  str     r3, [sp, #0xb8]
0009cf8a  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009cf8e  ldr     r1, [sp, #0x28]
0009cf90  ldr     r2, [sp, #0x60]
0009cf92  ldr     r3, [sp, #0xa8]
0009cf94  adds    r1, #4
0009cf96  adds    r2, #4
0009cf98  cmp     r3, r1
0009cf9a  str     r1, [sp, #0x28]
0009cf9c  str     r2, [sp, #0x60]
0009cf9e  bne     #0x9cf7e
0009cfa0  ldr     r4, [sp, #0xc]
0009cfa2  ldr     r3, [sp, #0xe8]
0009cfa4  ldr     r1, [r4, #4]
0009cfa6  lsls    r2, r3, #2
0009cfa8  add.w   r3, r1, r2
0009cfac  str     r3, [r4, #4]
0009cfae  ldr     r0, [sp, #0x14]
0009cfb0  ldr     r1, [sp, #0x24]
0009cfb2  rsb     r2, r2, r0
0009cfb6  rsb     r3, r1, r2
0009cfba  str     r2, [sp, #0x2c]
0009cfbc  asrs    r3, r3, #2
0009cfbe  cmp     r3, #0
0009cfc0  str     r3, [sp, #0x30]
0009cfc2  ble     #0x9cfe6
0009cfc4  ldr     r2, [sp, #0x14]
0009cfc6  ldr     r3, [sp, #0x2c]
0009cfc8  subs    r2, #4
0009cfca  subs    r3, #4
0009cfcc  str     r3, [sp, #0x2c]
0009cfce  str     r2, [sp, #0x14]
0009cfd0  movs    r3, #0xc
0009cfd2  mov     r0, r2
0009cfd4  str     r3, [sp, #0xb8]
0009cfd6  ldr     r1, [sp, #0x2c]
0009cfd8  blx     #0xdd518 ; -> ZNSs6assignERKSs
0009cfdc  ldr     r4, [sp, #0x30]
0009cfde  adds.w  r4, r4, #-1
0009cfe2  str     r4, [sp, #0x30]
0009cfe4  bne     #0x9cfc4
0009cfe6  ldr     r1, [sp, #0xe8]
0009cfe8  ldr     r0, [sp, #0x54]
0009cfea  movs    r3, #0xc
0009cfec  add     r2, sp, #0xf0
0009cfee  lsls    r1, r1, #2
0009cff0  add     r1, r0
0009cff2  str     r3, [sp, #0xb8]
0009cff4  bl      #0x9a810 ; -> ZSt4fillIPSsSsEvT_S1_RKT0_
0009cff8  ldr.w   r3, [pc, #0x438]
0009cffc  ldr     r2, [sp, #0xf0]
0009cffe  add     r3, pc ; -> 0x000f3370  0x0
0009d000  sub.w   r0, r2, #0xc
0009d004  ldr     r3, [r3]
0009d006  cmp     r0, r3
0009d008  beq     #0x9cf2a
0009d00a  ldr     r3, [r2, #-0x4]
0009d00e  subs    r1, r2, #4
0009d010  b       #0x9d01a
0009d012  cmp     r4, ip
0009d014  mov     r3, r4
0009d016  beq.w   #0x9d17e
0009d01a  subs    r2, r3, #1
0009d01c  dmb     ish
0009d020  mov     ip, r3
0009d022  ldrex   r4, [r1]
0009d026  cmp     r4, r3
0009d028  bne     #0x9d012
0009d02a  strex   lr, r2, [r1]
0009d02e  cmp.w   lr, #0
0009d032  bne     #0x9d022
0009d034  dmb     ish
0009d038  b       #0x9d012
0009d03a  ldr     r2, [sp, #0x10]
0009d03c  movs    r3, #0xb
0009d03e  ldr     r0, [sp, #0x14]
0009d040  subs    r1, r1, r2
0009d042  str     r3, [sp, #0xb8]
0009d044  add     r2, sp, #0xf0
0009d046  ldrb.w  r3, [sp, #0x37]
0009d04a  bl      #0x9c168 ; -> ZSt26__uninitialized_fill_n_auxIPSsmSsEvT_T0_RKT1_St12__false_type
0009d04e  ldr     r3, [sp, #0xc]
0009d050  ldr     r4, [sp, #0x10]
0009d052  ldr     r0, [sp, #0xc]
0009d054  ldr     r2, [r3, #4]
0009d056  ldr     r3, [sp, #0xe8]
0009d058  subs    r3, r3, r4
0009d05a  lsls    r3, r3, #2
0009d05c  add     r3, r2
0009d05e  str     r3, [r0, #4]
0009d060  ldr     r1, [sp, #0x54]
0009d062  ldr     r2, [sp, #0x14]
0009d064  str     r3, [sp, #0x38]
0009d066  cmp     r1, r2
0009d068  beq     #0x9d098
0009d06a  str     r1, [sp, #0x64]
0009d06c  str     r3, [sp, #0x68]
0009d06e  str     r3, [sp, #0x7c]
0009d070  str     r3, [sp, #0x78]
0009d072  b       #0x9d076
0009d074  str     r0, [sp, #0x7c]
0009d076  ldr     r3, [sp, #0x78]
0009d078  cbz     r3, #0x9d086
0009d07a  movs    r3, #5
0009d07c  ldr     r0, [sp, #0x78]
0009d07e  str     r3, [sp, #0xb8]
0009d080  ldr     r1, [sp, #0x64]
0009d082  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009d086  ldr     r4, [sp, #0x64]
0009d088  ldr     r0, [sp, #0x78]
0009d08a  ldr     r1, [sp, #0x14]
0009d08c  adds    r4, #4
0009d08e  adds    r0, #4
0009d090  cmp     r1, r4
0009d092  str     r4, [sp, #0x64]
0009d094  str     r0, [sp, #0x78]
0009d096  bne     #0x9d074
0009d098  ldr     r3, [sp, #0xc]
0009d09a  ldr     r4, [sp, #0x10]
0009d09c  ldr     r0, [sp, #0xc]
0009d09e  ldr     r2, [r3, #4]
0009d0a0  lsls    r3, r4, #2
0009d0a2  add     r3, r2
0009d0a4  str     r3, [r0, #4]
0009d0a6  ldr     r0, [sp, #0x54]
0009d0a8  movs    r3, #0xc
0009d0aa  ldr     r1, [sp, #0x14]
0009d0ac  str     r3, [sp, #0xb8]
0009d0ae  add     r2, sp, #0xf0
0009d0b0  bl      #0x9a810 ; -> ZSt4fillIPSsSsEvT_S1_RKT0_
0009d0b4  b       #0x9cff8
0009d0b6  subs    r2, r3, #4
0009d0b8  ldr     r3, [r3, #-0x4]
0009d0bc  subs    r1, r3, #1
0009d0be  dmb     ish
0009d0c2  mov     ip, r3
0009d0c4  ldrex   lr, [r2]
0009d0c8  cmp     lr, r3
0009d0ca  beq     #0x9d0e4
0009d0cc  cmp     lr, ip
0009d0ce  mov     r3, lr
0009d0d0  bne     #0x9d0bc
0009d0d2  cmp.w   lr, #0
0009d0d6  bgt.w   #0x9cf02
0009d0da  add.w   r1, sp, #0xf5
0009d0de  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009d0e2  b       #0x9cf02
0009d0e4  strex   r4, r1, [r2]
0009d0e8  cmp     r4, #0
0009d0ea  bne     #0x9d0c4
0009d0ec  dmb     ish
0009d0f0  b       #0x9d0cc
0009d0f2  ldr     r0, [pc, #0x344]
0009d0f4  mov.w   r3, #-1
0009d0f8  str     r3, [sp, #0xb8]
0009d0fa  add     r0, pc ; -> 0x00175c30  'vector::_M_fill_insert'
0009d0fc  blx     #0xdd578 ; -> ZSt20__throw_length_errorPKc
0009d100  mov.w   r3, #-1
0009d104  str     r3, [sp, #0xb8]
0009d106  blx     #0xdd554 ; -> ZSt17__throw_bad_allocv
0009d10a  ldr     r3, [sp, #0xb8]
0009d10c  ldr     r1, [sp, #0xbc]
0009d10e  cmp     r3, #1
0009d110  str     r1, [sp]
0009d112  beq     #0x9d1f0
0009d114  cmp     r3, #2
0009d116  beq.w   #0x9d2de
0009d11a  cmp     r3, #3
0009d11c  beq     #0x9d1f0
0009d11e  cmp     r3, #4
0009d120  beq.w   #0x9d2a6
0009d124  cmp     r3, #5
0009d126  beq     #0x9d1c6
0009d128  cmp     r3, #6
0009d12a  beq.w   #0x9d3a0
0009d12e  cmp     r3, #7
0009d130  beq     #0x9d1c6
0009d132  cmp     r3, #8
0009d134  beq.w   #0x9d38c
0009d138  cmp     r3, #9
0009d13a  beq     #0x9d1f8
0009d13c  cmp     r3, #0xa
0009d13e  beq     #0x9d1ce
0009d140  cmp     r3, #0xb
0009d142  beq     #0x9d1ce
0009d144  ldr     r0, [sp]
0009d146  blx     #0xdd5e4 ; -> cxa_begin_catch
0009d14a  ldr     r2, [sp, #0xa4]
0009d14c  ldr     r3, [sp, #0xa0]
0009d14e  cmp     r2, r3
0009d150  beq     #0x9d176
0009d152  ldr.w   r3, [pc, #0x2e8]
0009d156  add     r3, pc ; -> 0x000f3370  0x0
0009d158  ldr     r3, [r3]
0009d15a  str     r3, [sp, #0x94]
0009d15c  ldr     r4, [sp, #0xa4]
0009d15e  ldr     r1, [sp, #0x94]
0009d160  ldr     r3, [r4]
0009d162  sub.w   r0, r3, #0xc
0009d166  cmp     r1, r0
0009d168  bne     #0x9d18c
0009d16a  ldr     r0, [sp, #0xa4]
0009d16c  ldr     r1, [sp, #0xa0]
0009d16e  adds    r0, #4
0009d170  cmp     r0, r1
0009d172  str     r0, [sp, #0xa4]
0009d174  bne     #0x9d15c
0009d176  movs    r3, #2
0009d178  str     r3, [sp, #0xb8]
0009d17a  blx     #0xdd5fc ; -> cxa_rethrow
0009d17e  cmp     r4, #0
0009d180  bgt.w   #0x9cf2a
0009d184  add     r1, sp, #0xf8
0009d186  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009d18a  b       #0x9cf2a
0009d18c  subs    r2, r3, #4
0009d18e  ldr     r3, [r3, #-0x4]
0009d192  subs    r1, r3, #1
0009d194  dmb     ish
0009d198  mov     ip, r3
0009d19a  ldrex   r4, [r2]
0009d19e  cmp     r4, r3
0009d1a0  beq     #0x9d1b6
0009d1a2  cmp     r4, ip
0009d1a4  mov     r3, r4
0009d1a6  bne     #0x9d192
0009d1a8  cmp     r4, #0
0009d1aa  bgt     #0x9d16a
0009d1ac  add.w   r1, sp, #0xf6
0009d1b0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009d1b4  b       #0x9d16a
0009d1b6  strex   lr, r1, [r2]
0009d1ba  cmp.w   lr, #0
0009d1be  bne     #0x9d19a
0009d1c0  dmb     ish
0009d1c4  b       #0x9d1a2
0009d1c6  movs    r3, #0
0009d1c8  str     r3, [sp, #0xb8]
0009d1ca  blx     #0xdd5f0 ; -> cxa_end_catch
0009d1ce  ldr     r3, [pc, #0x270]
0009d1d0  ldr     r1, [sp, #0xf0]
0009d1d2  ldr     r2, [sp]
0009d1d4  add     r3, pc ; -> 0x000f3370  0x0
0009d1d6  sub.w   r0, r1, #0xc
0009d1da  ldr     r3, [r3]
0009d1dc  str     r2, [sp, #0x20]
0009d1de  cmp     r0, r3
0009d1e0  bne     #0x9d242
0009d1e2  ldr     r0, [sp, #0x20]
0009d1e4  mov.w   r3, #-1
0009d1e8  str     r3, [sp, #0xb8]
0009d1ea  str     r0, [sp]
0009d1ec  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009d1f0  movs    r3, #0
0009d1f2  str     r3, [sp, #0xb8]
0009d1f4  blx     #0xdd5f0 ; -> cxa_end_catch
0009d1f8  ldr     r0, [sp]
0009d1fa  blx     #0xdd5e4 ; -> cxa_begin_catch
0009d1fe  ldr     r2, [sp, #0x1c]
0009d200  ldr     r3, [sp, #0x80]
0009d202  cmp     r3, r2
0009d204  str     r2, [sp, #0x50]
0009d206  beq     #0x9d230
0009d208  ldr.w   r3, [pc, #0x238]
0009d20c  ldr     r4, [sp, #0x80]
0009d20e  add     r3, pc ; -> 0x000f3370  0x0
0009d210  ldr     r3, [r3]
0009d212  str     r4, [sp, #0x88]
0009d214  str     r3, [sp, #0x98]
0009d216  ldr     r0, [sp, #0x88]
0009d218  ldr     r1, [sp, #0x98]
0009d21a  ldr     r3, [r0]
0009d21c  sub.w   r0, r3, #0xc
0009d220  cmp     r1, r0
0009d222  bne     #0x9d26e
0009d224  ldr     r0, [sp, #0x88]
0009d226  ldr     r1, [sp, #0x50]
0009d228  adds    r0, #4
0009d22a  cmp     r1, r0
0009d22c  str     r0, [sp, #0x88]
0009d22e  bne     #0x9d216
0009d230  ldr     r2, [sp, #0x3c]
0009d232  cbz     r2, #0x9d23a
0009d234  ldr     r0, [sp, #0x80]
0009d236  blx     #0xdd5a8 ; -> ZdlPv
0009d23a  movs    r3, #9
0009d23c  str     r3, [sp, #0xb8]
0009d23e  blx     #0xdd5fc ; -> cxa_rethrow
0009d242  ldr     r3, [r1, #-0x4]
0009d246  subs    r2, r1, #4
0009d248  subs    r1, r3, #1
0009d24a  dmb     ish
0009d24e  mov     ip, r3
0009d250  ldrex   r4, [r2]
0009d254  cmp     r4, r3
0009d256  beq.w   #0x9d3d8
0009d25a  cmp     r4, ip
0009d25c  mov     r3, r4
0009d25e  bne     #0x9d248
0009d260  cmp     r4, #0
0009d262  bgt     #0x9d1e2
0009d264  add.w   r1, sp, #0xf9
0009d268  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009d26c  b       #0x9d1e2
0009d26e  subs    r2, r3, #4
0009d270  ldr     r3, [r3, #-0x4]
0009d274  subs    r1, r3, #1
0009d276  dmb     ish
0009d27a  mov     ip, r3
0009d27c  ldrex   r4, [r2]
0009d280  cmp     r4, r3
0009d282  beq     #0x9d296
0009d284  cmp     r4, ip
0009d286  mov     r3, r4
0009d288  bne     #0x9d274
0009d28a  cmp     r4, #0
0009d28c  bgt     #0x9d224
0009d28e  add     r1, sp, #0xf4
0009d290  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009d294  b       #0x9d224
0009d296  strex   lr, r1, [r2]
0009d29a  cmp.w   lr, #0
0009d29e  bne     #0x9d27c
0009d2a0  dmb     ish
0009d2a4  b       #0x9d284
0009d2a6  ldr     r0, [sp]
0009d2a8  blx     #0xdd5e4 ; -> cxa_begin_catch
0009d2ac  ldr     r1, [sp, #0x38]
0009d2ae  ldr     r2, [sp, #0x7c]
0009d2b0  cmp     r1, r2
0009d2b2  beq     #0x9d2d6
0009d2b4  ldr     r3, [pc, #0x190]
0009d2b6  add     r3, pc ; -> 0x000f3370  0x0
0009d2b8  ldr     r3, [r3]
0009d2ba  str     r3, [sp, #0x8c]
0009d2bc  ldr     r4, [sp, #0x68]
0009d2be  ldr     r1, [sp, #0x8c]
0009d2c0  ldr     r3, [r4]
0009d2c2  sub.w   r0, r3, #0xc
0009d2c6  cmp     r0, r1
0009d2c8  bne     #0x9d352
0009d2ca  ldr     r0, [sp, #0x68]
0009d2cc  ldr     r1, [sp, #0x7c]
0009d2ce  adds    r0, #4
0009d2d0  cmp     r0, r1
0009d2d2  str     r0, [sp, #0x68]
0009d2d4  bne     #0x9d2bc
0009d2d6  movs    r3, #6
0009d2d8  str     r3, [sp, #0xb8]
0009d2da  blx     #0xdd5fc ; -> cxa_rethrow
0009d2de  ldr     r0, [sp]
0009d2e0  blx     #0xdd5e4 ; -> cxa_begin_catch
0009d2e4  ldr     r2, [sp, #0x80]
0009d2e6  ldr     r3, [sp, #0x18]
0009d2e8  cmp     r2, r3
0009d2ea  beq     #0x9d310
0009d2ec  ldr     r3, [pc, #0x15c]
0009d2ee  str     r2, [sp, #0x84]
0009d2f0  add     r3, pc ; -> 0x000f3370  0x0
0009d2f2  ldr     r3, [r3]
0009d2f4  str     r3, [sp, #0x9c]
0009d2f6  ldr     r4, [sp, #0x84]
0009d2f8  ldr     r1, [sp, #0x9c]
0009d2fa  ldr     r3, [r4]
0009d2fc  sub.w   r0, r3, #0xc
0009d300  cmp     r0, r1
0009d302  bne     #0x9d318
0009d304  ldr     r0, [sp, #0x84]
0009d306  ldr     r1, [sp, #0x18]
0009d308  adds    r0, #4
0009d30a  cmp     r0, r1
0009d30c  str     r0, [sp, #0x84]
0009d30e  bne     #0x9d2f6
0009d310  movs    r3, #4
0009d312  str     r3, [sp, #0xb8]
0009d314  blx     #0xdd5fc ; -> cxa_rethrow
0009d318  subs    r2, r3, #4
0009d31a  ldr     r3, [r3, #-0x4]
0009d31e  subs    r1, r3, #1
0009d320  dmb     ish
0009d324  mov     ip, r3
0009d326  ldrex   r4, [r2]
0009d32a  cmp     r4, r3
0009d32c  beq     #0x9d342
0009d32e  cmp     r4, ip
0009d330  mov     r3, r4
0009d332  bne     #0x9d31e
0009d334  cmp     r4, #0
0009d336  bgt     #0x9d304
0009d338  add.w   r1, sp, #0xf7
0009d33c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009d340  b       #0x9d304
0009d342  strex   lr, r1, [r2]
0009d346  cmp.w   lr, #0
0009d34a  bne     #0x9d326
0009d34c  dmb     ish
0009d350  b       #0x9d32e
0009d352  subs    r2, r3, #4
0009d354  ldr     r3, [r3, #-0x4]
0009d358  subs    r1, r3, #1
0009d35a  dmb     ish
0009d35e  mov     ip, r3
0009d360  ldrex   r4, [r2]
0009d364  cmp     r4, r3
0009d366  beq     #0x9d37c
0009d368  cmp     r4, ip
0009d36a  mov     r3, r4
0009d36c  bne     #0x9d358
0009d36e  cmp     r4, #0
0009d370  bgt     #0x9d2ca
0009d372  add.w   r1, sp, #0xfa
0009d376  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009d37a  b       #0x9d2ca
0009d37c  strex   lr, r1, [r2]
0009d380  cmp.w   lr, #0
0009d384  bne     #0x9d360
0009d386  dmb     ish
0009d38a  b       #0x9d368
0009d38c  movs    r3, #0
0009d38e  str     r3, [sp, #0xb8]
0009d390  blx     #0xdd5f0 ; -> cxa_end_catch
0009d394  ldr     r0, [sp]
0009d396  mov.w   r3, #-1
0009d39a  str     r3, [sp, #0xb8]
0009d39c  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009d3a0  ldr     r0, [sp]
0009d3a2  blx     #0xdd5e4 ; -> cxa_begin_catch
0009d3a6  ldr     r2, [sp, #0xa8]
0009d3a8  ldr     r3, [sp, #0xac]
0009d3aa  cmp     r2, r3
0009d3ac  beq     #0x9d3d0
0009d3ae  ldr     r3, [pc, #0xa0]
0009d3b0  add     r3, pc ; -> 0x000f3370  0x0
0009d3b2  ldr     r3, [r3]
0009d3b4  str     r3, [sp, #0x5c]
0009d3b6  ldr     r4, [sp, #0xb0]
0009d3b8  ldr     r1, [sp, #0x5c]
0009d3ba  ldr     r3, [r4]
0009d3bc  sub.w   r0, r3, #0xc
0009d3c0  cmp     r0, r1
0009d3c2  bne     #0x9d3ea
0009d3c4  ldr     r0, [sp, #0xb0]
0009d3c6  ldr     r1, [sp, #0xac]
0009d3c8  adds    r0, #4
0009d3ca  cmp     r0, r1
0009d3cc  str     r0, [sp, #0xb0]
0009d3ce  bne     #0x9d3b6
0009d3d0  movs    r3, #8
0009d3d2  str     r3, [sp, #0xb8]
0009d3d4  blx     #0xdd5fc ; -> cxa_rethrow
0009d3d8  strex   lr, r1, [r2]
0009d3dc  cmp.w   lr, #0
0009d3e0  bne.w   #0x9d250
0009d3e4  dmb     ish
0009d3e8  b       #0x9d25a
0009d3ea  subs    r2, r3, #4
0009d3ec  ldr     r3, [r3, #-0x4]
0009d3f0  subs    r1, r3, #1
0009d3f2  dmb     ish
0009d3f6  mov     ip, r3
0009d3f8  ldrex   r4, [r2]
0009d3fc  cmp     r4, r3
0009d3fe  beq     #0x9d414
0009d400  cmp     r4, ip
0009d402  mov     r3, r4
0009d404  bne     #0x9d3f0
0009d406  cmp     r4, #0
0009d408  bgt     #0x9d3c4
0009d40a  add.w   r1, sp, #0xfb
0009d40e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009d412  b       #0x9d3c4
0009d414  strex   lr, r1, [r2]
0009d418  cmp.w   lr, #0
0009d41c  bne     #0x9d3f8
0009d41e  dmb     ish
0009d422  b       #0x9d400
0009d424  str     r4, [r7, #0x64]
0009d426  movs    r5, r0
0009d428  asrs    r4, r5, #0x16
0009d42a  movs    r5, r0
0009d42c  lsls    r2, r6, #0xc
0009d42e  movs    r0, r0
0009d430  str     r0, [r0, #0x48]
0009d432  movs    r5, r0
0009d434  str     r6, [r5, #0x34]
0009d436  movs    r5, r0
0009d438  ldrh    r2, [r6, #0x18]
0009d43a  movs    r5, r1
0009d43c  str     r6, [r2, #0x20]
0009d43e  movs    r5, r0
0009d440  str     r0, [r3, #0x18]
0009d442  movs    r5, r0
0009d444  str     r6, [r3, #0x14]
0009d446  movs    r5, r0
0009d448  str     r6, [r6, #8]
0009d44a  movs    r5, r0
0009d44c  str     r4, [r7, #4]
0009d44e  movs    r5, r0
0009d450  ldrsh   r4, [r7, r6]
0009d452  movs    r5, r0
