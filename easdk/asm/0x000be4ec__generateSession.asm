========================================================================
generateSession  0x000be4ec  816 bytes   EAMTX_Main.mm
========================================================================

000be4ec  push    {r4, r5, r6, r7, lr}
000be4ee  add     r7, sp, #0xc
000be4f0  push.w  {r8, sl, fp}
000be4f4  sub     sp, #0x10
000be4f6  ldr     r4, [pc, #0x284]
000be4f8  add     r4, pc ; -> 0x0038c110  sessionId
000be4fa  ldr     r0, [r4]
000be4fc  cbz     r0, #0xbe50e
000be4fe  ldr     r1, [pc, #0x280]
000be500  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000be502  ldr     r1, [r1]
000be504  blx     #0xddbfc ; -> objc_msgSend
000be508  movs    r3, #0
000be50a  str     r3, [r4]
000be50c  b       #0xbe512
000be50e  bl      #0xb6cdc ; -> Z17setEventsPriorityv
000be512  ldr     r0, [pc, #0x270]
000be514  ldr     r1, [pc, #0x270]
000be516  ldr     r6, [pc, #0x274]
000be518  add     r0, pc ; -> 0x000fdbb4  
000be51a  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000be51c  ldr     r0, [r0]
000be51e  ldr     r1, [r1]
000be520  blx     #0xddbfc ; -> objc_msgSend
000be524  bl      #0xb5f84 ; -> Z24GetUTCDateINStringFormatP6NSDate
000be528  ldr     r1, [pc, #0x264]
000be52a  ldr     r2, [pc, #0x268]
000be52c  add     r6, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000be52e  add     r1, pc ; -> 0x000fcaec  '\x19\x1a\x0e'
000be530  add     r2, pc ; -> 0x001800b4  
000be532  ldr     r1, [r1]
000be534  mov     r3, r6
000be536  ldr.w   r8, [pc, #0x260]
000be53a  ldr     r5, [pc, #0x260]
000be53c  str     r1, [sp]
000be53e  blx     #0xddbfc ; -> objc_msgSend
000be542  ldr     r1, [pc, #0x25c]
000be544  ldr     r2, [pc, #0x25c]
000be546  add     r8, pc ; -> 0x0038c110  sessionId
000be548  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000be54a  add     r2, pc ; -> 0x0017ef54  
000be54c  ldr.w   sl, [r1]
000be550  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000be552  mov     r1, sl
000be554  mov     r3, r0
000be556  ldr     r0, [pc, #0x250]
000be558  add     r0, pc ; -> 0x000fdb5c  
000be55a  ldr.w   fp, [r0]
000be55e  mov     r0, fp
000be560  blx     #0xddbfc ; -> objc_msgSend
000be564  ldr     r1, [pc, #0x244]
000be566  add     r1, pc ; -> 0x000fd6b0  
000be568  ldr     r4, [r1]
000be56a  mov     r1, r4
000be56c  str.w   r0, [r8]
000be570  ldr     r0, [r5]
000be572  blx     #0xddbfc ; -> objc_msgSend
000be576  cmp.w   r0, #-1
000be57a  beq.w   #0xbe704
000be57e  ldr     r0, [r5]
000be580  mov     r1, r4
000be582  blx     #0xddbfc ; -> objc_msgSend
000be586  cmp     r0, #0
000be588  beq.w   #0xbe704
000be58c  mov     r1, r4
000be58e  ldr     r0, [r5]
000be590  blx     #0xddbfc ; -> objc_msgSend
000be594  ldr     r6, [pc, #0x218]
000be596  mov     r1, sl
000be598  add     r6, pc ; -> 0x0017e5c4  
000be59a  mov     r2, r6
000be59c  mov     r3, r0
000be59e  mov     r0, fp
000be5a0  blx     #0xddbfc ; -> objc_msgSend
000be5a4  ldr     r1, [pc, #0x20c]
000be5a6  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000be5a8  ldr     r4, [r1]
000be5aa  mov     r1, r4
000be5ac  mov     r6, r0
000be5ae  blx     #0xddbfc ; -> objc_msgSend
000be5b2  mov     r1, r4
000be5b4  mov     r5, r0
000be5b6  ldr.w   r0, [r8]
000be5ba  blx     #0xddbfc ; -> objc_msgSend
000be5be  rsb.w   r0, r0, #0x18
000be5c2  cmp     r5, r0
000be5c4  bhi     #0xbe5d6
000be5c6  ldr.w   r1, [pc, #0x1f0]
000be5ca  ldr.w   r0, [r8]
000be5ce  mov     r2, r6
000be5d0  add     r1, pc ; -> 0x000fcfe4  
000be5d2  ldr     r1, [r1]
000be5d4  b       #0xbe61a
000be5d6  ldr.w   r8, [pc, #0x1e4]
000be5da  mov     r0, r6
000be5dc  add     r8, pc ; -> 0x0038c110  sessionId
000be5de  ldr.w   r1, [r8]
000be5e2  str     r1, [sp, #4]
000be5e4  ldr     r1, [pc, #0x1d8]
000be5e6  add     r1, pc ; -> 0x000fcfe4  
000be5e8  ldr.w   fp, [r1]
000be5ec  ldr     r1, [pc, #0x1d4]
000be5ee  add     r1, pc ; -> 0x000fcdc4  
000be5f0  ldr.w   sl, [r1]
000be5f4  mov     r1, r4
000be5f6  blx     #0xddbfc ; -> objc_msgSend
000be5fa  mov     r1, r4
000be5fc  mov     r5, r0
000be5fe  ldr.w   r0, [r8]
000be602  blx     #0xddbfc ; -> objc_msgSend
000be606  mov     r1, sl
000be608  add     r0, r5
000be60a  sub.w   r2, r0, #0x18
000be60e  mov     r0, r6
000be610  blx     #0xddbfc ; -> objc_msgSend
000be614  mov     r1, fp
000be616  mov     r2, r0
000be618  ldr     r0, [sp, #4]
000be61a  blx     #0xddbfc ; -> objc_msgSend
000be61e  str.w   r0, [r8]
000be622  b       #0xbe694
000be624  ldr     r2, [pc, #0x1a0]
000be626  ldr     r3, [sp, #0xc]
000be628  mov     r1, sl
000be62a  add     r2, pc ; -> 0x0017f404  
000be62c  mov     r0, fp
000be62e  blx     #0xddbfc ; -> objc_msgSend
000be632  mov     r1, r8
000be634  ldr     r5, [pc, #0x194]
000be636  add     r5, pc ; -> 0x0038c110  sessionId
000be638  mov     r6, r0
000be63a  blx     #0xddbfc ; -> objc_msgSend
000be63e  mov     r1, r8
000be640  mov     r4, r0
000be642  ldr     r0, [r5]
000be644  blx     #0xddbfc ; -> objc_msgSend
000be648  rsb.w   r0, r0, #0x18
000be64c  cmp     r4, r0
000be64e  bhi     #0xbe65c
000be650  ldr     r1, [pc, #0x17c]
000be652  ldr     r0, [r5]
000be654  mov     r2, r6
000be656  add     r1, pc ; -> 0x000fcfe4  
000be658  ldr     r1, [r1]
000be65a  b       #0xbe68e
000be65c  ldr     r1, [pc, #0x174]
000be65e  mov     r0, r6
000be660  ldr.w   fp, [r5]
000be664  add     r1, pc ; -> 0x000fcfe4  
000be666  ldr.w   sl, [r1]
000be66a  mov     r1, r8
000be66c  blx     #0xddbfc ; -> objc_msgSend
000be670  mov     r1, r8
000be672  mov     r4, r0
000be674  ldr     r0, [r5]
000be676  blx     #0xddbfc ; -> objc_msgSend
000be67a  ldr     r1, [sp, #8]
000be67c  add     r0, r4
000be67e  sub.w   r2, r0, #0x18
000be682  mov     r0, r6
000be684  blx     #0xddbfc ; -> objc_msgSend
000be688  mov     r1, sl
000be68a  mov     r2, r0
000be68c  mov     r0, fp
000be68e  blx     #0xddbfc ; -> objc_msgSend
000be692  str     r0, [r5]
000be694  ldr     r0, [pc, #0x140]
000be696  ldr     r1, [pc, #0x144]
000be698  mov.w   r8, #0
000be69c  add     r0, pc ; -> 0x0038c110  sessionId
000be69e  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000be6a0  ldr     r0, [r0]
000be6a2  ldr     r1, [r1]
000be6a4  blx     #0xddbfc ; -> objc_msgSend
000be6a8  ldr     r1, [pc, #0x134]
000be6aa  add     r1, pc ; -> 0x000fd658  
000be6ac  ldr.w   sl, [r1]
000be6b0  rsb.w   fp, r0, #0x18
000be6b4  b       #0xbe6e6
000be6b6  ldr     r5, [pc, #0x12c]
000be6b8  ldr     r4, [pc, #0x12c]
000be6ba  add.w   r8, r8, #1
000be6be  add     r5, pc ; -> 0x0038c110  sessionId
000be6c0  add     r4, pc ; -> 0x0017e5c4  
000be6c2  ldr     r6, [r5]
000be6c4  blx     #0xdd740 ; -> arc4random
000be6c8  ldr     r2, [pc, #0x120]
000be6ca  umull   r1, r2, r0, r2
000be6ce  mov     r3, r0
000be6d0  mov     r0, r6
000be6d2  lsrs    r2, r2, #3
000be6d4  lsls    r1, r2, #1
000be6d6  lsls    r2, r2, #3
000be6d8  add     r2, r1
000be6da  subs    r3, r3, r2
000be6dc  mov     r1, sl
000be6de  mov     r2, r4
000be6e0  blx     #0xddbfc ; -> objc_msgSend
000be6e4  str     r0, [r5]
000be6e6  cmp     r8, fp
000be6e8  blt     #0xbe6b6
000be6ea  ldr     r0, [pc, #0x104]
000be6ec  ldr     r1, [pc, #0x104]
000be6ee  add     r0, pc ; -> 0x0038c110  sessionId
000be6f0  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000be6f2  ldr     r0, [r0]
000be6f4  ldr     r1, [r1]
000be6f6  blx     #0xddbfc ; -> objc_msgSend
000be6fa  sub.w   sp, r7, #0x18
000be6fe  pop.w   {r8, sl, fp}
000be702  pop     {r4, r5, r6, r7, pc}
000be704  ldr     r0, [pc, #0xf0]
000be706  ldr     r1, [pc, #0xf4]
000be708  add     r0, pc ; -> 0x000fdb50  
000be70a  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
000be70c  ldr     r0, [r0]
000be70e  ldr     r1, [r1]
000be710  blx     #0xddbfc ; -> objc_msgSend
000be714  ldr     r1, [pc, #0xe8]
000be716  add     r1, pc ; -> 0x000fcfa8  'AU\x0e'
000be718  ldr     r1, [r1]
000be71a  blx     #0xddbfc ; -> objc_msgSend
000be71e  ldr     r2, [pc, #0xe4]
000be720  mov     r3, r6
000be722  ldr     r1, [sp]
000be724  add     r2, pc ; -> 0x00180a44  
000be726  blx     #0xddbfc ; -> objc_msgSend
000be72a  ldr     r1, [pc, #0xdc]
000be72c  add     r1, pc ; -> 0x000fd034  '|]\x0e'
000be72e  ldr     r5, [r1]
000be730  ldr     r1, [pc, #0xd8]
000be732  add     r1, pc ; -> 0x000fcdc4  
000be734  ldr     r1, [r1]
000be736  str     r1, [sp, #8]
000be738  ldr     r1, [pc, #0xd4]
000be73a  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000be73c  ldr.w   r8, [r1]
000be740  mov     r1, r8
000be742  mov     r4, r0
000be744  ldr     r0, [pc, #0xcc]
000be746  add     r0, pc ; -> 0x000fdc30  
000be748  ldr     r6, [r0]
000be74a  mov     r0, r4
000be74c  blx     #0xddbfc ; -> objc_msgSend
000be750  ldr     r1, [sp, #8]
000be752  subs.w  r2, r0, #8
000be756  mov     r0, r4
000be758  blx     #0xddbfc ; -> objc_msgSend
000be75c  mov     r1, r5
000be75e  mov     r2, r0
000be760  mov     r0, r6
000be762  blx     #0xddbfc ; -> objc_msgSend
000be766  ldr     r1, [pc, #0xb0]
000be768  add     r2, sp, #0xc
000be76a  add     r1, pc ; -> 0x000fd020  '\x18]\x0e'
000be76c  ldr     r1, [r1]
000be76e  blx     #0xddbfc ; -> objc_msgSend
000be772  tst.w   r0, #0xff
000be776  beq     #0xbe694
000be778  b       #0xbe624
000be77a  nop     
000be77c  bgt     #0xbe7a8
000be77e  movs    r4, r5
000be780  b       #0xbe074
000be782  movs    r3, r0
