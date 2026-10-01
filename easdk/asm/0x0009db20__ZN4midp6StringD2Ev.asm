========================================================================
ZN4midp6StringD2Ev  0x0009db20  156 bytes   JString.cpp
========================================================================

0009db20  push    {r4, r5, r6, r7, lr}
0009db22  add     r7, sp, #0xc
0009db24  push.w  {r8, sl, fp}
0009db28  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009db2c  sub     sp, #0x3c
0009db2e  ldr     r3, [pc, #0x7c]
0009db30  str     r0, [sp, #4]
0009db32  add     r0, sp, #8
0009db34  add     r3, pc ; -> 0x000f301c  0x0
0009db36  str     r7, [sp, #0x28]
0009db38  ldr     r3, [r3]
0009db3a  str.w   sp, [sp, #0x30]
0009db3e  str     r3, [sp, #0x20]
0009db40  ldr     r3, [pc, #0x6c]
0009db42  add     r3, pc ; -> 0x000ee612  GCC_except_table2
0009db44  str     r3, [sp, #0x24]
0009db46  ldr     r3, [pc, #0x6c]
0009db48  add     r3, pc ; -> 0x0009db92  
0009db4a  orr     r3, r3, #1
0009db4e  str     r3, [sp, #0x2c]
0009db50  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009db54  ldr     r2, [sp, #4]
0009db56  ldr     r3, [pc, #0x60]
0009db58  ldr     r0, [r2, #8]
0009db5a  add     r3, pc ; -> 0x0017ddfc  ZTVN4midp6StringE
0009db5c  adds    r3, #8
0009db5e  str     r3, [r2]
0009db60  cbz     r0, #0x9db6a
0009db62  movs    r3, #1
0009db64  str     r3, [sp, #0xc]
0009db66  blx     #0xdd14c ; -> CFRelease
0009db6a  ldr     r2, [sp, #4]
0009db6c  movs    r3, #0
0009db6e  str     r3, [r2, #8]
0009db70  ldr     r0, [sp, #4]
0009db72  subs    r3, #1
0009db74  str     r3, [sp, #0xc]
0009db76  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009db7a  add     r0, sp, #8
0009db7c  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009db80  sub.w   sp, r7, #0x58
0009db84  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009db88  sub.w   sp, r7, #0x18
0009db8c  pop.w   {r8, sl, fp}
0009db90  pop     {r4, r5, r6, r7, pc}
0009db92  ldr     r3, [sp, #0x10]
0009db94  ldr     r0, [sp, #4]
0009db96  str     r3, [sp]
0009db98  movs    r3, #0
0009db9a  str     r3, [sp, #0xc]
0009db9c  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009dba0  ldr     r0, [sp]
0009dba2  mov.w   r3, #-1
0009dba6  str     r3, [sp, #0xc]
0009dba8  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009dbac  strb    r4, [r4, r3]
0009dbae  movs    r5, r0
0009dbb0  lsrs    r4, r1, #0xb
0009dbb2  movs    r5, r0
0009dbb4  lsls    r6, r0, #1
0009dbb6  movs    r0, r0
0009dbb8  lsls    r6, r3, #0xa
0009dbba  movs    r6, r1
