========================================================================
ZNK13LocaleManager16getSupportedLangEPN4midp6StringE  0x0009e9ec  516 bytes   LocaleManager.mm
========================================================================

0009e9ec  push    {r4, r5, r6, r7, lr}
0009e9ee  add     r7, sp, #0xc
0009e9f0  push.w  {r8, sl, fp}
0009e9f4  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009e9f8  sub     sp, #0x64
0009e9fa  ldr     r3, [pc, #0x1d0]
0009e9fc  str     r0, [sp, #4]
0009e9fe  add     r0, sp, #0x2c
0009ea00  add     r3, pc ; -> 0x000f301c  0x0
0009ea02  str     r1, [sp]
0009ea04  ldr     r3, [r3]
0009ea06  str     r7, [sp, #0x4c]
0009ea08  str.w   sp, [sp, #0x54]
0009ea0c  str     r3, [sp, #0x44]
0009ea0e  ldr     r3, [pc, #0x1c0]
0009ea10  add     r3, pc ; -> 0x000ee666  GCC_except_table16
0009ea12  str     r3, [sp, #0x48]
0009ea14  ldr     r3, [pc, #0x1bc]
0009ea16  add     r3, pc ; -> 0x0009eb78  
0009ea18  orr     r3, r3, #1
0009ea1c  str     r3, [sp, #0x50]
0009ea1e  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009ea22  ldr     r2, [sp]
0009ea24  str     r2, [sp, #0x60]
0009ea26  ldr     r0, [sp, #0x60]
0009ea28  cbz     r0, #0x9ea36
0009ea2a  ldr     r3, [r0]
0009ea2c  ldr     r2, [r3, #0xc]
0009ea2e  mov.w   r3, #-1
0009ea32  str     r3, [sp, #0x30]
0009ea34  blx     r2
0009ea36  ldr     r2, [sp, #4]
0009ea38  ldr     r3, [r2, #0x14]
0009ea3a  cmp     r3, #0
0009ea3c  ble     #0x9eaf0
0009ea3e  movs    r3, #0
0009ea40  str     r3, [sp, #0xc]
0009ea42  b       #0x9eab8
0009ea44  ldr     r3, [r3]
0009ea46  movs    r2, #2
0009ea48  ldr     r0, [sp, #0x24]
0009ea4a  ldr     r3, [r3, #0xc]
0009ea4c  str     r2, [sp, #0x30]
0009ea4e  blx     r3
0009ea50  movs    r3, #1
0009ea52  ldr     r0, [sp, #0x24]
0009ea54  str     r3, [sp, #0x30]
0009ea56  bl      #0x9d9f0 ; -> ZNK4midp6String6lengthEv
0009ea5a  cmp     r0, #2
0009ea5c  ble     #0x9ea86
0009ea5e  ldr     r0, [sp, #0x24]
0009ea60  movs    r1, #0
0009ea62  movs    r2, #2
0009ea64  bl      #0x9dbc8 ; -> ZNK4midp6String9substringEii
0009ea68  ldr     r2, [sp, #0x24]
0009ea6a  str     r0, [sp, #0x28]
0009ea6c  cmp     r2, r0
0009ea6e  beq     #0x9ea86
0009ea70  cbz     r0, #0x9ea78
0009ea72  ldr     r3, [r0]
0009ea74  ldr     r3, [r3, #0xc]
0009ea76  blx     r3
0009ea78  movs    r3, #1
0009ea7a  ldr     r0, [sp, #0x24]
0009ea7c  str     r3, [sp, #0x30]
0009ea7e  bl      #0x9f614 ; -> ZN4midp6DECREFEPNS_16ReferenceCountedE
0009ea82  ldr     r2, [sp, #0x28]
0009ea84  str     r2, [sp, #0x24]
0009ea86  movs    r3, #1
0009ea88  ldr     r0, [sp]
0009ea8a  str     r3, [sp, #0x30]
0009ea8c  ldr     r1, [sp, #0x24]
0009ea8e  bl      #0x9dfd4 ; -> ZNK4midp6String10startsWithEPS0_
0009ea92  cmp     r0, #0
0009ea94  bne     #0x9eb2e
0009ea96  ldr     r3, [sp, #0x24]
0009ea98  cbz     r3, #0x9eaa8
0009ea9a  ldr     r3, [r3]
0009ea9c  ldr     r0, [sp, #0x24]
0009ea9e  ldr     r2, [r3, #8]
0009eaa0  movs    r3, #2
0009eaa2  str     r3, [sp, #0x30]
0009eaa4  blx     r2
0009eaa6  cbnz    r0, #0x9eae4
0009eaa8  ldr     r3, [sp, #0xc]
0009eaaa  ldr     r2, [sp, #4]
0009eaac  adds    r3, #1
0009eaae  str     r3, [sp, #0xc]
0009eab0  ldr     r3, [r2, #0x14]
0009eab2  ldr     r2, [sp, #0xc]
0009eab4  cmp     r3, r2
0009eab6  ble     #0x9eaf0
0009eab8  ldr     r2, [sp, #0xc]
0009eaba  lsls    r2, r2, #2
0009eabc  str     r2, [sp, #0x18]
0009eabe  ldr     r2, [sp, #4]
0009eac0  ldr     r3, [r2, #0x18]
0009eac2  ldr     r2, [sp, #0xc]
0009eac4  ldr.w   r3, [r3, r2, lsl #2]
0009eac8  str     r3, [sp, #0x24]
0009eaca  cmp     r3, #0
0009eacc  bne     #0x9ea44
0009eace  ldr     r0, [pc, #0x108]
0009ead0  ldr     r1, [pc, #0x108]
0009ead2  ldr     r3, [pc, #0x10c]
0009ead4  movs    r2, #1
0009ead6  add     r0, pc ; -> 0x000e5c70  ZZN4midp23ReferenceCountedPointerINS_6StringEEptEvE8__func__
0009ead8  str     r2, [sp, #0x30]
0009eada  add     r1, pc ; -> 0x001764d8  '../../src/EA_SDK/microedition/ReferenceCounted.h'
0009eadc  add     r3, pc ; -> 0x0017650c  'm__obj'
0009eade  adds    r2, #0xba
0009eae0  blx     #0xdd5cc ; -> assert_rtn
0009eae4  ldr     r2, [sp, #0x24]
0009eae6  ldr     r3, [r2]
0009eae8  mov     r0, r2
0009eaea  ldr     r3, [r3, #4]
0009eaec  blx     r3
0009eaee  b       #0x9eaa8
0009eaf0  movs    r3, #0
0009eaf2  str     r3, [sp, #8]
0009eaf4  ldr     r2, [sp, #0x60]
0009eaf6  str     r2, [sp, #0x20]
0009eaf8  cbz     r2, #0x9eb14
0009eafa  ldr     r3, [r2]
0009eafc  ldr     r0, [sp, #0x20]
0009eafe  ldr     r2, [r3, #8]
0009eb00  mov.w   r3, #-1
0009eb04  str     r3, [sp, #0x30]
0009eb06  blx     r2
0009eb08  cbz     r0, #0x9eb14
0009eb0a  ldr     r2, [sp, #0x20]
0009eb0c  ldr     r3, [r2]
0009eb0e  mov     r0, r2
0009eb10  ldr     r3, [r3, #4]
0009eb12  blx     r3
0009eb14  add     r0, sp, #0x2c
0009eb16  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009eb1a  ldr     r0, [sp, #8]
0009eb1c  sub.w   sp, r7, #0x58
0009eb20  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009eb24  sub.w   sp, r7, #0x18
0009eb28  pop.w   {r8, sl, fp}
0009eb2c  pop     {r4, r5, r6, r7, pc}
0009eb2e  ldr     r2, [sp, #4]
0009eb30  ldr     r3, [r2, #0x14]
0009eb32  ldr     r2, [sp, #0xc]
0009eb34  cmp     r3, r2
0009eb36  blt     #0x9eb66
0009eb38  ldr     r2, [sp, #4]
0009eb3a  ldr     r3, [r2, #0x18]
0009eb3c  ldr     r2, [sp, #0x18]
0009eb3e  ldr     r3, [r2, r3]
0009eb40  str     r3, [sp, #8]
0009eb42  ldr     r3, [sp, #0x24]
0009eb44  cmp     r3, #0
0009eb46  beq     #0x9eaf4
0009eb48  ldr     r2, [sp, #0x24]
0009eb4a  ldr     r0, [sp, #0x24]
0009eb4c  ldr     r3, [r2]
0009eb4e  ldr     r2, [r3, #8]
0009eb50  movs    r3, #2
0009eb52  str     r3, [sp, #0x30]
0009eb54  blx     r2
0009eb56  cmp     r0, #0
0009eb58  beq     #0x9eaf4
0009eb5a  ldr     r2, [sp, #0x24]
0009eb5c  ldr     r3, [r2]
0009eb5e  mov     r0, r2
0009eb60  ldr     r3, [r3, #4]
0009eb62  blx     r3
0009eb64  b       #0x9eaf4
0009eb66  ldr     r0, [pc, #0x7c]
0009eb68  ldr     r1, [pc, #0x7c]
0009eb6a  ldr     r3, [pc, #0x80]
0009eb6c  add     r0, pc ; -> 0x000e5c7c  ZZNK4util8VectorSEIN4midp6StringEE9elementAtEiE8__func__
0009eb6e  add     r1, pc ; -> 0x001764b0  '../../src/EA_SDK/util/Vector.h'
0009eb70  add     r3, pc ; -> 0x001764d0  'false'
0009eb72  movs    r2, #0xa3
0009eb74  blx     #0xdd5cc ; -> assert_rtn
0009eb78  ldr     r3, [sp, #0x30]
0009eb7a  ldr     r0, [sp, #0x34]
0009eb7c  cmp     r3, #1
0009eb7e  beq     #0x9eba0
0009eb80  ldr     r3, [sp, #0x24]
0009eb82  str     r0, [sp, #0x10]
0009eb84  cbz     r3, #0x9eb9e
0009eb86  ldr     r3, [r3]
0009eb88  ldr     r0, [sp, #0x24]
0009eb8a  ldr     r2, [r3, #8]
0009eb8c  movs    r3, #0
0009eb8e  str     r3, [sp, #0x30]
0009eb90  blx     r2
0009eb92  cbz     r0, #0x9eb9e
0009eb94  ldr     r2, [sp, #0x24]
0009eb96  ldr     r3, [r2]
0009eb98  mov     r0, r2
0009eb9a  ldr     r3, [r3, #4]
0009eb9c  blx     r3
0009eb9e  ldr     r0, [sp, #0x10]
0009eba0  ldr     r3, [sp, #0x60]
0009eba2  str     r0, [sp, #0x14]
0009eba4  str     r3, [sp, #0x1c]
0009eba6  cbz     r3, #0x9ebc0
0009eba8  ldr     r3, [r3]
0009ebaa  ldr     r0, [sp, #0x1c]
0009ebac  ldr     r2, [r3, #8]
0009ebae  movs    r3, #0
0009ebb0  str     r3, [sp, #0x30]
0009ebb2  blx     r2
0009ebb4  cbz     r0, #0x9ebc0
0009ebb6  ldr     r2, [sp, #0x1c]
0009ebb8  ldr     r3, [r2]
0009ebba  mov     r0, r2
0009ebbc  ldr     r3, [r3, #4]
0009ebbe  blx     r3
0009ebc0  ldr     r0, [sp, #0x14]
0009ebc2  mov.w   r3, #-1
0009ebc6  str     r3, [sp, #0x30]
0009ebc8  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009ebcc  mov     r0, r3
0009ebce  movs    r5, r0
0009ebd0  mrrc2   p0, #0, r0, r2, c4
0009ebd4  lsls    r6, r3, #5
0009ebd6  movs    r0, r0
0009ebd8  strb    r6, [r2, #6]
0009ebda  movs    r4, r0
0009ebdc  ldrb    r2, [r7, #7]
0009ebde  movs    r5, r1
0009ebe0  ldrb    r4, [r5, #8]
0009ebe2  movs    r5, r1
0009ebe4  strb    r4, [r1, #4]
0009ebe6  movs    r4, r0
0009ebe8  ldrb    r6, [r7, #4]
0009ebea  movs    r5, r1
0009ebec  ldrb    r4, [r3, #5]
0009ebee  movs    r5, r1
