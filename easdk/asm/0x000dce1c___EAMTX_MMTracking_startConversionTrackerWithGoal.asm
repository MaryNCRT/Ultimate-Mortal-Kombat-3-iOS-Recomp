========================================================================
-[EAMTX_MMTracking startConversionTrackerWithGoalId  0x000dce1c  360 bytes   EAMTX_MMTracking.mm
========================================================================

000dce1c  push    {r4, r5, r6, r7, lr}
000dce1e  add     r7, sp, #0xc
000dce20  push.w  {r8, sl, fp}
000dce24  sub     sp, #4
000dce26  ldr     r1, [pc, #0x100]
000dce28  mov     fp, r0
000dce2a  ldr     r0, [pc, #0x100]
000dce2c  add     r1, pc ; -> 0x000fcae0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x168
000dce2e  mov     sl, r2
000dce30  add     r0, pc ; -> 0x000fdb84  
000dce32  ldr     r1, [r1]
000dce34  ldr     r0, [r0]
000dce36  blx     #0xddbfc ; -> objc_msgSend
000dce3a  ldr     r1, [pc, #0xf4]
000dce3c  ldr     r4, [pc, #0xf4]
000dce3e  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000dce40  add     r4, pc ; -> 0x00181d84  
000dce42  ldr     r1, [r1]
000dce44  mov     r8, r0
000dce46  ldr     r0, [pc, #0xf0]
000dce48  add     r0, pc ; -> 0x000fdb60  
000dce4a  ldr     r0, [r0]
000dce4c  blx     #0xddbfc ; -> objc_msgSend
000dce50  ldr     r1, [pc, #0xe8]
000dce52  ldr     r3, [pc, #0xec]
000dce54  ldr     r2, [pc, #0xec]
000dce56  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000dce58  add     r3, pc ; -> 0x000fdb5c  
000dce5a  ldr     r5, [r1]
000dce5c  ldr     r1, [pc, #0xe8]
000dce5e  add     r2, pc ; -> 0x00181d94  
000dce60  ldr     r6, [r3]
000dce62  add     r1, pc ; -> 0x000fd00c  'LZ\x0e'
000dce64  ldr     r1, [r1]
000dce66  blx     #0xddbfc ; -> objc_msgSend
000dce6a  mov     r1, r5
000dce6c  mov     r2, r4
000dce6e  mov     r3, r0
000dce70  mov     r0, r6
000dce72  blx     #0xddbfc ; -> objc_msgSend
000dce76  ldr     r1, [pc, #0xd4]
000dce78  add     r1, pc ; -> 0x000fd7f4  
000dce7a  ldr     r1, [r1]
000dce7c  mov     r2, r0
000dce7e  mov     r0, r8
000dce80  blx     #0xddbfc ; -> objc_msgSend
000dce84  tst.w   r0, #0xff
000dce88  bne     #0xdcf1c
000dce8a  ldr     r0, [pc, #0xc4]
000dce8c  ldr     r1, [pc, #0xc4]
000dce8e  ldr     r4, [pc, #0xc8]
000dce90  add     r0, pc ; -> 0x000fdb50  
000dce92  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
000dce94  ldr     r0, [r0]
000dce96  ldr     r1, [r1]
000dce98  blx     #0xddbfc ; -> objc_msgSend
000dce9c  ldr     r1, [pc, #0xbc]
000dce9e  add     r4, pc ; -> 0x00181da4  
000dcea0  add     r1, pc ; -> 0x000fcfa8  'AU\x0e'
000dcea2  ldr     r1, [r1]
000dcea4  blx     #0xddbfc ; -> objc_msgSend
000dcea8  mov     r1, r5
000dceaa  mov     r2, r4
000dceac  mov     r3, sl
000dceae  str     r0, [sp]
000dceb0  mov     r0, r6
000dceb2  blx     #0xddbfc ; -> objc_msgSend
000dceb6  ldr     r2, [pc, #0xa8]
000dceb8  mov     r1, r5
000dceba  add     r2, pc ; -> 0x00181db4  
000dcebc  mov     r8, r0
000dcebe  mov     r3, r8
000dcec0  mov     r0, r6
000dcec2  blx     #0xddbfc ; -> objc_msgSend
000dcec6  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000dceca  ldr     r0, [pc, #0x98]
000dcecc  ldr     r1, [pc, #0x98]
000dcece  mov     r2, r8
000dced0  add     r0, pc ; -> 0x000fdc54  
000dced2  add     r1, pc ; -> 0x000fcbe4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x26c
000dced4  ldr     r5, [r0]
000dced6  ldr     r4, [r1]
000dced8  ldr     r0, [pc, #0x90]
000dceda  ldr     r1, [pc, #0x94]
000dcedc  add     r0, pc ; -> 0x000fdb64  
000dcede  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
000dcee0  ldr     r0, [r0]
000dcee2  ldr     r1, [r1]
000dcee4  blx     #0xddbfc ; -> objc_msgSend
000dcee8  mov     r1, r4
000dceea  mov     r2, r0
000dceec  mov     r0, r5
000dceee  blx     #0xddbfc ; -> objc_msgSend
000dcef2  ldr     r1, [pc, #0x80]
000dcef4  ldr     r3, [pc, #0x80]
000dcef6  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000dcef8  add     r3, pc ; -> 0x000fc978  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn
000dcefa  ldr     r1, [r1]
000dcefc  ldr     r5, [r3]
000dcefe  mov     r4, r0
000dcf00  ldr     r0, [pc, #0x78]
000dcf02  add     r0, pc ; -> 0x000fdc08  
000dcf04  ldr     r0, [r0]
000dcf06  blx     #0xddbfc ; -> objc_msgSend
000dcf0a  ldr     r1, [pc, #0x74]
000dcf0c  mov     r2, r4
000dcf0e  mov     r3, fp
000dcf10  add     r1, pc ; -> 0x000fce2c  
000dcf12  ldr     r1, [r1]
000dcf14  blx     #0xddbfc ; -> objc_msgSend
000dcf18  str.w   r0, [fp, r5]
000dcf1c  sub.w   sp, r7, #0x18
000dcf20  pop.w   {r8, sl, fp}
000dcf24  pop     {r4, r5, r6, r7, pc}
000dcf26  nop     
000dcf28  ldc2    p0, c0, [r0], #4
000dcf2c  lsrs    r0, r2, #0x15
000dcf2e  movs    r2, r0
