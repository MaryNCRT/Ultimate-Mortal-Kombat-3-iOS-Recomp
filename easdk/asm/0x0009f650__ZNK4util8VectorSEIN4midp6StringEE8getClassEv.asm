========================================================================
ZNK4util8VectorSEIN4midp6StringEE8getClassEv  0x0009f650  148 bytes   LocaleManager.mm
========================================================================

0009f650  push    {r4, r5, r6, r7, lr}
0009f652  add     r7, sp, #0xc
0009f654  push.w  {r8, sl, fp}
0009f658  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009f65c  sub     sp, #0x3c
0009f65e  ldr     r3, [pc, #0x74]
0009f660  add     r0, sp, #8
0009f662  str     r7, [sp, #0x28]
0009f664  add     r3, pc ; -> 0x000f301c  0x0
0009f666  str.w   sp, [sp, #0x30]
0009f66a  ldr     r3, [r3]
0009f66c  str     r3, [sp, #0x20]
0009f66e  ldr     r3, [pc, #0x68]
0009f670  add     r3, pc ; -> 0x000ee63c  GCC_except_table1
0009f672  str     r3, [sp, #0x24]
0009f674  ldr     r3, [pc, #0x64]
0009f676  add     r3, pc ; -> 0x0009f6bc  
0009f678  orr     r3, r3, #1
0009f67c  str     r3, [sp, #0x2c]
0009f67e  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009f682  movs    r0, #8
0009f684  mov.w   r3, #-1
0009f688  str     r3, [sp, #0xc]
0009f68a  blx     #0xdd5c0 ; -> Znwm
0009f68e  movs    r3, #1
0009f690  str     r3, [sp, #0xc]
0009f692  str     r0, [sp, #4]
0009f694  bl      #0x9e2b4 ; -> ZN4midp5ClassC2Ev
0009f698  ldr     r2, [sp, #4]
0009f69a  ldr     r3, [pc, #0x44]
0009f69c  add     r0, sp, #8
0009f69e  add     r3, pc ; -> 0x0017dfec  ZTVN4util8VectorSEIN4midp6StringEE11VectorClassE
0009f6a0  adds    r3, #8
0009f6a2  str     r3, [r2]
0009f6a4  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009f6a8  ldr     r0, [sp, #4]
0009f6aa  sub.w   sp, r7, #0x58
0009f6ae  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009f6b2  sub.w   sp, r7, #0x18
0009f6b6  pop.w   {r8, sl, fp}
0009f6ba  pop     {r4, r5, r6, r7, pc}
0009f6bc  ldr     r2, [sp, #0x10]
0009f6be  ldr     r0, [sp, #4]
0009f6c0  str     r2, [sp]
0009f6c2  blx     #0xdd5a8 ; -> ZdlPv
0009f6c6  ldr     r0, [sp]
0009f6c8  mov.w   r3, #-1
0009f6cc  str     r3, [sp, #0xc]
0009f6ce  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009f6d2  nop     
0009f6d4  subs    r1, #0xb4
0009f6d6  movs    r5, r0
0009f6d8  vaddl.s8 q8, d8, d4
0009f6dc  lsls    r2, r0, #1
0009f6de  movs    r0, r0
0009f6e0  strd    r0, r0, [sl, #-0x34]
