========================================================================
-[FacebookAgent fbDidLogin]  0x000dbee0  308 bytes   FacebookAgent.mm
========================================================================

000dbee0  push    {r4, r5, r6, r7, lr}
000dbee2  add     r7, sp, #0xc
000dbee4  sub     sp, #0x14
000dbee6  ldr     r4, [pc, #0xdc]
000dbee8  ldr     r1, [pc, #0xdc]
000dbeea  movs    r2, #1
000dbeec  add     r4, pc ; -> 0x000fc8b4  OBJC_IVAR_$_FacebookAgent.fbButton
000dbeee  add     r1, pc ; -> 0x000fd9c0  '\x04\x1c\x0f'
000dbef0  ldr     r3, [r4]
000dbef2  mov     r5, r0
000dbef4  ldr     r1, [r1]
000dbef6  movs    r6, #0
000dbef8  ldr     r0, [r0, r3]
000dbefa  blx     #0xddbfc ; -> objc_msgSend
000dbefe  ldr     r1, [pc, #0xcc]
000dbf00  ldr     r3, [r4]
000dbf02  add     r1, pc ; -> 0x000fcd68  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3f0
000dbf04  ldr     r0, [r5, r3]
000dbf06  ldr     r1, [r1]
000dbf08  blx     #0xddbfc ; -> objc_msgSend
000dbf0c  ldr     r3, [pc, #0xc0]
000dbf0e  ldr     r1, [pc, #0xc4]
000dbf10  add     r3, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dbf12  add     r1, pc ; -> 0x000fd9a8  
000dbf14  ldr     r3, [r3]
000dbf16  ldr     r1, [r1]
000dbf18  ldr     r0, [r5, r3]
000dbf1a  blx     #0xddbfc ; -> objc_msgSend
000dbf1e  ldr     r1, [pc, #0xb8]
000dbf20  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000dbf22  ldr     r1, [r1]
000dbf24  mov     r4, r0
000dbf26  ldr     r0, [pc, #0xb4]
000dbf28  add     r0, pc ; -> 0x000fdb58  
000dbf2a  ldr     r0, [r0]
000dbf2c  blx     #0xddbfc ; -> objc_msgSend
000dbf30  ldr     r3, [pc, #0xac]
000dbf32  ldr     r1, [pc, #0xb0]
000dbf34  mov     r2, r4
000dbf36  add     r3, pc ; -> 0x000fd9bc  'N\x1b\x0f'
000dbf38  add     r1, pc ; -> 0x000fd9b8  
000dbf3a  ldr     r3, [r3]
000dbf3c  ldr     r1, [r1]
000dbf3e  str     r5, [sp, #4]
000dbf40  str     r6, [sp, #0xc]
000dbf42  str     r3, [sp, #8]
000dbf44  ldr     r3, [pc, #0xa0]
000dbf46  str     r6, [sp, #0x10]
000dbf48  str     r3, [sp]
000dbf4a  ldr     r3, [pc, #0xa0]
000dbf4c  blx     #0xddbfc ; -> objc_msgSend
000dbf50  ldr     r1, [pc, #0x9c]
000dbf52  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000dbf54  ldr     r1, [r1]
000dbf56  blx     #0xddbfc ; -> objc_msgSend
000dbf5a  ldr     r1, [pc, #0x98]
000dbf5c  add     r1, pc ; -> 0x000fd9b4  
000dbf5e  ldr     r1, [r1]
000dbf60  mov     r4, r0
000dbf62  ldr     r0, [pc, #0x94]
000dbf64  add     r0, pc ; -> 0x000fdd00  
000dbf66  ldr     r0, [r0]
000dbf68  blx     #0xddbfc ; -> objc_msgSend
000dbf6c  ldr     r3, [pc, #0x8c]
000dbf6e  ldr     r1, [pc, #0x90]
000dbf70  mov     r2, r4
000dbf72  add     r3, pc ; -> 0x000f32e0  0x0
000dbf74  add     r1, pc ; -> 0x000fd9b0  
000dbf76  ldr     r3, [r3]
000dbf78  ldr     r1, [r1]
000dbf7a  ldr     r3, [r3]
000dbf7c  blx     #0xddbfc ; -> objc_msgSend
000dbf80  ldr     r3, [pc, #0x80]
000dbf82  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dbf84  ldr     r3, [r3]
000dbf86  ldr     r3, [r5, r3]
000dbf88  cmp     r3, #5
000dbf8a  bne     #0xdbf9a
000dbf8c  ldr     r1, [pc, #0x78]
000dbf8e  movs    r2, #1
000dbf90  mov     r0, r5
000dbf92  add     r1, pc ; -> 0x000fd9ac  'i\x1b\x0f'
000dbf94  mov     r3, r2
000dbf96  ldr     r1, [r1]
000dbf98  b       #0xdbfb8
000dbf9a  cmp     r3, #4
000dbf9c  bne     #0xdbfac
000dbf9e  ldr     r1, [pc, #0x6c]
000dbfa0  subs    r3, #3
000dbfa2  mov     r0, r5
000dbfa4  add     r1, pc ; -> 0x000fd9ac  'i\x1b\x0f'
000dbfa6  mov     r2, r6
000dbfa8  ldr     r1, [r1]
000dbfaa  b       #0xdbfb8
000dbfac  ldr     r1, [pc, #0x60]
000dbfae  movs    r2, #1
000dbfb0  mov     r0, r5
000dbfb2  add     r1, pc ; -> 0x000fd9ac  'i\x1b\x0f'
000dbfb4  mov     r3, r6
000dbfb6  ldr     r1, [r1]
000dbfb8  blx     #0xddbfc ; -> objc_msgSend
000dbfbc  sub.w   sp, r7, #0xc
000dbfc0  pop     {r4, r5, r6, r7, pc}
000dbfc2  nop     
000dbfc4  lsrs    r4, r0, #7
000dbfc6  movs    r2, r0
000dbfc8  subs    r6, r1, r3
000dbfca  movs    r2, r0
000dbfcc  lsrs    r2, r4, #0x19
000dbfce  movs    r2, r0
000dbfd0  lsrs    r4, r4, #6
000dbfd2  movs    r2, r0
000dbfd4  subs    r2, r2, r2
000dbfd6  movs    r2, r0
000dbfd8  lsrs    r0, r4, #9
000dbfda  movs    r2, r0
000dbfdc  adds    r4, r5, #0
000dbfde  movs    r2, r0
000dbfe0  subs    r2, r0, r2
000dbfe2  movs    r2, r0
000dbfe4  subs    r4, r7, r1
000dbfe6  movs    r2, r0
000dbfe8  ldr     r1, [sp, #0x264]
000dbfea  subs    r7, #0xb9
000dbfec  ldr     r1, [sp, #0x268]
000dbfee  ldr     r1, [sp, #0x264]
000dbff0  lsrs    r2, r0, #0xc
000dbff2  movs    r2, r0
000dbff4  subs    r4, r2, r1
000dbff6  movs    r2, r0
000dbff8  adds    r0, r3, #6
000dbffa  movs    r2, r0
000dbffc  strb    r2, [r5, #0xd]
000dbffe  movs    r1, r0
000dc000  subs    r0, r7, r0
000dc002  movs    r2, r0
000dc004  lsrs    r2, r0, #5
000dc006  movs    r2, r0
000dc008  subs    r6, r2, r0
000dc00a  movs    r2, r0
000dc00c  subs    r4, r0, r0
000dc00e  movs    r2, r0
000dc010  adds    r6, r6, r7
000dc012  movs    r2, r0
