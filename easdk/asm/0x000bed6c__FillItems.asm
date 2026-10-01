========================================================================
FillItems  0x000bed6c  2324 bytes   EAMTX_Main.mm
========================================================================

000bed6c  push    {r4, r5, r6, r7, lr}
000bed6e  add     r7, sp, #0xc
000bed70  push.w  {r8, sl, fp}
000bed74  sub     sp, #0xc8
000bed76  mov     r4, r0
000bed78  str     r1, [sp, #8]
000bed7a  ldr.w   r0, [pc, #0x770]
000bed7e  ldr.w   r1, [pc, #0x770]
000bed82  add     r0, pc ; -> 0x000fdbb4  
000bed84  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000bed86  ldr     r0, [r0]
000bed88  ldr     r1, [r1]
000bed8a  blx     #0xddbfc ; -> objc_msgSend
000bed8e  ldr.w   r1, [pc, #0x764]
000bed92  add     r1, pc ; -> 0x000fd418  
000bed94  ldr     r1, [r1]
000bed96  mov     r2, r0
000bed98  ldr.w   r0, [pc, #0x75c]
000bed9c  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000bed9e  ldr     r0, [r0]
000beda0  blx     #0xddbfc ; -> objc_msgSend
000beda4  ldr.w   r1, [pc, #0x754]
000beda8  ldr.w   r2, [pc, #0x754]
000bedac  mov     r0, r4
000bedae  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000bedb0  add     r2, pc ; -> 0x00180a84  
000bedb2  ldr     r1, [r1]
000bedb4  ldr.w   r4, [pc, #0x74c]
000bedb8  str     r1, [sp, #0xc]
000bedba  blx     #0xddbfc ; -> objc_msgSend
000bedbe  add     r4, pc ; -> 0x0038c0bc  mtxProdsList
000bedc0  ldr     r3, [r4]
000bedc2  str     r0, [sp, #0x10]
000bedc4  cbnz    r3, #0xbede8
000bedc6  ldr.w   r0, [pc, #0x740]
000bedca  ldr.w   r1, [pc, #0x740]
000bedce  add     r0, pc ; -> 0x000fdbf4  
000bedd0  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bedd2  ldr     r0, [r0]
000bedd4  ldr     r1, [r1]
000bedd6  blx     #0xddbfc ; -> objc_msgSend
000bedda  ldr.w   r1, [pc, #0x734]
000bedde  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bede0  ldr     r1, [r1]
000bede2  blx     #0xddbfc ; -> objc_msgSend
000bede6  str     r0, [r4]
000bede8  ldr.w   r4, [pc, #0x728]
000bedec  add     r4, pc ; -> 0x0038c0d4  prodSellIds
000bedee  ldr     r3, [r4]
000bedf0  cbnz    r3, #0xbee14
000bedf2  ldr.w   r0, [pc, #0x724]
000bedf6  ldr.w   r1, [pc, #0x724]
000bedfa  add     r0, pc ; -> 0x000fdb70  
000bedfc  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bedfe  ldr     r0, [r0]
000bee00  ldr     r1, [r1]
000bee02  blx     #0xddbfc ; -> objc_msgSend
000bee06  ldr.w   r1, [pc, #0x718]
000bee0a  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bee0c  ldr     r1, [r1]
000bee0e  blx     #0xddbfc ; -> objc_msgSend
000bee12  str     r0, [r4]
000bee14  ldr.w   r1, [pc, #0x70c]
000bee18  ldr.w   r0, [pc, #0x70c]
000bee1c  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bee1e  add     r0, pc ; -> 0x000fdb70  
000bee20  ldr     r1, [r1]
000bee22  ldr     r0, [r0]
000bee24  str     r1, [sp, #0xc4]
000bee26  blx     #0xddbfc ; -> objc_msgSend
000bee2a  ldr.w   r1, [pc, #0x700]
000bee2e  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bee30  ldr     r1, [r1]
000bee32  str     r1, [sp, #0xc0]
000bee34  blx     #0xddbfc ; -> objc_msgSend
000bee38  ldr.w   r1, [pc, #0x6f4]
000bee3c  ldr.w   r3, [pc, #0x6f4]
000bee40  movs    r2, #0
000bee42  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000bee44  add     r3, pc ; -> 0x0038c19c  bHasPaidItems
000bee46  ldr     r1, [r1]
000bee48  strb    r2, [r3]
000bee4a  str     r1, [sp, #0x18]
000bee4c  ldr.w   r1, [pc, #0x6e8]
000bee50  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000bee52  ldr     r1, [r1]
000bee54  str     r1, [sp, #0x1c]
000bee56  ldr.w   r1, [pc, #0x6e4]
000bee5a  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000bee5c  ldr     r1, [r1]
000bee5e  str     r1, [sp, #0x24]
000bee60  ldr.w   r1, [pc, #0x6dc]
000bee64  str     r0, [sp, #0x14]
000bee66  ldr.w   r0, [pc, #0x6dc]
000bee6a  add     r1, pc ; -> 0x000fd414  
000bee6c  ldr     r1, [r1]
000bee6e  add     r0, pc ; -> 0x000fdca0  
000bee70  ldr     r0, [r0]
000bee72  str     r1, [sp, #0x28]
000bee74  ldr.w   r1, [pc, #0x6d0]
000bee78  str     r0, [sp, #0x20]
000bee7a  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bee7c  ldr.w   r0, [pc, #0x6cc]
000bee80  ldr     r1, [r1]
000bee82  add     r0, pc ; -> 0x000fdb5c  
000bee84  str     r1, [sp, #0x2c]
000bee86  ldr.w   r1, [pc, #0x6c8]
000bee8a  ldr.w   sl, [r0]
000bee8e  ldr.w   r0, [pc, #0x6c4]
000bee92  add     r1, pc ; -> 0x000fd3d8  
000bee94  ldr     r1, [r1]
000bee96  add     r0, pc ; -> 0x000fdc88  
000bee98  str     r1, [sp, #0x30]
000bee9a  ldr.w   r1, [pc, #0x6bc]
000bee9e  add     r1, pc ; -> 0x000fd410  
000beea0  ldr     r1, [r1]
000beea2  str     r1, [sp, #0x34]
000beea4  ldr.w   r1, [pc, #0x6b4]
000beea8  add     r1, pc ; -> 0x000fd60c  
000beeaa  ldr     r1, [r1]
000beeac  str     r1, [sp, #0x38]
000beeae  ldr.w   r1, [pc, #0x6b0]
000beeb2  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000beeb4  ldr     r1, [r1]
000beeb6  str     r1, [sp, #0x3c]
000beeb8  ldr.w   r1, [pc, #0x6a8]
000beebc  add     r1, pc ; -> 0x000fcb24  '\x1c=\x0e'
000beebe  ldr.w   fp, [r1]
000beec2  ldr.w   r1, [pc, #0x6a4]
000beec6  add     r1, pc ; -> 0x000fd20c  
000beec8  ldr     r1, [r1]
000beeca  str     r1, [sp, #0x40]
000beecc  ldr.w   r1, [pc, #0x69c]
000beed0  add     r1, pc ; -> 0x000fd1f4  
000beed2  ldr     r1, [r1]
000beed4  str     r1, [sp, #0x44]
000beed6  ldr.w   r1, [pc, #0x698]
000beeda  add     r1, pc ; -> 0x000fcfe4  
000beedc  ldr     r1, [r1]
000beede  str     r1, [sp, #0x48]
000beee0  ldr.w   r1, [pc, #0x690]
000beee4  add     r1, pc ; -> 0x000fd40c  
000beee6  ldr     r1, [r1]
000beee8  str     r1, [sp, #0x4c]
000beeea  ldr.w   r1, [pc, #0x68c]
000beeee  add     r1, pc ; -> 0x000fd3d4  
000beef0  ldr     r1, [r1]
000beef2  str     r1, [sp, #0x50]
000beef4  ldr.w   r1, [pc, #0x684]
000beef8  ldr     r0, [r0]
000beefa  add     r1, pc ; -> 0x000fd408  
000beefc  ldr     r1, [r1]
000beefe  str     r0, [sp, #0x5c]
000bef00  str     r1, [sp, #0x54]
000bef02  ldr.w   r1, [pc, #0x67c]
000bef06  add     r1, pc ; -> 0x000fd3d0  
000bef08  ldr     r1, [r1]
000bef0a  str     r1, [sp, #0x58]
000bef0c  ldr.w   r1, [pc, #0x674]
000bef10  add     r1, pc ; -> 0x000fd57c  
000bef12  ldr     r1, [r1]
000bef14  str     r1, [sp, #0x60]
000bef16  ldr.w   r1, [pc, #0x670]
000bef1a  add     r1, pc ; -> 0x000fd404  
000bef1c  ldr     r1, [r1]
000bef1e  str     r1, [sp, #0x64]
000bef20  ldr.w   r1, [pc, #0x668]
000bef24  add     r1, pc ; -> 0x000fd400  
000bef26  ldr     r1, [r1]
000bef28  str     r1, [sp, #0x68]
000bef2a  ldr.w   r1, [pc, #0x664]
000bef2e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bef30  ldr     r1, [r1]
000bef32  str     r1, [sp, #0x6c]
000bef34  ldr.w   r1, [pc, #0x65c]
000bef38  add     r1, pc ; -> 0x000fd460  
000bef3a  ldr     r1, [r1]
000bef3c  str     r1, [sp, #0x70]
000bef3e  ldr.w   r1, [pc, #0x658]
000bef42  add     r1, pc ; -> 0x000fd3fc  
000bef44  ldr     r1, [r1]
000bef46  str     r1, [sp, #0x74]
000bef48  ldr.w   r1, [pc, #0x650]
000bef4c  add     r1, pc ; -> 0x000fd3cc  
000bef4e  ldr     r1, [r1]
000bef50  str     r1, [sp, #0x78]
000bef52  ldr.w   r1, [pc, #0x64c]
000bef56  add     r1, pc ; -> 0x000fd3f8  
000bef58  ldr     r1, [r1]
000bef5a  str     r1, [sp, #0x7c]
000bef5c  ldr.w   r1, [pc, #0x644]
000bef60  add     r1, pc ; -> 0x000fd3c8  
000bef62  ldr     r1, [r1]
000bef64  str     r1, [sp, #0x80]
000bef66  ldr.w   r1, [pc, #0x640]
000bef6a  add     r1, pc ; -> 0x000fd4b0  
000bef6c  ldr     r1, [r1]
000bef6e  str     r1, [sp, #0x84]
000bef70  ldr.w   r1, [pc, #0x638]
000bef74  add     r1, pc ; -> 0x000fd3f4  
000bef76  ldr     r1, [r1]
000bef78  str     r1, [sp, #0x88]
000bef7a  ldr.w   r1, [pc, #0x634]
000bef7e  add     r1, pc ; -> 0x000fd6d0  
000bef80  ldr     r1, [r1]
000bef82  str     r1, [sp, #0x8c]
000bef84  ldr.w   r1, [pc, #0x62c]
000bef88  add     r1, pc ; -> 0x000fd3f0  
000bef8a  ldr     r1, [r1]
000bef8c  str     r1, [sp, #0x90]
000bef8e  ldr.w   r1, [pc, #0x628]
000bef92  add     r1, pc ; -> 0x000fd3ec  
000bef94  ldr     r1, [r1]
000bef96  str     r1, [sp, #0x94]
000bef98  ldr.w   r1, [pc, #0x620]
000bef9c  str     r2, [sp, #0xbc]
000bef9e  add     r1, pc ; -> 0x000fd6a0  
000befa0  ldr     r1, [r1]
000befa2  str     r1, [sp, #0x98]
000befa4  ldr.w   r1, [pc, #0x618]
000befa8  add     r1, pc ; -> 0x000fd3e8  
000befaa  ldr     r1, [r1]
000befac  str     r1, [sp, #0x9c]
000befae  ldr.w   r1, [pc, #0x614]
000befb2  add     r1, pc ; -> 0x000fd3e4  
000befb4  ldr     r1, [r1]
000befb6  str     r1, [sp, #0xa0]
000befb8  ldr.w   r1, [pc, #0x60c]
000befbc  add     r1, pc ; -> 0x000fd3e0  
000befbe  ldr     r1, [r1]
000befc0  str     r1, [sp, #0xa4]
000befc2  ldr.w   r1, [pc, #0x608]
000befc6  add     r1, pc ; -> 0x000fd3dc  
000befc8  ldr     r1, [r1]
000befca  str     r1, [sp, #0xa8]
000befcc  ldr.w   r1, [pc, #0x600]
000befd0  add     r1, pc ; -> 0x000fd63c  
000befd2  ldr     r1, [r1]
000befd4  str     r1, [sp, #0xac]
000befd6  ldr.w   r1, [pc, #0x5fc]
000befda  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000befdc  ldr     r1, [r1]
000befde  str     r1, [sp, #0xb0]
000befe0  b       #0xbf2dc
000befe2  ldr     r2, [sp, #0xbc]
000befe4  ldr     r1, [sp, #0x1c]
000befe6  ldr     r0, [sp, #0x10]
000befe8  blx     #0xddbfc ; -> objc_msgSend
000befec  ldr     r1, [sp, #0xc4]
000befee  ldr.w   r4, [pc, #0x5e8]
000beff2  add     r4, pc ; -> 0x00180a94  
000beff4  mov     r8, r0
000beff6  ldr     r0, [sp, #0x20]
000beff8  blx     #0xddbfc ; -> objc_msgSend
000beffc  ldr     r1, [sp, #0xc0]
000beffe  blx     #0xddbfc ; -> objc_msgSend
000bf002  ldr.w   r2, [pc, #0x5d8]
000bf006  ldr     r1, [sp, #0xc]
000bf008  add     r2, pc ; -> 0x0017fed4  
000bf00a  mov     r5, r0
000bf00c  mov     r0, r8
000bf00e  blx     #0xddbfc ; -> objc_msgSend
000bf012  ldr     r1, [sp, #0x24]
000bf014  blx     #0xddbfc ; -> objc_msgSend
000bf018  ldr     r1, [sp, #0x28]
000bf01a  mov     r2, r0
000bf01c  mov     r0, r5
000bf01e  blx     #0xddbfc ; -> objc_msgSend
000bf022  ldr     r1, [sp, #0x30]
000bf024  mov     r0, r5
000bf026  blx     #0xddbfc ; -> objc_msgSend
000bf02a  mov     r2, r4
000bf02c  ldr     r1, [sp, #0x2c]
000bf02e  mov     r3, r0
000bf030  mov     r0, sl
000bf032  blx     #0xddbfc ; -> objc_msgSend
000bf036  ldr     r1, [sp, #0x34]
000bf038  mov     r2, r0
000bf03a  mov     r0, r5
000bf03c  blx     #0xddbfc ; -> objc_msgSend
000bf040  ldr     r1, [sp, #0x38]
000bf042  mov     r0, r5
000bf044  blx     #0xddbfc ; -> objc_msgSend
000bf048  ldr     r1, [sp, #0x3c]
000bf04a  blx     #0xddbfc ; -> objc_msgSend
000bf04e  ldr.w   r2, [pc, #0x590]
000bf052  ldr     r1, [sp, #0xc]
000bf054  mov     r0, r8
000bf056  add     r2, pc ; -> 0x0017fe24  
000bf058  blx     #0xddbfc ; -> objc_msgSend
000bf05c  mov     r1, fp
000bf05e  mov     r2, r0
000bf060  mov     r0, sl
000bf062  blx     #0xddbfc ; -> objc_msgSend
000bf066  ldr     r1, [sp, #0xc4]
000bf068  mov     r4, r0
000bf06a  mov     r0, sl
000bf06c  blx     #0xddbfc ; -> objc_msgSend
000bf070  ldr     r1, [sp, #0xc0]
000bf072  blx     #0xddbfc ; -> objc_msgSend
000bf076  ldr     r1, [sp, #0x40]
000bf078  mov     r2, r0
000bf07a  mov     r0, r5
000bf07c  blx     #0xddbfc ; -> objc_msgSend
000bf080  ldr     r1, [sp, #0x44]
000bf082  mov     r0, r5
000bf084  blx     #0xddbfc ; -> objc_msgSend
000bf088  mov     r2, r4
000bf08a  ldr     r1, [sp, #0x48]
000bf08c  blx     #0xddbfc ; -> objc_msgSend
000bf090  ldr     r1, [sp, #0x40]
000bf092  mov     r2, r0
000bf094  mov     r0, r5
000bf096  blx     #0xddbfc ; -> objc_msgSend
000bf09a  ldr.w   r2, [pc, #0x548]
000bf09e  ldr     r1, [sp, #0xc]
000bf0a0  mov     r0, r8
000bf0a2  add     r2, pc ; -> 0x00180aa4  
000bf0a4  blx     #0xddbfc ; -> objc_msgSend
000bf0a8  mov     r1, fp
000bf0aa  mov     r2, r0
000bf0ac  mov     r0, sl
000bf0ae  blx     #0xddbfc ; -> objc_msgSend
000bf0b2  ldr     r1, [sp, #0xc4]
000bf0b4  mov     r4, r0
000bf0b6  mov     r0, sl
000bf0b8  blx     #0xddbfc ; -> objc_msgSend
000bf0bc  ldr     r1, [sp, #0xc0]
000bf0be  blx     #0xddbfc ; -> objc_msgSend
000bf0c2  ldr     r1, [sp, #0x4c]
000bf0c4  mov     r2, r0
000bf0c6  mov     r0, r5
000bf0c8  blx     #0xddbfc ; -> objc_msgSend
000bf0cc  ldr     r1, [sp, #0x50]
000bf0ce  mov     r0, r5
000bf0d0  blx     #0xddbfc ; -> objc_msgSend
000bf0d4  mov     r2, r4
000bf0d6  ldr     r1, [sp, #0x48]
000bf0d8  blx     #0xddbfc ; -> objc_msgSend
000bf0dc  ldr     r1, [sp, #0x4c]
000bf0de  mov     r2, r0
000bf0e0  mov     r0, r5
000bf0e2  blx     #0xddbfc ; -> objc_msgSend
000bf0e6  ldr.w   r2, [pc, #0x500]
000bf0ea  ldr     r1, [sp, #0xc]
000bf0ec  mov     r0, r8
000bf0ee  add     r2, pc ; -> 0x00180ab4  
000bf0f0  blx     #0xddbfc ; -> objc_msgSend
000bf0f4  mov     r1, fp
000bf0f6  mov     r2, r0
000bf0f8  mov     r0, sl
000bf0fa  blx     #0xddbfc ; -> objc_msgSend
000bf0fe  ldr     r1, [sp, #0xc4]
000bf100  mov     r4, r0
000bf102  mov     r0, sl
000bf104  blx     #0xddbfc ; -> objc_msgSend
000bf108  ldr     r1, [sp, #0xc0]
000bf10a  blx     #0xddbfc ; -> objc_msgSend
000bf10e  ldr     r1, [sp, #0x54]
000bf110  mov     r2, r0
000bf112  mov     r0, r5
000bf114  blx     #0xddbfc ; -> objc_msgSend
000bf118  ldr     r1, [sp, #0x58]
000bf11a  mov     r0, r5
000bf11c  blx     #0xddbfc ; -> objc_msgSend
000bf120  mov     r2, r4
000bf122  ldr     r1, [sp, #0x48]
000bf124  blx     #0xddbfc ; -> objc_msgSend
000bf128  ldr     r1, [sp, #0x54]
000bf12a  mov     r2, r0
000bf12c  mov     r0, r5
000bf12e  blx     #0xddbfc ; -> objc_msgSend
000bf132  ldr.w   r2, [pc, #0x4b8]
000bf136  ldr     r1, [sp, #0xc]
000bf138  mov     r0, r8
000bf13a  add     r2, pc ; -> 0x00180ac4  
000bf13c  blx     #0xddbfc ; -> objc_msgSend
000bf140  mov     r1, fp
000bf142  mov     r2, r0
000bf144  mov     r0, sl
000bf146  blx     #0xddbfc ; -> objc_msgSend
000bf14a  ldr     r1, [sp, #0xc4]
000bf14c  mov     r6, r0
000bf14e  ldr     r0, [sp, #0x5c]
000bf150  blx     #0xddbfc ; -> objc_msgSend
000bf154  ldr     r1, [sp, #0xc0]
000bf156  blx     #0xddbfc ; -> objc_msgSend
000bf15a  ldr.w   r2, [pc, #0x494]
000bf15e  ldr     r1, [sp, #0x60]
000bf160  add     r2, pc ; -> 0x00180ad4  
000bf162  mov     r4, r0
000bf164  blx     #0xddbfc ; -> objc_msgSend
000bf168  mov     r0, r4
000bf16a  ldr     r1, [sp, #0x64]
000bf16c  mov     r2, r6
000bf16e  blx     #0xddbfc ; -> objc_msgSend
000bf172  ldr     r1, [sp, #0x68]
000bf174  mov     r2, r0
000bf176  mov     r0, r5
000bf178  blx     #0xddbfc ; -> objc_msgSend
000bf17c  mov     r0, r4
000bf17e  ldr     r1, [sp, #0x6c]
000bf180  blx     #0xddbfc ; -> objc_msgSend
000bf184  ldr.w   r2, [pc, #0x46c]
000bf188  ldr     r1, [sp, #0xc]
000bf18a  mov     r0, r8
000bf18c  add     r2, pc ; -> 0x00180ae4  
000bf18e  blx     #0xddbfc ; -> objc_msgSend
000bf192  mov     r1, fp
000bf194  mov     r2, r0
000bf196  mov     r0, sl
000bf198  blx     #0xddbfc ; -> objc_msgSend
000bf19c  ldr     r1, [sp, #0x70]
000bf19e  mov     r2, r0
000bf1a0  ldr.w   r0, [pc, #0x454]
000bf1a4  add     r0, pc ; -> 0x0038c0e4  mtxController
000bf1a6  ldr     r0, [r0]
000bf1a8  blx     #0xddbfc ; -> objc_msgSend
000bf1ac  ldr     r1, [sp, #0x74]
000bf1ae  mov     r2, r0
000bf1b0  mov     r0, r5
000bf1b2  blx     #0xddbfc ; -> objc_msgSend
000bf1b6  ldr     r1, [sp, #0x78]
000bf1b8  mov     r0, r5
000bf1ba  blx     #0xddbfc ; -> objc_msgSend
000bf1be  ldr     r1, [sp, #0x3c]
000bf1c0  blx     #0xddbfc ; -> objc_msgSend
000bf1c4  ldr.w   r2, [pc, #0x434]
000bf1c8  ldr     r1, [sp, #0xc]
000bf1ca  mov     r0, r8
000bf1cc  add     r2, pc ; -> 0x00180af4  
000bf1ce  blx     #0xddbfc ; -> objc_msgSend
000bf1d2  mov     r1, fp
000bf1d4  mov     r2, r0
000bf1d6  mov     r0, sl
000bf1d8  blx     #0xddbfc ; -> objc_msgSend
000bf1dc  ldr     r1, [sp, #0xc4]
000bf1de  mov     r4, r0
000bf1e0  mov     r0, sl
000bf1e2  blx     #0xddbfc ; -> objc_msgSend
000bf1e6  ldr     r1, [sp, #0xc0]
000bf1e8  blx     #0xddbfc ; -> objc_msgSend
000bf1ec  ldr     r1, [sp, #0x7c]
000bf1ee  mov     r2, r0
000bf1f0  mov     r0, r5
000bf1f2  blx     #0xddbfc ; -> objc_msgSend
000bf1f6  ldr     r1, [sp, #0x80]
000bf1f8  mov     r0, r5
000bf1fa  blx     #0xddbfc ; -> objc_msgSend
000bf1fe  ldr     r1, [sp, #0x48]
000bf200  mov     r2, r4
000bf202  blx     #0xddbfc ; -> objc_msgSend
000bf206  ldr     r1, [sp, #0x7c]
000bf208  mov     r2, r0
000bf20a  mov     r0, r5
000bf20c  blx     #0xddbfc ; -> objc_msgSend
000bf210  ldr     r2, [pc, #0x3ec]
000bf212  ldr     r1, [sp, #0xc]
000bf214  mov     r0, r8
000bf216  add     r2, pc ; -> 0x00180b04  
000bf218  blx     #0xddbfc ; -> objc_msgSend
000bf21c  ldr     r1, [sp, #0x84]
000bf21e  blx     #0xddbfc ; -> objc_msgSend
000bf222  vmov    d7, r0, r1
000bf226  vcvt.s32.f64 s14, d7
000bf22a  mov     r0, r5
000bf22c  ldr     r1, [sp, #0x88]
000bf22e  vmov    r2, s14
000bf232  blx     #0xddbfc ; -> objc_msgSend
000bf236  ldr     r2, [pc, #0x3cc]
000bf238  ldr     r1, [sp, #0xc]
000bf23a  mov     r0, r8
000bf23c  add     r2, pc ; -> 0x00180b14  
000bf23e  blx     #0xddbfc ; -> objc_msgSend
000bf242  ldr     r1, [sp, #0x8c]
000bf244  blx     #0xddbfc ; -> objc_msgSend
000bf248  ldr     r1, [sp, #0x90]
000bf24a  tst.w   r0, #0xff
000bf24e  ite     eq
000bf250  moveq   r2, #0
000bf252  movne   r2, #1
000bf254  mov     r0, r5
000bf256  blx     #0xddbfc ; -> objc_msgSend
000bf25a  ldr.w   r2, [pc, #0x3ac]
000bf25e  ldr     r1, [sp, #0xc]
000bf260  mov     r0, r8
000bf262  add     r2, pc ; -> 0x00180b24  
000bf264  blx     #0xddbfc ; -> objc_msgSend
000bf268  ldr     r1, [sp, #0x8c]
000bf26a  blx     #0xddbfc ; -> objc_msgSend
000bf26e  ldr     r1, [sp, #0x94]
000bf270  tst.w   r0, #0xff
000bf274  ite     eq
000bf276  moveq   r2, #0
000bf278  movne   r2, #1
000bf27a  mov     r0, r5
000bf27c  blx     #0xddbfc ; -> objc_msgSend
000bf280  ldr     r1, [sp, #0x98]
000bf282  mov     r0, r5
000bf284  blx     #0xddbfc ; -> objc_msgSend
000bf288  ldr     r1, [sp, #0x9c]
000bf28a  subs    r2, r0, #0
000bf28c  it      ne
000bf28e  movne   r2, #1
000bf290  mov     r0, r5
000bf292  blx     #0xddbfc ; -> objc_msgSend
000bf296  movs    r3, #0
000bf298  mov     r0, r5
000bf29a  ldr     r1, [sp, #0xa0]
000bf29c  movs    r2, #0
000bf29e  blx     #0xddbfc ; -> objc_msgSend
000bf2a2  ldr     r2, [pc, #0x368]
000bf2a4  mov     r0, r5
000bf2a6  ldr     r1, [sp, #0xa4]
000bf2a8  add     r2, pc ; -> 0x00180b34  
000bf2aa  blx     #0xddbfc ; -> objc_msgSend
000bf2ae  ldr     r2, [pc, #0x360]
000bf2b0  mov     r0, r5
000bf2b2  ldr     r1, [sp, #0xa8]
000bf2b4  add     r2, pc ; -> 0x00180b44  
000bf2b6  blx     #0xddbfc ; -> objc_msgSend
000bf2ba  mov     r0, r5
000bf2bc  ldr     r1, [sp, #0xac]
000bf2be  blx     #0xddbfc ; -> objc_msgSend
000bf2c2  cbnz    r0, #0xbf2cc
000bf2c4  ldr     r3, [pc, #0x34c]
000bf2c6  movs    r2, #1
000bf2c8  add     r3, pc ; -> 0x0038c19c  bHasPaidItems
000bf2ca  strb    r2, [r3]
000bf2cc  ldr     r0, [sp, #0x14]
000bf2ce  ldr     r1, [sp, #0xb0]
000bf2d0  mov     r2, r5
000bf2d2  blx     #0xddbfc ; -> objc_msgSend
000bf2d6  ldr     r3, [sp, #0xbc]
000bf2d8  adds    r3, #1
000bf2da  str     r3, [sp, #0xbc]
000bf2dc  ldr     r0, [sp, #0x10]
000bf2de  ldr     r1, [sp, #0x18]
000bf2e0  blx     #0xddbfc ; -> objc_msgSend
000bf2e4  ldr     r3, [sp, #0xbc]
000bf2e6  cmp     r0, r3
000bf2e8  bhi.w   #0xbefe2
000bf2ec  ldr     r1, [pc, #0x328]
000bf2ee  mov.w   fp, #0
000bf2f2  add     r1, pc ; -> 0x000fd638  
000bf2f4  ldr     r1, [r1]
000bf2f6  str     r1, [sp, #0xb4]
000bf2f8  ldr     r1, [pc, #0x320]
000bf2fa  add     r1, pc ; -> 0x000fd428  
000bf2fc  ldr     r1, [r1]
000bf2fe  str     r1, [sp, #0xb8]
000bf300  b       #0xbf388
000bf302  mov     r2, fp
000bf304  ldr     r1, [sp, #0x1c]
000bf306  ldr     r0, [sp, #0x14]
000bf308  blx     #0xddbfc ; -> objc_msgSend
000bf30c  ldr     r1, [sp, #0x30]
000bf30e  ldr.w   r4, [pc, #0x310]
000bf312  add     r4, pc ; -> 0x0017e5c4  
000bf314  mov     r6, r0
000bf316  ldr     r0, [pc, #0x30c]
000bf318  add     r0, pc ; -> 0x0038c0bc  mtxProdsList
000bf31a  ldr     r5, [r0]
000bf31c  mov     r0, r6
000bf31e  blx     #0xddbfc ; -> objc_msgSend
000bf322  mov     r2, r4
000bf324  ldr     r1, [sp, #0x2c]
000bf326  mov     r3, r0
000bf328  mov     r0, sl
000bf32a  blx     #0xddbfc ; -> objc_msgSend
000bf32e  ldr     r1, [sp, #0xc]
000bf330  mov     r2, r0
000bf332  mov     r0, r5
000bf334  blx     #0xddbfc ; -> objc_msgSend
000bf338  ldr     r1, [sp, #0x44]
000bf33a  ldr     r5, [pc, #0x2ec]
000bf33c  add     r5, pc ; -> 0x00180b54  
000bf33e  mov     r8, r0
000bf340  mov     r0, r6
000bf342  blx     #0xddbfc ; -> objc_msgSend
000bf346  ldr     r1, [sp, #0x30]
000bf348  mov     r4, r0
000bf34a  mov     r0, r6
000bf34c  blx     #0xddbfc ; -> objc_msgSend
000bf350  ldr     r1, [sp, #0x2c]
000bf352  mov     r2, r5
000bf354  mov     r3, fp
000bf356  str     r4, [sp]
000bf358  str     r0, [sp, #4]
000bf35a  mov     r0, sl
000bf35c  blx     #0xddbfc ; -> objc_msgSend
000bf360  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bf364  cmp.w   r8, #0
000bf368  beq     #0xbf37e
000bf36a  ldr     r1, [sp, #0xb4]
000bf36c  mov     r0, r8
000bf36e  blx     #0xddbfc ; -> objc_msgSend
000bf372  ldr     r1, [sp, #0xb8]
000bf374  mov     r2, r0
000bf376  mov     r0, r6
000bf378  blx     #0xddbfc ; -> objc_msgSend
000bf37c  b       #0xbf384
000bf37e  mov     r0, r6
000bf380  bl      #0xb584c ; -> Z14SetBadgesCountP16EAMTX_MTXProduct
000bf384  add.w   fp, fp, #1
000bf388  ldr     r0, [sp, #0x14]
000bf38a  ldr     r1, [sp, #0x18]
000bf38c  blx     #0xddbfc ; -> objc_msgSend
000bf390  cmp     r0, fp
000bf392  bhi     #0xbf302
000bf394  ldr     r4, [pc, #0x294]
000bf396  add     r4, pc ; -> 0x0038c0bc  mtxProdsList
000bf398  ldr     r0, [r4]
000bf39a  cbz     r0, #0xbf3ae
000bf39c  ldr     r1, [pc, #0x290]
000bf39e  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bf3a0  ldr     r1, [r1]
000bf3a2  blx     #0xddbfc ; -> objc_msgSend
000bf3a6  ldr     r0, [r4]
000bf3a8  ldr     r1, [sp, #0x6c]
000bf3aa  blx     #0xddbfc ; -> objc_msgSend
000bf3ae  ldr     r0, [pc, #0x284]
000bf3b0  add     r0, pc ; -> 0x0038c0d4  prodSellIds
000bf3b2  ldr     r0, [r0]
000bf3b4  cbz     r0, #0xbf3c0
000bf3b6  ldr     r1, [pc, #0x280]
000bf3b8  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bf3ba  ldr     r1, [r1]
000bf3bc  blx     #0xddbfc ; -> objc_msgSend
000bf3c0  ldr     r0, [pc, #0x278]
000bf3c2  ldr     r1, [sp, #0xc4]
000bf3c4  mov.w   r8, #0
000bf3c8  add     r0, pc ; -> 0x000fdbf4  
000bf3ca  ldr     r0, [r0]
000bf3cc  blx     #0xddbfc ; -> objc_msgSend
000bf3d0  ldr     r1, [sp, #0xc0]
000bf3d2  blx     #0xddbfc ; -> objc_msgSend
000bf3d6  ldr     r1, [pc, #0x268]
000bf3d8  ldr     r3, [pc, #0x268]
000bf3da  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000bf3dc  add     r3, pc ; -> 0x0038c0bc  mtxProdsList
000bf3de  ldr.w   fp, [r1]
000bf3e2  str     r0, [r3]
000bf3e4  b       #0xbf444
000bf3e6  mov     r2, r8
000bf3e8  ldr     r1, [sp, #0x1c]
000bf3ea  ldr     r0, [sp, #0x14]
000bf3ec  blx     #0xddbfc ; -> objc_msgSend
000bf3f0  ldr     r1, [sp, #0x30]
000bf3f2  ldr     r5, [pc, #0x254]
000bf3f4  add.w   r8, r8, #1
000bf3f8  add     r5, pc ; -> 0x0017e5c4  
000bf3fa  mov     r4, r0
000bf3fc  ldr     r0, [pc, #0x24c]
000bf3fe  add     r0, pc ; -> 0x0038c0d4  prodSellIds
000bf400  ldr     r6, [r0]
000bf402  mov     r0, r4
000bf404  blx     #0xddbfc ; -> objc_msgSend
000bf408  ldr     r1, [sp, #0x2c]
000bf40a  mov     r2, r5
000bf40c  mov     r3, r0
000bf40e  mov     r0, sl
000bf410  blx     #0xddbfc ; -> objc_msgSend
000bf414  ldr     r1, [sp, #0xb0]
000bf416  mov     r2, r0
000bf418  mov     r0, r6
000bf41a  blx     #0xddbfc ; -> objc_msgSend
000bf41e  ldr     r0, [pc, #0x230]
000bf420  ldr     r1, [sp, #0x30]
000bf422  add     r0, pc ; -> 0x0038c0bc  mtxProdsList
000bf424  ldr     r6, [r0]
000bf426  mov     r0, r4
000bf428  blx     #0xddbfc ; -> objc_msgSend
000bf42c  ldr     r1, [sp, #0x2c]
000bf42e  mov     r2, r5
000bf430  mov     r3, r0
000bf432  mov     r0, sl
000bf434  blx     #0xddbfc ; -> objc_msgSend
000bf438  mov     r1, fp
000bf43a  mov     r2, r4
000bf43c  mov     r3, r0
000bf43e  mov     r0, r6
000bf440  blx     #0xddbfc ; -> objc_msgSend
000bf444  ldr     r0, [sp, #0x14]
000bf446  ldr     r1, [sp, #0x18]
000bf448  blx     #0xddbfc ; -> objc_msgSend
000bf44c  cmp     r0, r8
000bf44e  bhi     #0xbf3e6
000bf450  ldr     r1, [pc, #0x200]
000bf452  ldr     r0, [sp, #0x14]
000bf454  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bf456  ldr     r1, [r1]
000bf458  blx     #0xddbfc ; -> objc_msgSend
000bf45c  ldr     r0, [sp, #0x14]
000bf45e  ldr     r1, [sp, #0x6c]
000bf460  blx     #0xddbfc ; -> objc_msgSend
000bf464  bl      #0xbecc0 ; -> Z20MTX_IsStoreAvailablev
000bf468  cmp     r0, #0
000bf46a  beq     #0xbf4dc
000bf46c  ldr     r3, [pc, #0x1e8]
000bf46e  add     r3, pc ; -> 0x0038c19c  bHasPaidItems
000bf470  ldrb    r3, [r3]
000bf472  cmp     r3, #0
000bf474  beq     #0xbf4dc
000bf476  ldr     r4, [pc, #0x1e4]
000bf478  add     r4, pc ; -> 0x0038c0c4  mtxtransObserver
000bf47a  ldr     r3, [r4]
000bf47c  cbnz    r3, #0xbf4ae
000bf47e  ldr     r0, [pc, #0x1e0]
000bf480  ldr     r1, [sp, #0xc4]
000bf482  add     r0, pc ; -> 0x000fdc68  
000bf484  ldr     r0, [r0]
000bf486  blx     #0xddbfc ; -> objc_msgSend
000bf48a  ldr     r1, [sp, #0xc0]
000bf48c  blx     #0xddbfc ; -> objc_msgSend
000bf490  ldr     r1, [pc, #0x1d0]
000bf492  add     r1, pc ; -> 0x000fd644  
000bf494  ldr     r1, [r1]
000bf496  str     r0, [r4]
000bf498  ldr     r0, [pc, #0x1cc]
000bf49a  add     r0, pc ; -> 0x000fdc6c  
000bf49c  ldr     r0, [r0]
000bf49e  blx     #0xddbfc ; -> objc_msgSend
000bf4a2  ldr     r1, [pc, #0x1c8]
000bf4a4  ldr     r2, [r4]
000bf4a6  add     r1, pc ; -> 0x000fd640  
000bf4a8  ldr     r1, [r1]
000bf4aa  blx     #0xddbfc ; -> objc_msgSend
000bf4ae  ldr     r4, [pc, #0x1c0]
000bf4b0  ldr     r1, [pc, #0x1c0]
000bf4b2  ldr     r2, [sp, #8]
000bf4b4  add     r4, pc ; -> 0x0038c0c4  mtxtransObserver
000bf4b6  add     r1, pc ; -> 0x000fd600  
000bf4b8  ldr     r0, [r4]
000bf4ba  ldr     r1, [r1]
000bf4bc  blx     #0xddbfc ; -> objc_msgSend
000bf4c0  ldr     r1, [pc, #0x1b4]
000bf4c2  ldr     r0, [r4]
000bf4c4  movs    r2, #1
000bf4c6  add     r1, pc ; -> 0x000fd458  
000bf4c8  ldr     r1, [r1]
000bf4ca  blx     #0xddbfc ; -> objc_msgSend
000bf4ce  ldr     r1, [pc, #0x1ac]
000bf4d0  ldr     r0, [r4]
000bf4d2  add     r1, pc ; -> 0x000fd454  
000bf4d4  ldr     r1, [r1]
000bf4d6  blx     #0xddbfc ; -> objc_msgSend
000bf4da  b       #0xbf4e2
000bf4dc  ldr     r0, [sp, #8]
000bf4de  bl      #0xbc260 ; -> Z18FilterAndSendItemsi
000bf4e2  sub.w   sp, r7, #0x18
000bf4e6  pop.w   {r8, sl, fp}
000bf4ea  pop     {r4, r5, r6, r7, pc}
000bf4ec  cdp     p0, #2, c0, c14, c3, #0
000bf4f0  udf     #0x40
000bf4f2  movs    r3, r0
000bf4f4  b       #0xbf1fc
000bf4f6  movs    r3, r0
000bf4f8  blo     #0xbf58c
000bf4fa  movs    r4, r5
000bf4fc  ble     #0xbf57c
000bf4fe  movs    r3, r0
000bf500  adds    r0, r2, #3
000bf502  movs    r4, r1
000bf504  bhs     #0xbf4fc
000bf506  movs    r4, r5
000bf508  cdp     p0, #2, c0, c2, c3, #0
000bf50c  blt     #0xbf470
000bf50e  movs    r3, r0
000bf510  blt     #0xbf450
000bf512  movs    r3, r0
000bf514  bhs     #0xbf4e0
000bf516  movs    r4, r5
000bf518  ldcl    p0, c0, [r2, #-0xc]!
000bf51c  blt     #0xbf428
000bf51e  movs    r3, r0
000bf520  blt     #0xbf608
000bf522  movs    r3, r0
000bf524  blt     #0xbf5f0
000bf526  movs    r3, r0
000bf528  stcl    p0, c0, [lr, #-0xc]
000bf52c  blt     #0xbf5cc
000bf52e  movs    r3, r0
000bf530  bgt     #0xbf5a8
000bf532  movs    r3, r0
000bf534  blo     #0xbf5e0
000bf536  movs    r4, r5
000bf538  bgt     #0xbf58c
000bf53a  movs    r3, r0
000bf53c  bgt     #0xbf454
000bf53e  movs    r3, r0
000bf540  b       #0xbf090
000bf542  movs    r3, r0
000bf544  cdp     p0, #2, c0, c14, c3, #0
000bf548  bgt     #0xbf590
000bf54a  movs    r3, r0
000bf54c  ldcl    p0, c0, [r6], {3}
000bf550  b       #0xbefd8
000bf552  movs    r3, r0
000bf554  stcl    p0, c0, [lr, #0xc]!
000bf558  b       #0xbf038
000bf55a  movs    r3, r0
000bf55c  b       #0xbf420
000bf55e  movs    r3, r0
000bf560  udf     #0x1a
000bf562  movs    r3, r0
000bf564  bgt     #0xbf630
000bf566  movs    r3, r0
000bf568  b       #0xbfbf0
000bf56a  movs    r3, r0
000bf56c  b       #0xbfbb0
000bf56e  movs    r3, r0
000bf570  b       #0xbf780
000bf572  movs    r3, r0
000bf574  b       #0xbefc0
000bf576  movs    r3, r0
000bf578  b       #0xbef40
000bf57a  movs    r3, r0
000bf57c  b       #0xbef94
000bf57e  movs    r3, r0
000bf580  b       #0xbef10
000bf582  movs    r3, r0
000bf584  b       #0xbf258
000bf586  movs    r3, r0
000bf588  b       #0xbef58
000bf58a  movs    r3, r0
000bf58c  b       #0xbef40
000bf58e  movs    r3, r0
000bf590  bge     #0xbf628
000bf592  movs    r3, r0
000bf594  b       #0xbefe0
000bf596  movs    r3, r0
000bf598  b       #0xbef08
000bf59a  movs    r3, r0
000bf59c  b       #0xbee98
000bf59e  movs    r3, r0
000bf5a0  b       #0xbeee0
000bf5a2  movs    r3, r0
000bf5a4  b       #0xbee70
000bf5a6  movs    r3, r0
000bf5a8  b       #0xbf030
000bf5aa  movs    r3, r0
000bf5ac  b       #0xbeea8
000bf5ae  movs    r3, r0
000bf5b0  b       #0xbf450
000bf5b2  movs    r3, r0
000bf5b4  b       #0xbee80
000bf5b6  movs    r3, r0
000bf5b8  b       #0xbee68
000bf5ba  movs    r3, r0
000bf5bc  b       #0xbf3bc
000bf5be  movs    r3, r0
000bf5c0  b       #0xbee3c
000bf5c2  movs    r3, r0
000bf5c4  b       #0xbee24
000bf5c6  movs    r3, r0
000bf5c8  b       #0xbee0c
000bf5ca  movs    r3, r0
000bf5cc  b       #0xbedf4
000bf5ce  movs    r3, r0
000bf5d0  b       #0xbf2a4
000bf5d2  movs    r3, r0
000bf5d4  bge     #0xbf524
000bf5d6  movs    r3, r0
000bf5d8  subs    r6, r3, r2
000bf5da  movs    r4, r1
000bf5dc  lsrs    r0, r1, #0x1b
000bf5de  movs    r4, r1
000bf5e0  lsrs    r2, r1, #0x17
000bf5e2  movs    r4, r1
000bf5e4  adds    r6, r7, r7
000bf5e6  movs    r4, r1
000bf5e8  adds    r2, r0, r7
000bf5ea  movs    r4, r1
000bf5ec  adds    r6, r0, r6
000bf5ee  movs    r4, r1
000bf5f0  adds    r0, r6, r5
000bf5f2  movs    r4, r1
000bf5f4  adds    r4, r2, r5
000bf5f6  movs    r4, r1
000bf5f8  ldm     r7!, {r2, r3, r4, r5}
000bf5fa  movs    r4, r5
000bf5fc  adds    r4, r4, r4
000bf5fe  movs    r4, r1
000bf600  adds    r2, r5, r3
000bf602  movs    r4, r1
000bf604  adds    r4, r2, r3
000bf606  movs    r4, r1
000bf608  adds    r6, r7, r2
000bf60a  movs    r4, r1
000bf60c  adds    r0, r1, r2
000bf60e  movs    r4, r1
000bf610  adds    r4, r1, r2
000bf612  movs    r4, r1
000bf614  ldm     r6, {r4, r6, r7}
000bf616  movs    r4, r5
000bf618  b       #0xbfca0
000bf61a  movs    r3, r0
000bf61c  b       #0xbf874
000bf61e  movs    r3, r0
000bf620  subw    r0, lr, #0xb
000bf624  ldm     r5, {r5, r7}
000bf626  movs    r4, r5
000bf628  adds    r4, r2, r0
000bf62a  movs    r4, r1
000bf62c  ldm     r5, {r1, r5}
000bf62e  movs    r4, r5
000bf630  bvs     #0xbf608
000bf632  movs    r3, r0
000bf634  ldm     r5, {r5}
000bf636  movs    r4, r5
000bf638  bvs     #0xbf5dc
000bf63a  movs    r3, r0
