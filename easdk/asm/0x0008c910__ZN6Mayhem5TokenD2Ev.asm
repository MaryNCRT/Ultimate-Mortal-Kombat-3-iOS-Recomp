========================================================================
ZN6Mayhem5TokenD2Ev  0x0008c910  612 bytes   Mayhem.mm
========================================================================

0008c910  push    {r4, r5, r6, r7, lr}
0008c912  add     r7, sp, #0xc
0008c914  push.w  {r8, sl, fp}
0008c918  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008c91c  sub     sp, #0x58
0008c91e  ldr     r3, [pc, #0x23c]
0008c920  str     r0, [sp, #4]
0008c922  add     r0, sp, #0x1c
0008c924  add     r3, pc ; -> 0x000f3438  0x0
0008c926  str     r7, [sp, #0x3c]
0008c928  ldr     r3, [r3]
0008c92a  str.w   sp, [sp, #0x44]
0008c92e  str     r3, [sp, #0x34]
0008c930  ldr     r3, [pc, #0x22c]
0008c932  add     r3, pc ; -> 0x000ee286  GCC_except_table26
0008c934  str     r3, [sp, #0x38]
0008c936  ldr     r3, [pc, #0x22c]
0008c938  add     r3, pc ; -> 0x0008ca58  
0008c93a  orr     r3, r3, #1
0008c93e  str     r3, [sp, #0x40]
0008c940  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008c944  ldr     r3, [pc, #0x220]
0008c946  ldr     r2, [sp, #4]
0008c948  add     r3, pc ; -> 0x0017dc38  ZTVN6Mayhem5TokenE
0008c94a  adds    r3, #8
0008c94c  str     r3, [r2]
0008c94e  ldr     r0, [sp, #4]
0008c950  movs    r3, #1
0008c952  str     r3, [sp, #0x20]
0008c954  bl      #0x8b6a8 ; -> ZN6Mayhem12MayhemThread4waitEv
0008c958  ldr     r3, [sp, #4]
0008c95a  ldr     r2, [r3, #0x58]
0008c95c  ldr     r3, [pc, #0x20c]
0008c95e  sub.w   r0, r2, #0xc
0008c962  add     r3, pc ; -> 0x000f3370  0x0
0008c964  ldr     r3, [r3]
0008c966  cmp     r0, r3
0008c968  str     r3, [sp, #0x18]
0008c96a  bne     #0x8c9ac
0008c96c  ldr     r2, [sp, #4]
0008c96e  ldr     r4, [sp, #0x18]
0008c970  ldr     r3, [r2, #0x54]
0008c972  sub.w   r0, r3, #0xc
0008c976  cmp     r4, r0
0008c978  bne     #0x8ca00
0008c97a  ldr     r2, [sp, #4]
0008c97c  ldr     r4, [sp, #0x18]
0008c97e  ldr     r3, [r2, #0x50]
0008c980  sub.w   r0, r3, #0xc
0008c984  cmp     r4, r0
0008c986  bne     #0x8c9d6
0008c988  ldr     r0, [sp, #4]
0008c98a  mov.w   r3, #-1
0008c98e  str     r3, [sp, #0x20]
0008c990  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0008c994  add     r0, sp, #0x1c
0008c996  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008c99a  sub.w   sp, r7, #0x58
0008c99e  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008c9a2  sub.w   sp, r7, #0x18
0008c9a6  pop.w   {r8, sl, fp}
0008c9aa  pop     {r4, r5, r6, r7, pc}
0008c9ac  ldr     r3, [r2, #-0x4]
0008c9b0  subs    r1, r2, #4
0008c9b2  subs    r2, r3, #1
0008c9b4  dmb     ish
0008c9b8  mov     ip, r3
0008c9ba  ldrex   r4, [r1]
0008c9be  cmp     r4, r3
0008c9c0  beq     #0x8ca48
0008c9c2  cmp     r4, ip
0008c9c4  mov     r3, r4
0008c9c6  bne     #0x8c9b2
0008c9c8  cmp     r4, #0
0008c9ca  bgt     #0x8c96c
0008c9cc  add.w   r1, sp, #0x56
0008c9d0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008c9d4  b       #0x8c96c
0008c9d6  subs    r2, r3, #4
0008c9d8  ldr     r3, [r3, #-0x4]
0008c9dc  subs    r1, r3, #1
0008c9de  dmb     ish
0008c9e2  mov     ip, r3
0008c9e4  ldrex   r4, [r2]
0008c9e8  cmp     r4, r3
0008c9ea  beq     #0x8ca38
0008c9ec  cmp     r4, ip
0008c9ee  mov     r3, r4
0008c9f0  bne     #0x8c9dc
0008c9f2  cmp     r4, #0
0008c9f4  bgt     #0x8c988
0008c9f6  add.w   r1, sp, #0x52
0008c9fa  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008c9fe  b       #0x8c988
0008ca00  subs    r2, r3, #4
0008ca02  ldr     r3, [r3, #-0x4]
0008ca06  subs    r1, r3, #1
0008ca08  dmb     ish
0008ca0c  mov     ip, r3
0008ca0e  ldrex   r4, [r2]
0008ca12  cmp     r4, r3
0008ca14  beq     #0x8ca28
0008ca16  cmp     r4, ip
0008ca18  mov     r3, r4
0008ca1a  bne     #0x8ca06
0008ca1c  cmp     r4, #0
0008ca1e  bgt     #0x8c97a
0008ca20  add     r1, sp, #0x54
0008ca22  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008ca26  b       #0x8c97a
0008ca28  strex   lr, r1, [r2]
0008ca2c  cmp.w   lr, #0
0008ca30  bne     #0x8ca0e
0008ca32  dmb     ish
0008ca36  b       #0x8ca16
0008ca38  strex   lr, r1, [r2]
0008ca3c  cmp.w   lr, #0
0008ca40  bne     #0x8c9e4
0008ca42  dmb     ish
0008ca46  b       #0x8c9ec
0008ca48  strex   lr, r2, [r1]
0008ca4c  cmp.w   lr, #0
0008ca50  bne     #0x8c9ba
0008ca52  dmb     ish
0008ca56  b       #0x8c9c2
0008ca58  ldr     r3, [sp, #0x24]
0008ca5a  ldr     r4, [sp, #4]
0008ca5c  str     r3, [sp, #8]
0008ca5e  ldr     r3, [pc, #0x110]
0008ca60  ldr     r1, [r4, #0x58]
0008ca62  add     r3, pc ; -> 0x000f3370  0x0
0008ca64  sub.w   r0, r1, #0xc
0008ca68  ldr     r3, [r3]
0008ca6a  cmp     r0, r3
0008ca6c  str     r3, [sp, #0x14]
0008ca6e  bne     #0x8caae
0008ca70  ldr     r2, [sp, #8]
0008ca72  ldr     r4, [sp, #4]
0008ca74  str     r2, [sp, #0xc]
0008ca76  ldr     r3, [r4, #0x54]
0008ca78  ldr     r2, [sp, #0x14]
0008ca7a  sub.w   r0, r3, #0xc
0008ca7e  cmp     r2, r0
0008ca80  bne     #0x8cb04
0008ca82  ldr     r2, [sp, #0xc]
0008ca84  ldr     r4, [sp, #4]
0008ca86  str     r2, [sp, #0x10]
0008ca88  ldr     r3, [r4, #0x50]
0008ca8a  ldr     r2, [sp, #0x14]
0008ca8c  sub.w   r0, r3, #0xc
0008ca90  cmp     r2, r0
0008ca92  bne     #0x8cada
0008ca94  ldr     r2, [sp, #0x10]
0008ca96  ldr     r0, [sp, #4]
0008ca98  movs    r3, #0
0008ca9a  str     r3, [sp, #0x20]
0008ca9c  str     r2, [sp]
0008ca9e  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0008caa2  ldr     r0, [sp]
0008caa4  mov.w   r3, #-1
0008caa8  str     r3, [sp, #0x20]
0008caaa  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008caae  ldr     r3, [r1, #-0x4]
0008cab2  subs    r2, r1, #4
0008cab4  subs    r1, r3, #1
0008cab6  dmb     ish
0008caba  mov     ip, r3
0008cabc  ldrex   lr, [r2]
0008cac0  cmp     lr, r3
0008cac2  beq     #0x8cb3e
0008cac4  cmp     lr, ip
0008cac6  mov     r3, lr
0008cac8  bne     #0x8cab4
0008caca  cmp.w   lr, #0
0008cace  bgt     #0x8ca70
0008cad0  add.w   r1, sp, #0x57
0008cad4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008cad8  b       #0x8ca70
0008cada  subs    r2, r3, #4
0008cadc  ldr     r3, [r3, #-0x4]
0008cae0  subs    r1, r3, #1
0008cae2  dmb     ish
0008cae6  mov     ip, r3
0008cae8  ldrex   r4, [r2]
0008caec  cmp     r4, r3
0008caee  beq     #0x8cb2e
0008caf0  cmp     r4, ip
0008caf2  mov     r3, r4
0008caf4  bne     #0x8cae0
0008caf6  cmp     r4, #0
0008caf8  bgt     #0x8ca94
0008cafa  add.w   r1, sp, #0x53
0008cafe  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008cb02  b       #0x8ca94
0008cb04  subs    r2, r3, #4
0008cb06  ldr     r3, [r3, #-0x4]
0008cb0a  subs    r1, r3, #1
0008cb0c  dmb     ish
0008cb10  mov     ip, r3
0008cb12  ldrex   r4, [r2]
0008cb16  cmp     r4, r3
0008cb18  beq     #0x8cb4c
0008cb1a  cmp     r4, ip
0008cb1c  mov     r3, r4
0008cb1e  bne     #0x8cb0a
0008cb20  cmp     r4, #0
0008cb22  bgt     #0x8ca82
0008cb24  add.w   r1, sp, #0x55
0008cb28  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008cb2c  b       #0x8ca82
0008cb2e  strex   lr, r1, [r2]
0008cb32  cmp.w   lr, #0
0008cb36  bne     #0x8cae8
0008cb38  dmb     ish
0008cb3c  b       #0x8caf0
0008cb3e  strex   r4, r1, [r2]
0008cb42  cmp     r4, #0
0008cb44  bne     #0x8cabc
0008cb46  dmb     ish
0008cb4a  b       #0x8cac4
0008cb4c  strex   lr, r1, [r2]
0008cb50  cmp.w   lr, #0
0008cb54  bne     #0x8cb12
0008cb56  dmb     ish
0008cb5a  b       #0x8cb1a
0008cb5c  ldr     r0, [r2, #0x30]
0008cb5e  movs    r6, r0
0008cb60  adds    r0, r2, r5
0008cb62  movs    r6, r0
0008cb64  lsls    r4, r3, #4
0008cb66  movs    r0, r0
0008cb68  asrs    r4, r5, #0xb
0008cb6a  movs    r7, r1
0008cb6c  ldr     r2, [r1, #0x20]
0008cb6e  movs    r6, r0
0008cb70  ldr     r2, [r1, #0x10]
0008cb72  movs    r6, r0
