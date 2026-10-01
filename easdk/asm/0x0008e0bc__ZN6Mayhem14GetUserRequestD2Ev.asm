========================================================================
ZN6Mayhem14GetUserRequestD2Ev  0x0008e0bc  328 bytes   Mayhem.mm
========================================================================

0008e0bc  push    {r4, r5, r6, r7, lr}
0008e0be  add     r7, sp, #0xc
0008e0c0  push.w  {r8, sl, fp}
0008e0c4  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008e0c8  sub     sp, #0x44
0008e0ca  ldr     r3, [pc, #0x11c]
0008e0cc  str     r0, [sp, #4]
0008e0ce  add     r0, sp, #0xc
0008e0d0  add     r3, pc ; -> 0x000f3438  0x0
0008e0d2  str     r7, [sp, #0x2c]
0008e0d4  ldr     r3, [r3]
0008e0d6  str.w   sp, [sp, #0x34]
0008e0da  str     r3, [sp, #0x24]
0008e0dc  ldr     r3, [pc, #0x10c]
0008e0de  add     r3, pc ; -> 0x000ee2ea  GCC_except_table44
0008e0e0  str     r3, [sp, #0x28]
0008e0e2  ldr     r3, [pc, #0x10c]
0008e0e4  add     r3, pc ; -> 0x0008e17e  
0008e0e6  orr     r3, r3, #1
0008e0ea  str     r3, [sp, #0x30]
0008e0ec  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008e0f0  ldr     r2, [sp, #4]
0008e0f2  ldr     r3, [pc, #0x100]
0008e0f4  add.w   r0, r2, #8
0008e0f8  add     r3, pc ; -> 0x0017dba8  ZTVN6Mayhem14GetUserRequestE
0008e0fa  adds    r3, #8
0008e0fc  str     r3, [r2]
0008e0fe  ldr     r3, [pc, #0xf8]
0008e100  add     r3, pc ; -> 0x0017dba8  ZTVN6Mayhem14GetUserRequestE
0008e102  adds    r3, #0x28
0008e104  str     r3, [r2, #8]
0008e106  movs    r3, #1
0008e108  str     r3, [sp, #0x10]
0008e10a  bl      #0x8b6a8 ; -> ZN6Mayhem12MayhemThread4waitEv
0008e10e  ldr     r3, [sp, #4]
0008e110  ldr     r2, [r3, #0x58]
0008e112  ldr     r3, [pc, #0xe8]
0008e114  sub.w   r0, r2, #0xc
0008e118  add     r3, pc ; -> 0x000f3370  0x0
0008e11a  ldr     r3, [r3]
0008e11c  cmp     r0, r3
0008e11e  bne     #0x8e144
0008e120  ldr     r0, [sp, #4]
0008e122  mov.w   r3, #-1
0008e126  str     r3, [sp, #0x10]
0008e128  bl      #0x8c8d8 ; -> ZN6Mayhem11UserRequestD2Ev
0008e12c  add     r0, sp, #0xc
0008e12e  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008e132  sub.w   sp, r7, #0x58
0008e136  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008e13a  sub.w   sp, r7, #0x18
0008e13e  pop.w   {r8, sl, fp}
0008e142  pop     {r4, r5, r6, r7, pc}
0008e144  ldr     r3, [r2, #-0x4]
0008e148  subs    r1, r2, #4
0008e14a  subs    r2, r3, #1
0008e14c  dmb     ish
0008e150  mov     ip, r3
0008e152  ldrex   r4, [r1]
0008e156  cmp     r4, r3
0008e158  beq     #0x8e16e
0008e15a  cmp     r4, ip
0008e15c  mov     r3, r4
0008e15e  bne     #0x8e14a
0008e160  cmp     r4, #0
0008e162  bgt     #0x8e120
0008e164  add.w   r1, sp, #0x42
0008e168  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e16c  b       #0x8e120
0008e16e  strex   lr, r2, [r1]
0008e172  cmp.w   lr, #0
0008e176  bne     #0x8e152
0008e178  dmb     ish
0008e17c  b       #0x8e15a
0008e17e  ldr     r3, [sp, #0x14]
0008e180  ldr     r4, [sp, #4]
0008e182  str     r3, [sp, #8]
0008e184  ldr     r3, [pc, #0x78]
0008e186  ldr     r1, [r4, #0x58]
0008e188  add     r3, pc ; -> 0x000f3370  0x0
0008e18a  sub.w   r0, r1, #0xc
0008e18e  ldr     r3, [r3]
0008e190  cmp     r0, r3
0008e192  bne     #0x8e1ae
0008e194  ldr     r2, [sp, #8]
0008e196  ldr     r0, [sp, #4]
0008e198  movs    r3, #0
0008e19a  str     r3, [sp, #0x10]
0008e19c  str     r2, [sp]
0008e19e  bl      #0x8c8d8 ; -> ZN6Mayhem11UserRequestD2Ev
0008e1a2  ldr     r0, [sp]
0008e1a4  mov.w   r3, #-1
0008e1a8  str     r3, [sp, #0x10]
0008e1aa  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008e1ae  ldr     r3, [r1, #-0x4]
0008e1b2  subs    r2, r1, #4
0008e1b4  subs    r1, r3, #1
0008e1b6  dmb     ish
0008e1ba  mov     ip, r3
0008e1bc  ldrex   lr, [r2]
0008e1c0  cmp     lr, r3
0008e1c2  beq     #0x8e1da
0008e1c4  cmp     lr, ip
0008e1c6  mov     r3, lr
0008e1c8  bne     #0x8e1b4
0008e1ca  cmp.w   lr, #0
0008e1ce  bgt     #0x8e194
0008e1d0  add.w   r1, sp, #0x43
0008e1d4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e1d8  b       #0x8e194
0008e1da  strex   r4, r1, [r2]
0008e1de  cmp     r4, #0
0008e1e0  bne     #0x8e1bc
0008e1e2  dmb     ish
0008e1e6  b       #0x8e1c4
0008e1e8  strh    r4, [r4, r5]
0008e1ea  movs    r6, r0
0008e1ec  lsls    r0, r1, #8
0008e1ee  movs    r6, r0
0008e1f0  lsls    r6, r2, #2
0008e1f2  movs    r0, r0
