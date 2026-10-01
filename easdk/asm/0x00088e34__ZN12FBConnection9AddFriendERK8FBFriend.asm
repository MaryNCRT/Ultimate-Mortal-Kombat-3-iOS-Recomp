========================================================================
ZN12FBConnection9AddFriendERK8FBFriend  0x00088e34  276 bytes   FBConnection.mm
========================================================================

00088e34  push    {r4, r5, r6, r7, lr}
00088e36  add     r7, sp, #0xc
00088e38  push.w  {r8, sl, fp}
00088e3c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00088e40  sub     sp, #0x4c
00088e42  ldr     r3, [pc, #0xf4]
00088e44  str     r0, [sp, #4]
00088e46  add     r0, sp, #0x14
00088e48  add     r3, pc ; -> 0x000f301c  0x0
00088e4a  str     r1, [sp]
00088e4c  ldr     r3, [r3]
00088e4e  str     r7, [sp, #0x34]
00088e50  str.w   sp, [sp, #0x3c]
00088e54  str     r3, [sp, #0x2c]
00088e56  ldr     r3, [pc, #0xe4]
00088e58  add     r3, pc ; -> 0x000ee1a0  GCC_except_table2
00088e5a  str     r3, [sp, #0x30]
00088e5c  ldr     r3, [pc, #0xe0]
00088e5e  add     r3, pc ; -> 0x00088ed6  
00088e60  orr     r3, r3, #1
00088e64  str     r3, [sp, #0x38]
00088e66  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00088e6a  ldr     r2, [sp, #4]
00088e6c  ldr     r1, [sp, #4]
00088e6e  adds    r1, #0x1c
00088e70  str     r1, [sp, #8]
00088e72  ldr     r3, [r2, #0x20]
00088e74  ldr     r2, [r2, #0x24]
00088e76  cmp     r3, r2
00088e78  beq     #0x88ec2
00088e7a  str     r3, [sp, #0xc]
00088e7c  cbz     r3, #0x88ea2
00088e7e  ldr     r1, [sp]
00088e80  mov     r0, r3
00088e82  ldm     r1!, {r3, r4}
00088e84  stm     r0!, {r3, r4}
00088e86  movs    r3, #2
00088e88  str     r3, [sp, #0x18]
00088e8a  blx     #0xdd53c ; -> ZNSsC1ERKSs
00088e8e  ldr     r4, [sp, #0xc]
00088e90  ldr     r2, [sp]
00088e92  movs    r3, #1
00088e94  add.w   r0, r4, #0xc
00088e98  add.w   r1, r2, #0xc
00088e9c  str     r3, [sp, #0x18]
00088e9e  blx     #0xdd53c ; -> ZNSsC1ERKSs
00088ea2  ldr     r1, [sp, #8]
00088ea4  ldr     r3, [r1, #4]
00088ea6  adds    r3, #0x10
00088ea8  str     r3, [r1, #4]
00088eaa  add     r0, sp, #0x14
00088eac  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00088eb0  sub.w   sp, r7, #0x58
00088eb4  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00088eb8  sub.w   sp, r7, #0x18
00088ebc  pop.w   {r8, sl, fp}
00088ec0  pop     {r4, r5, r6, r7, pc}
00088ec2  ldr     r2, [sp, #4]
00088ec4  ldr     r0, [sp, #8]
00088ec6  mov.w   r3, #-1
00088eca  ldr     r1, [r2, #0x20]
00088ecc  ldr     r2, [sp]
00088ece  str     r3, [sp, #0x18]
00088ed0  bl      #0x8a24c ; -> ZNSt6vectorI8FBFriendSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_
00088ed4  b       #0x88eaa
00088ed6  ldr     r3, [sp, #0x18]
00088ed8  ldr     r0, [sp, #0x1c]
00088eda  cmp     r3, #1
00088edc  beq     #0x88ef4
00088ede  ldr     r3, [sp, #0xc]
00088ee0  str     r0, [sp, #0x10]
00088ee2  ldr     r1, [r3, #8]
00088ee4  ldr     r3, [pc, #0x5c]
00088ee6  sub.w   r0, r1, #0xc
00088eea  add     r3, pc ; -> 0x000f3370  0x0
00088eec  ldr     r3, [r3]
00088eee  cmp     r0, r3
00088ef0  bne     #0x88efe
00088ef2  ldr     r0, [sp, #0x10]
00088ef4  mov.w   r3, #-1
00088ef8  str     r3, [sp, #0x18]
00088efa  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00088efe  ldr     r3, [r1, #-0x4]
00088f02  subs    r2, r1, #4
00088f04  subs    r1, r3, #1
00088f06  dmb     ish
00088f0a  mov     ip, r3
00088f0c  ldrex   r4, [r2]
00088f10  cmp     r4, r3
00088f12  beq     #0x88f28
00088f14  cmp     r4, ip
00088f16  mov     r3, r4
00088f18  bne     #0x88f04
00088f1a  cmp     r4, #0
00088f1c  bgt     #0x88ef2
00088f1e  add.w   r1, sp, #0x4b
00088f22  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00088f26  b       #0x88ef2
00088f28  strex   lr, r1, [r2]
00088f2c  cmp.w   lr, #0
00088f30  bne     #0x88f0c
00088f32  dmb     ish
00088f36  b       #0x88f14
00088f38  adr     r1, #0x340
00088f3a  movs    r6, r0
00088f3c  strh    r4, [r0, r5]
00088f3e  movs    r6, r0
00088f40  lsls    r4, r6, #1
00088f42  movs    r0, r0
00088f44  adr     r4, #0x208
00088f46  movs    r6, r0
