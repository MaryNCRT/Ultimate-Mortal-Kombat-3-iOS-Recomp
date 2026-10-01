========================================================================
-[EAMTX_TransObserver productsRequest  0x000c8300  1492 bytes   EAMTX_TransObserver.mm
========================================================================

000c8300  push    {r4, r5, r6, r7, lr}
000c8302  add     r7, sp, #0xc
000c8304  push.w  {r8, sl, fp}
000c8308  sub     sp, #0xe8
000c830a  str     r3, [sp, #8]
000c830c  ldr.w   r3, [pc, #0x4d0]
000c8310  str     r0, [sp, #0x10]
000c8312  str     r2, [sp, #0xc]
000c8314  add     r3, pc ; -> 0x000f3280  bRequiredToShowAlert
000c8316  ldr     r3, [r3]
000c8318  ldrb    r4, [r3]
000c831a  cmp     r4, #0
000c831c  bne.w   #0xc87d4
000c8320  ldr.w   r1, [pc, #0x4c0]
000c8324  ldr     r0, [sp, #8]
000c8326  add     r1, pc ; -> 0x000fd6f8  
000c8328  ldr.w   fp, [r1]
000c832c  mov     r1, fp
000c832e  blx     #0xddbfc ; -> objc_msgSend
000c8332  cmp     r0, #0
000c8334  beq     #0xc83da
000c8336  mov     r1, fp
000c8338  ldr     r0, [sp, #8]
000c833a  str     r4, [sp, #0xc8]
000c833c  str     r4, [sp, #0xcc]
000c833e  str     r4, [sp, #0xd0]
000c8340  str     r4, [sp, #0xd4]
000c8342  str     r4, [sp, #0xd8]
000c8344  str     r4, [sp, #0xdc]
000c8346  str     r4, [sp, #0xe0]
000c8348  str     r4, [sp, #0xe4]
000c834a  blx     #0xddbfc ; -> objc_msgSend
000c834e  ldr.w   r1, [pc, #0x498]
000c8352  movs    r3, #0x10
000c8354  add     r2, sp, #0xc8
000c8356  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000c8358  str     r3, [sp]
000c835a  ldr     r1, [r1]
000c835c  add     r3, sp, #0x88
000c835e  str     r1, [sp, #0x18]
000c8360  str     r0, [sp, #0x14]
000c8362  blx     #0xddbfc ; -> objc_msgSend
000c8366  mov     r2, r0
000c8368  cmp     r0, #0
000c836a  beq     #0xc83da
000c836c  ldr.w   r0, [pc, #0x47c]
000c8370  ldr.w   r1, [pc, #0x47c]
000c8374  ldr     r3, [sp, #0xd0]
000c8376  add     r0, pc ; -> 0x000fdb5c  
000c8378  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c837a  mov     r5, r2
000c837c  ldr.w   r2, [pc, #0x474]
000c8380  ldr.w   sl, [r3]
000c8384  ldr.w   r8, [r0]
000c8388  ldr     r6, [r1]
000c838a  str     r2, [sp, #4]
000c838c  b       #0xc8390
000c838e  ldr     r3, [sp, #0xd0]
000c8390  movs    r4, #0
000c8392  b       #0xc8396
000c8394  ldr     r3, [sp, #0xd0]
000c8396  ldr     r3, [r3]
000c8398  cmp     r3, sl
000c839a  beq     #0xc83a8
000c839c  mov     r1, fp
000c839e  ldr     r0, [sp, #8]
000c83a0  blx     #0xddbfc ; -> objc_msgSend
000c83a4  blx     #0xddbe4 ; -> objc_enumerationMutation
000c83a8  ldr     r3, [sp, #0xcc]
000c83aa  ldr     r2, [sp, #4]
000c83ac  mov     r1, r6
000c83ae  mov     r0, r8
000c83b0  ldr.w   r3, [r3, r4, lsl #2]
000c83b4  add     r2, pc
000c83b6  blx     #0xddbfc ; -> objc_msgSend
000c83ba  adds    r4, #1
000c83bc  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c83c0  cmp     r5, r4
000c83c2  bhi     #0xc8394
000c83c4  movs    r3, #0x10
000c83c6  ldr     r0, [sp, #0x14]
000c83c8  str     r3, [sp]
000c83ca  ldr     r1, [sp, #0x18]
000c83cc  add     r2, sp, #0xc8
000c83ce  add     r3, sp, #0x88
000c83d0  blx     #0xddbfc ; -> objc_msgSend
000c83d4  mov     r5, r0
000c83d6  cmp     r0, #0
000c83d8  bne     #0xc838e
000c83da  ldr.w   r1, [pc, #0x41c]
000c83de  ldr     r0, [sp, #8]
000c83e0  ldr.w   r4, [pc, #0x418]
000c83e4  add     r1, pc ; -> 0x000fd6f4  
000c83e6  ldr     r1, [r1]
000c83e8  blx     #0xddbfc ; -> objc_msgSend
000c83ec  ldr.w   r1, [pc, #0x410]
000c83f0  add     r4, pc ; -> 0x00181614  
000c83f2  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c83f4  ldr     r1, [r1]
000c83f6  str     r1, [sp, #0x84]
000c83f8  ldr.w   r1, [pc, #0x408]
000c83fc  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000c83fe  ldr     r1, [r1]
000c8400  str     r1, [sp, #0x20]
000c8402  mov     sl, r0
000c8404  ldr.w   r0, [pc, #0x400]
000c8408  add     r0, pc ; -> 0x000fdb5c  
000c840a  ldr     r0, [r0]
000c840c  str     r0, [sp, #0x1c]
000c840e  mov     r0, sl
000c8410  blx     #0xddbfc ; -> objc_msgSend
000c8414  mov     r2, r4
000c8416  ldr     r1, [sp, #0x84]
000c8418  mov     r3, r0
000c841a  ldr     r0, [sp, #0x1c]
000c841c  blx     #0xddbfc ; -> objc_msgSend
000c8420  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c8424  ldr     r3, [pc, #0x3e4]
000c8426  ldr     r2, [sp, #0x10]
000c8428  add     r3, pc ; -> 0x000f7fdc  OBJC_IVAR_$_EAMTX_TransObserver.m_RequestingProductForPurchase
000c842a  ldr     r3, [r3]
000c842c  ldrsb   r6, [r2, r3]
000c842e  cbz     r6, #0xc8474
000c8430  mov     r0, sl
000c8432  ldr     r1, [sp, #0x20]
000c8434  blx     #0xddbfc ; -> objc_msgSend
000c8438  cbz     r0, #0xc845a
000c843a  ldr     r1, [pc, #0x3d4]
000c843c  movs    r2, #0
000c843e  mov     r0, sl
000c8440  add     r1, pc ; -> 0x000fd6fc  
000c8442  ldr     r4, [r1]
000c8444  ldr     r1, [pc, #0x3cc]
000c8446  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000c8448  ldr     r1, [r1]
000c844a  blx     #0xddbfc ; -> objc_msgSend
000c844e  mov     r1, r4
000c8450  mov     r2, r0
000c8452  ldr     r0, [sp, #0x10]
000c8454  blx     #0xddbfc ; -> objc_msgSend
000c8458  b       #0xc87d4
000c845a  ldr     r0, [pc, #0x3bc]
000c845c  add     r0, pc ; -> 0x00181624  
000c845e  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c8462  ldr     r1, [pc, #0x3b8]
000c8464  ldr     r0, [sp, #0x10]
000c8466  movs    r2, #0x11
000c8468  add     r1, pc ; -> 0x000fd734  
000c846a  ldr     r3, [pc, #0x3b4]
000c846c  ldr     r1, [r1]
000c846e  blx     #0xddbfc ; -> objc_msgSend
000c8472  b       #0xc87d4
000c8474  ldr     r3, [pc, #0x3ac]
000c8476  ldr     r2, [sp, #0x10]
000c8478  add     r3, pc ; -> 0x000f7fd4  OBJC_IVAR_$_EAMTX_TransObserver.m_TransState
000c847a  ldr     r3, [r3]
000c847c  ldr     r3, [r2, r3]
000c847e  cmp     r3, #2
000c8480  bne.w   #0xc85ba
000c8484  ldr     r0, [pc, #0x3a0]
000c8486  add     r0, pc ; -> 0x000f3288  badgeSellIds
000c8488  ldr.w   r8, [r0]
000c848c  ldr.w   r0, [r8]
000c8490  cmp     r0, #0
000c8492  beq.w   #0xc87d4
000c8496  ldr     r1, [pc, #0x394]
000c8498  mov     fp, r6
000c849a  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000c849c  ldr     r1, [r1]
000c849e  blx     #0xddbfc ; -> objc_msgSend
000c84a2  ldr.w   r1, [pc, #0x38c]
000c84a6  ldr.w   r0, [r8]
000c84aa  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c84ac  ldr     r1, [r1]
000c84ae  str     r1, [sp, #0x24]
000c84b0  blx     #0xddbfc ; -> objc_msgSend
000c84b4  ldr.w   r0, [pc, #0x37c]
000c84b8  ldr     r1, [pc, #0x37c]
000c84ba  add     r0, pc ; -> 0x000fdb70  
000c84bc  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000c84be  ldr     r0, [r0]
000c84c0  ldr     r1, [r1]
000c84c2  blx     #0xddbfc ; -> objc_msgSend
000c84c6  ldr     r1, [pc, #0x374]
000c84c8  add     r1, pc ; -> 0x000fca70  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xf8
000c84ca  ldr     r4, [r1]
000c84cc  ldr     r1, [sp, #0x20]
000c84ce  mov     r5, r0
000c84d0  mov     r0, sl
000c84d2  blx     #0xddbfc ; -> objc_msgSend
000c84d6  mov     r1, r4
000c84d8  mov     r2, r0
000c84da  mov     r0, r5
000c84dc  blx     #0xddbfc ; -> objc_msgSend
000c84e0  ldr     r1, [pc, #0x35c]
000c84e2  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000c84e4  ldr     r1, [r1]
000c84e6  str     r1, [sp, #0x80]
000c84e8  ldr     r1, [pc, #0x358]
000c84ea  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000c84ec  ldr     r1, [r1]
000c84ee  str     r1, [sp, #0x28]
000c84f0  ldr     r1, [pc, #0x354]
000c84f2  add     r1, pc ; -> 0x000fd724  
000c84f4  ldr     r5, [r1]
000c84f6  str.w   r0, [r8]
000c84fa  b       #0xc8524
000c84fc  mov     r0, sl
000c84fe  ldr     r1, [sp, #0x80]
000c8500  mov     r2, fp
000c8502  blx     #0xddbfc ; -> objc_msgSend
000c8506  cbz     r0, #0xc8520
000c8508  ldr     r3, [pc, #0x340]
000c850a  mov     r1, r5
000c850c  add     r3, pc ; -> 0x000f3288  badgeSellIds
000c850e  ldr     r3, [r3]
000c8510  ldr     r4, [r3]
000c8512  blx     #0xddbfc ; -> objc_msgSend
000c8516  ldr     r1, [sp, #0x28]
000c8518  mov     r2, r0
000c851a  mov     r0, r4
000c851c  blx     #0xddbfc ; -> objc_msgSend
000c8520  add.w   fp, fp, #1
000c8524  mov     r0, sl
000c8526  ldr     r1, [sp, #0x20]
000c8528  blx     #0xddbfc ; -> objc_msgSend
000c852c  cmp     r0, fp
000c852e  bhi     #0xc84fc
000c8530  ldr     r3, [pc, #0x31c]
000c8532  add     r3, pc ; -> 0x000f3278  freeSellIds
000c8534  ldr     r5, [r3]
000c8536  ldr     r3, [r5]
000c8538  cbz     r3, #0xc8578
000c853a  movs    r6, #0
000c853c  mov     r8, r5
000c853e  b       #0xc855e
000c8540  ldr     r3, [pc, #0x310]
000c8542  mov     r2, r6
000c8544  ldr     r1, [sp, #0x80]
000c8546  add     r3, pc ; -> 0x000f3288  badgeSellIds
000c8548  adds    r6, #1
000c854a  ldr     r0, [r3]
000c854c  ldr     r4, [r0]
000c854e  ldr     r0, [r5]
000c8550  blx     #0xddbfc ; -> objc_msgSend
000c8554  ldr     r1, [sp, #0x28]
000c8556  mov     r2, r0
000c8558  mov     r0, r4
000c855a  blx     #0xddbfc ; -> objc_msgSend
000c855e  ldr.w   r0, [r8]
000c8562  ldr     r1, [sp, #0x20]
000c8564  blx     #0xddbfc ; -> objc_msgSend
000c8568  mov     r5, r8
000c856a  cmp     r0, r6
000c856c  bhi     #0xc8540
000c856e  ldr.w   r0, [r8]
000c8572  ldr     r1, [sp, #0x24]
000c8574  blx     #0xddbfc ; -> objc_msgSend
000c8578  ldr     r3, [pc, #0x2dc]
000c857a  ldr     r1, [sp, #0x20]
000c857c  add     r3, pc ; -> 0x000f7fcc  OBJC_IVAR_$_EAMTX_TransObserver.requestId
000c857e  ldr     r0, [r3]
000c8580  ldr     r3, [sp, #0x10]
000c8582  ldr     r5, [r3, r0]
000c8584  ldr     r0, [pc, #0x2d4]
000c8586  add     r0, pc ; -> 0x000f3288  badgeSellIds
000c8588  ldr     r4, [r0]
000c858a  ldr     r0, [r4]
000c858c  blx     #0xddbfc ; -> objc_msgSend
000c8590  cmp     r0, #0xa
000c8592  bls     #0xc8598
000c8594  movs    r3, #0xa
000c8596  b       #0xc85a2
000c8598  ldr     r0, [r4]
000c859a  ldr     r1, [sp, #0x20]
000c859c  blx     #0xddbfc ; -> objc_msgSend
000c85a0  mov     r3, r0
000c85a2  ldr     r2, [pc, #0x2bc]
000c85a4  ldr     r1, [sp, #0x84]
000c85a6  ldr     r0, [sp, #0x1c]
000c85a8  add     r2, pc ; -> 0x0017e5c4  
000c85aa  blx     #0xddbfc ; -> objc_msgSend
000c85ae  mov     r1, r5
000c85b0  mov     r2, r0
000c85b2  movs    r0, #0x1f
000c85b4  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000c85b8  b       #0xc87d4
000c85ba  ldr     r0, [pc, #0x2a8]
000c85bc  ldr     r1, [pc, #0x2a8]
000c85be  add     r0, pc ; -> 0x000f3274  mtxProdsList
000c85c0  add     r1, pc ; -> 0x000fce70  'F=\x0e'
000c85c2  ldr     r0, [r0]
000c85c4  ldr     r1, [r1]
000c85c6  ldr     r0, [r0]
000c85c8  blx     #0xddbfc ; -> objc_msgSend
000c85cc  ldr     r1, [pc, #0x29c]
000c85ce  ldr     r3, [pc, #0x2a0]
000c85d0  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000c85d2  add     r3, pc ; -> 0x000f3314  0x0
000c85d4  ldr     r1, [r1]
000c85d6  ldr     r2, [r3]
000c85d8  ldr     r3, [pc, #0x298]
000c85da  str     r1, [sp, #0x2c]
000c85dc  ldr     r1, [pc, #0x298]
000c85de  ldr     r2, [r2]
000c85e0  add     r3, pc ; -> 0x000f326c  0x0
000c85e2  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000c85e4  ldr.w   fp, [r1]
000c85e8  ldr     r1, [pc, #0x290]
000c85ea  str     r2, [sp, #0x5c]
000c85ec  ldr     r2, [r3]
000c85ee  add     r1, pc ; -> 0x000fd60c  
000c85f0  ldr     r1, [r1]
000c85f2  ldr     r2, [r2]
000c85f4  str     r1, [sp, #0x30]
000c85f6  ldr     r1, [pc, #0x288]
000c85f8  add     r1, pc ; -> 0x000fd16c  
000c85fa  ldr     r1, [r1]
000c85fc  str     r0, [sp, #0x74]
000c85fe  str     r1, [sp, #0x34]
000c8600  ldr     r1, [pc, #0x280]
000c8602  add     r1, pc ; -> 0x000fd724  
000c8604  ldr     r1, [r1]
000c8606  str     r1, [sp, #0x7c]
000c8608  ldr     r1, [pc, #0x27c]
000c860a  add     r1, pc ; -> 0x000fd6f0  
000c860c  ldr     r1, [r1]
000c860e  str     r1, [sp, #0x38]
000c8610  ldr     r1, [pc, #0x278]
000c8612  add     r1, pc ; -> 0x000fd20c  
000c8614  ldr     r1, [r1]
000c8616  str     r1, [sp, #0x3c]
000c8618  ldr     r1, [pc, #0x274]
000c861a  add     r1, pc ; -> 0x000fd098  
000c861c  ldr     r1, [r1]
000c861e  str     r1, [sp, #0x40]
000c8620  ldr     r1, [pc, #0x270]
000c8622  add     r1, pc ; -> 0x000fd40c  
000c8624  ldr     r1, [r1]
000c8626  str     r1, [sp, #0x44]
000c8628  ldr     r1, [pc, #0x26c]
000c862a  add     r1, pc ; -> 0x000fd6ec  
000c862c  ldr     r1, [r1]
000c862e  str     r1, [sp, #0x48]
000c8630  ldr     r1, [pc, #0x268]
000c8632  add     r1, pc ; -> 0x000fd4b0  
000c8634  ldr     r1, [r1]
000c8636  str     r1, [sp, #0x4c]
000c8638  ldr     r1, [pc, #0x264]
000c863a  add     r1, pc ; -> 0x000fd3e4  
000c863c  ldr     r1, [r1]
000c863e  str     r1, [sp, #0x50]
000c8640  ldr     r1, [pc, #0x260]
000c8642  add     r1, pc ; -> 0x000fd6e8  
000c8644  ldr     r1, [r1]
000c8646  str     r1, [sp, #0x54]
000c8648  ldr     r1, [pc, #0x25c]
000c864a  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000c864c  ldr     r1, [r1]
000c864e  str     r1, [sp, #0x58]
000c8650  ldr     r1, [pc, #0x258]
000c8652  add     r1, pc ; -> 0x000fd3e0  
000c8654  ldr     r1, [r1]
000c8656  str     r1, [sp, #0x60]
000c8658  ldr     r1, [pc, #0x254]
000c865a  str     r2, [sp, #0x64]
000c865c  str     r6, [sp, #0x78]
000c865e  add     r1, pc ; -> 0x000fd3dc  
000c8660  ldr     r1, [r1]
000c8662  str     r1, [sp, #0x68]
000c8664  ldr     r1, [pc, #0x24c]
000c8666  add     r1, pc ; -> 0x000fd63c  
000c8668  ldr     r1, [r1]
000c866a  str     r1, [sp, #0x6c]
000c866c  ldr     r1, [pc, #0x248]
000c866e  add     r1, pc ; -> 0x000fcefc  '\x11B\x0e'
000c8670  ldr     r1, [r1]
000c8672  str     r1, [sp, #0x70]
000c8674  b       #0xc8796
000c8676  ldr     r3, [pc, #0x244]
000c8678  mov     r1, fp
000c867a  ldr     r2, [sp, #0x78]
000c867c  add     r3, pc ; -> 0x000f3274  mtxProdsList
000c867e  ldr     r0, [r3]
000c8680  ldr     r4, [r0]
000c8682  ldr     r0, [sp, #0x74]
000c8684  blx     #0xddbfc ; -> objc_msgSend
000c8688  ldr     r1, [sp, #0x2c]
000c868a  mov     r2, r0
000c868c  mov     r0, r4
000c868e  blx     #0xddbfc ; -> objc_msgSend
000c8692  mov     r8, r0
000c8694  cmp     r0, #0
000c8696  bne     #0xc875c
000c8698  b       #0xc8790
000c869a  mov     r0, sl
000c869c  mov     r1, fp
000c869e  mov     r2, r5
000c86a0  blx     #0xddbfc ; -> objc_msgSend
000c86a4  mov     r6, r0
000c86a6  cmp     r0, #0
000c86a8  beq.w   #0xc87c2
000c86ac  ldr     r1, [sp, #0x30]
000c86ae  mov     r0, r8
000c86b0  blx     #0xddbfc ; -> objc_msgSend
000c86b4  ldr     r1, [sp, #0x7c]
000c86b6  mov     r4, r0
000c86b8  mov     r0, r6
000c86ba  blx     #0xddbfc ; -> objc_msgSend
000c86be  ldr     r1, [sp, #0x34]
000c86c0  mov     r2, r0
000c86c2  mov     r0, r4
000c86c4  blx     #0xddbfc ; -> objc_msgSend
000c86c8  cmp     r0, #0
000c86ca  bne     #0xc87c2
000c86cc  mov     r0, r6
000c86ce  ldr     r1, [sp, #0x38]
000c86d0  blx     #0xddbfc ; -> objc_msgSend
000c86d4  cbz     r0, #0xc86e2
000c86d6  mov     r0, r6
000c86d8  ldr     r1, [sp, #0x38]
000c86da  blx     #0xddbfc ; -> objc_msgSend
000c86de  mov     r2, r0
000c86e0  b       #0xc86e6
000c86e2  ldr     r2, [pc, #0x1dc]
000c86e4  add     r2, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000c86e6  mov     r0, r8
000c86e8  ldr     r1, [sp, #0x3c]
000c86ea  blx     #0xddbfc ; -> objc_msgSend
000c86ee  mov     r0, r6
000c86f0  ldr     r1, [sp, #0x40]
000c86f2  blx     #0xddbfc ; -> objc_msgSend
000c86f6  cbz     r0, #0xc8704
000c86f8  mov     r0, r6
000c86fa  ldr     r1, [sp, #0x40]
000c86fc  blx     #0xddbfc ; -> objc_msgSend
000c8700  mov     r2, r0
000c8702  b       #0xc8708
000c8704  ldr     r2, [pc, #0x1bc]
000c8706  add     r2, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000c8708  mov     r0, r8
000c870a  ldr     r1, [sp, #0x44]
000c870c  blx     #0xddbfc ; -> objc_msgSend
000c8710  ldr     r1, [sp, #0x48]
000c8712  mov     r0, r6
000c8714  blx     #0xddbfc ; -> objc_msgSend
000c8718  ldr     r1, [sp, #0x4c]
000c871a  blx     #0xddbfc ; -> objc_msgSend
000c871e  mov     r3, r1
000c8720  mov     r2, r0
000c8722  ldr     r1, [sp, #0x50]
000c8724  mov     r0, r8
000c8726  blx     #0xddbfc ; -> objc_msgSend
000c872a  ldr     r1, [sp, #0x54]
000c872c  mov     r0, r6
000c872e  blx     #0xddbfc ; -> objc_msgSend
000c8732  ldr     r1, [sp, #0x58]
000c8734  ldr     r2, [sp, #0x5c]
000c8736  blx     #0xddbfc ; -> objc_msgSend
000c873a  ldr     r1, [sp, #0x60]
000c873c  mov     r2, r0
000c873e  mov     r0, r8
000c8740  blx     #0xddbfc ; -> objc_msgSend
000c8744  ldr     r1, [sp, #0x54]
000c8746  mov     r0, r6
000c8748  blx     #0xddbfc ; -> objc_msgSend
000c874c  ldr     r1, [sp, #0x58]
000c874e  ldr     r2, [sp, #0x64]
000c8750  blx     #0xddbfc ; -> objc_msgSend
000c8754  ldr     r1, [sp, #0x68]
000c8756  mov     r2, r0
000c8758  mov     r0, r8
000c875a  b       #0xc878c
000c875c  movs    r5, #0
000c875e  mov     r0, sl
000c8760  ldr     r1, [sp, #0x20]
000c8762  blx     #0xddbfc ; -> objc_msgSend
000c8766  cmp     r0, r5
000c8768  bhi     #0xc869a
000c876a  b       #0xc87c6
000c876c  mov     r0, r8
000c876e  bl      #0xc22e4 ; -> Z11RemoveBadgeP16EAMTX_MTXProduct
000c8772  ldr.w   r3, [pc, #0x154]
000c8776  mov     r1, fp
000c8778  ldr     r2, [sp, #0x78]
000c877a  add     r3, pc ; -> 0x000f3274  mtxProdsList
000c877c  ldr     r0, [r3]
000c877e  ldr     r4, [r0]
000c8780  ldr     r0, [sp, #0x74]
000c8782  blx     #0xddbfc ; -> objc_msgSend
000c8786  ldr     r1, [sp, #0x70]
000c8788  mov     r2, r0
000c878a  mov     r0, r4
000c878c  blx     #0xddbfc ; -> objc_msgSend
000c8790  ldr     r2, [sp, #0x78]
000c8792  adds    r2, #1
000c8794  str     r2, [sp, #0x78]
000c8796  ldr     r0, [sp, #0x74]
000c8798  ldr     r1, [sp, #0x20]
000c879a  blx     #0xddbfc ; -> objc_msgSend
000c879e  ldr     r3, [sp, #0x78]
000c87a0  cmp     r0, r3
000c87a2  bhi.w   #0xc8676
000c87a6  ldr     r1, [pc, #0x124]
000c87a8  ldr     r0, [sp, #0xc]
000c87aa  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c87ac  ldr     r1, [r1]
000c87ae  blx     #0xddbfc ; -> objc_msgSend
000c87b2  ldr     r3, [pc, #0x11c]
000c87b4  ldr     r2, [sp, #0x10]
000c87b6  add     r3, pc ; -> 0x000f7fcc  OBJC_IVAR_$_EAMTX_TransObserver.requestId
000c87b8  ldr     r0, [r3]
000c87ba  ldr     r0, [r2, r0]
000c87bc  bl      #0xbc260 ; -> Z18FilterAndSendItemsi
000c87c0  b       #0xc87d4
000c87c2  adds    r5, #1
000c87c4  b       #0xc875e
000c87c6  mov     r0, r8
000c87c8  ldr     r1, [sp, #0x6c]
000c87ca  blx     #0xddbfc ; -> objc_msgSend
000c87ce  cmp     r0, #0
000c87d0  bne     #0xc8790
000c87d2  b       #0xc876c
000c87d4  sub.w   sp, r7, #0x18
000c87d8  pop.w   {r8, sl, fp}
000c87dc  pop     {r4, r5, r6, r7, pc}
000c87de  nop     
000c87e0  add     r7, sp, #0x1a0
000c87e2  movs    r2, r0
000c87e4  strh    r6, [r1, r7]
000c87e6  movs    r3, r0
000c87e8  mov     r6, r7
000c87ea  movs    r3, r0
000c87ec  ldrsb   r2, [r4, r7]
000c87ee  movs    r3, r0
000c87f0  bxns    r4
000c87f2  movs    r3, r0
000c87f4  str     r2, [sp, #0x130]
000c87f6  movs    r3, r1
000c87f8  strh    r4, [r1, r4]
000c87fa  movs    r3, r0
000c87fc  str     r2, [sp, #0x80]
000c87fe  movs    r3, r1
000c8800  mov     sl, r5
000c8802  movs    r3, r0
000c8804  mov     r8, r0
000c8806  movs    r3, r0
000c8808  ldrsb   r0, [r2, r5]
000c880a  movs    r3, r0
