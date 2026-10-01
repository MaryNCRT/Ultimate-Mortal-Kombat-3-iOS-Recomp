========================================================================
ZN6Mayhem7RequestD2Ev  0x0008c670  560 bytes   Mayhem.mm
========================================================================

0008c670  push    {r4, r5, r6, r7, lr}
0008c672  add     r7, sp, #0xc
0008c674  push.w  {r8, sl, fp}
0008c678  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008c67c  sub     sp, #0x5c
0008c67e  ldr     r3, [pc, #0x204]
0008c680  str     r0, [sp, #4]
0008c682  add     r0, sp, #0x24
0008c684  add     r3, pc ; -> 0x000f3438  0x0
0008c686  str     r7, [sp, #0x44]
0008c688  ldr     r3, [r3]
0008c68a  str.w   sp, [sp, #0x4c]
0008c68e  str     r3, [sp, #0x3c]
0008c690  ldr     r3, [pc, #0x1f4]
0008c692  add     r3, pc ; -> 0x000ee27c  GCC_except_table22
0008c694  str     r3, [sp, #0x40]
0008c696  ldr     r3, [pc, #0x1f4]
0008c698  add     r3, pc ; -> 0x0008c7a2  
0008c69a  orr     r3, r3, #1
0008c69e  str     r3, [sp, #0x48]
0008c6a0  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008c6a4  ldr     r2, [sp, #4]
0008c6a6  ldr     r3, [pc, #0x1e8]
0008c6a8  add.w   r0, r2, #0x20
0008c6ac  add     r3, pc ; -> 0x0017dc54  ZTVN6Mayhem7RequestE
0008c6ae  adds    r3, #8
0008c6b0  str     r3, [r2]
0008c6b2  movs    r3, #1
0008c6b4  str     r3, [sp, #0x28]
0008c6b6  blx     #0xddc74 ; -> pthread_mutex_destroy
0008c6ba  ldr     r1, [pc, #0x1d8]
0008c6bc  ldr     r3, [sp, #4]
0008c6be  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
0008c6c0  ldr     r0, [r3, #0x10]
0008c6c2  ldr     r1, [r1]
0008c6c4  blx     #0xddbfc ; -> objc_msgSend
0008c6c8  ldr     r3, [sp, #4]
0008c6ca  ldr     r2, [r3, #0x1c]
0008c6cc  ldr     r3, [pc, #0x1c8]
0008c6ce  sub.w   r0, r2, #0xc
0008c6d2  add     r3, pc ; -> 0x000f3370  0x0
0008c6d4  ldr     r3, [r3]
0008c6d6  cmp     r0, r3
0008c6d8  str     r3, [sp, #0x20]
0008c6da  bne     #0x8c758
0008c6dc  ldr     r2, [sp, #4]
0008c6de  ldr     r4, [sp, #0x20]
0008c6e0  ldr     r3, [r2, #0x18]
0008c6e2  sub.w   r0, r3, #0xc
0008c6e6  cmp     r4, r0
0008c6e8  bne     #0x8c730
0008c6ea  ldr     r2, [sp, #4]
0008c6ec  ldr     r2, [r2, #0xc]
0008c6ee  str     r2, [sp, #0x18]
0008c6f0  cbz     r2, #0x8c702
0008c6f2  ldr     r4, [sp, #0x18]
0008c6f4  ldr     r3, [r4]
0008c6f6  mov     r0, r4
0008c6f8  ldr     r2, [r3, #8]
0008c6fa  movs    r3, #2
0008c6fc  str     r3, [sp, #0x28]
0008c6fe  blx     r2
0008c700  cbnz    r0, #0x8c726
0008c702  ldr     r0, [sp, #4]
0008c704  mov.w   r3, #-1
0008c708  str     r3, [sp, #0x28]
0008c70a  bl      #0x8b71c ; -> ZN6Mayhem12MayhemThreadD2Ev
0008c70e  add     r0, sp, #0x24
0008c710  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008c714  sub.w   sp, r7, #0x58
0008c718  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008c71c  sub.w   sp, r7, #0x18
0008c720  pop.w   {r8, sl, fp}
0008c724  pop     {r4, r5, r6, r7, pc}
0008c726  ldr     r3, [r4]
0008c728  ldr     r0, [sp, #0x18]
0008c72a  ldr     r3, [r3, #4]
0008c72c  blx     r3
0008c72e  b       #0x8c702
0008c730  subs    r2, r3, #4
0008c732  ldr     r3, [r3, #-0x4]
0008c736  subs    r1, r3, #1
0008c738  dmb     ish
0008c73c  mov     ip, r3
0008c73e  ldrex   r4, [r2]
0008c742  cmp     r4, r3
0008c744  beq     #0x8c792
0008c746  cmp     r4, ip
0008c748  mov     r3, r4
0008c74a  bne     #0x8c736
0008c74c  cmp     r4, #0
0008c74e  bgt     #0x8c6ea
0008c750  add     r1, sp, #0x58
0008c752  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008c756  b       #0x8c6ea
0008c758  ldr     r3, [r2, #-0x4]
0008c75c  subs    r1, r2, #4
0008c75e  subs    r2, r3, #1
0008c760  dmb     ish
0008c764  mov     ip, r3
0008c766  ldrex   r4, [r1]
0008c76a  cmp     r4, r3
0008c76c  beq     #0x8c782
0008c76e  cmp     r4, ip
0008c770  mov     r3, r4
0008c772  bne     #0x8c75e
0008c774  cmp     r4, #0
0008c776  bgt     #0x8c6dc
0008c778  add.w   r1, sp, #0x5a
0008c77c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008c780  b       #0x8c6dc
0008c782  strex   lr, r2, [r1]
0008c786  cmp.w   lr, #0
0008c78a  bne     #0x8c766
0008c78c  dmb     ish
0008c790  b       #0x8c76e
0008c792  strex   lr, r1, [r2]
0008c796  cmp.w   lr, #0
0008c79a  bne     #0x8c73e
0008c79c  dmb     ish
0008c7a0  b       #0x8c746
0008c7a2  ldr     r3, [sp, #0x28]
0008c7a4  ldr     r4, [sp, #0x2c]
0008c7a6  cmp     r3, #1
0008c7a8  str     r4, [sp]
0008c7aa  beq     #0x8c7fa
0008c7ac  ldr     r2, [sp, #4]
0008c7ae  ldr     r3, [pc, #0xec]
0008c7b0  str     r4, [sp, #8]
0008c7b2  add     r3, pc ; -> 0x000f3370  0x0
0008c7b4  ldr     r1, [r2, #0x1c]
0008c7b6  ldr     r3, [r3]
0008c7b8  sub.w   r0, r1, #0xc
0008c7bc  cmp     r0, r3
0008c7be  str     r3, [sp, #0x1c]
0008c7c0  bne     #0x8c810
0008c7c2  ldr     r2, [sp, #8]
0008c7c4  ldr     r4, [sp, #4]
0008c7c6  str     r2, [sp, #0xc]
0008c7c8  ldr     r3, [r4, #0x18]
0008c7ca  ldr     r2, [sp, #0x1c]
0008c7cc  sub.w   r0, r3, #0xc
0008c7d0  cmp     r2, r0
0008c7d2  bne     #0x8c83a
0008c7d4  ldr     r3, [sp, #0xc]
0008c7d6  ldr     r4, [sp, #4]
0008c7d8  str     r3, [sp, #0x10]
0008c7da  ldr     r4, [r4, #0xc]
0008c7dc  str     r4, [sp, #0x14]
0008c7de  cbz     r4, #0x8c7f6
0008c7e0  ldr     r3, [r4]
0008c7e2  mov     r0, r4
0008c7e4  ldr     r2, [r3, #8]
0008c7e6  movs    r3, #0
0008c7e8  str     r3, [sp, #0x28]
0008c7ea  blx     r2
0008c7ec  cbz     r0, #0x8c7f6
0008c7ee  ldr     r3, [r4]
0008c7f0  ldr     r0, [sp, #0x14]
0008c7f2  ldr     r3, [r3, #4]
0008c7f4  blx     r3
0008c7f6  ldr     r2, [sp, #0x10]
0008c7f8  str     r2, [sp]
0008c7fa  ldr     r0, [sp, #4]
0008c7fc  movs    r3, #0
0008c7fe  str     r3, [sp, #0x28]
0008c800  bl      #0x8b71c ; -> ZN6Mayhem12MayhemThreadD2Ev
0008c804  ldr     r0, [sp]
0008c806  mov.w   r3, #-1
0008c80a  str     r3, [sp, #0x28]
0008c80c  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008c810  ldr     r3, [r1, #-0x4]
0008c814  subs    r2, r1, #4
0008c816  subs    r1, r3, #1
0008c818  dmb     ish
0008c81c  mov     ip, r3
0008c81e  ldrex   r4, [r2]
0008c822  cmp     r4, r3
0008c824  beq     #0x8c864
0008c826  cmp     r4, ip
0008c828  mov     r3, r4
0008c82a  bne     #0x8c816
0008c82c  cmp     r4, #0
0008c82e  bgt     #0x8c7c2
0008c830  add.w   r1, sp, #0x5b
0008c834  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008c838  b       #0x8c7c2
0008c83a  subs    r2, r3, #4
0008c83c  ldr     r3, [r3, #-0x4]
0008c840  subs    r1, r3, #1
0008c842  dmb     ish
0008c846  mov     ip, r3
0008c848  ldrex   r4, [r2]
0008c84c  cmp     r4, r3
0008c84e  beq     #0x8c874
0008c850  cmp     r4, ip
0008c852  mov     r3, r4
0008c854  bne     #0x8c840
0008c856  cmp     r4, #0
0008c858  bgt     #0x8c7d4
0008c85a  add.w   r1, sp, #0x59
0008c85e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008c862  b       #0x8c7d4
0008c864  strex   lr, r1, [r2]
0008c868  cmp.w   lr, #0
0008c86c  bne     #0x8c81e
0008c86e  dmb     ish
0008c872  b       #0x8c826
0008c874  strex   lr, r1, [r2]
0008c878  cmp.w   lr, #0
0008c87c  bne     #0x8c848
0008c87e  dmb     ish
0008c882  b       #0x8c850
0008c884  ldr     r0, [r6, #0x58]
0008c886  movs    r6, r0
0008c888  subs    r6, r4, r7
0008c88a  movs    r6, r0
0008c88c  lsls    r6, r0, #4
0008c88e  movs    r0, r0
0008c890  asrs    r4, r4, #0x16
0008c892  movs    r7, r1
0008c894  lsls    r2, r7, #0xa
0008c896  movs    r7, r0
0008c898  ldr     r2, [r3, #0x48]
0008c89a  movs    r6, r0
0008c89c  ldr     r2, [r7, #0x38]
0008c89e  movs    r6, r0
