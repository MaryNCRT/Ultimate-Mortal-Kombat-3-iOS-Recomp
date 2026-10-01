========================================================================
ZNK4midp10array_base8getClassEv  0x0009d7c4  148 bytes   JArray.cpp
========================================================================

0009d7c4  push    {r4, r5, r6, r7, lr}
0009d7c6  add     r7, sp, #0xc
0009d7c8  push.w  {r8, sl, fp}
0009d7cc  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009d7d0  sub     sp, #0x3c
0009d7d2  ldr     r3, [pc, #0x74]
0009d7d4  add     r0, sp, #8
0009d7d6  str     r7, [sp, #0x28]
0009d7d8  add     r3, pc ; -> 0x000f301c  0x0
0009d7da  str.w   sp, [sp, #0x30]
0009d7de  ldr     r3, [r3]
0009d7e0  str     r3, [sp, #0x20]
0009d7e2  ldr     r3, [pc, #0x68]
0009d7e4  add     r3, pc ; -> 0x000ee5fa  GCC_except_table0
0009d7e6  str     r3, [sp, #0x24]
0009d7e8  ldr     r3, [pc, #0x64]
0009d7ea  add     r3, pc ; -> 0x0009d830  
0009d7ec  orr     r3, r3, #1
0009d7f0  str     r3, [sp, #0x2c]
0009d7f2  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009d7f6  movs    r0, #8
0009d7f8  mov.w   r3, #-1
0009d7fc  str     r3, [sp, #0xc]
0009d7fe  blx     #0xdd5c0 ; -> Znwm
0009d802  movs    r3, #1
0009d804  str     r3, [sp, #0xc]
0009d806  str     r0, [sp, #4]
0009d808  bl      #0x9e2b4 ; -> ZN4midp5ClassC2Ev
0009d80c  ldr     r2, [sp, #4]
0009d80e  ldr     r3, [pc, #0x44]
0009d810  add     r0, sp, #8
0009d812  add     r3, pc ; -> 0x0017ddb0  ZTVN4midp10ArrayClassE
0009d814  adds    r3, #8
0009d816  str     r3, [r2]
0009d818  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009d81c  ldr     r0, [sp, #4]
0009d81e  sub.w   sp, r7, #0x58
0009d822  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009d826  sub.w   sp, r7, #0x18
0009d82a  pop.w   {r8, sl, fp}
0009d82e  pop     {r4, r5, r6, r7, pc}
0009d830  ldr     r2, [sp, #0x10]
0009d832  ldr     r0, [sp, #4]
0009d834  str     r2, [sp]
0009d836  blx     #0xdd5a8 ; -> ZdlPv
0009d83a  ldr     r0, [sp]
0009d83c  mov.w   r3, #-1
0009d840  str     r3, [sp, #0xc]
0009d842  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009d846  nop     
0009d848  ldr     r0, [r0, r1]
0009d84a  movs    r5, r0
0009d84c  lsrs    r2, r2, #0x18
0009d84e  movs    r5, r0
0009d850  lsls    r2, r0, #1
0009d852  movs    r0, r0
0009d854  lsls    r2, r3, #0x16
0009d856  movs    r6, r1
