========================================================================
ZN13LocaleManager9setLocaleEPN4midp6StringE  0x0009e8c0  300 bytes   LocaleManager.mm
========================================================================

0009e8c0  push    {r4, r5, r6, r7, lr}
0009e8c2  add     r7, sp, #0xc
0009e8c4  push.w  {r8, sl, fp}
0009e8c8  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009e8cc  sub     sp, #0x48
0009e8ce  ldr     r3, [pc, #0x104]
0009e8d0  str     r0, [sp, #4]
0009e8d2  add     r0, sp, #0x14
0009e8d4  add     r3, pc ; -> 0x000f301c  0x0
0009e8d6  str     r1, [sp]
0009e8d8  ldr     r3, [r3]
0009e8da  str     r7, [sp, #0x34]
0009e8dc  str.w   sp, [sp, #0x3c]
0009e8e0  str     r3, [sp, #0x2c]
0009e8e2  ldr     r3, [pc, #0xf4]
0009e8e4  add     r3, pc ; -> 0x000ee660  GCC_except_table15
0009e8e6  str     r3, [sp, #0x30]
0009e8e8  ldr     r3, [pc, #0xf0]
0009e8ea  add     r3, pc ; -> 0x0009e9a4  
0009e8ec  orr     r3, r3, #1
0009e8f0  str     r3, [sp, #0x38]
0009e8f2  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009e8f6  ldr     r2, [sp]
0009e8f8  str     r2, [sp, #0x10]
0009e8fa  cbz     r2, #0x9e90a
0009e8fc  ldr     r3, [r2]
0009e8fe  ldr     r0, [sp, #0x10]
0009e900  ldr     r2, [r3, #0xc]
0009e902  mov.w   r3, #-1
0009e906  str     r3, [sp, #0x18]
0009e908  blx     r2
0009e90a  movs    r3, #1
0009e90c  ldr     r0, [sp, #4]
0009e90e  str     r3, [sp, #0x18]
0009e910  ldr     r1, [sp, #0x10]
0009e912  bl      #0x9e794 ; -> ZNK13LocaleManager14getLocaleIndexEPN4midp6StringE
0009e916  cmp.w   r0, #-1
0009e91a  beq     #0x9e98c
0009e91c  ldr     r2, [sp, #4]
0009e91e  str     r0, [r2, #0x20]
0009e920  ldr     r3, [sp, #0x10]
0009e922  cbz     r3, #0x9e92c
0009e924  ldr     r3, [r3]
0009e926  ldr     r0, [sp, #0x10]
0009e928  ldr     r3, [r3, #0xc]
0009e92a  blx     r3
0009e92c  ldr     r2, [sp, #4]
0009e92e  ldr     r2, [r2, #0x1c]
0009e930  str     r2, [sp, #8]
0009e932  cbz     r2, #0x9e942
0009e934  ldr     r3, [r2]
0009e936  movs    r2, #1
0009e938  ldr     r0, [sp, #8]
0009e93a  ldr     r3, [r3, #8]
0009e93c  str     r2, [sp, #0x18]
0009e93e  blx     r3
0009e940  cbnz    r0, #0x9e980
0009e942  ldr     r2, [sp]
0009e944  ldr     r3, [sp, #4]
0009e946  str     r2, [r3, #0x1c]
0009e948  cbz     r2, #0x9e95c
0009e94a  ldr     r2, [sp, #0x10]
0009e94c  ldr     r0, [sp, #0x10]
0009e94e  ldr     r3, [r2]
0009e950  ldr     r2, [r3, #8]
0009e952  mov.w   r3, #-1
0009e956  str     r3, [sp, #0x18]
0009e958  blx     r2
0009e95a  cbnz    r0, #0x9e974
0009e95c  add     r0, sp, #0x14
0009e95e  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009e962  sub.w   sp, r7, #0x58
0009e966  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009e96a  sub.w   sp, r7, #0x18
0009e96e  pop.w   {r8, sl, fp}
0009e972  pop     {r4, r5, r6, r7, pc}
0009e974  ldr     r2, [sp, #0x10]
0009e976  ldr     r3, [r2]
0009e978  mov     r0, r2
0009e97a  ldr     r3, [r3, #4]
0009e97c  blx     r3
0009e97e  b       #0x9e95c
0009e980  ldr     r2, [sp, #8]
0009e982  ldr     r3, [r2]
0009e984  mov     r0, r2
0009e986  ldr     r3, [r3, #4]
0009e988  blx     r3
0009e98a  b       #0x9e942
0009e98c  ldr     r0, [pc, #0x50]
0009e98e  ldr.w   r1, [pc, #0x54]
0009e992  ldr     r3, [pc, #0x54]
0009e994  movs    r2, #1
0009e996  add     r0, pc ; -> 0x000e5c88  ZZN13LocaleManager9setLocaleEPN4midp6StringEE8__func__
0009e998  str     r2, [sp, #0x18]
0009e99a  add     r1, pc ; -> 0x001765ac  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/text/LocaleManager.mm'
0009e99c  add     r3, pc ; -> 0x00176614  'false'
0009e99e  adds    r2, #0xab
0009e9a0  blx     #0xdd5cc ; -> assert_rtn
0009e9a4  ldr     r3, [sp, #0x1c]
0009e9a6  ldr     r2, [sp]
0009e9a8  str     r3, [sp, #0xc]
0009e9aa  cbz     r2, #0x9e9c6
0009e9ac  ldr     r2, [sp, #0x10]
0009e9ae  ldr     r0, [sp, #0x10]
0009e9b0  ldr     r3, [r2]
0009e9b2  ldr     r2, [r3, #8]
0009e9b4  movs    r3, #0
0009e9b6  str     r3, [sp, #0x18]
0009e9b8  blx     r2
0009e9ba  cbz     r0, #0x9e9c6
0009e9bc  ldr     r2, [sp, #0x10]
0009e9be  ldr     r3, [r2]
0009e9c0  mov     r0, r2
0009e9c2  ldr     r3, [r3, #4]
0009e9c4  blx     r3
0009e9c6  ldr     r0, [sp, #0xc]
0009e9c8  mov.w   r3, #-1
0009e9cc  str     r3, [sp, #0x18]
0009e9ce  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009e9d2  nop     
0009e9d4  bxns    r8
0009e9d6  movs    r5, r0
0009e9d8  ldc2l   p0, c0, [r8, #-0x10]!
0009e9dc  lsls    r6, r6, #2
0009e9de  movs    r0, r0
0009e9e0  strb    r6, [r5, #0xb]
0009e9e2  movs    r4, r0
0009e9e4  ldrb    r6, [r1, #0x10]
0009e9e6  movs    r5, r1
0009e9e8  ldrb    r4, [r6, #0x11]
0009e9ea  movs    r5, r1
