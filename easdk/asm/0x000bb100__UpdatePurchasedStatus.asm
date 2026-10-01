========================================================================
UpdatePurchasedStatus  0x000bb100  488 bytes   EAMTX_Main.mm
========================================================================

000bb100  push    {r4, r5, r6, r7, lr}
000bb102  add     r7, sp, #0xc
000bb104  push.w  {r8, sl, fp}
000bb108  sub     sp, #0x28
000bb10a  ldr     r4, [pc, #0x174]
000bb10c  uxtb    r1, r1
000bb10e  mov     r5, r0
000bb110  add     r4, pc ; -> 0x0038c184  confirmRevokedList
000bb112  str     r2, [sp]
000bb114  ldr     r3, [r4]
000bb116  str     r1, [sp, #4]
000bb118  cbnz    r3, #0xbb136
000bb11a  ldr     r0, [pc, #0x168]
000bb11c  ldr     r1, [pc, #0x168]
000bb11e  add     r0, pc ; -> 0x000fdb5c  
000bb120  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bb122  ldr     r0, [r0]
000bb124  ldr     r1, [r1]
000bb126  blx     #0xddbfc ; -> objc_msgSend
000bb12a  ldr     r1, [pc, #0x160]
000bb12c  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bb12e  ldr     r1, [r1]
000bb130  blx     #0xddbfc ; -> objc_msgSend
000bb134  str     r0, [r4]
000bb136  ldr     r1, [pc, #0x158]
000bb138  ldr     r2, [pc, #0x158]
000bb13a  mov     r0, r5
000bb13c  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000bb13e  add     r2, pc ; -> 0x00180454  
000bb140  ldr.w   fp, [r1]
000bb144  mov.w   sl, #0
000bb148  mov     r1, fp
000bb14a  blx     #0xddbfc ; -> objc_msgSend
000bb14e  ldr     r1, [pc, #0x148]
000bb150  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000bb152  ldr     r1, [r1]
000bb154  str     r1, [sp, #0xc]
000bb156  ldr     r1, [pc, #0x144]
000bb158  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000bb15a  ldr     r1, [r1]
000bb15c  str     r1, [sp, #0x10]
000bb15e  ldr     r1, [pc, #0x140]
000bb160  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000bb162  ldr     r1, [r1]
000bb164  str     r1, [sp, #0x14]
000bb166  ldr     r1, [pc, #0x13c]
000bb168  str     r0, [sp, #8]
000bb16a  ldr     r0, [pc, #0x13c]
000bb16c  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bb16e  ldr     r1, [r1]
000bb170  add     r0, pc ; -> 0x000fdb5c  
000bb172  ldr     r0, [r0]
000bb174  str     r1, [sp, #0x1c]
000bb176  ldr     r1, [pc, #0x134]
000bb178  str     r0, [sp, #0x18]
000bb17a  add     r1, pc ; -> 0x000fd428  
000bb17c  ldr     r1, [r1]
000bb17e  str     r1, [sp, #0x20]
000bb180  ldr     r1, [pc, #0x12c]
000bb182  add     r1, pc ; -> 0x000fcfe4  
000bb184  ldr     r1, [r1]
000bb186  str     r1, [sp, #0x24]
000bb188  b       #0xbb214
000bb18a  ldr     r1, [sp, #0x10]
000bb18c  mov     r2, sl
000bb18e  ldr     r0, [sp, #8]
000bb190  blx     #0xddbfc ; -> objc_msgSend
000bb194  ldr     r2, [pc, #0x11c]
000bb196  mov     r1, fp
000bb198  ldr     r5, [pc, #0x11c]
000bb19a  add     r2, pc ; -> 0x0017fed4  
000bb19c  blx     #0xddbfc ; -> objc_msgSend
000bb1a0  ldr     r1, [sp, #0x14]
000bb1a2  blx     #0xddbfc ; -> objc_msgSend
000bb1a6  add     r5, pc ; -> 0x0017e5c4  
000bb1a8  ldr     r1, [sp, #0x1c]
000bb1aa  mov     r2, r5
000bb1ac  mov     r6, r0
000bb1ae  ldr     r0, [pc, #0x10c]
000bb1b0  mov     r3, r6
000bb1b2  add     r0, pc ; -> 0x0038c0bc  mtxProdsList
000bb1b4  ldr     r4, [r0]
000bb1b6  ldr     r0, [sp, #0x18]
000bb1b8  blx     #0xddbfc ; -> objc_msgSend
000bb1bc  mov     r1, fp
000bb1be  mov     r2, r0
000bb1c0  mov     r0, r4
000bb1c2  blx     #0xddbfc ; -> objc_msgSend
000bb1c6  cbz     r0, #0xbb210
000bb1c8  ldr     r1, [sp, #0x20]
000bb1ca  ldr     r2, [sp, #4]
000bb1cc  blx     #0xddbfc ; -> objc_msgSend
000bb1d0  cmp.w   sl, #0
000bb1d4  bne     #0xbb1f0
000bb1d6  ldr     r4, [pc, #0xe8]
000bb1d8  mov     r2, r5
000bb1da  ldr     r0, [sp, #0x18]
000bb1dc  add     r4, pc ; -> 0x0038c184  confirmRevokedList
000bb1de  ldr     r1, [sp, #0x1c]
000bb1e0  mov     r3, r6
000bb1e2  ldr.w   r8, [r4]
000bb1e6  blx     #0xddbfc ; -> objc_msgSend
000bb1ea  mov     r2, r0
000bb1ec  mov     r0, r8
000bb1ee  b       #0xbb208
000bb1f0  ldr     r4, [pc, #0xd0]
000bb1f2  ldr     r2, [pc, #0xd4]
000bb1f4  ldr     r0, [sp, #0x18]
000bb1f6  add     r4, pc ; -> 0x0038c184  confirmRevokedList
000bb1f8  add     r2, pc ; -> 0x00180464  
000bb1fa  ldr     r1, [sp, #0x1c]
000bb1fc  mov     r3, r6
000bb1fe  ldr     r5, [r4]
000bb200  blx     #0xddbfc ; -> objc_msgSend
000bb204  mov     r2, r0
000bb206  mov     r0, r5
000bb208  ldr     r1, [sp, #0x24]
000bb20a  blx     #0xddbfc ; -> objc_msgSend
000bb20e  str     r0, [r4]
000bb210  add.w   sl, sl, #1
000bb214  ldr     r0, [sp, #8]
000bb216  ldr     r1, [sp, #0xc]
000bb218  blx     #0xddbfc ; -> objc_msgSend
000bb21c  cmp     r0, sl
000bb21e  bhi     #0xbb18a
000bb220  ldr     r3, [sp, #4]
000bb222  cbnz    r3, #0xbb23a
000bb224  ldr     r0, [pc, #0xa4]
000bb226  ldr     r1, [pc, #0xa8]
000bb228  movs    r2, #0x15
000bb22a  add     r0, pc ; -> 0x0038c0e4  mtxController
000bb22c  add     r1, pc ; -> 0x000fd6d4  
000bb22e  ldr     r0, [r0]
000bb230  ldr     r1, [r1]
000bb232  ldr     r3, [sp]
000bb234  blx     #0xddbfc ; -> objc_msgSend
000bb238  b       #0xbb276
000bb23a  ldr     r4, [pc, #0x98]
000bb23c  ldr     r1, [pc, #0x98]
000bb23e  add     r4, pc ; -> 0x0038c0e4  mtxController
000bb240  add     r1, pc ; -> 0x000fd4f8  
000bb242  ldr     r0, [r4]
000bb244  ldr     r1, [r1]
000bb246  blx     #0xddbfc ; -> objc_msgSend
000bb24a  cmp     r0, #0xe
000bb24c  bne     #0xbb276
000bb24e  ldr     r1, [pc, #0x8c]
000bb250  movs    r2, #0
000bb252  ldr     r0, [r4]
000bb254  add     r1, pc ; -> 0x000fd6b4  
000bb256  ldr     r1, [r1]
000bb258  blx     #0xddbfc ; -> objc_msgSend
000bb25c  ldr     r0, [pc, #0x80]
000bb25e  ldr     r1, [pc, #0x84]
000bb260  add     r0, pc ; -> 0x0038c0bc  mtxProdsList
000bb262  add     r1, pc ; -> 0x000fd674  
000bb264  ldr     r0, [r0]
000bb266  ldr     r1, [r1]
000bb268  blx     #0xddbfc ; -> objc_msgSend
000bb26c  ldr     r1, [sp]
000bb26e  mov     r2, r0
000bb270  movs    r0, #7
000bb272  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bb276  sub.w   sp, r7, #0x18
000bb27a  pop.w   {r8, sl, fp}
000bb27e  pop     {r4, r5, r6, r7, pc}
000bb280  asrs    r0, r6, #1
000bb282  movs    r5, r5
000bb284  cmp     r2, #0x3a
000bb286  movs    r4, r0
000bb288  adds    r0, r4, r1
000bb28a  movs    r4, r0
000bb28c  adds    r0, r2, r1
000bb28e  movs    r4, r0
000bb290  adds    r0, r6, r6
000bb292  movs    r4, r0
000bb294  strh    r2, [r2, r4]
000bb296  movs    r4, r1
000bb298  adds    r4, r5, r4
000bb29a  movs    r4, r0
000bb29c  adds    r0, r4, r4
000bb29e  movs    r4, r0
000bb2a0  adds    r4, r0, r6
000bb2a2  movs    r4, r0
000bb2a4  adds    r0, r6, r4
000bb2a6  movs    r4, r0
000bb2a8  cmp     r1, #0xe8
000bb2aa  movs    r4, r0
000bb2ac  movs    r2, #0xaa
000bb2ae  movs    r4, r0
000bb2b0  subs    r6, r3, #1
000bb2b2  movs    r4, r0
000bb2b4  ldr     r5, [pc, #0xd8]
000bb2b6  movs    r4, r1
000bb2b8  adds    r4, #0x1a
000bb2ba  movs    r4, r1
000bb2bc  lsrs    r6, r0, #0x1c
000bb2be  movs    r5, r5
000bb2c0  lsrs    r4, r4, #0x1e
000bb2c2  movs    r5, r5
000bb2c4  lsrs    r2, r1, #0x1e
000bb2c6  movs    r5, r5
000bb2c8  strh    r0, [r5, r1]
000bb2ca  movs    r4, r1
000bb2cc  lsrs    r6, r6, #0x1a
000bb2ce  movs    r5, r5
000bb2d0  movs    r4, #0xa4
000bb2d2  movs    r4, r0
000bb2d4  lsrs    r2, r4, #0x1a
000bb2d6  movs    r5, r5
000bb2d8  movs    r2, #0xb4
000bb2da  movs    r4, r0
000bb2dc  movs    r4, #0x5c
000bb2de  movs    r4, r0
000bb2e0  lsrs    r0, r3, #0x19
000bb2e2  movs    r5, r5
000bb2e4  movs    r4, #0xe
000bb2e6  movs    r4, r0
