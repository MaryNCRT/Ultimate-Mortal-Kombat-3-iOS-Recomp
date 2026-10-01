========================================================================
ZN6Mayhem7RequestC2Ev  0x0008cda4  448 bytes   Mayhem.mm
========================================================================

0008cda4  push    {r4, r5, r6, r7, lr}
0008cda6  add     r7, sp, #0xc
0008cda8  push.w  {r8, sl, fp}
0008cdac  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008cdb0  sub     sp, #0x54
0008cdb2  ldr     r3, [pc, #0x190]
0008cdb4  str     r0, [sp, #4]
0008cdb6  add     r0, sp, #0x1c
0008cdb8  add     r3, pc ; -> 0x000f3438  0x0
0008cdba  str     r7, [sp, #0x3c]
0008cdbc  ldr     r3, [r3]
0008cdbe  str.w   sp, [sp, #0x44]
0008cdc2  str     r3, [sp, #0x34]
0008cdc4  ldr     r3, [pc, #0x180]
0008cdc6  add     r3, pc ; -> 0x000ee296  GCC_except_table29
0008cdc8  str     r3, [sp, #0x38]
0008cdca  ldr     r3, [pc, #0x180]
0008cdcc  add     r3, pc ; -> 0x0008ce62  
0008cdce  orr     r3, r3, #1
0008cdd2  str     r3, [sp, #0x40]
0008cdd4  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008cdd8  ldr     r0, [sp, #4]
0008cdda  mov.w   r2, #-1
0008cdde  str     r2, [sp, #0x20]
0008cde0  bl      #0x8b740 ; -> ZN6Mayhem12MayhemThreadC2Ev
0008cde4  ldr     r4, [sp, #4]
0008cde6  ldr     r3, [pc, #0x168]
0008cde8  movs    r1, #0
0008cdea  mov.w   r2, #-1
0008cdee  add     r3, pc ; -> 0x0017dc54  ZTVN6Mayhem7RequestE
0008cdf0  adds    r3, #8
0008cdf2  str     r3, [r4]
0008cdf4  ldr     r3, [pc, #0x15c]
0008cdf6  str     r1, [r4, #0xc]
0008cdf8  str     r1, [r4, #0x10]
0008cdfa  add     r3, pc ; -> 0x000f3370  0x0
0008cdfc  str     r2, [r4, #0x14]
0008cdfe  ldr     r3, [r3]
0008ce00  add.w   r0, r4, #0x20
0008ce04  str     r3, [sp, #0x14]
0008ce06  adds    r3, #0xc
0008ce08  str     r1, [r4, #0x20]
0008ce0a  str     r3, [r4, #0x18]
0008ce0c  str     r3, [r4, #0x1c]
0008ce0e  str     r1, [r4, #0x24]
0008ce10  str     r1, [r4, #0x28]
0008ce12  str     r1, [r4, #0x2c]
0008ce14  str     r1, [r4, #0x30]
0008ce16  str     r1, [r4, #0x34]
0008ce18  str     r1, [r4, #0x38]
0008ce1a  str     r1, [r4, #0x3c]
0008ce1c  str     r1, [r4, #0x40]
0008ce1e  str     r1, [r4, #0x44]
0008ce20  str     r1, [r4, #0x48]
0008ce22  str     r1, [r4, #0x4c]
0008ce24  movs    r3, #1
0008ce26  str     r3, [sp, #0x20]
0008ce28  blx     #0xddc80 ; -> pthread_mutex_init
0008ce2c  ldr     r0, [pc, #0x128]
0008ce2e  ldr     r1, [pc, #0x12c]
0008ce30  add     r0, pc ; -> 0x000fdc24  
0008ce32  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0008ce34  ldr     r0, [r0]
0008ce36  ldr     r1, [r1]
0008ce38  blx     #0xddbfc ; -> objc_msgSend
0008ce3c  ldr     r1, [pc, #0x120]
0008ce3e  add     r1, pc ; -> 0x000fc980  '$(\x0e'
0008ce40  ldr     r1, [r1]
0008ce42  blx     #0xddbfc ; -> objc_msgSend
0008ce46  ldr     r3, [sp, #4]
0008ce48  str     r0, [r3, #0x10]
0008ce4a  add     r0, sp, #0x1c
0008ce4c  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008ce50  sub.w   sp, r7, #0x58
0008ce54  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008ce58  sub.w   sp, r7, #0x18
0008ce5c  pop.w   {r8, sl, fp}
0008ce60  pop     {r4, r5, r6, r7, pc}
0008ce62  ldr     r3, [sp, #0x24]
0008ce64  str     r3, [sp]
0008ce66  ldr     r3, [sp, #0x20]
0008ce68  cmp     r3, #1
0008ce6a  beq     #0x8ceb8
0008ce6c  ldr     r4, [sp]
0008ce6e  ldr     r2, [sp, #4]
0008ce70  str     r4, [sp, #8]
0008ce72  ldr     r3, [r2, #0x1c]
0008ce74  ldr     r4, [sp, #0x14]
0008ce76  sub.w   r0, r3, #0xc
0008ce7a  cmp     r4, r0
0008ce7c  bne     #0x8cece
0008ce7e  ldr     r2, [sp, #8]
0008ce80  ldr     r4, [sp, #4]
0008ce82  str     r2, [sp, #0xc]
0008ce84  ldr     r3, [r4, #0x18]
0008ce86  ldr     r2, [sp, #0x14]
0008ce88  sub.w   r0, r3, #0xc
0008ce8c  cmp     r2, r0
0008ce8e  bne     #0x8cefa
0008ce90  ldr     r2, [sp, #0xc]
0008ce92  ldr     r3, [sp, #4]
0008ce94  str     r2, [sp, #0x10]
0008ce96  ldr     r3, [r3, #0xc]
0008ce98  str     r3, [sp, #0x18]
0008ce9a  cbz     r3, #0x8ceb4
0008ce9c  ldr     r3, [r3]
0008ce9e  ldr     r0, [sp, #0x18]
0008cea0  ldr     r2, [r3, #8]
0008cea2  movs    r3, #0
0008cea4  str     r3, [sp, #0x20]
0008cea6  blx     r2
0008cea8  cbz     r0, #0x8ceb4
0008ceaa  ldr     r4, [sp, #0x18]
0008ceac  ldr     r3, [r4]
0008ceae  mov     r0, r4
0008ceb0  ldr     r3, [r3, #4]
0008ceb2  blx     r3
0008ceb4  ldr     r2, [sp, #0x10]
0008ceb6  str     r2, [sp]
0008ceb8  ldr     r0, [sp, #4]
0008ceba  movs    r3, #0
0008cebc  str     r3, [sp, #0x20]
0008cebe  bl      #0x8b71c ; -> ZN6Mayhem12MayhemThreadD2Ev
0008cec2  ldr     r0, [sp]
0008cec4  mov.w   r3, #-1
0008cec8  str     r3, [sp, #0x20]
0008ceca  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008cece  subs    r2, r3, #4
0008ced0  ldr     r3, [r3, #-0x4]
0008ced4  subs    r1, r3, #1
0008ced6  dmb     ish
0008ceda  mov     ip, r3
0008cedc  ldrex   lr, [r2]
0008cee0  cmp     lr, r3
0008cee2  beq     #0x8cf24
0008cee4  cmp     lr, ip
0008cee6  mov     r3, lr
0008cee8  bne     #0x8ced4
0008ceea  cmp.w   lr, #0
0008ceee  bgt     #0x8ce7e
0008cef0  add.w   r1, sp, #0x53
0008cef4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008cef8  b       #0x8ce7e
0008cefa  subs    r2, r3, #4
0008cefc  ldr     r3, [r3, #-0x4]
0008cf00  subs    r1, r3, #1
0008cf02  dmb     ish
0008cf06  mov     ip, r3
0008cf08  ldrex   r4, [r2]
0008cf0c  cmp     r4, r3
0008cf0e  beq     #0x8cf32
0008cf10  cmp     r4, ip
0008cf12  mov     r3, r4
0008cf14  bne     #0x8cf00
0008cf16  cmp     r4, #0
0008cf18  bgt     #0x8ce90
0008cf1a  add.w   r1, sp, #0x52
0008cf1e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008cf22  b       #0x8ce90
0008cf24  strex   r4, r1, [r2]
0008cf28  cmp     r4, #0
0008cf2a  bne     #0x8cedc
0008cf2c  dmb     ish
0008cf30  b       #0x8cee4
0008cf32  strex   lr, r1, [r2]
0008cf36  cmp.w   lr, #0
0008cf3a  bne     #0x8cf08
0008cf3c  dmb     ish
0008cf40  b       #0x8cf10
0008cf42  nop     
0008cf44  str     r4, [r7, #0x64]
0008cf46  movs    r6, r0
0008cf48  asrs    r4, r1, #0x13
0008cf4a  movs    r6, r0
0008cf4c  lsls    r2, r2, #2
0008cf4e  movs    r0, r0
0008cf50  lsrs    r2, r4, #0x19
0008cf52  movs    r7, r1
0008cf54  str     r2, [r6, #0x54]
0008cf56  movs    r6, r0
0008cf58  lsrs    r0, r6, #0x17
0008cf5a  movs    r7, r0
0008cf5c  smlsd   r0, lr, r6, r0
0008cf60  smlawb  r0, lr, r6, r0
