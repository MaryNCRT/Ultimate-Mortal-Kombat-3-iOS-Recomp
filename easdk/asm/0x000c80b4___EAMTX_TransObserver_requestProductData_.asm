========================================================================
-[EAMTX_TransObserver requestProductData]  0x000c80b4  588 bytes   EAMTX_TransObserver.mm
========================================================================

000c80b4  push    {r4, r5, r6, r7, lr}
000c80b6  add     r7, sp, #0xc
000c80b8  push.w  {r8, sl, fp}
000c80bc  sub     sp, #0x24
000c80be  ldr     r3, [pc, #0x1c4]
000c80c0  ldr     r1, [pc, #0x1c4]
000c80c2  str     r0, [sp]
000c80c4  add     r3, pc ; -> 0x000f7fdc  OBJC_IVAR_$_EAMTX_TransObserver.m_RequestingProductForPurchase
000c80c6  movs    r4, #0
000c80c8  ldr     r3, [r3]
000c80ca  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000c80cc  ldr     r1, [r1]
000c80ce  strb    r4, [r0, r3]
000c80d0  ldr     r0, [pc, #0x1b8]
000c80d2  str     r1, [sp, #4]
000c80d4  add     r0, pc ; -> 0x000fdcbc  
000c80d6  ldr     r0, [r0]
000c80d8  blx     #0xddbfc ; -> objc_msgSend
000c80dc  ldr     r1, [pc, #0x1b0]
000c80de  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000c80e0  ldr     r1, [r1]
000c80e2  blx     #0xddbfc ; -> objc_msgSend
000c80e6  ldr     r3, [pc, #0x1ac]
000c80e8  ldr     r2, [sp]
000c80ea  add     r3, pc ; -> 0x000f7fd4  OBJC_IVAR_$_EAMTX_TransObserver.m_TransState
000c80ec  ldr     r3, [r3]
000c80ee  ldr     r3, [r2, r3]
000c80f0  cmp     r3, #2
000c80f2  mov     fp, r0
000c80f4  bne     #0xc813a
000c80f6  ldr     r1, [pc, #0x1a0]
000c80f8  ldr     r0, [pc, #0x1a0]
000c80fa  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000c80fc  add     r0, pc ; -> 0x000f3288  badgeSellIds
000c80fe  ldr.w   sl, [r1]
000c8102  ldr     r1, [pc, #0x19c]
000c8104  ldr     r5, [r0]
000c8106  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000c8108  ldr     r6, [r1]
000c810a  ldr     r1, [pc, #0x198]
000c810c  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000c810e  ldr.w   r8, [r1]
000c8112  ldr     r0, [r5]
000c8114  cmp     r0, #0
000c8116  beq     #0xc81f8
000c8118  mov     r1, sl
000c811a  blx     #0xddbfc ; -> objc_msgSend
000c811e  cmp     r0, r4
000c8120  bls     #0xc81f8
000c8122  mov     r2, r4
000c8124  mov     r1, r8
000c8126  ldr     r0, [r5]
000c8128  blx     #0xddbfc ; -> objc_msgSend
000c812c  mov     r1, r6
000c812e  adds    r4, #1
000c8130  mov     r2, r0
000c8132  mov     r0, fp
000c8134  blx     #0xddbfc ; -> objc_msgSend
000c8138  b       #0xc8112
000c813a  ldr     r3, [pc, #0x16c]
000c813c  add     r3, pc ; -> 0x000f3274  mtxProdsList
000c813e  ldr     r0, [r3]
000c8140  ldr     r0, [r0]
000c8142  cmp     r0, #0
000c8144  beq     #0xc81f8
000c8146  ldr     r1, [pc, #0x164]
000c8148  mov     r6, r4
000c814a  add     r1, pc ; -> 0x000fce70  'F=\x0e'
000c814c  ldr     r1, [r1]
000c814e  blx     #0xddbfc ; -> objc_msgSend
000c8152  ldr     r1, [pc, #0x15c]
000c8154  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000c8156  ldr     r1, [r1]
000c8158  str     r1, [sp, #0x18]
000c815a  ldr     r1, [pc, #0x158]
000c815c  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000c815e  ldr     r1, [r1]
000c8160  str     r1, [sp, #8]
000c8162  ldr     r1, [pc, #0x154]
000c8164  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000c8166  ldr     r1, [r1]
000c8168  str     r1, [sp, #0x20]
000c816a  ldr     r1, [pc, #0x150]
000c816c  mov     r8, r0
000c816e  ldr     r0, [pc, #0x150]
000c8170  add     r1, pc ; -> 0x000fd63c  
000c8172  ldr.w   sl, [r1]
000c8176  ldr     r1, [pc, #0x14c]
000c8178  add     r0, pc ; -> 0x000fdb5c  
000c817a  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000c817c  ldr     r0, [r0]
000c817e  ldr     r1, [r1]
000c8180  str     r0, [sp, #0x10]
000c8182  str     r1, [sp, #0x1c]
000c8184  ldr     r1, [pc, #0x140]
000c8186  add     r1, pc ; -> 0x000fd60c  
000c8188  ldr     r1, [r1]
000c818a  str     r1, [sp, #0xc]
000c818c  ldr     r1, [pc, #0x13c]
000c818e  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c8190  ldr     r1, [r1]
000c8192  str     r1, [sp, #0x14]
000c8194  b       #0xc81ec
000c8196  ldr     r3, [pc, #0x138]
000c8198  ldr     r1, [sp, #0x20]
000c819a  mov     r2, r6
000c819c  add     r3, pc ; -> 0x000f3274  mtxProdsList
000c819e  ldr     r0, [r3]
000c81a0  ldr     r4, [r0]
000c81a2  mov     r0, r8
000c81a4  blx     #0xddbfc ; -> objc_msgSend
000c81a8  ldr     r1, [sp, #8]
000c81aa  mov     r2, r0
000c81ac  mov     r0, r4
000c81ae  blx     #0xddbfc ; -> objc_msgSend
000c81b2  mov     r1, sl
000c81b4  mov     r4, r0
000c81b6  blx     #0xddbfc ; -> objc_msgSend
000c81ba  cbnz    r0, #0xc81ea
000c81bc  ldr     r1, [sp, #0xc]
000c81be  mov     r0, r4
000c81c0  blx     #0xddbfc ; -> objc_msgSend
000c81c4  ldr     r1, [sp, #0x1c]
000c81c6  ldr     r5, [pc, #0x10c]
000c81c8  add     r5, pc ; -> 0x001815f4  
000c81ca  mov     r2, r0
000c81cc  mov     r0, fp
000c81ce  blx     #0xddbfc ; -> objc_msgSend
000c81d2  ldr     r1, [sp, #0xc]
000c81d4  mov     r0, r4
000c81d6  blx     #0xddbfc ; -> objc_msgSend
000c81da  ldr     r1, [sp, #0x14]
000c81dc  mov     r2, r5
000c81de  mov     r3, r0
000c81e0  ldr     r0, [sp, #0x10]
000c81e2  blx     #0xddbfc ; -> objc_msgSend
000c81e6  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c81ea  adds    r6, #1
000c81ec  mov     r0, r8
000c81ee  ldr     r1, [sp, #0x18]
000c81f0  blx     #0xddbfc ; -> objc_msgSend
000c81f4  cmp     r0, r6
000c81f6  bhi     #0xc8196
000c81f8  ldr     r1, [pc, #0xdc]
000c81fa  mov     r0, fp
000c81fc  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000c81fe  ldr     r1, [r1]
000c8200  blx     #0xddbfc ; -> objc_msgSend
000c8204  cbz     r0, #0xc8252
000c8206  ldr     r0, [pc, #0xd4]
000c8208  ldr     r1, [sp, #4]
000c820a  add     r0, pc ; -> 0x000fdcc0  
000c820c  ldr     r0, [r0]
000c820e  blx     #0xddbfc ; -> objc_msgSend
000c8212  ldr     r1, [pc, #0xcc]
000c8214  mov     r2, fp
000c8216  add     r1, pc ; -> 0x000fd704  '4\x02\x0f'
000c8218  ldr     r4, [r1]
000c821a  ldr     r1, [pc, #0xc8]
000c821c  add     r1, pc ; -> 0x000fd708  'P\x02\x0f'
000c821e  ldr     r1, [r1]
000c8220  mov     r5, r0
000c8222  ldr     r0, [pc, #0xc4]
000c8224  add     r0, pc ; -> 0x000fdcc4  
000c8226  ldr     r0, [r0]
000c8228  blx     #0xddbfc ; -> objc_msgSend
000c822c  mov     r1, r4
000c822e  mov     r2, r0
000c8230  mov     r0, r5
000c8232  blx     #0xddbfc ; -> objc_msgSend
000c8236  ldr     r1, [pc, #0xb4]
000c8238  ldr     r2, [sp]
000c823a  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
000c823c  ldr     r1, [r1]
000c823e  mov     r4, r0
000c8240  blx     #0xddbfc ; -> objc_msgSend
000c8244  ldr     r1, [pc, #0xa8]
000c8246  mov     r0, r4
000c8248  add     r1, pc ; -> 0x000fd700  '!\x02\x0f'
000c824a  ldr     r1, [r1]
000c824c  blx     #0xddbfc ; -> objc_msgSend
000c8250  b       #0xc826c
000c8252  ldr     r3, [pc, #0xa0]
000c8254  ldr     r2, [sp]
000c8256  add     r3, pc ; -> 0x000f7fd4  OBJC_IVAR_$_EAMTX_TransObserver.m_TransState
000c8258  ldr     r3, [r3]
000c825a  ldr     r3, [r2, r3]
000c825c  cmp     r3, #2
000c825e  beq     #0xc826c
000c8260  ldr     r3, [pc, #0x94]
000c8262  add     r3, pc ; -> 0x000f7fcc  OBJC_IVAR_$_EAMTX_TransObserver.requestId
000c8264  ldr     r0, [r3]
000c8266  ldr     r0, [r2, r0]
000c8268  bl      #0xbc260 ; -> Z18FilterAndSendItemsi
000c826c  ldr     r1, [pc, #0x8c]
000c826e  mov     r0, fp
000c8270  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c8272  ldr     r1, [r1]
000c8274  blx     #0xddbfc ; -> objc_msgSend
000c8278  sub.w   sp, r7, #0x18
000c827c  pop.w   {r8, sl, fp}
000c8280  pop     {r4, r5, r6, r7, pc}
000c8282  nop     
000c8284  vhadd.u16 d0, d4, d2
000c8288  ldr     r0, [pc, #0x2d8]
000c828a  movs    r3, r0
000c828c  ldrh    r4, [r4, r7]
000c828e  movs    r3, r0
000c8290  ldr     r0, [pc, #0x278]
000c8292  movs    r3, r0
000c8294  cdp2    p0, #0xe, c0, c6, c2, #0
000c8298  ldr     r1, [pc, #0x208]
000c829a  movs    r3, r0
000c829c  cbz     r0, #0xc82c2
000c829e  movs    r2, r0
000c82a0  ldr     r1, [pc, #0x1e8]
000c82a2  movs    r3, r0
000c82a4  ldr     r1, [pc, #0x1b0]
000c82a6  movs    r3, r0
000c82a8  cbz     r4, #0xc82b8
000c82aa  movs    r2, r0
000c82ac  ldr     r5, [pc, #0x88]
000c82ae  movs    r3, r0
000c82b0  ldr     r1, [pc, #0xa0]
000c82b2  movs    r3, r0
000c82b4  ldr     r1, [pc, #0x240]
000c82b6  movs    r3, r0
000c82b8  ldr     r1, [pc, #0x50]
000c82ba  movs    r3, r0
000c82bc  strb    r0, [r1, r3]
000c82be  movs    r3, r0
000c82c0  ldr     r0, [r4, r7]
000c82c2  movs    r3, r0
000c82c4  ldr     r1, [pc, #0x18]
000c82c6  movs    r3, r0
000c82c8  strb    r2, [r0, r2]
000c82ca  movs    r3, r0
000c82cc  ldr     r1, [pc, #0x38]
000c82ce  movs    r3, r0
000c82d0  sub     sp, #0x150
000c82d2  movs    r2, r0
000c82d4  str     r4, [sp, #0xa0]
000c82d6  movs    r3, r1
000c82d8  ldr     r0, [pc, #0x200]
000c82da  movs    r3, r0
000c82dc  ldrh    r2, [r6, r2]
000c82de  movs    r3, r0
000c82e0  strb    r2, [r5, r3]
000c82e2  movs    r3, r0
000c82e4  strb    r0, [r5, r3]
000c82e6  movs    r3, r0
000c82e8  ldrh    r4, [r3, r2]
000c82ea  movs    r3, r0
000c82ec  ldr     r2, [pc, #0xe8]
000c82ee  movs    r3, r0
000c82f0  strb    r4, [r6, r2]
000c82f2  movs    r3, r0
000c82f4  ldc2l   p0, c0, [sl, #-8]!
000c82f8  stc2l   p0, c0, [r6, #-8]!
000c82fc  bx      r1
000c82fe  movs    r3, r0
