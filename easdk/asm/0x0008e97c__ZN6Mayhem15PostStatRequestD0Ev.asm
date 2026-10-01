========================================================================
ZN6Mayhem15PostStatRequestD0Ev  0x0008e97c  644 bytes   Mayhem.mm
========================================================================

0008e97c  push    {r4, r5, r6, r7, lr}
0008e97e  add     r7, sp, #0xc
0008e980  push.w  {r8, sl, fp}
0008e984  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008e988  sub     sp, #0x58
0008e98a  ldr     r3, [pc, #0x254]
0008e98c  str     r0, [sp, #4]
0008e98e  add     r0, sp, #0x1c
0008e990  add     r3, pc ; -> 0x000f3438  0x0
0008e992  str     r7, [sp, #0x3c]
0008e994  ldr     r3, [r3]
0008e996  str.w   sp, [sp, #0x44]
0008e99a  str     r3, [sp, #0x34]
0008e99c  ldr     r3, [pc, #0x244]
0008e99e  add     r3, pc ; -> 0x000ee308  GCC_except_table49
0008e9a0  str     r3, [sp, #0x38]
0008e9a2  ldr     r3, [pc, #0x244]
0008e9a4  add     r3, pc ; -> 0x0008ead8  
0008e9a6  orr     r3, r3, #1
0008e9aa  str     r3, [sp, #0x40]
0008e9ac  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008e9b0  ldr     r2, [sp, #4]
0008e9b2  ldr     r3, [pc, #0x238]
0008e9b4  add.w   r0, r2, #8
0008e9b8  add     r3, pc ; -> 0x0017da80  ZTVN6Mayhem15PostStatRequestE
0008e9ba  adds    r3, #8
0008e9bc  str     r3, [r2]
0008e9be  ldr     r3, [pc, #0x230]
0008e9c0  add     r3, pc ; -> 0x0017da80  ZTVN6Mayhem15PostStatRequestE
0008e9c2  adds    r3, #0x1c
0008e9c4  str     r3, [r2, #8]
0008e9c6  movs    r3, #1
0008e9c8  str     r3, [sp, #0x20]
0008e9ca  bl      #0x8b6a8 ; -> ZN6Mayhem12MayhemThread4waitEv
0008e9ce  ldr     r3, [sp, #4]
0008e9d0  ldr     r2, [r3, #0x64]
0008e9d2  ldr     r3, [pc, #0x220]
0008e9d4  sub.w   r0, r2, #0xc
0008e9d8  add     r3, pc ; -> 0x000f3370  0x0
0008e9da  ldr     r3, [r3]
0008e9dc  cmp     r0, r3
0008e9de  str     r3, [sp, #0x18]
0008e9e0  bne     #0x8ea2c
0008e9e2  ldr     r2, [sp, #4]
0008e9e4  ldr     r4, [sp, #0x18]
0008e9e6  ldr     r3, [r2, #0x5c]
0008e9e8  sub.w   r0, r3, #0xc
0008e9ec  cmp     r4, r0
0008e9ee  bne     #0x8ea80
0008e9f0  ldr     r2, [sp, #4]
0008e9f2  ldr     r4, [sp, #0x18]
0008e9f4  ldr     r3, [r2, #0x58]
0008e9f6  sub.w   r0, r3, #0xc
0008e9fa  cmp     r4, r0
0008e9fc  bne     #0x8ea56
0008e9fe  ldr     r2, [sp, #4]
0008ea00  mov.w   r3, #-1
0008ea04  str     r3, [sp, #0x20]
0008ea06  add.w   r0, r2, #8
0008ea0a  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0008ea0e  ldr     r0, [sp, #4]
0008ea10  blx     #0xdd5a8 ; -> ZdlPv
0008ea14  add     r0, sp, #0x1c
0008ea16  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008ea1a  sub.w   sp, r7, #0x58
0008ea1e  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008ea22  sub.w   sp, r7, #0x18
0008ea26  pop.w   {r8, sl, fp}
0008ea2a  pop     {r4, r5, r6, r7, pc}
0008ea2c  ldr     r3, [r2, #-0x4]
0008ea30  subs    r1, r2, #4
0008ea32  subs    r2, r3, #1
0008ea34  dmb     ish
0008ea38  mov     ip, r3
0008ea3a  ldrex   r4, [r1]
0008ea3e  cmp     r4, r3
0008ea40  beq     #0x8eac8
0008ea42  cmp     r4, ip
0008ea44  mov     r3, r4
0008ea46  bne     #0x8ea32
0008ea48  cmp     r4, #0
0008ea4a  bgt     #0x8e9e2
0008ea4c  add.w   r1, sp, #0x56
0008ea50  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008ea54  b       #0x8e9e2
0008ea56  subs    r2, r3, #4
0008ea58  ldr     r3, [r3, #-0x4]
0008ea5c  subs    r1, r3, #1
0008ea5e  dmb     ish
0008ea62  mov     ip, r3
0008ea64  ldrex   r4, [r2]
0008ea68  cmp     r4, r3
0008ea6a  beq     #0x8eab8
0008ea6c  cmp     r4, ip
0008ea6e  mov     r3, r4
0008ea70  bne     #0x8ea5c
0008ea72  cmp     r4, #0
0008ea74  bgt     #0x8e9fe
0008ea76  add.w   r1, sp, #0x52
0008ea7a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008ea7e  b       #0x8e9fe
0008ea80  subs    r2, r3, #4
0008ea82  ldr     r3, [r3, #-0x4]
0008ea86  subs    r1, r3, #1
0008ea88  dmb     ish
0008ea8c  mov     ip, r3
0008ea8e  ldrex   r4, [r2]
0008ea92  cmp     r4, r3
0008ea94  beq     #0x8eaa8
0008ea96  cmp     r4, ip
0008ea98  mov     r3, r4
0008ea9a  bne     #0x8ea86
0008ea9c  cmp     r4, #0
0008ea9e  bgt     #0x8e9f0
0008eaa0  add     r1, sp, #0x54
0008eaa2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008eaa6  b       #0x8e9f0
0008eaa8  strex   lr, r1, [r2]
0008eaac  cmp.w   lr, #0
0008eab0  bne     #0x8ea8e
0008eab2  dmb     ish
0008eab6  b       #0x8ea96
0008eab8  strex   lr, r1, [r2]
0008eabc  cmp.w   lr, #0
0008eac0  bne     #0x8ea64
0008eac2  dmb     ish
0008eac6  b       #0x8ea6c
0008eac8  strex   lr, r2, [r1]
0008eacc  cmp.w   lr, #0
0008ead0  bne     #0x8ea3a
0008ead2  dmb     ish
0008ead6  b       #0x8ea42
0008ead8  ldr     r3, [sp, #0x24]
0008eada  ldr     r4, [sp, #4]
0008eadc  str     r3, [sp, #8]
0008eade  ldr     r3, [pc, #0x118]
0008eae0  ldr     r1, [r4, #0x64]
0008eae2  add     r3, pc ; -> 0x000f3370  0x0
0008eae4  sub.w   r0, r1, #0xc
0008eae8  ldr     r3, [r3]
0008eaea  cmp     r0, r3
0008eaec  str     r3, [sp, #0x14]
0008eaee  bne     #0x8eb32
0008eaf0  ldr     r2, [sp, #8]
0008eaf2  ldr     r4, [sp, #4]
0008eaf4  str     r2, [sp, #0xc]
0008eaf6  ldr     r3, [r4, #0x5c]
0008eaf8  ldr     r2, [sp, #0x14]
0008eafa  sub.w   r0, r3, #0xc
0008eafe  cmp     r2, r0
0008eb00  bne     #0x8eb88
0008eb02  ldr     r2, [sp, #0xc]
0008eb04  ldr     r4, [sp, #4]
0008eb06  str     r2, [sp, #0x10]
0008eb08  ldr     r3, [r4, #0x58]
0008eb0a  ldr     r2, [sp, #0x14]
0008eb0c  sub.w   r0, r3, #0xc
0008eb10  cmp     r2, r0
0008eb12  bne     #0x8eb5e
0008eb14  ldr     r3, [sp, #4]
0008eb16  ldr     r2, [sp, #0x10]
0008eb18  add.w   r0, r3, #8
0008eb1c  movs    r3, #0
0008eb1e  str     r2, [sp]
0008eb20  str     r3, [sp, #0x20]
0008eb22  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0008eb26  ldr     r0, [sp]
0008eb28  mov.w   r3, #-1
0008eb2c  str     r3, [sp, #0x20]
0008eb2e  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008eb32  ldr     r3, [r1, #-0x4]
0008eb36  subs    r2, r1, #4
0008eb38  subs    r1, r3, #1
0008eb3a  dmb     ish
0008eb3e  mov     ip, r3
0008eb40  ldrex   lr, [r2]
0008eb44  cmp     lr, r3
0008eb46  beq     #0x8ebc2
0008eb48  cmp     lr, ip
0008eb4a  mov     r3, lr
0008eb4c  bne     #0x8eb38
0008eb4e  cmp.w   lr, #0
0008eb52  bgt     #0x8eaf0
0008eb54  add.w   r1, sp, #0x57
0008eb58  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008eb5c  b       #0x8eaf0
0008eb5e  subs    r2, r3, #4
0008eb60  ldr     r3, [r3, #-0x4]
0008eb64  subs    r1, r3, #1
0008eb66  dmb     ish
0008eb6a  mov     ip, r3
0008eb6c  ldrex   r4, [r2]
0008eb70  cmp     r4, r3
0008eb72  beq     #0x8ebb2
0008eb74  cmp     r4, ip
0008eb76  mov     r3, r4
0008eb78  bne     #0x8eb64
0008eb7a  cmp     r4, #0
0008eb7c  bgt     #0x8eb14
0008eb7e  add.w   r1, sp, #0x53
0008eb82  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008eb86  b       #0x8eb14
0008eb88  subs    r2, r3, #4
0008eb8a  ldr     r3, [r3, #-0x4]
0008eb8e  subs    r1, r3, #1
0008eb90  dmb     ish
0008eb94  mov     ip, r3
0008eb96  ldrex   r4, [r2]
0008eb9a  cmp     r4, r3
0008eb9c  beq     #0x8ebd0
0008eb9e  cmp     r4, ip
0008eba0  mov     r3, r4
0008eba2  bne     #0x8eb8e
0008eba4  cmp     r4, #0
0008eba6  bgt     #0x8eb02
0008eba8  add.w   r1, sp, #0x55
0008ebac  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008ebb0  b       #0x8eb02
0008ebb2  strex   lr, r1, [r2]
0008ebb6  cmp.w   lr, #0
0008ebba  bne     #0x8eb6c
0008ebbc  dmb     ish
0008ebc0  b       #0x8eb74
0008ebc2  strex   r4, r1, [r2]
0008ebc6  cmp     r4, #0
0008ebc8  bne     #0x8eb40
0008ebca  dmb     ish
0008ebce  b       #0x8eb48
0008ebd0  strex   lr, r1, [r2]
0008ebd4  cmp.w   lr, #0
0008ebd8  bne     #0x8eb96
0008ebda  dmb     ish
0008ebde  b       #0x8eb9e
0008ebe0  ldr     r2, [pc, #0x290]
0008ebe2  movs    r6, r0
0008ebe4  vld4.8  {d16, d17, d18, d19}, [r6], r5
0008ebe8  lsls    r0, r6, #4
0008ebea  movs    r0, r0
