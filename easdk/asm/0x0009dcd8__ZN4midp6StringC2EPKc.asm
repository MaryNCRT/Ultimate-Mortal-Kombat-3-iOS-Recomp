========================================================================
ZN4midp6StringC2EPKc  0x0009dcd8  172 bytes   JString.cpp
========================================================================

0009dcd8  push    {r4, r5, r6, r7, lr}
0009dcda  add     r7, sp, #0xc
0009dcdc  push.w  {r8, sl, fp}
0009dce0  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009dce4  sub     sp, #0x40
0009dce6  ldr     r3, [pc, #0x8c]
0009dce8  str     r0, [sp, #8]
0009dcea  add     r0, sp, #0xc
0009dcec  add     r3, pc ; -> 0x000f301c  0x0
0009dcee  str     r1, [sp, #4]
0009dcf0  ldr     r3, [r3]
0009dcf2  str     r7, [sp, #0x2c]
0009dcf4  str.w   sp, [sp, #0x34]
0009dcf8  str     r3, [sp, #0x24]
0009dcfa  ldr     r3, [pc, #0x7c]
0009dcfc  add     r3, pc ; -> 0x000ee61e  GCC_except_table5
0009dcfe  str     r3, [sp, #0x28]
0009dd00  ldr     r3, [pc, #0x78]
0009dd02  add     r3, pc ; -> 0x0009dd5a  
0009dd04  orr     r3, r3, #1
0009dd08  str     r3, [sp, #0x30]
0009dd0a  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009dd0e  ldr     r0, [sp, #8]
0009dd10  mov.w   r3, #-1
0009dd14  str     r3, [sp, #0x10]
0009dd16  bl      #0x9e29c ; -> ZN4midp6ObjectC2Ev
0009dd1a  ldr     r2, [sp, #8]
0009dd1c  ldr     r3, [pc, #0x60]
0009dd1e  movs    r0, #0
0009dd20  add     r3, pc ; -> 0x0017ddfc  ZTVN4midp6StringE
0009dd22  adds    r3, #8
0009dd24  str     r0, [r2, #8]
0009dd26  str     r3, [r2]
0009dd28  strb    r0, [r2, #0xc]
0009dd2a  str     r0, [r2, #0x10]
0009dd2c  ldr     r3, [sp, #4]
0009dd2e  cbz     r3, #0x9dd42
0009dd30  movs    r3, #1
0009dd32  ldr     r1, [sp, #4]
0009dd34  str     r3, [sp, #0x10]
0009dd36  mov.w   r2, #0x600
0009dd3a  blx     #0xdd1c4 ; -> CFStringCreateWithCString
0009dd3e  ldr     r2, [sp, #8]
0009dd40  str     r0, [r2, #8]
0009dd42  add     r0, sp, #0xc
0009dd44  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009dd48  sub.w   sp, r7, #0x58
0009dd4c  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009dd50  sub.w   sp, r7, #0x18
0009dd54  pop.w   {r8, sl, fp}
0009dd58  pop     {r4, r5, r6, r7, pc}
0009dd5a  ldr     r3, [sp, #0x14]
0009dd5c  ldr     r0, [sp, #8]
0009dd5e  str     r3, [sp]
0009dd60  movs    r3, #0
0009dd62  str     r3, [sp, #0x10]
0009dd64  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009dd68  ldr     r0, [sp]
0009dd6a  mov.w   r3, #-1
0009dd6e  str     r3, [sp, #0x10]
0009dd70  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009dd74  strh    r4, [r5, r4]
0009dd76  movs    r5, r0
0009dd78  lsrs    r6, r3, #4
0009dd7a  movs    r5, r0
0009dd7c  lsls    r4, r2, #1
0009dd7e  movs    r0, r0
0009dd80  lsls    r0, r3, #3
0009dd82  movs    r6, r1
