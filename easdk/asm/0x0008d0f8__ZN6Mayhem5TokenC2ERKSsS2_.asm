========================================================================
ZN6Mayhem5TokenC2ERKSsS2_  0x0008d0f8  460 bytes   Mayhem.mm
========================================================================

0008d0f8  push    {r4, r5, r6, r7, lr}
0008d0fa  add     r7, sp, #0xc
0008d0fc  push.w  {r8, sl, fp}
0008d100  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008d104  sub     sp, #0x58
0008d106  ldr     r3, [pc, #0x1a4]
0008d108  str     r0, [sp, #0xc]
0008d10a  add     r0, sp, #0x20
0008d10c  add     r3, pc ; -> 0x000f3438  0x0
0008d10e  str     r1, [sp, #8]
0008d110  ldr     r3, [r3]
0008d112  str     r2, [sp, #4]
0008d114  str     r7, [sp, #0x40]
0008d116  str.w   sp, [sp, #0x48]
0008d11a  str     r3, [sp, #0x38]
0008d11c  ldr     r3, [pc, #0x190]
0008d11e  add     r3, pc ; -> 0x000ee2aa  GCC_except_table34
0008d120  str     r3, [sp, #0x3c]
0008d122  ldr     r3, [pc, #0x190]
0008d124  add     r3, pc ; -> 0x0008d19a  
0008d126  orr     r3, r3, #1
0008d12a  str     r3, [sp, #0x44]
0008d12c  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008d130  ldr     r0, [sp, #0xc]
0008d132  mov.w   r2, #-1
0008d136  str     r2, [sp, #0x24]
0008d138  bl      #0x8cda4 ; -> ZN6Mayhem7RequestC2Ev
0008d13c  ldr     r4, [sp, #0xc]
0008d13e  ldr     r3, [pc, #0x178]
0008d140  add.w   r0, r4, #0x50
0008d144  add     r3, pc ; -> 0x0017dc38  ZTVN6Mayhem5TokenE
0008d146  adds    r3, #8
0008d148  str     r3, [r4]
0008d14a  ldr     r1, [sp, #8]
0008d14c  movs    r3, #3
0008d14e  str     r3, [sp, #0x24]
0008d150  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008d154  movs    r3, #2
0008d156  add.w   r0, r4, #0x54
0008d15a  str     r3, [sp, #0x24]
0008d15c  ldr     r1, [sp, #4]
0008d15e  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008d162  ldr     r3, [pc, #0x158]
0008d164  mov.w   r2, #-1
0008d168  add     r3, pc ; -> 0x000f3370  0x0
0008d16a  ldr     r3, [r3]
0008d16c  str     r3, [sp, #0x1c]
0008d16e  adds    r3, #0xc
0008d170  str     r2, [r4, #0x60]
0008d172  str     r3, [r4, #0x58]
0008d174  movs    r3, #0
0008d176  str     r3, [r4, #0x5c]
0008d178  ldr     r0, [sp, #0xc]
0008d17a  adds    r3, #1
0008d17c  str     r3, [sp, #0x24]
0008d17e  bl      #0x8b6e8 ; -> ZN6Mayhem5Token7RefreshEv
0008d182  add     r0, sp, #0x20
0008d184  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008d188  sub.w   sp, r7, #0x58
0008d18c  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008d190  sub.w   sp, r7, #0x18
0008d194  pop.w   {r8, sl, fp}
0008d198  pop     {r4, r5, r6, r7, pc}
0008d19a  ldr     r3, [sp, #0x24]
0008d19c  ldr     r4, [sp, #0x28]
0008d19e  cmp     r3, #1
0008d1a0  str     r4, [sp]
0008d1a2  beq     #0x8d1ce
0008d1a4  cmp     r3, #2
0008d1a6  beq     #0x8d1e8
0008d1a8  ldr     r2, [sp, #0xc]
0008d1aa  str     r4, [sp, #0x10]
0008d1ac  ldr     r4, [sp, #0x1c]
0008d1ae  ldr     r3, [r2, #0x58]
0008d1b0  sub.w   r0, r3, #0xc
0008d1b4  cmp     r4, r0
0008d1b6  bne     #0x8d22a
0008d1b8  ldr     r2, [sp, #0x10]
0008d1ba  ldr     r4, [sp, #0xc]
0008d1bc  str     r2, [sp, #0x14]
0008d1be  ldr     r3, [r4, #0x54]
0008d1c0  ldr     r2, [sp, #0x1c]
0008d1c2  sub.w   r0, r3, #0xc
0008d1c6  cmp     r2, r0
0008d1c8  bne     #0x8d256
0008d1ca  ldr     r2, [sp, #0x14]
0008d1cc  str     r2, [sp]
0008d1ce  ldr     r3, [sp]
0008d1d0  ldr     r4, [sp, #0xc]
0008d1d2  str     r3, [sp, #0x18]
0008d1d4  ldr     r3, [pc, #0xe8]
0008d1d6  ldr     r1, [r4, #0x50]
0008d1d8  add     r3, pc ; -> 0x000f3370  0x0
0008d1da  sub.w   r0, r1, #0xc
0008d1de  ldr     r3, [r3]
0008d1e0  cmp     r0, r3
0008d1e2  bne     #0x8d1fe
0008d1e4  ldr     r2, [sp, #0x18]
0008d1e6  str     r2, [sp]
0008d1e8  ldr     r0, [sp, #0xc]
0008d1ea  movs    r3, #0
0008d1ec  str     r3, [sp, #0x24]
0008d1ee  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0008d1f2  ldr     r0, [sp]
0008d1f4  mov.w   r3, #-1
0008d1f8  str     r3, [sp, #0x24]
0008d1fa  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008d1fe  ldr     r3, [r1, #-0x4]
0008d202  subs    r2, r1, #4
0008d204  subs    r1, r3, #1
0008d206  dmb     ish
0008d20a  mov     ip, r3
0008d20c  ldrex   lr, [r2]
0008d210  cmp     lr, r3
0008d212  beq     #0x8d28e
0008d214  cmp     lr, ip
0008d216  mov     r3, lr
0008d218  bne     #0x8d204
0008d21a  cmp.w   lr, #0
0008d21e  bgt     #0x8d1e4
0008d220  add.w   r1, sp, #0x55
0008d224  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d228  b       #0x8d1e4
0008d22a  subs    r2, r3, #4
0008d22c  ldr     r3, [r3, #-0x4]
0008d230  subs    r1, r3, #1
0008d232  dmb     ish
0008d236  mov     ip, r3
0008d238  ldrex   lr, [r2]
0008d23c  cmp     lr, r3
0008d23e  beq     #0x8d280
0008d240  cmp     lr, ip
0008d242  mov     r3, lr
0008d244  bne     #0x8d230
0008d246  cmp.w   lr, #0
0008d24a  bgt     #0x8d1b8
0008d24c  add.w   r1, sp, #0x57
0008d250  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d254  b       #0x8d1b8
0008d256  subs    r2, r3, #4
0008d258  ldr     r3, [r3, #-0x4]
0008d25c  subs    r1, r3, #1
0008d25e  dmb     ish
0008d262  mov     ip, r3
0008d264  ldrex   r4, [r2]
0008d268  cmp     r4, r3
0008d26a  beq     #0x8d29c
0008d26c  cmp     r4, ip
0008d26e  mov     r3, r4
0008d270  bne     #0x8d25c
0008d272  cmp     r4, #0
0008d274  bgt     #0x8d1ca
0008d276  add.w   r1, sp, #0x56
0008d27a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d27e  b       #0x8d1ca
0008d280  strex   r4, r1, [r2]
0008d284  cmp     r4, #0
0008d286  bne     #0x8d238
0008d288  dmb     ish
0008d28c  b       #0x8d240
0008d28e  strex   r4, r1, [r2]
0008d292  cmp     r4, #0
0008d294  bne     #0x8d20c
0008d296  dmb     ish
0008d29a  b       #0x8d214
0008d29c  strex   lr, r1, [r2]
0008d2a0  cmp.w   lr, #0
0008d2a4  bne     #0x8d264
0008d2a6  dmb     ish
0008d2aa  b       #0x8d26c
0008d2ac  str     r0, [r5, #0x30]
0008d2ae  movs    r6, r0
0008d2b0  asrs    r0, r1, #6
0008d2b2  movs    r6, r0
0008d2b4  lsls    r2, r6, #1
0008d2b6  movs    r0, r0
0008d2b8  lsrs    r0, r6, #0xb
0008d2ba  movs    r7, r1
0008d2bc  str     r4, [r0, #0x20]
0008d2be  movs    r6, r0
0008d2c0  str     r4, [r2, #0x18]
0008d2c2  movs    r6, r0
