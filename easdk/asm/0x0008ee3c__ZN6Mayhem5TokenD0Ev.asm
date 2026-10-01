========================================================================
ZN6Mayhem5TokenD0Ev  0x0008ee3c  624 bytes   Mayhem.mm
========================================================================

0008ee3c  push    {r4, r5, r6, r7, lr}
0008ee3e  add     r7, sp, #0xc
0008ee40  push.w  {r8, sl, fp}
0008ee44  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008ee48  sub     sp, #0x58
0008ee4a  ldr     r3, [pc, #0x244]
0008ee4c  str     r0, [sp, #4]
0008ee4e  add     r0, sp, #0x1c
0008ee50  add     r3, pc ; -> 0x000f3438  0x0
0008ee52  str     r7, [sp, #0x3c]
0008ee54  ldr     r3, [r3]
0008ee56  str.w   sp, [sp, #0x44]
0008ee5a  str     r3, [sp, #0x34]
0008ee5c  ldr     r3, [pc, #0x234]
0008ee5e  add     r3, pc ; -> 0x000ee316  GCC_except_table54
0008ee60  str     r3, [sp, #0x38]
0008ee62  ldr     r3, [pc, #0x234]
0008ee64  add     r3, pc ; -> 0x0008ef8a  
0008ee66  orr     r3, r3, #1
0008ee6a  str     r3, [sp, #0x40]
0008ee6c  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008ee70  ldr     r3, [pc, #0x228]
0008ee72  ldr     r2, [sp, #4]
0008ee74  add     r3, pc ; -> 0x0017dc38  ZTVN6Mayhem5TokenE
0008ee76  adds    r3, #8
0008ee78  str     r3, [r2]
0008ee7a  ldr     r0, [sp, #4]
0008ee7c  movs    r3, #1
0008ee7e  str     r3, [sp, #0x20]
0008ee80  bl      #0x8b6a8 ; -> ZN6Mayhem12MayhemThread4waitEv
0008ee84  ldr     r3, [sp, #4]
0008ee86  ldr     r2, [r3, #0x58]
0008ee88  ldr     r3, [pc, #0x214]
0008ee8a  sub.w   r0, r2, #0xc
0008ee8e  add     r3, pc ; -> 0x000f3370  0x0
0008ee90  ldr     r3, [r3]
0008ee92  cmp     r0, r3
0008ee94  str     r3, [sp, #0x18]
0008ee96  bne     #0x8eede
0008ee98  ldr     r2, [sp, #4]
0008ee9a  ldr     r4, [sp, #0x18]
0008ee9c  ldr     r3, [r2, #0x54]
0008ee9e  sub.w   r0, r3, #0xc
0008eea2  cmp     r4, r0
0008eea4  bne     #0x8ef32
0008eea6  ldr     r2, [sp, #4]
0008eea8  ldr     r4, [sp, #0x18]
0008eeaa  ldr     r3, [r2, #0x50]
0008eeac  sub.w   r0, r3, #0xc
0008eeb0  cmp     r4, r0
0008eeb2  bne     #0x8ef08
0008eeb4  ldr     r0, [sp, #4]
0008eeb6  mov.w   r3, #-1
0008eeba  str     r3, [sp, #0x20]
0008eebc  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0008eec0  ldr     r0, [sp, #4]
0008eec2  blx     #0xdd5a8 ; -> ZdlPv
0008eec6  add     r0, sp, #0x1c
0008eec8  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008eecc  sub.w   sp, r7, #0x58
0008eed0  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008eed4  sub.w   sp, r7, #0x18
0008eed8  pop.w   {r8, sl, fp}
0008eedc  pop     {r4, r5, r6, r7, pc}
0008eede  ldr     r3, [r2, #-0x4]
0008eee2  subs    r1, r2, #4
0008eee4  subs    r2, r3, #1
0008eee6  dmb     ish
0008eeea  mov     ip, r3
0008eeec  ldrex   r4, [r1]
0008eef0  cmp     r4, r3
0008eef2  beq     #0x8ef7a
0008eef4  cmp     r4, ip
0008eef6  mov     r3, r4
0008eef8  bne     #0x8eee4
0008eefa  cmp     r4, #0
0008eefc  bgt     #0x8ee98
0008eefe  add.w   r1, sp, #0x56
0008ef02  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008ef06  b       #0x8ee98
0008ef08  subs    r2, r3, #4
0008ef0a  ldr     r3, [r3, #-0x4]
0008ef0e  subs    r1, r3, #1
0008ef10  dmb     ish
0008ef14  mov     ip, r3
0008ef16  ldrex   r4, [r2]
0008ef1a  cmp     r4, r3
0008ef1c  beq     #0x8ef6a
0008ef1e  cmp     r4, ip
0008ef20  mov     r3, r4
0008ef22  bne     #0x8ef0e
0008ef24  cmp     r4, #0
0008ef26  bgt     #0x8eeb4
0008ef28  add.w   r1, sp, #0x52
0008ef2c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008ef30  b       #0x8eeb4
0008ef32  subs    r2, r3, #4
0008ef34  ldr     r3, [r3, #-0x4]
0008ef38  subs    r1, r3, #1
0008ef3a  dmb     ish
0008ef3e  mov     ip, r3
0008ef40  ldrex   r4, [r2]
0008ef44  cmp     r4, r3
0008ef46  beq     #0x8ef5a
0008ef48  cmp     r4, ip
0008ef4a  mov     r3, r4
0008ef4c  bne     #0x8ef38
0008ef4e  cmp     r4, #0
0008ef50  bgt     #0x8eea6
0008ef52  add     r1, sp, #0x54
0008ef54  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008ef58  b       #0x8eea6
0008ef5a  strex   lr, r1, [r2]
0008ef5e  cmp.w   lr, #0
0008ef62  bne     #0x8ef40
0008ef64  dmb     ish
0008ef68  b       #0x8ef48
0008ef6a  strex   lr, r1, [r2]
0008ef6e  cmp.w   lr, #0
0008ef72  bne     #0x8ef16
0008ef74  dmb     ish
0008ef78  b       #0x8ef1e
0008ef7a  strex   lr, r2, [r1]
0008ef7e  cmp.w   lr, #0
0008ef82  bne     #0x8eeec
0008ef84  dmb     ish
0008ef88  b       #0x8eef4
0008ef8a  ldr     r3, [sp, #0x24]
0008ef8c  ldr     r4, [sp, #4]
0008ef8e  str     r3, [sp, #8]
0008ef90  ldr     r3, [pc, #0x110]
0008ef92  ldr     r1, [r4, #0x58]
0008ef94  add     r3, pc ; -> 0x000f3370  0x0
0008ef96  sub.w   r0, r1, #0xc
0008ef9a  ldr     r3, [r3]
0008ef9c  cmp     r0, r3
0008ef9e  str     r3, [sp, #0x14]
0008efa0  bne     #0x8efe0
0008efa2  ldr     r2, [sp, #8]
0008efa4  ldr     r4, [sp, #4]
0008efa6  str     r2, [sp, #0xc]
0008efa8  ldr     r3, [r4, #0x54]
0008efaa  ldr     r2, [sp, #0x14]
0008efac  sub.w   r0, r3, #0xc
0008efb0  cmp     r2, r0
0008efb2  bne     #0x8f036
0008efb4  ldr     r2, [sp, #0xc]
0008efb6  ldr     r4, [sp, #4]
0008efb8  str     r2, [sp, #0x10]
0008efba  ldr     r3, [r4, #0x50]
0008efbc  ldr     r2, [sp, #0x14]
0008efbe  sub.w   r0, r3, #0xc
0008efc2  cmp     r2, r0
0008efc4  bne     #0x8f00c
0008efc6  ldr     r2, [sp, #0x10]
0008efc8  ldr     r0, [sp, #4]
0008efca  movs    r3, #0
0008efcc  str     r3, [sp, #0x20]
0008efce  str     r2, [sp]
0008efd0  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0008efd4  ldr     r0, [sp]
0008efd6  mov.w   r3, #-1
0008efda  str     r3, [sp, #0x20]
0008efdc  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008efe0  ldr     r3, [r1, #-0x4]
0008efe4  subs    r2, r1, #4
0008efe6  subs    r1, r3, #1
0008efe8  dmb     ish
0008efec  mov     ip, r3
0008efee  ldrex   lr, [r2]
0008eff2  cmp     lr, r3
0008eff4  beq     #0x8f070
0008eff6  cmp     lr, ip
0008eff8  mov     r3, lr
0008effa  bne     #0x8efe6
0008effc  cmp.w   lr, #0
0008f000  bgt     #0x8efa2
0008f002  add.w   r1, sp, #0x57
0008f006  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008f00a  b       #0x8efa2
0008f00c  subs    r2, r3, #4
0008f00e  ldr     r3, [r3, #-0x4]
0008f012  subs    r1, r3, #1
0008f014  dmb     ish
0008f018  mov     ip, r3
0008f01a  ldrex   r4, [r2]
0008f01e  cmp     r4, r3
0008f020  beq     #0x8f060
0008f022  cmp     r4, ip
0008f024  mov     r3, r4
0008f026  bne     #0x8f012
0008f028  cmp     r4, #0
0008f02a  bgt     #0x8efc6
0008f02c  add.w   r1, sp, #0x53
0008f030  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008f034  b       #0x8efc6
0008f036  subs    r2, r3, #4
0008f038  ldr     r3, [r3, #-0x4]
0008f03c  subs    r1, r3, #1
0008f03e  dmb     ish
0008f042  mov     ip, r3
0008f044  ldrex   r4, [r2]
0008f048  cmp     r4, r3
0008f04a  beq     #0x8f07e
0008f04c  cmp     r4, ip
0008f04e  mov     r3, r4
0008f050  bne     #0x8f03c
0008f052  cmp     r4, #0
0008f054  bgt     #0x8efb4
0008f056  add.w   r1, sp, #0x55
0008f05a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008f05e  b       #0x8efb4
0008f060  strex   lr, r1, [r2]
0008f064  cmp.w   lr, #0
0008f068  bne     #0x8f01a
0008f06a  dmb     ish
0008f06e  b       #0x8f022
0008f070  strex   r4, r1, [r2]
0008f074  cmp     r4, #0
0008f076  bne     #0x8efee
0008f078  dmb     ish
0008f07c  b       #0x8eff6
0008f07e  strex   lr, r1, [r2]
0008f082  cmp.w   lr, #0
0008f086  bne     #0x8f044
0008f088  dmb     ish
0008f08c  b       #0x8f04c
0008f08e  nop     
0008f090  cmp     ip, ip
0008f092  movs    r6, r0
