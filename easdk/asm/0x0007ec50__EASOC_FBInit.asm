========================================================================
EASOC_FBInit  0x0007ec50  176 bytes   EASDK_Handler.mm
========================================================================

0007ec50  push    {r4, r5, r6, r7, lr}
0007ec52  add     r7, sp, #0xc
0007ec54  push.w  {r8, sl, fp}
0007ec58  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0007ec5c  sub     sp, #0x3c
0007ec5e  ldr     r3, [pc, #0x84]
0007ec60  add     r0, sp, #8
0007ec62  str     r7, [sp, #0x28]
0007ec64  add     r3, pc ; -> 0x000f301c  0x0
0007ec66  str.w   sp, [sp, #0x30]
0007ec6a  ldr     r3, [r3]
0007ec6c  str     r3, [sp, #0x20]
0007ec6e  ldr     r3, [pc, #0x78]
0007ec70  add     r3, pc ; -> 0x000ee0b4  GCC_except_table0
0007ec72  str     r3, [sp, #0x24]
0007ec74  ldr     r3, [pc, #0x74]
0007ec76  add     r3, pc ; -> 0x0007ecce  
0007ec78  orr     r3, r3, #1
0007ec7c  str     r3, [sp, #0x2c]
0007ec7e  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0007ec82  ldr     r3, [pc, #0x6c]
0007ec84  add     r3, pc ; -> 0x00175898  conn
0007ec86  ldr     r3, [r3]
0007ec88  cbz     r3, #0x7ecb0
0007ec8a  ldr     r0, [pc, #0x68]
0007ec8c  mov.w   r3, #-1
0007ec90  str     r3, [sp, #0xc]
0007ec92  add     r0, pc ; -> 0x0017e454  kGraphBaseURL+0x324
0007ec94  blx     #0xdd3e0 ; -> NSLog
0007ec98  add     r0, sp, #8
0007ec9a  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0007ec9e  sub.w   sp, r7, #0x58
0007eca2  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0007eca6  sub.w   sp, r7, #0x18
0007ecaa  pop.w   {r8, sl, fp}
0007ecae  pop     {r4, r5, r6, r7, pc}
0007ecb0  movs    r0, #0x2c
0007ecb2  subs    r3, #1
0007ecb4  str     r3, [sp, #0xc]
0007ecb6  blx     #0xdd5c0 ; -> Znwm
0007ecba  movs    r3, #1
0007ecbc  str     r3, [sp, #0xc]
0007ecbe  str     r0, [sp, #4]
0007ecc0  bl      #0x89b7c ; -> ZN12FBConnectionC1Ev
0007ecc4  ldr     r3, [pc, #0x30]
0007ecc6  ldr     r2, [sp, #4]
0007ecc8  add     r3, pc ; -> 0x00175898  conn
0007ecca  str     r2, [r3]
0007eccc  b       #0x7ec8a
0007ecce  ldr     r2, [sp, #0x10]
0007ecd0  ldr     r0, [sp, #4]
0007ecd2  str     r2, [sp]
0007ecd4  blx     #0xdd5a8 ; -> ZdlPv
0007ecd8  ldr     r0, [sp]
0007ecda  mov.w   r3, #-1
0007ecde  str     r3, [sp, #0xc]
0007ece0  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0007ece4  bics    r4, r6
0007ece6  movs    r7, r0
0007ece8  orr     r0, r0, #0x860000
0007ecec  lsls    r4, r2, #1
0007ecee  movs    r0, r0
0007ecf0  ldr     r0, [r2, #0x40]
0007ecf2  movs    r7, r1
