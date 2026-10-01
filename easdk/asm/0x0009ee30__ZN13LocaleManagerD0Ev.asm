========================================================================
ZN13LocaleManagerD0Ev  0x0009ee30  592 bytes   LocaleManager.mm
========================================================================

0009ee30  push    {r4, r5, r6, r7, lr}
0009ee32  add     r7, sp, #0xc
0009ee34  push.w  {r8, sl, fp}
0009ee38  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009ee3c  sub     sp, #0x70
0009ee3e  ldr     r3, [pc, #0x21c]
0009ee40  str     r0, [sp, #4]
0009ee42  add     r0, sp, #0x3c
0009ee44  add     r3, pc ; -> 0x000f301c  0x0
0009ee46  str     r7, [sp, #0x5c]
0009ee48  ldr     r3, [r3]
0009ee4a  str.w   sp, [sp, #0x64]
0009ee4e  str     r3, [sp, #0x54]
0009ee50  ldr     r3, [pc, #0x20c]
0009ee52  add     r3, pc ; -> 0x000ee67a  GCC_except_table19
0009ee54  str     r3, [sp, #0x58]
0009ee56  ldr     r3, [pc, #0x20c]
0009ee58  add     r3, pc ; -> 0x0009efa6  
0009ee5a  orr     r3, r3, #1
0009ee5e  str     r3, [sp, #0x60]
0009ee60  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009ee64  ldr     r1, [sp, #4]
0009ee66  ldr     r3, [pc, #0x200]
0009ee68  add.w   r2, r1, #0x30
0009ee6c  add     r3, pc ; -> 0x0017df04  ZTV13LocaleManager
0009ee6e  adds    r3, #8
0009ee70  str     r3, [r1]
0009ee72  ldr     r3, [pc, #0x1f8]
0009ee74  str     r2, [sp, #0xc]
0009ee76  add     r3, pc ; -> 0x0017df1c  ZTVN4midp5arrayINS0_INS0_INS_23ReferenceCountedPointerINS_6StringEEEEEEEEE
0009ee78  adds    r3, #8
0009ee7a  str     r3, [r1, #0x30]
0009ee7c  ldr     r3, [r1, #0x38]
0009ee7e  str     r3, [sp, #0x10]
0009ee80  ldr     r0, [r1, #0x3c]
0009ee82  cmp     r0, #0
0009ee84  beq.w   #0x9efa0
0009ee88  ldr     r1, [r0, #8]
0009ee8a  str     r1, [sp, #0x20]
0009ee8c  ldrb    r3, [r0, #0x14]
0009ee8e  cmp     r3, #0
0009ee90  ite     ne
0009ee92  movne   r3, #1
0009ee94  moveq   r3, #0
0009ee96  str     r3, [sp, #0x1c]
0009ee98  ldr     r2, [sp, #4]
0009ee9a  movs    r3, #0
0009ee9c  str     r3, [r2, #0x3c]
0009ee9e  str     r3, [r2, #0x38]
0009eea0  adds    r3, #3
0009eea2  str     r3, [sp, #0x40]
0009eea4  bl      #0x9f614 ; -> ZN4midp6DECREFEPNS_16ReferenceCountedE
0009eea8  cbz     r0, #0x9eeb0
0009eeaa  ldr     r1, [sp, #0x1c]
0009eeac  cmp     r1, #0
0009eeae  bne     #0x9ef64
0009eeb0  ldr     r3, [pc, #0x1bc]
0009eeb2  ldr     r1, [sp, #0xc]
0009eeb4  add     r3, pc ; -> 0x000f343c  ZTVN4midp10array_baseE
0009eeb6  ldr     r3, [r3]
0009eeb8  adds    r3, #8
0009eeba  str     r3, [r1]
0009eebc  ldr     r0, [sp, #0xc]
0009eebe  movs    r3, #4
0009eec0  str     r3, [sp, #0x40]
0009eec2  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009eec6  ldr     r3, [sp, #4]
0009eec8  ldr     r1, [sp, #4]
0009eeca  adds    r3, #4
0009eecc  str     r3, [sp, #0x2c]
0009eece  ldr.w   r3, [pc, #0x1a4]
0009eed2  add     r3, pc ; -> 0x0017df98  ZTVN4util8VectorSEIN4midp6StringEEE
0009eed4  adds    r3, #8
0009eed6  str     r3, [r1, #4]
0009eed8  ldr     r3, [r1, #0x14]
0009eeda  cmp     r3, #0
0009eedc  ble     #0x9ef2c
0009eede  movs    r2, #0
0009eee0  str     r2, [sp, #0x34]
0009eee2  b       #0x9eef4
0009eee4  ldr     r3, [sp, #0x34]
0009eee6  ldr     r1, [sp, #4]
0009eee8  adds    r3, #1
0009eeea  str     r3, [sp, #0x34]
0009eeec  ldr     r2, [sp, #0x34]
0009eeee  ldr     r3, [r1, #0x14]
0009eef0  cmp     r3, r2
0009eef2  ble     #0x9ef2c
0009eef4  ldr     r3, [sp, #4]
0009eef6  ldr     r1, [sp, #0x34]
0009eef8  ldr     r2, [r3, #0x18]
0009eefa  movs    r3, #0
0009eefc  ldr.w   r1, [r2, r1, lsl #2]
0009ef00  str     r1, [sp, #0x30]
0009ef02  ldr     r1, [sp, #0x34]
0009ef04  str.w   r3, [r2, r1, lsl #2]
0009ef08  ldr     r2, [sp, #0x30]
0009ef0a  cmp     r2, #0
0009ef0c  beq     #0x9eee4
0009ef0e  ldr     r1, [sp, #0x30]
0009ef10  ldr     r3, [r1]
0009ef12  mov     r0, r1
0009ef14  ldr     r2, [r3, #8]
0009ef16  movs    r3, #1
0009ef18  str     r3, [sp, #0x40]
0009ef1a  blx     r2
0009ef1c  cmp     r0, #0
0009ef1e  beq     #0x9eee4
0009ef20  ldr     r2, [sp, #0x30]
0009ef22  ldr     r3, [r2]
0009ef24  mov     r0, r2
0009ef26  ldr     r3, [r3, #4]
0009ef28  blx     r3
0009ef2a  b       #0x9eee4
0009ef2c  ldr     r1, [sp, #4]
0009ef2e  movs    r3, #0
0009ef30  ldr     r0, [r1, #0x18]
0009ef32  str     r3, [r1, #0x14]
0009ef34  cbz     r0, #0x9ef3a
0009ef36  blx     #0xdd59c ; -> ZdaPv
0009ef3a  ldr     r0, [sp, #0x2c]
0009ef3c  mov.w   r3, #-1
0009ef40  str     r3, [sp, #0x40]
0009ef42  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009ef46  ldr     r0, [sp, #4]
0009ef48  blx     #0xdd5a8 ; -> ZdlPv
0009ef4c  add     r0, sp, #0x3c
0009ef4e  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009ef52  sub.w   sp, r7, #0x58
0009ef56  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009ef5a  sub.w   sp, r7, #0x18
0009ef5e  pop.w   {r8, sl, fp}
0009ef62  pop     {r4, r5, r6, r7, pc}
0009ef64  ldr     r2, [sp, #0x20]
0009ef66  cmp     r2, #0
0009ef68  beq     #0x9eeb0
0009ef6a  ldr     r3, [sp, #0x10]
0009ef6c  str     r2, [sp, #0x18]
0009ef6e  cmp     r3, #0
0009ef70  ble     #0x9ef98
0009ef72  movs    r1, #0
0009ef74  str     r2, [sp, #0x38]
0009ef76  str     r1, [sp, #0x14]
0009ef78  ldr     r2, [sp, #0x38]
0009ef7a  ldr     r0, [sp, #0x38]
0009ef7c  ldr     r3, [r2]
0009ef7e  ldr     r2, [r3]
0009ef80  movs    r3, #3
0009ef82  str     r3, [sp, #0x40]
0009ef84  blx     r2
0009ef86  ldr     r3, [sp, #0x14]
0009ef88  ldr     r1, [sp, #0x38]
0009ef8a  ldr     r2, [sp, #0x10]
0009ef8c  adds    r3, #1
0009ef8e  adds    r1, #0x14
0009ef90  cmp     r3, r2
0009ef92  str     r3, [sp, #0x14]
0009ef94  str     r1, [sp, #0x38]
0009ef96  bne     #0x9ef78
0009ef98  ldr     r0, [sp, #0x18]
0009ef9a  blx     #0xdd5a8 ; -> ZdlPv
0009ef9e  b       #0x9eeb0
0009efa0  str     r0, [sp, #0x20]
0009efa2  str     r0, [sp, #0x1c]
0009efa4  b       #0x9ee98
0009efa6  ldr     r3, [sp, #0x40]
0009efa8  ldr     r2, [sp, #0x44]
0009efaa  cmp     r3, #1
0009efac  str     r2, [sp]
0009efae  beq     #0x9efce
0009efb0  cmp     r3, #2
0009efb2  beq     #0x9efd6
0009efb4  cmp     r3, #3
0009efb6  beq     #0x9efec
0009efb8  ldr     r0, [sp, #0x2c]
0009efba  movs    r3, #0
0009efbc  str     r3, [sp, #0x40]
0009efbe  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009efc2  ldr     r0, [sp]
0009efc4  mov.w   r3, #-1
0009efc8  str     r3, [sp, #0x40]
0009efca  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009efce  ldr     r0, [sp, #0x24]
0009efd0  movs    r3, #0
0009efd2  str     r3, [sp, #0x40]
0009efd4  b       #0x9efbe
0009efd6  ldr     r3, [pc, #0xa0]
0009efd8  ldr     r2, [sp, #0xc]
0009efda  add     r3, pc ; -> 0x000f343c  ZTVN4midp10array_baseE
0009efdc  ldr     r3, [r3]
0009efde  adds    r3, #8
0009efe0  str     r3, [r2]
0009efe2  ldr     r0, [sp, #0xc]
0009efe4  movs    r3, #0
0009efe6  str     r3, [sp, #0x40]
0009efe8  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009efec  ldr     r3, [sp, #4]
0009efee  ldr     r2, [sp]
0009eff0  ldr     r1, [sp, #4]
0009eff2  adds    r3, #4
0009eff4  str     r3, [sp, #0x24]
0009eff6  ldr     r3, [pc, #0x84]
0009eff8  str     r2, [sp, #8]
0009effa  add     r3, pc ; -> 0x0017df98  ZTVN4util8VectorSEIN4midp6StringEEE
0009effc  adds    r3, #8
0009effe  str     r3, [r1, #4]
0009f000  ldr     r3, [r1, #0x14]
0009f002  cmp     r3, #0
0009f004  ble     #0x9f032
0009f006  movs    r3, #0
0009f008  str     r3, [sp, #0x28]
0009f00a  ldr     r1, [sp, #4]
0009f00c  ldr     r3, [sp, #0x28]
0009f00e  ldr     r2, [r1, #0x18]
0009f010  ldr     r1, [sp, #0x28]
0009f012  ldr.w   r0, [r2, r3, lsl #2]
0009f016  movs    r3, #0
0009f018  str.w   r3, [r2, r1, lsl #2]
0009f01c  adds    r3, #2
0009f01e  str     r3, [sp, #0x40]
0009f020  bl      #0x9f614 ; -> ZN4midp6DECREFEPNS_16ReferenceCountedE
0009f024  ldr     r1, [sp, #4]
0009f026  ldr     r2, [sp, #0x28]
0009f028  adds    r2, #1
0009f02a  str     r2, [sp, #0x28]
0009f02c  ldr     r3, [r1, #0x14]
0009f02e  cmp     r3, r2
0009f030  bgt     #0x9f00a
0009f032  ldr     r2, [sp, #4]
0009f034  movs    r3, #0
0009f036  ldr     r0, [r2, #0x18]
0009f038  str     r3, [r2, #0x14]
0009f03a  cbz     r0, #0x9f040
0009f03c  blx     #0xdd59c ; -> ZdaPv
0009f040  ldr     r0, [sp, #0x24]
0009f042  movs    r3, #0
0009f044  str     r3, [sp, #0x40]
0009f046  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009f04a  ldr     r3, [sp, #8]
0009f04c  str     r3, [sp]
0009f04e  ldr     r0, [sp]
0009f050  mov.w   r3, #-1
0009f054  str     r3, [sp, #0x40]
0009f056  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009f05a  nop     
0009f05c  rors    r4, r2
0009f05e  movs    r5, r0
0009f060  strh.w  r0, [r4, r4]
0009f064  lsls    r2, r1, #5
0009f066  movs    r0, r0
0009f068  eors    r0, r4, #0xd
