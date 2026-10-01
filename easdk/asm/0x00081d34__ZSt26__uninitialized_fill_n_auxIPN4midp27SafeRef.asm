========================================================================
ZSt26__uninitialized_fill_n_auxIPN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEEmS4_EvT_T0_RKT1_St12__false_type  0x00081d34  240 bytes   EASDK_Handler.mm
========================================================================

00081d34  push    {r4, r5, r6, r7, lr}
00081d36  add     r7, sp, #0xc
00081d38  push.w  {r8, sl, fp}
00081d3c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00081d40  sub     sp, #0x50
00081d42  ldr     r3, [pc, #0xd4]
00081d44  str     r0, [sp, #0xc]
00081d46  add     r0, sp, #0x1c
00081d48  add     r3, pc ; -> 0x000f301c  0x0
00081d4a  str     r2, [sp, #4]
00081d4c  ldr     r3, [r3]
00081d4e  str     r1, [sp, #8]
00081d50  str     r7, [sp, #0x3c]
00081d52  str.w   sp, [sp, #0x44]
00081d56  str     r3, [sp, #0x34]
00081d58  ldr     r3, [pc, #0xc0]
00081d5a  add     r3, pc ; -> 0x000ee0d4  GCC_except_table6
00081d5c  str     r3, [sp, #0x38]
00081d5e  ldr     r3, [pc, #0xc0]
00081d60  add     r3, pc ; -> 0x00081db4  
00081d62  orr     r3, r3, #1
00081d66  str     r3, [sp, #0x40]
00081d68  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00081d6c  ldr     r2, [sp, #8]
00081d6e  cbz     r2, #0x81d9c
00081d70  ldr     r3, [sp, #0xc]
00081d72  str     r3, [sp, #0x18]
00081d74  str     r3, [sp, #0x10]
00081d76  ldr     r2, [sp, #0x10]
00081d78  cbz     r2, #0x81d8c
00081d7a  ldr     r3, [sp, #4]
00081d7c  ldr     r0, [r3]
00081d7e  str     r0, [r2]
00081d80  cbz     r0, #0x81d8c
00081d82  ldr     r3, [r0]
00081d84  ldr     r2, [r3, #0xc]
00081d86  movs    r3, #1
00081d88  str     r3, [sp, #0x20]
00081d8a  blx     r2
00081d8c  ldr     r3, [sp, #0x18]
00081d8e  ldr     r2, [sp, #8]
00081d90  adds    r3, #4
00081d92  adds.w  r2, r2, #-1
00081d96  str     r3, [sp, #0x18]
00081d98  str     r2, [sp, #8]
00081d9a  bne     #0x81d74
00081d9c  add     r0, sp, #0x1c
00081d9e  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00081da2  sub.w   sp, r7, #0x58
00081da6  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00081daa  sub.w   sp, r7, #0x18
00081dae  pop.w   {r8, sl, fp}
00081db2  pop     {r4, r5, r6, r7, pc}
00081db4  ldr     r3, [sp, #0x20]
00081db6  ldr     r2, [sp, #0x24]
00081db8  cmp     r3, #1
00081dba  str     r2, [sp]
00081dbc  beq     #0x81df6
00081dbe  ldr     r0, [sp]
00081dc0  blx     #0xdd5e4 ; -> cxa_begin_catch
00081dc4  ldr     r3, [sp, #0xc]
00081dc6  ldr     r2, [sp, #0x10]
00081dc8  cmp     r3, r2
00081dca  beq     #0x81dee
00081dcc  ldr     r3, [sp, #0xc]
00081dce  ldr     r3, [r3]
00081dd0  str     r3, [sp, #0x14]
00081dd2  cbz     r3, #0x81de2
00081dd4  ldr     r3, [r3]
00081dd6  ldr     r0, [sp, #0x14]
00081dd8  ldr     r2, [r3, #8]
00081dda  movs    r3, #2
00081ddc  str     r3, [sp, #0x20]
00081dde  blx     r2
00081de0  cbnz    r0, #0x81e0a
00081de2  ldr     r3, [sp, #0xc]
00081de4  ldr     r2, [sp, #0x10]
00081de6  adds    r3, #4
00081de8  cmp     r3, r2
00081dea  str     r3, [sp, #0xc]
00081dec  bne     #0x81dcc
00081dee  movs    r3, #2
00081df0  str     r3, [sp, #0x20]
00081df2  blx     #0xdd5fc ; -> cxa_rethrow
00081df6  movs    r3, #0
00081df8  str     r3, [sp, #0x20]
00081dfa  blx     #0xdd5f0 ; -> cxa_end_catch
00081dfe  ldr     r0, [sp]
00081e00  mov.w   r3, #-1
00081e04  str     r3, [sp, #0x20]
00081e06  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00081e0a  ldr     r2, [sp, #0x14]
00081e0c  ldr     r3, [r2]
00081e0e  mov     r0, r2
00081e10  ldr     r3, [r3, #4]
00081e12  blx     r3
00081e14  b       #0x81de2
00081e16  nop     
00081e18  asrs    r0, r2, #0xb
00081e1a  movs    r7, r0
00081e1c  stm     r3!, {r1, r2, r4, r5, r6}
00081e1e  movs    r6, r0
00081e20  lsls    r0, r2, #1
00081e22  movs    r0, r0
