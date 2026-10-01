========================================================================
ZN8FBFriendC2ExRKSsS1_  0x00088c70  228 bytes   FBConnection.mm
========================================================================

00088c70  push    {r4, r5, r6, r7, lr}
00088c72  add     r7, sp, #0xc
00088c74  push.w  {r8, sl, fp}
00088c78  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00088c7c  sub     sp, #0x4c
00088c7e  str     r3, [sp]
00088c80  ldr     r3, [pc, #0xc0]
00088c82  str     r0, [sp, #0xc]
00088c84  add     r0, sp, #0x14
00088c86  add     r3, pc ; -> 0x000f301c  0x0
00088c88  str     r1, [sp, #4]
00088c8a  str     r2, [sp, #8]
00088c8c  ldr     r3, [r3]
00088c8e  str     r7, [sp, #0x34]
00088c90  str.w   sp, [sp, #0x3c]
00088c94  str     r3, [sp, #0x2c]
00088c96  ldr     r3, [pc, #0xb0]
00088c98  add     r3, pc ; -> 0x000ee170  GCC_except_table0
00088c9a  str     r3, [sp, #0x30]
00088c9c  ldr     r3, [pc, #0xac]
00088c9e  add     r3, pc ; -> 0x00088ce6  
00088ca0  orr     r3, r3, #1
00088ca4  str     r3, [sp, #0x38]
00088ca6  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00088caa  ldr     r0, [sp, #0xc]
00088cac  add     r2, sp, #4
00088cae  ldm     r2, {r2, r3}
00088cb0  stm     r0!, {r2, r3}
00088cb2  ldr     r1, [sp]
00088cb4  mov.w   r3, #-1
00088cb8  str     r3, [sp, #0x18]
00088cba  blx     #0xdd53c ; -> ZNSsC1ERKSs
00088cbe  ldr     r3, [sp, #0xc]
00088cc0  ldr     r1, [sp, #0xac]
00088cc2  add.w   r0, r3, #0xc
00088cc6  movs    r3, #1
00088cc8  str     r3, [sp, #0x18]
00088cca  blx     #0xdd53c ; -> ZNSsC1ERKSs
00088cce  add     r0, sp, #0x14
00088cd0  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00088cd4  sub.w   sp, r7, #0x58
00088cd8  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00088cdc  sub.w   sp, r7, #0x18
00088ce0  pop.w   {r8, sl, fp}
00088ce4  pop     {r4, r5, r6, r7, pc}
00088ce6  ldr     r3, [pc, #0x68]
00088ce8  ldr     r4, [sp, #0x1c]
00088cea  ldr     r2, [sp, #0xc]
00088cec  add     r3, pc ; -> 0x000f3370  0x0
00088cee  str     r4, [sp, #0x10]
00088cf0  ldr     r1, [r2, #8]
00088cf2  ldr     r3, [r3]
00088cf4  sub.w   r0, r1, #0xc
00088cf8  cmp     r0, r3
00088cfa  bne     #0x88d08
00088cfc  ldr     r0, [sp, #0x10]
00088cfe  mov.w   r3, #-1
00088d02  str     r3, [sp, #0x18]
00088d04  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00088d08  ldr     r3, [r1, #-0x4]
00088d0c  subs    r2, r1, #4
00088d0e  subs    r1, r3, #1
00088d10  dmb     ish
00088d14  mov     ip, r3
00088d16  ldrex   r4, [r2]
00088d1a  cmp     r4, r3
00088d1c  beq     #0x88d32
00088d1e  cmp     r4, ip
00088d20  mov     r3, r4
00088d22  bne     #0x88d0e
00088d24  cmp     r4, #0
00088d26  bgt     #0x88cfc
00088d28  add.w   r1, sp, #0x4b
00088d2c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00088d30  b       #0x88cfc
00088d32  strex   lr, r1, [r2]
00088d36  cmp.w   lr, #0
00088d3a  bne     #0x88d16
00088d3c  dmb     ish
00088d40  b       #0x88d1e
00088d42  nop     
00088d44  adr     r3, #0x248
00088d46  movs    r6, r0
00088d48  strb    r4, [r2, r3]
00088d4a  movs    r6, r0
00088d4c  lsls    r4, r0, #1
00088d4e  movs    r0, r0
00088d50  adr     r6, #0x200
00088d52  movs    r6, r0
