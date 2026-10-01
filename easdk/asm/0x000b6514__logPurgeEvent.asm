========================================================================
logPurgeEvent  0x000b6514  788 bytes   EAMTX_Main.mm
========================================================================

000b6514  push    {r4, r5, r6, r7, lr}
000b6516  add     r7, sp, #0xc
000b6518  push.w  {r8, sl, fp}
000b651c  sub     sp, #0x20
000b651e  ldr     r1, [pc, #0x274]
000b6520  add     r1, pc ; -> 0x0038c0e8  mtxUserInfo
000b6522  str     r1, [sp, #0x10]
000b6524  ldr     r0, [r1]
000b6526  ldr     r1, [pc, #0x270]
000b6528  add     r1, pc ; -> 0x000fd66c  
000b652a  ldr     r1, [r1]
000b652c  str     r1, [sp, #0x14]
000b652e  blx     #0xddbfc ; -> objc_msgSend
000b6532  ldr     r1, [pc, #0x268]
000b6534  ldr     r2, [pc, #0x268]
000b6536  ldr     r3, [pc, #0x26c]
000b6538  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000b653a  add     r2, pc ; -> 0x0017e5c4  
000b653c  ldr.w   fp, [r1]
000b6540  ldr     r1, [pc, #0x264]
000b6542  str     r2, [sp, #0xc]
000b6544  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000b6546  ldr.w   r8, [r1]
000b654a  mov     r1, r8
000b654c  mov     r4, r0
000b654e  ldr     r0, [pc, #0x25c]
000b6550  add     r0, pc ; -> 0x000fdb5c  
000b6552  ldr.w   sl, [r0]
000b6556  mov     r0, sl
000b6558  blx     #0xddbfc ; -> objc_msgSend
000b655c  mov     r1, fp
000b655e  mov     r2, r0
000b6560  mov     r0, r4
000b6562  blx     #0xddbfc ; -> objc_msgSend
000b6566  ldr     r1, [pc, #0x248]
000b6568  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000b656a  ldr     r1, [r1]
000b656c  str     r1, [sp, #0x18]
000b656e  blx     #0xddbfc ; -> objc_msgSend
000b6572  mov     r4, r0
000b6574  cmp     r0, #0
000b6576  bne.w   #0xb6702
000b657a  ldr     r0, [pc, #0x238]
000b657c  ldr.w   r1, [pc, #0x238]
000b6580  ldr     r4, [pc, #0x238]
000b6582  add     r0, pc ; -> 0x000fdbf4  
000b6584  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b6586  ldr     r0, [r0]
000b6588  ldr     r1, [r1]
000b658a  blx     #0xddbfc ; -> objc_msgSend
000b658e  ldr     r1, [pc, #0x230]
000b6590  add     r4, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000b6592  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b6594  ldr     r1, [r1]
000b6596  blx     #0xddbfc ; -> objc_msgSend
000b659a  ldr     r1, [pc, #0x228]
000b659c  ldr     r2, [sp, #0xc]
000b659e  ldr     r3, [pc, #0x204]
000b65a0  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000b65a2  ldr     r5, [r1]
000b65a4  mov     r1, r8
000b65a6  mov     r6, r0
000b65a8  mov     r0, sl
000b65aa  blx     #0xddbfc ; -> objc_msgSend
000b65ae  ldr     r3, [pc, #0x218]
000b65b0  mov     r1, r5
000b65b2  add     r3, pc ; -> 0x0017ffd4  
000b65b4  mov     r2, r0
000b65b6  mov     r0, r6
000b65b8  blx     #0xddbfc ; -> objc_msgSend
000b65bc  ldr     r2, [pc, #0x20c]
000b65be  mov     r1, r8
000b65c0  mov     r0, sl
000b65c2  add     r2, pc ; -> 0x0038c114  stepNum
000b65c4  ldr     r3, [r2]
000b65c6  adds    r3, #1
000b65c8  str     r3, [r2]
000b65ca  ldr     r2, [sp, #0xc]
000b65cc  blx     #0xddbfc ; -> objc_msgSend
000b65d0  ldr     r3, [pc, #0x1fc]
000b65d2  mov     r1, r5
000b65d4  add     r3, pc ; -> 0x0017ffe4  
000b65d6  mov     r2, r0
000b65d8  mov     r0, r6
000b65da  blx     #0xddbfc ; -> objc_msgSend
000b65de  ldr     r1, [pc, #0x1f4]
000b65e0  ldr     r3, [pc, #0x1f4]
000b65e2  mov     r0, r6
000b65e4  add     r1, pc ; -> 0x0038c110  sessionId
000b65e6  add     r3, pc ; -> 0x0017fff4  
000b65e8  str     r1, [sp, #8]
000b65ea  ldr     r2, [r1]
000b65ec  mov     r1, r5
000b65ee  blx     #0xddbfc ; -> objc_msgSend
000b65f2  mov     r1, r8
000b65f4  ldr     r2, [sp, #0xc]
000b65f6  movs    r3, #5
000b65f8  mov     r0, sl
000b65fa  blx     #0xddbfc ; -> objc_msgSend
000b65fe  ldr     r3, [pc, #0x1dc]
000b6600  mov     r1, r5
000b6602  add     r3, pc ; -> 0x00180004  
000b6604  mov     r2, r0
000b6606  mov     r0, r6
000b6608  blx     #0xddbfc ; -> objc_msgSend
000b660c  mov     r1, r8
000b660e  ldr     r2, [sp, #0xc]
000b6610  movs    r3, #1
000b6612  mov     r0, sl
000b6614  blx     #0xddbfc ; -> objc_msgSend
000b6618  ldr     r3, [pc, #0x1c4]
000b661a  mov     r1, r5
000b661c  add     r3, pc ; -> 0x00180014  
000b661e  mov     r2, r0
000b6620  mov     r0, r6
000b6622  blx     #0xddbfc ; -> objc_msgSend
000b6626  ldr     r3, [pc, #0x1bc]
000b6628  mov     r0, r6
000b662a  mov     r1, r5
000b662c  mov     r2, r4
000b662e  add     r3, pc ; -> 0x00180024  
000b6630  blx     #0xddbfc ; -> objc_msgSend
000b6634  ldr     r3, [pc, #0x1b0]
000b6636  mov     r2, r4
000b6638  mov     r0, r6
000b663a  add     r3, pc ; -> 0x00180034  
000b663c  mov     r1, r5
000b663e  blx     #0xddbfc ; -> objc_msgSend
000b6642  ldr     r0, [pc, #0x1a8]
000b6644  ldr     r1, [pc, #0x1a8]
000b6646  add     r0, pc ; -> 0x000fdbb4  
000b6648  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000b664a  ldr     r0, [r0]
000b664c  ldr     r1, [r1]
000b664e  blx     #0xddbfc ; -> objc_msgSend
000b6652  bl      #0xb5f84 ; -> Z24GetUTCDateINStringFormatP6NSDate
000b6656  ldr     r3, [pc, #0x19c]
000b6658  mov     r1, r5
000b665a  add     r3, pc ; -> 0x00180044  
000b665c  mov     r2, r0
000b665e  mov     r0, r6
000b6660  blx     #0xddbfc ; -> objc_msgSend
000b6664  ldr     r2, [sp, #0x10]
000b6666  ldr     r1, [sp, #0x14]
000b6668  ldr     r0, [r2]
000b666a  blx     #0xddbfc ; -> objc_msgSend
000b666e  ldr     r3, [pc, #0x134]
000b6670  mov     r1, r8
000b6672  ldr     r2, [sp, #0xc]
000b6674  mov     r4, r0
000b6676  mov     r0, sl
000b6678  blx     #0xddbfc ; -> objc_msgSend
000b667c  mov     r1, fp
000b667e  mov     r2, r0
000b6680  mov     r0, r4
000b6682  blx     #0xddbfc ; -> objc_msgSend
000b6686  ldr     r1, [sp, #0x18]
000b6688  blx     #0xddbfc ; -> objc_msgSend
000b668c  ldr     r3, [sp, #0x10]
000b668e  ldr     r1, [sp, #0x14]
000b6690  adds    r0, #1
000b6692  str     r0, [sp, #0x1c]
000b6694  ldr     r0, [r3]
000b6696  blx     #0xddbfc ; -> objc_msgSend
000b669a  mov     r1, r8
000b669c  ldr     r2, [sp, #0xc]
000b669e  ldr     r3, [sp, #0x1c]
000b66a0  mov     fp, r0
000b66a2  mov     r0, sl
000b66a4  blx     #0xddbfc ; -> objc_msgSend
000b66a8  mov     r1, r8
000b66aa  ldr     r2, [sp, #0xc]
000b66ac  ldr     r3, [pc, #0xf4]
000b66ae  mov     r4, r0
000b66b0  mov     r0, sl
000b66b2  blx     #0xddbfc ; -> objc_msgSend
000b66b6  mov     r1, r5
000b66b8  mov     r2, r4
000b66ba  mov     r3, r0
000b66bc  mov     r0, fp
000b66be  blx     #0xddbfc ; -> objc_msgSend
000b66c2  ldr     r1, [sp, #0x1c]
000b66c4  ldr     r2, [pc, #0x130]
000b66c6  mov     r0, sl
000b66c8  str     r1, [sp]
000b66ca  ldr     r1, [sp, #8]
000b66cc  add     r2, pc ; -> 0x00180054  
000b66ce  ldr     r3, [r1]
000b66d0  mov     r1, r8
000b66d2  str     r3, [sp, #4]
000b66d4  ldr     r3, [pc, #0xcc]
000b66d6  blx     #0xddbfc ; -> objc_msgSend
000b66da  ldr     r1, [pc, #0x120]
000b66dc  ldr     r2, [sp, #0x10]
000b66de  add     r1, pc ; -> 0x000fd65c  
000b66e0  ldr     r1, [r1]
000b66e2  mov     r4, r0
000b66e4  ldr     r0, [r2]
000b66e6  blx     #0xddbfc ; -> objc_msgSend
000b66ea  mov     r1, r5
000b66ec  mov     r2, r6
000b66ee  mov     r3, r4
000b66f0  blx     #0xddbfc ; -> objc_msgSend
000b66f4  ldr     r1, [pc, #0x108]
000b66f6  mov     r0, r6
000b66f8  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000b66fa  ldr     r1, [r1]
000b66fc  blx     #0xddbfc ; -> objc_msgSend
000b6700  b       #0xb678a
000b6702  ldr     r0, [pc, #0x100]
000b6704  ldr     r1, [pc, #0x100]
000b6706  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000b6708  add     r1, pc ; -> 0x000fd65c  
000b670a  ldr     r0, [r0]
000b670c  ldr     r1, [r1]
000b670e  blx     #0xddbfc ; -> objc_msgSend
000b6712  ldr     r3, [pc, #0xf8]
000b6714  str     r4, [sp]
000b6716  ldr     r2, [pc, #0xf8]
000b6718  add     r3, pc ; -> 0x0038c110  sessionId
000b671a  mov     r1, r8
000b671c  ldr     r3, [r3]
000b671e  add     r2, pc ; -> 0x00180054  
000b6720  ldr     r4, [pc, #0xf0]
000b6722  str     r3, [sp, #4]
000b6724  ldr     r3, [pc, #0x7c]
000b6726  add     r4, pc ; -> 0x00180014  
000b6728  mov     r5, r0
000b672a  mov     r0, sl
000b672c  blx     #0xddbfc ; -> objc_msgSend
000b6730  mov     r1, fp
000b6732  mov     r2, r0
000b6734  mov     r0, r5
000b6736  blx     #0xddbfc ; -> objc_msgSend
000b673a  mov     r2, r4
000b673c  mov     r1, fp
000b673e  mov     r5, r0
000b6740  blx     #0xddbfc ; -> objc_msgSend
000b6744  ldr     r1, [sp, #0x18]
000b6746  blx     #0xddbfc ; -> objc_msgSend
000b674a  ldr     r1, [pc, #0xcc]
000b674c  ldr     r2, [sp, #0xc]
000b674e  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000b6750  ldr     r6, [r1]
000b6752  mov     r1, r8
000b6754  adds    r3, r0, #1
000b6756  mov     r0, sl
000b6758  blx     #0xddbfc ; -> objc_msgSend
000b675c  mov     r3, r4
000b675e  mov     r1, r6
000b6760  mov     r2, r0
000b6762  mov     r0, r5
000b6764  blx     #0xddbfc ; -> objc_msgSend
000b6768  ldr     r0, [pc, #0xb0]
000b676a  ldr     r1, [pc, #0xb4]
000b676c  add     r0, pc ; -> 0x000fdbb4  
000b676e  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000b6770  ldr     r0, [r0]
000b6772  ldr     r1, [r1]
000b6774  blx     #0xddbfc ; -> objc_msgSend
000b6778  bl      #0xb5f84 ; -> Z24GetUTCDateINStringFormatP6NSDate
000b677c  ldr     r3, [pc, #0xa4]
000b677e  mov     r1, r6
000b6780  add     r3, pc ; -> 0x00180044  
000b6782  mov     r2, r0
000b6784  mov     r0, r5
000b6786  blx     #0xddbfc ; -> objc_msgSend
000b678a  sub.w   sp, r7, #0x18
000b678e  pop.w   {r8, sl, fp}
000b6792  pop     {r4, r5, r6, r7, pc}
000b6794  ldrh    r4, [r0, r7]
000b6796  movs    r5, r5
000b6798  strb    r0, [r0, #5]
000b679a  movs    r4, r0
000b679c  str     r0, [r3, #0x58]
000b679e  movs    r4, r0
000b67a0  strh    r6, [r0, #4]
000b67a2  movs    r4, r1
000b67a4  asrs    r0, r6, #5
000b67a6  movs    r1, r0
000b67a8  str     r0, [r3, #0x54]
000b67aa  movs    r4, r0
000b67ac  strb    r0, [r1, #0x18]
000b67ae  movs    r4, r0
000b67b0  str     r4, [r7, #0x54]
000b67b2  movs    r4, r0
000b67b4  strb    r6, [r5, #0x19]
000b67b6  movs    r4, r0
000b67b8  str     r4, [r7, #0x3c]
000b67ba  movs    r4, r0
000b67bc  ldrb    r0, [r4, #0x15]
000b67be  movs    r4, r1
000b67c0  str     r2, [r5, #0x3c]
000b67c2  movs    r4, r0
000b67c4  str     r4, [r6, #0x50]
000b67c6  movs    r4, r0
000b67c8  ldr     r2, [sp, #0x78]
000b67ca  movs    r4, r1
000b67cc  ldrh    r6, [r1, r5]
000b67ce  movs    r5, r5
000b67d0  ldr     r2, [sp, #0x30]
000b67d2  movs    r4, r1
000b67d4  ldrh    r0, [r5, r4]
000b67d6  movs    r5, r5
000b67d8  ldr     r2, [sp, #0x28]
000b67da  movs    r4, r1
000b67dc  ldr     r1, [sp, #0x3f8]
000b67de  movs    r4, r1
000b67e0  ldr     r1, [sp, #0x3d0]
000b67e2  movs    r4, r1
000b67e4  ldr     r1, [sp, #0x3c8]
000b67e6  movs    r4, r1
000b67e8  ldr     r1, [sp, #0x3d8]
000b67ea  movs    r4, r1
000b67ec  strb    r2, [r5, #0x15]
000b67ee  movs    r4, r0
000b67f0  str     r4, [r7, #0x54]
000b67f2  movs    r4, r0
000b67f4  ldr     r1, [sp, #0x398]
000b67f6  movs    r4, r1
000b67f8  ldr     r1, [sp, #0x210]
000b67fa  movs    r4, r1
000b67fc  ldr     r2, [r7, #0x74]
000b67fe  movs    r4, r0
000b6800  str     r0, [r0, #0x28]
000b6802  movs    r4, r0
000b6804  ldr     r6, [r3, r7]
000b6806  movs    r5, r5
000b6808  ldr     r0, [r2, #0x74]
000b680a  movs    r4, r0
000b680c  ldr     r4, [r6, r7]
000b680e  movs    r5, r5
000b6810  ldr     r1, [sp, #0xc8]
000b6812  movs    r4, r1
000b6814  ldr     r0, [sp, #0x3a8]
000b6816  movs    r4, r1
000b6818  str     r6, [r0, #0x38]
000b681a  movs    r4, r0
000b681c  strb    r4, [r0, #0x11]
000b681e  movs    r4, r0
000b6820  str     r6, [r2, #0x44]
000b6822  movs    r4, r0
000b6824  ldr     r0, [sp, #0x300]
000b6826  movs    r4, r1
