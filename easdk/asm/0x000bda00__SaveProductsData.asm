========================================================================
SaveProductsData  0x000bda00  216 bytes   EAMTX_Main.mm
========================================================================

000bda00  push    {r4, r5, r6, r7, lr}
000bda02  add     r7, sp, #0xc
000bda04  push.w  {r8, sl}
000bda08  sub     sp, #4
000bda0a  ldr     r0, [pc, #0x9c]
000bda0c  ldr     r4, [pc, #0x9c]
000bda0e  add     r0, pc ; -> 0x00180924  
000bda10  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bda14  bl      #0xbd8d8 ; -> Z19PrepareProductsDatav
000bda18  ldr     r1, [pc, #0x94]
000bda1a  add     r4, pc ; -> 0x00180934  
000bda1c  add     r1, pc ; -> 0x000fd008  ':Z\x0e'
000bda1e  ldr     r1, [r1]
000bda20  mov     r8, r0
000bda22  ldr     r0, [pc, #0x90]
000bda24  add     r0, pc ; -> 0x000fdc2c  
000bda26  ldr     r0, [r0]
000bda28  blx     #0xddbfc ; -> objc_msgSend
000bda2c  ldr     r1, [pc, #0x88]
000bda2e  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bda30  ldr     r5, [r1]
000bda32  mov     sl, r0
000bda34  ldr     r0, [pc, #0x84]
000bda36  add     r0, pc ; -> 0x000fdb5c  
000bda38  ldr     r6, [r0]
000bda3a  blx     #0xdd41c ; -> NSTemporaryDirectory
000bda3e  mov     r2, r4
000bda40  mov     r1, r5
000bda42  mov     r3, r0
000bda44  mov     r0, r6
000bda46  blx     #0xddbfc ; -> objc_msgSend
000bda4a  mov     r4, r0
000bda4c  cmp.w   r8, #0
000bda50  beq     #0xbda88
000bda52  ldr     r1, [pc, #0x6c]
000bda54  mov     r0, r8
000bda56  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000bda58  ldr     r1, [r1]
000bda5a  blx     #0xddbfc ; -> objc_msgSend
000bda5e  cbz     r0, #0xbda88
000bda60  ldr     r1, [pc, #0x60]
000bda62  movs    r3, #0
000bda64  mov     r0, sl
000bda66  add     r1, pc ; -> 0x000fd218  
000bda68  str     r3, [sp]
000bda6a  ldr     r1, [r1]
000bda6c  mov     r2, r4
000bda6e  mov     r3, r8
000bda70  blx     #0xddbfc ; -> objc_msgSend
000bda74  tst.w   r0, #0xff
000bda78  beq     #0xbda80
000bda7a  ldr     r0, [pc, #0x4c]
000bda7c  add     r0, pc ; -> 0x00180944  
000bda7e  b       #0xbda84
000bda80  ldr     r0, [pc, #0x48]
000bda82  add     r0, pc ; -> 0x00180954  
000bda84  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bda88  ldr     r0, [pc, #0x44]
000bda8a  add     r0, pc ; -> 0x00180964  
000bda8c  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bda90  ldr     r1, [pc, #0x40]
000bda92  mov     r0, r8
000bda94  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bda96  ldr     r1, [r1]
000bda98  blx     #0xddbfc ; -> objc_msgSend
000bda9c  sub.w   sp, r7, #0x14
000bdaa0  pop.w   {r8, sl}
000bdaa4  pop     {r4, r5, r6, r7, pc}
000bdaa6  nop     
000bdaa8  cmp     r7, #0x12
000bdaaa  movs    r4, r1
000bdaac  cmp     r7, #0x16
000bdaae  movs    r4, r1
