========================================================================
GetPFlagCount  0x000bbb68  964 bytes   EAMTX_Main.mm
========================================================================

000bbb68  push    {r4, r5, r6, r7, lr}
000bbb6a  add     r7, sp, #0xc
000bbb6c  push.w  {r8, sl, fp}
000bbb70  vpush   {d8, d9}
000bbb74  sub     sp, #0x30
000bbb76  ldr     r4, [pc, #0x310]
000bbb78  movs    r3, #0
000bbb7a  add     r4, pc ; -> 0x0038c158  pCount
000bbb7c  str     r3, [r4]
000bbb7e  blx     #0xdd7c4 ; -> getgid
000bbb82  cmp     r0, #0xa
000bbb84  bgt     #0xbbb94
000bbb86  ldr     r0, [pc, #0x304]
000bbb88  add     r0, pc ; -> 0x001804b4  
000bbb8a  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bbb8e  ldr     r3, [r4]
000bbb90  adds    r3, #1
000bbb92  str     r3, [r4]
000bbb94  ldr     r0, [pc, #0x2f8]
000bbb96  ldr     r1, [pc, #0x2fc]
000bbb98  ldr     r4, [pc, #0x2fc]
000bbb9a  add     r0, pc ; -> 0x000fdc2c  
000bbb9c  add     r1, pc ; -> 0x000fd008  ':Z\x0e'
000bbb9e  ldr     r0, [r0]
000bbba0  ldr     r1, [r1]
000bbba2  add     r4, pc ; -> 0x001804c4  
000bbba4  str     r0, [sp, #0x10]
000bbba6  str     r1, [sp, #0x14]
000bbba8  blx     #0xddbfc ; -> objc_msgSend
000bbbac  ldr     r1, [pc, #0x2ec]
000bbbae  add     r1, pc ; -> 0x000fcff4  
000bbbb0  ldr.w   fp, [r1]
000bbbb4  ldr     r1, [pc, #0x2e8]
000bbbb6  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bbbb8  ldr     r1, [r1]
000bbbba  str     r1, [sp, #0x1c]
000bbbbc  ldr     r1, [pc, #0x2e4]
000bbbbe  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000bbbc0  ldr.w   r8, [r1]
000bbbc4  mov     r1, r8
000bbbc6  mov     r5, r0
000bbbc8  ldr     r0, [pc, #0x2dc]
000bbbca  add     r0, pc ; -> 0x000fdb5c  
000bbbcc  ldr     r0, [r0]
000bbbce  str     r0, [sp, #0x18]
000bbbd0  ldr     r0, [pc, #0x2d8]
000bbbd2  add     r0, pc ; -> 0x000fdb60  
000bbbd4  ldr.w   sl, [r0]
000bbbd8  mov     r0, sl
000bbbda  blx     #0xddbfc ; -> objc_msgSend
000bbbde  ldr     r1, [pc, #0x2d0]
000bbbe0  add     r1, pc ; -> 0x000fcba8  '}\x1f\x0e'
000bbbe2  ldr     r6, [r1]
000bbbe4  mov     r1, r6
000bbbe6  blx     #0xddbfc ; -> objc_msgSend
000bbbea  ldr     r1, [sp, #0x1c]
000bbbec  mov     r2, r4
000bbbee  mov     r3, r0
000bbbf0  ldr     r0, [sp, #0x18]
000bbbf2  blx     #0xddbfc ; -> objc_msgSend
000bbbf6  mov     r1, fp
000bbbf8  mov     r2, r0
000bbbfa  mov     r0, r5
000bbbfc  blx     #0xddbfc ; -> objc_msgSend
000bbc00  tst.w   r0, #0xff
000bbc04  beq     #0xbbc0a
000bbc06  movs    r3, #0
000bbc08  b       #0xbbc14
000bbc0a  ldr     r0, [pc, #0x2a8]
000bbc0c  add     r0, pc ; -> 0x001804d4  
000bbc0e  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bbc12  movs    r3, #1
000bbc14  ldr     r1, [sp, #0x14]
000bbc16  ldr     r0, [sp, #0x10]
000bbc18  str     r3, [sp, #0x28]
000bbc1a  blx     #0xddbfc ; -> objc_msgSend
000bbc1e  mov     r1, r8
000bbc20  ldr     r4, [pc, #0x294]
000bbc22  add     r4, pc ; -> 0x001804e4  
000bbc24  mov     r5, r0
000bbc26  mov     r0, sl
000bbc28  blx     #0xddbfc ; -> objc_msgSend
000bbc2c  mov     r1, r6
000bbc2e  blx     #0xddbfc ; -> objc_msgSend
000bbc32  ldr     r1, [sp, #0x1c]
000bbc34  mov     r2, r4
000bbc36  mov     r3, r0
000bbc38  ldr     r0, [sp, #0x18]
000bbc3a  blx     #0xddbfc ; -> objc_msgSend
000bbc3e  mov     r1, fp
000bbc40  mov     r2, r0
000bbc42  mov     r0, r5
000bbc44  blx     #0xddbfc ; -> objc_msgSend
000bbc48  tst.w   r0, #0xff
000bbc4c  bne     #0xbbc5a
000bbc4e  ldr     r0, [pc, #0x26c]
000bbc50  add     r0, pc ; -> 0x001804f4  
000bbc52  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bbc56  movs    r3, #1
000bbc58  str     r3, [sp, #0x28]
000bbc5a  ldr     r1, [sp, #0x14]
000bbc5c  ldr     r0, [sp, #0x10]
000bbc5e  blx     #0xddbfc ; -> objc_msgSend
000bbc62  mov     r1, r8
000bbc64  mov     r4, r0
000bbc66  mov     r0, sl
000bbc68  blx     #0xddbfc ; -> objc_msgSend
000bbc6c  mov     r1, r6
000bbc6e  blx     #0xddbfc ; -> objc_msgSend
000bbc72  mov     r1, fp
000bbc74  mov     r2, r0
000bbc76  mov     r0, r4
000bbc78  blx     #0xddbfc ; -> objc_msgSend
000bbc7c  tst.w   r0, #0xff
000bbc80  bne     #0xbbc8c
000bbc82  ldr     r0, [pc, #0x23c]
000bbc84  add     r0, pc ; -> 0x00180504  
000bbc86  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bbc8a  b       #0xbbc90
000bbc8c  ldr     r3, [sp, #0x28]
000bbc8e  cbz     r3, #0xbbc9a
000bbc90  ldr     r2, [pc, #0x230]
000bbc92  add     r2, pc ; -> 0x0038c158  pCount
000bbc94  ldr     r3, [r2]
000bbc96  adds    r3, #2
000bbc98  str     r3, [r2]
000bbc9a  mov     r1, r8
000bbc9c  mov     r0, sl
000bbc9e  blx     #0xddbfc ; -> objc_msgSend
000bbca2  mov     r1, r6
000bbca4  blx     #0xddbfc ; -> objc_msgSend
000bbca8  ldr     r4, [pc, #0x21c]
000bbcaa  ldr     r1, [sp, #0x1c]
000bbcac  vldr    d9, [pc, #0x1d0]
000bbcb0  add     r4, pc ; -> 0x00180514  
000bbcb2  mov     r2, r4
000bbcb4  ldr     r4, [pc, #0x214]
000bbcb6  add     r4, pc ; -> 0x00180524  
000bbcb8  mov     r3, r0
000bbcba  ldr     r0, [sp, #0x18]
000bbcbc  blx     #0xddbfc ; -> objc_msgSend
000bbcc0  mov     r1, r8
000bbcc2  mov     fp, r0
000bbcc4  mov     r0, sl
000bbcc6  blx     #0xddbfc ; -> objc_msgSend
000bbcca  mov     r1, r6
000bbccc  blx     #0xddbfc ; -> objc_msgSend
000bbcd0  mov     r1, r8
000bbcd2  mov     r5, r0
000bbcd4  mov     r0, sl
000bbcd6  blx     #0xddbfc ; -> objc_msgSend
000bbcda  ldr     r1, [pc, #0x1f4]
000bbcdc  add     r1, pc ; -> 0x000fcaf4  'K\x1a\x0e'
000bbcde  ldr     r1, [r1]
000bbce0  str     r1, [sp, #0x20]
000bbce2  blx     #0xddbfc ; -> objc_msgSend
000bbce6  ldr     r1, [pc, #0x1ec]
000bbce8  ldr     r2, [pc, #0x1ec]
000bbcea  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000bbcec  add     r2, pc ; -> 0x00180534  
000bbcee  ldr     r1, [r1]
000bbcf0  str     r1, [sp, #0x24]
000bbcf2  blx     #0xddbfc ; -> objc_msgSend
000bbcf6  mov     r2, r4
000bbcf8  mov     r3, r5
000bbcfa  ldr     r1, [sp, #0x1c]
000bbcfc  str     r0, [sp]
000bbcfe  ldr     r0, [sp, #0x18]
000bbd00  blx     #0xddbfc ; -> objc_msgSend
000bbd04  ldr     r1, [sp, #0x14]
000bbd06  mov     r6, r0
000bbd08  ldr     r0, [sp, #0x10]
000bbd0a  blx     #0xddbfc ; -> objc_msgSend
000bbd0e  ldr     r1, [pc, #0x1cc]
000bbd10  mov     r2, fp
000bbd12  movs    r3, #0
000bbd14  add     r1, pc ; -> 0x000fd3a4  
000bbd16  ldr     r5, [r1]
000bbd18  mov     r1, r5
000bbd1a  blx     #0xddbfc ; -> objc_msgSend
000bbd1e  ldr     r1, [pc, #0x1c0]
000bbd20  add     r1, pc ; -> 0x000fd3a0  
000bbd22  ldr     r4, [r1]
000bbd24  mov     r1, r4
000bbd26  blx     #0xddbfc ; -> objc_msgSend
000bbd2a  ldr     r1, [sp, #0x14]
000bbd2c  mov     fp, r0
000bbd2e  ldr     r0, [sp, #0x10]
000bbd30  blx     #0xddbfc ; -> objc_msgSend
000bbd34  movs    r3, #0
000bbd36  mov     r2, r6
000bbd38  mov     r1, r5
000bbd3a  blx     #0xddbfc ; -> objc_msgSend
000bbd3e  mov     r1, r4
000bbd40  blx     #0xddbfc ; -> objc_msgSend
000bbd44  ldr     r1, [sp, #0x14]
000bbd46  str     r0, [sp, #0x2c]
000bbd48  ldr     r0, [sp, #0x10]
000bbd4a  blx     #0xddbfc ; -> objc_msgSend
000bbd4e  mov     r1, r8
000bbd50  mov     r6, r0
000bbd52  mov     r0, sl
000bbd54  blx     #0xddbfc ; -> objc_msgSend
000bbd58  ldr     r1, [pc, #0x188]
000bbd5a  add     r1, pc ; -> 0x000fd39c  
000bbd5c  ldr     r1, [r1]
000bbd5e  blx     #0xddbfc ; -> objc_msgSend
000bbd62  ldr     r1, [pc, #0x184]
000bbd64  ldr     r2, [pc, #0x184]
000bbd66  add     r1, pc ; -> 0x000fcba4  ']\x1f\x0e'
000bbd68  add     r2, pc ; -> 0x00180544  
000bbd6a  ldr     r1, [r1]
000bbd6c  blx     #0xddbfc ; -> objc_msgSend
000bbd70  movs    r3, #0
000bbd72  mov     r1, r5
000bbd74  mov     r2, r0
000bbd76  mov     r0, r6
000bbd78  blx     #0xddbfc ; -> objc_msgSend
000bbd7c  mov     r1, r4
000bbd7e  blx     #0xddbfc ; -> objc_msgSend
000bbd82  ldr     r1, [pc, #0x16c]
000bbd84  add     r1, pc ; -> 0x000fd398  
000bbd86  ldr     r4, [r1]
000bbd88  mov     r1, r4
000bbd8a  mov     r5, r0
000bbd8c  mov     r0, fp
000bbd8e  blx     #0xddbfc ; -> objc_msgSend
000bbd92  vmov    d8, r0, r1
000bbd96  mov     r0, r5
000bbd98  mov     r1, r4
000bbd9a  blx     #0xddbfc ; -> objc_msgSend
000bbd9e  vmov    d7, r0, r1
000bbda2  vsub.f64 d7, d8, d7
000bbda6  vabs.f64 d7, d7
000bbdaa  vcmpe.f64 d7, d9
000bbdae  vmrs    apsr_nzcv, fpscr
000bbdb2  ble     #0xbbdbc
000bbdb4  ldr     r0, [pc, #0x13c]
000bbdb6  add     r0, pc ; -> 0x00180554  
000bbdb8  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bbdbc  ldr     r0, [sp, #0x2c]
000bbdbe  mov     r1, r4
000bbdc0  blx     #0xddbfc ; -> objc_msgSend
000bbdc4  vmov    d8, r0, r1
000bbdc8  mov     r0, r5
000bbdca  mov     r1, r4
000bbdcc  blx     #0xddbfc ; -> objc_msgSend
000bbdd0  vmov    d7, r0, r1
000bbdd4  vsub.f64 d7, d8, d7
000bbdd8  vabs.f64 d7, d7
000bbddc  vcmpe.f64 d7, d9
000bbde0  vmrs    apsr_nzcv, fpscr
000bbde4  ble     #0xbbdee
000bbde6  ldr     r0, [pc, #0x110]
000bbde8  add     r0, pc ; -> 0x00180564  
000bbdea  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bbdee  ldr     r1, [pc, #0x10c]
000bbdf0  ldr     r0, [sp, #0x18]
000bbdf2  ldr     r4, [pc, #0x10c]
000bbdf4  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bbdf6  ldr     r1, [r1]
000bbdf8  blx     #0xddbfc ; -> objc_msgSend
000bbdfc  ldr     r1, [pc, #0x104]
000bbdfe  ldr     r2, [pc, #0x108]
000bbe00  ldr     r3, [pc, #0x108]
000bbe02  ldr.w   sb, [pc, #0x10c]
000bbe06  ldr.w   lr, [pc, #0x10c]
000bbe0a  ldr.w   ip, [pc, #0x10c]
000bbe0e  add     r1, pc ; -> 0x000fcb18  '\x15\x1e\x0e'
000bbe10  add     r2, pc ; -> 0x00180574  
000bbe12  add     r3, pc ; -> 0x00180584  
000bbe14  ldr     r1, [r1]
000bbe16  add     sb, pc ; -> 0x00180594  
000bbe18  add     lr, pc ; -> 0x001805b4  
000bbe1a  add     ip, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000bbe1c  str.w   sb, [sp]
000bbe20  str.w   lr, [sp, #8]
000bbe24  str.w   ip, [sp, #0xc]
000bbe28  add     r4, pc ; -> 0x001805a4  
000bbe2a  str     r4, [sp, #4]
000bbe2c  blx     #0xddbfc ; -> objc_msgSend
000bbe30  mov     r1, r8
000bbe32  mov     r4, r0
000bbe34  mov     r0, sl
000bbe36  blx     #0xddbfc ; -> objc_msgSend
000bbe3a  ldr     r1, [sp, #0x20]
000bbe3c  blx     #0xddbfc ; -> objc_msgSend
000bbe40  ldr     r1, [sp, #0x24]
000bbe42  mov     r2, r4
000bbe44  blx     #0xddbfc ; -> objc_msgSend
000bbe48  cbz     r0, #0xbbe5c
000bbe4a  ldr     r0, [pc, #0xd0]
000bbe4c  add     r0, pc ; -> 0x001805c4  
000bbe4e  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bbe52  ldr     r2, [pc, #0xcc]
000bbe54  add     r2, pc ; -> 0x0038c158  pCount
000bbe56  ldr     r3, [r2]
000bbe58  adds    r3, #0x10
000bbe5a  str     r3, [r2]
000bbe5c  ldr     r1, [pc, #0xc4]
000bbe5e  mov     r0, r4
000bbe60  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bbe62  ldr     r1, [r1]
000bbe64  blx     #0xddbfc ; -> objc_msgSend
000bbe68  ldr     r0, [pc, #0xbc]
000bbe6a  add     r0, pc ; -> 0x0038c158  pCount
000bbe6c  ldr     r0, [r0]
000bbe6e  sub.w   sp, r7, #0x28
000bbe72  vpop    {d8, d9}
000bbe76  sub.w   sp, r7, #0x18
000bbe7a  pop.w   {r8, sl, fp}
000bbe7e  pop     {r4, r5, r6, r7, pc}
000bbe80  movs    r0, r0
000bbe82  movs    r0, r0
000bbe84  adds    r0, r0, r0
000bbe86  asrs    r5, r0
000bbe88  lsls    r2, r3, #0x17
000bbe8a  movs    r5, r5
000bbe8c  ldr     r1, [pc, #0xa0]
000bbe8e  movs    r4, r1
000bbe90  movs    r0, #0x8e
000bbe92  movs    r4, r0
000bbe94  asrs    r0, r5, #0x11
000bbe96  movs    r4, r0
000bbe98  ldr     r1, [pc, #0x78]
000bbe9a  movs    r4, r1
000bbe9c  asrs    r2, r0, #0x11
000bbe9e  movs    r4, r0
000bbea0  lsrs    r6, r4, #0x1b
000bbea2  movs    r4, r0
000bbea4  lsrs    r2, r3, #0x19
000bbea6  movs    r4, r0
000bbea8  subs    r6, r1, #6
000bbeaa  movs    r4, r0
000bbeac  subs    r2, r1, #6
000bbeae  movs    r4, r0
000bbeb0  lsrs    r4, r0, #0x1f
000bbeb2  movs    r4, r0
000bbeb4  ldr     r0, [pc, #0x310]
000bbeb6  movs    r4, r1
000bbeb8  ldr     r0, [pc, #0x2f8]
000bbeba  movs    r4, r1
000bbebc  ldr     r0, [pc, #0x280]
000bbebe  movs    r4, r1
000bbec0  ldr     r0, [pc, #0x1f0]
000bbec2  movs    r4, r1
000bbec4  lsls    r2, r0, #0x13
000bbec6  movs    r5, r5
000bbec8  ldr     r0, [pc, #0x180]
000bbeca  movs    r4, r1
000bbecc  ldr     r0, [pc, #0x1a8]
000bbece  movs    r4, r1
000bbed0  lsrs    r4, r2, #0x18
000bbed2  movs    r4, r0
000bbed4  lsrs    r2, r0, #0x18
000bbed6  movs    r4, r0
000bbed8  ldr     r0, [pc, #0x110]
000bbeda  movs    r4, r1
000bbedc  asrs    r4, r1, #0x1a
000bbede  movs    r4, r0
000bbee0  asrs    r4, r7, #0x19
000bbee2  movs    r4, r0
000bbee4  asrs    r6, r7, #0x18
000bbee6  movs    r4, r0
000bbee8  lsrs    r2, r7, #0x18
000bbeea  movs    r4, r0
000bbeec  blx     fp
000bbeee  movs    r4, r1
000bbef0  asrs    r0, r2, #0x18
000bbef2  movs    r4, r0
