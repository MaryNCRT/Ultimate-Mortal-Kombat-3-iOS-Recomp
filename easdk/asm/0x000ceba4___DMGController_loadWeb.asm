========================================================================
-[DMGController loadWeb  0x000ceba4  408 bytes   DMGController.mm
========================================================================

000ceba4  push    {r4, r5, r6, r7, lr}
000ceba6  add     r7, sp, #0xc
000ceba8  push.w  {r8, sl, fp}
000cebac  sub     sp, #0x34
000cebae  ldr     r1, [pc, #0x12c]
000cebb0  mov     r5, r0
000cebb2  ldr     r0, [pc, #0x12c]
000cebb4  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cebb6  str     r2, [sp, #0x28]
000cebb8  add     r0, pc ; -> 0x000fdb5c  
000cebba  ldr.w   r8, [r1]
000cebbe  ldr.w   sl, [r0]
000cebc2  ldr     r1, [pc, #0x120]
000cebc4  ldr     r0, [pc, #0x120]
000cebc6  ldr.w   fp, [pc, #0x124]
000cebca  add     r1, pc ; -> 0x000fd8d4  
000cebcc  add     r0, pc ; -> 0x000fdce4  
000cebce  ldr     r1, [r1]
000cebd0  ldr     r0, [r0]
000cebd2  blx     #0xddbfc ; -> objc_msgSend
000cebd6  ldr     r3, [pc, #0x118]
000cebd8  ldr     r1, [pc, #0x118]
000cebda  add     fp, pc ; -> 0x001820a4  
000cebdc  add     r3, pc ; -> 0x000f9e5c  OBJC_IVAR_$_DMGController.mGameId
000cebde  add     r1, pc ; -> 0x000fd8d0  
000cebe0  ldr     r3, [r3]
000cebe2  ldr     r1, [r1]
000cebe4  ldr     r3, [r5, r3]
000cebe6  str     r3, [sp, #0x30]
000cebe8  ldr     r3, [pc, #0x10c]
000cebea  add     r3, pc ; -> 0x000f9a34  OBJC_IVAR_$_DMGController.mLangCode
000cebec  ldr     r3, [r3]
000cebee  ldr     r6, [r5, r3]
000cebf0  str     r0, [sp, #0x2c]
000cebf2  ldr     r0, [pc, #0x108]
000cebf4  add     r0, pc ; -> 0x000fdb94  
000cebf6  ldr     r0, [r0]
000cebf8  blx     #0xddbfc ; -> objc_msgSend
000cebfc  ldr     r2, [pc, #0x100]
000cebfe  ldr     r1, [pc, #0x104]
000cec00  add     r2, pc ; -> 0x000f32d0  0x0
000cec02  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000cec04  ldr     r2, [r2]
000cec06  ldr     r1, [r1]
000cec08  ldr     r2, [r2]
000cec0a  blx     #0xddbfc ; -> objc_msgSend
000cec0e  ldr     r1, [pc, #0xf8]
000cec10  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
000cec12  ldr     r1, [r1]
000cec14  mov     r4, r0
000cec16  ldr     r0, [pc, #0xf4]
000cec18  add     r0, pc ; -> 0x000fdb50  
000cec1a  ldr     r0, [r0]
000cec1c  blx     #0xddbfc ; -> objc_msgSend
000cec20  ldr     r1, [pc, #0xec]
000cec22  add     r1, pc ; -> 0x000fcfa8  'AU\x0e'
000cec24  ldr     r1, [r1]
000cec26  blx     #0xddbfc ; -> objc_msgSend
000cec2a  ldr     r3, [sp, #0x30]
000cec2c  str     r6, [sp, #4]
000cec2e  str     r4, [sp, #8]
000cec30  mov     r1, r8
000cec32  str     r3, [sp]
000cec34  ldr     r3, [pc, #0xdc]
000cec36  mov     r2, fp
000cec38  add     r3, pc ; -> 0x000f9e50  OBJC_IVAR_$_DMGController.mApplicationSellID
000cec3a  str     r0, [sp, #0xc]
000cec3c  ldr     r3, [r3]
000cec3e  mov     r0, sl
000cec40  ldr     r3, [r5, r3]
000cec42  str     r3, [sp, #0x10]
000cec44  ldr     r3, [pc, #0xd0]
000cec46  add     r3, pc ; -> 0x000f3358  DMG_MAIN_SCREEN_WIDTH
000cec48  ldr     r3, [r3]
000cec4a  vldr    s14, [r3]
000cec4e  vcvt.f64.f32 d7, s14
000cec52  ldr     r3, [pc, #0xc8]
000cec54  add     r3, pc ; -> 0x000f3354  DMG_MAIN_SCREEN_HEIGHT
000cec56  ldr     r3, [r3]
000cec58  vstr    d7, [sp, #0x14]
000cec5c  vldr    s14, [r3]
000cec60  vcvt.f64.f32 d7, s14
000cec64  ldr     r3, [pc, #0xb8]
000cec66  add     r3, pc ; -> 0x000f9e48  OBJC_IVAR_$_DMGController.mHardwareID
000cec68  vstr    d7, [sp, #0x1c]
000cec6c  ldr     r3, [r3]
000cec6e  ldr     r3, [r5, r3]
000cec70  str     r3, [sp, #0x24]
000cec72  ldr     r3, [sp, #0x2c]
000cec74  blx     #0xddbfc ; -> objc_msgSend
000cec78  ldr     r3, [pc, #0xa8]
000cec7a  add     r3, pc ; -> 0x000f9e58  OBJC_IVAR_$_DMGController.mClientType
000cec7c  ldr     r3, [r3]
000cec7e  ldr     r3, [r5, r3]
000cec80  cmp     r3, #1
000cec82  mov     r6, r0
000cec84  it      eq
000cec86  moveq   r4, r0
000cec88  beq     #0xcecaa
000cec8a  ldr     r1, [pc, #0x9c]
000cec8c  ldr     r2, [pc, #0x9c]
000cec8e  ldr     r3, [sp, #0x28]
000cec90  add     r1, pc ; -> 0x000fcfe4  
000cec92  add     r2, pc ; -> 0x001820b4  
000cec94  ldr     r4, [r1]
000cec96  mov     r0, sl
000cec98  mov     r1, r8
000cec9a  blx     #0xddbfc ; -> objc_msgSend
000cec9e  mov     r1, r4
000ceca0  mov     r2, r0
000ceca2  mov     r0, r6
000ceca4  blx     #0xddbfc ; -> objc_msgSend
000ceca8  mov     r4, r0
000cecaa  ldr     r2, [pc, #0x84]
000cecac  mov     r1, r8
000cecae  mov     r3, r4
000cecb0  add     r2, pc ; -> 0x001820c4  
000cecb2  mov     r0, sl
000cecb4  blx     #0xddbfc ; -> objc_msgSend
000cecb8  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000cecbc  ldr     r3, [pc, #0x74]
000cecbe  ldr     r1, [pc, #0x78]
000cecc0  mov     r2, r4
000cecc2  add     r3, pc ; -> 0x000f9a28  OBJC_IVAR_$_DMGController.dmgView
000cecc4  add     r1, pc ; -> 0x000fd8cc  
000cecc6  ldr     r0, [r3]
000cecc8  ldr     r1, [r1]
000cecca  ldr     r0, [r5, r0]
000ceccc  blx     #0xddbfc ; -> objc_msgSend
000cecd0  sub.w   sp, r7, #0x18
000cecd4  pop.w   {r8, sl, fp}
000cecd8  pop     {r4, r5, r6, r7, pc}
000cecda  nop     
000cecdc  udf     #0xe8
000cecde  movs    r2, r0
000cece0  vaddl.s32 q0, d0, d2
000cece4  stc     p0, c0, [r6, #-8]
000cece8  adds.w  r0, r4, #2
000cecec  adds    r4, #0xc6
000cecee  movs    r3, r1
000cecf0  sxtb    r4, r7
000cecf2  movs    r2, r0
000cecf4  stcl    p0, c0, [lr], #8
000cecf8  add     r6, sp, #0x118
000cecfa  movs    r2, r0
000cecfc  vaddl.s16 q0, d12, d2
000ced00  mov     ip, sb
000ced02  movs    r2, r0
000ced04  udf     #0xce
000ced06  movs    r2, r0
000ced08  ble     #0xcecc4
000ced0a  movs    r2, r0
