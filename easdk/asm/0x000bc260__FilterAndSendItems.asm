========================================================================
FilterAndSendItems  0x000bc260  1840 bytes   EAMTX_Main.mm
========================================================================

000bc260  push    {r4, r5, r6, r7, lr}
000bc262  add     r7, sp, #0xc
000bc264  push.w  {r8, sl, fp}
000bc268  sub     sp, #0xa0
000bc26a  str     r0, [sp, #0x18]
000bc26c  ldr.w   r0, [pc, #0x5c4]
000bc270  add     r0, pc ; -> 0x0038c0c0  resultProdsList
000bc272  ldr     r0, [r0]
000bc274  cbz     r0, #0xbc282
000bc276  ldr.w   r1, [pc, #0x5c0]
000bc27a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bc27c  ldr     r1, [r1]
000bc27e  blx     #0xddbfc ; -> objc_msgSend
000bc282  ldr.w   r3, [pc, #0x5b8]
000bc286  add     r3, pc ; -> 0x0038c188  m_iItemsReturnState
000bc288  ldr     r3, [r3]
000bc28a  cmp     r3, #4
000bc28c  bhi.w   #0xbc818
000bc290  tbh     [pc, r3, lsl #1]
000bc294  lsls    r1, r0, #2
000bc296  movs    r1, r5
000bc298  movs    r6, r0
000bc29a  lsls    r0, r3, #4
000bc29c  lsls    r5, r6, #8
000bc29e  lsls    r2, r0, #0xb
000bc2a0  ldr.w   r0, [pc, #0x59c]
000bc2a4  ldr.w   r1, [pc, #0x59c]
000bc2a8  add     r0, pc ; -> 0x000fdb70  
000bc2aa  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bc2ac  ldr     r0, [r0]
000bc2ae  ldr     r1, [r1]
000bc2b0  blx     #0xddbfc ; -> objc_msgSend
000bc2b4  ldr.w   r1, [pc, #0x590]
000bc2b8  add     r1, pc ; -> 0x000fd3bc  
000bc2ba  ldr     r4, [r1]
000bc2bc  ldr.w   r1, [pc, #0x58c]
000bc2c0  add     r1, pc ; -> 0x000fd674  
000bc2c2  ldr     r1, [r1]
000bc2c4  mov     r5, r0
000bc2c6  ldr.w   r0, [pc, #0x588]
000bc2ca  add     r0, pc ; -> 0x0038c0bc  mtxProdsList
000bc2cc  ldr     r0, [r0]
000bc2ce  blx     #0xddbfc ; -> objc_msgSend
000bc2d2  mov     r1, r4
000bc2d4  mov     r2, r0
000bc2d6  mov     r0, r5
000bc2d8  blx     #0xddbfc ; -> objc_msgSend
000bc2dc  ldr.w   r3, [pc, #0x574]
000bc2e0  add     r3, pc ; -> 0x0038c0c0  resultProdsList
000bc2e2  str     r0, [r3]
000bc2e4  b       #0xbc818
000bc2e6  ldr.w   r0, [pc, #0x570]
000bc2ea  ldr.w   r1, [pc, #0x570]
000bc2ee  movs    r6, #0
000bc2f0  add     r0, pc ; -> 0x000fdb70  
000bc2f2  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bc2f4  ldr     r0, [r0]
000bc2f6  ldr     r1, [r1]
000bc2f8  blx     #0xddbfc ; -> objc_msgSend
000bc2fc  ldr.w   r1, [pc, #0x560]
000bc300  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bc302  ldr     r1, [r1]
000bc304  blx     #0xddbfc ; -> objc_msgSend
000bc308  ldr.w   r1, [pc, #0x558]
000bc30c  ldr.w   r3, [pc, #0x558]
000bc310  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000bc312  add     r3, pc ; -> 0x0038c0c0  resultProdsList
000bc314  ldr.w   sl, [r1]
000bc318  ldr.w   r1, [pc, #0x550]
000bc31c  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000bc31e  ldr.w   fp, [r1]
000bc322  ldr.w   r1, [pc, #0x54c]
000bc326  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000bc328  ldr.w   r8, [r1]
000bc32c  ldr.w   r1, [pc, #0x544]
000bc330  add     r1, pc ; -> 0x000fd638  
000bc332  ldr     r1, [r1]
000bc334  str     r1, [sp, #0x1c]
000bc336  ldr.w   r1, [pc, #0x540]
000bc33a  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000bc33c  str     r0, [r3]
000bc33e  ldr     r1, [r1]
000bc340  ldr.w   r3, [pc, #0x538]
000bc344  str     r1, [sp, #0x20]
000bc346  str     r3, [sp, #4]
000bc348  b       #0xbc384
000bc34a  ldr.w   r0, [pc, #0x534]
000bc34e  mov     r1, r8
000bc350  mov     r2, r6
000bc352  add     r0, pc ; -> 0x0038c0bc  mtxProdsList
000bc354  ldr     r5, [r0]
000bc356  ldr     r0, [r4]
000bc358  blx     #0xddbfc ; -> objc_msgSend
000bc35c  mov     r1, fp
000bc35e  mov     r2, r0
000bc360  mov     r0, r5
000bc362  blx     #0xddbfc ; -> objc_msgSend
000bc366  mov     r4, r0
000bc368  cbz     r0, #0xbc382
000bc36a  ldr     r1, [sp, #0x1c]
000bc36c  blx     #0xddbfc ; -> objc_msgSend
000bc370  cbz     r0, #0xbc382
000bc372  ldr.w   r0, [pc, #0x510]
000bc376  ldr     r1, [sp, #0x20]
000bc378  mov     r2, r4
000bc37a  add     r0, pc ; -> 0x0038c0c0  resultProdsList
000bc37c  ldr     r0, [r0]
000bc37e  blx     #0xddbfc ; -> objc_msgSend
000bc382  adds    r6, #1
000bc384  ldr     r4, [sp, #4]
000bc386  mov     r1, sl
000bc388  add     r4, pc
000bc38a  ldr     r0, [r4]
000bc38c  blx     #0xddbfc ; -> objc_msgSend
000bc390  cmp     r0, r6
000bc392  bhi     #0xbc34a
000bc394  b       #0xbc818
000bc396  ldr.w   r0, [pc, #0x4f0]
000bc39a  ldr.w   r1, [pc, #0x4f0]
000bc39e  mov.w   r8, #0
000bc3a2  add     r0, pc ; -> 0x000fdb70  
000bc3a4  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bc3a6  ldr     r0, [r0]
000bc3a8  ldr     r1, [r1]
000bc3aa  blx     #0xddbfc ; -> objc_msgSend
000bc3ae  ldr.w   r1, [pc, #0x4e0]
000bc3b2  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bc3b4  ldr     r1, [r1]
000bc3b6  blx     #0xddbfc ; -> objc_msgSend
000bc3ba  ldr.w   r1, [pc, #0x4d8]
000bc3be  ldr.w   r3, [pc, #0x4d8]
000bc3c2  ldr.w   r2, [pc, #0x4d8]
000bc3c6  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000bc3c8  add     r3, pc ; -> 0x0038c0c0  resultProdsList
000bc3ca  ldr.w   fp, [r1]
000bc3ce  ldr.w   r1, [pc, #0x4d0]
000bc3d2  add     r2, pc ; -> 0x000fcdc8  
000bc3d4  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000bc3d6  ldr     r2, [r2]
000bc3d8  ldr     r1, [r1]
000bc3da  str     r2, [sp, #0x30]
000bc3dc  str     r1, [sp, #0x88]
000bc3de  ldr.w   r1, [pc, #0x4c4]
000bc3e2  ldr.w   r2, [pc, #0x4c4]
000bc3e6  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000bc3e8  ldr     r1, [r1]
000bc3ea  str     r1, [sp, #0x7c]
000bc3ec  ldr.w   r1, [pc, #0x4bc]
000bc3f0  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bc3f2  ldr     r1, [r1]
000bc3f4  str     r0, [r3]
000bc3f6  ldr.w   r0, [pc, #0x4b8]
000bc3fa  str     r2, [sp, #0x10]
000bc3fc  str     r1, [sp, #0x28]
000bc3fe  ldr.w   r1, [pc, #0x4b4]
000bc402  add     r0, pc ; -> 0x000fdb5c  
000bc404  add     r1, pc ; -> 0x000fd3c8  
000bc406  ldr     r0, [r0]
000bc408  ldr.w   sl, [r1]
000bc40c  ldr.w   r1, [pc, #0x4a8]
000bc410  str     r0, [sp, #0x24]
000bc412  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000bc414  ldr     r1, [r1]
000bc416  str     r1, [sp, #0x2c]
000bc418  ldr.w   r1, [pc, #0x4a0]
000bc41c  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000bc41e  ldr     r1, [r1]
000bc420  str     r1, [sp, #0x60]
000bc422  b       #0xbc4aa
000bc424  ldr.w   r0, [pc, #0x498]
000bc428  ldr     r1, [sp, #0x7c]
000bc42a  mov     r2, r8
000bc42c  add     r0, pc ; -> 0x0038c0bc  mtxProdsList
000bc42e  ldr     r5, [r0]
000bc430  ldr     r0, [r4]
000bc432  blx     #0xddbfc ; -> objc_msgSend
000bc436  ldr     r1, [sp, #0x88]
000bc438  mov     r2, r0
000bc43a  mov     r0, r5
000bc43c  blx     #0xddbfc ; -> objc_msgSend
000bc440  mov     r5, r0
000bc442  cmp     r0, #0
000bc444  beq     #0xbc4a6
000bc446  mov     r1, sl
000bc448  blx     #0xddbfc ; -> objc_msgSend
000bc44c  ldr.w   r6, [pc, #0x474]
000bc450  ldr.w   r4, [pc, #0x474]
000bc454  ldr     r1, [sp, #0x28]
000bc456  add     r6, pc ; -> 0x0038c164  categoryName
000bc458  add     r4, pc ; -> 0x001805d4  
000bc45a  ldr     r2, [r6]
000bc45c  str     r2, [sp]
000bc45e  mov     r2, r4
000bc460  mov     r3, r0
000bc462  ldr     r0, [sp, #0x24]
000bc464  blx     #0xddbfc ; -> objc_msgSend
000bc468  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bc46c  ldr     r0, [r6]
000bc46e  ldr     r1, [sp, #0x2c]
000bc470  blx     #0xddbfc ; -> objc_msgSend
000bc474  cbz     r0, #0xbc496
000bc476  mov     r1, sl
000bc478  mov     r0, r5
000bc47a  blx     #0xddbfc ; -> objc_msgSend
000bc47e  ldr     r3, [r6]
000bc480  ldr     r2, [sp, #0x30]
000bc482  mov     r1, r0
000bc484  add     r0, sp, #0x98
000bc486  blx     #0xddc14 ; -> objc_msgSend_stret
000bc48a  add     r2, sp, #0x98
000bc48c  ldm     r2, {r2, r3}
000bc48e  mvn     r1, #0x80000000
000bc492  cmp     r2, r1
000bc494  beq     #0xbc4a6
000bc496  ldr.w   r0, [pc, #0x434]
000bc49a  ldr     r1, [sp, #0x60]
000bc49c  mov     r2, r5
000bc49e  add     r0, pc ; -> 0x0038c0c0  resultProdsList
000bc4a0  ldr     r0, [r0]
000bc4a2  blx     #0xddbfc ; -> objc_msgSend
000bc4a6  add.w   r8, r8, #1
000bc4aa  ldr     r4, [sp, #0x10]
000bc4ac  mov     r1, fp
000bc4ae  add     r4, pc
000bc4b0  ldr     r0, [r4]
000bc4b2  blx     #0xddbfc ; -> objc_msgSend
000bc4b6  cmp     r0, r8
000bc4b8  bhi     #0xbc424
000bc4ba  ldr.w   r0, [pc, #0x414]
000bc4be  add     r0, pc ; -> 0x0038c0c0  resultProdsList
000bc4c0  ldr     r0, [r0]
000bc4c2  b       #0xbc6f8
000bc4c4  ldr.w   r0, [pc, #0x40c]
000bc4c8  ldr.w   r1, [pc, #0x40c]
000bc4cc  add     r0, pc ; -> 0x000fdb70  
000bc4ce  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bc4d0  ldr     r0, [r0]
000bc4d2  ldr     r1, [r1]
000bc4d4  blx     #0xddbfc ; -> objc_msgSend
000bc4d8  ldr.w   r1, [pc, #0x400]
000bc4dc  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bc4de  ldr     r1, [r1]
000bc4e0  blx     #0xddbfc ; -> objc_msgSend
000bc4e4  ldr     r1, [pc, #0x3f8]
000bc4e6  ldr     r3, [pc, #0x3fc]
000bc4e8  ldr     r2, [pc, #0x3fc]
000bc4ea  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000bc4ec  add     r3, pc ; -> 0x0038c0c0  resultProdsList
000bc4ee  ldr     r1, [r1]
000bc4f0  str     r1, [sp, #0x94]
000bc4f2  ldr     r1, [pc, #0x3f8]
000bc4f4  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000bc4f6  ldr     r1, [r1]
000bc4f8  str     r1, [sp, #0x8c]
000bc4fa  ldr     r1, [pc, #0x3f4]
000bc4fc  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000bc4fe  ldr     r1, [r1]
000bc500  str     r1, [sp, #0x80]
000bc502  ldr     r1, [pc, #0x3f0]
000bc504  str     r0, [r3]
000bc506  movs    r3, #0
000bc508  add     r1, pc ; -> 0x000fd3c0  
000bc50a  str     r3, [sp, #0x54]
000bc50c  ldr.w   sl, [r1]
000bc510  ldr     r1, [pc, #0x3e4]
000bc512  str     r2, [sp, #8]
000bc514  add     r1, pc ; -> 0x000fd16c  
000bc516  ldr.w   fp, [r1]
000bc51a  ldr     r1, [pc, #0x3e0]
000bc51c  add     r1, pc ; -> 0x000fd3b8  
000bc51e  ldr     r1, [r1]
000bc520  str     r1, [sp, #0x34]
000bc522  ldr     r1, [pc, #0x3dc]
000bc524  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000bc526  ldr     r1, [r1]
000bc528  str     r1, [sp, #0x64]
000bc52a  b       #0xbc5c6
000bc52c  ldr     r0, [pc, #0x3d4]
000bc52e  ldr     r1, [sp, #0x80]
000bc530  ldr     r2, [sp, #0x54]
000bc532  add     r0, pc ; -> 0x0038c0bc  mtxProdsList
000bc534  ldr     r5, [r0]
000bc536  ldr     r0, [r4]
000bc538  blx     #0xddbfc ; -> objc_msgSend
000bc53c  ldr     r1, [sp, #0x8c]
000bc53e  mov     r2, r0
000bc540  mov     r0, r5
000bc542  blx     #0xddbfc ; -> objc_msgSend
000bc546  mov     r6, r0
000bc548  cbnz    r0, #0xbc580
000bc54a  b       #0xbc5c0
000bc54c  ldr     r0, [r4]
000bc54e  ldr     r1, [sp, #0x80]
000bc550  mov     r2, r5
000bc552  blx     #0xddbfc ; -> objc_msgSend
000bc556  cmp     r0, #0
000bc558  beq.w   #0xbc830
000bc55c  mov     r1, sl
000bc55e  blx     #0xddbfc ; -> objc_msgSend
000bc562  mov     r1, sl
000bc564  mov     r4, r0
000bc566  mov     r0, r6
000bc568  blx     #0xddbfc ; -> objc_msgSend
000bc56c  mov     r1, fp
000bc56e  mov     r2, r0
000bc570  mov     r0, r4
000bc572  blx     #0xddbfc ; -> objc_msgSend
000bc576  cmp.w   r0, #-1
000bc57a  bne.w   #0xbc830
000bc57e  b       #0xbc596
000bc580  ldr.w   r8, [pc, #0x384]
000bc584  movs    r5, #0
000bc586  mov     r4, r8
000bc588  add     r4, pc
000bc58a  ldr     r1, [sp, #0x94]
000bc58c  ldr     r0, [r4]
000bc58e  blx     #0xddbfc ; -> objc_msgSend
000bc592  cmp     r0, r5
000bc594  bhi     #0xbc54c
000bc596  ldr     r4, [pc, #0x374]
000bc598  ldr     r1, [sp, #0x94]
000bc59a  add     r4, pc ; -> 0x0038c0c0  resultProdsList
000bc59c  ldr     r0, [r4]
000bc59e  blx     #0xddbfc ; -> objc_msgSend
000bc5a2  cbz     r0, #0xbc5b2
000bc5a4  ldr     r0, [r4]
000bc5a6  ldr     r1, [sp, #0x34]
000bc5a8  mov     r2, r6
000bc5aa  mov     r3, r5
000bc5ac  blx     #0xddbfc ; -> objc_msgSend
000bc5b0  b       #0xbc5c0
000bc5b2  ldr     r0, [pc, #0x35c]
000bc5b4  ldr     r1, [sp, #0x64]
000bc5b6  mov     r2, r6
000bc5b8  add     r0, pc ; -> 0x0038c0c0  resultProdsList
000bc5ba  ldr     r0, [r0]
000bc5bc  blx     #0xddbfc ; -> objc_msgSend
000bc5c0  ldr     r3, [sp, #0x54]
000bc5c2  adds    r3, #1
000bc5c4  str     r3, [sp, #0x54]
000bc5c6  ldr     r4, [sp, #8]
000bc5c8  ldr     r1, [sp, #0x94]
000bc5ca  add     r4, pc
000bc5cc  ldr     r0, [r4]
000bc5ce  blx     #0xddbfc ; -> objc_msgSend
000bc5d2  ldr     r2, [sp, #0x54]
000bc5d4  cmp     r0, r2
000bc5d6  bhi     #0xbc52c
000bc5d8  ldr.w   r4, [pc, #0x338]
000bc5dc  ldr     r1, [sp, #0x94]
000bc5de  add     r4, pc ; -> 0x0038c0c0  resultProdsList
000bc5e0  ldr     r0, [r4]
000bc5e2  blx     #0xddbfc ; -> objc_msgSend
000bc5e6  cmp     r0, #0xa
000bc5e8  bls     #0xbc60e
000bc5ea  ldr     r1, [pc, #0x32c]
000bc5ec  ldr     r4, [r4]
000bc5ee  mov.w   sl, #0xa
000bc5f2  add     r1, pc ; -> 0x000fd3b4  
000bc5f4  mov     r0, r4
000bc5f6  ldr     r5, [r1]
000bc5f8  ldr     r1, [sp, #0x94]
000bc5fa  blx     #0xddbfc ; -> objc_msgSend
000bc5fe  mov     r2, sl
000bc600  mov     r1, r5
000bc602  sub.w   fp, r0, #0xa
000bc606  mov     r0, r4
000bc608  mov     r3, fp
000bc60a  blx     #0xddbfc ; -> objc_msgSend
000bc60e  ldr     r1, [pc, #0x30c]
000bc610  ldr     r0, [pc, #0x30c]
000bc612  ldr     r2, [pc, #0x310]
000bc614  add     r1, pc ; -> 0x000fd6e0  
000bc616  add     r0, pc ; -> 0x000fdb5c  
000bc618  ldr     r1, [r1]
000bc61a  ldr     r0, [r0]
000bc61c  movs    r3, #0
000bc61e  str     r2, [sp, #0x14]
000bc620  str     r1, [sp, #0x3c]
000bc622  ldr     r1, [pc, #0x304]
000bc624  str     r0, [sp, #0x40]
000bc626  str     r3, [sp, #0x58]
000bc628  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bc62a  ldr     r1, [r1]
000bc62c  str     r1, [sp, #0x74]
000bc62e  ldr     r1, [pc, #0x2fc]
000bc630  add     r1, pc ; -> 0x000fd3d8  
000bc632  ldr     r1, [r1]
000bc634  str     r1, [sp, #0x44]
000bc636  ldr     r1, [pc, #0x2f8]
000bc638  add     r1, pc ; -> 0x000fcf2c  
000bc63a  ldr     r1, [r1]
000bc63c  str     r1, [sp, #0x48]
000bc63e  b       #0xbc6e4
000bc640  ldr     r0, [r4]
000bc642  ldr     r1, [sp, #0x80]
000bc644  ldr     r2, [sp, #0x58]
000bc646  blx     #0xddbfc ; -> objc_msgSend
000bc64a  ldr     r3, [sp, #0x58]
000bc64c  subs    r6, r3, #1
000bc64e  str     r3, [sp, #0x5c]
000bc650  str     r0, [sp, #0x38]
000bc652  b       #0xbc6d8
000bc654  ldr.w   sl, [pc, #0x2dc]
000bc658  mov     r2, r6
000bc65a  ldr     r1, [sp, #0x80]
000bc65c  add     sl, pc ; -> 0x0038c0c0  resultProdsList
000bc65e  ldr     r4, [pc, #0x2d8]
000bc660  ldr.w   r0, [sl]
000bc664  blx     #0xddbfc ; -> objc_msgSend
000bc668  add     r4, pc ; -> 0x0038c0d4  prodSellIds
000bc66a  ldr     r1, [sp, #0x44]
000bc66c  ldr.w   r8, [r4]
000bc670  ldr     r5, [pc, #0x2c8]
000bc672  add     r5, pc ; -> 0x0017e5c4  
000bc674  mov     fp, r0
000bc676  ldr     r0, [sp, #0x38]
000bc678  blx     #0xddbfc ; -> objc_msgSend
000bc67c  ldr     r1, [sp, #0x74]
000bc67e  mov     r2, r5
000bc680  mov     r3, r0
000bc682  ldr     r0, [sp, #0x40]
000bc684  blx     #0xddbfc ; -> objc_msgSend
000bc688  ldr     r1, [sp, #0x3c]
000bc68a  mov     r2, r0
000bc68c  mov     r0, r8
000bc68e  blx     #0xddbfc ; -> objc_msgSend
000bc692  ldr     r1, [sp, #0x44]
000bc694  ldr     r4, [r4]
000bc696  mov     r8, r0
000bc698  mov     r0, fp
000bc69a  blx     #0xddbfc ; -> objc_msgSend
000bc69e  ldr     r1, [sp, #0x74]
000bc6a0  mov     r2, r5
000bc6a2  mov     r3, r0
000bc6a4  ldr     r0, [sp, #0x40]
000bc6a6  blx     #0xddbfc ; -> objc_msgSend
000bc6aa  ldr     r1, [sp, #0x3c]
000bc6ac  mov     r2, r0
000bc6ae  mov     r0, r4
000bc6b0  blx     #0xddbfc ; -> objc_msgSend
000bc6b4  cmp     r8, r0
000bc6b6  bhs     #0xbc6d6
000bc6b8  ldr.w   r0, [sl]
000bc6bc  ldr     r1, [sp, #0x48]
000bc6be  mov     r2, r6
000bc6c0  ldr     r3, [sp, #0x38]
000bc6c2  blx     #0xddbfc ; -> objc_msgSend
000bc6c6  ldr.w   r0, [sl]
000bc6ca  ldr     r1, [sp, #0x48]
000bc6cc  ldr     r2, [sp, #0x5c]
000bc6ce  mov     r3, fp
000bc6d0  blx     #0xddbfc ; -> objc_msgSend
000bc6d4  str     r6, [sp, #0x5c]
000bc6d6  subs    r6, #1
000bc6d8  cmp.w   r6, #-1
000bc6dc  bne     #0xbc654
000bc6de  ldr     r2, [sp, #0x58]
000bc6e0  adds    r2, #1
000bc6e2  str     r2, [sp, #0x58]
000bc6e4  ldr     r4, [sp, #0x14]
000bc6e6  ldr     r1, [sp, #0x94]
000bc6e8  add     r4, pc
000bc6ea  ldr     r0, [r4]
000bc6ec  blx     #0xddbfc ; -> objc_msgSend
000bc6f0  ldr     r3, [sp, #0x58]
000bc6f2  cmp     r0, r3
000bc6f4  bhi     #0xbc640
000bc6f6  ldr     r0, [r4]
000bc6f8  bl      #0xb574c ; -> Z17SetBadgesForItemsP14NSMutableArray
000bc6fc  b       #0xbc818
000bc6fe  ldr     r0, [pc, #0x240]
000bc700  ldr     r1, [pc, #0x240]
000bc702  mov.w   r8, #0
000bc706  add     r0, pc ; -> 0x000fdb70  
000bc708  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bc70a  ldr     r0, [r0]
000bc70c  ldr     r1, [r1]
000bc70e  blx     #0xddbfc ; -> objc_msgSend
000bc712  ldr.w   r1, [pc, #0x234]
000bc716  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bc718  ldr     r1, [r1]
000bc71a  blx     #0xddbfc ; -> objc_msgSend
000bc71e  ldr     r1, [pc, #0x22c]
000bc720  ldr     r3, [pc, #0x22c]
000bc722  ldr     r2, [pc, #0x230]
000bc724  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000bc726  add     r3, pc ; -> 0x0038c0c0  resultProdsList
000bc728  ldr.w   sl, [r1]
000bc72c  ldr     r1, [pc, #0x228]
000bc72e  add     r2, pc ; -> 0x000fcdc8  
000bc730  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000bc732  ldr     r2, [r2]
000bc734  ldr     r1, [r1]
000bc736  str     r2, [sp, #0x6c]
000bc738  str     r1, [sp, #0x90]
000bc73a  ldr     r1, [pc, #0x220]
000bc73c  ldr     r2, [pc, #0x220]
000bc73e  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000bc740  ldr     r1, [r1]
000bc742  str     r1, [sp, #0x84]
000bc744  ldr     r1, [pc, #0x21c]
000bc746  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bc748  ldr     r1, [r1]
000bc74a  str     r0, [r3]
000bc74c  ldr     r0, [pc, #0x218]
000bc74e  str     r2, [sp, #0xc]
000bc750  str     r1, [sp, #0x78]
000bc752  ldr     r1, [pc, #0x218]
000bc754  add     r0, pc ; -> 0x000fdb5c  
000bc756  add     r1, pc ; -> 0x000fd3c8  
000bc758  ldr     r0, [r0]
000bc75a  ldr     r1, [r1]
000bc75c  str     r0, [sp, #0x4c]
000bc75e  str     r1, [sp, #0x70]
000bc760  ldr     r1, [pc, #0x20c]
000bc762  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000bc764  ldr.w   fp, [r1]
000bc768  ldr     r1, [pc, #0x208]
000bc76a  add     r1, pc ; -> 0x000fd3d4  
000bc76c  ldr     r1, [r1]
000bc76e  str     r1, [sp, #0x50]
000bc770  ldr     r1, [pc, #0x204]
000bc772  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000bc774  ldr     r1, [r1]
000bc776  str     r1, [sp, #0x68]
000bc778  b       #0xbc808
000bc77a  ldr     r0, [pc, #0x200]
000bc77c  ldr     r1, [sp, #0x84]
000bc77e  mov     r2, r8
000bc780  add     r0, pc ; -> 0x0038c0bc  mtxProdsList
000bc782  ldr     r5, [r0]
000bc784  ldr     r0, [r4]
000bc786  blx     #0xddbfc ; -> objc_msgSend
000bc78a  ldr     r1, [sp, #0x90]
000bc78c  mov     r2, r0
000bc78e  mov     r0, r5
000bc790  blx     #0xddbfc ; -> objc_msgSend
000bc794  mov     r5, r0
000bc796  cmp     r0, #0
000bc798  beq     #0xbc804
000bc79a  ldr     r1, [sp, #0x70]
000bc79c  blx     #0xddbfc ; -> objc_msgSend
000bc7a0  ldr     r6, [pc, #0x1dc]
000bc7a2  ldr     r4, [pc, #0x1e0]
000bc7a4  ldr     r1, [sp, #0x78]
000bc7a6  add     r6, pc ; -> 0x0038c100  searchStr
000bc7a8  add     r4, pc ; -> 0x001805d4  
000bc7aa  ldr     r2, [r6]
000bc7ac  str     r2, [sp]
000bc7ae  mov     r2, r4
000bc7b0  mov     r3, r0
000bc7b2  ldr     r0, [sp, #0x4c]
000bc7b4  blx     #0xddbfc ; -> objc_msgSend
000bc7b8  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bc7bc  ldr     r0, [r6]
000bc7be  mov     r1, fp
000bc7c0  blx     #0xddbfc ; -> objc_msgSend
000bc7c4  cbz     r0, #0xbc7f6
000bc7c6  ldr     r1, [sp, #0x50]
000bc7c8  mov     r0, r5
000bc7ca  blx     #0xddbfc ; -> objc_msgSend
000bc7ce  mov     r1, fp
000bc7d0  blx     #0xddbfc ; -> objc_msgSend
000bc7d4  cbz     r0, #0xbc7f6
000bc7d6  ldr     r1, [sp, #0x50]
000bc7d8  mov     r0, r5
000bc7da  blx     #0xddbfc ; -> objc_msgSend
000bc7de  ldr     r3, [r6]
000bc7e0  ldr     r2, [sp, #0x6c]
000bc7e2  mov     r1, r0
000bc7e4  add     r0, sp, #0x98
000bc7e6  blx     #0xddc14 ; -> objc_msgSend_stret
000bc7ea  add     r2, sp, #0x98
000bc7ec  ldm     r2, {r2, r3}
000bc7ee  mvn     r1, #0x80000000
000bc7f2  cmp     r2, r1
000bc7f4  beq     #0xbc804
000bc7f6  ldr     r0, [pc, #0x190]
000bc7f8  ldr     r1, [sp, #0x68]
000bc7fa  mov     r2, r5
000bc7fc  add     r0, pc ; -> 0x0038c0c0  resultProdsList
000bc7fe  ldr     r0, [r0]
000bc800  blx     #0xddbfc ; -> objc_msgSend
000bc804  add.w   r8, r8, #1
000bc808  ldr     r4, [sp, #0xc]
000bc80a  mov     r1, sl
000bc80c  add     r4, pc
000bc80e  ldr     r0, [r4]
000bc810  blx     #0xddbfc ; -> objc_msgSend
000bc814  cmp     r0, r8
000bc816  bhi     #0xbc77a
000bc818  ldr     r2, [pc, #0x170]
000bc81a  movs    r0, #7
000bc81c  ldr     r1, [sp, #0x18]
000bc81e  add     r2, pc ; -> 0x0038c0c0  resultProdsList
000bc820  ldr     r2, [r2]
000bc822  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bc826  sub.w   sp, r7, #0x18
000bc82a  pop.w   {r8, sl, fp}
000bc82e  pop     {r4, r5, r6, r7, pc}
000bc830  adds    r5, #1
000bc832  b       #0xbc586
000bc834  cdp2    p0, #4, c0, c12, c12, #1
000bc838  lsls    r6, r7, #0x1b
000bc83a  movs    r4, r0
000bc83c  cdp2    p0, #0xf, c0, c14, c12, #1
000bc840  adds    r4, r0, r3
000bc842  movs    r4, r0
000bc844  lsls    r6, r2, #0x1b
000bc846  movs    r4, r0
000bc848  asrs    r0, r0, #4
000bc84a  movs    r4, r0
000bc84c  asrs    r0, r6, #0xe
000bc84e  movs    r4, r0
000bc850  stc2l   p0, c0, [lr, #0xb0]!
000bc854  ldc2l   p0, c0, [ip, #0xb0]
000bc858  adds    r4, r7, r1
000bc85a  movs    r4, r0
000bc85c  lsls    r6, r1, #0x1a
000bc85e  movs    r4, r0
000bc860  lsls    r4, r7, #0x19
000bc862  movs    r4, r0
000bc864  lsls    r4, r5, #0x1d
000bc866  movs    r4, r0
000bc868  stc2    p0, c0, [sl, #0xb0]!
000bc86c  lsls    r0, r2, #0x1f
000bc86e  movs    r4, r0
000bc870  lsls    r2, r2, #0x1d
000bc872  movs    r4, r0
000bc874  asrs    r4, r0, #0xc
000bc876  movs    r4, r0
000bc878  lsls    r6, r0, #0x1d
000bc87a  movs    r4, r0
000bc87c  stc2l   p0, c0, [r8, #-0xb0]
000bc880  stc2l   p0, c0, [r6, #-0xb0]!
000bc884  stc2l   p0, c0, [r2, #-0xb0]
000bc888  asrs    r2, r1, #0x1f
000bc88a  movs    r4, r0
000bc88c  lsls    r4, r3, #0x17
000bc88e  movs    r4, r0
000bc890  lsls    r2, r1, #0x17
000bc892  movs    r4, r0
000bc894  lsls    r6, r6, #0x1a
000bc896  movs    r4, r0
000bc898  ldc2l   p0, c0, [r4], #0xb0
000bc89c  lsrs    r2, r6, #7
000bc89e  movs    r4, r0
000bc8a0  lsls    r0, r3, #0x1c
000bc8a2  movs    r4, r0
000bc8a4  lsls    r2, r2, #0x1a
000bc8a6  movs    r4, r0
000bc8a8  stc2    p0, c0, [r2], #-0xb0
000bc8ac  lsls    r4, r5, #0x1a
000bc8ae  movs    r4, r0
000bc8b0  asrs    r6, r2, #0x1d
000bc8b2  movs    r4, r0
000bc8b4  lsrs    r0, r0, #0x1f
000bc8b6  movs    r4, r0
000bc8b8  lsls    r2, r4, #0x19
000bc8ba  movs    r4, r0
000bc8bc  lsls    r4, r4, #0x19
000bc8be  movs    r4, r0
000bc8c0  stc2    p0, c0, [ip], {0x2c}
000bc8c4  stc2    p0, c0, [sl, #-0xb0]
000bc8c8  adcs    r0, r7
000bc8ca  movs    r4, r1
