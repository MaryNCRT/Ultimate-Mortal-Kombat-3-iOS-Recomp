========================================================================
MTX_CleanUp  0x000bdad8  984 bytes   EAMTX_Main.mm
========================================================================

000bdad8  push    {r4, r5, r6, r7, lr}
000bdada  add     r7, sp, #0xc
000bdadc  ldr     r0, [pc, #0x2e0]
000bdade  ldr     r4, [pc, #0x2e4]
000bdae0  add     r0, pc ; -> 0x0038c164  categoryName
000bdae2  add     r4, pc ; -> 0x0038c0b4  mIAMView
000bdae4  ldr     r0, [r0]
000bdae6  bl      #0xb5804 ; -> Z16ResetBadgesCountP8NSString
000bdaea  bl      #0xbda00 ; -> Z16SaveProductsDatav
000bdaee  ldr     r0, [pc, #0x2d8]
000bdaf0  ldr     r1, [pc, #0x2d8]
000bdaf2  movs    r2, #5
000bdaf4  add     r0, pc ; -> 0x0038c0e4  mtxController
000bdaf6  add     r1, pc ; -> 0x000fd4f0  
000bdaf8  ldr     r0, [r0]
000bdafa  ldr     r1, [r1]
000bdafc  blx     #0xddbfc ; -> objc_msgSend
000bdb00  ldr     r0, [r4]
000bdb02  cbz     r0, #0xbdb24
000bdb04  ldr     r1, [pc, #0x2c8]
000bdb06  add     r1, pc ; -> 0x000fcaac  '\x1al\x0e'
000bdb08  ldr     r1, [r1]
000bdb0a  blx     #0xddbfc ; -> objc_msgSend
000bdb0e  tst.w   r0, #0xff
000bdb12  beq     #0xbdb24
000bdb14  ldr     r1, [pc, #0x2bc]
000bdb16  movs    r2, #0
000bdb18  ldr     r0, [r4]
000bdb1a  add     r1, pc ; -> 0x000fcac0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x148
000bdb1c  mov     r3, r2
000bdb1e  ldr     r1, [r1]
000bdb20  blx     #0xddbfc ; -> objc_msgSend
000bdb24  ldr     r4, [pc, #0x2b0]
000bdb26  bl      #0xcfb54 ; -> Z14MTXDMG_CleanUpv
000bdb2a  add     r4, pc ; -> 0x0038c0bc  mtxProdsList
000bdb2c  ldr     r0, [r4]
000bdb2e  cbz     r0, #0xbdb46
000bdb30  ldr     r1, [pc, #0x2a8]
000bdb32  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bdb34  ldr     r1, [r1]
000bdb36  blx     #0xddbfc ; -> objc_msgSend
000bdb3a  ldr     r1, [pc, #0x2a4]
000bdb3c  ldr     r0, [r4]
000bdb3e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bdb40  ldr     r1, [r1]
000bdb42  blx     #0xddbfc ; -> objc_msgSend
000bdb46  ldr     r4, [pc, #0x29c]
000bdb48  add     r4, pc ; -> 0x0038c0d4  prodSellIds
000bdb4a  ldr     r0, [r4]
000bdb4c  cbz     r0, #0xbdb64
000bdb4e  ldr     r1, [pc, #0x298]
000bdb50  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bdb52  ldr     r1, [r1]
000bdb54  blx     #0xddbfc ; -> objc_msgSend
000bdb58  ldr     r1, [pc, #0x290]
000bdb5a  ldr     r0, [r4]
000bdb5c  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bdb5e  ldr     r1, [r1]
000bdb60  blx     #0xddbfc ; -> objc_msgSend
000bdb64  ldr     r4, [pc, #0x288]
000bdb66  add     r4, pc ; -> 0x0038c0c0  resultProdsList
000bdb68  ldr     r0, [r4]
000bdb6a  cbz     r0, #0xbdb82
000bdb6c  ldr     r1, [pc, #0x284]
000bdb6e  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bdb70  ldr     r1, [r1]
000bdb72  blx     #0xddbfc ; -> objc_msgSend
000bdb76  ldr     r1, [pc, #0x280]
000bdb78  ldr     r0, [r4]
000bdb7a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bdb7c  ldr     r1, [r1]
000bdb7e  blx     #0xddbfc ; -> objc_msgSend
000bdb82  ldr     r4, [pc, #0x278]
000bdb84  add     r4, pc ; -> 0x0038c0c8  restoredItems
000bdb86  ldr     r0, [r4]
000bdb88  cbz     r0, #0xbdba0
000bdb8a  ldr     r1, [pc, #0x274]
000bdb8c  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bdb8e  ldr     r1, [r1]
000bdb90  blx     #0xddbfc ; -> objc_msgSend
000bdb94  ldr     r1, [pc, #0x26c]
000bdb96  ldr     r0, [r4]
000bdb98  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bdb9a  ldr     r1, [r1]
000bdb9c  blx     #0xddbfc ; -> objc_msgSend
000bdba0  ldr     r1, [pc, #0x264]
000bdba2  ldr     r0, [pc, #0x268]
000bdba4  ldr     r4, [pc, #0x268]
000bdba6  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bdba8  add     r0, pc ; -> 0x0038c0e4  mtxController
000bdbaa  ldr     r5, [r1]
000bdbac  ldr     r0, [r0]
000bdbae  add     r4, pc ; -> 0x0038c120  eventsOrder
000bdbb0  mov     r1, r5
000bdbb2  blx     #0xddbfc ; -> objc_msgSend
000bdbb6  ldr     r0, [pc, #0x25c]
000bdbb8  mov     r1, r5
000bdbba  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000bdbbc  ldr     r0, [r0]
000bdbbe  blx     #0xddbfc ; -> objc_msgSend
000bdbc2  ldr     r0, [pc, #0x254]
000bdbc4  mov     r1, r5
000bdbc6  add     r0, pc ; -> 0x0038c0ec  mtxNetwork
000bdbc8  ldr     r0, [r0]
000bdbca  blx     #0xddbfc ; -> objc_msgSend
000bdbce  ldr     r0, [r4]
000bdbd0  cbz     r0, #0xbdbe4
000bdbd2  ldr     r1, [pc, #0x248]
000bdbd4  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bdbd6  ldr     r1, [r1]
000bdbd8  blx     #0xddbfc ; -> objc_msgSend
000bdbdc  ldr     r0, [r4]
000bdbde  mov     r1, r5
000bdbe0  blx     #0xddbfc ; -> objc_msgSend
000bdbe4  ldr     r0, [pc, #0x238]
000bdbe6  mov     r1, r5
000bdbe8  add     r0, pc ; -> 0x0038c0c4  mtxtransObserver
000bdbea  ldr     r0, [r0]
000bdbec  blx     #0xddbfc ; -> objc_msgSend
000bdbf0  ldr     r0, [pc, #0x230]
000bdbf2  mov     r1, r5
000bdbf4  add     r0, pc ; -> 0x0038c164  categoryName
000bdbf6  ldr     r0, [r0]
000bdbf8  blx     #0xddbfc ; -> objc_msgSend
000bdbfc  ldr     r0, [pc, #0x228]
000bdbfe  mov     r1, r5
000bdc00  add     r0, pc ; -> 0x0038c16c  transId
000bdc02  ldr     r0, [r0]
000bdc04  blx     #0xddbfc ; -> objc_msgSend
000bdc08  ldr     r0, [pc, #0x220]
000bdc0a  mov     r1, r5
000bdc0c  add     r0, pc ; -> 0x0038c170  receipt
000bdc0e  ldr     r0, [r0]
000bdc10  blx     #0xddbfc ; -> objc_msgSend
000bdc14  ldr     r0, [pc, #0x218]
000bdc16  mov     r1, r5
000bdc18  add     r0, pc ; -> 0x0038c174  currency
000bdc1a  ldr     r0, [r0]
000bdc1c  blx     #0xddbfc ; -> objc_msgSend
000bdc20  ldr     r0, [pc, #0x210]
000bdc22  add     r0, pc ; -> 0x0038c13c  m_MainBanner
000bdc24  ldr     r0, [r0]
000bdc26  cbz     r0, #0xbdc2e
000bdc28  mov     r1, r5
000bdc2a  blx     #0xddbfc ; -> objc_msgSend
000bdc2e  ldr     r4, [pc, #0x208]
000bdc30  add     r4, pc ; -> 0x0038c140  m_ThumbsList
000bdc32  ldr     r0, [r4]
000bdc34  cbz     r0, #0xbdc48
000bdc36  ldr     r1, [pc, #0x204]
000bdc38  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bdc3a  ldr     r1, [r1]
000bdc3c  blx     #0xddbfc ; -> objc_msgSend
000bdc40  ldr     r0, [r4]
000bdc42  mov     r1, r5
000bdc44  blx     #0xddbfc ; -> objc_msgSend
000bdc48  ldr     r0, [pc, #0x1f4]
000bdc4a  add     r0, pc ; -> 0x0038c144  m_CurrTicker
000bdc4c  ldr     r0, [r0]
000bdc4e  cbz     r0, #0xbdc56
000bdc50  mov     r1, r5
000bdc52  blx     #0xddbfc ; -> objc_msgSend
000bdc56  ldr     r4, [pc, #0x1ec]
000bdc58  add     r4, pc ; -> 0x0038c148  m_TickersList
000bdc5a  ldr     r0, [r4]
000bdc5c  cbz     r0, #0xbdc70
000bdc5e  ldr     r1, [pc, #0x1e8]
000bdc60  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bdc62  ldr     r1, [r1]
000bdc64  blx     #0xddbfc ; -> objc_msgSend
000bdc68  ldr     r0, [r4]
000bdc6a  mov     r1, r5
000bdc6c  blx     #0xddbfc ; -> objc_msgSend
000bdc70  ldr     r0, [pc, #0x1d8]
000bdc72  add     r0, pc ; -> 0x0038c18c  m_CurrCat
000bdc74  ldr     r0, [r0]
000bdc76  cbz     r0, #0xbdc7e
000bdc78  mov     r1, r5
000bdc7a  blx     #0xddbfc ; -> objc_msgSend
000bdc7e  ldr     r4, [pc, #0x1d0]
000bdc80  add     r4, pc ; -> 0x0038c190  m_CategoriesList
000bdc82  ldr     r0, [r4]
000bdc84  cbz     r0, #0xbdc98
000bdc86  ldr     r1, [pc, #0x1cc]
000bdc88  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bdc8a  ldr     r1, [r1]
000bdc8c  blx     #0xddbfc ; -> objc_msgSend
000bdc90  ldr     r0, [r4]
000bdc92  mov     r1, r5
000bdc94  blx     #0xddbfc ; -> objc_msgSend
000bdc98  ldr     r0, [pc, #0x1bc]
000bdc9a  add     r0, pc ; -> 0x0038c1a4  catsUpdatedTime
000bdc9c  ldr     r0, [r0]
000bdc9e  cbz     r0, #0xbdca6
000bdca0  mov     r1, r5
000bdca2  blx     #0xddbfc ; -> objc_msgSend
000bdca6  ldr     r0, [pc, #0x1b4]
000bdca8  add     r0, pc ; -> 0x0038c1a0  thumbsUpdatedTime
000bdcaa  ldr     r0, [r0]
000bdcac  cbz     r0, #0xbdcb4
000bdcae  mov     r1, r5
000bdcb0  blx     #0xddbfc ; -> objc_msgSend
000bdcb4  ldr     r4, [pc, #0x1a8]
000bdcb6  add     r4, pc ; -> 0x0038c194  m_BadgesDict
000bdcb8  ldr     r0, [r4]
000bdcba  cbz     r0, #0xbdcce
000bdcbc  ldr     r1, [pc, #0x1a4]
000bdcbe  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bdcc0  ldr     r1, [r1]
000bdcc2  blx     #0xddbfc ; -> objc_msgSend
000bdcc6  ldr     r0, [r4]
000bdcc8  mov     r1, r5
000bdcca  blx     #0xddbfc ; -> objc_msgSend
000bdcce  ldr     r4, [pc, #0x198]
000bdcd0  add     r4, pc ; -> 0x0038c0d8  badgeSellIds
000bdcd2  ldr     r0, [r4]
000bdcd4  cbz     r0, #0xbdce8
000bdcd6  ldr     r1, [pc, #0x194]
000bdcd8  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bdcda  ldr     r1, [r1]
000bdcdc  blx     #0xddbfc ; -> objc_msgSend
000bdce0  ldr     r0, [r4]
000bdce2  mov     r1, r5
000bdce4  blx     #0xddbfc ; -> objc_msgSend
000bdce8  ldr     r0, [pc, #0x184]
000bdcea  add     r0, pc ; -> 0x0038c180  itemsLangCode
000bdcec  ldr     r0, [r0]
000bdcee  cbz     r0, #0xbdcf6
000bdcf0  mov     r1, r5
000bdcf2  blx     #0xddbfc ; -> objc_msgSend
000bdcf6  ldr     r0, [pc, #0x17c]
000bdcf8  add     r0, pc ; -> 0x0038c154  bannerLangCode
000bdcfa  ldr     r0, [r0]
000bdcfc  cbz     r0, #0xbdd04
000bdcfe  mov     r1, r5
000bdd00  blx     #0xddbfc ; -> objc_msgSend
000bdd04  ldr     r0, [pc, #0x170]
000bdd06  add     r0, pc ; -> 0x0038c150  tickersLangCode
000bdd08  ldr     r0, [r0]
000bdd0a  cbz     r0, #0xbdd12
000bdd0c  mov     r1, r5
000bdd0e  blx     #0xddbfc ; -> objc_msgSend
000bdd12  ldr     r0, [pc, #0x168]
000bdd14  add     r0, pc ; -> 0x0038c1c8  tickersUpdatedtime
000bdd16  ldr     r0, [r0]
000bdd18  cbz     r0, #0xbdd20
000bdd1a  mov     r1, r5
000bdd1c  blx     #0xddbfc ; -> objc_msgSend
000bdd20  ldr     r0, [pc, #0x15c]
000bdd22  add     r0, pc ; -> 0x0038c1cc  bannersUpdatedTime
000bdd24  ldr     r0, [r0]
000bdd26  cbz     r0, #0xbdd2e
000bdd28  mov     r1, r5
000bdd2a  blx     #0xddbfc ; -> objc_msgSend
000bdd2e  ldr     r0, [pc, #0x154]
000bdd30  add     r0, pc ; -> 0x0038c0e0  postingKeys
000bdd32  ldr     r0, [r0]
000bdd34  cbz     r0, #0xbdd3c
000bdd36  mov     r1, r5
000bdd38  blx     #0xddbfc ; -> objc_msgSend
000bdd3c  ldr     r0, [pc, #0x148]
000bdd3e  mov     r1, r5
000bdd40  ldr     r4, [pc, #0x148]
000bdd42  add     r0, pc ; -> 0x0038c0fc  emptyStr
000bdd44  movs    r6, #0
000bdd46  ldr     r0, [r0]
000bdd48  blx     #0xddbfc ; -> objc_msgSend
000bdd4c  ldr     r0, [pc, #0x140]
000bdd4e  mov     r1, r5
000bdd50  add     r4, pc ; -> 0x0038c0b0  m_Callbacks
000bdd52  add     r0, pc ; -> 0x0038c100  searchStr
000bdd54  ldr     r0, [r0]
000bdd56  blx     #0xddbfc ; -> objc_msgSend
000bdd5a  ldr     r0, [pc, #0x138]
000bdd5c  mov     r1, r5
000bdd5e  add     r0, pc ; -> 0x0038c110  sessionId
000bdd60  ldr     r0, [r0]
000bdd62  blx     #0xddbfc ; -> objc_msgSend
000bdd66  ldr     r0, [pc, #0x130]
000bdd68  mov     r1, r5
000bdd6a  add     r0, pc ; -> 0x0038c104  serverAddr
000bdd6c  ldr     r0, [r0]
000bdd6e  blx     #0xddbfc ; -> objc_msgSend
000bdd72  ldr     r0, [pc, #0x128]
000bdd74  mov     r1, r5
000bdd76  add     r0, pc ; -> 0x0038c10c  akamaiAddr
000bdd78  ldr     r0, [r0]
000bdd7a  blx     #0xddbfc ; -> objc_msgSend
000bdd7e  ldr     r0, [pc, #0x120]
000bdd80  mov     r1, r5
000bdd82  add     r0, pc ; -> 0x0038c1bc  mayhemServerAddr
000bdd84  ldr     r0, [r0]
000bdd86  blx     #0xddbfc ; -> objc_msgSend
000bdd8a  ldr     r0, [pc, #0x118]
000bdd8c  mov     r1, r5
000bdd8e  add     r0, pc ; -> 0x0038c108  trackingAddr
000bdd90  ldr     r0, [r0]
000bdd92  blx     #0xddbfc ; -> objc_msgSend
000bdd96  ldr     r0, [pc, #0x110]
000bdd98  mov     r1, r5
000bdd9a  add     r0, pc ; -> 0x0038c1c4  requestParams
000bdd9c  ldr     r0, [r0]
000bdd9e  blx     #0xddbfc ; -> objc_msgSend
000bdda2  ldr     r0, [r4]
000bdda4  mov     r1, r5
000bdda6  blx     #0xddbfc ; -> objc_msgSend
000bddaa  str     r6, [r4]
000bddac  ldr     r4, [pc, #0xfc]
000bddae  mov     r1, r5
000bddb0  add     r4, pc ; -> 0x0017cf10  m_ModulesArray
000bddb2  ldr     r0, [r4]
000bddb4  blx     #0xddbfc ; -> objc_msgSend
000bddb8  str     r6, [r4]
000bddba  movs    r0, #1
000bddbc  pop     {r4, r5, r6, r7, pc}
000bddbe  nop     
000bddc0  b       #0xbdac4
000bddc2  movs    r4, r5
000bddc4  b       #0xbd964
000bddc6  movs    r4, r5
000bddc8  b       #0xbd9a4
000bddca  movs    r4, r5
