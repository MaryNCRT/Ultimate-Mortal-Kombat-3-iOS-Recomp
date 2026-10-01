========================================================================
ZN4midp6StringD0Ev  0x0009da78  168 bytes   JString.cpp
========================================================================

0009da78  push    {r4, r5, r6, r7, lr}
0009da7a  add     r7, sp, #0xc
0009da7c  push.w  {r8, sl, fp}
0009da80  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009da84  sub     sp, #0x3c
0009da86  ldr     r3, [pc, #0x84]
0009da88  str     r0, [sp, #4]
0009da8a  add     r0, sp, #8
0009da8c  add     r3, pc ; -> 0x000f301c  0x0
0009da8e  str     r7, [sp, #0x28]
0009da90  ldr     r3, [r3]
0009da92  str.w   sp, [sp, #0x30]
0009da96  str     r3, [sp, #0x20]
0009da98  ldr     r3, [pc, #0x74]
0009da9a  add     r3, pc ; -> 0x000ee60c  GCC_except_table1
0009da9c  str     r3, [sp, #0x24]
0009da9e  ldr     r3, [pc, #0x74]
0009daa0  add     r3, pc ; -> 0x0009daf0  
0009daa2  orr     r3, r3, #1
0009daa6  str     r3, [sp, #0x2c]
0009daa8  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009daac  ldr     r2, [sp, #4]
0009daae  ldr     r3, [pc, #0x68]
0009dab0  ldr     r0, [r2, #8]
0009dab2  add     r3, pc ; -> 0x0017ddfc  ZTVN4midp6StringE
0009dab4  adds    r3, #8
0009dab6  str     r3, [r2]
0009dab8  cbz     r0, #0x9dac2
0009daba  movs    r3, #1
0009dabc  str     r3, [sp, #0xc]
0009dabe  blx     #0xdd14c ; -> CFRelease
0009dac2  ldr     r2, [sp, #4]
0009dac4  movs    r3, #0
0009dac6  str     r3, [r2, #8]
0009dac8  ldr     r0, [sp, #4]
0009daca  subs    r3, #1
0009dacc  str     r3, [sp, #0xc]
0009dace  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009dad2  ldr     r0, [sp, #4]
0009dad4  blx     #0xdd5a8 ; -> ZdlPv
0009dad8  add     r0, sp, #8
0009dada  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009dade  sub.w   sp, r7, #0x58
0009dae2  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009dae6  sub.w   sp, r7, #0x18
0009daea  pop.w   {r8, sl, fp}
0009daee  pop     {r4, r5, r6, r7, pc}
0009daf0  ldr     r3, [sp, #0x10]
0009daf2  ldr     r0, [sp, #4]
0009daf4  str     r3, [sp]
0009daf6  movs    r3, #0
0009daf8  str     r3, [sp, #0xc]
0009dafa  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009dafe  ldr     r0, [sp]
0009db00  mov.w   r3, #-1
0009db04  str     r3, [sp, #0xc]
0009db06  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009db0a  nop     
0009db0c  strb    r4, [r1, r6]
0009db0e  movs    r5, r0
0009db10  lsrs    r6, r5, #0xd
0009db12  movs    r5, r0
0009db14  lsls    r4, r1, #1
0009db16  movs    r0, r0
0009db18  lsls    r6, r0, #0xd
0009db1a  movs    r6, r1
0009db1c  nop     
0009db1e  nop     
