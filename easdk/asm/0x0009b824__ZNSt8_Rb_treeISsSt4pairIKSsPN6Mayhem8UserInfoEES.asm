========================================================================
ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8UserInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE11lower_boundERS1_  0x0009b824  96 bytes   Mayhem.mm
========================================================================

0009b824  push    {r4, r5, r6, r7, lr}
0009b826  add     r7, sp, #0xc
0009b828  push.w  {r8, sl, fp}
0009b82c  sub     sp, #8
0009b82e  ldr     r5, [r0, #8]
0009b830  add.w   fp, r0, #4
0009b834  cbz     r5, #0x9b86c
0009b836  ldr.w   r8, [r1]
0009b83a  sub.w   sl, r8, #0xc
0009b83e  ldr     r0, [r5, #0x10]
0009b840  mov     r1, r8
0009b842  ldr     r6, [r0, #-0xc]
0009b846  str     r6, [sp, #4]
0009b848  ldr.w   r4, [sl]
0009b84c  cmp     r6, r4
0009b84e  ite     ls
0009b850  addls   r2, sp, #4
0009b852  movhi   r2, sp
0009b854  str     r4, [sp]
0009b856  ldr     r2, [r2]
0009b858  blx     #0xddb90 ; -> memcmp
0009b85c  cmp     r0, #0
0009b85e  bne     #0x9b878
0009b860  cmp     r6, r4
0009b862  bhi     #0x9b87a
0009b864  bhs     #0x9b87a
0009b866  ldr     r5, [r5, #0xc]
0009b868  cmp     r5, #0
0009b86a  bne     #0x9b83e
0009b86c  mov     r0, fp
0009b86e  sub.w   sp, r7, #0x18
0009b872  pop.w   {r8, sl, fp}
0009b876  pop     {r4, r5, r6, r7, pc}
0009b878  blt     #0x9b866
0009b87a  mov     fp, r5
0009b87c  ldr     r5, [r5, #8]
0009b87e  cmp     r5, #0
0009b880  bne     #0x9b83e
0009b882  b       #0x9b86c
