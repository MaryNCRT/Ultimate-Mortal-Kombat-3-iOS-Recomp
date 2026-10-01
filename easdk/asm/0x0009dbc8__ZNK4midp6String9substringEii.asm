========================================================================
ZNK4midp6String9substringEii  0x0009dbc8  184 bytes   JString.cpp
========================================================================

0009dbc8  push    {r4, r5, r6, r7, lr}
0009dbca  add     r7, sp, #0xc
0009dbcc  push.w  {r8, sl, fp}
0009dbd0  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009dbd4  sub     sp, #0x50
0009dbd6  ldr     r3, [pc, #0x9c]
0009dbd8  str     r0, [sp, #0xc]
0009dbda  add     r0, sp, #0x1c
0009dbdc  add     r3, pc ; -> 0x000f301c  0x0
0009dbde  str     r1, [sp, #8]
0009dbe0  ldr     r3, [r3]
0009dbe2  str     r2, [sp, #4]
0009dbe4  str     r7, [sp, #0x3c]
0009dbe6  str.w   sp, [sp, #0x44]
0009dbea  str     r3, [sp, #0x34]
0009dbec  ldr     r3, [pc, #0x88]
0009dbee  add     r3, pc ; -> 0x000ee618  GCC_except_table3
0009dbf0  str     r3, [sp, #0x38]
0009dbf2  ldr     r3, [pc, #0x88]
0009dbf4  add     r3, pc ; -> 0x0009dc5c  
0009dbf6  orr     r3, r3, #1
0009dbfa  str     r3, [sp, #0x40]
0009dbfc  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009dc00  movs    r0, #0x14
0009dc02  mov.w   r3, #-1
0009dc06  str     r3, [sp, #0x20]
0009dc08  blx     #0xdd5c0 ; -> Znwm
0009dc0c  movs    r3, #1
0009dc0e  str     r3, [sp, #0x20]
0009dc10  str     r0, [sp, #0x18]
0009dc12  bl      #0x9d9e4 ; -> ZN4midp6StringC1Ev
0009dc16  ldr     r0, [sp, #0xc]
0009dc18  mov.w   r3, #-1
0009dc1c  str     r3, [sp, #0x20]
0009dc1e  bl      #0x9d9f0 ; -> ZNK4midp6String6lengthEv
0009dc22  ldr     r3, [sp, #8]
0009dc24  cmp     r0, r3
0009dc26  ble     #0x9dc42
0009dc28  ldr     r2, [sp, #4]
0009dc2a  str     r3, [sp, #0x10]
0009dc2c  movs    r0, #0
0009dc2e  subs    r2, r2, r3
0009dc30  ldr     r3, [sp, #0xc]
0009dc32  str     r2, [sp, #0x14]
0009dc34  ldr     r1, [r3, #8]
0009dc36  add     r2, sp, #0x10
0009dc38  ldm     r2, {r2, r3}
0009dc3a  blx     #0xdd1dc ; -> CFStringCreateWithSubstring
0009dc3e  ldr     r2, [sp, #0x18]
0009dc40  str     r0, [r2, #8]
0009dc42  add     r0, sp, #0x1c
0009dc44  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009dc48  ldr     r0, [sp, #0x18]
0009dc4a  sub.w   sp, r7, #0x58
0009dc4e  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009dc52  sub.w   sp, r7, #0x18
0009dc56  pop.w   {r8, sl, fp}
0009dc5a  pop     {r4, r5, r6, r7, pc}
0009dc5c  ldr     r2, [sp, #0x24]
0009dc5e  ldr     r0, [sp, #0x18]
0009dc60  str     r2, [sp]
0009dc62  blx     #0xdd5a8 ; -> ZdlPv
0009dc66  ldr     r0, [sp]
0009dc68  mov.w   r3, #-1
0009dc6c  str     r3, [sp, #0x20]
0009dc6e  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009dc72  nop     
0009dc74  strb    r4, [r7, r0]
0009dc76  movs    r5, r0
0009dc78  lsrs    r6, r4, #8
0009dc7a  movs    r5, r0
0009dc7c  lsls    r4, r4, #1
0009dc7e  movs    r0, r0
