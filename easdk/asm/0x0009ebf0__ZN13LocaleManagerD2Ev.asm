========================================================================
ZN13LocaleManagerD2Ev  0x0009ebf0  544 bytes   LocaleManager.mm
========================================================================

0009ebf0  push    {r4, r5, r6, r7, lr}
0009ebf2  add     r7, sp, #0xc
0009ebf4  push.w  {r8, sl, fp}
0009ebf8  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009ebfc  sub     sp, #0x6c
0009ebfe  ldr     r3, [pc, #0x1ec]
0009ec00  str     r0, [sp, #4]
0009ec02  add     r0, sp, #0x38
0009ec04  add     r3, pc ; -> 0x000f301c  0x0
0009ec06  str     r7, [sp, #0x58]
0009ec08  ldr     r3, [r3]
0009ec0a  str.w   sp, [sp, #0x60]
0009ec0e  str     r3, [sp, #0x50]
0009ec10  ldr     r3, [pc, #0x1dc]
0009ec12  add     r3, pc ; -> 0x000ee66e  GCC_except_table18
0009ec14  str     r3, [sp, #0x54]
0009ec16  ldr     r3, [pc, #0x1dc]
0009ec18  add     r3, pc ; -> 0x0009ed38  
0009ec1a  orr     r3, r3, #1
0009ec1e  str     r3, [sp, #0x5c]
0009ec20  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009ec24  ldr     r1, [sp, #4]
0009ec26  ldr     r3, [pc, #0x1d0]
0009ec28  add.w   r2, r1, #0x30
0009ec2c  add     r3, pc ; -> 0x0017df04  ZTV13LocaleManager
0009ec2e  adds    r3, #8
0009ec30  str     r3, [r1]
0009ec32  ldr     r3, [pc, #0x1c8]
0009ec34  str     r2, [sp, #0xc]
0009ec36  add     r3, pc ; -> 0x0017df1c  ZTVN4midp5arrayINS0_INS0_INS_23ReferenceCountedPointerINS_6StringEEEEEEEEE
0009ec38  adds    r3, #8
0009ec3a  str     r3, [r1, #0x30]
0009ec3c  ldr     r3, [r1, #0x38]
0009ec3e  str     r3, [sp, #0x10]
0009ec40  ldr     r0, [r1, #0x3c]
0009ec42  cmp     r0, #0
0009ec44  beq     #0x9ed32
0009ec46  ldr     r1, [r0, #8]
0009ec48  str     r1, [sp, #0x20]
0009ec4a  ldrb    r3, [r0, #0x14]
0009ec4c  cmp     r3, #0
0009ec4e  ite     ne
0009ec50  movne   r3, #1
0009ec52  moveq   r3, #0
0009ec54  str     r3, [sp, #0x1c]
0009ec56  ldr     r2, [sp, #4]
0009ec58  movs    r3, #0
0009ec5a  str     r3, [r2, #0x3c]
0009ec5c  str     r3, [r2, #0x38]
0009ec5e  adds    r3, #3
0009ec60  str     r3, [sp, #0x3c]
0009ec62  bl      #0x9f614 ; -> ZN4midp6DECREFEPNS_16ReferenceCountedE
0009ec66  cbz     r0, #0x9ec6e
0009ec68  ldr     r1, [sp, #0x1c]
0009ec6a  cmp     r1, #0
0009ec6c  bne     #0x9ecf6
0009ec6e  ldr     r3, [pc, #0x190]
0009ec70  ldr     r1, [sp, #0xc]
0009ec72  add     r3, pc ; -> 0x000f343c  ZTVN4midp10array_baseE
0009ec74  ldr     r3, [r3]
0009ec76  adds    r3, #8
0009ec78  str     r3, [r1]
0009ec7a  ldr     r0, [sp, #0xc]
0009ec7c  movs    r3, #4
0009ec7e  str     r3, [sp, #0x3c]
0009ec80  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009ec84  ldr     r3, [sp, #4]
0009ec86  ldr     r1, [sp, #4]
0009ec88  adds    r3, #4
0009ec8a  str     r3, [sp, #0x2c]
0009ec8c  ldr     r3, [pc, #0x174]
0009ec8e  add     r3, pc ; -> 0x0017df98  ZTVN4util8VectorSEIN4midp6StringEEE
0009ec90  adds    r3, #8
0009ec92  str     r3, [r1, #4]
0009ec94  ldr     r3, [r1, #0x14]
0009ec96  cmp     r3, #0
0009ec98  ble     #0x9ecc4
0009ec9a  movs    r2, #0
0009ec9c  str     r2, [sp, #0x30]
0009ec9e  ldr     r3, [sp, #4]
0009eca0  ldr     r1, [sp, #0x30]
0009eca2  ldr     r2, [r3, #0x18]
0009eca4  movs    r3, #0
0009eca6  ldr.w   r0, [r2, r1, lsl #2]
0009ecaa  str.w   r3, [r2, r1, lsl #2]
0009ecae  adds    r3, #1
0009ecb0  str     r3, [sp, #0x3c]
0009ecb2  bl      #0x9f614 ; -> ZN4midp6DECREFEPNS_16ReferenceCountedE
0009ecb6  ldr     r2, [sp, #4]
0009ecb8  ldr     r1, [sp, #0x30]
0009ecba  adds    r1, #1
0009ecbc  str     r1, [sp, #0x30]
0009ecbe  ldr     r3, [r2, #0x14]
0009ecc0  cmp     r3, r1
0009ecc2  bgt     #0x9ec9e
0009ecc4  ldr     r1, [sp, #4]
0009ecc6  movs    r3, #0
0009ecc8  ldr     r0, [r1, #0x18]
0009ecca  str     r3, [r1, #0x14]
0009eccc  cbz     r0, #0x9ecd2
0009ecce  blx     #0xdd59c ; -> ZdaPv
0009ecd2  ldr     r0, [sp, #0x2c]
0009ecd4  mov.w   r3, #-1
0009ecd8  str     r3, [sp, #0x3c]
0009ecda  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009ecde  add     r0, sp, #0x38
0009ece0  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009ece4  sub.w   sp, r7, #0x58
0009ece8  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009ecec  sub.w   sp, r7, #0x18
0009ecf0  pop.w   {r8, sl, fp}
0009ecf4  pop     {r4, r5, r6, r7, pc}
0009ecf6  ldr     r2, [sp, #0x20]
0009ecf8  cmp     r2, #0
0009ecfa  beq     #0x9ec6e
0009ecfc  ldr     r3, [sp, #0x10]
0009ecfe  str     r2, [sp, #0x18]
0009ed00  cmp     r3, #0
0009ed02  ble     #0x9ed2a
0009ed04  movs    r1, #0
0009ed06  str     r2, [sp, #0x34]
0009ed08  str     r1, [sp, #0x14]
0009ed0a  ldr     r2, [sp, #0x34]
0009ed0c  ldr     r0, [sp, #0x34]
0009ed0e  ldr     r3, [r2]
0009ed10  ldr     r2, [r3]
0009ed12  movs    r3, #3
0009ed14  str     r3, [sp, #0x3c]
0009ed16  blx     r2
0009ed18  ldr     r3, [sp, #0x14]
0009ed1a  ldr     r1, [sp, #0x34]
0009ed1c  ldr     r2, [sp, #0x10]
0009ed1e  adds    r3, #1
0009ed20  adds    r1, #0x14
0009ed22  cmp     r3, r2
0009ed24  str     r3, [sp, #0x14]
0009ed26  str     r1, [sp, #0x34]
0009ed28  bne     #0x9ed0a
0009ed2a  ldr     r0, [sp, #0x18]
0009ed2c  blx     #0xdd5a8 ; -> ZdlPv
0009ed30  b       #0x9ec6e
0009ed32  str     r0, [sp, #0x20]
0009ed34  str     r0, [sp, #0x1c]
0009ed36  b       #0x9ec56
0009ed38  ldr     r3, [sp, #0x3c]
0009ed3a  ldr     r2, [sp, #0x40]
0009ed3c  cmp     r3, #1
0009ed3e  str     r2, [sp]
0009ed40  beq     #0x9ed60
0009ed42  cmp     r3, #2
0009ed44  beq     #0x9ed68
0009ed46  cmp     r3, #3
0009ed48  beq     #0x9ed7e
0009ed4a  ldr     r0, [sp, #0x2c]
0009ed4c  movs    r3, #0
0009ed4e  str     r3, [sp, #0x3c]
0009ed50  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009ed54  ldr     r0, [sp]
0009ed56  mov.w   r3, #-1
0009ed5a  str     r3, [sp, #0x3c]
0009ed5c  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009ed60  ldr     r0, [sp, #0x24]
0009ed62  movs    r3, #0
0009ed64  str     r3, [sp, #0x3c]
0009ed66  b       #0x9ed50
0009ed68  ldr     r3, [pc, #0x9c]
0009ed6a  ldr     r2, [sp, #0xc]
0009ed6c  add     r3, pc ; -> 0x000f343c  ZTVN4midp10array_baseE
0009ed6e  ldr     r3, [r3]
0009ed70  adds    r3, #8
0009ed72  str     r3, [r2]
0009ed74  ldr     r0, [sp, #0xc]
0009ed76  movs    r3, #0
0009ed78  str     r3, [sp, #0x3c]
0009ed7a  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009ed7e  ldr     r3, [sp, #4]
0009ed80  ldr     r2, [sp]
0009ed82  ldr     r1, [sp, #4]
0009ed84  adds    r3, #4
0009ed86  str     r3, [sp, #0x24]
0009ed88  ldr     r3, [pc, #0x80]
0009ed8a  str     r2, [sp, #8]
0009ed8c  add     r3, pc ; -> 0x0017df98  ZTVN4util8VectorSEIN4midp6StringEEE
0009ed8e  adds    r3, #8
0009ed90  str     r3, [r1, #4]
0009ed92  ldr     r3, [r1, #0x14]
0009ed94  cmp     r3, #0
0009ed96  ble     #0x9edc4
0009ed98  movs    r3, #0
0009ed9a  str     r3, [sp, #0x28]
0009ed9c  ldr     r1, [sp, #4]
0009ed9e  ldr     r3, [sp, #0x28]
0009eda0  ldr     r2, [r1, #0x18]
0009eda2  ldr     r1, [sp, #0x28]
0009eda4  ldr.w   r0, [r2, r3, lsl #2]
0009eda8  movs    r3, #0
0009edaa  str.w   r3, [r2, r1, lsl #2]
0009edae  adds    r3, #2
0009edb0  str     r3, [sp, #0x3c]
0009edb2  bl      #0x9f614 ; -> ZN4midp6DECREFEPNS_16ReferenceCountedE
0009edb6  ldr     r1, [sp, #4]
0009edb8  ldr     r2, [sp, #0x28]
0009edba  adds    r2, #1
0009edbc  str     r2, [sp, #0x28]
0009edbe  ldr     r3, [r1, #0x14]
0009edc0  cmp     r3, r2
0009edc2  bgt     #0x9ed9c
0009edc4  ldr     r2, [sp, #4]
0009edc6  movs    r3, #0
0009edc8  ldr     r0, [r2, #0x18]
0009edca  str     r3, [r2, #0x14]
0009edcc  cbz     r0, #0x9edd2
0009edce  blx     #0xdd59c ; -> ZdaPv
0009edd2  ldr     r0, [sp, #0x24]
0009edd4  movs    r3, #0
0009edd6  str     r3, [sp, #0x3c]
0009edd8  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009eddc  ldr     r3, [sp, #8]
0009edde  str     r3, [sp]
0009ede0  ldr     r0, [sp]
0009ede2  mov.w   r3, #-1
0009ede6  str     r3, [sp, #0x3c]
0009ede8  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009edec  add     r4, r2
0009edee  movs    r5, r0
