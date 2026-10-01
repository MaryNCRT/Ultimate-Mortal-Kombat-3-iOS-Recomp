========================================================================
ZN6Mayhem7RequestD0Ev  0x0008ec00  572 bytes   Mayhem.mm
========================================================================

0008ec00  push    {r4, r5, r6, r7, lr}
0008ec02  add     r7, sp, #0xc
0008ec04  push.w  {r8, sl, fp}
0008ec08  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008ec0c  sub     sp, #0x5c
0008ec0e  ldr     r3, [pc, #0x20c]
0008ec10  str     r0, [sp, #4]
0008ec12  add     r0, sp, #0x24
0008ec14  add     r3, pc ; -> 0x000f3438  0x0
0008ec16  str     r7, [sp, #0x44]
0008ec18  ldr     r3, [r3]
0008ec1a  str.w   sp, [sp, #0x4c]
0008ec1e  str     r3, [sp, #0x3c]
0008ec20  ldr     r3, [pc, #0x1fc]
0008ec22  add     r3, pc ; -> 0x000ee30e  GCC_except_table53
0008ec24  str     r3, [sp, #0x40]
0008ec26  ldr     r3, [pc, #0x1fc]
0008ec28  add     r3, pc ; -> 0x0008ed38  
0008ec2a  orr     r3, r3, #1
0008ec2e  str     r3, [sp, #0x48]
0008ec30  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008ec34  ldr     r2, [sp, #4]
0008ec36  ldr     r3, [pc, #0x1f0]
0008ec38  add.w   r0, r2, #0x20
0008ec3c  add     r3, pc ; -> 0x0017dc54  ZTVN6Mayhem7RequestE
0008ec3e  adds    r3, #8
0008ec40  str     r3, [r2]
0008ec42  movs    r3, #1
0008ec44  str     r3, [sp, #0x28]
0008ec46  blx     #0xddc74 ; -> pthread_mutex_destroy
0008ec4a  ldr     r1, [pc, #0x1e0]
0008ec4c  ldr     r3, [sp, #4]
0008ec4e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
0008ec50  ldr     r0, [r3, #0x10]
0008ec52  ldr     r1, [r1]
0008ec54  blx     #0xddbfc ; -> objc_msgSend
0008ec58  ldr     r3, [sp, #4]
0008ec5a  ldr     r2, [r3, #0x1c]
0008ec5c  ldr     r3, [pc, #0x1d0]
0008ec5e  sub.w   r0, r2, #0xc
0008ec62  add     r3, pc ; -> 0x000f3370  0x0
0008ec64  ldr     r3, [r3]
0008ec66  cmp     r0, r3
0008ec68  str     r3, [sp, #0x18]
0008ec6a  bne     #0x8ecee
0008ec6c  ldr     r2, [sp, #4]
0008ec6e  ldr     r4, [sp, #0x18]
0008ec70  ldr     r3, [r2, #0x18]
0008ec72  sub.w   r0, r3, #0xc
0008ec76  cmp     r4, r0
0008ec78  bne     #0x8ecc6
0008ec7a  ldr     r2, [sp, #4]
0008ec7c  ldr     r2, [r2, #0xc]
0008ec7e  str     r2, [sp, #0x20]
0008ec80  cbz     r2, #0x8ec92
0008ec82  ldr     r4, [sp, #0x20]
0008ec84  ldr     r3, [r4]
0008ec86  mov     r0, r4
0008ec88  ldr     r2, [r3, #8]
0008ec8a  movs    r3, #2
0008ec8c  str     r3, [sp, #0x28]
0008ec8e  blx     r2
0008ec90  cbnz    r0, #0x8ecbc
0008ec92  ldr     r0, [sp, #4]
0008ec94  mov.w   r3, #-1
0008ec98  str     r3, [sp, #0x28]
0008ec9a  bl      #0x8b71c ; -> ZN6Mayhem12MayhemThreadD2Ev
0008ec9e  ldr     r0, [sp, #4]
0008eca0  blx     #0xdd5a8 ; -> ZdlPv
0008eca4  add     r0, sp, #0x24
0008eca6  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008ecaa  sub.w   sp, r7, #0x58
0008ecae  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008ecb2  sub.w   sp, r7, #0x18
0008ecb6  pop.w   {r8, sl, fp}
0008ecba  pop     {r4, r5, r6, r7, pc}
0008ecbc  ldr     r3, [r4]
0008ecbe  ldr     r0, [sp, #0x20]
0008ecc0  ldr     r3, [r3, #4]
0008ecc2  blx     r3
0008ecc4  b       #0x8ec92
0008ecc6  subs    r2, r3, #4
0008ecc8  ldr     r3, [r3, #-0x4]
0008eccc  subs    r1, r3, #1
0008ecce  dmb     ish
0008ecd2  mov     ip, r3
0008ecd4  ldrex   r4, [r2]
0008ecd8  cmp     r4, r3
0008ecda  beq     #0x8ed28
0008ecdc  cmp     r4, ip
0008ecde  mov     r3, r4
0008ece0  bne     #0x8eccc
0008ece2  cmp     r4, #0
0008ece4  bgt     #0x8ec7a
0008ece6  add     r1, sp, #0x58
0008ece8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008ecec  b       #0x8ec7a
0008ecee  ldr     r3, [r2, #-0x4]
0008ecf2  subs    r1, r2, #4
0008ecf4  subs    r2, r3, #1
0008ecf6  dmb     ish
0008ecfa  mov     ip, r3
0008ecfc  ldrex   r4, [r1]
0008ed00  cmp     r4, r3
0008ed02  beq     #0x8ed18
0008ed04  cmp     r4, ip
0008ed06  mov     r3, r4
0008ed08  bne     #0x8ecf4
0008ed0a  cmp     r4, #0
0008ed0c  bgt     #0x8ec6c
0008ed0e  add.w   r1, sp, #0x5a
0008ed12  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008ed16  b       #0x8ec6c
0008ed18  strex   lr, r2, [r1]
0008ed1c  cmp.w   lr, #0
0008ed20  bne     #0x8ecfc
0008ed22  dmb     ish
0008ed26  b       #0x8ed04
0008ed28  strex   lr, r1, [r2]
0008ed2c  cmp.w   lr, #0
0008ed30  bne     #0x8ecd4
0008ed32  dmb     ish
0008ed36  b       #0x8ecdc
0008ed38  ldr     r3, [sp, #0x28]
0008ed3a  ldr     r4, [sp, #0x2c]
0008ed3c  cmp     r3, #1
0008ed3e  str     r4, [sp]
0008ed40  beq     #0x8ed90
0008ed42  ldr     r2, [sp, #4]
0008ed44  ldr     r3, [pc, #0xec]
0008ed46  str     r4, [sp, #8]
0008ed48  add     r3, pc ; -> 0x000f3370  0x0
0008ed4a  ldr     r1, [r2, #0x1c]
0008ed4c  ldr     r3, [r3]
0008ed4e  sub.w   r0, r1, #0xc
0008ed52  cmp     r0, r3
0008ed54  str     r3, [sp, #0x14]
0008ed56  bne     #0x8eda6
0008ed58  ldr     r2, [sp, #8]
0008ed5a  ldr     r4, [sp, #4]
0008ed5c  str     r2, [sp, #0xc]
0008ed5e  ldr     r3, [r4, #0x18]
0008ed60  ldr     r2, [sp, #0x14]
0008ed62  sub.w   r0, r3, #0xc
0008ed66  cmp     r2, r0
0008ed68  bne     #0x8edd0
0008ed6a  ldr     r3, [sp, #0xc]
0008ed6c  ldr     r4, [sp, #4]
0008ed6e  str     r3, [sp, #0x10]
0008ed70  ldr     r4, [r4, #0xc]
0008ed72  str     r4, [sp, #0x1c]
0008ed74  cbz     r4, #0x8ed8c
0008ed76  ldr     r3, [r4]
0008ed78  mov     r0, r4
0008ed7a  ldr     r2, [r3, #8]
0008ed7c  movs    r3, #0
0008ed7e  str     r3, [sp, #0x28]
0008ed80  blx     r2
0008ed82  cbz     r0, #0x8ed8c
0008ed84  ldr     r3, [r4]
0008ed86  ldr     r0, [sp, #0x1c]
0008ed88  ldr     r3, [r3, #4]
0008ed8a  blx     r3
0008ed8c  ldr     r2, [sp, #0x10]
0008ed8e  str     r2, [sp]
0008ed90  ldr     r0, [sp, #4]
0008ed92  movs    r3, #0
0008ed94  str     r3, [sp, #0x28]
0008ed96  bl      #0x8b71c ; -> ZN6Mayhem12MayhemThreadD2Ev
0008ed9a  ldr     r0, [sp]
0008ed9c  mov.w   r3, #-1
0008eda0  str     r3, [sp, #0x28]
0008eda2  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008eda6  ldr     r3, [r1, #-0x4]
0008edaa  subs    r2, r1, #4
0008edac  subs    r1, r3, #1
0008edae  dmb     ish
0008edb2  mov     ip, r3
0008edb4  ldrex   r4, [r2]
0008edb8  cmp     r4, r3
0008edba  beq     #0x8edfa
0008edbc  cmp     r4, ip
0008edbe  mov     r3, r4
0008edc0  bne     #0x8edac
0008edc2  cmp     r4, #0
0008edc4  bgt     #0x8ed58
0008edc6  add.w   r1, sp, #0x5b
0008edca  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008edce  b       #0x8ed58
0008edd0  subs    r2, r3, #4
0008edd2  ldr     r3, [r3, #-0x4]
0008edd6  subs    r1, r3, #1
0008edd8  dmb     ish
0008eddc  mov     ip, r3
0008edde  ldrex   r4, [r2]
0008ede2  cmp     r4, r3
0008ede4  beq     #0x8ee0a
0008ede6  cmp     r4, ip
0008ede8  mov     r3, r4
0008edea  bne     #0x8edd6
0008edec  cmp     r4, #0
0008edee  bgt     #0x8ed6a
0008edf0  add.w   r1, sp, #0x59
0008edf4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008edf8  b       #0x8ed6a
0008edfa  strex   lr, r1, [r2]
0008edfe  cmp.w   lr, #0
0008ee02  bne     #0x8edb4
0008ee04  dmb     ish
0008ee08  b       #0x8edbc
0008ee0a  strex   lr, r1, [r2]
0008ee0e  cmp.w   lr, #0
0008ee12  bne     #0x8edde
0008ee14  dmb     ish
0008ee18  b       #0x8ede6
0008ee1a  nop     
0008ee1c  ldr     r0, [pc, #0x80]
0008ee1e  movs    r6, r0
