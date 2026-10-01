========================================================================
ZN6Mayhem14GetUserRequestD0Ev  0x0008e758  340 bytes   Mayhem.mm
========================================================================

0008e758  push    {r4, r5, r6, r7, lr}
0008e75a  add     r7, sp, #0xc
0008e75c  push.w  {r8, sl, fp}
0008e760  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008e764  sub     sp, #0x44
0008e766  ldr     r3, [pc, #0x124]
0008e768  str     r0, [sp, #4]
0008e76a  add     r0, sp, #0xc
0008e76c  add     r3, pc ; -> 0x000f3438  0x0
0008e76e  str     r7, [sp, #0x2c]
0008e770  ldr     r3, [r3]
0008e772  str.w   sp, [sp, #0x34]
0008e776  str     r3, [sp, #0x24]
0008e778  ldr     r3, [pc, #0x114]
0008e77a  add     r3, pc ; -> 0x000ee302  GCC_except_table48
0008e77c  str     r3, [sp, #0x28]
0008e77e  ldr     r3, [pc, #0x114]
0008e780  add     r3, pc ; -> 0x0008e820  
0008e782  orr     r3, r3, #1
0008e786  str     r3, [sp, #0x30]
0008e788  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008e78c  ldr     r2, [sp, #4]
0008e78e  ldr     r3, [pc, #0x108]
0008e790  add.w   r0, r2, #8
0008e794  add     r3, pc ; -> 0x0017dba8  ZTVN6Mayhem14GetUserRequestE
0008e796  adds    r3, #8
0008e798  str     r3, [r2]
0008e79a  ldr     r3, [pc, #0x100]
0008e79c  add     r3, pc ; -> 0x0017dba8  ZTVN6Mayhem14GetUserRequestE
0008e79e  adds    r3, #0x28
0008e7a0  str     r3, [r2, #8]
0008e7a2  movs    r3, #1
0008e7a4  str     r3, [sp, #0x10]
0008e7a6  bl      #0x8b6a8 ; -> ZN6Mayhem12MayhemThread4waitEv
0008e7aa  ldr     r3, [sp, #4]
0008e7ac  ldr     r2, [r3, #0x58]
0008e7ae  ldr     r3, [pc, #0xf0]
0008e7b0  sub.w   r0, r2, #0xc
0008e7b4  add     r3, pc ; -> 0x000f3370  0x0
0008e7b6  ldr     r3, [r3]
0008e7b8  cmp     r0, r3
0008e7ba  bne     #0x8e7e6
0008e7bc  ldr     r0, [sp, #4]
0008e7be  mov.w   r3, #-1
0008e7c2  str     r3, [sp, #0x10]
0008e7c4  bl      #0x8c8d8 ; -> ZN6Mayhem11UserRequestD2Ev
0008e7c8  ldr     r0, [sp, #4]
0008e7ca  blx     #0xdd5a8 ; -> ZdlPv
0008e7ce  add     r0, sp, #0xc
0008e7d0  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008e7d4  sub.w   sp, r7, #0x58
0008e7d8  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008e7dc  sub.w   sp, r7, #0x18
0008e7e0  pop.w   {r8, sl, fp}
0008e7e4  pop     {r4, r5, r6, r7, pc}
0008e7e6  ldr     r3, [r2, #-0x4]
0008e7ea  subs    r1, r2, #4
0008e7ec  subs    r2, r3, #1
0008e7ee  dmb     ish
0008e7f2  mov     ip, r3
0008e7f4  ldrex   r4, [r1]
0008e7f8  cmp     r4, r3
0008e7fa  beq     #0x8e810
0008e7fc  cmp     r4, ip
0008e7fe  mov     r3, r4
0008e800  bne     #0x8e7ec
0008e802  cmp     r4, #0
0008e804  bgt     #0x8e7bc
0008e806  add.w   r1, sp, #0x42
0008e80a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e80e  b       #0x8e7bc
0008e810  strex   lr, r2, [r1]
0008e814  cmp.w   lr, #0
0008e818  bne     #0x8e7f4
0008e81a  dmb     ish
0008e81e  b       #0x8e7fc
0008e820  ldr     r3, [sp, #0x14]
0008e822  ldr     r4, [sp, #4]
0008e824  str     r3, [sp, #8]
0008e826  ldr     r3, [pc, #0x7c]
0008e828  ldr     r1, [r4, #0x58]
0008e82a  add     r3, pc ; -> 0x000f3370  0x0
0008e82c  sub.w   r0, r1, #0xc
0008e830  ldr     r3, [r3]
0008e832  cmp     r0, r3
0008e834  bne     #0x8e850
0008e836  ldr     r2, [sp, #8]
0008e838  ldr     r0, [sp, #4]
0008e83a  movs    r3, #0
0008e83c  str     r3, [sp, #0x10]
0008e83e  str     r2, [sp]
0008e840  bl      #0x8c8d8 ; -> ZN6Mayhem11UserRequestD2Ev
0008e844  ldr     r0, [sp]
0008e846  mov.w   r3, #-1
0008e84a  str     r3, [sp, #0x10]
0008e84c  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008e850  ldr     r3, [r1, #-0x4]
0008e854  subs    r2, r1, #4
0008e856  subs    r1, r3, #1
0008e858  dmb     ish
0008e85c  mov     ip, r3
0008e85e  ldrex   lr, [r2]
0008e862  cmp     lr, r3
0008e864  beq     #0x8e87c
0008e866  cmp     lr, ip
0008e868  mov     r3, lr
0008e86a  bne     #0x8e856
0008e86c  cmp.w   lr, #0
0008e870  bgt     #0x8e836
0008e872  add.w   r1, sp, #0x43
0008e876  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e87a  b       #0x8e836
0008e87c  strex   r4, r1, [r2]
0008e880  cmp     r4, #0
0008e882  bne     #0x8e85e
0008e884  dmb     ish
0008e888  b       #0x8e866
0008e88a  nop     
0008e88c  ldr     r4, [pc, #0x320]
0008e88e  movs    r6, r0
0008e890  smull   r0, r0, r4, r5
0008e894  lsls    r4, r3, #2
0008e896  movs    r0, r0
0008e898  ands    r0, r0, #0x8e0000
0008e89c  and     r0, r8, #0x8e0000
0008e8a0  ldr     r3, [pc, #0x2e0]
0008e8a2  movs    r6, r0
0008e8a4  ldr     r3, [pc, #0x108]
0008e8a6  movs    r6, r0
0008e8a8  nop     
0008e8aa  nop     
