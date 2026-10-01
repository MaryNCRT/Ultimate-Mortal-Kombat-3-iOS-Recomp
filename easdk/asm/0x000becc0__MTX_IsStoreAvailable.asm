========================================================================
MTX_IsStoreAvailable  0x000becc0  172 bytes   EAMTX_Main.mm
========================================================================

000becc0  push    {r4, r7, lr}
000becc2  add     r7, sp, #4
000becc4  ldr     r3, [pc, #0x74]
000becc6  add     r3, pc ; -> 0x0038c1ad  bStoreAvailable
000becc8  ldrb    r3, [r3]
000becca  cmp     r3, #0
000beccc  bne     #0xbed34
000becce  ldr     r0, [pc, #0x70]
000becd0  ldr     r1, [pc, #0x70]
000becd2  add     r0, pc ; -> 0x000fdb60  
000becd4  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000becd6  ldr     r0, [r0]
000becd8  ldr     r1, [r1]
000becda  blx     #0xddbfc ; -> objc_msgSend
000becde  ldr     r1, [pc, #0x68]
000bece0  add     r1, pc ; -> 0x000fcaf4  'K\x1a\x0e'
000bece2  ldr     r1, [r1]
000bece4  blx     #0xddbfc ; -> objc_msgSend
000bece8  ldr     r1, [pc, #0x60]
000becea  ldr     r2, [pc, #0x64]
000becec  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000becee  add     r2, pc ; -> 0x00180a64  
000becf0  ldr     r1, [r1]
000becf2  blx     #0xddbfc ; -> objc_msgSend
000becf6  cbz     r0, #0xbed0c
000becf8  ldr     r1, [pc, #0x58]
000becfa  add     r1, pc ; -> 0x000fd6d0  
000becfc  ldr     r1, [r1]
000becfe  blx     #0xddbfc ; -> objc_msgSend
000bed02  tst.w   r0, #0xff
000bed06  beq     #0xbed0c
000bed08  movs    r4, #1
000bed0a  b       #0xbed0e
000bed0c  movs    r4, #0
000bed0e  ldr     r0, [pc, #0x48]
000bed10  add     r0, pc ; -> 0x00180a74  
000bed12  blx     #0xdd3c8 ; -> NSClassFromString
000bed16  cbz     r0, #0xbed2c
000bed18  cbnz    r4, #0xbed2c
000bed1a  ldr     r3, [pc, #0x40]
000bed1c  movs    r2, #1
000bed1e  add     r3, pc ; -> 0x0038c1ac  bStoreAvailable
000bed20  strb    r2, [r3]
000bed22  ldr     r3, [pc, #0x3c]
000bed24  movs    r2, #1
000bed26  add     r3, pc ; -> 0x0038c1ad  bStoreAvailable
000bed28  strb    r2, [r3]
000bed2a  b       #0xbed34
000bed2c  ldr     r3, [pc, #0x34]
000bed2e  movs    r2, #0
000bed30  add     r3, pc ; -> 0x0038c1ac  bStoreAvailable
000bed32  b       #0xbed20
000bed34  ldr     r3, [pc, #0x30]
000bed36  add     r3, pc ; -> 0x0038c1ac  bStoreAvailable
000bed38  ldrb    r0, [r3]
000bed3a  pop     {r4, r7, pc}
000bed3c  bmi     #0xbed06
000bed3e  movs    r4, r5
000bed40  cdp     p0, #8, c0, c10, c3, #0
000bed44  ble     #0xbedd0
000bed46  movs    r3, r0
000bed48  udf     #0x10
000bed4a  movs    r3, r0
000bed4c  udf     #0
000bed4e  movs    r3, r0
000bed50  adds    r2, r6, #5
000bed52  movs    r4, r1
000bed54  ldrd    r0, r0, [r2, #0xc]
000bed58  adds    r0, r4, #5
000bed5a  movs    r4, r1
000bed5c  bmi     #0xbec74
000bed5e  movs    r4, r5
000bed60  bmi     #0xbec6a
000bed62  movs    r4, r5
000bed64  bmi     #0xbee58
000bed66  movs    r4, r5
000bed68  bmi     #0xbee50
000bed6a  movs    r4, r5
