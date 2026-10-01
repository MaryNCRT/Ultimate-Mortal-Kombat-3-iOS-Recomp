========================================================================
PrepareProductsData  0x000bd8d8  296 bytes   EAMTX_Main.mm
========================================================================

000bd8d8  push    {r4, r5, r6, r7, lr}
000bd8da  add     r7, sp, #0xc
000bd8dc  push.w  {r8, sl}
000bd8e0  ldr     r0, [pc, #0xdc]
000bd8e2  ldr     r1, [pc, #0xe0]
000bd8e4  ldr     r4, [pc, #0xe0]
000bd8e6  add     r0, pc ; -> 0x000fdb70  
000bd8e8  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bd8ea  ldr.w   sl, [r0]
000bd8ee  ldr.w   r8, [r1]
000bd8f2  add     r4, pc ; -> 0x0038c194  m_BadgesDict
000bd8f4  mov     r0, sl
000bd8f6  mov     r1, r8
000bd8f8  blx     #0xddbfc ; -> objc_msgSend
000bd8fc  ldr     r1, [pc, #0xcc]
000bd8fe  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bd900  ldr     r6, [r1]
000bd902  mov     r1, r6
000bd904  blx     #0xddbfc ; -> objc_msgSend
000bd908  mov     r5, r0
000bd90a  bl      #0xb6470 ; -> Z20CheckMTXProductsListv
000bd90e  ldr     r3, [r4]
000bd910  cbnz    r3, #0xbd926
000bd912  ldr     r0, [pc, #0xbc]
000bd914  mov     r1, r8
000bd916  add     r0, pc ; -> 0x000fdbf4  
000bd918  ldr     r0, [r0]
000bd91a  blx     #0xddbfc ; -> objc_msgSend
000bd91e  mov     r1, r6
000bd920  blx     #0xddbfc ; -> objc_msgSend
000bd924  str     r0, [r4]
000bd926  ldr     r4, [pc, #0xac]
000bd928  add     r4, pc ; -> 0x0038c190  m_CategoriesList
000bd92a  ldr     r3, [r4]
000bd92c  cbnz    r3, #0xbd942
000bd92e  ldr     r0, [pc, #0xa8]
000bd930  mov     r1, r8
000bd932  add     r0, pc ; -> 0x000fdbf4  
000bd934  ldr     r0, [r0]
000bd936  blx     #0xddbfc ; -> objc_msgSend
000bd93a  mov     r1, r6
000bd93c  blx     #0xddbfc ; -> objc_msgSend
000bd940  str     r0, [r4]
000bd942  ldr     r4, [pc, #0x98]
000bd944  add     r4, pc ; -> 0x0038c0d4  prodSellIds
000bd946  ldr     r3, [r4]
000bd948  cbnz    r3, #0xbd95a
000bd94a  mov     r1, r8
000bd94c  mov     r0, sl
000bd94e  blx     #0xddbfc ; -> objc_msgSend
000bd952  mov     r1, r6
000bd954  blx     #0xddbfc ; -> objc_msgSend
000bd958  str     r0, [r4]
000bd95a  bl      #0xbd408 ; -> Z18CheckMTXControllerv
000bd95e  ldr     r1, [pc, #0x80]
000bd960  ldr     r2, [pc, #0x80]
000bd962  mov     r0, r5
000bd964  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000bd966  add     r2, pc ; -> 0x0038c0e8  mtxUserInfo
000bd968  ldr     r4, [r1]
000bd96a  ldr     r2, [r2]
000bd96c  mov     r1, r4
000bd96e  blx     #0xddbfc ; -> objc_msgSend
000bd972  ldr     r2, [pc, #0x74]
000bd974  mov     r0, r5
000bd976  mov     r1, r4
000bd978  add     r2, pc ; -> 0x0038c0bc  mtxProdsList
000bd97a  ldr     r2, [r2]
000bd97c  blx     #0xddbfc ; -> objc_msgSend
000bd980  ldr     r2, [pc, #0x68]
000bd982  mov     r0, r5
000bd984  mov     r1, r4
000bd986  add     r2, pc ; -> 0x0038c194  m_BadgesDict
000bd988  ldr     r2, [r2]
000bd98a  blx     #0xddbfc ; -> objc_msgSend
000bd98e  ldr     r0, [pc, #0x60]
000bd990  ldr     r1, [pc, #0x60]
000bd992  mov     r2, r5
000bd994  add     r0, pc ; -> 0x000fdb88  
000bd996  add     r1, pc ; -> 0x000fcadc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x164
000bd998  ldr     r0, [r0]
000bd99a  ldr     r1, [r1]
000bd99c  blx     #0xddbfc ; -> objc_msgSend
000bd9a0  ldr     r1, [pc, #0x54]
000bd9a2  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bd9a4  ldr     r1, [r1]
000bd9a6  mov     r4, r0
000bd9a8  mov     r0, r5
000bd9aa  blx     #0xddbfc ; -> objc_msgSend
000bd9ae  ldr     r1, [pc, #0x4c]
000bd9b0  mov     r0, r4
000bd9b2  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000bd9b4  ldr     r1, [r1]
000bd9b6  blx     #0xddbfc ; -> objc_msgSend
000bd9ba  pop.w   {r8, sl}
000bd9be  pop     {r4, r5, r6, r7, pc}
000bd9c0  lsls    r6, r0, #0xa
000bd9c2  movs    r4, r0
000bd9c4  eors    r0, r8, #3
000bd9c8  ldm.w   lr, {r2, r3, r5}
000bd9cc  orns    r0, lr, #3
000bd9d0  lsls    r2, r3, #0xb
000bd9d2  movs    r4, r0
000bd9d4  strd    r0, r0, [r4], #-0xb0
000bd9d8  lsls    r6, r7, #0xa
000bd9da  movs    r4, r0
000bd9dc  b       #0xbd8f8
000bd9de  movs    r4, r5
000bd9e0  adds.w  r0, ip, #3
000bd9e4  b       #0xbd8e4
000bd9e6  movs    r4, r5
000bd9e8  b       #0xbd86c
000bd9ea  movs    r4, r5
