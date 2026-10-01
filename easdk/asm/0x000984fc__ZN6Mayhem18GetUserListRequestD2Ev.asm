========================================================================
ZN6Mayhem18GetUserListRequestD2Ev  0x000984fc  488 bytes   Mayhem.mm
========================================================================

000984fc  push    {r4, r5, r6, r7, lr}
000984fe  add     r7, sp, #0xc
00098500  push.w  {r8, sl, fp}
00098504  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00098508  sub     sp, #0x68
0009850a  ldr     r3, [pc, #0x1b8]
0009850c  str     r0, [sp, #4]
0009850e  add     r0, sp, #0x30
00098510  add     r3, pc ; -> 0x000f3438  0x0
00098512  str     r7, [sp, #0x50]
00098514  ldr     r3, [r3]
00098516  str.w   sp, [sp, #0x58]
0009851a  str     r3, [sp, #0x48]
0009851c  ldr     r3, [pc, #0x1a8]
0009851e  add     r3, pc ; -> 0x000ee574  GCC_except_table103
00098520  str     r3, [sp, #0x4c]
00098522  ldr     r3, [pc, #0x1a8]
00098524  add     r3, pc ; -> 0x00098604  
00098526  orr     r3, r3, #1
0009852a  str     r3, [sp, #0x54]
0009852c  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00098530  ldr     r2, [sp, #4]
00098532  ldr     r3, [pc, #0x19c]
00098534  add.w   r0, r2, #0x10
00098538  add     r3, pc ; -> 0x0017daf0  ZTVN6Mayhem18GetUserListRequestE
0009853a  adds    r3, #8
0009853c  str     r3, [r2]
0009853e  ldr     r3, [pc, #0x194]
00098540  add     r3, pc ; -> 0x0017daf0  ZTVN6Mayhem18GetUserListRequestE
00098542  adds    r3, #0x1c
00098544  str     r3, [r2, #0x10]
00098546  movs    r3, #1
00098548  str     r3, [sp, #0x34]
0009854a  bl      #0x8b6a8 ; -> ZN6Mayhem12MayhemThread4waitEv
0009854e  ldr     r3, [sp, #4]
00098550  ldr     r2, [sp, #4]
00098552  adds    r2, #0x6c
00098554  str     r2, [sp, #0x18]
00098556  ldr     r2, [r3, #0x6c]
00098558  ldr     r4, [r3, #0x70]
0009855a  cmp     r2, r4
0009855c  str     r4, [sp, #0x1c]
0009855e  beq     #0x98584
00098560  ldr     r3, [pc, #0x174]
00098562  str     r2, [sp, #0x28]
00098564  add     r3, pc ; -> 0x000f3370  0x0
00098566  ldr     r3, [r3]
00098568  str     r3, [sp, #0x20]
0009856a  ldr     r2, [sp, #0x28]
0009856c  ldr     r4, [sp, #0x20]
0009856e  ldr     r3, [r2]
00098570  sub.w   r0, r3, #0xc
00098574  cmp     r0, r4
00098576  bne     #0x985ca
00098578  ldr     r2, [sp, #0x28]
0009857a  ldr     r3, [sp, #0x1c]
0009857c  adds    r2, #4
0009857e  cmp     r3, r2
00098580  str     r2, [sp, #0x28]
00098582  bne     #0x9856a
00098584  ldr     r4, [sp, #0x18]
00098586  ldr     r0, [r4]
00098588  cbz     r0, #0x9858e
0009858a  blx     #0xdd5a8 ; -> ZdlPv
0009858e  ldr     r2, [sp, #4]
00098590  ldr     r0, [r2, #0x60]
00098592  cbz     r0, #0x98598
00098594  blx     #0xdd5a8 ; -> ZdlPv
00098598  ldr     r2, [sp, #4]
0009859a  movs    r3, #2
0009859c  str     r3, [sp, #0x34]
0009859e  add.w   r0, r2, #0x10
000985a2  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
000985a6  ldr     r0, [sp, #4]
000985a8  mov.w   r3, #-1
000985ac  str     r3, [sp, #0x34]
000985ae  bl      #0x8b9a0 ; -> ZN6Mayhem8UserListD2Ev
000985b2  add     r0, sp, #0x30
000985b4  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
000985b8  sub.w   sp, r7, #0x58
000985bc  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
000985c0  sub.w   sp, r7, #0x18
000985c4  pop.w   {r8, sl, fp}
000985c8  pop     {r4, r5, r6, r7, pc}
000985ca  subs    r2, r3, #4
000985cc  ldr     r3, [r3, #-0x4]
000985d0  subs    r1, r3, #1
000985d2  dmb     ish
000985d6  mov     ip, r3
000985d8  ldrex   lr, [r2]
000985dc  cmp     lr, r3
000985de  beq     #0x985f6
000985e0  cmp     lr, ip
000985e2  mov     r3, lr
000985e4  bne     #0x985d0
000985e6  cmp.w   lr, #0
000985ea  bgt     #0x98578
000985ec  add.w   r1, sp, #0x66
000985f0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000985f4  b       #0x98578
000985f6  strex   r4, r1, [r2]
000985fa  cmp     r4, #0
000985fc  bne     #0x985d8
000985fe  dmb     ish
00098602  b       #0x985e0
00098604  ldr     r3, [sp, #0x38]
00098606  str     r3, [sp]
00098608  ldr     r3, [sp, #0x34]
0009860a  cmp     r3, #1
0009860c  beq     #0x98672
0009860e  ldr     r4, [sp]
00098610  ldr     r3, [sp, #4]
00098612  ldr     r2, [sp, #4]
00098614  str     r4, [sp, #8]
00098616  adds    r2, #0x6c
00098618  str     r2, [sp, #0x10]
0009861a  ldr     r2, [r3, #0x6c]
0009861c  ldr     r4, [r3, #0x70]
0009861e  cmp     r2, r4
00098620  str     r4, [sp, #0x14]
00098622  beq     #0x98648
00098624  ldr     r3, [pc, #0xb4]
00098626  str     r2, [sp, #0x24]
00098628  add     r3, pc ; -> 0x000f3370  0x0
0009862a  ldr     r3, [r3]
0009862c  str     r3, [sp, #0x2c]
0009862e  ldr     r2, [sp, #0x24]
00098630  ldr     r4, [sp, #0x2c]
00098632  ldr     r3, [r2]
00098634  sub.w   r0, r3, #0xc
00098638  cmp     r0, r4
0009863a  bne     #0x98688
0009863c  ldr     r2, [sp, #0x24]
0009863e  ldr     r3, [sp, #0x14]
00098640  adds    r2, #4
00098642  cmp     r3, r2
00098644  str     r2, [sp, #0x24]
00098646  bne     #0x9862e
00098648  ldr     r4, [sp, #0x10]
0009864a  ldr     r0, [r4]
0009864c  cbz     r0, #0x98652
0009864e  blx     #0xdd5a8 ; -> ZdlPv
00098652  ldr     r3, [sp, #8]
00098654  ldr     r4, [sp, #4]
00098656  str     r3, [sp, #0xc]
00098658  ldr     r0, [r4, #0x60]
0009865a  cbz     r0, #0x98660
0009865c  blx     #0xdd5a8 ; -> ZdlPv
00098660  ldr     r3, [sp, #0xc]
00098662  ldr     r4, [sp, #4]
00098664  add.w   r0, r4, #0x10
00098668  str     r3, [sp]
0009866a  movs    r3, #0
0009866c  str     r3, [sp, #0x34]
0009866e  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
00098672  ldr     r0, [sp, #4]
00098674  movs    r3, #0
00098676  str     r3, [sp, #0x34]
00098678  bl      #0x8b9a0 ; -> ZN6Mayhem8UserListD2Ev
0009867c  ldr     r0, [sp]
0009867e  mov.w   r3, #-1
00098682  str     r3, [sp, #0x34]
00098684  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00098688  subs    r2, r3, #4
0009868a  ldr     r3, [r3, #-0x4]
0009868e  subs    r1, r3, #1
00098690  dmb     ish
00098694  mov     ip, r3
00098696  ldrex   lr, [r2]
0009869a  cmp     lr, r3
0009869c  beq     #0x986b4
0009869e  cmp     lr, ip
000986a0  mov     r3, lr
000986a2  bne     #0x9868e
000986a4  cmp.w   lr, #0
000986a8  bgt     #0x9863c
000986aa  add.w   r1, sp, #0x67
000986ae  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000986b2  b       #0x9863c
000986b4  strex   r4, r1, [r2]
000986b8  cmp     r4, #0
000986ba  bne     #0x98696
000986bc  dmb     ish
000986c0  b       #0x9869e
000986c2  nop     
000986c4  add     r7, sp, #0x90
000986c6  movs    r5, r0
000986c8  str     r2, [r2, #4]
000986ca  movs    r5, r0
000986cc  lsls    r4, r3, #3
000986ce  movs    r0, r0
000986d0  strb    r4, [r6, r6]
000986d2  movs    r6, r1
000986d4  strb    r4, [r5, r6]
000986d6  movs    r6, r1
000986d8  add     r6, sp, #0x20
000986da  movs    r5, r0
000986dc  add     r5, sp, #0x110
000986de  movs    r5, r0
000986e0  nop     
000986e2  nop     
