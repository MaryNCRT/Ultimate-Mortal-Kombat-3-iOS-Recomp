========================================================================
-[EAMTX_Controller CreateDB]  0x000cb350  664 bytes   EAMTX_Controller.mm
========================================================================

000cb350  push    {r4, r5, r6, r7, lr}
000cb352  add     r7, sp, #0xc
000cb354  push.w  {r8, sl, fp}
000cb358  sub     sp, #8
000cb35a  ldr     r0, [pc, #0x1f0]
000cb35c  add     r0, pc ; -> 0x000f3324  mtxUserInfo
000cb35e  ldr.w   r8, [r0]
000cb362  ldr.w   r0, [r8]
000cb366  cmp     r0, #0
000cb368  beq.w   #0xcb51e
000cb36c  ldr     r1, [pc, #0x1e0]
000cb36e  add     r1, pc ; -> 0x000fd6a4  
000cb370  ldr     r5, [r1]
000cb372  mov     r1, r5
000cb374  blx     #0xddbfc ; -> objc_msgSend
000cb378  cmp.w   r0, #-1
000cb37c  beq.w   #0xcb51e
000cb380  ldr.w   r0, [pc, #0x1d0]
000cb384  ldr     r1, [pc, #0x1d0]
000cb386  ldr     r4, [pc, #0x1d4]
000cb388  add     r0, pc ; -> 0x000fdb5c  
000cb38a  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cb38c  ldr.w   sl, [r0]
000cb390  ldr     r6, [r1]
000cb392  ldr.w   r0, [r8]
000cb396  mov     r1, r5
000cb398  blx     #0xddbfc ; -> objc_msgSend
000cb39c  ldr     r2, [pc, #0x1c0]
000cb39e  add     r4, pc ; -> 0x00181674  
000cb3a0  mov     r1, r6
000cb3a2  add     r2, pc ; -> 0x00181684  
000cb3a4  str     r2, [sp]
000cb3a6  mov     r2, r4
000cb3a8  mov     r3, r0
000cb3aa  mov     r0, sl
000cb3ac  blx     #0xddbfc ; -> objc_msgSend
000cb3b0  mov     r4, r0
000cb3b2  ldr     r1, [pc, #0x1b0]
000cb3b4  ldr     r0, [pc, #0x1b0]
000cb3b6  add     r1, pc ; -> 0x000fd008  ':Z\x0e'
000cb3b8  add     r0, pc ; -> 0x000fdc2c  
000cb3ba  ldr     r1, [r1]
000cb3bc  ldr     r0, [r0]
000cb3be  blx     #0xddbfc ; -> objc_msgSend
000cb3c2  movs    r1, #1
000cb3c4  mov     r2, r1
000cb3c6  mov     fp, r0
000cb3c8  movs    r0, #9
000cb3ca  blx     #0xdd3ec ; -> NSSearchPathForDirectoriesInDomains
000cb3ce  ldr     r1, [pc, #0x19c]
000cb3d0  movs    r2, #0
000cb3d2  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000cb3d4  ldr     r1, [r1]
000cb3d6  blx     #0xddbfc ; -> objc_msgSend
000cb3da  ldr     r1, [pc, #0x194]
000cb3dc  mov     r2, r4
000cb3de  ldr     r4, [pc, #0x194]
000cb3e0  add     r1, pc ; -> 0x000fcfe4  
000cb3e2  ldr     r1, [r1]
000cb3e4  blx     #0xddbfc ; -> objc_msgSend
000cb3e8  ldr     r1, [pc, #0x18c]
000cb3ea  add     r4, pc ; -> 0x0038c1e0  dbPath
000cb3ec  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000cb3ee  ldr     r1, [r1]
000cb3f0  blx     #0xddbfc ; -> objc_msgSend
000cb3f4  ldr     r1, [pc, #0x184]
000cb3f6  ldr     r2, [pc, #0x188]
000cb3f8  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cb3fa  add     r2, pc ; -> 0x00181694  
000cb3fc  ldr.w   r8, [r1]
000cb400  mov     r1, r8
000cb402  mov     r3, r0
000cb404  str     r0, [r4]
000cb406  ldr     r0, [pc, #0x17c]
000cb408  add     r0, pc ; -> 0x000fdb5c  
000cb40a  ldr.w   sl, [r0]
000cb40e  mov     r0, sl
000cb410  blx     #0xddbfc ; -> objc_msgSend
000cb414  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cb418  ldr     r1, [pc, #0x16c]
000cb41a  ldr     r2, [r4]
000cb41c  mov     r0, fp
000cb41e  add     r1, pc ; -> 0x000fcff4  
000cb420  ldr     r1, [r1]
000cb422  blx     #0xddbfc ; -> objc_msgSend
000cb426  tst.w   r0, #0xff
000cb42a  beq     #0xcb46c
000cb42c  ldr     r1, [pc, #0x15c]
000cb42e  ldr     r2, [r4]
000cb430  mov     r0, fp
000cb432  add     r1, pc ; -> 0x000fd21c  
000cb434  ldr     r1, [r1]
000cb436  blx     #0xddbfc ; -> objc_msgSend
000cb43a  ldr     r1, [pc, #0x154]
000cb43c  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000cb43e  ldr     r1, [r1]
000cb440  blx     #0xddbfc ; -> objc_msgSend
000cb444  mov     r5, r0
000cb446  cbnz    r0, #0xcb462
000cb448  ldr     r0, [pc, #0x148]
000cb44a  add     r0, pc ; -> 0x001816a4  
000cb44c  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cb450  ldr     r1, [pc, #0x144]
000cb452  ldr     r2, [r4]
000cb454  mov     r0, fp
000cb456  add     r1, pc ; -> 0x000fcff8  
000cb458  mov     r3, r5
000cb45a  ldr     r1, [r1]
000cb45c  blx     #0xddbfc ; -> objc_msgSend
000cb460  b       #0xcb46c
000cb462  ldr     r0, [pc, #0x138]
000cb464  add     r0, pc ; -> 0x001816b4  
000cb466  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cb46a  b       #0xcb540
000cb46c  ldr     r6, [pc, #0x130]
000cb46e  ldr     r2, [pc, #0x134]
000cb470  mov     r1, r8
000cb472  add     r6, pc ; -> 0x0038c1e0  dbPath
000cb474  add     r2, pc ; -> 0x001816c4  
000cb476  ldr     r3, [r6]
000cb478  mov     r0, sl
000cb47a  blx     #0xddbfc ; -> objc_msgSend
000cb47e  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cb482  ldr     r0, [pc, #0x124]
000cb484  ldr     r1, [pc, #0x124]
000cb486  add     r0, pc ; -> 0x000fdb60  
000cb488  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000cb48a  ldr     r0, [r0]
000cb48c  ldr     r1, [r1]
000cb48e  blx     #0xddbfc ; -> objc_msgSend
000cb492  ldr     r1, [pc, #0x11c]
000cb494  add     r1, pc ; -> 0x000fd39c  
000cb496  ldr     r1, [r1]
000cb498  blx     #0xddbfc ; -> objc_msgSend
000cb49c  ldr     r1, [pc, #0x114]
000cb49e  ldr     r2, [pc, #0x118]
000cb4a0  ldr     r3, [pc, #0x118]
000cb4a2  add     r1, pc ; -> 0x000fcba4  ']\x1f\x0e'
000cb4a4  add     r2, pc ; -> 0x001816d4  
000cb4a6  ldr     r4, [r1]
000cb4a8  add     r3, pc ; -> 0x00181684  
000cb4aa  mov     r1, r8
000cb4ac  mov     r5, r0
000cb4ae  mov     r0, sl
000cb4b0  blx     #0xddbfc ; -> objc_msgSend
000cb4b4  mov     r1, r4
000cb4b6  mov     r2, r0
000cb4b8  mov     r0, r5
000cb4ba  blx     #0xddbfc ; -> objc_msgSend
000cb4be  ldr     r2, [pc, #0x100]
000cb4c0  ldr     r3, [r6]
000cb4c2  mov     r1, r8
000cb4c4  add     r2, pc ; -> 0x001816e4  
000cb4c6  mov     r4, r0
000cb4c8  str     r0, [sp]
000cb4ca  mov     r0, sl
000cb4cc  blx     #0xddbfc ; -> objc_msgSend
000cb4d0  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cb4d4  ldr     r3, [r6]
000cb4d6  ldr     r2, [pc, #0xec]
000cb4d8  mov     r1, r8
000cb4da  mov     r0, sl
000cb4dc  add     r2, pc ; -> 0x001816f4  
000cb4de  str     r3, [sp]
000cb4e0  mov     r3, r4
000cb4e2  blx     #0xddbfc ; -> objc_msgSend
000cb4e6  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cb4ea  ldr     r1, [pc, #0xdc]
000cb4ec  ldr     r3, [r6]
000cb4ee  add     r2, sp, #4
000cb4f0  add     r1, pc ; -> 0x000fd784  
000cb4f2  str     r2, [sp]
000cb4f4  ldr     r1, [r1]
000cb4f6  mov     r2, r4
000cb4f8  mov     r0, fp
000cb4fa  blx     #0xddbfc ; -> objc_msgSend
000cb4fe  uxtb    r4, r0
000cb500  cbnz    r4, #0xcb540
000cb502  ldr     r0, [pc, #0xc8]
000cb504  ldr     r1, [sp, #4]
000cb506  add     r0, pc ; -> 0x00181704  
000cb508  blx     #0xdd3e0 ; -> NSLog
000cb50c  ldr     r1, [pc, #0xc0]
000cb50e  ldr     r2, [r6]
000cb510  mov     r0, fp
000cb512  add     r1, pc ; -> 0x000fcff8  
000cb514  mov     r3, r4
000cb516  ldr     r1, [r1]
000cb518  blx     #0xddbfc ; -> objc_msgSend
000cb51c  b       #0xcb540
000cb51e  ldr     r0, [pc, #0xb4]
000cb520  add     r0, pc ; -> 0x00181714  
000cb522  blx     #0xdd3e0 ; -> NSLog
000cb526  ldr     r0, [pc, #0xb0]
000cb528  ldr     r1, [pc, #0xb0]
000cb52a  ldr     r2, [pc, #0xb4]
000cb52c  ldr     r3, [pc, #0xb4]
000cb52e  add     r0, pc ; -> 0x000fdb5c  
000cb530  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cb532  add     r2, pc ; -> 0x001816d4  
000cb534  add     r3, pc ; -> 0x00181684  
000cb536  ldr     r1, [r1]
000cb538  ldr     r0, [r0]
000cb53a  blx     #0xddbfc ; -> objc_msgSend
000cb53e  b       #0xcb3b0
000cb540  sub.w   sp, r7, #0x18
000cb544  pop.w   {r8, sl, fp}
000cb548  pop     {r4, r5, r6, r7, pc}
000cb54a  nop     
000cb54c  ldrb    r4, [r0, #0x1f]
000cb54e  movs    r2, r0
000cb550  movs    r3, #0x32
000cb552  movs    r3, r0
000cb554  movs    r7, #0xd0
000cb556  movs    r3, r0
000cb558  asrs    r2, r2, #0x1c
000cb55a  movs    r3, r0
000cb55c  str     r2, [r2, #0x2c]
000cb55e  movs    r3, r1
000cb560  str     r6, [r3, #0x2c]
000cb562  movs    r3, r1
000cb564  adds    r6, r1, #1
000cb566  movs    r3, r0
000cb568  cmp     r0, #0x70
000cb56a  movs    r3, r0
000cb56c  asrs    r6, r4, #0x1a
000cb56e  movs    r3, r0
000cb570  adds    r0, r0, #0
000cb572  movs    r3, r0
000cb574  lsrs    r2, r6, #0x17
000cb576  movs    r4, r5
000cb578  adds    r0, r4, r3
000cb57a  movs    r3, r0
000cb57c  asrs    r4, r4, #0x1a
000cb57e  movs    r3, r0
000cb580  str     r6, [r2, #0x28]
000cb582  movs    r3, r1
000cb584  movs    r7, #0x50
000cb586  movs    r3, r0
000cb588  subs    r2, r2, r7
000cb58a  movs    r3, r0
000cb58c  adds    r6, r4, #7
000cb58e  movs    r3, r0
000cb590  asrs    r0, r7, #0x18
000cb592  movs    r3, r0
000cb594  str     r6, [r2, #0x24]
000cb596  movs    r3, r1
000cb598  subs    r6, r3, r6
000cb59a  movs    r3, r0
000cb59c  str     r4, [r1, #0x24]
000cb59e  movs    r3, r1
000cb5a0  lsrs    r2, r5, #0x15
000cb5a2  movs    r4, r5
000cb5a4  str     r4, [r1, #0x24]
000cb5a6  movs    r3, r1
000cb5a8  movs    r6, #0xd6
000cb5aa  movs    r3, r0
000cb5ac  asrs    r0, r2, #0x16
000cb5ae  movs    r3, r0
000cb5b0  subs    r4, r0, #4
000cb5b2  movs    r3, r0
000cb5b4  asrs    r6, r7, #0x1b
000cb5b6  movs    r3, r0
000cb5b8  str     r4, [r5, #0x20]
000cb5ba  movs    r3, r1
000cb5bc  str     r0, [r3, #0x1c]
000cb5be  movs    r3, r1
000cb5c0  str     r4, [r3, #0x20]
000cb5c2  movs    r3, r1
000cb5c4  str     r4, [r2, #0x20]
000cb5c6  movs    r3, r1
000cb5c8  movs    r2, #0x90
000cb5ca  movs    r3, r0
000cb5cc  str     r2, [r7, #0x1c]
000cb5ce  movs    r3, r1
000cb5d0  subs    r2, r4, r3
000cb5d2  movs    r3, r0
000cb5d4  str     r0, [r6, #0x1c]
000cb5d6  movs    r3, r1
000cb5d8  movs    r6, #0x2a
000cb5da  movs    r3, r0
000cb5dc  asrs    r4, r5, #0x15
000cb5de  movs    r3, r0
000cb5e0  str     r6, [r3, #0x18]
000cb5e2  movs    r3, r1
000cb5e4  str     r4, [r1, #0x14]
000cb5e6  movs    r3, r1
