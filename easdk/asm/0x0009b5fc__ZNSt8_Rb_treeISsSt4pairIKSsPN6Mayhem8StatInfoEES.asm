========================================================================
ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE11lower_boundERS1_  0x0009b5fc  96 bytes   Mayhem.mm
========================================================================

0009b5fc  push    {r4, r5, r6, r7, lr}
0009b5fe  add     r7, sp, #0xc
0009b600  push.w  {r8, sl, fp}
0009b604  sub     sp, #8
0009b606  ldr     r5, [r0, #8]
0009b608  add.w   fp, r0, #4
0009b60c  cbz     r5, #0x9b644
0009b60e  ldr.w   r8, [r1]
0009b612  sub.w   sl, r8, #0xc
0009b616  ldr     r0, [r5, #0x10]
0009b618  mov     r1, r8
0009b61a  ldr     r6, [r0, #-0xc]
0009b61e  str     r6, [sp, #4]
0009b620  ldr.w   r4, [sl]
0009b624  cmp     r6, r4
0009b626  ite     ls
0009b628  addls   r2, sp, #4
0009b62a  movhi   r2, sp
0009b62c  str     r4, [sp]
0009b62e  ldr     r2, [r2]
0009b630  blx     #0xddb90 ; -> memcmp
0009b634  cmp     r0, #0
0009b636  bne     #0x9b650
0009b638  cmp     r6, r4
0009b63a  bhi     #0x9b652
0009b63c  bhs     #0x9b652
0009b63e  ldr     r5, [r5, #0xc]
0009b640  cmp     r5, #0
0009b642  bne     #0x9b616
0009b644  mov     r0, fp
0009b646  sub.w   sp, r7, #0x18
0009b64a  pop.w   {r8, sl, fp}
0009b64e  pop     {r4, r5, r6, r7, pc}
0009b650  blt     #0x9b63e
0009b652  mov     fp, r5
0009b654  ldr     r5, [r5, #8]
0009b656  cmp     r5, #0
0009b658  bne     #0x9b616
0009b65a  b       #0x9b644
