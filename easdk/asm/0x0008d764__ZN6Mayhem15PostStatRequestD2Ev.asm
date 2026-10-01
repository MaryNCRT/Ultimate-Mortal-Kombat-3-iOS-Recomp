========================================================================
ZN6Mayhem15PostStatRequestD2Ev  0x0008d764  636 bytes   Mayhem.mm
========================================================================

0008d764  push    {r4, r5, r6, r7, lr}
0008d766  add     r7, sp, #0xc
0008d768  push.w  {r8, sl, fp}
0008d76c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008d770  sub     sp, #0x58
0008d772  ldr     r3, [pc, #0x250]
0008d774  str     r0, [sp, #4]
0008d776  add     r0, sp, #0x1c
0008d778  add     r3, pc ; -> 0x000f3438  0x0
0008d77a  str     r7, [sp, #0x3c]
0008d77c  ldr     r3, [r3]
0008d77e  str.w   sp, [sp, #0x44]
0008d782  str     r3, [sp, #0x34]
0008d784  ldr     r3, [pc, #0x240]
0008d786  add     r3, pc ; -> 0x000ee2c6  GCC_except_table38
0008d788  str     r3, [sp, #0x38]
0008d78a  ldr     r3, [pc, #0x240]
0008d78c  add     r3, pc ; -> 0x0008d8ba  
0008d78e  orr     r3, r3, #1
0008d792  str     r3, [sp, #0x40]
0008d794  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008d798  ldr     r2, [sp, #4]
0008d79a  ldr     r3, [pc, #0x234]
0008d79c  add.w   r0, r2, #8
0008d7a0  add     r3, pc ; -> 0x0017da80  ZTVN6Mayhem15PostStatRequestE
0008d7a2  adds    r3, #8
0008d7a4  str     r3, [r2]
0008d7a6  ldr     r3, [pc, #0x22c]
0008d7a8  add     r3, pc ; -> 0x0017da80  ZTVN6Mayhem15PostStatRequestE
0008d7aa  adds    r3, #0x1c
0008d7ac  str     r3, [r2, #8]
0008d7ae  movs    r3, #1
0008d7b0  str     r3, [sp, #0x20]
0008d7b2  bl      #0x8b6a8 ; -> ZN6Mayhem12MayhemThread4waitEv
0008d7b6  ldr     r3, [sp, #4]
0008d7b8  ldr     r2, [r3, #0x64]
0008d7ba  ldr     r3, [pc, #0x21c]
0008d7bc  sub.w   r0, r2, #0xc
0008d7c0  add     r3, pc ; -> 0x000f3370  0x0
0008d7c2  ldr     r3, [r3]
0008d7c4  cmp     r0, r3
0008d7c6  str     r3, [sp, #0x18]
0008d7c8  bne     #0x8d80e
0008d7ca  ldr     r2, [sp, #4]
0008d7cc  ldr     r4, [sp, #0x18]
0008d7ce  ldr     r3, [r2, #0x5c]
0008d7d0  sub.w   r0, r3, #0xc
0008d7d4  cmp     r4, r0
0008d7d6  bne     #0x8d862
0008d7d8  ldr     r2, [sp, #4]
0008d7da  ldr     r4, [sp, #0x18]
0008d7dc  ldr     r3, [r2, #0x58]
0008d7de  sub.w   r0, r3, #0xc
0008d7e2  cmp     r4, r0
0008d7e4  bne     #0x8d838
0008d7e6  ldr     r2, [sp, #4]
0008d7e8  mov.w   r3, #-1
0008d7ec  str     r3, [sp, #0x20]
0008d7ee  add.w   r0, r2, #8
0008d7f2  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0008d7f6  add     r0, sp, #0x1c
0008d7f8  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008d7fc  sub.w   sp, r7, #0x58
0008d800  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008d804  sub.w   sp, r7, #0x18
0008d808  pop.w   {r8, sl, fp}
0008d80c  pop     {r4, r5, r6, r7, pc}
0008d80e  ldr     r3, [r2, #-0x4]
0008d812  subs    r1, r2, #4
0008d814  subs    r2, r3, #1
0008d816  dmb     ish
0008d81a  mov     ip, r3
0008d81c  ldrex   r4, [r1]
0008d820  cmp     r4, r3
0008d822  beq     #0x8d8aa
0008d824  cmp     r4, ip
0008d826  mov     r3, r4
0008d828  bne     #0x8d814
0008d82a  cmp     r4, #0
0008d82c  bgt     #0x8d7ca
0008d82e  add.w   r1, sp, #0x56
0008d832  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d836  b       #0x8d7ca
0008d838  subs    r2, r3, #4
0008d83a  ldr     r3, [r3, #-0x4]
0008d83e  subs    r1, r3, #1
0008d840  dmb     ish
0008d844  mov     ip, r3
0008d846  ldrex   r4, [r2]
0008d84a  cmp     r4, r3
0008d84c  beq     #0x8d89a
0008d84e  cmp     r4, ip
0008d850  mov     r3, r4
0008d852  bne     #0x8d83e
0008d854  cmp     r4, #0
0008d856  bgt     #0x8d7e6
0008d858  add.w   r1, sp, #0x52
0008d85c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d860  b       #0x8d7e6
0008d862  subs    r2, r3, #4
0008d864  ldr     r3, [r3, #-0x4]
0008d868  subs    r1, r3, #1
0008d86a  dmb     ish
0008d86e  mov     ip, r3
0008d870  ldrex   r4, [r2]
0008d874  cmp     r4, r3
0008d876  beq     #0x8d88a
0008d878  cmp     r4, ip
0008d87a  mov     r3, r4
0008d87c  bne     #0x8d868
0008d87e  cmp     r4, #0
0008d880  bgt     #0x8d7d8
0008d882  add     r1, sp, #0x54
0008d884  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d888  b       #0x8d7d8
0008d88a  strex   lr, r1, [r2]
0008d88e  cmp.w   lr, #0
0008d892  bne     #0x8d870
0008d894  dmb     ish
0008d898  b       #0x8d878
0008d89a  strex   lr, r1, [r2]
0008d89e  cmp.w   lr, #0
0008d8a2  bne     #0x8d846
0008d8a4  dmb     ish
0008d8a8  b       #0x8d84e
0008d8aa  strex   lr, r2, [r1]
0008d8ae  cmp.w   lr, #0
0008d8b2  bne     #0x8d81c
0008d8b4  dmb     ish
0008d8b8  b       #0x8d824
0008d8ba  ldr     r3, [sp, #0x24]
0008d8bc  ldr     r4, [sp, #4]
0008d8be  str     r3, [sp, #8]
0008d8c0  ldr     r3, [pc, #0x118]
0008d8c2  ldr     r1, [r4, #0x64]
0008d8c4  add     r3, pc ; -> 0x000f3370  0x0
0008d8c6  sub.w   r0, r1, #0xc
0008d8ca  ldr     r3, [r3]
0008d8cc  cmp     r0, r3
0008d8ce  str     r3, [sp, #0x14]
0008d8d0  bne     #0x8d914
0008d8d2  ldr     r2, [sp, #8]
0008d8d4  ldr     r4, [sp, #4]
0008d8d6  str     r2, [sp, #0xc]
0008d8d8  ldr     r3, [r4, #0x5c]
0008d8da  ldr     r2, [sp, #0x14]
0008d8dc  sub.w   r0, r3, #0xc
0008d8e0  cmp     r2, r0
0008d8e2  bne     #0x8d96a
0008d8e4  ldr     r2, [sp, #0xc]
0008d8e6  ldr     r4, [sp, #4]
0008d8e8  str     r2, [sp, #0x10]
0008d8ea  ldr     r3, [r4, #0x58]
0008d8ec  ldr     r2, [sp, #0x14]
0008d8ee  sub.w   r0, r3, #0xc
0008d8f2  cmp     r2, r0
0008d8f4  bne     #0x8d940
0008d8f6  ldr     r3, [sp, #4]
0008d8f8  ldr     r2, [sp, #0x10]
0008d8fa  add.w   r0, r3, #8
0008d8fe  movs    r3, #0
0008d900  str     r2, [sp]
0008d902  str     r3, [sp, #0x20]
0008d904  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0008d908  ldr     r0, [sp]
0008d90a  mov.w   r3, #-1
0008d90e  str     r3, [sp, #0x20]
0008d910  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008d914  ldr     r3, [r1, #-0x4]
0008d918  subs    r2, r1, #4
0008d91a  subs    r1, r3, #1
0008d91c  dmb     ish
0008d920  mov     ip, r3
0008d922  ldrex   lr, [r2]
0008d926  cmp     lr, r3
0008d928  beq     #0x8d9a4
0008d92a  cmp     lr, ip
0008d92c  mov     r3, lr
0008d92e  bne     #0x8d91a
0008d930  cmp.w   lr, #0
0008d934  bgt     #0x8d8d2
0008d936  add.w   r1, sp, #0x57
0008d93a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d93e  b       #0x8d8d2
0008d940  subs    r2, r3, #4
0008d942  ldr     r3, [r3, #-0x4]
0008d946  subs    r1, r3, #1
0008d948  dmb     ish
0008d94c  mov     ip, r3
0008d94e  ldrex   r4, [r2]
0008d952  cmp     r4, r3
0008d954  beq     #0x8d994
0008d956  cmp     r4, ip
0008d958  mov     r3, r4
0008d95a  bne     #0x8d946
0008d95c  cmp     r4, #0
0008d95e  bgt     #0x8d8f6
0008d960  add.w   r1, sp, #0x53
0008d964  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d968  b       #0x8d8f6
0008d96a  subs    r2, r3, #4
0008d96c  ldr     r3, [r3, #-0x4]
0008d970  subs    r1, r3, #1
0008d972  dmb     ish
0008d976  mov     ip, r3
0008d978  ldrex   r4, [r2]
0008d97c  cmp     r4, r3
0008d97e  beq     #0x8d9b2
0008d980  cmp     r4, ip
0008d982  mov     r3, r4
0008d984  bne     #0x8d970
0008d986  cmp     r4, #0
0008d988  bgt     #0x8d8e4
0008d98a  add.w   r1, sp, #0x55
0008d98e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008d992  b       #0x8d8e4
0008d994  strex   lr, r1, [r2]
0008d998  cmp.w   lr, #0
0008d99c  bne     #0x8d94e
0008d99e  dmb     ish
0008d9a2  b       #0x8d956
0008d9a4  strex   r4, r1, [r2]
0008d9a8  cmp     r4, #0
0008d9aa  bne     #0x8d922
0008d9ac  dmb     ish
0008d9b0  b       #0x8d92a
0008d9b2  strex   lr, r1, [r2]
0008d9b6  cmp.w   lr, #0
0008d9ba  bne     #0x8d978
0008d9bc  dmb     ish
0008d9c0  b       #0x8d980
0008d9c2  nop     
0008d9c4  ldrb    r4, [r7, r2]
0008d9c6  movs    r6, r0
0008d9c8  lsrs    r4, r7, #0xc
0008d9ca  movs    r6, r0
0008d9cc  lsls    r2, r5, #4
0008d9ce  movs    r0, r0
0008d9d0  lsls    r4, r3, #0xb
0008d9d2  movs    r7, r1
0008d9d4  lsls    r4, r2, #0xb
0008d9d6  movs    r7, r1
0008d9d8  ldrh    r4, [r5, r6]
0008d9da  movs    r6, r0
0008d9dc  ldrh    r0, [r5, r2]
0008d9de  movs    r6, r0
