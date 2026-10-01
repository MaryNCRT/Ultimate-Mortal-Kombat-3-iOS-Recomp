========================================================================
ZNK13LocaleManager14getLocaleIndexEPN4midp6StringE  0x0009e794  300 bytes   LocaleManager.mm
========================================================================

0009e794  push    {r4, r5, r6, r7, lr}
0009e796  add     r7, sp, #0xc
0009e798  push.w  {r8, sl, fp}
0009e79c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009e7a0  sub     sp, #0x4c
0009e7a2  ldr     r3, [pc, #0x104]
0009e7a4  str     r0, [sp, #4]
0009e7a6  add     r0, sp, #0x18
0009e7a8  add     r3, pc ; -> 0x000f301c  0x0
0009e7aa  str     r1, [sp]
0009e7ac  ldr     r3, [r3]
0009e7ae  str     r7, [sp, #0x38]
0009e7b0  str.w   sp, [sp, #0x40]
0009e7b4  str     r3, [sp, #0x30]
0009e7b6  ldr     r3, [pc, #0xf4]
0009e7b8  add     r3, pc ; -> 0x000ee65a  GCC_except_table13
0009e7ba  str     r3, [sp, #0x34]
0009e7bc  ldr     r3, [pc, #0xf0]
0009e7be  add     r3, pc ; -> 0x0009e87e  
0009e7c0  orr     r3, r3, #1
0009e7c4  str     r3, [sp, #0x3c]
0009e7c6  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009e7ca  ldr     r2, [sp]
0009e7cc  cmp     r2, #0
0009e7ce  beq     #0x9e84c
0009e7d0  ldr     r2, [sp]
0009e7d2  ldr     r0, [sp]
0009e7d4  str     r2, [sp, #0x14]
0009e7d6  ldr     r3, [r2]
0009e7d8  ldr     r2, [r3, #0xc]
0009e7da  mov.w   r3, #-1
0009e7de  str     r3, [sp, #0x1c]
0009e7e0  blx     r2
0009e7e2  ldr     r3, [sp, #4]
0009e7e4  ldr     r3, [r3, #0x14]
0009e7e6  cmp     r3, #0
0009e7e8  str     r3, [sp, #8]
0009e7ea  ble     #0x9e854
0009e7ec  movs    r3, #0
0009e7ee  str     r3, [sp, #0xc]
0009e7f0  b       #0x9e808
0009e7f2  ldr     r3, [sp, #0xc]
0009e7f4  ldr     r2, [sp, #8]
0009e7f6  adds    r3, #1
0009e7f8  cmp     r3, r2
0009e7fa  str     r3, [sp, #0xc]
0009e7fc  beq     #0x9e854
0009e7fe  ldr     r2, [sp, #4]
0009e800  ldr     r3, [r2, #0x14]
0009e802  ldr     r2, [sp, #0xc]
0009e804  cmp     r3, r2
0009e806  blt     #0x9e868
0009e808  ldr     r2, [sp, #4]
0009e80a  ldr     r1, [sp]
0009e80c  ldr     r3, [r2, #0x18]
0009e80e  ldr     r2, [sp, #0xc]
0009e810  ldr.w   r0, [r3, r2, lsl #2]
0009e814  movs    r3, #1
0009e816  str     r3, [sp, #0x1c]
0009e818  bl      #0x9dfe0 ; -> ZNK4midp6String6equalsEPS0_
0009e81c  cmp     r0, #0
0009e81e  beq     #0x9e7f2
0009e820  ldr     r2, [sp, #0x14]
0009e822  ldr     r0, [sp, #0x14]
0009e824  ldr     r3, [r2]
0009e826  ldr     r2, [r3, #8]
0009e828  mov.w   r3, #-1
0009e82c  str     r3, [sp, #0x1c]
0009e82e  blx     r2
0009e830  cbnz    r0, #0x9e85c
0009e832  add     r0, sp, #0x18
0009e834  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009e838  ldr     r0, [sp, #0xc]
0009e83a  sub.w   sp, r7, #0x58
0009e83e  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009e842  sub.w   sp, r7, #0x18
0009e846  pop.w   {r8, sl, fp}
0009e84a  pop     {r4, r5, r6, r7, pc}
0009e84c  ldr     r3, [sp, #4]
0009e84e  ldr     r3, [r3, #0x20]
0009e850  str     r3, [sp, #0xc]
0009e852  b       #0x9e832
0009e854  mov.w   r3, #-1
0009e858  str     r3, [sp, #0xc]
0009e85a  b       #0x9e820
0009e85c  ldr     r2, [sp, #0x14]
0009e85e  ldr     r3, [r2]
0009e860  mov     r0, r2
0009e862  ldr     r3, [r3, #4]
0009e864  blx     r3
0009e866  b       #0x9e832
0009e868  ldr     r0, [pc, #0x48]
0009e86a  ldr     r1, [pc, #0x4c]
0009e86c  ldr     r3, [pc, #0x4c]
0009e86e  movs    r2, #1
0009e870  add     r0, pc ; -> 0x000e5c7c  ZZNK4util8VectorSEIN4midp6StringEE9elementAtEiE8__func__
0009e872  str     r2, [sp, #0x1c]
0009e874  add     r1, pc ; -> 0x001764b0  '../../src/EA_SDK/util/Vector.h'
0009e876  add     r3, pc ; -> 0x001764d0  'false'
0009e878  adds    r2, #0xa2
0009e87a  blx     #0xdd5cc ; -> assert_rtn
0009e87e  ldr     r3, [sp, #0x20]
0009e880  ldr     r2, [sp, #0x14]
0009e882  ldr     r0, [sp, #0x14]
0009e884  str     r3, [sp, #0x10]
0009e886  ldr     r3, [r2]
0009e888  ldr     r2, [r3, #8]
0009e88a  movs    r3, #0
0009e88c  str     r3, [sp, #0x1c]
0009e88e  blx     r2
0009e890  cbz     r0, #0x9e89c
0009e892  ldr     r2, [sp, #0x14]
0009e894  ldr     r3, [r2]
0009e896  mov     r0, r2
0009e898  ldr     r3, [r3, #4]
0009e89a  blx     r3
0009e89c  ldr     r0, [sp, #0x10]
0009e89e  mov.w   r3, #-1
0009e8a2  str     r3, [sp, #0x1c]
0009e8a4  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009e8a8  ldr     r0, [pc, #0x1c0]
0009e8aa  movs    r5, r0
0009e8ac  cdp2    p0, #9, c0, c14, c4, #0
0009e8b0  lsls    r4, r7, #2
0009e8b2  movs    r0, r0
0009e8b4  strb    r0, [r1, #0x10]
0009e8b6  movs    r4, r0
0009e8b8  ldrb    r0, [r7, #0x10]
0009e8ba  movs    r5, r1
0009e8bc  ldrb    r6, [r2, #0x11]
0009e8be  movs    r5, r1
