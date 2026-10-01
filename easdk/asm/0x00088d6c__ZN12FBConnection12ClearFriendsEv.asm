========================================================================
ZN12FBConnection12ClearFriendsEv  0x00088d6c  200 bytes   FBConnection.mm
========================================================================

00088d6c  push    {r4, r5, r6, r7, lr}
00088d6e  add     r7, sp, #0xc
00088d70  push.w  {r8, sl}
00088d74  sub     sp, #4
00088d76  ldr.w   r8, [r0, #0x1c]
00088d7a  ldr     r5, [r0, #0x20]
00088d7c  add.w   sl, r0, #0x1c
00088d80  cmp     r8, r5
00088d82  beq     #0x88da6
00088d84  ldr     r3, [pc, #0xa4]
00088d86  mov     r4, r8
00088d88  add     r3, pc ; -> 0x000f3370  0x0
00088d8a  ldr     r6, [r3]
00088d8c  ldr     r3, [r4, #0xc]
00088d8e  sub.w   r0, r3, #0xc
00088d92  cmp     r0, r6
00088d94  bne     #0x88db4
00088d96  ldr     r3, [r4, #8]
00088d98  sub.w   r0, r3, #0xc
00088d9c  cmp     r0, r6
00088d9e  bne     #0x88de0
00088da0  adds    r4, #0x10
00088da2  cmp     r5, r4
00088da4  bne     #0x88d8c
00088da6  str.w   r8, [sl, #4]
00088daa  sub.w   sp, r7, #0x14
00088dae  pop.w   {r8, sl}
00088db2  pop     {r4, r5, r6, r7, pc}
00088db4  subs    r2, r3, #4
00088db6  ldr     r3, [r3, #-0x4]
00088dba  subs    r1, r3, #1
00088dbc  dmb     ish
00088dc0  mov     ip, r3
00088dc2  ldrex   sb, [r2]
00088dc6  cmp     sb, r3
00088dc8  beq     #0x88e1c
00088dca  cmp     sb, ip
00088dcc  mov     r3, sb
00088dce  bne     #0x88dba
00088dd0  cmp.w   sb, #0
00088dd4  bgt     #0x88d96
00088dd6  add.w   r1, sp, #3
00088dda  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00088dde  b       #0x88d96
00088de0  subs    r2, r3, #4
00088de2  ldr     r3, [r3, #-0x4]
00088de6  subs    r1, r3, #1
00088de8  dmb     ish
00088dec  mov     ip, r3
00088dee  ldrex   sb, [r2]
00088df2  cmp     sb, r3
00088df4  beq     #0x88e0c
00088df6  cmp     sb, ip
00088df8  mov     r3, sb
00088dfa  bne     #0x88de6
00088dfc  cmp.w   sb, #0
00088e00  bgt     #0x88da0
00088e02  add.w   r1, sp, #2
00088e06  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00088e0a  b       #0x88da0
00088e0c  strex   lr, r1, [r2]
00088e10  cmp.w   lr, #0
00088e14  bne     #0x88dee
00088e16  dmb     ish
00088e1a  b       #0x88df6
00088e1c  strex   lr, r1, [r2]
00088e20  cmp.w   lr, #0
00088e24  bne     #0x88dc2
00088e26  dmb     ish
00088e2a  b       #0x88dca
00088e2c  adr     r5, #0x390
00088e2e  movs    r6, r0
00088e30  nop     
00088e32  nop     
