========================================================================
EASOC_MayhemPostStatWithData  0x0007fd90  592 bytes   EASDK_Handler.mm
========================================================================

0007fd90  push    {r4, r5, r6, r7, lr}
0007fd92  add     r7, sp, #0xc
0007fd94  push.w  {r8, sl, fp}
0007fd98  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0007fd9c  sub     sp, #0xf8
0007fd9e  str     r3, [sp, #0x10]
0007fda0  ldr     r3, [pc, #0x218]
0007fda2  str     r0, [sp, #0x1c]
0007fda4  add     r0, sp, #0x54
0007fda6  add     r3, pc ; -> 0x000f301c  0x0
0007fda8  str     r1, [sp, #0x18]
0007fdaa  ldr     r3, [r3]
0007fdac  str     r2, [sp, #0x14]
0007fdae  str     r7, [sp, #0x74]
0007fdb0  str.w   sp, [sp, #0x7c]
0007fdb4  str     r3, [sp, #0x6c]
0007fdb6  ldr     r3, [pc, #0x208]
0007fdb8  add     r3, pc ; -> 0x000ee0c0  GCC_except_table2
0007fdba  str     r3, [sp, #0x70]
0007fdbc  ldr     r3, [pc, #0x204]
0007fdbe  add     r3, pc ; -> 0x0007ff16  
0007fdc0  orr     r3, r3, #1
0007fdc4  str     r3, [sp, #0x78]
0007fdc6  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0007fdca  ldr     r2, [pc, #0x1fc]
0007fdcc  mov.w   r3, #-1
0007fdd0  movs    r1, #0x64
0007fdd2  add     r2, pc ; -> 0x001757e4  '%s'
0007fdd4  str     r3, [sp, #0x58]
0007fdd6  add     r0, sp, #0x88
0007fdd8  ldr     r3, [sp, #0x1c]
0007fdda  blx     #0xddcf8 ; -> snprintf
0007fdde  ldr     r3, [pc, #0x1ec]
0007fde0  add     r0, sp, #0xf0
0007fde2  add     r1, sp, #0x88
0007fde4  add     r3, pc ; -> 0x00379b4c  m_mayhemToken
0007fde6  add.w   r2, sp, #0xf7
0007fdea  ldr     r3, [r3]
0007fdec  str     r3, [sp, #0x20]
0007fdee  movs    r3, #4
0007fdf0  str     r3, [sp, #0x58]
0007fdf2  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0007fdf6  movs    r3, #3
0007fdf8  movs    r0, #0x68
0007fdfa  str     r3, [sp, #0x58]
0007fdfc  blx     #0xdd5c0 ; -> Znwm
0007fe00  ldr     r3, [sp, #0x18]
0007fe02  ldr     r4, [sp, #0x10]
0007fe04  ldr     r2, [pc, #0x1c8]
0007fe06  str     r0, [sp, #0x30]
0007fe08  str     r3, [sp]
0007fe0a  ldr     r3, [sp, #0x14]
0007fe0c  str     r0, [sp, #0x24]
0007fe0e  add     r2, pc ; -> 0x00379b40  m_mayhemID
0007fe10  str     r4, [sp, #4]
0007fe12  str     r3, [sp, #8]
0007fe14  ldr     r1, [sp, #0x20]
0007fe16  movs    r3, #2
0007fe18  str     r3, [sp, #0x58]
0007fe1a  add     r3, sp, #0xf0
0007fe1c  bl      #0x8dc34 ; -> ZN6Mayhem15PostStatRequestC1EPNS_5TokenERKSsS4_iiPKv
0007fe20  ldr     r2, [sp, #0x30]
0007fe22  ldr     r3, [sp, #0x24]
0007fe24  add     r4, sp, #0xec
0007fe26  str     r4, [sp, #0x34]
0007fe28  str     r2, [sp, #0xec]
0007fe2a  cbz     r3, #0x7fe3c
0007fe2c  adds.w  r0, r2, #8
0007fe30  beq     #0x7fe3c
0007fe32  ldr     r3, [r2, #8]
0007fe34  ldr     r2, [r3, #0xc]
0007fe36  movs    r3, #3
0007fe38  str     r3, [sp, #0x58]
0007fe3a  blx     r2
0007fe3c  ldr     r4, [sp, #0xec]
0007fe3e  str     r4, [sp, #0x3c]
0007fe40  cbz     r4, #0x7fe50
0007fe42  ldr     r3, [r4, #8]
0007fe44  add.w   r0, r4, #8
0007fe48  ldr     r2, [r3, #0xc]
0007fe4a  movs    r3, #1
0007fe4c  str     r3, [sp, #0x58]
0007fe4e  blx     r2
0007fe50  ldr.w   r3, [pc, #0x180]
0007fe54  ldr     r2, [sp, #0x3c]
0007fe56  add     r3, pc ; -> 0x00379b48  m_pendingStat
0007fe58  ldr.w   lr, [r3]
0007fe5c  str     r2, [r3]
0007fe5e  str.w   lr, [sp, #0x38]
0007fe62  mov     r3, lr
0007fe64  cbz     r3, #0x7fe7e
0007fe66  add.w   r4, lr, #8
0007fe6a  str     r4, [sp, #0x40]
0007fe6c  ldr.w   r3, [lr, #8]
0007fe70  mov     r0, r4
0007fe72  ldr     r2, [r3, #8]
0007fe74  movs    r3, #1
0007fe76  str     r3, [sp, #0x58]
0007fe78  blx     r2
0007fe7a  cmp     r0, #0
0007fe7c  bne     #0x7fed0
0007fe7e  ldr     r2, [sp, #0x34]
0007fe80  ldr     r2, [r2]
0007fe82  str     r2, [sp, #0x4c]
0007fe84  cbz     r2, #0x7fe9c
0007fe86  ldr     r4, [sp, #0x4c]
0007fe88  ldr     r3, [sp, #0x4c]
0007fe8a  adds    r3, #8
0007fe8c  str     r3, [sp, #0x50]
0007fe8e  ldr     r3, [r4, #8]
0007fe90  ldr     r0, [sp, #0x50]
0007fe92  ldr     r2, [r3, #8]
0007fe94  movs    r3, #3
0007fe96  str     r3, [sp, #0x58]
0007fe98  blx     r2
0007fe9a  cbnz    r0, #0x7fec6
0007fe9c  ldr.w   r3, [pc, #0x138]
0007fea0  ldr     r2, [sp, #0xf0]
0007fea2  add     r3, pc ; -> 0x000f3370  0x0
0007fea4  sub.w   r0, r2, #0xc
0007fea8  ldr     r3, [r3]
0007feaa  cmp     r0, r3
0007feac  bne     #0x7fedc
0007feae  add     r0, sp, #0x54
0007feb0  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0007feb4  sub.w   sp, r7, #0x58
0007feb8  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0007febc  sub.w   sp, r7, #0x18
0007fec0  pop.w   {r8, sl, fp}
0007fec4  pop     {r4, r5, r6, r7, pc}
0007fec6  ldr     r3, [r4, #8]
0007fec8  ldr     r0, [sp, #0x50]
0007feca  ldr     r3, [r3, #4]
0007fecc  blx     r3
0007fece  b       #0x7fe9c
0007fed0  ldr     r4, [sp, #0x38]
0007fed2  ldr     r0, [sp, #0x40]
0007fed4  ldr     r3, [r4, #8]
0007fed6  ldr     r3, [r3, #4]
0007fed8  blx     r3
0007feda  b       #0x7fe7e
0007fedc  ldr     r3, [r2, #-0x4]
0007fee0  subs    r1, r2, #4
0007fee2  subs    r2, r3, #1
0007fee4  dmb     ish
0007fee8  mov     ip, r3
0007feea  ldrex   r4, [r1]
0007feee  cmp     r4, r3
0007fef0  beq     #0x7ff06
0007fef2  cmp     r4, ip
0007fef4  mov     r3, r4
0007fef6  bne     #0x7fee2
0007fef8  cmp     r4, #0
0007fefa  bgt     #0x7feae
0007fefc  add.w   r1, sp, #0xf5
0007ff00  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0007ff04  b       #0x7feae
0007ff06  strex   lr, r2, [r1]
0007ff0a  cmp.w   lr, #0
0007ff0e  bne     #0x7feea
0007ff10  dmb     ish
0007ff14  b       #0x7fef2
0007ff16  ldr     r3, [sp, #0x58]
0007ff18  ldr     r4, [sp, #0x5c]
0007ff1a  cmp     r3, #1
0007ff1c  str     r4, [sp, #0xc]
0007ff1e  beq     #0x7ff78
0007ff20  cmp     r3, #2
0007ff22  beq     #0x7ff54
0007ff24  cmp     r3, #3
0007ff26  beq     #0x7ff6c
0007ff28  ldr     r2, [sp, #0x34]
0007ff2a  str     r4, [sp, #0x28]
0007ff2c  ldr     r2, [r2]
0007ff2e  str     r2, [sp, #0x44]
0007ff30  cbz     r2, #0x7ff50
0007ff32  add.w   r3, r2, #8
0007ff36  str     r3, [sp, #0x48]
0007ff38  ldr     r3, [r2, #8]
0007ff3a  ldr     r0, [sp, #0x48]
0007ff3c  ldr     r2, [r3, #8]
0007ff3e  movs    r3, #0
0007ff40  str     r3, [sp, #0x58]
0007ff42  blx     r2
0007ff44  cbz     r0, #0x7ff50
0007ff46  ldr     r4, [sp, #0x44]
0007ff48  ldr     r0, [sp, #0x48]
0007ff4a  ldr     r3, [r4, #8]
0007ff4c  ldr     r3, [r3, #4]
0007ff4e  blx     r3
0007ff50  ldr     r2, [sp, #0x28]
0007ff52  str     r2, [sp, #0xc]
0007ff54  ldr     r3, [pc, #0x84]
0007ff56  ldr     r1, [sp, #0xf0]
0007ff58  ldr     r2, [sp, #0xc]
0007ff5a  add     r3, pc ; -> 0x000f3370  0x0
0007ff5c  sub.w   r0, r1, #0xc
0007ff60  ldr     r3, [r3]
0007ff62  str     r2, [sp, #0x2c]
0007ff64  cmp     r0, r3
0007ff66  bne     #0x7ff80
0007ff68  ldr     r2, [sp, #0x2c]
0007ff6a  str     r2, [sp, #0xc]
0007ff6c  ldr     r0, [sp, #0xc]
0007ff6e  mov.w   r3, #-1
0007ff72  str     r3, [sp, #0x58]
0007ff74  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0007ff78  ldr     r0, [sp, #0x30]
0007ff7a  blx     #0xdd5a8 ; -> ZdlPv
0007ff7e  b       #0x7ff54
0007ff80  ldr     r3, [r1, #-0x4]
0007ff84  subs    r2, r1, #4
0007ff86  subs    r1, r3, #1
0007ff88  dmb     ish
0007ff8c  mov     ip, r3
0007ff8e  ldrex   r4, [r2]
0007ff92  cmp     r4, r3
0007ff94  beq     #0x7ffaa
0007ff96  cmp     r4, ip
0007ff98  mov     r3, r4
0007ff9a  bne     #0x7ff86
0007ff9c  cmp     r4, #0
0007ff9e  bgt     #0x7ff68
0007ffa0  add.w   r1, sp, #0xf6
0007ffa4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0007ffa8  b       #0x7ff68
0007ffaa  strex   lr, r1, [r2]
0007ffae  cmp.w   lr, #0
0007ffb2  bne     #0x7ff8e
0007ffb4  dmb     ish
0007ffb8  b       #0x7ff96
0007ffba  nop     
0007ffbc  adds    r2, #0x72
0007ffbe  movs    r7, r0
0007ffc0  b       #0x805cc
0007ffc2  movs    r6, r0
0007ffc4  lsls    r4, r2, #5
0007ffc6  movs    r0, r0
0007ffc8  ldrh    r6, [r1, r0]
0007ffca  movs    r7, r1
0007ffcc  ldr     r5, [sp, #0x190]
0007ffce  movs    r7, r5
0007ffd0  ldr     r5, [sp, #0xb8]
0007ffd2  movs    r7, r5
0007ffd4  ldr     r4, [sp, #0x3b8]
0007ffd6  movs    r7, r5
0007ffd8  adds    r4, #0xca
0007ffda  movs    r7, r0
0007ffdc  adds    r4, #0x12
0007ffde  movs    r7, r0
