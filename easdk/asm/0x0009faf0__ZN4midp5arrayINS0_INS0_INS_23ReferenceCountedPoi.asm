========================================================================
ZN4midp5arrayINS0_INS0_INS_23ReferenceCountedPointerINS_6StringEEEEEEEED1Ev  0x0009faf0  284 bytes   LocaleManager.mm
========================================================================

0009faf0  push    {r4, r5, r6, r7, lr}
0009faf2  add     r7, sp, #0xc
0009faf4  push.w  {r8, sl, fp}
0009faf8  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009fafc  sub     sp, #0x54
0009fafe  ldr     r3, [pc, #0xf4]
0009fb00  str     r0, [sp, #4]
0009fb02  add     r0, sp, #0x20
0009fb04  add     r3, pc ; -> 0x000f301c  0x0
0009fb06  str     r7, [sp, #0x40]
0009fb08  ldr     r3, [r3]
0009fb0a  str.w   sp, [sp, #0x48]
0009fb0e  str     r3, [sp, #0x38]
0009fb10  ldr     r3, [pc, #0xe4]
0009fb12  add     r3, pc ; -> 0x000ee69e  GCC_except_table23
0009fb14  str     r3, [sp, #0x3c]
0009fb16  ldr     r3, [pc, #0xe4]
0009fb18  add     r3, pc ; -> 0x0009fbcc  
0009fb1a  orr     r3, r3, #1
0009fb1e  str     r3, [sp, #0x44]
0009fb20  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009fb24  ldr     r2, [sp, #4]
0009fb26  ldr     r3, [pc, #0xd8]
0009fb28  add     r3, pc ; -> 0x0017df1c  ZTVN4midp5arrayINS0_INS0_INS_23ReferenceCountedPointerINS_6StringEEEEEEEEE
0009fb2a  adds    r3, #8
0009fb2c  str     r3, [r2]
0009fb2e  ldr     r3, [r2, #8]
0009fb30  str     r3, [sp, #8]
0009fb32  ldr     r0, [r2, #0xc]
0009fb34  cmp     r0, #0
0009fb36  beq     #0x9fbc6
0009fb38  ldr     r2, [r0, #8]
0009fb3a  str     r2, [sp, #0x18]
0009fb3c  ldrb    r3, [r0, #0x14]
0009fb3e  cmp     r3, #0
0009fb40  ite     ne
0009fb42  movne   r3, #1
0009fb44  moveq   r3, #0
0009fb46  str     r3, [sp, #0x14]
0009fb48  ldr     r3, [sp, #4]
0009fb4a  movs    r2, #0
0009fb4c  str     r2, [r3, #0xc]
0009fb4e  str     r2, [r3, #8]
0009fb50  movs    r3, #1
0009fb52  str     r3, [sp, #0x24]
0009fb54  bl      #0x9f614 ; -> ZN4midp6DECREFEPNS_16ReferenceCountedE
0009fb58  cbz     r0, #0x9fb96
0009fb5a  ldr     r3, [sp, #0x14]
0009fb5c  cbz     r3, #0x9fb96
0009fb5e  ldr     r2, [sp, #0x18]
0009fb60  cbz     r2, #0x9fb96
0009fb62  ldr     r3, [sp, #8]
0009fb64  str     r2, [sp, #0x10]
0009fb66  cmp     r3, #0
0009fb68  ble     #0x9fb90
0009fb6a  str     r2, [sp, #0x1c]
0009fb6c  movs    r2, #0
0009fb6e  str     r2, [sp, #0xc]
0009fb70  ldr     r2, [sp, #0x1c]
0009fb72  ldr     r0, [sp, #0x1c]
0009fb74  ldr     r3, [r2]
0009fb76  ldr     r2, [r3]
0009fb78  movs    r3, #1
0009fb7a  str     r3, [sp, #0x24]
0009fb7c  blx     r2
0009fb7e  ldr     r2, [sp, #0x1c]
0009fb80  ldr     r3, [sp, #0xc]
0009fb82  adds    r2, #0x14
0009fb84  str     r2, [sp, #0x1c]
0009fb86  ldr     r2, [sp, #8]
0009fb88  adds    r3, #1
0009fb8a  str     r3, [sp, #0xc]
0009fb8c  cmp     r3, r2
0009fb8e  bne     #0x9fb70
0009fb90  ldr     r0, [sp, #0x10]
0009fb92  blx     #0xdd5a8 ; -> ZdlPv
0009fb96  ldr     r3, [pc, #0x6c]
0009fb98  ldr     r2, [sp, #4]
0009fb9a  add     r3, pc ; -> 0x000f343c  ZTVN4midp10array_baseE
0009fb9c  ldr     r3, [r3]
0009fb9e  adds    r3, #8
0009fba0  str     r3, [r2]
0009fba2  ldr     r0, [sp, #4]
0009fba4  mov.w   r3, #-1
0009fba8  str     r3, [sp, #0x24]
0009fbaa  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009fbae  add     r0, sp, #0x20
0009fbb0  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009fbb4  sub.w   sp, r7, #0x58
0009fbb8  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009fbbc  sub.w   sp, r7, #0x18
0009fbc0  pop.w   {r8, sl, fp}
0009fbc4  pop     {r4, r5, r6, r7, pc}
0009fbc6  str     r0, [sp, #0x18]
0009fbc8  str     r0, [sp, #0x14]
0009fbca  b       #0x9fb48
0009fbcc  ldr     r3, [sp, #0x28]
0009fbce  ldr     r2, [sp, #4]
0009fbd0  str     r3, [sp]
0009fbd2  ldr     r3, [pc, #0x34]
0009fbd4  add     r3, pc ; -> 0x000f343c  ZTVN4midp10array_baseE
0009fbd6  ldr     r3, [r3]
0009fbd8  adds    r3, #8
0009fbda  str     r3, [r2]
0009fbdc  ldr     r0, [sp, #4]
0009fbde  movs    r3, #0
0009fbe0  str     r3, [sp, #0x24]
0009fbe2  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009fbe6  ldr     r0, [sp]
0009fbe8  mov.w   r3, #-1
0009fbec  str     r3, [sp, #0x24]
0009fbee  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009fbf2  nop     
0009fbf4  adds    r5, #0x14
0009fbf6  movs    r5, r0
