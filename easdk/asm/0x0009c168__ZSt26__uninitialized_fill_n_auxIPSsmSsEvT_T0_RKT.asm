========================================================================
ZSt26__uninitialized_fill_n_auxIPSsmSsEvT_T0_RKT1_St12__false_type  0x0009c168  292 bytes   Mayhem.mm
========================================================================

0009c168  push    {r4, r5, r6, r7, lr}
0009c16a  add     r7, sp, #0xc
0009c16c  push.w  {r8, sl, fp}
0009c170  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009c174  sub     sp, #0x54
0009c176  ldr     r3, [pc, #0x104]
0009c178  str     r0, [sp, #0xc]
0009c17a  add     r0, sp, #0x1c
0009c17c  add     r3, pc ; -> 0x000f3438  0x0
0009c17e  str     r2, [sp, #4]
0009c180  ldr     r3, [r3]
0009c182  str     r1, [sp, #8]
0009c184  str     r7, [sp, #0x3c]
0009c186  str.w   sp, [sp, #0x44]
0009c18a  str     r3, [sp, #0x34]
0009c18c  ldr     r3, [pc, #0xf0]
0009c18e  add     r3, pc ; -> 0x000ee31c  GCC_except_table58
0009c190  str     r3, [sp, #0x38]
0009c192  ldr     r3, [pc, #0xf0]
0009c194  add     r3, pc ; -> 0x0009c1e6  
0009c196  orr     r3, r3, #1
0009c19a  str     r3, [sp, #0x40]
0009c19c  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009c1a0  ldr     r2, [sp, #8]
0009c1a2  cbz     r2, #0x9c1ce
0009c1a4  ldr     r3, [sp, #0xc]
0009c1a6  str     r3, [sp, #0x18]
0009c1a8  str     r3, [sp, #0x10]
0009c1aa  b       #0x9c1ae
0009c1ac  str     r2, [sp, #0x10]
0009c1ae  ldr     r4, [sp, #0x10]
0009c1b0  cbz     r4, #0x9c1be
0009c1b2  movs    r3, #1
0009c1b4  mov     r0, r4
0009c1b6  str     r3, [sp, #0x20]
0009c1b8  ldr     r1, [sp, #4]
0009c1ba  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009c1be  ldr     r2, [sp, #0x18]
0009c1c0  ldr     r3, [sp, #8]
0009c1c2  adds    r2, #4
0009c1c4  adds.w  r3, r3, #-1
0009c1c8  str     r2, [sp, #0x18]
0009c1ca  str     r3, [sp, #8]
0009c1cc  bne     #0x9c1ac
0009c1ce  add     r0, sp, #0x1c
0009c1d0  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009c1d4  sub.w   sp, r7, #0x58
0009c1d8  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009c1dc  sub.w   sp, r7, #0x18
0009c1e0  pop.w   {r8, sl, fp}
0009c1e4  pop     {r4, r5, r6, r7, pc}
0009c1e6  ldr     r3, [sp, #0x20]
0009c1e8  ldr.w   lr, [sp, #0x24]
0009c1ec  cmp     r3, #1
0009c1ee  str.w   lr, [sp]
0009c1f2  beq     #0x9c22c
0009c1f4  ldr     r0, [sp]
0009c1f6  blx     #0xdd5e4 ; -> cxa_begin_catch
0009c1fa  ldr     r4, [sp, #0xc]
0009c1fc  ldr     r2, [sp, #0x10]
0009c1fe  cmp     r4, r2
0009c200  beq     #0x9c224
0009c202  ldr     r3, [pc, #0x84]
0009c204  add     r3, pc ; -> 0x000f3370  0x0
0009c206  ldr     r3, [r3]
0009c208  str     r3, [sp, #0x14]
0009c20a  ldr     r4, [sp, #0xc]
0009c20c  ldr     r2, [sp, #0x14]
0009c20e  ldr     r3, [r4]
0009c210  sub.w   r0, r3, #0xc
0009c214  cmp     r2, r0
0009c216  bne     #0x9c240
0009c218  ldr     r2, [sp, #0xc]
0009c21a  ldr     r3, [sp, #0x10]
0009c21c  adds    r2, #4
0009c21e  cmp     r3, r2
0009c220  str     r2, [sp, #0xc]
0009c222  bne     #0x9c20a
0009c224  movs    r3, #2
0009c226  str     r3, [sp, #0x20]
0009c228  blx     #0xdd5fc ; -> cxa_rethrow
0009c22c  movs    r3, #0
0009c22e  str     r3, [sp, #0x20]
0009c230  blx     #0xdd5f0 ; -> cxa_end_catch
0009c234  ldr     r0, [sp]
0009c236  mov.w   r3, #-1
0009c23a  str     r3, [sp, #0x20]
0009c23c  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009c240  subs    r2, r3, #4
0009c242  ldr     r3, [r3, #-0x4]
0009c246  subs    r1, r3, #1
0009c248  dmb     ish
0009c24c  mov     ip, r3
0009c24e  ldrex   r4, [r2]
0009c252  cmp     r4, r3
0009c254  beq     #0x9c26a
0009c256  cmp     r4, ip
0009c258  mov     r3, r4
0009c25a  bne     #0x9c246
0009c25c  cmp     r4, #0
0009c25e  bgt     #0x9c218
0009c260  add.w   r1, sp, #0x53
0009c264  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009c268  b       #0x9c218
0009c26a  strex   lr, r1, [r2]
0009c26e  cmp.w   lr, #0
0009c272  bne     #0x9c24e
0009c274  dmb     ish
0009c278  b       #0x9c256
0009c27a  nop     
0009c27c  strb    r0, [r7, #0xa]
0009c27e  movs    r5, r0
0009c280  movs    r1, #0x8a
0009c282  movs    r5, r0
0009c284  lsls    r6, r1, #1
0009c286  movs    r0, r0
0009c288  strb    r0, [r5, #5]
0009c28a  movs    r5, r0
