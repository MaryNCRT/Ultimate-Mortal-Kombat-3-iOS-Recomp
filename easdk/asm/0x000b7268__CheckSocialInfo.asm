========================================================================
CheckSocialInfo  0x000b7268  484 bytes   EAMTX_Main.mm
========================================================================

000b7268  push    {r4, r5, r6, r7, lr}
000b726a  add     r7, sp, #0xc
000b726c  push.w  {r8, sl}
000b7270  ldr     r5, [pc, #0x164]
000b7272  add     r5, pc ; -> 0x0038c1b0  mSocialInfo
000b7274  ldr     r3, [r5]
000b7276  cmp     r3, #0
000b7278  bne.w   #0xb73d0
000b727c  ldr     r0, [pc, #0x15c]
000b727e  ldr.w   r1, [pc, #0x160]
000b7282  add     r0, pc ; -> 0x000fdc80  
000b7284  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b7286  ldr     r0, [r0]
000b7288  ldr     r1, [r1]
000b728a  blx     #0xddbfc ; -> objc_msgSend
000b728e  ldr     r1, [pc, #0x154]
000b7290  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b7292  ldr     r1, [r1]
000b7294  blx     #0xddbfc ; -> objc_msgSend
000b7298  ldr     r1, [pc, #0x14c]
000b729a  ldr     r2, [pc, #0x150]
000b729c  add     r1, pc ; -> 0x000fd5b4  
000b729e  add     r2, pc ; -> 0x0017f264  
000b72a0  ldr     r1, [r1]
000b72a2  str     r0, [r5]
000b72a4  blx     #0xddbfc ; -> objc_msgSend
000b72a8  ldr     r0, [pc, #0x144]
000b72aa  ldr     r1, [pc, #0x148]
000b72ac  add     r0, pc ; -> 0x000fdb60  
000b72ae  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000b72b0  ldr     r0, [r0]
000b72b2  ldr     r1, [r1]
000b72b4  blx     #0xddbfc ; -> objc_msgSend
000b72b8  ldr     r1, [pc, #0x13c]
000b72ba  add     r1, pc ; -> 0x000fcaf4  'K\x1a\x0e'
000b72bc  ldr     r1, [r1]
000b72be  blx     #0xddbfc ; -> objc_msgSend
000b72c2  ldr     r1, [pc, #0x138]
000b72c4  ldr     r2, [pc, #0x138]
000b72c6  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000b72c8  add     r2, pc ; -> 0x0017e354  kGraphBaseURL+0x224
000b72ca  ldr     r1, [r1]
000b72cc  blx     #0xddbfc ; -> objc_msgSend
000b72d0  ldr     r1, [pc, #0x130]
000b72d2  add     r1, pc ; -> 0x000fd5b0  
000b72d4  ldr     r1, [r1]
000b72d6  mov     r2, r0
000b72d8  ldr     r0, [r5]
000b72da  blx     #0xddbfc ; -> objc_msgSend
000b72de  ldr     r0, [pc, #0x128]
000b72e0  ldr     r1, [pc, #0x128]
000b72e2  add     r0, pc ; -> 0x000fdb50  
000b72e4  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
000b72e6  ldr     r0, [r0]
000b72e8  ldr     r1, [r1]
000b72ea  blx     #0xddbfc ; -> objc_msgSend
000b72ee  ldr     r1, [pc, #0x120]
000b72f0  add     r1, pc ; -> 0x000fcb0c  'x\x1a\x0e'
000b72f2  ldr     r1, [r1]
000b72f4  blx     #0xddbfc ; -> objc_msgSend
000b72f8  ldr     r1, [pc, #0x118]
000b72fa  add     r1, pc ; -> 0x000fcbcc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x254
000b72fc  ldr     r1, [r1]
000b72fe  blx     #0xddbfc ; -> objc_msgSend
000b7302  ldr     r1, [pc, #0x114]
000b7304  add     r1, pc ; -> 0x000fd5ac  
000b7306  ldr     r4, [r1]
000b7308  mov     r1, r4
000b730a  mov     r2, r0
000b730c  ldr     r0, [r5]
000b730e  blx     #0xddbfc ; -> objc_msgSend
000b7312  ldr     r1, [pc, #0x108]
000b7314  ldr     r0, [r5]
000b7316  add     r1, pc ; -> 0x000fd5a4  
000b7318  ldr.w   sl, [r1]
000b731c  mov     r1, sl
000b731e  blx     #0xddbfc ; -> objc_msgSend
000b7322  ldr     r1, [pc, #0xfc]
000b7324  ldr     r2, [pc, #0xfc]
000b7326  ldr     r3, [pc, #0x100]
000b7328  add     r1, pc ; -> 0x000fcaec  '\x19\x1a\x0e'
000b732a  add     r2, pc ; -> 0x0017ffa4  
000b732c  add     r3, pc ; -> 0x001800b4  
000b732e  ldr     r1, [r1]
000b7330  blx     #0xddbfc ; -> objc_msgSend
000b7334  mov     r1, r4
000b7336  ldr     r4, [pc, #0xf4]
000b7338  add     r4, pc ; -> 0x001800c4  
000b733a  mov     r2, r0
000b733c  ldr     r0, [r5]
000b733e  blx     #0xddbfc ; -> objc_msgSend
000b7342  ldr     r0, [pc, #0xec]
000b7344  ldr     r1, [pc, #0xec]
000b7346  add     r0, pc ; -> 0x000fdb5c  
000b7348  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000b734a  ldr.w   r8, [r0]
000b734e  ldr     r6, [r1]
000b7350  ldr     r0, [r5]
000b7352  mov     r1, sl
000b7354  blx     #0xddbfc ; -> objc_msgSend
000b7358  mov     r1, r6
000b735a  mov     r2, r4
000b735c  ldr     r6, [pc, #0xd8]
000b735e  add     r6, pc ; -> 0x0038c0e8  mtxUserInfo
000b7360  mov     r3, r0
000b7362  mov     r0, r8
000b7364  blx     #0xddbfc ; -> objc_msgSend
000b7368  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000b736c  ldr     r1, [pc, #0xcc]
000b736e  ldr     r0, [r6]
000b7370  add     r1, pc ; -> 0x000fd5a0  
000b7372  ldr     r4, [r1]
000b7374  mov     r1, r4
000b7376  blx     #0xddbfc ; -> objc_msgSend
000b737a  cbz     r0, #0xb73d0
000b737c  mov     r1, r4
000b737e  ldr     r0, [r6]
000b7380  blx     #0xddbfc ; -> objc_msgSend
000b7384  ldr     r1, [pc, #0xb8]
000b7386  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000b7388  ldr.w   r8, [r1]
000b738c  mov     r1, r8
000b738e  blx     #0xddbfc ; -> objc_msgSend
000b7392  cbz     r0, #0xb73d0
000b7394  ldr     r1, [pc, #0xac]
000b7396  ldr     r0, [r6]
000b7398  add     r1, pc ; -> 0x000fd59c  
000b739a  ldr     r4, [r1]
000b739c  mov     r1, r4
000b739e  blx     #0xddbfc ; -> objc_msgSend
000b73a2  cbz     r0, #0xb73d0
000b73a4  mov     r1, r4
000b73a6  ldr     r0, [r6]
000b73a8  blx     #0xddbfc ; -> objc_msgSend
000b73ac  mov     r1, r8
000b73ae  blx     #0xddbfc ; -> objc_msgSend
000b73b2  cbz     r0, #0xb73d0
000b73b4  ldr     r1, [pc, #0x90]
000b73b6  ldr.w   r8, [r5]
000b73ba  ldr     r0, [r6]
000b73bc  add     r1, pc ; -> 0x000fd5a8  
000b73be  ldr     r5, [r1]
000b73c0  mov     r1, r4
000b73c2  blx     #0xddbfc ; -> objc_msgSend
000b73c6  mov     r1, r5
000b73c8  mov     r2, r0
000b73ca  mov     r0, r8
000b73cc  blx     #0xddbfc ; -> objc_msgSend
000b73d0  pop.w   {r8, sl}
000b73d4  pop     {r4, r5, r6, r7, pc}
000b73d6  nop     
000b73d8  ldr     r7, [pc, #0xe8]
000b73da  movs    r5, r5
000b73dc  ldr     r2, [r7, #0x1c]
000b73de  movs    r4, r0
000b73e0  ldrsb   r4, [r7, r3]
000b73e2  movs    r4, r0
000b73e4  ldrsb   r4, [r5, r3]
000b73e6  movs    r4, r0
000b73e8  str     r4, [r2, #0x30]
000b73ea  movs    r4, r0
000b73ec  ldrb    r2, [r0, #0x1f]
000b73ee  movs    r4, r1
000b73f0  ldr     r0, [r6, #8]
000b73f2  movs    r4, r0
000b73f4  ldrsb   r2, [r5, r5]
000b73f6  movs    r4, r0
000b73f8  ldr     r6, [r6, r0]
000b73fa  movs    r4, r0
000b73fc  ldr     r6, [r4, r0]
000b73fe  movs    r4, r0
000b7400  strb    r0, [r1, #2]
000b7402  movs    r4, r1
000b7404  str     r2, [r3, #0x2c]
000b7406  movs    r4, r0
000b7408  ldr     r2, [r5, #4]
000b740a  movs    r4, r0
000b740c  ldrsb   r0, [r1, r4]
000b740e  movs    r4, r0
000b7410  ldr     r0, [r3, r0]
000b7412  movs    r4, r0
000b7414  ldr     r6, [r1, r3]
000b7416  movs    r4, r0
000b7418  str     r4, [r4, #0x28]
000b741a  movs    r4, r0
000b741c  str     r2, [r1, #0x28]
000b741e  movs    r4, r0
000b7420  ldrsb   r0, [r0, r7]
000b7422  movs    r4, r0
000b7424  ldrh    r6, [r6, #0x22]
000b7426  movs    r4, r1
000b7428  ldrh    r4, [r0, #0x2c]
000b742a  movs    r4, r1
000b742c  ldrh    r0, [r1, #0x2c]
000b742e  movs    r4, r1
000b7430  ldr     r2, [r2]
000b7432  movs    r4, r0
000b7434  ldrsb   r4, [r2, r5]
000b7436  movs    r4, r0
000b7438  ldr     r5, [pc, #0x218]
000b743a  movs    r5, r5
000b743c  str     r4, [r5, #0x20]
000b743e  movs    r4, r0
000b7440  ldrsb   r6, [r5, r3]
000b7442  movs    r4, r0
000b7444  str     r0, [r0, #0x20]
000b7446  movs    r4, r0
000b7448  str     r0, [r5, #0x1c]
000b744a  movs    r4, r0
