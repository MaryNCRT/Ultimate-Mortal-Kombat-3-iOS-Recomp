========================================================================
ZN6Mayhem7RequestC2EPNS_5TokenE  0x0008cb8c  468 bytes   Mayhem.mm
========================================================================

0008cb8c  push    {r4, r5, r6, r7, lr}
0008cb8e  add     r7, sp, #0xc
0008cb90  push.w  {r8, sl, fp}
0008cb94  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008cb98  sub     sp, #0x58
0008cb9a  ldr     r3, [pc, #0x1a4]
0008cb9c  str     r0, [sp, #8]
0008cb9e  add     r0, sp, #0x20
0008cba0  add     r3, pc ; -> 0x000f3438  0x0
0008cba2  str     r1, [sp, #4]
0008cba4  ldr     r3, [r3]
0008cba6  str     r7, [sp, #0x40]
0008cba8  str.w   sp, [sp, #0x48]
0008cbac  str     r3, [sp, #0x38]
0008cbae  ldr     r3, [pc, #0x194]
0008cbb0  add     r3, pc ; -> 0x000ee28c  GCC_except_table27
0008cbb2  str     r3, [sp, #0x3c]
0008cbb4  ldr     r3, [pc, #0x190]
0008cbb6  add     r3, pc ; -> 0x0008cc60  
0008cbb8  orr     r3, r3, #1
0008cbbc  str     r3, [sp, #0x44]
0008cbbe  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008cbc2  ldr     r0, [sp, #8]
0008cbc4  mov.w   r2, #-1
0008cbc8  str     r2, [sp, #0x24]
0008cbca  bl      #0x8b740 ; -> ZN6Mayhem12MayhemThreadC2Ev
0008cbce  ldr     r4, [sp, #8]
0008cbd0  ldr     r3, [pc, #0x178]
0008cbd2  add     r3, pc ; -> 0x0017dc54  ZTVN6Mayhem7RequestE
0008cbd4  adds    r3, #8
0008cbd6  str     r3, [r4]
0008cbd8  ldr     r2, [sp, #4]
0008cbda  str     r2, [r4, #0xc]
0008cbdc  cbz     r2, #0x8cbea
0008cbde  ldr     r3, [r2]
0008cbe0  ldr     r0, [sp, #4]
0008cbe2  ldr     r2, [r3, #0xc]
0008cbe4  movs    r3, #2
0008cbe6  str     r3, [sp, #0x24]
0008cbe8  blx     r2
0008cbea  ldr     r3, [sp, #8]
0008cbec  movs    r1, #0
0008cbee  mov.w   r4, #-1
0008cbf2  str     r1, [r3, #0x10]
0008cbf4  str     r4, [r3, #0x14]
0008cbf6  ldr     r3, [pc, #0x158]
0008cbf8  ldr     r2, [sp, #8]
0008cbfa  add     r3, pc ; -> 0x000f3370  0x0
0008cbfc  add.w   r0, r2, #0x20
0008cc00  ldr     r3, [r3]
0008cc02  str     r3, [sp, #0x18]
0008cc04  adds    r3, #0xc
0008cc06  str     r1, [r2, #0x20]
0008cc08  str     r3, [r2, #0x18]
0008cc0a  str     r3, [r2, #0x1c]
0008cc0c  str     r1, [r2, #0x24]
0008cc0e  str     r1, [r2, #0x28]
0008cc10  str     r1, [r2, #0x2c]
0008cc12  str     r1, [r2, #0x30]
0008cc14  str     r1, [r2, #0x34]
0008cc16  str     r1, [r2, #0x38]
0008cc18  str     r1, [r2, #0x3c]
0008cc1a  str     r1, [r2, #0x40]
0008cc1c  str     r1, [r2, #0x44]
0008cc1e  str     r1, [r2, #0x48]
0008cc20  str     r1, [r2, #0x4c]
0008cc22  movs    r3, #1
0008cc24  str     r3, [sp, #0x24]
0008cc26  blx     #0xddc80 ; -> pthread_mutex_init
0008cc2a  ldr     r0, [pc, #0x128]
0008cc2c  ldr     r1, [pc, #0x128]
0008cc2e  add     r0, pc ; -> 0x000fdc24  
0008cc30  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0008cc32  ldr     r0, [r0]
0008cc34  ldr     r1, [r1]
0008cc36  blx     #0xddbfc ; -> objc_msgSend
0008cc3a  ldr     r1, [pc, #0x120]
0008cc3c  add     r1, pc ; -> 0x000fc980  '$(\x0e'
0008cc3e  ldr     r1, [r1]
0008cc40  blx     #0xddbfc ; -> objc_msgSend
0008cc44  ldr     r3, [sp, #8]
0008cc46  str     r0, [r3, #0x10]
0008cc48  add     r0, sp, #0x20
0008cc4a  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008cc4e  sub.w   sp, r7, #0x58
0008cc52  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008cc56  sub.w   sp, r7, #0x18
0008cc5a  pop.w   {r8, sl, fp}
0008cc5e  pop     {r4, r5, r6, r7, pc}
0008cc60  ldr     r3, [sp, #0x28]
0008cc62  str     r3, [sp]
0008cc64  ldr     r3, [sp, #0x24]
0008cc66  cmp     r3, #1
0008cc68  beq     #0x8ccb6
0008cc6a  ldr     r4, [sp]
0008cc6c  ldr     r2, [sp, #8]
0008cc6e  str     r4, [sp, #0xc]
0008cc70  ldr     r3, [r2, #0x1c]
0008cc72  ldr     r4, [sp, #0x18]
0008cc74  sub.w   r0, r3, #0xc
0008cc78  cmp     r4, r0
0008cc7a  bne     #0x8cccc
0008cc7c  ldr     r2, [sp, #0xc]
0008cc7e  ldr     r4, [sp, #8]
0008cc80  str     r2, [sp, #0x10]
0008cc82  ldr     r3, [r4, #0x18]
0008cc84  ldr     r2, [sp, #0x18]
0008cc86  sub.w   r0, r3, #0xc
0008cc8a  cmp     r2, r0
0008cc8c  bne     #0x8ccf8
0008cc8e  ldr     r2, [sp, #0x10]
0008cc90  ldr     r3, [sp, #8]
0008cc92  str     r2, [sp, #0x14]
0008cc94  ldr     r3, [r3, #0xc]
0008cc96  str     r3, [sp, #0x1c]
0008cc98  cbz     r3, #0x8ccb2
0008cc9a  ldr     r3, [r3]
0008cc9c  ldr     r0, [sp, #0x1c]
0008cc9e  ldr     r2, [r3, #8]
0008cca0  movs    r3, #0
0008cca2  str     r3, [sp, #0x24]
0008cca4  blx     r2
0008cca6  cbz     r0, #0x8ccb2
0008cca8  ldr     r4, [sp, #0x1c]
0008ccaa  ldr     r3, [r4]
0008ccac  mov     r0, r4
0008ccae  ldr     r3, [r3, #4]
0008ccb0  blx     r3
0008ccb2  ldr     r2, [sp, #0x14]
0008ccb4  str     r2, [sp]
0008ccb6  ldr     r0, [sp, #8]
0008ccb8  movs    r3, #0
0008ccba  str     r3, [sp, #0x24]
0008ccbc  bl      #0x8b71c ; -> ZN6Mayhem12MayhemThreadD2Ev
0008ccc0  ldr     r0, [sp]
0008ccc2  mov.w   r3, #-1
0008ccc6  str     r3, [sp, #0x24]
0008ccc8  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008cccc  subs    r2, r3, #4
0008ccce  ldr     r3, [r3, #-0x4]
0008ccd2  subs    r1, r3, #1
0008ccd4  dmb     ish
0008ccd8  mov     ip, r3
0008ccda  ldrex   lr, [r2]
0008ccde  cmp     lr, r3
0008cce0  beq     #0x8cd22
0008cce2  cmp     lr, ip
0008cce4  mov     r3, lr
0008cce6  bne     #0x8ccd2
0008cce8  cmp.w   lr, #0
0008ccec  bgt     #0x8cc7c
0008ccee  add.w   r1, sp, #0x57
0008ccf2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008ccf6  b       #0x8cc7c
0008ccf8  subs    r2, r3, #4
0008ccfa  ldr     r3, [r3, #-0x4]
0008ccfe  subs    r1, r3, #1
0008cd00  dmb     ish
0008cd04  mov     ip, r3
0008cd06  ldrex   r4, [r2]
0008cd0a  cmp     r4, r3
0008cd0c  beq     #0x8cd30
0008cd0e  cmp     r4, ip
0008cd10  mov     r3, r4
0008cd12  bne     #0x8ccfe
0008cd14  cmp     r4, #0
0008cd16  bgt     #0x8cc8e
0008cd18  add.w   r1, sp, #0x56
0008cd1c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008cd20  b       #0x8cc8e
0008cd22  strex   r4, r1, [r2]
0008cd26  cmp     r4, #0
0008cd28  bne     #0x8ccda
0008cd2a  dmb     ish
0008cd2e  b       #0x8cce2
0008cd30  strex   lr, r1, [r2]
0008cd34  cmp.w   lr, #0
0008cd38  bne     #0x8cd06
0008cd3a  dmb     ish
0008cd3e  b       #0x8cd0e
0008cd40  ldr     r4, [r2, #8]
0008cd42  movs    r6, r0
0008cd44  asrs    r0, r3, #0x1b
0008cd46  movs    r6, r0
0008cd48  lsls    r6, r4, #2
0008cd4a  movs    r0, r0
0008cd4c  asrs    r6, r7, #1
0008cd4e  movs    r7, r1
0008cd50  str     r2, [r6, #0x74]
0008cd52  movs    r6, r0
0008cd54  lsrs    r2, r6, #0x1f
0008cd56  movs    r7, r0
0008cd58  ldc2l   p0, c0, [r0, #-0x18]
0008cd5c  stc2l   p0, c0, [r0, #-0x18]
