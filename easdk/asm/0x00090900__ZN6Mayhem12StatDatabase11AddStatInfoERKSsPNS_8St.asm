========================================================================
ZN6Mayhem12StatDatabase11AddStatInfoERKSsPNS_8StatInfoE  0x00090900  1456 bytes   Mayhem.mm
========================================================================

00090900  push    {r4, r5, r6, r7, lr}
00090902  add     r7, sp, #0xc
00090904  push.w  {r8, sl, fp}
00090908  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009090c  sub     sp, #0xa0
0009090e  ldr.w   r3, [pc, #0x580]
00090912  str     r0, [sp, #8]
00090914  add     r0, sp, #0x48
00090916  add     r3, pc ; -> 0x000f3438  0x0
00090918  str     r2, [sp]
0009091a  ldr     r3, [r3]
0009091c  str     r1, [sp, #4]
0009091e  str     r7, [sp, #0x68]
00090920  str.w   sp, [sp, #0x70]
00090924  str     r3, [sp, #0x60]
00090926  ldr.w   r3, [pc, #0x56c]
0009092a  add     r3, pc ; -> 0x000ee3ea  GCC_except_table73
0009092c  str     r3, [sp, #0x64]
0009092e  ldr.w   r3, [pc, #0x568]
00090932  add     r3, pc ; -> 0x00090dd4  
00090934  orr     r3, r3, #1
00090938  str     r3, [sp, #0x6c]
0009093a  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009093e  ldr     r0, [sp, #8]
00090940  ldr     r1, [sp, #4]
00090942  bl      #0x9b5fc ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE11lower_boundERS1_
00090946  ldr     r2, [sp, #8]
00090948  adds    r3, r2, #4
0009094a  cmp     r3, r0
0009094c  str     r0, [sp, #0x3c]
0009094e  beq.w   #0x90ab0
00090952  ldr     r4, [sp, #4]
00090954  str     r0, [sp, #0x44]
00090956  add.w   r1, r0, #0x10
0009095a  ldr     r3, [r4]
0009095c  ldr     r3, [r3, #-0xc]
00090960  str     r3, [sp, #0x8c]
00090962  ldr     r2, [r0, #0x10]
00090964  ldr     r2, [r2, #-0xc]
00090968  str     r3, [sp, #0x1c]
0009096a  cmp     r2, r3
0009096c  ldr     r3, [sp, #4]
0009096e  str     r2, [sp, #0x18]
00090970  str     r2, [sp, #0x90]
00090972  ite     lo
00090974  addlo   r2, sp, #0x90
00090976  addhs   r2, sp, #0x8c
00090978  ldr     r0, [r3]
0009097a  ldr     r2, [r2]
0009097c  ldr     r1, [r1]
0009097e  blx     #0xddb90 ; -> memcmp
00090982  cbnz    r0, #0x90990
00090984  ldr     r4, [sp, #0x18]
00090986  ldr     r2, [sp, #0x1c]
00090988  cmp     r4, r2
0009098a  bhs.w   #0x90b22
0009098e  adds    r0, #1
00090990  cmp     r0, #0
00090992  blt.w   #0x90ab0
00090996  ldr     r0, [sp, #0x44]
00090998  ldr     r0, [r0, #0x14]
0009099a  str     r0, [sp, #0x10]
0009099c  cmp     r0, #0
0009099e  beq.w   #0x90b30
000909a2  ldr     r1, [sp]
000909a4  mov.w   r3, #-1
000909a8  str     r3, [sp, #0x4c]
000909aa  blx     #0xdd518 ; -> ZNSs6assignERKSs
000909ae  ldr     r3, [sp]
000909b0  ldr     r2, [sp, #0x10]
000909b2  adds    r1, r3, #4
000909b4  adds    r0, r2, #4
000909b6  blx     #0xdd518 ; -> ZNSs6assignERKSs
000909ba  ldr     r4, [sp, #0x10]
000909bc  ldr     r2, [sp]
000909be  add.w   r0, r4, #8
000909c2  add.w   r1, r2, #8
000909c6  blx     #0xdd518 ; -> ZNSs6assignERKSs
000909ca  ldr     r4, [sp]
000909cc  ldr     r0, [sp, #0x10]
000909ce  add.w   r1, r4, #0x10
000909d2  ldr     r3, [r4, #0xc]
000909d4  str     r3, [r0, #0xc]
000909d6  ldr     r2, [sp, #0x10]
000909d8  add.w   r0, r2, #0x10
000909dc  blx     #0xdd518 ; -> ZNSs6assignERKSs
000909e0  ldr     r3, [sp, #0x10]
000909e2  add.w   r1, r4, #0x14
000909e6  add.w   r0, r3, #0x14
000909ea  blx     #0xdd518 ; -> ZNSs6assignERKSs
000909ee  ldr     r3, [r4, #0x18]
000909f0  ldr     r4, [sp, #0x10]
000909f2  add.w   r0, r4, #0x1c
000909f6  str     r3, [r4, #0x18]
000909f8  ldr     r2, [sp]
000909fa  add.w   r1, r2, #0x1c
000909fe  blx     #0xdd518 ; -> ZNSs6assignERKSs
00090a02  ldr     r3, [sp]
00090a04  add.w   r0, r4, #0x20
00090a08  add.w   r1, r3, #0x20
00090a0c  blx     #0xdd518 ; -> ZNSs6assignERKSs
00090a10  ldr     r4, [sp]
00090a12  cmp     r4, #0
00090a14  beq     #0x90a92
00090a16  ldr.w   r3, [pc, #0x484]
00090a1a  ldr     r2, [r4, #0x20]
00090a1c  add     r3, pc ; -> 0x000f3370  0x0
00090a1e  sub.w   r0, r2, #0xc
00090a22  ldr     r3, [r3]
00090a24  cmp     r0, r3
00090a26  str     r3, [sp, #0x20]
00090a28  bne.w   #0x90cda
00090a2c  ldr     r0, [sp]
00090a2e  ldr     r2, [sp, #0x20]
00090a30  ldr     r3, [r0, #0x1c]
00090a32  sub.w   r0, r3, #0xc
00090a36  cmp     r2, r0
00090a38  bne.w   #0x90bd0
00090a3c  ldr     r0, [sp]
00090a3e  ldr     r2, [sp, #0x20]
00090a40  ldr     r3, [r0, #0x14]
00090a42  sub.w   r0, r3, #0xc
00090a46  cmp     r2, r0
00090a48  bne.w   #0x90bfc
00090a4c  ldr     r0, [sp]
00090a4e  ldr     r2, [sp, #0x20]
00090a50  ldr     r3, [r0, #0x10]
00090a52  sub.w   r0, r3, #0xc
00090a56  cmp     r2, r0
00090a58  bne.w   #0x90c2a
00090a5c  ldr     r0, [sp]
00090a5e  ldr     r2, [sp, #0x20]
00090a60  ldr     r3, [r0, #8]
00090a62  sub.w   r0, r3, #0xc
00090a66  cmp     r2, r0
00090a68  bne.w   #0x90cae
00090a6c  ldr     r0, [sp]
00090a6e  ldr     r2, [sp, #0x20]
00090a70  ldr     r3, [r0, #4]
00090a72  sub.w   r0, r3, #0xc
00090a76  cmp     r2, r0
00090a78  bne.w   #0x90c84
00090a7c  ldr     r0, [sp]
00090a7e  ldr     r2, [sp, #0x20]
00090a80  ldr     r3, [r0]
00090a82  sub.w   r0, r3, #0xc
00090a86  cmp     r2, r0
00090a88  bne.w   #0x90c58
00090a8c  ldr     r0, [sp]
00090a8e  blx     #0xdd5a8 ; -> ZdlPv
00090a92  ldr     r0, [sp, #0x10]
00090a94  str     r0, [sp, #0xc]
00090a96  add     r0, sp, #0x48
00090a98  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00090a9c  ldr     r0, [sp, #0xc]
00090a9e  sub.w   sp, r7, #0x58
00090aa2  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00090aa6  sub.w   sp, r7, #0x18
00090aaa  pop.w   {r8, sl, fp}
00090aae  pop     {r4, r5, r6, r7, pc}
00090ab0  add     r0, sp, #0x84
00090ab2  ldr     r1, [sp, #4]
00090ab4  mov.w   r3, #-1
00090ab8  str     r3, [sp, #0x4c]
00090aba  blx     #0xdd53c ; -> ZNSsC1ERKSs
00090abe  movs    r3, #0
00090ac0  ldr     r0, [sp, #8]
00090ac2  str     r3, [sp, #0x88]
00090ac4  ldr     r1, [sp, #0x3c]
00090ac6  adds    r3, #2
00090ac8  add     r2, sp, #0x84
00090aca  str     r3, [sp, #0x4c]
00090acc  bl      #0x9b65c ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE16_M_insert_uniqueESt17_Rb_tree_iteratorIS5_ERKS5_
00090ad0  ldr     r3, [pc, #0x3cc]
00090ad2  ldr     r2, [sp, #0x84]
00090ad4  str     r0, [sp, #0x30]
00090ad6  add     r3, pc ; -> 0x000f3370  0x0
00090ad8  sub.w   r0, r2, #0xc
00090adc  ldr     r3, [r3]
00090ade  cmp     r0, r3
00090ae0  itt     eq
00090ae2  ldreq   r3, [sp, #0x30]
00090ae4  streq   r3, [sp, #0x44]
00090ae6  beq.w   #0x90996
00090aea  ldr     r3, [r2, #-0x4]
00090aee  subs    r1, r2, #4
00090af0  subs    r2, r3, #1
00090af2  dmb     ish
00090af6  mov     ip, r3
00090af8  ldrex   r4, [r1]
00090afc  cmp     r4, r3
00090afe  beq.w   #0x90d08
00090b02  cmp     r4, ip
00090b04  mov     r3, r4
00090b06  bne     #0x90af0
00090b08  cmp     r4, #0
00090b0a  itt     gt
00090b0c  ldrgt   r0, [sp, #0x30]
00090b0e  strgt   r0, [sp, #0x44]
00090b10  bgt.w   #0x90996
00090b14  add.w   r1, sp, #0x9f
00090b18  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090b1c  ldr     r2, [sp, #0x30]
00090b1e  str     r2, [sp, #0x44]
00090b20  b       #0x90996
00090b22  it      hi
00090b24  movhi.w r0, #-1
00090b28  cmp     r0, #0
00090b2a  bge.w   #0x90996
00090b2e  b       #0x90ab0
00090b30  ldr     r0, [sp, #8]
00090b32  ldr     r1, [sp, #4]
00090b34  bl      #0x9b5fc ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE11lower_boundERS1_
00090b38  ldr     r2, [sp, #8]
00090b3a  adds    r3, r2, #4
00090b3c  cmp     r3, r0
00090b3e  str     r0, [sp, #0x40]
00090b40  beq     #0x90b82
00090b42  ldr     r4, [sp, #4]
00090b44  str     r0, [sp, #0x38]
00090b46  add.w   r1, r0, #0x10
00090b4a  ldr     r3, [r4]
00090b4c  ldr     r3, [r3, #-0xc]
00090b50  str     r3, [sp, #0x90]
00090b52  ldr     r2, [r0, #0x10]
00090b54  ldr     r2, [r2, #-0xc]
00090b58  str     r3, [sp, #0x2c]
00090b5a  cmp     r2, r3
00090b5c  ldr     r3, [sp, #4]
00090b5e  str     r2, [sp, #0x28]
00090b60  str     r2, [sp, #0x8c]
00090b62  ite     lo
00090b64  addlo   r2, sp, #0x8c
00090b66  addhs   r2, sp, #0x90
00090b68  ldr     r0, [r3]
00090b6a  ldr     r2, [r2]
00090b6c  ldr     r1, [r1]
00090b6e  blx     #0xddb90 ; -> memcmp
00090b72  cbnz    r0, #0x90b7e
00090b74  ldr     r4, [sp, #0x28]
00090b76  ldr     r2, [sp, #0x2c]
00090b78  cmp     r4, r2
00090b7a  bhs     #0x90bc8
00090b7c  adds    r0, #1
00090b7e  cmp     r0, #0
00090b80  bge     #0x90bbe
00090b82  add     r0, sp, #0x7c
00090b84  ldr     r1, [sp, #4]
00090b86  mov.w   r3, #-1
00090b8a  str     r3, [sp, #0x4c]
00090b8c  blx     #0xdd53c ; -> ZNSsC1ERKSs
00090b90  movs    r3, #0
00090b92  ldr     r0, [sp, #8]
00090b94  str     r3, [sp, #0x80]
00090b96  ldr     r1, [sp, #0x40]
00090b98  adds    r3, #1
00090b9a  add     r2, sp, #0x7c
00090b9c  str     r3, [sp, #0x4c]
00090b9e  bl      #0x9b65c ; -> ZNSt8_Rb_treeISsSt4pairIKSsPN6Mayhem8StatInfoEESt10_Select1stIS5_ESt4lessISsESaIS5_EE16_M_insert_uniqueESt17_Rb_tree_iteratorIS5_ERKS5_
00090ba2  ldr.w   r3, [pc, #0x300]
00090ba6  ldr     r2, [sp, #0x7c]
00090ba8  str     r0, [sp, #0x34]
00090baa  add     r3, pc ; -> 0x000f3370  0x0
00090bac  sub.w   r0, r2, #0xc
00090bb0  ldr     r3, [r3]
00090bb2  cmp     r0, r3
00090bb4  itt     eq
00090bb6  ldreq   r3, [sp, #0x34]
00090bb8  streq   r3, [sp, #0x38]
00090bba  bne.w   #0x90d8e
00090bbe  ldr     r2, [sp]
00090bc0  ldr     r0, [sp, #0x38]
00090bc2  str     r2, [r0, #0x14]
00090bc4  str     r2, [sp, #0xc]
00090bc6  b       #0x90a96
00090bc8  it      hi
00090bca  movhi.w r0, #-1
00090bce  b       #0x90b7e
00090bd0  subs    r2, r3, #4
00090bd2  ldr     r3, [r3, #-0x4]
00090bd6  subs    r1, r3, #1
00090bd8  dmb     ish
00090bdc  mov     ip, r3
00090bde  ldrex   r4, [r2]
00090be2  cmp     r4, r3
00090be4  beq.w   #0x90d38
00090be8  cmp     r4, ip
00090bea  mov     r3, r4
00090bec  bne     #0x90bd6
00090bee  cmp     r4, #0
00090bf0  bgt.w   #0x90a3c
00090bf4  add     r1, sp, #0x9c
00090bf6  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090bfa  b       #0x90a3c
00090bfc  subs    r2, r3, #4
00090bfe  ldr     r3, [r3, #-0x4]
00090c02  subs    r1, r3, #1
00090c04  dmb     ish
00090c08  mov     ip, r3
00090c0a  ldrex   r4, [r2]
00090c0e  cmp     r4, r3
00090c10  beq.w   #0x90d7c
00090c14  cmp     r4, ip
00090c16  mov     r3, r4
00090c18  bne     #0x90c02
00090c1a  cmp     r4, #0
00090c1c  bgt.w   #0x90a4c
00090c20  add.w   r1, sp, #0x9b
00090c24  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090c28  b       #0x90a4c
00090c2a  subs    r2, r3, #4
00090c2c  ldr     r3, [r3, #-0x4]
00090c30  subs    r1, r3, #1
00090c32  dmb     ish
00090c36  mov     ip, r3
00090c38  ldrex   r4, [r2]
00090c3c  cmp     r4, r3
00090c3e  beq.w   #0x90d6a
00090c42  cmp     r4, ip
00090c44  mov     r3, r4
00090c46  bne     #0x90c30
00090c48  cmp     r4, #0
00090c4a  bgt.w   #0x90a5c
00090c4e  add.w   r1, sp, #0x9a
00090c52  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090c56  b       #0x90a5c
00090c58  subs    r2, r3, #4
00090c5a  ldr     r3, [r3, #-0x4]
00090c5e  subs    r1, r3, #1
00090c60  dmb     ish
00090c64  mov     ip, r3
00090c66  ldrex   r4, [r2]
00090c6a  cmp     r4, r3
00090c6c  beq     #0x90d5a
00090c6e  cmp     r4, ip
00090c70  mov     r3, r4
00090c72  bne     #0x90c5e
00090c74  cmp     r4, #0
00090c76  bgt.w   #0x90a8c
00090c7a  add.w   r1, sp, #0x97
00090c7e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090c82  b       #0x90a8c
00090c84  subs    r2, r3, #4
00090c86  ldr     r3, [r3, #-0x4]
00090c8a  subs    r1, r3, #1
00090c8c  dmb     ish
00090c90  mov     ip, r3
00090c92  ldrex   r4, [r2]
00090c96  cmp     r4, r3
00090c98  beq     #0x90d4a
00090c9a  cmp     r4, ip
00090c9c  mov     r3, r4
00090c9e  bne     #0x90c8a
00090ca0  cmp     r4, #0
00090ca2  bgt.w   #0x90a7c
00090ca6  add     r1, sp, #0x98
00090ca8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090cac  b       #0x90a7c
00090cae  subs    r2, r3, #4
00090cb0  ldr     r3, [r3, #-0x4]
00090cb4  subs    r1, r3, #1
00090cb6  dmb     ish
00090cba  mov     ip, r3
00090cbc  ldrex   r4, [r2]
00090cc0  cmp     r4, r3
00090cc2  beq     #0x90d28
00090cc4  cmp     r4, ip
00090cc6  mov     r3, r4
00090cc8  bne     #0x90cb4
00090cca  cmp     r4, #0
00090ccc  bgt.w   #0x90a6c
00090cd0  add.w   r1, sp, #0x99
00090cd4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090cd8  b       #0x90a6c
00090cda  ldr     r3, [r2, #-0x4]
00090cde  subs    r1, r2, #4
00090ce0  subs    r2, r3, #1
00090ce2  dmb     ish
00090ce6  mov     ip, r3
00090ce8  ldrex   lr, [r1]
00090cec  cmp     lr, r3
00090cee  beq     #0x90d1a
00090cf0  cmp     lr, ip
00090cf2  mov     r3, lr
00090cf4  bne     #0x90ce0
00090cf6  cmp.w   lr, #0
00090cfa  bgt.w   #0x90a2c
00090cfe  add.w   r1, sp, #0x9d
00090d02  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090d06  b       #0x90a2c
00090d08  strex   lr, r2, [r1]
00090d0c  cmp.w   lr, #0
00090d10  bne.w   #0x90af8
00090d14  dmb     ish
00090d18  b       #0x90b02
00090d1a  strex   r4, r2, [r1]
00090d1e  cmp     r4, #0
00090d20  bne     #0x90ce8
00090d22  dmb     ish
00090d26  b       #0x90cf0
00090d28  strex   lr, r1, [r2]
00090d2c  cmp.w   lr, #0
00090d30  bne     #0x90cbc
00090d32  dmb     ish
00090d36  b       #0x90cc4
00090d38  strex   lr, r1, [r2]
00090d3c  cmp.w   lr, #0
00090d40  bne.w   #0x90bde
00090d44  dmb     ish
00090d48  b       #0x90be8
00090d4a  strex   lr, r1, [r2]
00090d4e  cmp.w   lr, #0
00090d52  bne     #0x90c92
00090d54  dmb     ish
00090d58  b       #0x90c9a
00090d5a  strex   lr, r1, [r2]
00090d5e  cmp.w   lr, #0
00090d62  bne     #0x90c66
00090d64  dmb     ish
00090d68  b       #0x90c6e
00090d6a  strex   lr, r1, [r2]
00090d6e  cmp.w   lr, #0
00090d72  bne.w   #0x90c38
00090d76  dmb     ish
00090d7a  b       #0x90c42
00090d7c  strex   lr, r1, [r2]
00090d80  cmp.w   lr, #0
00090d84  bne.w   #0x90c0a
00090d88  dmb     ish
00090d8c  b       #0x90c14
00090d8e  ldr     r3, [r2, #-0x4]
00090d92  subs    r1, r2, #4
00090d94  subs    r2, r3, #1
00090d96  dmb     ish
00090d9a  mov     ip, r3
00090d9c  ldrex   r4, [r1]
00090da0  cmp     r4, r3
00090da2  beq     #0x90dc4
00090da4  cmp     r4, ip
00090da6  mov     r3, r4
00090da8  bne     #0x90d94
00090daa  cmp     r4, #0
00090dac  itt     gt
00090dae  ldrgt   r0, [sp, #0x34]
00090db0  strgt   r0, [sp, #0x38]
00090db2  bgt.w   #0x90bbe
00090db6  add.w   r1, sp, #0x96
00090dba  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090dbe  ldr     r2, [sp, #0x34]
00090dc0  str     r2, [sp, #0x38]
00090dc2  b       #0x90bbe
00090dc4  strex   lr, r2, [r1]
00090dc8  cmp.w   lr, #0
00090dcc  bne     #0x90d9c
00090dce  dmb     ish
00090dd2  b       #0x90da4
00090dd4  ldr     r3, [sp, #0x4c]
00090dd6  ldr     r0, [sp, #0x50]
00090dd8  cmp     r3, #1
00090dda  beq     #0x90dfc
00090ddc  ldr.w   r3, [pc, #0xc8]
00090de0  ldr     r1, [sp, #0x7c]
00090de2  str     r0, [sp, #0x24]
00090de4  add     r3, pc ; -> 0x000f3370  0x0
00090de6  sub.w   r0, r1, #0xc
00090dea  ldr     r3, [r3]
00090dec  cmp     r0, r3
00090dee  bne     #0x90e1c
00090df0  ldr     r0, [sp, #0x24]
00090df2  mov.w   r3, #-1
00090df6  str     r3, [sp, #0x4c]
00090df8  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00090dfc  ldr.w   r3, [pc, #0xac]
00090e00  ldr     r1, [sp, #0x84]
00090e02  str     r0, [sp, #0x14]
00090e04  add     r3, pc ; -> 0x000f3370  0x0
00090e06  sub.w   r0, r1, #0xc
00090e0a  ldr     r3, [r3]
00090e0c  cmp     r0, r3
00090e0e  bne     #0x90e46
00090e10  ldr     r0, [sp, #0x14]
00090e12  mov.w   r3, #-1
00090e16  str     r3, [sp, #0x4c]
00090e18  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00090e1c  ldr     r3, [r1, #-0x4]
00090e20  subs    r2, r1, #4
00090e22  subs    r1, r3, #1
00090e24  dmb     ish
00090e28  mov     ip, r3
00090e2a  ldrex   r4, [r2]
00090e2e  cmp     r4, r3
00090e30  beq     #0x90e70
00090e32  cmp     r4, ip
00090e34  mov     r3, r4
00090e36  bne     #0x90e22
00090e38  cmp     r4, #0
00090e3a  bgt     #0x90df0
00090e3c  add.w   r1, sp, #0x95
00090e40  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090e44  b       #0x90df0
00090e46  ldr     r3, [r1, #-0x4]
00090e4a  subs    r2, r1, #4
00090e4c  subs    r1, r3, #1
00090e4e  dmb     ish
00090e52  mov     ip, r3
00090e54  ldrex   r4, [r2]
00090e58  cmp     r4, r3
00090e5a  beq     #0x90e80
00090e5c  cmp     r4, ip
00090e5e  mov     r3, r4
00090e60  bne     #0x90e4c
00090e62  cmp     r4, #0
00090e64  bgt     #0x90e10
00090e66  add.w   r1, sp, #0x9e
00090e6a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090e6e  b       #0x90e10
00090e70  strex   lr, r1, [r2]
00090e74  cmp.w   lr, #0
00090e78  bne     #0x90e2a
00090e7a  dmb     ish
00090e7e  b       #0x90e32
00090e80  strex   lr, r1, [r2]
00090e84  cmp.w   lr, #0
00090e88  bne     #0x90e54
00090e8a  dmb     ish
00090e8e  b       #0x90e5c
00090e90  cmp     r3, #0x1e
00090e92  movs    r6, r0
00090e94  bge     #0x90e10
00090e96  movs    r5, r0
00090e98  lsls    r6, r3, #0x12
00090e9a  movs    r0, r0
00090e9c  cmp     r1, #0x50
00090e9e  movs    r6, r0
00090ea0  cmp     r0, #0x96
00090ea2  movs    r6, r0
00090ea4  movs    r7, #0xc2
00090ea6  movs    r6, r0
00090ea8  movs    r5, #0x88
00090eaa  movs    r6, r0
00090eac  movs    r5, #0x68
00090eae  movs    r6, r0
