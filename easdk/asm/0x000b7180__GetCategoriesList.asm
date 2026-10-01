========================================================================
GetCategoriesList  0x000b7180  232 bytes   EAMTX_Main.mm
========================================================================

000b7180  push    {r4, r5, r6, r7, lr}
000b7182  add     r7, sp, #0xc
000b7184  push.w  {r8, sl, fp}
000b7188  ldr     r4, [pc, #0xa4]
000b718a  mov     r5, r0
000b718c  add     r4, pc ; -> 0x0038c190  m_CategoriesList
000b718e  ldr     r0, [r4]
000b7190  cbz     r0, #0xb71a8
000b7192  ldr     r1, [pc, #0xa0]
000b7194  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000b7196  ldr     r1, [r1]
000b7198  blx     #0xddbfc ; -> objc_msgSend
000b719c  ldr     r1, [pc, #0x98]
000b719e  ldr     r0, [r4]
000b71a0  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000b71a2  ldr     r1, [r1]
000b71a4  blx     #0xddbfc ; -> objc_msgSend
000b71a8  ldr     r0, [pc, #0x90]
000b71aa  ldr     r1, [pc, #0x94]
000b71ac  add     r0, pc ; -> 0x000fdb70  
000b71ae  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b71b0  ldr     r0, [r0]
000b71b2  ldr     r1, [r1]
000b71b4  blx     #0xddbfc ; -> objc_msgSend
000b71b8  ldr     r1, [pc, #0x88]
000b71ba  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b71bc  ldr     r1, [r1]
000b71be  blx     #0xddbfc ; -> objc_msgSend
000b71c2  ldr     r3, [pc, #0x84]
000b71c4  ldr     r1, [pc, #0x84]
000b71c6  ldr     r2, [pc, #0x88]
000b71c8  add     r3, pc ; -> 0x0038c190  m_CategoriesList
000b71ca  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000b71cc  add     r2, pc ; -> 0x001800a4  
000b71ce  ldr     r1, [r1]
000b71d0  str     r0, [r3]
000b71d2  mov     r0, r5
000b71d4  blx     #0xddbfc ; -> objc_msgSend
000b71d8  ldr     r1, [pc, #0x78]
000b71da  movs    r5, #0
000b71dc  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000b71de  ldr.w   fp, [r1]
000b71e2  ldr     r1, [pc, #0x74]
000b71e4  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000b71e6  ldr.w   sl, [r1]
000b71ea  ldr     r1, [pc, #0x70]
000b71ec  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000b71ee  ldr.w   r8, [r1]
000b71f2  mov     r6, r0
000b71f4  b       #0xb7216
000b71f6  ldr     r0, [pc, #0x68]
000b71f8  mov     r2, r5
000b71fa  mov     r1, r8
000b71fc  add     r0, pc ; -> 0x0038c190  m_CategoriesList
000b71fe  adds    r5, #1
000b7200  ldr     r4, [r0]
000b7202  mov     r0, r6
000b7204  blx     #0xddbfc ; -> objc_msgSend
000b7208  bl      #0xb6ff4 ; -> Z14GetCategoryObjP12NSDictionary
000b720c  mov     r1, sl
000b720e  mov     r2, r0
000b7210  mov     r0, r4
000b7212  blx     #0xddbfc ; -> objc_msgSend
000b7216  mov     r0, r6
000b7218  mov     r1, fp
000b721a  blx     #0xddbfc ; -> objc_msgSend
000b721e  cmp     r0, r5
000b7220  bhi     #0xb71f6
000b7222  ldr     r0, [pc, #0x40]
000b7224  add     r0, pc ; -> 0x0038c190  m_CategoriesList
000b7226  ldr     r0, [r0]
000b7228  pop.w   {r8, sl, fp}
000b722c  pop     {r4, r5, r6, r7, pc}
000b722e  nop     
000b7230  str     r0, [r0, r0]
000b7232  movs    r5, r5
000b7234  ldr     r4, [r6, r3]
000b7236  movs    r4, r0
000b7238  ldrsb   r0, [r3, r7]
000b723a  movs    r4, r0
000b723c  ldr     r0, [r0, #0x1c]
000b723e  movs    r4, r0
000b7240  ldrsb   r2, [r2, r7]
000b7242  movs    r4, r0
000b7244  ldrsb   r2, [r0, r7]
000b7246  movs    r4, r0
000b7248  ldr     r7, [pc, #0x310]
000b724a  movs    r5, r5
000b724c  ldr     r2, [r4, r4]
000b724e  movs    r4, r0
000b7250  ldrh    r4, [r2, #0x36]
000b7252  movs    r4, r1
000b7254  ldr     r0, [r4, r2]
000b7256  movs    r4, r0
000b7258  ldr     r4, [r3, r2]
000b725a  movs    r4, r0
000b725c  ldr     r4, [r1, r2]
000b725e  movs    r4, r0
000b7260  ldr     r7, [pc, #0x240]
000b7262  movs    r5, r5
000b7264  ldr     r7, [pc, #0x1a0]
000b7266  movs    r5, r5
