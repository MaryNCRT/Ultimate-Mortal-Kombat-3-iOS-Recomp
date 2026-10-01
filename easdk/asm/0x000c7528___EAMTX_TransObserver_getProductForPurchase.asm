========================================================================
-[EAMTX_TransObserver getProductForPurchase  0x000c7528  224 bytes   EAMTX_TransObserver.mm
========================================================================

000c7528  push    {r4, r5, r6, r7, lr}
000c752a  add     r7, sp, #0xc
000c752c  str     r8, [sp, #-0x4]!
000c7530  ldr     r3, [pc, #0xa0]
000c7532  ldr     r1, [pc, #0xa4]
000c7534  mov     r6, r2
000c7536  add     r3, pc ; -> 0x000f7fdc  OBJC_IVAR_$_EAMTX_TransObserver.m_RequestingProductForPurchase
000c7538  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000c753a  ldr     r3, [r3]
000c753c  movs    r2, #1
000c753e  mov     r8, r0
000c7540  ldr     r5, [r1]
000c7542  strb    r2, [r0, r3]
000c7544  ldr     r0, [pc, #0x94]
000c7546  mov     r1, r5
000c7548  add     r0, pc ; -> 0x000fdcbc  
000c754a  ldr     r0, [r0]
000c754c  blx     #0xddbfc ; -> objc_msgSend
000c7550  ldr     r1, [pc, #0x8c]
000c7552  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000c7554  ldr     r1, [r1]
000c7556  blx     #0xddbfc ; -> objc_msgSend
000c755a  ldr     r1, [pc, #0x88]
000c755c  mov     r2, r6
000c755e  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000c7560  ldr     r1, [r1]
000c7562  mov     r4, r0
000c7564  blx     #0xddbfc ; -> objc_msgSend
000c7568  ldr     r1, [pc, #0x7c]
000c756a  mov     r0, r4
000c756c  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000c756e  ldr     r1, [r1]
000c7570  blx     #0xddbfc ; -> objc_msgSend
000c7574  cbz     r0, #0xc75c0
000c7576  ldr     r0, [pc, #0x74]
000c7578  mov     r1, r5
000c757a  add     r0, pc ; -> 0x000fdcc0  
000c757c  ldr     r0, [r0]
000c757e  blx     #0xddbfc ; -> objc_msgSend
000c7582  ldr     r1, [pc, #0x6c]
000c7584  mov     r2, r4
000c7586  add     r1, pc ; -> 0x000fd704  '4\x02\x0f'
000c7588  ldr     r5, [r1]
000c758a  ldr     r1, [pc, #0x68]
000c758c  add     r1, pc ; -> 0x000fd708  'P\x02\x0f'
000c758e  ldr     r1, [r1]
000c7590  mov     r6, r0
000c7592  ldr     r0, [pc, #0x64]
000c7594  add     r0, pc ; -> 0x000fdcc4  
000c7596  ldr     r0, [r0]
000c7598  blx     #0xddbfc ; -> objc_msgSend
000c759c  mov     r1, r5
000c759e  mov     r2, r0
000c75a0  mov     r0, r6
000c75a2  blx     #0xddbfc ; -> objc_msgSend
000c75a6  ldr     r1, [pc, #0x54]
000c75a8  mov     r2, r8
000c75aa  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
000c75ac  ldr     r1, [r1]
000c75ae  mov     r5, r0
000c75b0  blx     #0xddbfc ; -> objc_msgSend
000c75b4  ldr     r1, [pc, #0x48]
000c75b6  mov     r0, r5
000c75b8  add     r1, pc ; -> 0x000fd700  '!\x02\x0f'
000c75ba  ldr     r1, [r1]
000c75bc  blx     #0xddbfc ; -> objc_msgSend
000c75c0  ldr     r1, [pc, #0x40]
000c75c2  mov     r0, r4
000c75c4  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c75c6  ldr     r1, [r1]
000c75c8  blx     #0xddbfc ; -> objc_msgSend
000c75cc  ldr     r8, [sp], #4
000c75d0  pop     {r4, r5, r6, r7, pc}
000c75d2  nop     
000c75d4  lsrs    r2, r4, #0xa
000c75d6  movs    r3, r0
000c75d8  strb    r0, [r1, r1]
000c75da  movs    r3, r0
000c75dc  str     r0, [r6, #0x74]
000c75de  movs    r3, r0
000c75e0  strb    r2, [r5, r0]
000c75e2  movs    r3, r0
000c75e4  strb    r2, [r4, r4]
000c75e6  movs    r3, r0
000c75e8  strb    r0, [r2, r4]
000c75ea  movs    r3, r0
000c75ec  str     r2, [r0, #0x74]
000c75ee  movs    r3, r0
000c75f0  str     r2, [r7, #0x14]
000c75f2  movs    r3, r0
000c75f4  str     r0, [r7, #0x14]
000c75f6  movs    r3, r0
000c75f8  str     r4, [r5, #0x70]
000c75fa  movs    r3, r0
000c75fc  ldrsb   r2, [r1, r3]
000c75fe  movs    r3, r0
000c7600  str     r4, [r0, #0x14]
000c7602  movs    r3, r0
000c7604  strh    r4, [r6, r6]
000c7606  movs    r3, r0
