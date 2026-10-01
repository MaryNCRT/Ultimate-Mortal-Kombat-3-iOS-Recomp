========================================================================
ZN6Mayhem15PostStatRequestC2EPNS_5TokenERKSsS4_iiPKv  0x0008d9f4  576 bytes   Mayhem.mm
========================================================================

0008d9f4  push    {r4, r5, r6, r7, lr}
0008d9f6  add     r7, sp, #0xc
0008d9f8  push.w  {r8, sl, fp}
0008d9fc  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008da00  sub     sp, #0x68
0008da02  str     r3, [sp, #4]
0008da04  ldr     r3, [pc, #0x200]
0008da06  str     r0, [sp, #0x10]
0008da08  add     r0, sp, #0x30
0008da0a  add     r3, pc ; -> 0x000f3438  0x0
0008da0c  str     r1, [sp, #0xc]
0008da0e  ldr     r3, [r3]
0008da10  str     r2, [sp, #8]
0008da12  str     r7, [sp, #0x50]
0008da14  str.w   sp, [sp, #0x58]
0008da18  str     r3, [sp, #0x48]
0008da1a  ldr     r3, [pc, #0x1f0]
0008da1c  add     r3, pc ; -> 0x000ee2cc  GCC_except_table39
0008da1e  str     r3, [sp, #0x4c]
0008da20  ldr     r3, [pc, #0x1ec]
0008da22  add     r3, pc ; -> 0x0008dae8  
0008da24  orr     r3, r3, #1
0008da28  str     r3, [sp, #0x54]
0008da2a  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008da2e  ldr     r0, [sp, #0x10]
0008da30  bl      #0x8ad08 ; -> ZN6Mayhem4StatC2Ev
0008da34  ldr     r2, [sp, #0x10]
0008da36  movs    r3, #4
0008da38  ldr     r1, [sp, #0xc]
0008da3a  adds    r2, #8
0008da3c  str     r3, [sp, #0x34]
0008da3e  str     r2, [sp, #0x14]
0008da40  mov     r0, r2
0008da42  bl      #0x8cb8c ; -> ZN6Mayhem7RequestC2EPNS_5TokenE
0008da46  ldr     r4, [sp, #0x10]
0008da48  ldr     r3, [pc, #0x1c8]
0008da4a  add.w   r0, r4, #0x58
0008da4e  add     r3, pc ; -> 0x0017da80  ZTVN6Mayhem15PostStatRequestE
0008da50  adds    r3, #8
0008da52  str     r3, [r4]
0008da54  ldr     r3, [pc, #0x1c0]
0008da56  add     r3, pc ; -> 0x0017da80  ZTVN6Mayhem15PostStatRequestE
0008da58  adds    r3, #0x1c
0008da5a  str     r3, [r4, #8]
0008da5c  ldr     r1, [sp, #4]
0008da5e  movs    r3, #3
0008da60  str     r3, [sp, #0x34]
0008da62  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008da66  movs    r3, #2
0008da68  add.w   r0, r4, #0x5c
0008da6c  str     r3, [sp, #0x34]
0008da6e  ldr     r1, [sp, #8]
0008da70  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008da74  ldr     r3, [sp, #0xc8]
0008da76  ldr     r0, [pc, #0x1a4]
0008da78  ldr     r1, [pc, #0x1a4]
0008da7a  add.w   lr, r4, #0x64
0008da7e  str     r3, [r4, #0x60]
0008da80  ldr     r3, [pc, #0x1a0]
0008da82  add     r0, pc ; -> 0x000fdb6c  
0008da84  add     r1, pc ; -> 0x000fca88  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x110
0008da86  add     r3, pc ; -> 0x000f3370  0x0
0008da88  str.w   lr, [sp, #0x28]
0008da8c  ldr     r3, [r3]
0008da8e  movs    r2, #1
0008da90  ldr     r0, [r0]
0008da92  ldr     r1, [r1]
0008da94  str     r3, [sp, #0x24]
0008da96  adds    r3, #0xc
0008da98  str     r3, [r4, #0x64]
0008da9a  ldr     r3, [sp, #0xcc]
0008da9c  str     r2, [sp, #0x34]
0008da9e  ldr     r2, [sp, #0xd0]
0008daa0  blx     #0xddbfc ; -> objc_msgSend
0008daa4  ldr     r1, [pc, #0x180]
0008daa6  add     r1, pc ; -> 0x000fcf88  
0008daa8  ldr     r1, [r1]
0008daaa  blx     #0xddbfc ; -> objc_msgSend
0008daae  ldr     r1, [pc, #0x17c]
0008dab0  movs    r2, #1
0008dab2  add     r1, pc ; -> 0x000fcf68  
0008dab4  ldr     r1, [r1]
0008dab6  blx     #0xddbfc ; -> objc_msgSend
0008daba  str     r0, [sp, #0x2c]
0008dabc  blx     #0xdde0c ; -> strlen
0008dac0  ldr     r1, [sp, #0x2c]
0008dac2  mov     r2, r0
0008dac4  ldr     r0, [sp, #0x28]
0008dac6  blx     #0xdd50c ; -> ZNSs6assignEPKcm
0008daca  ldr     r0, [sp, #0x14]
0008dacc  bl      #0x8b6b8 ; -> ZN6Mayhem12MayhemThread5startEv
0008dad0  add     r0, sp, #0x30
0008dad2  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008dad6  sub.w   sp, r7, #0x58
0008dada  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008dade  sub.w   sp, r7, #0x18
0008dae2  pop.w   {r8, sl, fp}
0008dae6  pop     {r4, r5, r6, r7, pc}
0008dae8  ldr     r3, [sp, #0x34]
0008daea  ldr     r4, [sp, #0x38]
0008daec  cmp     r3, #1
0008daee  str     r4, [sp]
0008daf0  beq     #0x8db20
0008daf2  cmp     r3, #2
0008daf4  beq     #0x8db3a
0008daf6  cmp     r3, #3
0008daf8  beq     #0x8db48
0008dafa  ldr     r2, [sp, #0x10]
0008dafc  str     r4, [sp, #0x18]
0008dafe  ldr     r4, [sp, #0x24]
0008db00  ldr     r3, [r2, #0x64]
0008db02  sub.w   r0, r3, #0xc
0008db06  cmp     r4, r0
0008db08  bne     #0x8dbb0
0008db0a  ldr     r2, [sp, #0x18]
0008db0c  ldr     r4, [sp, #0x10]
0008db0e  str     r2, [sp, #0x1c]
0008db10  ldr     r3, [r4, #0x5c]
0008db12  ldr     r2, [sp, #0x24]
0008db14  sub.w   r0, r3, #0xc
0008db18  cmp     r2, r0
0008db1a  bne     #0x8db86
0008db1c  ldr     r2, [sp, #0x1c]
0008db1e  str     r2, [sp]
0008db20  ldr     r3, [sp]
0008db22  ldr     r4, [sp, #0x10]
0008db24  str     r3, [sp, #0x20]
0008db26  ldr     r3, [pc, #0x108]
0008db28  ldr     r1, [r4, #0x58]
0008db2a  add     r3, pc ; -> 0x000f3370  0x0
0008db2c  sub.w   r0, r1, #0xc
0008db30  ldr     r3, [r3]
0008db32  cmp     r0, r3
0008db34  bne     #0x8db5a
0008db36  ldr     r2, [sp, #0x20]
0008db38  str     r2, [sp]
0008db3a  ldr     r3, [sp, #0x10]
0008db3c  add.w   r0, r3, #8
0008db40  movs    r3, #0
0008db42  str     r3, [sp, #0x34]
0008db44  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0008db48  ldr     r0, [sp, #0x10]
0008db4a  bl      #0x8b38c ; -> ZN6Mayhem4StatD2Ev
0008db4e  ldr     r0, [sp]
0008db50  mov.w   r3, #-1
0008db54  str     r3, [sp, #0x34]
0008db56  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008db5a  ldr     r3, [r1, #-0x4]
0008db5e  subs    r2, r1, #4
0008db60  subs    r1, r3, #1
0008db62  dmb     ish
0008db66  mov     ip, r3
0008db68  ldrex   lr, [r2]
0008db6c  cmp     lr, r3
0008db6e  beq     #0x8dbec
0008db70  cmp     lr, ip
0008db72  mov     r3, lr
0008db74  bne     #0x8db60
0008db76  cmp.w   lr, #0
0008db7a  bgt     #0x8db36
0008db7c  add.w   r1, sp, #0x65
0008db80  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008db84  b       #0x8db36
0008db86  subs    r2, r3, #4
0008db88  ldr     r3, [r3, #-0x4]
0008db8c  subs    r1, r3, #1
0008db8e  dmb     ish
0008db92  mov     ip, r3
0008db94  ldrex   r4, [r2]
0008db98  cmp     r4, r3
0008db9a  beq     #0x8dbdc
0008db9c  cmp     r4, ip
0008db9e  mov     r3, r4
0008dba0  bne     #0x8db8c
0008dba2  cmp     r4, #0
0008dba4  bgt     #0x8db1c
0008dba6  add.w   r1, sp, #0x66
0008dbaa  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008dbae  b       #0x8db1c
0008dbb0  subs    r2, r3, #4
0008dbb2  ldr     r3, [r3, #-0x4]
0008dbb6  subs    r1, r3, #1
0008dbb8  dmb     ish
0008dbbc  mov     ip, r3
0008dbbe  ldrex   lr, [r2]
0008dbc2  cmp     lr, r3
0008dbc4  beq     #0x8dbfa
0008dbc6  cmp     lr, ip
0008dbc8  mov     r3, lr
0008dbca  bne     #0x8dbb6
0008dbcc  cmp.w   lr, #0
0008dbd0  bgt     #0x8db0a
0008dbd2  add.w   r1, sp, #0x67
0008dbd6  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008dbda  b       #0x8db0a
0008dbdc  strex   lr, r1, [r2]
0008dbe0  cmp.w   lr, #0
0008dbe4  bne     #0x8db94
0008dbe6  dmb     ish
0008dbea  b       #0x8db9c
0008dbec  strex   r4, r1, [r2]
0008dbf0  cmp     r4, #0
0008dbf2  bne     #0x8db68
0008dbf4  dmb     ish
0008dbf8  b       #0x8db70
0008dbfa  strex   r4, r1, [r2]
0008dbfe  cmp     r4, #0
0008dc00  bne     #0x8dbbe
0008dc02  dmb     ish
0008dc06  b       #0x8dbc6
0008dc08  ldrh    r2, [r5, r0]
0008dc0a  movs    r6, r0
0008dc0c  lsrs    r4, r5, #2
0008dc0e  movs    r6, r0
0008dc10  lsls    r2, r0, #3
0008dc12  movs    r0, r0
0008dc14  movs    r6, r5
0008dc16  movs    r7, r1
0008dc18  movs    r6, r4
0008dc1a  movs    r7, r1
0008dc1c  lsls    r6, r4, #3
0008dc1e  movs    r7, r0
0008dc20  and     r0, r0, #6
0008dc24  ldr     r6, [r4, r3]
0008dc26  movs    r6, r0
