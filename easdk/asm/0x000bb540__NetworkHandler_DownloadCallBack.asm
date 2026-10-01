========================================================================
NetworkHandler_DownloadCallBack  0x000bb540  268 bytes   EAMTX_Main.mm
========================================================================

000bb540  push    {r4, r5, r6, r7, lr}
000bb542  add     r7, sp, #0xc
000bb544  str     r8, [sp, #-0x4]!
000bb548  mov     r5, r1
000bb54a  mov     r8, r3
000bb54c  cmp     r1, #0
000bb54e  beq     #0xbb5e8
000bb550  ldr     r0, [pc, #0xb8]
000bb552  ldr     r1, [pc, #0xbc]
000bb554  add     r0, pc ; -> 0x000fdbf4  
000bb556  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bb558  ldr     r0, [r0]
000bb55a  ldr     r1, [r1]
000bb55c  blx     #0xddbfc ; -> objc_msgSend
000bb560  ldr     r1, [pc, #0xb0]
000bb562  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bb564  ldr     r1, [r1]
000bb566  blx     #0xddbfc ; -> objc_msgSend
000bb56a  ldr     r1, [pc, #0xac]
000bb56c  ldr     r3, [pc, #0xac]
000bb56e  mov     r2, r5
000bb570  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000bb572  add     r3, pc ; -> 0x00180474  
000bb574  ldr     r6, [r1]
000bb576  mov     r1, r6
000bb578  mov     r4, r0
000bb57a  blx     #0xddbfc ; -> objc_msgSend
000bb57e  ldr     r3, [pc, #0xa0]
000bb580  add     r3, pc ; -> 0x0038c1ae  downloadingAsset
000bb582  ldrb    r3, [r3]
000bb584  cbz     r3, #0xbb59c
000bb586  ldr     r3, [sp, #0x20]
000bb588  cbz     r3, #0xbb598
000bb58a  ldr     r3, [pc, #0x98]
000bb58c  mov     r0, r4
000bb58e  mov     r1, r6
000bb590  add     r3, pc ; -> 0x00180484  
000bb592  ldr     r2, [sp, #0x20]
000bb594  blx     #0xddbfc ; -> objc_msgSend
000bb598  movs    r0, #0x2a
000bb59a  b       #0xbb5c6
000bb59c  ldr     r0, [pc, #0x88]
000bb59e  ldr     r1, [pc, #0x8c]
000bb5a0  ldr     r3, [pc, #0x8c]
000bb5a2  ldr     r2, [pc, #0x90]
000bb5a4  add     r0, pc ; -> 0x000fdb5c  
000bb5a6  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bb5a8  add     r3, pc ; -> 0x0038c168  iItemSellId
000bb5aa  add     r2, pc ; -> 0x0017e5c4  
000bb5ac  ldr     r1, [r1]
000bb5ae  ldr     r3, [r3]
000bb5b0  ldr     r0, [r0]
000bb5b2  blx     #0xddbfc ; -> objc_msgSend
000bb5b6  ldr     r3, [pc, #0x80]
000bb5b8  mov     r1, r6
000bb5ba  add     r3, pc ; -> 0x00180434  
000bb5bc  mov     r2, r0
000bb5be  mov     r0, r4
000bb5c0  blx     #0xddbfc ; -> objc_msgSend
000bb5c4  movs    r0, #0xc
000bb5c6  mov     r1, r8
000bb5c8  mov     r2, r4
000bb5ca  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bb5ce  ldr     r1, [pc, #0x6c]
000bb5d0  mov     r0, r4
000bb5d2  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bb5d4  ldr     r1, [r1]
000bb5d6  blx     #0xddbfc ; -> objc_msgSend
000bb5da  ldr     r1, [pc, #0x64]
000bb5dc  mov     r0, r4
000bb5de  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bb5e0  ldr     r1, [r1]
000bb5e2  blx     #0xddbfc ; -> objc_msgSend
000bb5e6  b       #0xbb5fc
000bb5e8  ldr     r3, [pc, #0x58]
000bb5ea  mov.w   r2, #-1
000bb5ee  movs    r0, #0x24
000bb5f0  add     r3, pc ; -> 0x0038c198  m_iDSellId
000bb5f2  mov     r1, r8
000bb5f4  str     r2, [r3]
000bb5f6  mov     r2, r5
000bb5f8  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bb5fc  ldr     r0, [pc, #0x48]
000bb5fe  add     r0, pc ; -> 0x00180494  
000bb600  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bb604  movs    r0, #0
000bb606  ldr     r8, [sp], #4
000bb60a  pop     {r4, r5, r6, r7, pc}
000bb60c  movs    r6, #0x9c
000bb60e  movs    r4, r0
000bb610  asrs    r2, r5, #0x10
000bb612  movs    r4, r0
000bb614  asrs    r2, r3, #0x10
000bb616  movs    r4, r0
000bb618  asrs    r4, r4, #0x15
000bb61a  movs    r4, r0
000bb61c  ldr     r6, [pc, #0x3f8]
000bb61e  movs    r4, r1
000bb620  lsrs    r2, r5, #0x10
000bb622  movs    r5, r5
000bb624  ldr     r6, [pc, #0x3c0]
000bb626  movs    r4, r1
000bb628  movs    r5, #0xb4
000bb62a  movs    r4, r0
000bb62c  asrs    r6, r6, #0x13
000bb62e  movs    r4, r0
000bb630  lsrs    r4, r7, #0xe
000bb632  movs    r5, r5
000bb634  adds    r0, #0x16
000bb636  movs    r4, r1
000bb638  ldr     r6, [pc, #0x1d8]
000bb63a  movs    r4, r1
000bb63c  asrs    r6, r6, #0x12
000bb63e  movs    r4, r0
000bb640  asrs    r2, r3, #0xe
000bb642  movs    r4, r0
000bb644  lsrs    r4, r4, #0xe
000bb646  movs    r5, r5
000bb648  ldr     r6, [pc, #0x248]
000bb64a  movs    r4, r1
