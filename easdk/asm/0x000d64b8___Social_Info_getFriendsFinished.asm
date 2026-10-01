========================================================================
-[Social_Info getFriendsFinished  0x000d64b8  796 bytes   Social_Info.mm
========================================================================

000d64b8  push    {r4, r5, r6, r7, lr}
000d64ba  add     r7, sp, #0xc
000d64bc  push.w  {r8, sl, fp}
000d64c0  sub     sp, #0xf4
000d64c2  ldr     r4, [pc, #0x288]
000d64c4  str     r0, [sp, #8]
000d64c6  ldr     r1, [sp, #8]
000d64c8  add     r4, pc ; -> 0x000fae74  OBJC_IVAR_$_Social_Info.friendsLastUpdatedTime
000d64ca  str     r2, [sp, #4]
000d64cc  ldr     r0, [r4]
000d64ce  ldr     r0, [r1, r0]
000d64d0  cbz     r0, #0xd64e4
000d64d2  ldr     r1, [pc, #0x27c]
000d64d4  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d64d6  ldr     r1, [r1]
000d64d8  blx     #0xddbfc ; -> objc_msgSend
000d64dc  ldr     r3, [r4]
000d64de  ldr     r1, [sp, #8]
000d64e0  movs    r2, #0
000d64e2  str     r2, [r1, r3]
000d64e4  ldr     r0, [pc, #0x26c]
000d64e6  ldr     r1, [pc, #0x270]
000d64e8  ldr     r3, [pc, #0x270]
000d64ea  add     r0, pc ; -> 0x000fdbb4  
000d64ec  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000d64ee  add     r3, pc ; -> 0x000fae74  OBJC_IVAR_$_Social_Info.friendsLastUpdatedTime
000d64f0  ldr     r1, [r1]
000d64f2  ldr     r0, [r0]
000d64f4  ldr     r4, [r3]
000d64f6  blx     #0xddbfc ; -> objc_msgSend
000d64fa  ldr     r1, [pc, #0x264]
000d64fc  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000d64fe  ldr     r1, [r1]
000d6500  blx     #0xddbfc ; -> objc_msgSend
000d6504  ldr     r1, [pc, #0x25c]
000d6506  ldr     r2, [sp, #8]
000d6508  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d650a  ldr     r1, [r1]
000d650c  str     r0, [r2, r4]
000d650e  ldr     r0, [pc, #0x258]
000d6510  str     r1, [sp, #0x10]
000d6512  ldr     r1, [pc, #0x258]
000d6514  add     r0, pc ; -> 0x000fdb5c  
000d6516  ldr     r4, [pc, #0x258]
000d6518  ldr     r0, [r0]
000d651a  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000d651c  add     r4, pc ; -> 0x00181c24  
000d651e  ldr     r1, [r1]
000d6520  str     r0, [sp, #0xc]
000d6522  ldr     r0, [sp, #4]
000d6524  blx     #0xddbfc ; -> objc_msgSend
000d6528  ldr     r1, [sp, #4]
000d652a  mov     r2, r4
000d652c  str     r1, [sp]
000d652e  ldr     r1, [sp, #0x10]
000d6530  mov     r3, r0
000d6532  ldr     r0, [sp, #0xc]
000d6534  blx     #0xddbfc ; -> objc_msgSend
000d6538  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d653c  ldr     r1, [pc, #0x234]
000d653e  ldr     r0, [pc, #0x238]
000d6540  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d6542  add     r0, pc ; -> 0x000fdb70  
000d6544  ldr     r1, [r1]
000d6546  ldr     r0, [r0]
000d6548  str     r1, [sp, #0x14]
000d654a  blx     #0xddbfc ; -> objc_msgSend
000d654e  ldr     r1, [pc, #0x22c]
000d6550  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d6552  ldr     r1, [r1]
000d6554  blx     #0xddbfc ; -> objc_msgSend
000d6558  ldr     r1, [pc, #0x224]
000d655a  movs    r3, #0
000d655c  add     r2, sp, #0xd4
000d655e  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000d6560  str     r3, [sp, #0xd4]
000d6562  ldr     r1, [r1]
000d6564  str     r3, [sp, #0xd8]
000d6566  str     r3, [sp, #0xdc]
000d6568  str     r3, [sp, #0xe0]
000d656a  str     r3, [sp, #0xe4]
000d656c  str     r3, [sp, #0xe8]
000d656e  str     r3, [sp, #0xec]
000d6570  str     r3, [sp, #0xf0]
000d6572  adds    r3, #0x10
000d6574  str     r3, [sp]
000d6576  add     r3, sp, #0x74
000d6578  str     r1, [sp, #0x18]
000d657a  mov     fp, r0
000d657c  ldr     r0, [sp, #4]
000d657e  blx     #0xddbfc ; -> objc_msgSend
000d6582  mov     r6, r0
000d6584  cmp     r0, #0
000d6586  beq     #0xd660c
000d6588  ldr     r1, [pc, #0x1f8]
000d658a  ldr     r3, [sp, #0xdc]
000d658c  ldr     r0, [pc, #0x1f8]
000d658e  add     r1, pc ; -> 0x000fd294  
000d6590  ldr     r1, [r1]
000d6592  ldr     r2, [r3]
000d6594  add     r0, pc ; -> 0x000fdca8  
000d6596  str     r1, [sp, #0x20]
000d6598  ldr     r1, [pc, #0x1f0]
000d659a  ldr     r0, [r0]
000d659c  str     r2, [sp, #0x30]
000d659e  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000d65a0  ldr.w   sl, [r1]
000d65a4  ldr     r1, [pc, #0x1e8]
000d65a6  str     r0, [sp, #0x1c]
000d65a8  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d65aa  ldr.w   r8, [r1]
000d65ae  b       #0xd65b2
000d65b0  ldr     r3, [sp, #0xdc]
000d65b2  movs    r5, #0
000d65b4  b       #0xd65b8
000d65b6  ldr     r3, [sp, #0xdc]
000d65b8  ldr     r3, [r3]
000d65ba  ldr     r1, [sp, #0x30]
000d65bc  cmp     r3, r1
000d65be  beq     #0xd65c6
000d65c0  ldr     r0, [sp, #4]
000d65c2  blx     #0xddbe4 ; -> objc_enumerationMutation
000d65c6  ldr     r2, [sp, #0xd8]
000d65c8  ldr     r1, [sp, #0x14]
000d65ca  ldr     r0, [sp, #0x1c]
000d65cc  ldr.w   r4, [r2, r5, lsl #2]
000d65d0  blx     #0xddbfc ; -> objc_msgSend
000d65d4  ldr     r1, [sp, #0x20]
000d65d6  adds    r5, #1
000d65d8  mov     r2, r4
000d65da  blx     #0xddbfc ; -> objc_msgSend
000d65de  mov     r1, sl
000d65e0  mov     r4, r0
000d65e2  mov     r2, r4
000d65e4  mov     r0, fp
000d65e6  blx     #0xddbfc ; -> objc_msgSend
000d65ea  mov     r0, r4
000d65ec  mov     r1, r8
000d65ee  blx     #0xddbfc ; -> objc_msgSend
000d65f2  cmp     r6, r5
000d65f4  bhi     #0xd65b6
000d65f6  movs    r3, #0x10
000d65f8  ldr     r0, [sp, #4]
000d65fa  str     r3, [sp]
000d65fc  ldr     r1, [sp, #0x18]
000d65fe  add     r2, sp, #0xd4
000d6600  add     r3, sp, #0x74
000d6602  blx     #0xddbfc ; -> objc_msgSend
000d6606  mov     r6, r0
000d6608  cmp     r0, #0
000d660a  bne     #0xd65b0
000d660c  ldr     r0, [pc, #0x184]
000d660e  ldr     r1, [pc, #0x188]
000d6610  mov     r2, fp
000d6612  add     r0, pc ; -> 0x000fdc14  
000d6614  add     r1, pc ; -> 0x000fd298  
000d6616  ldr     r0, [r0]
000d6618  ldr     r1, [r1]
000d661a  blx     #0xddbfc ; -> objc_msgSend
000d661e  ldr     r1, [pc, #0x17c]
000d6620  add     r1, pc ; -> 0x000fd308  
000d6622  ldr     r1, [r1]
000d6624  mov     r2, r0
000d6626  ldr     r0, [sp, #8]
000d6628  blx     #0xddbfc ; -> objc_msgSend
000d662c  ldr     r1, [pc, #0x170]
000d662e  mov     r0, fp
000d6630  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d6632  ldr     r1, [r1]
000d6634  blx     #0xddbfc ; -> objc_msgSend
000d6638  movs    r3, #0
000d663a  str     r3, [sp, #0xb4]
000d663c  str     r3, [sp, #0xb8]
000d663e  str     r3, [sp, #0xbc]
000d6640  str     r3, [sp, #0xc0]
000d6642  str     r3, [sp, #0xc4]
000d6644  str     r3, [sp, #0xc8]
000d6646  str     r3, [sp, #0xcc]
000d6648  str     r3, [sp, #0xd0]
000d664a  ldr     r3, [pc, #0x158]
000d664c  ldr     r2, [pc, #0x158]
000d664e  ldr     r1, [sp, #0x18]
000d6650  add     r3, pc ; -> 0x000fae78  OBJC_IVAR_$_Social_Info.friendsArray
000d6652  add     r2, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000d6654  ldr     r0, [r3]
000d6656  ldr     r3, [sp, #8]
000d6658  str     r2, [sp, #0x2c]
000d665a  add     r2, sp, #0xb4
000d665c  ldr     r0, [r3, r0]
000d665e  movs    r3, #0x10
000d6660  str     r3, [sp]
000d6662  add     r3, sp, #0x34
000d6664  str     r0, [sp, #0x24]
000d6666  blx     #0xddbfc ; -> objc_msgSend
000d666a  cmp     r0, #0
000d666c  beq     #0xd66ec
000d666e  ldr     r1, [pc, #0x13c]
000d6670  ldr     r3, [sp, #0xbc]
000d6672  mov     r8, r0
000d6674  add     r1, pc ; -> 0x000fd348  
000d6676  ldr.w   sl, [r1]
000d667a  ldr     r1, [pc, #0x134]
000d667c  ldr.w   fp, [r3]
000d6680  add     r1, pc ; -> 0x000fd530  
000d6682  ldr     r1, [r1]
000d6684  str     r1, [sp, #0x28]
000d6686  b       #0xd668a
000d6688  ldr     r3, [sp, #0xbc]
000d668a  movs    r5, #0
000d668c  b       #0xd6690
000d668e  ldr     r3, [sp, #0xbc]
000d6690  ldr     r3, [r3]
000d6692  cmp     r3, fp
000d6694  beq     #0xd66a4
000d6696  ldr     r3, [pc, #0x11c]
000d6698  ldr     r1, [sp, #8]
000d669a  add     r3, pc ; -> 0x000fae78  OBJC_IVAR_$_Social_Info.friendsArray
000d669c  ldr     r3, [r3]
000d669e  ldr     r0, [r1, r3]
000d66a0  blx     #0xddbe4 ; -> objc_enumerationMutation
000d66a4  ldr     r0, [sp, #0xb8]
000d66a6  mov     r1, sl
000d66a8  ldr.w   r4, [r0, r5, lsl #2]
000d66ac  mov     r0, r4
000d66ae  blx     #0xddbfc ; -> objc_msgSend
000d66b2  cbz     r0, #0xd66d0
000d66b4  ldr     r1, [sp, #0x28]
000d66b6  mov     r0, r4
000d66b8  blx     #0xddbfc ; -> objc_msgSend
000d66bc  ldr     r6, [pc, #0xf8]
000d66be  ldr     r1, [sp, #0x10]
000d66c0  ldr     r3, [sp, #0x2c]
000d66c2  add     r6, pc ; -> 0x001802a4  
000d66c4  mov     r2, r6
000d66c6  str     r0, [sp]
000d66c8  ldr     r0, [sp, #0xc]
000d66ca  blx     #0xddbfc ; -> objc_msgSend
000d66ce  str     r0, [sp, #0x2c]
000d66d0  adds    r5, #1
000d66d2  cmp     r8, r5
000d66d4  bhi     #0xd668e
000d66d6  movs    r3, #0x10
000d66d8  ldr     r0, [sp, #0x24]
000d66da  str     r3, [sp]
000d66dc  ldr     r1, [sp, #0x18]
000d66de  add     r2, sp, #0xb4
000d66e0  add     r3, sp, #0x34
000d66e2  blx     #0xddbfc ; -> objc_msgSend
000d66e6  mov     r8, r0
000d66e8  cmp     r0, #0
000d66ea  bne     #0xd6688
000d66ec  ldr     r1, [pc, #0xcc]
000d66ee  ldr     r0, [sp, #0x2c]
000d66f0  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000d66f2  ldr     r4, [r1]
000d66f4  mov     r1, r4
000d66f6  blx     #0xddbfc ; -> objc_msgSend
000d66fa  cbz     r0, #0xd6716
000d66fc  ldr     r1, [pc, #0xc0]
000d66fe  ldr     r0, [sp, #0x2c]
000d6700  add     r1, pc ; -> 0x000fd350  
000d6702  ldr     r5, [r1]
000d6704  mov     r1, r4
000d6706  blx     #0xddbfc ; -> objc_msgSend
000d670a  mov     r1, r5
000d670c  subs    r2, r0, #1
000d670e  ldr     r0, [sp, #0x2c]
000d6710  blx     #0xddbfc ; -> objc_msgSend
000d6714  str     r0, [sp, #0x2c]
000d6716  ldr     r1, [pc, #0xac]
000d6718  ldr     r0, [sp, #8]
000d671a  ldr     r2, [sp, #0x2c]
000d671c  add     r1, pc ; -> 0x000fd34c  
000d671e  ldr     r1, [r1]
000d6720  blx     #0xddbfc ; -> objc_msgSend
000d6724  ldr     r0, [pc, #0xa0]
000d6726  ldr     r3, [pc, #0xa4]
000d6728  ldr     r1, [pc, #0xa4]
000d672a  add     r0, pc ; -> 0x000f3270  mtxController
000d672c  add     r3, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d672e  ldr     r2, [sp, #8]
000d6730  ldr     r0, [r0]
000d6732  ldr     r3, [r3]
000d6734  add     r1, pc ; -> 0x000fd6d4  
000d6736  ldr     r0, [r0]
000d6738  ldr     r3, [r2, r3]
000d673a  ldr     r1, [r1]
000d673c  movs    r2, #0x22
000d673e  blx     #0xddbfc ; -> objc_msgSend
000d6742  sub.w   sp, r7, #0x18
000d6746  pop.w   {r8, sl, fp}
000d674a  pop     {r4, r5, r6, r7, pc}
000d674c  ldr     r1, [pc, #0x2a0]
000d674e  movs    r2, r0
000d6750  str     r4, [r4, #0x48]
000d6752  movs    r2, r0
000d6754  strb    r6, [r0, #0x1b]
000d6756  movs    r2, r0
000d6758  str     r0, [r3, #0x6c]
000d675a  movs    r2, r0
000d675c  ldr     r1, [pc, #0x208]
000d675e  movs    r2, r0
000d6760  str     r0, [r2, #0x7c]
000d6762  movs    r2, r0
000d6764  str     r4, [r2, #0x58]
000d6766  movs    r2, r0
000d6768  strb    r4, [r0, #0x19]
000d676a  movs    r2, r0
000d676c  str     r2, [r4, #0x54]
000d676e  movs    r2, r0
