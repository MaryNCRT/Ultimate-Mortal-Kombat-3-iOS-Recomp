========================================================================
-[EAMTX_Network connection  0x000c67ac  192 bytes   EAMTX_Network.mm
========================================================================

000c67ac  push    {r4, r5, r6, r7, lr}
000c67ae  add     r7, sp, #0xc
000c67b0  push.w  {r8, sl, fp}
000c67b4  ldr     r1, [pc, #0x88]
000c67b6  mov     r5, r0
000c67b8  mov     fp, r3
000c67ba  ldr     r0, [pc, #0x88]
000c67bc  ldr     r3, [pc, #0x88]
000c67be  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c67c0  add     r0, pc ; -> 0x000fdb5c  
000c67c2  add     r3, pc ; -> 0x000f7d8c  OBJC_IVAR_$_EAMTX_Network.requestId
000c67c4  ldr.w   r8, [r0]
000c67c8  ldr     r6, [r1]
000c67ca  ldr     r3, [r3]
000c67cc  ldr     r2, [pc, #0x7c]
000c67ce  mov     r0, r8
000c67d0  mov     r1, r6
000c67d2  ldr     r3, [r5, r3]
000c67d4  add     r2, pc ; -> 0x00181b44  
000c67d6  blx     #0xddbfc ; -> objc_msgSend
000c67da  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c67de  ldr     r1, [pc, #0x70]
000c67e0  mov     r0, fp
000c67e2  ldr     r4, [pc, #0x70]
000c67e4  add     r1, pc ; -> 0x000fd7bc  '\x14\t\x0f'
000c67e6  ldr.w   sl, [r1]
000c67ea  add     r4, pc ; -> 0x00181b54  
000c67ec  mov     r1, sl
000c67ee  blx     #0xddbfc ; -> objc_msgSend
000c67f2  mov     r1, r6
000c67f4  mov     r2, r4
000c67f6  mov     r3, r0
000c67f8  mov     r0, r8
000c67fa  blx     #0xddbfc ; -> objc_msgSend
000c67fe  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c6802  ldr     r0, [pc, #0x54]
000c6804  ldr     r1, [pc, #0x54]
000c6806  movs    r2, #1
000c6808  add     r0, pc ; -> 0x000f3270  mtxController
000c680a  add     r1, pc ; -> 0x000fd7c4  '_\x05\x0f'
000c680c  ldr     r0, [r0]
000c680e  ldr     r1, [r1]
000c6810  ldr     r0, [r0]
000c6812  blx     #0xddbfc ; -> objc_msgSend
000c6816  ldr     r3, [pc, #0x48]
000c6818  mov     r1, sl
000c681a  mov     r0, fp
000c681c  add     r3, pc ; -> 0x000f7da0  OBJC_IVAR_$_EAMTX_Network.m_ReturnContentType
000c681e  ldr     r4, [r3]
000c6820  blx     #0xddbfc ; -> objc_msgSend
000c6824  ldr     r3, [pc, #0x3c]
000c6826  ldr     r1, [pc, #0x40]
000c6828  movs    r2, #0
000c682a  add     r3, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c682c  add     r1, pc ; -> 0x000fd7b8  '\t\t\x0f'
000c682e  ldr     r1, [r1]
000c6830  str     r0, [r5, r4]
000c6832  ldr     r0, [r3]
000c6834  ldr     r0, [r5, r0]
000c6836  blx     #0xddbfc ; -> objc_msgSend
000c683a  pop.w   {r8, sl, fp}
000c683e  pop     {r4, r5, r6, r7, pc}
000c6840  str     r6, [r3, #0x2c]
000c6842  movs    r3, r0
000c6844  strb    r0, [r3, #0xe]
000c6846  movs    r3, r0
000c6848  asrs    r6, r0, #0x17
000c684a  movs    r3, r0
000c684c  cbz     r4, #0xc68aa
000c684e  movs    r3, r1
000c6850  ldr     r4, [r2, #0x7c]
000c6852  movs    r3, r0
000c6854  cbz     r6, #0xc68b0
000c6856  movs    r3, r1
000c6858  ldm     r2, {r2, r5, r6}
000c685a  movs    r2, r0
000c685c  ldr     r6, [r6, #0x78]
000c685e  movs    r3, r0
000c6860  asrs    r0, r0, #0x16
000c6862  movs    r3, r0
000c6864  asrs    r6, r5, #0x15
000c6866  movs    r3, r0
000c6868  ldr     r0, [r1, #0x78]
000c686a  movs    r3, r0
