========================================================================
-[EAMTX_MTXProduct dealloc]  0x000c8a78  216 bytes   EAMTX_MTXProduct.mm
========================================================================

000c8a78  push    {r4, r5, r7, lr}
000c8a7a  add     r7, sp, #8
000c8a7c  sub     sp, #8
000c8a7e  ldr     r3, [pc, #0xa0]
000c8a80  ldr     r1, [pc, #0xa0]
000c8a82  mov     r5, r0
000c8a84  add     r3, pc ; -> 0x000f806c  OBJC_IVAR_$_EAMTX_MTXProduct.m_Title
000c8a86  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c8a88  ldr     r3, [r3]
000c8a8a  ldr     r4, [r1]
000c8a8c  ldr     r0, [r0, r3]
000c8a8e  mov     r1, r4
000c8a90  blx     #0xddbfc ; -> objc_msgSend
000c8a94  ldr     r3, [pc, #0x90]
000c8a96  mov     r1, r4
000c8a98  add     r3, pc ; -> 0x000f8070  OBJC_IVAR_$_EAMTX_MTXProduct.m_Desc
000c8a9a  ldr     r3, [r3]
000c8a9c  ldr     r0, [r5, r3]
000c8a9e  blx     #0xddbfc ; -> objc_msgSend
000c8aa2  ldr     r3, [pc, #0x88]
000c8aa4  mov     r1, r4
000c8aa6  add     r3, pc ; -> 0x000f8074  OBJC_IVAR_$_EAMTX_MTXProduct.m_Version
000c8aa8  ldr     r3, [r3]
000c8aaa  ldr     r0, [r5, r3]
000c8aac  blx     #0xddbfc ; -> objc_msgSend
000c8ab0  ldr     r3, [pc, #0x7c]
000c8ab2  mov     r1, r4
000c8ab4  add     r3, pc ; -> 0x000f8078  OBJC_IVAR_$_EAMTX_MTXProduct.m_ProdIdentifier
000c8ab6  ldr     r3, [r3]
000c8ab8  ldr     r0, [r5, r3]
000c8aba  blx     #0xddbfc ; -> objc_msgSend
000c8abe  ldr     r3, [pc, #0x74]
000c8ac0  mov     r1, r4
000c8ac2  add     r3, pc ; -> 0x000f807c  OBJC_IVAR_$_EAMTX_MTXProduct.m_ReleaseDate
000c8ac4  ldr     r3, [r3]
000c8ac6  ldr     r0, [r5, r3]
000c8ac8  blx     #0xddbfc ; -> objc_msgSend
000c8acc  ldr     r3, [pc, #0x68]
000c8ace  mov     r1, r4
000c8ad0  add     r3, pc ; -> 0x000f8080  OBJC_IVAR_$_EAMTX_MTXProduct.m_Category
000c8ad2  ldr     r3, [r3]
000c8ad4  ldr     r0, [r5, r3]
000c8ad6  blx     #0xddbfc ; -> objc_msgSend
000c8ada  ldr     r3, [pc, #0x60]
000c8adc  mov     r1, r4
000c8ade  add     r3, pc ; -> 0x000f8084  OBJC_IVAR_$_EAMTX_MTXProduct.m_BinPack
000c8ae0  ldr     r3, [r3]
000c8ae2  ldr     r0, [r5, r3]
000c8ae4  blx     #0xddbfc ; -> objc_msgSend
000c8ae8  ldr     r3, [pc, #0x54]
000c8aea  mov     r1, r4
000c8aec  add     r3, pc ; -> 0x000f8088  OBJC_IVAR_$_EAMTX_MTXProduct.m_LocalCurrency
000c8aee  ldr     r3, [r3]
000c8af0  ldr     r0, [r5, r3]
000c8af2  blx     #0xddbfc ; -> objc_msgSend
000c8af6  ldr     r3, [pc, #0x4c]
000c8af8  mov     r1, r4
000c8afa  add     r3, pc ; -> 0x000f808c  OBJC_IVAR_$_EAMTX_MTXProduct.m_CurrencySymbol
000c8afc  ldr     r3, [r3]
000c8afe  ldr     r0, [r5, r3]
000c8b00  blx     #0xddbfc ; -> objc_msgSend
000c8b04  ldr     r3, [pc, #0x40]
000c8b06  ldr     r1, [pc, #0x44]
000c8b08  mov     r0, sp
000c8b0a  add     r3, pc ; -> 0x000fdd9c  
000c8b0c  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000c8b0e  ldr     r3, [r3]
000c8b10  ldr     r1, [r1]
000c8b12  str     r5, [sp]
000c8b14  str     r3, [sp, #4]
000c8b16  blx     #0xddc08 ; -> objc_msgSendSuper2
000c8b1a  sub.w   sp, r7, #8
000c8b1e  pop     {r4, r5, r7, pc}
