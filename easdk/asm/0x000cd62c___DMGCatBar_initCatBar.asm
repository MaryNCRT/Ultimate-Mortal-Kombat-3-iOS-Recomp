========================================================================
-[DMGCatBar initCatBar  0x000cd62c  1052 bytes   DMGCatBar.mm
========================================================================

000cd62c  sub     sp, #8
000cd62e  push    {r4, r5, r6, r7, lr}
000cd630  add     r7, sp, #0xc
000cd632  push.w  {r8, sl, fp}
000cd636  sub     sp, #0x60
000cd638  add     r1, sp, #0x80
000cd63a  add     r4, sp, #0x80
000cd63c  stm.w   r1, {r2, r3}
000cd640  ldr     r3, [pc, #0x348]
000cd642  ldr     r1, [pc, #0x34c]
000cd644  str     r0, [sp, #0x58]
000cd646  add     r3, pc ; -> 0x000fddb4  
000cd648  add     r1, pc ; -> 0x000fccd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x35c
000cd64a  ldr     r3, [r3]
000cd64c  ldr.w   r8, [r1]
000cd650  add.w   ip, sp, #0x48
000cd654  str     r3, [sp, #0x5c]
000cd656  ldm.w   r4, {r0, r1, r2, r3}
000cd65a  stm.w   ip, {r0, r1, r2, r3}
000cd65e  add     r0, sp, #0x50
000cd660  ldm     r0, {r0, r1}
000cd662  stm.w   sp, {r0, r1}
000cd666  add     r0, sp, #0x58
000cd668  ldm.w   ip, {r2, r3}
000cd66c  mov     r1, r8
000cd66e  blx     #0xddc08 ; -> objc_msgSendSuper2
000cd672  mov     r4, r0
000cd674  cmp     r0, #0
000cd676  beq.w   #0xcd96e
000cd67a  ldr     r3, [pc, #0x318]
000cd67c  vmov.f32 s14, #5.000000e+00
000cd680  ldr.w   r1, [pc, #0x314]
000cd684  add     r3, pc ; -> 0x000f3310  DMG_BUTTON_WIDTH
000cd686  ldr     r5, [pc, #0x314]
000cd688  ldr     r2, [r3]
000cd68a  ldr     r3, [pc, #0x314]
000cd68c  add     r1, pc ; -> 0x000f9804  OBJC_IVAR_$_DMGCatBar.parentController
000cd68e  add     r5, pc ; -> 0x000f9800  OBJC_IVAR_$_DMGCatBar.background
000cd690  add     r3, pc ; -> 0x000f3358  DMG_MAIN_SCREEN_WIDTH
000cd692  ldr.w   sl, [r3]
000cd696  vldr    s12, [sl]
000cd69a  vdiv.f32 s14, s12, s14
000cd69e  ldr     r3, [pc, #0x304]
000cd6a0  add     r3, pc ; -> 0x000f330c  DMG_BUTTON_HEIGHT
000cd6a2  vstr    s14, [r2]
000cd6a6  ldr     r2, [r3]
000cd6a8  ldr     r3, [pc, #0x2fc]
000cd6aa  str     r3, [r2]
000cd6ac  str     r1, [sp, #0x1c]
000cd6ae  ldr     r2, [sp, #0x90]
000cd6b0  ldr     r3, [r1]
000cd6b2  ldr     r1, [pc, #0x2f8]
000cd6b4  str     r2, [r0, r3]
000cd6b6  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000cd6b8  ldr     r0, [pc, #0x2f4]
000cd6ba  ldr     r1, [r1]
000cd6bc  ldr     r6, [r5]
000cd6be  add     r0, pc ; -> 0x000fdbc8  
000cd6c0  ldr     r0, [r0]
000cd6c2  str     r1, [sp, #0x20]
000cd6c4  blx     #0xddbfc ; -> objc_msgSend
000cd6c8  ldr.w   r2, [sl]
000cd6cc  movs    r3, #0
000cd6ce  str     r3, [sp, #0x38]
000cd6d0  str     r3, [sp, #0x3c]
000cd6d2  ldr     r3, [pc, #0x2e0]
000cd6d4  str     r2, [sp, #0x40]
000cd6d6  add     r2, sp, #0x38
000cd6d8  str     r3, [sp, #0x44]
000cd6da  mov     ip, r0
000cd6dc  add     r0, sp, #0x40
000cd6de  ldm     r0, {r0, r1}
000cd6e0  stm.w   sp, {r0, r1}
000cd6e4  mov     r0, ip
000cd6e6  ldm     r2, {r2, r3}
000cd6e8  mov     r1, r8
000cd6ea  blx     #0xddbfc ; -> objc_msgSend
000cd6ee  ldr     r1, [pc, #0x2c8]
000cd6f0  ldr     r2, [pc, #0x2c8]
000cd6f2  add     r1, pc ; -> 0x000fccb8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x340
000cd6f4  add     r2, pc ; -> 0x00182b74  
000cd6f6  ldr.w   r8, [r1]
000cd6fa  mov     r1, r8
000cd6fc  str     r0, [r4, r6]
000cd6fe  ldr     r0, [pc, #0x2c0]
000cd700  ldr     r6, [pc, #0x2c0]
000cd702  add     r0, pc ; -> 0x000fdba8  
000cd704  add     r6, pc ; -> 0x000f97f4  OBJC_IVAR_$_DMGCatBar.buttonYou
000cd706  ldr.w   sl, [r0]
000cd70a  mov     r0, sl
000cd70c  blx     #0xddbfc ; -> objc_msgSend
000cd710  ldr     r1, [pc, #0x2b4]
000cd712  ldr     r3, [r5]
000cd714  ldr     r5, [pc, #0x2b4]
000cd716  add     r1, pc ; -> 0x000fcd9c  
000cd718  ldr     r1, [r1]
000cd71a  add     r5, pc ; -> 0x00182b44  
000cd71c  mov     r2, r0
000cd71e  ldr     r0, [r4, r3]
000cd720  blx     #0xddbfc ; -> objc_msgSend
000cd724  ldr     r0, [pc, #0x2a8]
000cd726  ldr     r3, [r6]
000cd728  ldr     r1, [sp, #0x20]
000cd72a  add     r0, pc ; -> 0x000fdd18  
000cd72c  ldr     r0, [r0]
000cd72e  str     r3, [sp, #0x18]
000cd730  str     r0, [sp, #0x24]
000cd732  blx     #0xddbfc ; -> objc_msgSend
000cd736  ldr     r1, [pc, #0x29c]
000cd738  ldr     r2, [pc, #0x29c]
000cd73a  add     r1, pc ; -> 0x000fdb28  
000cd73c  add     r2, pc ; -> 0x00182b84  
000cd73e  ldr     r1, [r1]
000cd740  str     r1, [sp, #0x28]
000cd742  ldr     r1, [sp, #0x1c]
000cd744  ldr     r3, [r1]
000cd746  ldr     r1, [pc, #0x294]
000cd748  add     r1, pc ; -> 0x000fda84  '5\x15\x0f'
000cd74a  ldr     r1, [r1]
000cd74c  mov     fp, r0
000cd74e  ldr     r0, [r4, r3]
000cd750  str     r1, [sp, #0x2c]
000cd752  blx     #0xddbfc ; -> objc_msgSend
000cd756  movs    r2, #1
000cd758  ldr     r1, [sp, #0x28]
000cd75a  str     r2, [sp]
000cd75c  mov     r2, r5
000cd75e  ldr     r5, [pc, #0x280]
000cd760  add     r5, pc ; -> 0x0017fe64  
000cd762  mov     r3, r0
000cd764  mov     r0, fp
000cd766  blx     #0xddbfc ; -> objc_msgSend
000cd76a  ldr     r2, [sp, #0x18]
000cd76c  mov     r1, r8
000cd76e  ldr.w   fp, [pc, #0x274]
000cd772  add     fp, pc ; -> 0x000f97ec  OBJC_IVAR_$_DMGCatBar.buttonNew
000cd774  str     r0, [r4, r2]
000cd776  ldr     r2, [pc, #0x270]
000cd778  mov     r0, sl
000cd77a  add     r2, pc ; -> 0x00182b94  
000cd77c  blx     #0xddbfc ; -> objc_msgSend
000cd780  ldr     r1, [pc, #0x268]
000cd782  ldr     r3, [r6]
000cd784  add     r1, pc ; -> 0x000fdb24  
000cd786  ldr     r1, [r1]
000cd788  mov     r2, r0
000cd78a  ldr     r0, [r4, r3]
000cd78c  str     r1, [sp, #0x30]
000cd78e  blx     #0xddbfc ; -> objc_msgSend
000cd792  ldr     r2, [pc, #0x25c]
000cd794  mov     r1, r8
000cd796  mov     r0, sl
000cd798  add     r2, pc ; -> 0x00182ba4  
000cd79a  blx     #0xddbfc ; -> objc_msgSend
000cd79e  ldr     r1, [pc, #0x254]
000cd7a0  ldr     r3, [r6]
000cd7a2  add     r1, pc ; -> 0x000fdb20  "u'\x0f"
000cd7a4  ldr     r1, [r1]
000cd7a6  mov     r2, r0
000cd7a8  ldr     r0, [r4, r3]
000cd7aa  str     r1, [sp, #0x34]
000cd7ac  blx     #0xddbfc ; -> objc_msgSend
000cd7b0  ldr.w   r3, [fp]
000cd7b4  ldr     r1, [sp, #0x20]
000cd7b6  ldr     r0, [sp, #0x24]
000cd7b8  str     r3, [sp, #0x14]
000cd7ba  blx     #0xddbfc ; -> objc_msgSend
000cd7be  ldr     r1, [sp, #0x1c]
000cd7c0  ldr     r2, [pc, #0x234]
000cd7c2  ldr     r3, [r1]
000cd7c4  add     r2, pc ; -> 0x00182bb4  
000cd7c6  ldr     r1, [sp, #0x2c]
000cd7c8  mov     r6, r0
000cd7ca  ldr     r0, [r4, r3]
000cd7cc  blx     #0xddbfc ; -> objc_msgSend
000cd7d0  movs    r2, #0
000cd7d2  ldr     r1, [sp, #0x28]
000cd7d4  str     r2, [sp]
000cd7d6  mov     r2, r5
000cd7d8  ldr     r5, [pc, #0x220]
000cd7da  add     r5, pc ; -> 0x00182b34  
000cd7dc  mov     r3, r0
000cd7de  mov     r0, r6
000cd7e0  blx     #0xddbfc ; -> objc_msgSend
000cd7e4  ldr     r3, [sp, #0x14]
000cd7e6  ldr     r2, [pc, #0x218]
000cd7e8  mov     r1, r8
000cd7ea  add     r2, pc ; -> 0x00182bc4  
000cd7ec  str     r0, [r4, r3]
000cd7ee  mov     r0, sl
000cd7f0  blx     #0xddbfc ; -> objc_msgSend
000cd7f4  ldr.w   r3, [fp]
000cd7f8  ldr     r1, [sp, #0x30]
000cd7fa  mov     r2, r0
000cd7fc  ldr     r0, [r4, r3]
000cd7fe  blx     #0xddbfc ; -> objc_msgSend
000cd802  ldr     r2, [pc, #0x200]
000cd804  mov     r1, r8
000cd806  mov     r0, sl
000cd808  add     r2, pc ; -> 0x00182bd4  
000cd80a  blx     #0xddbfc ; -> objc_msgSend
000cd80e  ldr.w   r3, [fp]
000cd812  ldr.w   fp, [pc, #0x1f4]
000cd816  ldr     r1, [sp, #0x34]
000cd818  add     fp, pc ; -> 0x000f97f0  OBJC_IVAR_$_DMGCatBar.buttonHot
000cd81a  mov     r2, r0
000cd81c  ldr     r0, [r4, r3]
000cd81e  blx     #0xddbfc ; -> objc_msgSend
000cd822  ldr.w   r1, [fp]
000cd826  ldr     r0, [sp, #0x24]
000cd828  str     r1, [sp, #0x10]
000cd82a  ldr     r1, [sp, #0x20]
000cd82c  blx     #0xddbfc ; -> objc_msgSend
000cd830  ldr     r2, [sp, #0x1c]
000cd832  ldr     r1, [sp, #0x2c]
000cd834  ldr     r3, [r2]
000cd836  ldr     r2, [pc, #0x1d4]
000cd838  add     r2, pc ; -> 0x00182be4  
000cd83a  mov     r6, r0
000cd83c  ldr     r0, [r4, r3]
000cd83e  blx     #0xddbfc ; -> objc_msgSend
000cd842  movs    r1, #0
000cd844  mov     r2, r5
000cd846  str     r1, [sp]
000cd848  ldr     r1, [sp, #0x28]
000cd84a  ldr     r5, [pc, #0x1c4]
000cd84c  add     r5, pc ; -> 0x00182b54  
000cd84e  mov     r3, r0
000cd850  mov     r0, r6
000cd852  blx     #0xddbfc ; -> objc_msgSend
000cd856  ldr     r2, [sp, #0x10]
000cd858  mov     r1, r8
000cd85a  str     r0, [r4, r2]
000cd85c  ldr     r2, [pc, #0x1b4]
000cd85e  mov     r0, sl
000cd860  add     r2, pc ; -> 0x00182bf4  
000cd862  blx     #0xddbfc ; -> objc_msgSend
000cd866  ldr.w   r3, [fp]
000cd86a  ldr     r1, [sp, #0x30]
000cd86c  mov     r2, r0
000cd86e  ldr     r0, [r4, r3]
000cd870  blx     #0xddbfc ; -> objc_msgSend
000cd874  ldr     r2, [pc, #0x1a0]
000cd876  mov     r1, r8
000cd878  mov     r0, sl
000cd87a  add     r2, pc ; -> 0x00182c04  
000cd87c  blx     #0xddbfc ; -> objc_msgSend
000cd880  ldr.w   r3, [fp]
000cd884  ldr.w   fp, [pc, #0x194]
000cd888  ldr     r1, [sp, #0x34]
000cd88a  add     fp, pc ; -> 0x000f97f8  OBJC_IVAR_$_DMGCatBar.buttonAll
000cd88c  mov     r2, r0
000cd88e  ldr     r0, [r4, r3]
000cd890  blx     #0xddbfc ; -> objc_msgSend
000cd894  ldr.w   r3, [fp]
000cd898  ldr     r1, [sp, #0x20]
000cd89a  ldr     r0, [sp, #0x24]
000cd89c  str     r3, [sp, #0xc]
000cd89e  blx     #0xddbfc ; -> objc_msgSend
000cd8a2  ldr     r1, [sp, #0x1c]
000cd8a4  ldr     r2, [pc, #0x178]
000cd8a6  ldr     r3, [r1]
000cd8a8  add     r2, pc ; -> 0x00182c14  
000cd8aa  ldr     r1, [sp, #0x2c]
000cd8ac  mov     r6, r0
000cd8ae  ldr     r0, [r4, r3]
000cd8b0  blx     #0xddbfc ; -> objc_msgSend
000cd8b4  movs    r2, #0
000cd8b6  ldr     r1, [sp, #0x28]
000cd8b8  str     r2, [sp]
000cd8ba  mov     r2, r5
000cd8bc  ldr     r5, [pc, #0x164]
000cd8be  add     r5, pc ; -> 0x00182b64  
000cd8c0  mov     r3, r0
000cd8c2  mov     r0, r6
000cd8c4  blx     #0xddbfc ; -> objc_msgSend
000cd8c8  ldr     r3, [sp, #0xc]
000cd8ca  ldr     r2, [pc, #0x15c]
000cd8cc  mov     r1, r8
000cd8ce  add     r2, pc ; -> 0x00182c24  
000cd8d0  str     r0, [r4, r3]
000cd8d2  mov     r0, sl
000cd8d4  blx     #0xddbfc ; -> objc_msgSend
000cd8d8  ldr.w   r3, [fp]
000cd8dc  ldr     r1, [sp, #0x30]
000cd8de  mov     r2, r0
000cd8e0  ldr     r0, [r4, r3]
000cd8e2  blx     #0xddbfc ; -> objc_msgSend
000cd8e6  ldr     r2, [pc, #0x144]
000cd8e8  mov     r1, r8
000cd8ea  mov     r0, sl
000cd8ec  add     r2, pc ; -> 0x00182c34  
000cd8ee  blx     #0xddbfc ; -> objc_msgSend
000cd8f2  ldr.w   r3, [fp]
000cd8f6  ldr.w   fp, [pc, #0x138]
000cd8fa  ldr     r1, [sp, #0x34]
000cd8fc  add     fp, pc ; -> 0x000f97fc  OBJC_IVAR_$_DMGCatBar.buttonSoon
000cd8fe  mov     r2, r0
000cd900  ldr     r0, [r4, r3]
000cd902  blx     #0xddbfc ; -> objc_msgSend
000cd906  ldr.w   r1, [fp]
000cd90a  ldr     r0, [sp, #0x24]
000cd90c  str     r1, [sp, #8]
000cd90e  ldr     r1, [sp, #0x20]
000cd910  blx     #0xddbfc ; -> objc_msgSend
000cd914  ldr     r2, [sp, #0x1c]
000cd916  ldr     r1, [sp, #0x2c]
000cd918  ldr     r3, [r2]
000cd91a  ldr     r2, [pc, #0x118]
000cd91c  add     r2, pc ; -> 0x00182c44  
000cd91e  mov     r6, r0
000cd920  ldr     r0, [r4, r3]
000cd922  blx     #0xddbfc ; -> objc_msgSend
000cd926  movs    r1, #0
000cd928  mov     r2, r5
000cd92a  str     r1, [sp]
000cd92c  ldr     r1, [sp, #0x28]
000cd92e  mov     r3, r0
000cd930  mov     r0, r6
000cd932  blx     #0xddbfc ; -> objc_msgSend
000cd936  ldr     r2, [sp, #8]
000cd938  mov     r1, r8
000cd93a  str     r0, [r4, r2]
000cd93c  ldr     r2, [pc, #0xf8]
000cd93e  mov     r0, sl
000cd940  add     r2, pc ; -> 0x00182c54  
000cd942  blx     #0xddbfc ; -> objc_msgSend
000cd946  ldr.w   r3, [fp]
000cd94a  ldr     r1, [sp, #0x30]
000cd94c  mov     r2, r0
000cd94e  ldr     r0, [r4, r3]
000cd950  blx     #0xddbfc ; -> objc_msgSend
000cd954  ldr     r2, [pc, #0xe4]
000cd956  mov     r1, r8
000cd958  mov     r0, sl
000cd95a  add     r2, pc ; -> 0x00182c64  
000cd95c  blx     #0xddbfc ; -> objc_msgSend
000cd960  ldr.w   r3, [fp]
000cd964  ldr     r1, [sp, #0x34]
000cd966  mov     r2, r0
000cd968  ldr     r0, [r4, r3]
000cd96a  blx     #0xddbfc ; -> objc_msgSend
000cd96e  ldr     r3, [pc, #0xd0]
000cd970  ldr     r2, [pc, #0xd0]
000cd972  mov     r0, r4
000cd974  add     r3, pc ; -> 0x000f9648  OBJC_IVAR_$_DMGCatBar.m_CurrCat
000cd976  add     r2, pc ; -> 0x00182b44  
000cd978  ldr     r3, [r3]
000cd97a  str     r2, [r4, r3]
000cd97c  sub.w   sp, r7, #0x18
000cd980  pop.w   {r8, sl, fp}
000cd984  pop.w   {r4, r5, r6, r7, lr}
000cd988  add     sp, #8
000cd98a  bx      lr
000cd98c  lsls    r2, r5, #0x1d
000cd98e  movs    r3, r0
