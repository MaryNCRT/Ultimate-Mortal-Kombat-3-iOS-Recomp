========================================================================
-[DMGController loadJSONFiles]  0x000ced3c  352 bytes   DMGController.mm
========================================================================

000ced3c  push    {r4, r5, r6, r7, lr}
000ced3e  add     r7, sp, #0xc
000ced40  push.w  {r8, sl, fp}
000ced44  sub     sp, #8
000ced46  ldr     r1, [pc, #0xfc]
000ced48  mov     sl, r0
000ced4a  ldr     r0, [pc, #0xfc]
000ced4c  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000ced4e  add     r0, pc ; -> 0x000fdb60  
000ced50  ldr     r1, [r1]
000ced52  ldr     r0, [r0]
000ced54  blx     #0xddbfc ; -> objc_msgSend
000ced58  ldr     r1, [pc, #0xf0]
000ced5a  add     r1, pc ; -> 0x000fcba8  '}\x1f\x0e'
000ced5c  ldr     r1, [r1]
000ced5e  blx     #0xddbfc ; -> objc_msgSend
000ced62  ldr     r1, [pc, #0xec]
000ced64  ldr     r2, [pc, #0xec]
000ced66  add     r1, pc ; -> 0x000fcfe4  
000ced68  add     r2, pc ; -> 0x001820d4  
000ced6a  ldr     r1, [r1]
000ced6c  str     r1, [sp, #4]
000ced6e  str     r0, [sp]
000ced70  blx     #0xddbfc ; -> objc_msgSend
000ced74  ldr     r1, [pc, #0xe0]
000ced76  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000ced78  ldr     r1, [r1]
000ced7a  mov     r4, r0
000ced7c  ldr     r0, [pc, #0xdc]
000ced7e  add     r0, pc ; -> 0x000fdb44  
000ced80  ldr     r0, [r0]
000ced82  blx     #0xddbfc ; -> objc_msgSend
000ced86  ldr     r1, [pc, #0xd8]
000ced88  mov     r2, r4
000ced8a  add     r1, pc ; -> 0x000fca5c  '\x05\x11\x0e'
000ced8c  ldr     r1, [r1]
000ced8e  blx     #0xddbfc ; -> objc_msgSend
000ced92  ldr     r1, [pc, #0xd0]
000ced94  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000ced96  ldr.w   fp, [r1]
000ced9a  mov     r1, fp
000ced9c  mov     r8, r0
000ced9e  blx     #0xddbfc ; -> objc_msgSend
000ceda2  cbnz    r0, #0xcedac
000ceda4  ldr     r0, [pc, #0xc0]
000ceda6  add     r0, pc ; -> 0x001820e4  
000ceda8  blx     #0xdd3e0 ; -> NSLog
000cedac  ldr     r1, [pc, #0xbc]
000cedae  ldr     r0, [pc, #0xc0]
000cedb0  ldr     r2, [pc, #0xc0]
000cedb2  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cedb4  add     r0, pc ; -> 0x000fdb5c  
000cedb6  ldr     r5, [r1]
000cedb8  ldr     r1, [pc, #0xbc]
000cedba  ldr     r6, [r0]
000cedbc  add     r2, pc ; -> 0x001820f4  
000cedbe  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000cedc0  mov     r0, r8
000cedc2  ldr     r1, [r1]
000cedc4  blx     #0xddbfc ; -> objc_msgSend
000cedc8  ldr     r4, [pc, #0xb0]
000cedca  mov     r1, r5
000cedcc  add     r4, pc ; -> 0x001816d4  
000cedce  mov     r2, r4
000cedd0  ldr     r4, [pc, #0xac]
000cedd2  add     r4, pc ; -> 0x000f9e44  OBJC_IVAR_$_DMGController.strings
000cedd4  mov     r3, r0
000cedd6  mov     r0, r6
000cedd8  blx     #0xddbfc ; -> objc_msgSend
000ceddc  ldr     r1, [sp, #4]
000cedde  mov     r2, r0
000cede0  ldr     r0, [sp]
000cede2  blx     #0xddbfc ; -> objc_msgSend
000cede6  ldr     r1, [pc, #0x9c]
000cede8  ldr     r3, [pc, #0x9c]
000cedea  ldr     r5, [r4]
000cedec  add     r1, pc ; -> 0x000fd8c8  '@\x15\x0f'
000cedee  add     r3, pc ; -> 0x00182104  
000cedf0  ldr     r1, [r1]
000cedf2  mov     r6, r0
000cedf4  mov     r2, r6
000cedf6  mov     r0, sl
000cedf8  blx     #0xddbfc ; -> objc_msgSend
000cedfc  mov     r1, fp
000cedfe  str.w   r0, [sl, r5]
000cee02  ldr     r3, [r4]
000cee04  ldr.w   r0, [sl, r3]
000cee08  blx     #0xddbfc ; -> objc_msgSend
000cee0c  cbnz    r0, #0xcee18
000cee0e  ldr     r0, [pc, #0x7c]
000cee10  mov     r1, r6
000cee12  add     r0, pc ; -> 0x00182114  
000cee14  blx     #0xdd3e0 ; -> NSLog
000cee18  ldr     r3, [pc, #0x74]
000cee1a  ldr     r1, [pc, #0x78]
000cee1c  add     r3, pc ; -> 0x000f9e44  OBJC_IVAR_$_DMGController.strings
000cee1e  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000cee20  ldr     r0, [r3]
000cee22  ldr     r1, [r1]
000cee24  ldr.w   r0, [sl, r0]
000cee28  blx     #0xddbfc ; -> objc_msgSend
000cee2c  ldr     r1, [pc, #0x68]
000cee2e  mov     r0, r8
000cee30  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cee32  ldr     r1, [r1]
000cee34  blx     #0xddbfc ; -> objc_msgSend
000cee38  sub.w   sp, r7, #0x18
000cee3c  pop.w   {r8, sl, fp}
000cee40  pop     {r4, r5, r6, r7, pc}
000cee42  nop     
000cee44  bgt     #0xcede0
000cee46  movs    r2, r0
000cee48  cdp     p0, #0, c0, c14, c2, #0
000cee4c  udf     #0x4a
000cee4e  movs    r2, r0
000cee50  b       #0xcf348
000cee52  movs    r2, r0
000cee54  adds    r3, #0x68
000cee56  movs    r3, r1
000cee58  bgt     #0xcee70
000cee5a  movs    r2, r0
000cee5c  stcl    p0, c0, [r2, #8]
000cee60  bgt     #0xcee00
000cee62  movs    r2, r0
000cee64  bgt     #0xcee38
000cee66  movs    r2, r0
000cee68  adds    r3, #0x3a
000cee6a  movs    r3, r1
000cee6c  bgt     #0xcee44
000cee6e  movs    r2, r0
000cee70  stc     p0, c0, [r4, #8]!
000cee74  adds    r3, #0x34
000cee76  movs    r3, r1
000cee78  ble     #0xceed8
000cee7a  movs    r2, r0
000cee7c  cmp     r1, #4
000cee7e  movs    r3, r1
000cee80  add     sp, #0x1b8
000cee82  movs    r2, r0
