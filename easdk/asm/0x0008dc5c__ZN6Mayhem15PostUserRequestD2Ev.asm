========================================================================
ZN6Mayhem15PostUserRequestD2Ev  0x0008dc5c  628 bytes   Mayhem.mm
========================================================================

0008dc5c  push    {r4, r5, r6, r7, lr}
0008dc5e  add     r7, sp, #0xc
0008dc60  push.w  {r8, sl, fp}
0008dc64  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008dc68  sub     sp, #0x58
0008dc6a  ldr     r3, [pc, #0x248]
0008dc6c  str     r0, [sp, #4]
0008dc6e  add     r0, sp, #0x1c
0008dc70  add     r3, pc ; -> 0x000f3438  0x0
0008dc72  str     r7, [sp, #0x3c]
0008dc74  ldr     r3, [r3]
0008dc76  str.w   sp, [sp, #0x44]
0008dc7a  str     r3, [sp, #0x34]
0008dc7c  ldr     r3, [pc, #0x238]
0008dc7e  add     r3, pc ; -> 0x000ee2da  GCC_except_table41
0008dc80  str     r3, [sp, #0x38]
0008dc82  ldr     r3, [pc, #0x238]
0008dc84  add     r3, pc ; -> 0x0008ddae  
0008dc86  orr     r3, r3, #1
0008dc8a  str     r3, [sp, #0x40]
0008dc8c  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008dc90  ldr     r2, [sp, #4]
0008dc92  ldr     r3, [pc, #0x22c]
0008dc94  add.w   r0, r2, #8
0008dc98  add     r3, pc ; -> 0x0017db30  ZTVN6Mayhem15PostUserRequestE
0008dc9a  adds    r3, #8
0008dc9c  str     r3, [r2]
0008dc9e  ldr     r3, [pc, #0x224]
0008dca0  add     r3, pc ; -> 0x0017db30  ZTVN6Mayhem15PostUserRequestE
0008dca2  adds    r3, #0x28
0008dca4  str     r3, [r2, #8]
0008dca6  movs    r3, #1
0008dca8  str     r3, [sp, #0x20]
0008dcaa  bl      #0x8b6a8 ; -> ZN6Mayhem12MayhemThread4waitEv
0008dcae  ldr     r3, [sp, #4]
0008dcb0  ldr     r2, [r3, #0x68]
0008dcb2  ldr     r3, [pc, #0x214]
0008dcb4  sub.w   r0, r2, #0xc
0008dcb8  add     r3, pc ; -> 0x000f3370  0x0
0008dcba  ldr     r3, [r3]
0008dcbc  cmp     r0, r3
0008dcbe  str     r3, [sp, #0x18]
0008dcc0  bne     #0x8dd02
0008dcc2  ldr     r2, [sp, #4]
0008dcc4  ldr     r4, [sp, #0x18]
0008dcc6  ldr     r3, [r2, #0x5c]
0008dcc8  sub.w   r0, r3, #0xc
0008dccc  cmp     r4, r0
0008dcce  bne     #0x8dd56
0008dcd0  ldr     r2, [sp, #4]
0008dcd2  ldr     r4, [sp, #0x18]
0008dcd4  ldr     r3, [r2, #0x58]
0008dcd6  sub.w   r0, r3, #0xc
0008dcda  cmp     r4, r0
0008dcdc  bne     #0x8dd2c
0008dcde  ldr     r0, [sp, #4]
0008dce0  mov.w   r3, #-1
0008dce4  str     r3, [sp, #0x20]
0008dce6  bl      #0x8c8d8 ; -> ZN6Mayhem11UserRequestD2Ev
0008dcea  add     r0, sp, #0x1c
0008dcec  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008dcf0  sub.w   sp, r7, #0x58
0008dcf4  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008dcf8  sub.w   sp, r7, #0x18
0008dcfc  pop.w   {r8, sl, fp}
0008dd00  pop     {r4, r5, r6, r7, pc}
0008dd02  ldr     r3, [r2, #-0x4]
0008dd06  subs    r1, r2, #4
0008dd08  subs    r2, r3, #1
0008dd0a  dmb     ish
0008dd0e  mov     ip, r3
0008dd10  ldrex   r4, [r1]
0008dd14  cmp     r4, r3
0008dd16  beq     #0x8dd9e
0008dd18  cmp     r4, ip
0008dd1a  mov     r3, r4
0008dd1c  bne     #0x8dd08
0008dd1e  cmp     r4, #0
0008dd20  bgt     #0x8dcc2
0008dd22  add.w   r1, sp, #0x56
0008dd26  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008dd2a  b       #0x8dcc2
0008dd2c  subs    r2, r3, #4
0008dd2e  ldr     r3, [r3, #-0x4]
0008dd32  subs    r1, r3, #1
0008dd34  dmb     ish
0008dd38  mov     ip, r3
0008dd3a  ldrex   r4, [r2]
0008dd3e  cmp     r4, r3
0008dd40  beq     #0x8dd8e
0008dd42  cmp     r4, ip
0008dd44  mov     r3, r4
0008dd46  bne     #0x8dd32
0008dd48  cmp     r4, #0
0008dd4a  bgt     #0x8dcde
0008dd4c  add.w   r1, sp, #0x52
0008dd50  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008dd54  b       #0x8dcde
0008dd56  subs    r2, r3, #4
0008dd58  ldr     r3, [r3, #-0x4]
0008dd5c  subs    r1, r3, #1
0008dd5e  dmb     ish
0008dd62  mov     ip, r3
0008dd64  ldrex   r4, [r2]
0008dd68  cmp     r4, r3
0008dd6a  beq     #0x8dd7e
0008dd6c  cmp     r4, ip
0008dd6e  mov     r3, r4
0008dd70  bne     #0x8dd5c
0008dd72  cmp     r4, #0
0008dd74  bgt     #0x8dcd0
0008dd76  add     r1, sp, #0x54
0008dd78  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008dd7c  b       #0x8dcd0
0008dd7e  strex   lr, r1, [r2]
0008dd82  cmp.w   lr, #0
0008dd86  bne     #0x8dd64
0008dd88  dmb     ish
0008dd8c  b       #0x8dd6c
0008dd8e  strex   lr, r1, [r2]
0008dd92  cmp.w   lr, #0
0008dd96  bne     #0x8dd3a
0008dd98  dmb     ish
0008dd9c  b       #0x8dd42
0008dd9e  strex   lr, r2, [r1]
0008dda2  cmp.w   lr, #0
0008dda6  bne     #0x8dd10
0008dda8  dmb     ish
0008ddac  b       #0x8dd18
0008ddae  ldr     r3, [sp, #0x24]
0008ddb0  ldr     r4, [sp, #4]
0008ddb2  str     r3, [sp, #8]
0008ddb4  ldr     r3, [pc, #0x114]
0008ddb6  ldr     r1, [r4, #0x68]
0008ddb8  add     r3, pc ; -> 0x000f3370  0x0
0008ddba  sub.w   r0, r1, #0xc
0008ddbe  ldr     r3, [r3]
0008ddc0  cmp     r0, r3
0008ddc2  str     r3, [sp, #0x14]
0008ddc4  bne     #0x8de04
0008ddc6  ldr     r2, [sp, #8]
0008ddc8  ldr     r4, [sp, #4]
0008ddca  str     r2, [sp, #0xc]
0008ddcc  ldr     r3, [r4, #0x5c]
0008ddce  ldr     r2, [sp, #0x14]
0008ddd0  sub.w   r0, r3, #0xc
0008ddd4  cmp     r2, r0
0008ddd6  bne     #0x8de5a
0008ddd8  ldr     r2, [sp, #0xc]
0008ddda  ldr     r4, [sp, #4]
0008dddc  str     r2, [sp, #0x10]
0008ddde  ldr     r3, [r4, #0x58]
0008dde0  ldr     r2, [sp, #0x14]
0008dde2  sub.w   r0, r3, #0xc
0008dde6  cmp     r2, r0
0008dde8  bne     #0x8de30
0008ddea  ldr     r2, [sp, #0x10]
0008ddec  ldr     r0, [sp, #4]
0008ddee  movs    r3, #0
0008ddf0  str     r3, [sp, #0x20]
0008ddf2  str     r2, [sp]
0008ddf4  bl      #0x8c8d8 ; -> ZN6Mayhem11UserRequestD2Ev
0008ddf8  ldr     r0, [sp]
0008ddfa  mov.w   r3, #-1
0008ddfe  str     r3, [sp, #0x20]
0008de00  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008de04  ldr     r3, [r1, #-0x4]
0008de08  subs    r2, r1, #4
0008de0a  subs    r1, r3, #1
0008de0c  dmb     ish
0008de10  mov     ip, r3
0008de12  ldrex   lr, [r2]
0008de16  cmp     lr, r3
0008de18  beq     #0x8de94
0008de1a  cmp     lr, ip
0008de1c  mov     r3, lr
0008de1e  bne     #0x8de0a
0008de20  cmp.w   lr, #0
0008de24  bgt     #0x8ddc6
0008de26  add.w   r1, sp, #0x57
0008de2a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008de2e  b       #0x8ddc6
0008de30  subs    r2, r3, #4
0008de32  ldr     r3, [r3, #-0x4]
0008de36  subs    r1, r3, #1
0008de38  dmb     ish
0008de3c  mov     ip, r3
0008de3e  ldrex   r4, [r2]
0008de42  cmp     r4, r3
0008de44  beq     #0x8de84
0008de46  cmp     r4, ip
0008de48  mov     r3, r4
0008de4a  bne     #0x8de36
0008de4c  cmp     r4, #0
0008de4e  bgt     #0x8ddea
0008de50  add.w   r1, sp, #0x53
0008de54  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008de58  b       #0x8ddea
0008de5a  subs    r2, r3, #4
0008de5c  ldr     r3, [r3, #-0x4]
0008de60  subs    r1, r3, #1
0008de62  dmb     ish
0008de66  mov     ip, r3
0008de68  ldrex   r4, [r2]
0008de6c  cmp     r4, r3
0008de6e  beq     #0x8dea2
0008de70  cmp     r4, ip
0008de72  mov     r3, r4
0008de74  bne     #0x8de60
0008de76  cmp     r4, #0
0008de78  bgt     #0x8ddd8
0008de7a  add.w   r1, sp, #0x55
0008de7e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008de82  b       #0x8ddd8
0008de84  strex   lr, r1, [r2]
0008de88  cmp.w   lr, #0
0008de8c  bne     #0x8de3e
0008de8e  dmb     ish
0008de92  b       #0x8de46
0008de94  strex   r4, r1, [r2]
0008de98  cmp     r4, #0
0008de9a  bne     #0x8de12
0008de9c  dmb     ish
0008dea0  b       #0x8de1a
0008dea2  strex   lr, r1, [r2]
0008dea6  cmp.w   lr, #0
0008deaa  bne     #0x8de68
0008deac  dmb     ish
0008deb0  b       #0x8de70
0008deb2  nop     
0008deb4  ldrsb   r4, [r0, r7]
0008deb6  movs    r6, r0
0008deb8  lsls    r0, r3, #0x19
0008deba  movs    r6, r0
0008debc  lsls    r6, r4, #4
0008debe  movs    r0, r0
0008dec0  cdp2    p0, #9, c0, c4, c14, #0
0008dec4  cdp2    p0, #8, c0, c12, c14, #0
0008dec8  ldrsb   r4, [r6, r2]
0008deca  movs    r6, r0
0008decc  strb    r4, [r6, r6]
0008dece  movs    r6, r0
