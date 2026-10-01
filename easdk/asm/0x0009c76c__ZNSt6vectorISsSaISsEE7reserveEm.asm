========================================================================
ZNSt6vectorISsSaISsEE7reserveEm  0x0009c76c  560 bytes   Mayhem.mm
========================================================================

0009c76c  push    {r4, r5, r6, r7, lr}
0009c76e  add     r7, sp, #0xc
0009c770  push.w  {r8, sl, fp}
0009c774  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009c778  sub     sp, #0x7c
0009c77a  ldr     r3, [pc, #0x208]
0009c77c  str     r0, [sp, #8]
0009c77e  add     r0, sp, #0x44
0009c780  add     r3, pc ; -> 0x000f3438  0x0
0009c782  str     r1, [sp, #4]
0009c784  ldr     r3, [r3]
0009c786  str     r7, [sp, #0x64]
0009c788  str.w   sp, [sp, #0x6c]
0009c78c  str     r3, [sp, #0x5c]
0009c78e  ldr     r3, [pc, #0x1f8]
0009c790  add     r3, pc ; -> 0x000ee350  GCC_except_table60
0009c792  str     r3, [sp, #0x60]
0009c794  ldr     r3, [pc, #0x1f4]
0009c796  add     r3, pc ; -> 0x0009c8cc  
0009c798  orr     r3, r3, #1
0009c79c  str     r3, [sp, #0x68]
0009c79e  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009c7a2  ldr     r1, [sp, #4]
0009c7a4  cmp.w   r1, #0x40000000
0009c7a8  bhs.w   #0x9c8be
0009c7ac  ldr     r2, [sp, #8]
0009c7ae  ldr     r4, [sp, #4]
0009c7b0  ldr     r3, [r2, #8]
0009c7b2  ldr     r2, [r2]
0009c7b4  subs    r3, r3, r2
0009c7b6  cmp.w   r4, r3, asr #2
0009c7ba  bhi     #0x9c7d4
0009c7bc  add     r0, sp, #0x44
0009c7be  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009c7c2  sub.w   sp, r7, #0x58
0009c7c6  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009c7ca  sub.w   sp, r7, #0x18
0009c7ce  pop.w   {r8, sl, fp}
0009c7d2  pop     {r4, r5, r6, r7, pc}
0009c7d4  ldr     r1, [sp, #8]
0009c7d6  mov.w   r3, #-1
0009c7da  ldr     r1, [r1, #4]
0009c7dc  str     r2, [sp, #0x10]
0009c7de  str     r2, [sp, #0x24]
0009c7e0  lsls    r2, r4, #2
0009c7e2  str     r3, [sp, #0x48]
0009c7e4  mov     r0, r2
0009c7e6  str     r1, [sp, #0x14]
0009c7e8  str     r1, [sp, #0x20]
0009c7ea  str     r2, [sp, #0x1c]
0009c7ec  blx     #0xdd5c0 ; -> Znwm
0009c7f0  ldr     r3, [sp, #0x10]
0009c7f2  ldr     r4, [sp, #0x14]
0009c7f4  cmp     r3, r4
0009c7f6  str     r0, [sp, #0xc]
0009c7f8  str     r0, [sp, #0x18]
0009c7fa  beq     #0x9c826
0009c7fc  str     r0, [sp, #0x34]
0009c7fe  str     r0, [sp, #0x40]
0009c800  b       #0x9c804
0009c802  str     r4, [sp, #0x40]
0009c804  ldr     r1, [sp, #0x40]
0009c806  cbz     r1, #0x9c814
0009c808  movs    r3, #1
0009c80a  mov     r0, r1
0009c80c  str     r3, [sp, #0x48]
0009c80e  ldr     r1, [sp, #0x24]
0009c810  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009c814  ldr     r3, [sp, #0x24]
0009c816  ldr     r4, [sp, #0x34]
0009c818  ldr     r1, [sp, #0x20]
0009c81a  adds    r3, #4
0009c81c  adds    r4, #4
0009c81e  cmp     r1, r3
0009c820  str     r3, [sp, #0x24]
0009c822  str     r4, [sp, #0x34]
0009c824  bne     #0x9c802
0009c826  ldr     r3, [sp, #8]
0009c828  ldr     r2, [r3]
0009c82a  ldr     r4, [r3, #4]
0009c82c  cmp     r2, r4
0009c82e  str     r4, [sp, #0x28]
0009c830  beq     #0x9c856
0009c832  ldr     r3, [pc, #0x15c]
0009c834  str     r2, [sp, #0x30]
0009c836  add     r3, pc ; -> 0x000f3370  0x0
0009c838  ldr     r3, [r3]
0009c83a  str     r3, [sp, #0x2c]
0009c83c  ldr     r4, [sp, #0x30]
0009c83e  ldr     r1, [sp, #0x2c]
0009c840  ldr     r3, [r4]
0009c842  sub.w   r0, r3, #0xc
0009c846  cmp     r1, r0
0009c848  bne     #0x9c884
0009c84a  ldr     r1, [sp, #0x30]
0009c84c  ldr     r2, [sp, #0x28]
0009c84e  adds    r1, #4
0009c850  cmp     r2, r1
0009c852  str     r1, [sp, #0x30]
0009c854  bne     #0x9c83c
0009c856  ldr     r3, [sp, #8]
0009c858  ldr     r0, [r3]
0009c85a  cbz     r0, #0x9c860
0009c85c  blx     #0xdd5a8 ; -> ZdlPv
0009c860  ldr     r1, [sp, #0xc]
0009c862  ldr     r4, [sp, #8]
0009c864  str     r1, [r4]
0009c866  ldr     r2, [sp, #0x14]
0009c868  ldr     r4, [sp, #0x10]
0009c86a  rsb     r3, r4, r2
0009c86e  bic     r3, r3, #3
0009c872  add     r3, r1
0009c874  ldr     r1, [sp, #8]
0009c876  str     r3, [r1, #4]
0009c878  ldr     r2, [sp, #0xc]
0009c87a  ldr     r4, [sp, #0x1c]
0009c87c  add.w   r3, r2, r4
0009c880  str     r3, [r1, #8]
0009c882  b       #0x9c7bc
0009c884  subs    r2, r3, #4
0009c886  ldr     r3, [r3, #-0x4]
0009c88a  subs    r1, r3, #1
0009c88c  dmb     ish
0009c890  mov     ip, r3
0009c892  ldrex   r4, [r2]
0009c896  cmp     r4, r3
0009c898  beq     #0x9c8ae
0009c89a  cmp     r4, ip
0009c89c  mov     r3, r4
0009c89e  bne     #0x9c88a
0009c8a0  cmp     r4, #0
0009c8a2  bgt     #0x9c84a
0009c8a4  add.w   r1, sp, #0x7a
0009c8a8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009c8ac  b       #0x9c84a
0009c8ae  strex   lr, r1, [r2]
0009c8b2  cmp.w   lr, #0
0009c8b6  bne     #0x9c892
0009c8b8  dmb     ish
0009c8bc  b       #0x9c89a
0009c8be  ldr     r0, [pc, #0xd4]
0009c8c0  mov.w   r3, #-1
0009c8c4  str     r3, [sp, #0x48]
0009c8c6  add     r0, pc ; -> 0x00175c08  'vector::reserve'
0009c8c8  blx     #0xdd578 ; -> ZSt20__throw_length_errorPKc
0009c8cc  ldr     r3, [sp, #0x48]
0009c8ce  ldr     r2, [sp, #0x4c]
0009c8d0  cmp     r3, #1
0009c8d2  str     r2, [sp]
0009c8d4  beq     #0x9c914
0009c8d6  cmp     r3, #2
0009c8d8  beq     #0x9c95e
0009c8da  ldr     r0, [sp]
0009c8dc  blx     #0xdd5e4 ; -> cxa_begin_catch
0009c8e0  ldr     r1, [sp, #0xc]
0009c8e2  ldr     r2, [sp, #0x40]
0009c8e4  cmp     r1, r2
0009c8e6  beq     #0x9c90c
0009c8e8  ldr     r3, [pc, #0xac]
0009c8ea  str     r1, [sp, #0x3c]
0009c8ec  add     r3, pc ; -> 0x000f3370  0x0
0009c8ee  ldr     r3, [r3]
0009c8f0  str     r3, [sp, #0x38]
0009c8f2  ldr     r4, [sp, #0x3c]
0009c8f4  ldr     r1, [sp, #0x38]
0009c8f6  ldr     r3, [r4]
0009c8f8  sub.w   r0, r3, #0xc
0009c8fc  cmp     r0, r1
0009c8fe  bne     #0x9c934
0009c900  ldr     r1, [sp, #0x3c]
0009c902  ldr     r2, [sp, #0x40]
0009c904  adds    r1, #4
0009c906  cmp     r1, r2
0009c908  str     r1, [sp, #0x3c]
0009c90a  bne     #0x9c8f2
0009c90c  movs    r3, #2
0009c90e  str     r3, [sp, #0x48]
0009c910  blx     #0xdd5fc ; -> cxa_rethrow
0009c914  movs    r3, #0
0009c916  str     r3, [sp, #0x48]
0009c918  blx     #0xdd5f0 ; -> cxa_end_catch
0009c91c  ldr     r0, [sp]
0009c91e  blx     #0xdd5e4 ; -> cxa_begin_catch
0009c922  ldr     r3, [sp, #0x18]
0009c924  cbz     r3, #0x9c92c
0009c926  ldr     r0, [sp, #0xc]
0009c928  blx     #0xdd5a8 ; -> ZdlPv
0009c92c  movs    r3, #3
0009c92e  str     r3, [sp, #0x48]
0009c930  blx     #0xdd5fc ; -> cxa_rethrow
0009c934  subs    r2, r3, #4
0009c936  ldr     r3, [r3, #-0x4]
0009c93a  subs    r1, r3, #1
0009c93c  dmb     ish
0009c940  mov     ip, r3
0009c942  ldrex   r4, [r2]
0009c946  cmp     r4, r3
0009c948  beq     #0x9c972
0009c94a  cmp     r4, ip
0009c94c  mov     r3, r4
0009c94e  bne     #0x9c93a
0009c950  cmp     r4, #0
0009c952  bgt     #0x9c900
0009c954  add.w   r1, sp, #0x7b
0009c958  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009c95c  b       #0x9c900
0009c95e  movs    r3, #0
0009c960  str     r3, [sp, #0x48]
0009c962  blx     #0xdd5f0 ; -> cxa_end_catch
0009c966  ldr     r0, [sp]
0009c968  mov.w   r3, #-1
0009c96c  str     r3, [sp, #0x48]
0009c96e  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009c972  strex   lr, r1, [r2]
0009c976  cmp.w   lr, #0
0009c97a  bne     #0x9c942
0009c97c  dmb     ish
0009c980  b       #0x9c94a
0009c982  nop     
0009c984  ldr     r4, [r6, #0x48]
0009c986  movs    r5, r0
0009c988  subs    r4, r7, r6
0009c98a  movs    r5, r0
0009c98c  lsls    r2, r6, #4
0009c98e  movs    r0, r0
0009c990  ldr     r6, [r6, #0x30]
0009c992  movs    r5, r0
0009c994  str     r3, [sp, #0xf8]
0009c996  movs    r5, r1
0009c998  ldr     r0, [r0, #0x28]
0009c99a  movs    r5, r0
