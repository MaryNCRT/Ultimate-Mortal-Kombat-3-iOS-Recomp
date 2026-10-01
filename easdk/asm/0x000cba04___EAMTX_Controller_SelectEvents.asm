========================================================================
-[EAMTX_Controller SelectEvents  0x000cba04  724 bytes   EAMTX_Controller.mm
========================================================================

000cba04  push    {r4, r5, r6, r7, lr}
000cba06  add     r7, sp, #0xc
000cba08  push.w  {r8, sl, fp}
000cba0c  sub     sp, #0x24
000cba0e  mov     r4, r2
000cba10  ldr     r2, [pc, #0x254]
000cba12  add     r2, pc ; -> 0x0038c1e4  bDBCreated
000cba14  ldrb    r3, [r2]
000cba16  cbnz    r3, #0xcba26
000cba18  ldr     r1, [pc, #0x250]
000cba1a  adds    r3, #1
000cba1c  strb    r3, [r2]
000cba1e  add     r1, pc ; -> 0x000fd780  
000cba20  ldr     r1, [r1]
000cba22  blx     #0xddbfc ; -> objc_msgSend
000cba26  ldr     r0, [pc, #0x248]
000cba28  ldr     r1, [pc, #0x248]
000cba2a  ldr     r2, [pc, #0x24c]
000cba2c  add     r0, pc ; -> 0x000fdb5c  
000cba2e  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cba30  ldr     r6, [r0]
000cba32  ldr.w   sl, [r1]
000cba36  add     r2, pc ; -> 0x00181794  
000cba38  mov     r3, r4
000cba3a  mov     r0, r6
000cba3c  mov     r1, sl
000cba3e  blx     #0xddbfc ; -> objc_msgSend
000cba42  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cba46  ldr     r1, [pc, #0x234]
000cba48  ldr     r0, [pc, #0x234]
000cba4a  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000cba4c  add     r0, pc ; -> 0x000fdb70  
000cba4e  ldr     r1, [r1]
000cba50  ldr     r0, [r0]
000cba52  str     r1, [sp, #4]
000cba54  blx     #0xddbfc ; -> objc_msgSend
000cba58  ldr     r1, [pc, #0x228]
000cba5a  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000cba5c  ldr     r1, [r1]
000cba5e  str     r1, [sp, #8]
000cba60  blx     #0xddbfc ; -> objc_msgSend
000cba64  ldr     r1, [pc, #0x220]
000cba66  add     r1, pc ; -> 0x000fca20  '\x18V\x0e'
000cba68  ldr     r1, [r1]
000cba6a  str     r0, [sp, #0xc]
000cba6c  ldr     r0, [pc, #0x21c]
000cba6e  add     r0, pc ; -> 0x0038c1e0  dbPath
000cba70  ldr     r0, [r0]
000cba72  blx     #0xddbfc ; -> objc_msgSend
000cba76  add     r1, sp, #0x20
000cba78  blx     #0xddd88 ; -> sqlite3_open
000cba7c  cmp     r0, #0
000cba7e  bne.w   #0xcbc14
000cba82  ldr     r1, [pc, #0x20c]
000cba84  str     r0, [sp]
000cba86  mov.w   r2, #-1
000cba8a  add     r1, pc ; -> 0x000ea818  'select * from trackingdb order by priority asc, session asc, step asc, rowid asc limit ?'
000cba8c  ldr     r0, [sp, #0x20]
000cba8e  add     r3, sp, #0x1c
000cba90  blx     #0xddda0 ; -> sqlite3_prepare_v2
000cba94  cmp     r0, #0
000cba96  bne.w   #0xcbc0c
000cba9a  movs    r1, #1
000cba9c  ldr     r0, [sp, #0x1c]
000cba9e  mov     r2, r4
000cbaa0  blx     #0xddd10 ; -> sqlite3_bind_int
000cbaa4  ldr.w   r1, [pc, #0x1ec]
000cbaa8  ldr.w   r0, [pc, #0x1ec]
000cbaac  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000cbaae  add     r0, pc ; -> 0x000fdbf4  
000cbab0  ldr     r5, [r1]
000cbab2  ldr     r1, [pc, #0x1e8]
000cbab4  ldr     r0, [r0]
000cbab6  add     r1, pc ; -> 0x000fd77c  
000cbab8  ldr.w   fp, [r1]
000cbabc  ldr     r1, [pc, #0x1e0]
000cbabe  str     r0, [sp, #0x10]
000cbac0  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000cbac2  ldr     r1, [r1]
000cbac4  str     r1, [sp, #0x14]
000cbac6  ldr     r1, [pc, #0x1dc]
000cbac8  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cbaca  ldr     r1, [r1]
000cbacc  str     r1, [sp, #0x18]
000cbace  b       #0xcbc00
000cbad0  ldr     r1, [sp, #4]
000cbad2  ldr     r0, [sp, #0x10]
000cbad4  blx     #0xddbfc ; -> objc_msgSend
000cbad8  ldr     r1, [sp, #8]
000cbada  blx     #0xddbfc ; -> objc_msgSend
000cbade  movs    r1, #0
000cbae0  ldr.w   r8, [pc, #0x1c4]
000cbae4  add     r8, pc ; -> 0x0017e5c4  
000cbae6  mov     r4, r0
000cbae8  ldr     r0, [sp, #0x1c]
000cbaea  blx     #0xddd58 ; -> sqlite3_column_text
000cbaee  mov     r1, fp
000cbaf0  mov     r2, r0
000cbaf2  mov     r0, r6
000cbaf4  blx     #0xddbfc ; -> objc_msgSend
000cbaf8  ldr     r3, [pc, #0x1b0]
000cbafa  mov     r1, r5
000cbafc  add     r3, pc ; -> 0x0017fff4  
000cbafe  mov     r2, r0
000cbb00  mov     r0, r4
000cbb02  blx     #0xddbfc ; -> objc_msgSend
000cbb06  movs    r1, #1
000cbb08  ldr     r0, [sp, #0x1c]
000cbb0a  blx     #0xddd4c ; -> sqlite3_column_int
000cbb0e  mov     r1, sl
000cbb10  mov     r2, r8
000cbb12  mov     r3, r0
000cbb14  mov     r0, r6
000cbb16  blx     #0xddbfc ; -> objc_msgSend
000cbb1a  ldr     r3, [pc, #0x194]
000cbb1c  mov     r1, r5
000cbb1e  add     r3, pc ; -> 0x0017ffd4  
000cbb20  mov     r2, r0
000cbb22  mov     r0, r4
000cbb24  blx     #0xddbfc ; -> objc_msgSend
000cbb28  movs    r1, #2
000cbb2a  ldr     r0, [sp, #0x1c]
000cbb2c  blx     #0xddd4c ; -> sqlite3_column_int
000cbb30  mov     r1, sl
000cbb32  mov     r2, r8
000cbb34  mov     r3, r0
000cbb36  mov     r0, r6
000cbb38  blx     #0xddbfc ; -> objc_msgSend
000cbb3c  ldr     r3, [pc, #0x174]
000cbb3e  mov     r1, r5
000cbb40  add     r3, pc ; -> 0x0017ffe4  
000cbb42  mov     r2, r0
000cbb44  mov     r0, r4
000cbb46  blx     #0xddbfc ; -> objc_msgSend
000cbb4a  movs    r1, #4
000cbb4c  ldr     r0, [sp, #0x1c]
000cbb4e  blx     #0xddd4c ; -> sqlite3_column_int
000cbb52  mov     r1, sl
000cbb54  mov     r2, r8
000cbb56  mov     r3, r0
000cbb58  mov     r0, r6
000cbb5a  blx     #0xddbfc ; -> objc_msgSend
000cbb5e  ldr     r3, [pc, #0x158]
000cbb60  mov     r1, r5
000cbb62  add     r3, pc ; -> 0x00180004  
000cbb64  mov     r2, r0
000cbb66  mov     r0, r4
000cbb68  blx     #0xddbfc ; -> objc_msgSend
000cbb6c  movs    r1, #5
000cbb6e  ldr     r0, [sp, #0x1c]
000cbb70  blx     #0xddd58 ; -> sqlite3_column_text
000cbb74  mov     r1, fp
000cbb76  mov     r2, r0
000cbb78  mov     r0, r6
000cbb7a  blx     #0xddbfc ; -> objc_msgSend
000cbb7e  ldr     r3, [pc, #0x13c]
000cbb80  mov     r1, r5
000cbb82  add     r3, pc ; -> 0x00180014  
000cbb84  mov     r2, r0
000cbb86  mov     r0, r4
000cbb88  blx     #0xddbfc ; -> objc_msgSend
000cbb8c  movs    r1, #6
000cbb8e  ldr     r0, [sp, #0x1c]
000cbb90  blx     #0xddd4c ; -> sqlite3_column_int
000cbb94  mov     r1, sl
000cbb96  mov     r2, r8
000cbb98  mov     r3, r0
000cbb9a  mov     r0, r6
000cbb9c  blx     #0xddbfc ; -> objc_msgSend
000cbba0  ldr     r3, [pc, #0x11c]
000cbba2  mov     r1, r5
000cbba4  add     r3, pc ; -> 0x00180024  
000cbba6  mov     r2, r0
000cbba8  mov     r0, r4
000cbbaa  blx     #0xddbfc ; -> objc_msgSend
000cbbae  movs    r1, #7
000cbbb0  ldr     r0, [sp, #0x1c]
000cbbb2  blx     #0xddd58 ; -> sqlite3_column_text
000cbbb6  mov     r1, fp
000cbbb8  mov     r2, r0
000cbbba  mov     r0, r6
000cbbbc  blx     #0xddbfc ; -> objc_msgSend
000cbbc0  ldr     r3, [pc, #0x100]
000cbbc2  mov     r1, r5
000cbbc4  add     r3, pc ; -> 0x00180034  
000cbbc6  mov     r2, r0
000cbbc8  mov     r0, r4
000cbbca  blx     #0xddbfc ; -> objc_msgSend
000cbbce  movs    r1, #8
000cbbd0  ldr     r0, [sp, #0x1c]
000cbbd2  blx     #0xddd58 ; -> sqlite3_column_text
000cbbd6  mov     r1, fp
000cbbd8  mov     r2, r0
000cbbda  mov     r0, r6
000cbbdc  blx     #0xddbfc ; -> objc_msgSend
000cbbe0  ldr     r3, [pc, #0xe4]
000cbbe2  mov     r1, r5
000cbbe4  add     r3, pc ; -> 0x00180044  
000cbbe6  mov     r2, r0
000cbbe8  mov     r0, r4
000cbbea  blx     #0xddbfc ; -> objc_msgSend
000cbbee  ldr     r0, [sp, #0xc]
000cbbf0  ldr     r1, [sp, #0x14]
000cbbf2  mov     r2, r4
000cbbf4  blx     #0xddbfc ; -> objc_msgSend
000cbbf8  mov     r0, r4
000cbbfa  ldr     r1, [sp, #0x18]
000cbbfc  blx     #0xddbfc ; -> objc_msgSend
000cbc00  ldr     r0, [sp, #0x1c]
000cbc02  blx     #0xdddb8 ; -> sqlite3_step
000cbc06  cmp     r0, #0x64
000cbc08  beq.w   #0xcbad0
000cbc0c  ldr     r0, [sp, #0x1c]
000cbc0e  blx     #0xddd70 ; -> sqlite3_finalize
000cbc12  b       #0xcbc2e
000cbc14  ldr     r0, [sp, #0x20]
000cbc16  blx     #0xddd64 ; -> sqlite3_errmsg
000cbc1a  ldr     r4, [pc, #0xb0]
000cbc1c  mov     r1, sl
000cbc1e  add     r4, pc ; -> 0x00181784  
000cbc20  mov     r2, r4
000cbc22  mov     r3, r0
000cbc24  mov     r0, r6
000cbc26  blx     #0xddbfc ; -> objc_msgSend
000cbc2a  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cbc2e  ldr     r0, [sp, #0x20]
000cbc30  blx     #0xddd40 ; -> sqlite3_close
000cbc34  ldr     r3, [sp, #0xc]
000cbc36  cbz     r3, #0xcbc5a
000cbc38  ldr.w   r1, [pc, #0x94]
000cbc3c  mov     r0, r3
000cbc3e  ldr     r4, [pc, #0x94]
000cbc40  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000cbc42  ldr     r1, [r1]
000cbc44  blx     #0xddbfc ; -> objc_msgSend
000cbc48  add     r4, pc ; -> 0x001817a4  
000cbc4a  mov     r1, sl
000cbc4c  mov     r2, r4
000cbc4e  mov     r3, r0
000cbc50  mov     r0, r6
000cbc52  blx     #0xddbfc ; -> objc_msgSend
000cbc56  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cbc5a  ldr     r0, [sp, #0xc]
000cbc5c  sub.w   sp, r7, #0x18
000cbc60  pop.w   {r8, sl, fp}
000cbc64  pop     {r4, r5, r6, r7, pc}
000cbc66  nop     
000cbc68  lsls    r6, r1, #0x1f
000cbc6a  movs    r4, r5
000cbc6c  adds    r6, r3, #5
000cbc6e  movs    r3, r0
000cbc70  movs    r1, #0x2c
000cbc72  movs    r3, r0
000cbc74  asrs    r6, r5, #1
000cbc76  movs    r3, r0
000cbc78  ldrb    r2, [r3, r5]
000cbc7a  movs    r3, r1
000cbc7c  lsrs    r6, r6, #0x1c
000cbc7e  movs    r3, r0
000cbc80  movs    r1, #0x20
000cbc82  movs    r3, r0
000cbc84  lsrs    r2, r4, #0x1c
000cbc86  movs    r3, r0
000cbc88  lsrs    r6, r6, #0x1e
000cbc8a  movs    r3, r0
000cbc8c  lsls    r6, r5, #0x1d
000cbc8e  movs    r4, r5
000cbc90  stc     p0, c0, [sl, #4]
000cbc94  asrs    r0, r5, #0x20
000cbc96  movs    r3, r0
000cbc98  movs    r1, #0x42
000cbc9a  movs    r3, r0
000cbc9c  adds    r2, r0, #3
000cbc9e  movs    r3, r0
000cbca0  lsrs    r0, r0, #0x1f
000cbca2  movs    r3, r0
000cbca4  lsrs    r0, r6, #0x1a
000cbca6  movs    r3, r0
000cbca8  cmp     r2, #0xdc
000cbcaa  movs    r3, r1
000cbcac  add     ip, lr
000cbcae  movs    r3, r1
000cbcb0  add     sl, r6
000cbcb2  movs    r3, r1
000cbcb4  add     r8, r4
000cbcb6  movs    r3, r1
000cbcb8  add     lr, r3
000cbcba  movs    r3, r1
000cbcbc  add     lr, r1
000cbcbe  movs    r3, r1
000cbcc0  add     r4, pc
000cbcc2  movs    r3, r1
000cbcc4  add     r4, sp, r4
000cbcc6  movs    r3, r1
000cbcc8  add     r4, fp
000cbcca  movs    r3, r1
000cbccc  ldrh    r2, [r4, r5]
000cbcce  movs    r3, r1
000cbcd0  lsrs    r4, r7, #0x18
000cbcd2  movs    r3, r0
000cbcd4  ldrh    r0, [r3, r5]
000cbcd6  movs    r3, r1
