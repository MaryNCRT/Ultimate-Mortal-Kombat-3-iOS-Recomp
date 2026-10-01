========================================================================
ZN4util8VectorSEIN4midp6StringEED1Ev  0x0009f808  208 bytes   LocaleManager.mm
========================================================================

0009f808  push    {r4, r5, r6, r7, lr}
0009f80a  add     r7, sp, #0xc
0009f80c  push.w  {r8, sl, fp}
0009f810  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009f814  sub     sp, #0x40
0009f816  ldr     r3, [pc, #0xac]
0009f818  str     r0, [sp, #4]
0009f81a  add     r0, sp, #0xc
0009f81c  add     r3, pc ; -> 0x000f301c  0x0
0009f81e  str     r7, [sp, #0x2c]
0009f820  ldr     r3, [r3]
0009f822  str.w   sp, [sp, #0x34]
0009f826  str     r3, [sp, #0x24]
0009f828  ldr     r3, [pc, #0x9c]
0009f82a  add     r3, pc ; -> 0x000ee648  GCC_except_table3
0009f82c  str     r3, [sp, #0x28]
0009f82e  ldr     r3, [pc, #0x9c]
0009f830  add     r3, pc ; -> 0x0009f8a8  
0009f832  orr     r3, r3, #1
0009f836  str     r3, [sp, #0x30]
0009f838  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009f83c  ldr     r1, [sp, #4]
0009f83e  ldr     r3, [pc, #0x90]
0009f840  add     r3, pc ; -> 0x0017df98  ZTVN4util8VectorSEIN4midp6StringEEE
0009f842  adds    r3, #8
0009f844  str     r3, [r1]
0009f846  ldr     r3, [r1, #0x10]
0009f848  cmp     r3, #0
0009f84a  ble     #0x9f876
0009f84c  movs    r2, #0
0009f84e  str     r2, [sp, #8]
0009f850  ldr     r3, [sp, #4]
0009f852  ldr     r1, [sp, #8]
0009f854  ldr     r2, [r3, #0x14]
0009f856  movs    r3, #0
0009f858  ldr.w   r0, [r2, r1, lsl #2]
0009f85c  str.w   r3, [r2, r1, lsl #2]
0009f860  adds    r3, #1
0009f862  str     r3, [sp, #0x10]
0009f864  bl      #0x9f614 ; -> ZN4midp6DECREFEPNS_16ReferenceCountedE
0009f868  ldr     r1, [sp, #4]
0009f86a  ldr     r2, [sp, #8]
0009f86c  adds    r2, #1
0009f86e  str     r2, [sp, #8]
0009f870  ldr     r3, [r1, #0x10]
0009f872  cmp     r3, r2
0009f874  bgt     #0x9f850
0009f876  ldr     r2, [sp, #4]
0009f878  movs    r3, #0
0009f87a  ldr     r0, [r2, #0x14]
0009f87c  str     r3, [r2, #0x10]
0009f87e  cbz     r0, #0x9f884
0009f880  blx     #0xdd59c ; -> ZdaPv
0009f884  ldr     r0, [sp, #4]
0009f886  mov.w   r3, #-1
0009f88a  str     r3, [sp, #0x10]
0009f88c  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009f890  add     r0, sp, #0xc
0009f892  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009f896  sub.w   sp, r7, #0x58
0009f89a  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009f89e  sub.w   sp, r7, #0x18
0009f8a2  pop.w   {r8, sl, fp}
0009f8a6  pop     {r4, r5, r6, r7, pc}
0009f8a8  ldr     r3, [sp, #0x14]
0009f8aa  ldr     r0, [sp, #4]
0009f8ac  str     r3, [sp]
0009f8ae  movs    r3, #0
0009f8b0  str     r3, [sp, #0x10]
0009f8b2  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009f8b6  ldr     r0, [sp]
0009f8b8  mov.w   r3, #-1
0009f8bc  str     r3, [sp, #0x10]
0009f8be  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009f8c2  nop     
0009f8c4  adds    r7, #0xfc
0009f8c6  movs    r5, r0
0009f8c8  cdp     p0, #1, c0, c10, c4, #0
0009f8cc  lsls    r4, r6, #1
0009f8ce  movs    r0, r0
0009f8d0  b       #0x9f77c
0009f8d2  movs    r5, r1
0009f8d4  nop     
0009f8d6  nop     
