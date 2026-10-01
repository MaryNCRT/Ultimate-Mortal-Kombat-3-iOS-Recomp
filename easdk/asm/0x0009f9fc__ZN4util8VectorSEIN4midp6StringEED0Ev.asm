========================================================================
ZN4util8VectorSEIN4midp6StringEED0Ev  0x0009f9fc  244 bytes   LocaleManager.mm
========================================================================

0009f9fc  push    {r4, r5, r6, r7, lr}
0009f9fe  add     r7, sp, #0xc
0009fa00  push.w  {r8, sl, fp}
0009fa04  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009fa08  sub     sp, #0x44
0009fa0a  ldr     r3, [pc, #0xd0]
0009fa0c  str     r0, [sp, #4]
0009fa0e  add     r0, sp, #0x10
0009fa10  add     r3, pc ; -> 0x000f301c  0x0
0009fa12  str     r7, [sp, #0x30]
0009fa14  ldr     r3, [r3]
0009fa16  str.w   sp, [sp, #0x38]
0009fa1a  str     r3, [sp, #0x28]
0009fa1c  ldr     r3, [pc, #0xc0]
0009fa1e  add     r3, pc ; -> 0x000ee654  GCC_except_table10
0009fa20  str     r3, [sp, #0x2c]
0009fa22  ldr     r3, [pc, #0xc0]
0009fa24  add     r3, pc ; -> 0x0009fac2  
0009fa26  orr     r3, r3, #1
0009fa2a  str     r3, [sp, #0x34]
0009fa2c  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009fa30  ldr     r1, [sp, #4]
0009fa32  ldr     r3, [pc, #0xb4]
0009fa34  add     r3, pc ; -> 0x0017df98  ZTVN4util8VectorSEIN4midp6StringEEE
0009fa36  adds    r3, #8
0009fa38  str     r3, [r1]
0009fa3a  ldr     r3, [r1, #0x10]
0009fa3c  cmp     r3, #0
0009fa3e  ble     #0x9fa8a
0009fa40  movs    r2, #0
0009fa42  str     r2, [sp, #0xc]
0009fa44  b       #0x9fa54
0009fa46  ldr     r1, [sp, #4]
0009fa48  ldr     r2, [sp, #0xc]
0009fa4a  adds    r2, #1
0009fa4c  str     r2, [sp, #0xc]
0009fa4e  ldr     r3, [r1, #0x10]
0009fa50  cmp     r3, r2
0009fa52  ble     #0x9fa8a
0009fa54  ldr     r3, [sp, #4]
0009fa56  ldr     r1, [sp, #0xc]
0009fa58  ldr     r2, [r3, #0x14]
0009fa5a  movs    r3, #0
0009fa5c  ldr.w   r1, [r2, r1, lsl #2]
0009fa60  str     r1, [sp, #8]
0009fa62  ldr     r1, [sp, #0xc]
0009fa64  str.w   r3, [r2, r1, lsl #2]
0009fa68  ldr     r2, [sp, #8]
0009fa6a  cmp     r2, #0
0009fa6c  beq     #0x9fa46
0009fa6e  ldr     r3, [r2]
0009fa70  ldr     r0, [sp, #8]
0009fa72  ldr     r2, [r3, #8]
0009fa74  movs    r3, #1
0009fa76  str     r3, [sp, #0x14]
0009fa78  blx     r2
0009fa7a  cmp     r0, #0
0009fa7c  beq     #0x9fa46
0009fa7e  ldr     r1, [sp, #8]
0009fa80  ldr     r3, [r1]
0009fa82  mov     r0, r1
0009fa84  ldr     r3, [r3, #4]
0009fa86  blx     r3
0009fa88  b       #0x9fa46
0009fa8a  ldr     r2, [sp, #4]
0009fa8c  movs    r3, #0
0009fa8e  ldr     r0, [r2, #0x14]
0009fa90  str     r3, [r2, #0x10]
0009fa92  cbz     r0, #0x9fa98
0009fa94  blx     #0xdd59c ; -> ZdaPv
0009fa98  ldr     r0, [sp, #4]
0009fa9a  mov.w   r3, #-1
0009fa9e  str     r3, [sp, #0x14]
0009faa0  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009faa4  ldr     r0, [sp, #4]
0009faa6  blx     #0xdd5a8 ; -> ZdlPv
0009faaa  add     r0, sp, #0x10
0009faac  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009fab0  sub.w   sp, r7, #0x58
0009fab4  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009fab8  sub.w   sp, r7, #0x18
0009fabc  pop.w   {r8, sl, fp}
0009fac0  pop     {r4, r5, r6, r7, pc}
0009fac2  ldr     r3, [sp, #0x18]
0009fac4  ldr     r0, [sp, #4]
0009fac6  str     r3, [sp]
0009fac8  movs    r3, #0
0009faca  str     r3, [sp, #0x14]
0009facc  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009fad0  ldr     r0, [sp]
0009fad2  mov.w   r3, #-1
0009fad6  str     r3, [sp, #0x14]
0009fad8  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009fadc  adds    r6, #8
0009fade  movs    r5, r0
0009fae0  ldc     p0, c0, [r2], #-0x10
0009fae4  lsls    r2, r3, #2
0009fae6  movs    r0, r0
0009fae8  b       #0x9f5ac
0009faea  movs    r5, r1
0009faec  nop     
0009faee  nop     
