========================================================================
ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE11lower_boundERS1_  0x0009b59c  96 bytes   Mayhem.mm
========================================================================

0009b59c  push    {r4, r5, r6, r7, lr}
0009b59e  add     r7, sp, #0xc
0009b5a0  push.w  {r8, sl, fp}
0009b5a4  sub     sp, #8
0009b5a6  ldr     r5, [r0, #8]
0009b5a8  add.w   fp, r0, #4
0009b5ac  cbz     r5, #0x9b5e4
0009b5ae  ldr.w   r8, [r1]
0009b5b2  sub.w   sl, r8, #0xc
0009b5b6  ldr     r0, [r5, #0x10]
0009b5b8  mov     r1, r8
0009b5ba  ldr     r6, [r0, #-0xc]
0009b5be  str     r6, [sp, #4]
0009b5c0  ldr.w   r4, [sl]
0009b5c4  cmp     r6, r4
0009b5c6  ite     ls
0009b5c8  addls   r2, sp, #4
0009b5ca  movhi   r2, sp
0009b5cc  str     r4, [sp]
0009b5ce  ldr     r2, [r2]
0009b5d0  blx     #0xddb90 ; -> memcmp
0009b5d4  cmp     r0, #0
0009b5d6  bne     #0x9b5f0
0009b5d8  cmp     r6, r4
0009b5da  bhi     #0x9b5f2
0009b5dc  bhs     #0x9b5f2
0009b5de  ldr     r5, [r5, #0xc]
0009b5e0  cmp     r5, #0
0009b5e2  bne     #0x9b5b6
0009b5e4  mov     r0, fp
0009b5e6  sub.w   sp, r7, #0x18
0009b5ea  pop.w   {r8, sl, fp}
0009b5ee  pop     {r4, r5, r6, r7, pc}
0009b5f0  blt     #0x9b5de
0009b5f2  mov     fp, r5
0009b5f4  ldr     r5, [r5, #8]
0009b5f6  cmp     r5, #0
0009b5f8  bne     #0x9b5b6
0009b5fa  b       #0x9b5e4
