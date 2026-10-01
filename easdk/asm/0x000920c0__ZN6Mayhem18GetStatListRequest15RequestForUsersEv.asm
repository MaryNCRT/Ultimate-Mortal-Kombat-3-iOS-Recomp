========================================================================
ZN6Mayhem18GetStatListRequest15RequestForUsersEv  0x000920c0  2300 bytes   Mayhem.mm
========================================================================

000920c0  push    {r4, r5, r6, r7, lr}
000920c2  add     r7, sp, #0xc
000920c4  push.w  {r8, sl, fp}
000920c8  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
000920cc  sub     sp, #0x134
000920ce  ldr.w   r3, [pc, #0x85c]
000920d2  str     r0, [sp, #0x14]
000920d4  add     r0, sp, #0xa0
000920d6  add     r3, pc ; -> 0x000f3438  0x0
000920d8  str     r7, [sp, #0xc0]
000920da  ldr     r3, [r3]
000920dc  str.w   sp, [sp, #0xc8]
000920e0  str     r3, [sp, #0xb8]
000920e2  ldr.w   r3, [pc, #0x84c]
000920e6  add     r3, pc ; -> 0x000ee430  GCC_except_table77
000920e8  str     r3, [sp, #0xbc]
000920ea  ldr.w   r3, [pc, #0x848]
000920ee  add     r3, pc ; -> 0x000926a6  
000920f0  orr     r3, r3, #1
000920f4  str     r3, [sp, #0xc4]
000920f6  blx     #0xdd4ac ; -> Unwind_SjLj_Register
000920fa  ldr.w   r0, [pc, #0x83c]
000920fe  mov.w   r3, #-1
00092102  str     r3, [sp, #0xa4]
00092104  add     r0, pc ; -> 0x0017f1a4  
00092106  blx     #0xdd3e0 ; -> NSLog
0009210a  ldr.w   r3, [pc, #0x830]
0009210e  ldr     r1, [sp, #0x14]
00092110  ldr     r2, [sp, #0x14]
00092112  add     r3, pc ; -> 0x000f3370  0x0
00092114  ldr     r3, [r3]
00092116  str     r3, [sp, #0x78]
00092118  adds    r3, #0xc
0009211a  str     r3, [sp, #0x11c]
0009211c  ldr     r1, [r1, #0x60]
0009211e  str     r1, [sp, #0x90]
00092120  ldr     r3, [r2, #0x5c]
00092122  cmp     r3, r1
00092124  str     r3, [sp, #0x118]
00092126  str     r3, [sp, #0x8c]
00092128  bne     #0x9213e
0009212a  b       #0x92156
0009212c  ldr.w   r1, [pc, #0x810]
00092130  movs    r2, #0xd
00092132  add     r0, sp, #0x11c
00092134  str     r2, [sp, #0xa4]
00092136  add     r1, pc ; -> 0x00175e58  ','
00092138  subs    r2, #0xc
0009213a  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
0009213e  movs    r3, #0xd
00092140  add     r0, sp, #0x11c
00092142  str     r3, [sp, #0xa4]
00092144  ldr     r1, [sp, #0x8c]
00092146  blx     #0xdd500 ; -> ZNSs6appendERKSs
0009214a  ldr     r4, [sp, #0x8c]
0009214c  ldr     r1, [sp, #0x90]
0009214e  adds    r4, #4
00092150  cmp     r4, r1
00092152  str     r4, [sp, #0x8c]
00092154  bne     #0x9212c
00092156  ldr.w   r3, [pc, #0x7ec]
0009215a  ldr.w   r2, [pc, #0x7ec]
0009215e  add     r0, sp, #0x114
00092160  add     r3, pc ; -> 0x000fdb5c  
00092162  add     r2, pc ; -> 0x0017f1b4  
00092164  ldr     r3, [r3]
00092166  str     r2, [sp, #0x10]
00092168  str     r3, [sp, #0x18]
0009216a  ldr.w   r3, [pc, #0x7e0]
0009216e  add     r3, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
00092170  ldr     r3, [r3]
00092172  str     r3, [sp, #0x1c]
00092174  movs    r3, #0xd
00092176  str     r3, [sp, #0xa4]
00092178  bl      #0x8bb28 ; -> ZN6Mayhem12getMayhemURLEv
0009217c  ldr     r3, [sp, #0x114]
0009217e  ldr     r4, [sp, #0x11c]
00092180  add     r0, sp, #0x110
00092182  str     r3, [sp, #0x7c]
00092184  str     r4, [sp, #0x20]
00092186  movs    r3, #0xc
00092188  str     r3, [sp, #0xa4]
0009218a  bl      #0x8be80 ; -> ZN6Mayhem17getMayhemGameNameEv
0009218e  ldr.w   lr, [sp, #0x110]
00092192  ldr     r1, [sp, #0x14]
00092194  ldr     r0, [sp, #0x18]
00092196  ldr     r2, [sp, #0x10]
00092198  str.w   lr, [sp, #0x80]
0009219c  ldr     r3, [r1, #0x54]
0009219e  str     r4, [sp]
000921a0  str.w   lr, [sp, #4]
000921a4  ldr     r1, [sp, #0x1c]
000921a6  str     r3, [sp, #8]
000921a8  movs    r3, #0xb
000921aa  str     r3, [sp, #0xa4]
000921ac  ldr     r3, [sp, #0x7c]
000921ae  blx     #0xddbfc ; -> objc_msgSend
000921b2  ldr     r3, [sp, #0x80]
000921b4  ldr     r4, [sp, #0x78]
000921b6  str     r0, [sp, #0x24]
000921b8  sub.w   r0, r3, #0xc
000921bc  cmp     r4, r0
000921be  bne.w   #0x925d8
000921c2  ldr     r1, [sp, #0x7c]
000921c4  ldr     r2, [sp, #0x78]
000921c6  sub.w   r0, r1, #0xc
000921ca  cmp     r2, r0
000921cc  bne.w   #0x925ac
000921d0  ldr.w   r3, [pc, #0x77c]
000921d4  ldr.w   r1, [pc, #0x77c]
000921d8  ldr     r0, [sp, #0x18]
000921da  add     r3, pc ; -> 0x000fcf68  
000921dc  add     r1, pc ; -> 0x000fcf58  
000921de  ldr     r3, [r3]
000921e0  ldr     r1, [r1]
000921e2  str     r3, [sp, #0x28]
000921e4  movs    r3, #0xd
000921e6  str     r3, [sp, #0xa4]
000921e8  blx     #0xddbfc ; -> objc_msgSend
000921ec  mov     r2, r0
000921ee  ldr     r1, [sp, #0x28]
000921f0  ldr     r0, [sp, #0x24]
000921f2  blx     #0xddbfc ; -> objc_msgSend
000921f6  add     r2, sp, #0x130
000921f8  mov     r1, r0
000921fa  movs    r3, #0xa
000921fc  add     r0, sp, #0x10c
000921fe  str     r3, [sp, #0xa4]
00092200  adds    r2, #3
00092202  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00092206  movs    r3, #9
00092208  add     r0, sp, #0xd4
0009220a  str     r3, [sp, #0xa4]
0009220c  add     r1, sp, #0x10c
0009220e  bl      #0x8b474 ; -> ZN6Mayhem11HTTPRequestC1ERKSs
00092212  ldr     r3, [sp, #0x10c]
00092214  ldr     r2, [sp, #0x78]
00092216  sub.w   r0, r3, #0xc
0009221a  cmp     r2, r0
0009221c  bne.w   #0x92580
00092220  ldr.w   r1, [pc, #0x734]
00092224  movs    r3, #7
00092226  add     r0, sp, #0x108
00092228  add     r1, pc ; -> 0x00175e3c  'GET'
0009222a  str     r3, [sp, #0xa4]
0009222c  add.w   r2, sp, #0x132
00092230  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00092234  movs    r3, #6
00092236  add     r0, sp, #0xd4
00092238  str     r3, [sp, #0xa4]
0009223a  add     r1, sp, #0x108
0009223c  bl      #0x8b3e8 ; -> ZN6Mayhem11HTTPRequest9SetMethodERKSs
00092240  ldr     r3, [sp, #0x108]
00092242  ldr     r2, [sp, #0x78]
00092244  sub.w   r0, r3, #0xc
00092248  cmp     r2, r0
0009224a  bne.w   #0x92554
0009224e  ldr.w   r1, [pc, #0x70c]
00092252  add     r2, sp, #0x130
00092254  movs    r3, #5
00092256  add     r1, pc ; -> 0x00175e40  'mh_uid'
00092258  str     r3, [sp, #0xa4]
0009225a  add     r0, sp, #0x104
0009225c  adds    r2, #1
0009225e  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00092262  ldr     r1, [sp, #0x14]
00092264  ldr     r2, [r1, #0xc]
00092266  cmp     r2, #0
00092268  beq.w   #0x92536
0009226c  movs    r3, #4
0009226e  adds    r2, #0x50
00092270  str     r3, [sp, #0xa4]
00092272  add     r0, sp, #0xd4
00092274  add     r1, sp, #0x104
00092276  bl      #0x8f0ac ; -> ZN6Mayhem11HTTPRequest9AddHeaderERKSsS2_
0009227a  ldr     r3, [sp, #0x104]
0009227c  ldr     r2, [sp, #0x78]
0009227e  sub.w   r0, r3, #0xc
00092282  cmp     r2, r0
00092284  bne.w   #0x92508
00092288  ldr.w   r1, [pc, #0x6d4]
0009228c  movs    r3, #3
0009228e  add     r0, sp, #0x100
00092290  add     r1, pc ; -> 0x00175e48  'mh_session_key'
00092292  str     r3, [sp, #0xa4]
00092294  add     r2, sp, #0x130
00092296  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009229a  ldr     r1, [sp, #0x14]
0009229c  ldr     r2, [r1, #0xc]
0009229e  cmp     r2, #0
000922a0  beq.w   #0x924ea
000922a4  movs    r3, #2
000922a6  adds    r2, #0x58
000922a8  str     r3, [sp, #0xa4]
000922aa  add     r0, sp, #0xd4
000922ac  add     r1, sp, #0x100
000922ae  bl      #0x8f0ac ; -> ZN6Mayhem11HTTPRequest9AddHeaderERKSsS2_
000922b2  ldr     r3, [sp, #0x100]
000922b4  ldr     r2, [sp, #0x78]
000922b6  sub.w   r0, r3, #0xc
000922ba  cmp     r2, r0
000922bc  bne.w   #0x924be
000922c0  movs    r1, #8
000922c2  add     r0, sp, #0xd4
000922c4  str     r1, [sp, #0xa4]
000922c6  bl      #0x8f6f0 ; -> ZN6Mayhem11HTTPRequest9DoRequestEv
000922ca  str     r0, [sp, #0x2c]
000922cc  ldr.w   r1, [pc, #0x694]
000922d0  ldr.w   r0, [pc, #0x694]
000922d4  movs    r2, #8
000922d6  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000922d8  add     r0, pc ; -> 0x000fdc00  
000922da  ldr     r1, [r1]
000922dc  ldr     r0, [r0]
000922de  str     r2, [sp, #0xa4]
000922e0  blx     #0xddbfc ; -> objc_msgSend
000922e4  ldr.w   r1, [pc, #0x684]
000922e8  ldr     r2, [sp, #0x2c]
000922ea  add     r1, pc ; -> 0x000fce64  '\x0b=\x0e'
000922ec  ldr     r1, [r1]
000922ee  blx     #0xddbfc ; -> objc_msgSend
000922f2  ldr.w   r1, [pc, #0x67c]
000922f6  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000922f8  ldr     r1, [r1]
000922fa  blx     #0xddbfc ; -> objc_msgSend
000922fe  ldr     r3, [sp, #0x14]
00092300  ldr.w   r1, [pc, #0x670]
00092304  str     r0, [sp, #0x30]
00092306  ldr     r3, [r3, #0x10]
00092308  add     r1, pc ; -> 0x000fcfa4  
0009230a  ldr     r1, [r1]
0009230c  str     r3, [sp, #0x34]
0009230e  mov     r0, r3
00092310  blx     #0xddbfc ; -> objc_msgSend
00092314  ldr.w   r1, [pc, #0x660]
00092318  ldr     r0, [sp, #0x30]
0009231a  ldr     r2, [sp, #0x34]
0009231c  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
0009231e  ldr     r1, [r1]
00092320  blx     #0xddbfc ; -> objc_msgSend
00092324  ldr.w   r1, [pc, #0x654]
00092328  ldr     r0, [sp, #0x30]
0009232a  add     r1, pc ; -> 0x000fce60  '8U\x0e'
0009232c  ldr     r1, [r1]
0009232e  blx     #0xddbfc ; -> objc_msgSend
00092332  tst.w   r0, #0xff
00092336  bne     #0x92392
00092338  ldr     r1, [sp, #0x14]
0009233a  movs    r3, #8
0009233c  ldr     r0, [sp, #0x34]
0009233e  str     r3, [sp, #0xa4]
00092340  str     r1, [sp, #0x94]
00092342  ldr.w   r1, [pc, #0x63c]
00092346  add     r1, pc ; -> 0x000fcf9c  
00092348  ldr     r1, [r1]
0009234a  blx     #0xddbfc ; -> objc_msgSend
0009234e  mov     r1, r0
00092350  movs    r3, #8
00092352  ldr     r0, [sp, #0x94]
00092354  str     r3, [sp, #0xa4]
00092356  bl      #0x8b870 ; -> ZN6Mayhem7Request11HandleErrorEPv
0009235a  ldr     r0, [sp, #0x14]
0009235c  movs    r1, #2
0009235e  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00092362  movs    r3, #0xd
00092364  add     r0, sp, #0xd4
00092366  str     r3, [sp, #0xa4]
00092368  bl      #0x8d4bc ; -> ZN6Mayhem11HTTPRequestD1Ev
0009236c  ldr     r3, [sp, #0x11c]
0009236e  ldr     r2, [sp, #0x78]
00092370  sub.w   r0, r3, #0xc
00092374  cmp     r2, r0
00092376  bne.w   #0x92606
0009237a  add     r0, sp, #0xa0
0009237c  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00092380  sub.w   sp, r7, #0x58
00092384  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00092388  sub.w   sp, r7, #0x18
0009238c  pop.w   {r8, sl, fp}
00092390  pop     {r4, r5, r6, r7, pc}
00092392  ldr.w   r3, [pc, #0x5f0]
00092396  ldr     r0, [sp, #0x34]
00092398  add     r3, pc ; -> 0x000fcf9c  
0009239a  ldr     r3, [r3]
0009239c  str     r3, [sp, #0x38]
0009239e  mov     r1, r3
000923a0  blx     #0xddbfc ; -> objc_msgSend
000923a4  ldr.w   r3, [pc, #0x5e0]
000923a8  ldr.w   r2, [pc, #0x5e0]
000923ac  add     r3, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000923ae  add     r2, pc ; -> 0x0017f064  
000923b0  ldr     r3, [r3]
000923b2  str     r3, [sp, #0x3c]
000923b4  mov     r1, r3
000923b6  blx     #0xddbfc ; -> objc_msgSend
000923ba  str     r0, [sp, #0x40]
000923bc  cmp     r0, #0
000923be  bne     #0x92338
000923c0  ldr     r0, [sp, #0x34]
000923c2  ldr     r1, [sp, #0x38]
000923c4  blx     #0xddbfc ; -> objc_msgSend
000923c8  ldr.w   r2, [pc, #0x5c4]
000923cc  ldr     r1, [sp, #0x3c]
000923ce  add     r2, pc ; -> 0x0017f194  
000923d0  blx     #0xddbfc ; -> objc_msgSend
000923d4  ldr.w   r3, [pc, #0x5bc]
000923d8  ldr     r2, [sp, #0x40]
000923da  add     r3, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000923dc  ldr     r3, [r3]
000923de  str     r3, [sp, #0x44]
000923e0  mov     r1, r3
000923e2  blx     #0xddbfc ; -> objc_msgSend
000923e6  ldr.w   r1, [pc, #0x5b0]
000923ea  add     r1, pc ; -> 0x000fcfa0  
000923ec  ldr     r1, [r1]
000923ee  blx     #0xddbfc ; -> objc_msgSend
000923f2  ldr.w   r2, [pc, #0x5a8]
000923f6  ldr     r1, [sp, #0x3c]
000923f8  add     r2, pc ; -> 0x0017f094  
000923fa  blx     #0xddbfc ; -> objc_msgSend
000923fe  ldr.w   r3, [pc, #0x5a0]
00092402  str     r0, [sp, #0x48]
00092404  add     r3, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
00092406  ldr     r3, [r3]
00092408  str     r3, [sp, #0x4c]
0009240a  mov     r1, r3
0009240c  blx     #0xddbfc ; -> objc_msgSend
00092410  str     r0, [sp, #0x50]
00092412  add     r0, sp, #0xf8
00092414  bl      #0x8ad1c ; -> ZN6Mayhem4StatC1Ev
00092418  ldr     r4, [sp, #0x14]
0009241a  add.w   r0, r4, #0x68
0009241e  ldr     r1, [r4, #0x6c]
00092420  ldr     r2, [r4, #0x68]
00092422  ldr     r4, [sp, #0x50]
00092424  rsb     r3, r2, r1
00092428  asrs    r3, r3, #3
0009242a  cmp     r4, r3
0009242c  bhs     #0x924a8
0009242e  lsls    r3, r4, #3
00092430  adds    r2, r2, r3
00092432  cmp     r2, r1
00092434  str     r2, [sp, #0x88]
00092436  str     r0, [sp, #0x98]
00092438  str     r1, [sp, #0x84]
0009243a  beq     #0x92458
0009243c  str     r2, [sp, #0x9c]
0009243e  ldr     r1, [sp, #0x9c]
00092440  ldr     r3, [r1]
00092442  mov     r0, r1
00092444  ldr     r2, [r3]
00092446  movs    r3, #1
00092448  str     r3, [sp, #0xa4]
0009244a  blx     r2
0009244c  ldr     r2, [sp, #0x9c]
0009244e  ldr     r3, [sp, #0x84]
00092450  adds    r2, #8
00092452  cmp     r3, r2
00092454  str     r2, [sp, #0x9c]
00092456  bne     #0x9243e
00092458  ldr     r2, [sp, #0x88]
0009245a  ldr     r1, [sp, #0x98]
0009245c  str     r2, [r1, #4]
0009245e  movs    r3, #0
00092460  str     r3, [sp, #0x58]
00092462  b       #0x9248c
00092464  ldr     r4, [sp, #0x14]
00092466  ldr     r1, [sp, #0x58]
00092468  ldr     r0, [sp, #0x48]
0009246a  ldr     r2, [r4, #0x68]
0009246c  lsls    r3, r1, #3
0009246e  ldr     r1, [sp, #0x44]
00092470  adds    r2, r2, r3
00092472  str     r2, [sp, #0x54]
00092474  movs    r2, #8
00092476  str     r2, [sp, #0xa4]
00092478  ldr     r2, [sp, #0x58]
0009247a  blx     #0xddbfc ; -> objc_msgSend
0009247e  mov     r1, r0
00092480  ldr     r0, [sp, #0x54]
00092482  bl      #0x90eb0 ; -> ZN6Mayhem4Stat11FillFromXMLEPv
00092486  ldr     r3, [sp, #0x58]
00092488  adds    r3, #1
0009248a  str     r3, [sp, #0x58]
0009248c  movs    r4, #8
0009248e  ldr     r0, [sp, #0x48]
00092490  str     r4, [sp, #0xa4]
00092492  ldr     r1, [sp, #0x4c]
00092494  blx     #0xddbfc ; -> objc_msgSend
00092498  ldr     r1, [sp, #0x58]
0009249a  cmp     r1, r0
0009249c  blo     #0x92464
0009249e  ldr     r0, [sp, #0x14]
000924a0  movs    r1, #1
000924a2  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
000924a6  b       #0x92362
000924a8  ldr     r4, [sp, #0x14]
000924aa  ldr     r1, [r4, #0x6c]
000924ac  ldr     r4, [sp, #0x50]
000924ae  rsb     r2, r3, r4
000924b2  movs    r3, #8
000924b4  str     r3, [sp, #0xa4]
000924b6  add     r3, sp, #0xf8
000924b8  bl      #0x9ac1c ; -> ZNSt6vectorIN6Mayhem4StatESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_
000924bc  b       #0x9245e
000924be  subs    r2, r3, #4
000924c0  ldr     r3, [r3, #-0x4]
000924c4  subs    r1, r3, #1
000924c6  dmb     ish
000924ca  mov     ip, r3
000924cc  ldrex   r4, [r2]
000924d0  cmp     r4, r3
000924d2  beq.w   #0x92694
000924d6  cmp     r4, ip
000924d8  mov     r3, r4
000924da  bne     #0x924c4
000924dc  cmp     r4, #0
000924de  bgt.w   #0x922c0
000924e2  add     r1, sp, #0x124
000924e4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000924e8  b       #0x922c0
000924ea  ldr.w   r0, [pc, #0x4b8]
000924ee  ldr.w   r1, [pc, #0x4b8]
000924f2  ldr.w   r3, [pc, #0x4b8]
000924f6  adds    r2, #2
000924f8  add     r0, pc ; -> 0x000e5914  ZZNK4midp27SafeReferenceCountedPointerIN6Mayhem5TokenEEptEvE8__func__
000924fa  str     r2, [sp, #0xa4]
000924fc  add     r1, pc ; -> 0x00175a60  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
000924fe  add     r3, pc ; -> 0x00175ad4  'm_obj'
00092500  movw    r2, #0x10f
00092504  blx     #0xdd5cc ; -> assert_rtn
00092508  subs    r2, r3, #4
0009250a  ldr     r3, [r3, #-0x4]
0009250e  subs    r1, r3, #1
00092510  dmb     ish
00092514  mov     ip, r3
00092516  ldrex   r4, [r2]
0009251a  cmp     r4, r3
0009251c  beq.w   #0x92682
00092520  cmp     r4, ip
00092522  mov     r3, r4
00092524  bne     #0x9250e
00092526  cmp     r4, #0
00092528  bgt.w   #0x92288
0009252c  add.w   r1, sp, #0x126
00092530  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00092534  b       #0x92288
00092536  ldr.w   r0, [pc, #0x478]
0009253a  ldr.w   r1, [pc, #0x478]
0009253e  ldr.w   r3, [pc, #0x478]
00092542  adds    r2, #4
00092544  add     r0, pc ; -> 0x000e5914  ZZNK4midp27SafeReferenceCountedPointerIN6Mayhem5TokenEEptEvE8__func__
00092546  str     r2, [sp, #0xa4]
00092548  add     r1, pc ; -> 0x00175a60  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
0009254a  add     r3, pc ; -> 0x00175ad4  'm_obj'
0009254c  movw    r2, #0x10f
00092550  blx     #0xdd5cc ; -> assert_rtn
00092554  subs    r2, r3, #4
00092556  ldr     r3, [r3, #-0x4]
0009255a  subs    r1, r3, #1
0009255c  dmb     ish
00092560  mov     ip, r3
00092562  ldrex   r4, [r2]
00092566  cmp     r4, r3
00092568  beq.w   #0x92670
0009256c  cmp     r4, ip
0009256e  mov     r3, r4
00092570  bne     #0x9255a
00092572  cmp     r4, #0
00092574  bgt.w   #0x9224e
00092578  add     r1, sp, #0x128
0009257a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009257e  b       #0x9224e
00092580  subs    r2, r3, #4
00092582  ldr     r3, [r3, #-0x4]
00092586  subs    r1, r3, #1
00092588  dmb     ish
0009258c  mov     ip, r3
0009258e  ldrex   r4, [r2]
00092592  cmp     r4, r3
00092594  beq     #0x92660
00092596  cmp     r4, ip
00092598  mov     r3, r4
0009259a  bne     #0x92586
0009259c  cmp     r4, #0
0009259e  bgt.w   #0x92220
000925a2  add.w   r1, sp, #0x12a
000925a6  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000925aa  b       #0x92220
000925ac  ldr     r3, [sp, #0x7c]
000925ae  subs    r2, r3, #4
000925b0  ldr     r3, [r3, #-0x4]
000925b4  subs    r1, r3, #1
000925b6  dmb     ish
000925ba  mov     ip, r3
000925bc  ldrex   r4, [r2]
000925c0  cmp     r4, r3
000925c2  beq     #0x92650
000925c4  cmp     r4, ip
000925c6  mov     r3, r4
000925c8  bne     #0x925b4
000925ca  cmp     r4, #0
000925cc  bgt.w   #0x921d0
000925d0  add     r1, sp, #0x12c
000925d2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000925d6  b       #0x921d0
000925d8  subs    r2, r3, #4
000925da  ldr     r3, [r3, #-0x4]
000925de  subs    r1, r3, #1
000925e0  dmb     ish
000925e4  mov     ip, r3
000925e6  ldrex   lr, [r2]
000925ea  cmp     lr, r3
000925ec  beq     #0x92642
000925ee  cmp     lr, ip
000925f0  mov     r3, lr
000925f2  bne     #0x925de
000925f4  cmp.w   lr, #0
000925f8  bgt.w   #0x921c2
000925fc  add     r1, sp, #0x12c
000925fe  adds    r1, #3
00092600  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00092604  b       #0x921c2
00092606  subs    r2, r3, #4
00092608  ldr     r3, [r3, #-0x4]
0009260c  subs    r1, r3, #1
0009260e  dmb     ish
00092612  mov     ip, r3
00092614  ldrex   r4, [r2]
00092618  cmp     r4, r3
0009261a  beq     #0x92632
0009261c  cmp     r4, ip
0009261e  mov     r3, r4
00092620  bne     #0x9260c
00092622  cmp     r4, #0
00092624  bgt.w   #0x9237a
00092628  add.w   r1, sp, #0x122
0009262c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00092630  b       #0x9237a
00092632  strex   lr, r1, [r2]
00092636  cmp.w   lr, #0
0009263a  bne     #0x92614
0009263c  dmb     ish
00092640  b       #0x9261c
00092642  strex   r4, r1, [r2]
00092646  cmp     r4, #0
00092648  bne     #0x925e6
0009264a  dmb     ish
0009264e  b       #0x925ee
00092650  strex   lr, r1, [r2]
00092654  cmp.w   lr, #0
00092658  bne     #0x925bc
0009265a  dmb     ish
0009265e  b       #0x925c4
00092660  strex   lr, r1, [r2]
00092664  cmp.w   lr, #0
00092668  bne     #0x9258e
0009266a  dmb     ish
0009266e  b       #0x92596
00092670  strex   lr, r1, [r2]
00092674  cmp.w   lr, #0
00092678  bne.w   #0x92562
0009267c  dmb     ish
00092680  b       #0x9256c
00092682  strex   lr, r1, [r2]
00092686  cmp.w   lr, #0
0009268a  bne.w   #0x92516
0009268e  dmb     ish
00092692  b       #0x92520
00092694  strex   lr, r1, [r2]
00092698  cmp.w   lr, #0
0009269c  bne.w   #0x924cc
000926a0  dmb     ish
000926a4  b       #0x924d6
000926a6  ldr     r3, [sp, #0xa4]
000926a8  ldr     r4, [sp, #0xa8]
000926aa  cmp     r3, #1
000926ac  str     r4, [sp, #0xc]
000926ae  beq.w   #0x927ca
000926b2  cmp     r3, #2
000926b4  beq     #0x926e4
000926b6  cmp     r3, #3
000926b8  beq.w   #0x92890
000926bc  cmp     r3, #4
000926be  beq     #0x926e4
000926c0  cmp     r3, #5
000926c2  beq.w   #0x9287a
000926c6  cmp     r3, #6
000926c8  beq     #0x926e4
000926ca  cmp     r3, #7
000926cc  beq     #0x926e4
000926ce  cmp     r3, #8
000926d0  beq.w   #0x927e0
000926d4  cmp     r3, #9
000926d6  beq     #0x926ee
000926d8  cmp     r3, #0xa
000926da  beq     #0x9270e
000926dc  cmp     r3, #0xb
000926de  beq     #0x92722
000926e0  cmp     r3, #0xc
000926e2  beq     #0x926ee
000926e4  add     r0, sp, #0xd4
000926e6  movs    r3, #0
000926e8  str     r3, [sp, #0xa4]
000926ea  bl      #0x8d4bc ; -> ZN6Mayhem11HTTPRequestD1Ev
000926ee  ldr     r3, [sp, #0x11c]
000926f0  ldr     r4, [sp, #0x78]
000926f2  ldr     r2, [sp, #0xc]
000926f4  sub.w   r0, r3, #0xc
000926f8  cmp     r4, r0
000926fa  str     r2, [sp, #0x74]
000926fc  bne     #0x92738
000926fe  ldr     r1, [sp, #0x74]
00092700  mov.w   r3, #-1
00092704  str     r3, [sp, #0xa4]
00092706  mov     r0, r1
00092708  str     r1, [sp, #0xc]
0009270a  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009270e  ldr     r4, [sp, #0x80]
00092710  ldr     r1, [sp, #0x78]
00092712  ldr     r3, [sp, #0xc]
00092714  sub.w   r0, r4, #0xc
00092718  cmp     r1, r0
0009271a  str     r3, [sp, #0x5c]
0009271c  bne     #0x92792
0009271e  ldr     r1, [sp, #0x5c]
00092720  str     r1, [sp, #0xc]
00092722  ldr     r3, [sp, #0x7c]
00092724  ldr     r4, [sp, #0x78]
00092726  ldr     r2, [sp, #0xc]
00092728  sub.w   r0, r3, #0xc
0009272c  cmp     r4, r0
0009272e  str     r2, [sp, #0x60]
00092730  bne     #0x92766
00092732  ldr     r1, [sp, #0x60]
00092734  str     r1, [sp, #0xc]
00092736  b       #0x926ee
00092738  subs    r2, r3, #4
0009273a  ldr     r3, [r3, #-0x4]
0009273e  subs    r1, r3, #1
00092740  dmb     ish
00092744  mov     ip, r3
00092746  ldrex   lr, [r2]
0009274a  cmp     lr, r3
0009274c  beq.w   #0x9285a
00092750  cmp     lr, ip
00092752  mov     r3, lr
00092754  bne     #0x9273e
00092756  cmp.w   lr, #0
0009275a  bgt     #0x926fe
0009275c  add     r1, sp, #0x120
0009275e  adds    r1, #3
00092760  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00092764  b       #0x926fe
00092766  subs    r2, r3, #4
00092768  ldr     r3, [r3, #-0x4]
0009276c  subs    r1, r3, #1
0009276e  dmb     ish
00092772  mov     ip, r3
00092774  ldrex   lr, [r2]
00092778  cmp     lr, r3
0009277a  beq     #0x927bc
0009277c  cmp     lr, ip
0009277e  mov     r3, lr
00092780  bne     #0x9276c
00092782  cmp.w   lr, #0
00092786  bgt     #0x92732
00092788  add     r1, sp, #0x12c
0009278a  adds    r1, #1
0009278c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00092790  b       #0x92732
00092792  ldr     r3, [r4, #-0x4]
00092796  subs    r2, r4, #4
00092798  subs    r1, r3, #1
0009279a  dmb     ish
0009279e  mov     ip, r3
000927a0  ldrex   r4, [r2]
000927a4  cmp     r4, r3
000927a6  beq     #0x9286a
000927a8  cmp     r4, ip
000927aa  mov     r3, r4
000927ac  bne     #0x92798
000927ae  cmp     r4, #0
000927b0  bgt     #0x9271e
000927b2  add.w   r1, sp, #0x12e
000927b6  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000927ba  b       #0x9271e
000927bc  strex   r4, r1, [r2]
000927c0  cmp     r4, #0
000927c2  bne     #0x92774
000927c4  dmb     ish
000927c8  b       #0x9277c
000927ca  ldr     r3, [sp, #0x100]
000927cc  ldr     r4, [sp, #0x78]
000927ce  ldr     r2, [sp, #0xc]
000927d0  sub.w   r0, r3, #0xc
000927d4  cmp     r4, r0
000927d6  str     r2, [sp, #0x70]
000927d8  bne     #0x927f6
000927da  ldr     r1, [sp, #0x70]
000927dc  str     r1, [sp, #0xc]
000927de  b       #0x926e4
000927e0  ldr     r3, [sp, #0x10c]
000927e2  ldr     r2, [sp, #0x78]
000927e4  ldr     r1, [sp, #0xc]
000927e6  sub.w   r0, r3, #0xc
000927ea  cmp     r2, r0
000927ec  str     r1, [sp, #0x64]
000927ee  bne     #0x92822
000927f0  ldr     r1, [sp, #0x64]
000927f2  str     r1, [sp, #0xc]
000927f4  b       #0x926ee
000927f6  subs    r2, r3, #4
000927f8  ldr     r3, [r3, #-0x4]
000927fc  subs    r1, r3, #1
000927fe  dmb     ish
00092802  mov     ip, r3
00092804  ldrex   lr, [r2]
00092808  cmp     lr, r3
0009280a  beq     #0x9284c
0009280c  cmp     lr, ip
0009280e  mov     r3, lr
00092810  bne     #0x927fc
00092812  cmp.w   lr, #0
00092816  bgt     #0x927da
00092818  add     r1, sp, #0x124
0009281a  adds    r1, #1
0009281c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00092820  b       #0x927da
00092822  subs    r2, r3, #4
00092824  ldr     r3, [r3, #-0x4]
00092828  subs    r1, r3, #1
0009282a  dmb     ish
0009282e  mov     ip, r3
00092830  ldrex   r4, [r2]
00092834  cmp     r4, r3
00092836  beq     #0x9290c
00092838  cmp     r4, ip
0009283a  mov     r3, r4
0009283c  bne     #0x92828
0009283e  cmp     r4, #0
00092840  bgt     #0x927f0
00092842  add     r1, sp, #0x128
00092844  adds    r1, #3
00092846  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009284a  b       #0x927f0
0009284c  strex   r4, r1, [r2]
00092850  cmp     r4, #0
00092852  bne     #0x92804
00092854  dmb     ish
00092858  b       #0x9280c
0009285a  strex   r4, r1, [r2]
0009285e  cmp     r4, #0
00092860  bne.w   #0x92746
00092864  dmb     ish
00092868  b       #0x92750
0009286a  strex   lr, r1, [r2]
0009286e  cmp.w   lr, #0
00092872  bne     #0x927a0
00092874  dmb     ish
00092878  b       #0x927a8
0009287a  ldr     r3, [sp, #0x108]
0009287c  ldr     r2, [sp, #0x78]
0009287e  ldr     r1, [sp, #0xc]
00092880  sub.w   r0, r3, #0xc
00092884  cmp     r2, r0
00092886  str     r1, [sp, #0x68]
00092888  bne     #0x928a6
0009288a  ldr     r1, [sp, #0x68]
0009288c  str     r1, [sp, #0xc]
0009288e  b       #0x926e4
00092890  ldr     r3, [sp, #0x104]
00092892  ldr     r4, [sp, #0x78]
00092894  ldr     r2, [sp, #0xc]
00092896  sub.w   r0, r3, #0xc
0009289a  cmp     r4, r0
0009289c  str     r2, [sp, #0x6c]
0009289e  bne     #0x928d0
000928a0  ldr     r1, [sp, #0x6c]
000928a2  str     r1, [sp, #0xc]
000928a4  b       #0x926e4
000928a6  subs    r2, r3, #4
000928a8  ldr     r3, [r3, #-0x4]
000928ac  subs    r1, r3, #1
000928ae  dmb     ish
000928b2  mov     ip, r3
000928b4  ldrex   r4, [r2]
000928b8  cmp     r4, r3
000928ba  beq     #0x928fc
000928bc  cmp     r4, ip
000928be  mov     r3, r4
000928c0  bne     #0x928ac
000928c2  cmp     r4, #0
000928c4  bgt     #0x9288a
000928c6  add     r1, sp, #0x128
000928c8  adds    r1, #1
000928ca  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000928ce  b       #0x9288a
000928d0  subs    r2, r3, #4
000928d2  ldr     r3, [r3, #-0x4]
000928d6  subs    r1, r3, #1
000928d8  dmb     ish
000928dc  mov     ip, r3
000928de  ldrex   lr, [r2]
000928e2  cmp     lr, r3
000928e4  beq     #0x9291c
000928e6  cmp     lr, ip
000928e8  mov     r3, lr
000928ea  bne     #0x928d6
000928ec  cmp.w   lr, #0
000928f0  bgt     #0x928a0
000928f2  add     r1, sp, #0x124
000928f4  adds    r1, #3
000928f6  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000928fa  b       #0x928a0
000928fc  strex   lr, r1, [r2]
00092900  cmp.w   lr, #0
00092904  bne     #0x928b4
00092906  dmb     ish
0009290a  b       #0x928bc
0009290c  strex   lr, r1, [r2]
00092910  cmp.w   lr, #0
00092914  bne     #0x92830
00092916  dmb     ish
0009291a  b       #0x92838
0009291c  strex   r4, r1, [r2]
00092920  cmp     r4, #0
00092922  bne     #0x928de
00092924  dmb     ish
00092928  b       #0x928e6
0009292a  nop     
0009292c  asrs    r6, r3, #0xd
0009292e  movs    r6, r0
00092930  stm     r3!, {r1, r2, r6}
00092932  movs    r5, r0
00092934  lsls    r4, r6, #0x16
00092936  movs    r0, r0
00092938  beq     #0x92874
0009293a  movs    r6, r1
0009293c  asrs    r2, r3, #9
0009293e  movs    r6, r0
00092940  subs    r5, #0x1e
00092942  movs    r6, r1
00092944  cbnz    r0, #0x92986
00092946  movs    r6, r0
00092948  beq     #0x929e8
0009294a  movs    r6, r1
0009294c  add     r1, sp, #0xb8
0009294e  movs    r6, r0
00092950  add     r5, sp, #0x228
00092952  movs    r6, r0
00092954  add     r5, sp, #0x1e0
00092956  movs    r6, r0
00092958  subs    r4, #0x10
0009295a  movs    r6, r1
0009295c  subs    r3, #0xe6
0009295e  movs    r6, r1
00092960  subs    r3, #0xb4
00092962  movs    r6, r1
00092964  adr     r6, #0x2a8
00092966  movs    r6, r0
00092968  cbnz    r4, #0x92974
0009296a  movs    r6, r0
0009296c  add     r3, sp, #0x1d8
0009296e  movs    r6, r0
00092970  adr     r7, #0x178
00092972  movs    r6, r0
00092974  add     r4, sp, #0x260
00092976  movs    r6, r0
00092978  add     r1, sp, #0x160
0009297a  movs    r6, r0
0009297c  add     r3, sp, #0xc8
0009297e  movs    r6, r0
00092980  add     r4, sp, #0x148
00092982  movs    r6, r0
00092984  add     r4, sp, #0
00092986  movs    r6, r0
00092988  adr     r7, #0x90
0009298a  movs    r6, r0
0009298c  ldm     r4, {r1, r4, r5, r7}
0009298e  movs    r6, r1
00092990  ldm     r5!, {r1, r6, r7}
00092992  movs    r6, r1
00092994  adr     r6, #0x278
00092996  movs    r6, r0
00092998  add     r3, sp, #0x2c8
0009299a  movs    r6, r0
0009299c  ldm     r4, {r3, r4, r7}
0009299e  movs    r6, r1
000929a0  adr     r6, #0x1e0
000929a2  movs    r6, r0
000929a4  adds    r4, #0x18
000929a6  movs    r5, r0
000929a8  adds    r5, #0x60
000929aa  movs    r6, r1
000929ac  adds    r5, #0xd2
000929ae  movs    r6, r1
000929b0  adds    r3, #0xcc
000929b2  movs    r5, r0
000929b4  adds    r5, #0x14
000929b6  movs    r6, r1
000929b8  adds    r5, #0x86
000929ba  movs    r6, r1
