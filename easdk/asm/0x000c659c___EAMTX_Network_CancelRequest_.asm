========================================================================
-[EAMTX_Network CancelRequest]  0x000c659c  444 bytes   EAMTX_Network.mm
========================================================================

000c659c  push    {r4, r5, r6, r7, lr}
000c659e  add     r7, sp, #0xc
000c65a0  push.w  {r8, sl, fp}
000c65a4  ldr     r3, [pc, #0x148]
000c65a6  mov     r5, r0
000c65a8  add     r3, pc ; -> 0x000f7da4  OBJC_IVAR_$_EAMTX_Network.theConnection
000c65aa  ldr     r3, [r3]
000c65ac  ldr     r3, [r0, r3]
000c65ae  cmp     r3, #0
000c65b0  beq.w   #0xc66ea
000c65b4  ldr     r3, [pc, #0x13c]
000c65b6  add     r3, pc ; -> 0x000f7d88  OBJC_IVAR_$_EAMTX_Network.networkState
000c65b8  ldr     r3, [r3]
000c65ba  ldr     r3, [r0, r3]
000c65bc  cmp     r3, #0xb
000c65be  bne     #0xc6678
000c65c0  ldr.w   r3, [pc, #0x134]
000c65c4  ldr     r1, [pc, #0x134]
000c65c6  add     r3, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c65c8  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000c65ca  ldr     r3, [r3]
000c65cc  ldr.w   fp, [r1]
000c65d0  ldr     r0, [r0, r3]
000c65d2  mov     r1, fp
000c65d4  blx     #0xddbfc ; -> objc_msgSend
000c65d8  cmp     r0, #0
000c65da  beq     #0xc6678
000c65dc  ldr     r4, [pc, #0x120]
000c65de  add     r4, pc ; -> 0x000f7da0  OBJC_IVAR_$_EAMTX_Network.m_ReturnContentType
000c65e0  ldr     r0, [r4]
000c65e2  ldr     r0, [r5, r0]
000c65e4  cmp     r0, #0
000c65e6  beq     #0xc6678
000c65e8  ldr     r1, [pc, #0x118]
000c65ea  ldr     r2, [pc, #0x11c]
000c65ec  add     r1, pc ; -> 0x000fd16c  
000c65ee  add     r2, pc ; -> 0x00181b14  
000c65f0  ldr     r6, [r1]
000c65f2  mov     r1, r6
000c65f4  blx     #0xddbfc ; -> objc_msgSend
000c65f8  cbz     r0, #0xc661c
000c65fa  ldr     r3, [r4]
000c65fc  ldr     r2, [pc, #0x10c]
000c65fe  mov     r1, r6
000c6600  ldr     r0, [r5, r3]
000c6602  add     r2, pc ; -> 0x00181b24  
000c6604  blx     #0xddbfc ; -> objc_msgSend
000c6608  cbz     r0, #0xc661c
000c660a  ldr     r3, [r4]
000c660c  ldr     r2, [pc, #0x100]
000c660e  mov     r1, r6
000c6610  ldr     r0, [r5, r3]
000c6612  add     r2, pc ; -> 0x00181b34  
000c6614  blx     #0xddbfc ; -> objc_msgSend
000c6618  cmp     r0, #0
000c661a  bne     #0xc6678
000c661c  ldr     r3, [pc, #0xf4]
000c661e  add     r3, pc ; -> 0x000f3330  dCachedData
000c6620  ldr     r4, [r3]
000c6622  ldr     r3, [r4]
000c6624  cbnz    r3, #0xc6642
000c6626  ldr     r0, [pc, #0xf0]
000c6628  ldr     r1, [pc, #0xf0]
000c662a  add     r0, pc ; -> 0x000fdbbc  
000c662c  add     r1, pc ; -> 0x000fcd14  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x39c
000c662e  ldr     r0, [r0]
000c6630  ldr     r1, [r1]
000c6632  blx     #0xddbfc ; -> objc_msgSend
000c6636  ldr     r1, [pc, #0xe8]
000c6638  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000c663a  ldr     r1, [r1]
000c663c  blx     #0xddbfc ; -> objc_msgSend
000c6640  str     r0, [r4]
000c6642  ldr     r1, [pc, #0xe0]
000c6644  ldr.w   sl, [r4]
000c6648  ldr     r4, [pc, #0xdc]
000c664a  add     r1, pc ; -> 0x000fd124  
000c664c  add     r4, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c664e  ldr.w   r8, [r1]
000c6652  ldr     r1, [pc, #0xd8]
000c6654  ldr     r3, [r4]
000c6656  add     r1, pc ; -> 0x000fca90  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x118
000c6658  ldr     r0, [r5, r3]
000c665a  ldr     r1, [r1]
000c665c  blx     #0xddbfc ; -> objc_msgSend
000c6660  ldr     r3, [r4]
000c6662  mov     r1, fp
000c6664  mov     r6, r0
000c6666  ldr     r0, [r5, r3]
000c6668  blx     #0xddbfc ; -> objc_msgSend
000c666c  mov     r1, r8
000c666e  mov     r2, r6
000c6670  mov     r3, r0
000c6672  mov     r0, sl
000c6674  blx     #0xddbfc ; -> objc_msgSend
000c6678  ldr     r3, [pc, #0xb4]
000c667a  ldr     r4, [pc, #0xb8]
000c667c  ldr     r1, [pc, #0xb8]
000c667e  add     r3, pc ; -> 0x000f3334  downloadedBytesSize
000c6680  add     r4, pc ; -> 0x000f7da4  OBJC_IVAR_$_EAMTX_Network.theConnection
000c6682  ldr     r2, [r3]
000c6684  movs    r3, #0
000c6686  add     r1, pc ; -> 0x000fcc9c  'p$\x0e'
000c6688  str     r3, [r2]
000c668a  ldr     r3, [r4]
000c668c  ldr     r1, [r1]
000c668e  ldr     r0, [r5, r3]
000c6690  blx     #0xddbfc ; -> objc_msgSend
000c6694  ldr     r0, [r4]
000c6696  ldr     r0, [r5, r0]
000c6698  cbz     r0, #0xc66b4
000c669a  ldr     r1, [pc, #0xa0]
000c669c  add     r1, pc ; -> 0x000fd7cc  'X\x03\x0f'
000c669e  ldr     r1, [r1]
000c66a0  blx     #0xddbfc ; -> objc_msgSend
000c66a4  cbz     r0, #0xc66b4
000c66a6  ldr     r1, [pc, #0x98]
000c66a8  ldr     r3, [r4]
000c66aa  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c66ac  ldr     r0, [r5, r3]
000c66ae  ldr     r1, [r1]
000c66b0  blx     #0xddbfc ; -> objc_msgSend
000c66b4  ldr     r4, [pc, #0x8c]
000c66b6  add     r4, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c66b8  ldr     r0, [r4]
000c66ba  ldr     r0, [r5, r0]
000c66bc  cbz     r0, #0xc66d8
000c66be  ldr     r1, [pc, #0x88]
000c66c0  add     r1, pc ; -> 0x000fd7cc  'X\x03\x0f'
000c66c2  ldr     r1, [r1]
000c66c4  blx     #0xddbfc ; -> objc_msgSend
000c66c8  cbz     r0, #0xc66d8
000c66ca  ldr     r1, [pc, #0x80]
000c66cc  ldr     r3, [r4]
000c66ce  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c66d0  ldr     r0, [r5, r3]
000c66d2  ldr     r1, [r1]
000c66d4  blx     #0xddbfc ; -> objc_msgSend
000c66d8  ldr     r3, [pc, #0x74]
000c66da  movs    r2, #0
000c66dc  add     r3, pc ; -> 0x000f7da4  OBJC_IVAR_$_EAMTX_Network.theConnection
000c66de  ldr     r3, [r3]
000c66e0  str     r2, [r5, r3]
000c66e2  ldr     r3, [pc, #0x70]
000c66e4  add     r3, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c66e6  ldr     r3, [r3]
000c66e8  str     r2, [r5, r3]
000c66ea  pop.w   {r8, sl, fp}
000c66ee  pop     {r4, r5, r6, r7, pc}
000c66f0  asrs    r0, r7, #0x1f
000c66f2  movs    r3, r0
000c66f4  asrs    r6, r1, #0x1f
000c66f6  movs    r3, r0
000c66f8  asrs    r2, r2, #0x1f
000c66fa  movs    r3, r0
000c66fc  str     r4, [r5, #0x48]
000c66fe  movs    r3, r0
000c6700  asrs    r6, r7, #0x1e
000c6702  movs    r3, r0
000c6704  ldr     r4, [r7, #0x34]
000c6706  movs    r3, r0
000c6708  push    {r1, r5, lr}
000c670a  movs    r3, r1
000c670c  push    {r1, r2, r3, r4, lr}
000c670e  movs    r3, r1
000c6710  push    {r1, r2, r3, r4, lr}
000c6712  movs    r3, r1
000c6714  ldm     r5!, {r1, r2, r3}
000c6716  movs    r2, r0
000c6718  strb    r6, [r1, #0x16]
000c671a  movs    r3, r0
000c671c  str     r4, [r4, #0x6c]
000c671e  movs    r3, r0
000c6720  str     r4, [r2, #0x68]
000c6722  movs    r3, r0
000c6724  ldr     r6, [r2, #0x2c]
000c6726  movs    r3, r0
000c6728  asrs    r4, r1, #0x1d
000c672a  movs    r3, r0
000c672c  str     r6, [r6, #0x40]
000c672e  movs    r3, r0
000c6730  ldm     r4, {r1, r4, r5, r7}
000c6732  movs    r2, r0
000c6734  asrs    r0, r4, #0x1c
000c6736  movs    r3, r0
000c6738  str     r2, [r2, #0x60]
000c673a  movs    r3, r0
000c673c  strb    r4, [r5, #4]
000c673e  movs    r3, r0
000c6740  str     r6, [r1, #0x2c]
000c6742  movs    r3, r0
000c6744  asrs    r2, r4, #0x1b
000c6746  movs    r3, r0
000c6748  strb    r0, [r1, #4]
000c674a  movs    r3, r0
000c674c  str     r2, [r5, #0x28]
000c674e  movs    r3, r0
000c6750  asrs    r4, r0, #0x1b
000c6752  movs    r3, r0
000c6754  asrs    r4, r6, #0x1a
000c6756  movs    r3, r0
