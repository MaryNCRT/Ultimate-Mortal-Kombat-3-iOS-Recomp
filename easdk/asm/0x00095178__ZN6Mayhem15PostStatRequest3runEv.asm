========================================================================
ZN6Mayhem15PostStatRequest3runEv  0x00095178  3908 bytes   Mayhem.mm
========================================================================

00095178  push    {r4, r5, r6, r7, lr}
0009517a  add     r7, sp, #0xc
0009517c  push.w  {r8, sl, fp}
00095180  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00095184  sub     sp, #0x158
00095186  ldr.w   r3, [pc, #0xb5c]
0009518a  str     r0, [sp, #0x14]
0009518c  add     r0, sp, #0x9c
0009518e  add     r3, pc ; -> 0x000f3438  0x0
00095190  str     r7, [sp, #0xbc]
00095192  ldr     r3, [r3]
00095194  str.w   sp, [sp, #0xc4]
00095198  str     r3, [sp, #0xb4]
0009519a  ldr.w   r3, [pc, #0xb4c]
0009519e  add     r3, pc ; -> 0x000ee4ce  GCC_except_table91
000951a0  str     r3, [sp, #0xb8]
000951a2  ldr.w   r3, [pc, #0xb48]
000951a6  add     r3, pc ; -> 0x000959d8  
000951a8  orr     r3, r3, #1
000951ac  str     r3, [sp, #0xc0]
000951ae  blx     #0xdd4ac ; -> Unwind_SjLj_Register
000951b2  ldr.w   r3, [pc, #0xb3c]
000951b6  ldr.w   r1, [pc, #0xb3c]
000951ba  add     r0, sp, #0x12c
000951bc  add     r3, pc ; -> 0x000fdb5c  
000951be  add     r1, pc ; -> 0x0017f3a4  
000951c0  ldr     r3, [r3]
000951c2  str     r1, [sp, #0x10]
000951c4  str     r3, [sp, #0x18]
000951c6  ldr.w   r3, [pc, #0xb30]
000951ca  add     r3, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000951cc  ldr     r3, [r3]
000951ce  str     r3, [sp, #0x1c]
000951d0  mov.w   r3, #-1
000951d4  str     r3, [sp, #0xa0]
000951d6  bl      #0x8bb28 ; -> ZN6Mayhem12getMayhemURLEv
000951da  ldr     r2, [sp, #0x12c]
000951dc  ldr     r3, [sp, #0x14]
000951de  add     r0, sp, #0x128
000951e0  str     r2, [sp, #0x7c]
000951e2  ldr     r3, [r3, #0x5c]
000951e4  str     r3, [sp, #0x80]
000951e6  movs    r3, #0x18
000951e8  str     r3, [sp, #0xa0]
000951ea  bl      #0x8be80 ; -> ZN6Mayhem17getMayhemGameNameEv
000951ee  ldr     r4, [sp, #0x128]
000951f0  ldr     r1, [sp, #0x14]
000951f2  ldr     r2, [sp, #0x80]
000951f4  ldr     r0, [sp, #0x18]
000951f6  str     r4, [sp, #0x84]
000951f8  ldr     r3, [r1, #0x58]
000951fa  str     r2, [sp]
000951fc  str     r4, [sp, #4]
000951fe  ldr     r1, [sp, #0x1c]
00095200  str     r3, [sp, #8]
00095202  ldr     r2, [sp, #0x10]
00095204  movs    r3, #0x17
00095206  str     r3, [sp, #0xa0]
00095208  ldr     r3, [sp, #0x7c]
0009520a  blx     #0xddbfc ; -> objc_msgSend
0009520e  ldr.w   r3, [pc, #0xaec]
00095212  str     r0, [sp, #0x20]
00095214  sub.w   r0, r4, #0xc
00095218  add     r3, pc ; -> 0x000f3370  0x0
0009521a  ldr     r3, [r3]
0009521c  cmp     r0, r3
0009521e  str     r3, [sp, #0x88]
00095220  bne.w   #0x95692
00095224  ldr     r1, [sp, #0x7c]
00095226  ldr     r2, [sp, #0x88]
00095228  sub.w   r0, r1, #0xc
0009522c  cmp     r2, r0
0009522e  bne.w   #0x95662
00095232  ldr.w   r3, [pc, #0xacc]
00095236  ldr     r0, [sp, #0x18]
00095238  add     r3, pc ; -> 0x000fcf68  
0009523a  ldr     r3, [r3]
0009523c  str     r3, [sp, #0x24]
0009523e  ldr.w   r3, [pc, #0xac4]
00095242  add     r3, pc ; -> 0x000fcf58  
00095244  ldr     r3, [r3]
00095246  str     r3, [sp, #0x28]
00095248  ldr     r1, [sp, #0x28]
0009524a  mov.w   r3, #-1
0009524e  str     r3, [sp, #0xa0]
00095250  blx     #0xddbfc ; -> objc_msgSend
00095254  ldr     r1, [sp, #0x24]
00095256  mov     r2, r0
00095258  ldr     r0, [sp, #0x20]
0009525a  blx     #0xddbfc ; -> objc_msgSend
0009525e  add     r2, sp, #0x154
00095260  movs    r3, #0x16
00095262  adds    r2, #3
00095264  str     r3, [sp, #0xa0]
00095266  mov     r1, r0
00095268  add     r0, sp, #0x124
0009526a  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009526e  movs    r3, #0x15
00095270  add     r0, sp, #0xd0
00095272  str     r3, [sp, #0xa0]
00095274  add     r1, sp, #0x124
00095276  bl      #0x8b474 ; -> ZN6Mayhem11HTTPRequestC1ERKSs
0009527a  ldr     r3, [sp, #0x124]
0009527c  ldr     r2, [sp, #0x88]
0009527e  sub.w   r0, r3, #0xc
00095282  cmp     r2, r0
00095284  bne.w   #0x95636
00095288  ldr.w   r1, [pc, #0xa7c]
0009528c  movs    r3, #0x13
0009528e  add     r0, sp, #0x120
00095290  add     r1, pc ; -> 0x00175f14  'POST'
00095292  str     r3, [sp, #0xa0]
00095294  add.w   r2, sp, #0x156
00095298  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009529c  movs    r3, #0x12
0009529e  add     r0, sp, #0xd0
000952a0  str     r3, [sp, #0xa0]
000952a2  add     r1, sp, #0x120
000952a4  bl      #0x8b3e8 ; -> ZN6Mayhem11HTTPRequest9SetMethodERKSs
000952a8  ldr     r3, [sp, #0x120]
000952aa  ldr     r2, [sp, #0x88]
000952ac  sub.w   r0, r3, #0xc
000952b0  cmp     r2, r0
000952b2  bne.w   #0x95608
000952b6  ldr.w   r1, [pc, #0xa54]
000952ba  add     r2, sp, #0x154
000952bc  movs    r3, #0x11
000952be  add     r1, pc ; -> 0x00175f1c  'mh_session_key'
000952c0  str     r3, [sp, #0xa0]
000952c2  add     r0, sp, #0x11c
000952c4  adds    r2, #1
000952c6  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
000952ca  ldr     r1, [sp, #0x14]
000952cc  ldr     r2, [r1, #0x14]
000952ce  cmp     r2, #0
000952d0  beq.w   #0x955ec
000952d4  movs    r3, #0x10
000952d6  adds    r2, #0x58
000952d8  str     r3, [sp, #0xa0]
000952da  add     r0, sp, #0xd0
000952dc  add     r1, sp, #0x11c
000952de  bl      #0x8f0ac ; -> ZN6Mayhem11HTTPRequest9AddHeaderERKSsS2_
000952e2  ldr     r3, [sp, #0x11c]
000952e4  ldr     r2, [sp, #0x88]
000952e6  sub.w   r0, r3, #0xc
000952ea  cmp     r2, r0
000952ec  bne.w   #0x956c0
000952f0  ldr.w   r1, [pc, #0xa1c]
000952f4  movs    r3, #0xf
000952f6  add     r0, sp, #0x118
000952f8  add     r1, pc ; -> 0x00175f2c  'mh_uid'
000952fa  str     r3, [sp, #0xa0]
000952fc  add     r2, sp, #0x154
000952fe  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00095302  ldr     r1, [sp, #0x14]
00095304  movs    r3, #0xe
00095306  add     r0, sp, #0xd0
00095308  add.w   r2, r1, #0x5c
0009530c  str     r3, [sp, #0xa0]
0009530e  add     r1, sp, #0x118
00095310  bl      #0x8f0ac ; -> ZN6Mayhem11HTTPRequest9AddHeaderERKSsS2_
00095314  ldr     r3, [sp, #0x118]
00095316  ldr     r2, [sp, #0x88]
00095318  sub.w   r0, r3, #0xc
0009531c  cmp     r2, r0
0009531e  bne.w   #0x95708
00095322  ldr     r1, [sp, #0x14]
00095324  ldr     r3, [r1, #0x14]
00095326  cmp     r3, #0
00095328  beq.w   #0x956ec
0009532c  ldr     r2, [sp, #0x14]
0009532e  ldr     r3, [r3, #0x58]
00095330  ldr     r0, [sp, #0x18]
00095332  ldr     r1, [r2, #0x60]
00095334  ldr.w   r2, [pc, #0x9dc]
00095338  str     r1, [sp]
0009533a  add     r2, pc ; -> 0x0017f3b4  
0009533c  movs    r1, #0x14
0009533e  str     r1, [sp, #0xa0]
00095340  ldr     r1, [sp, #0x1c]
00095342  blx     #0xddbfc ; -> objc_msgSend
00095346  bl      #0x8b75c ; -> Z3md5P8NSString
0009534a  str     r0, [sp, #0x2c]
0009534c  ldr     r1, [sp, #0x28]
0009534e  ldr     r0, [sp, #0x18]
00095350  blx     #0xddbfc ; -> objc_msgSend
00095354  mov     r2, r0
00095356  ldr     r1, [sp, #0x24]
00095358  ldr     r0, [sp, #0x2c]
0009535a  blx     #0xddbfc ; -> objc_msgSend
0009535e  add     r2, sp, #0x150
00095360  mov     r1, r0
00095362  movs    r3, #0xd
00095364  add     r0, sp, #0x114
00095366  str     r3, [sp, #0xa0]
00095368  adds    r2, #3
0009536a  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009536e  ldr     r4, [sp, #0x14]
00095370  ldr.w   r2, [pc, #0x9a4]
00095374  movs    r1, #0xc
00095376  ldr     r0, [sp, #0x18]
00095378  ldr     r3, [r4, #0x60]
0009537a  add     r2, pc ; -> 0x0017e5c4  
0009537c  str     r1, [sp, #0xa0]
0009537e  ldr     r1, [sp, #0x1c]
00095380  blx     #0xddbfc ; -> objc_msgSend
00095384  str     r0, [sp, #0x30]
00095386  ldr     r1, [sp, #0x28]
00095388  ldr     r0, [sp, #0x18]
0009538a  blx     #0xddbfc ; -> objc_msgSend
0009538e  mov     r2, r0
00095390  ldr     r1, [sp, #0x24]
00095392  ldr     r0, [sp, #0x30]
00095394  blx     #0xddbfc ; -> objc_msgSend
00095398  mov     r1, r0
0009539a  movs    r3, #0xb
0009539c  add     r0, sp, #0x110
0009539e  str     r3, [sp, #0xa0]
000953a0  add.w   r2, sp, #0x152
000953a4  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
000953a8  ldr     r1, [sp, #0x88]
000953aa  add.w   r2, r4, #0x64
000953ae  add     r0, sp, #0x108
000953b0  add.w   r3, r1, #0xc
000953b4  ldr.w   r1, [pc, #0x964]
000953b8  str     r3, [sp, #0x10c]
000953ba  movs    r3, #0xa
000953bc  add     r1, pc ; -> 0x00175f34  'gamedata='
000953be  str     r3, [sp, #0xa0]
000953c0  bl      #0x9ba4c ; -> ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EPKS3_RKS6_
000953c4  movs    r3, #9
000953c6  add     r0, sp, #0x104
000953c8  str     r3, [sp, #0xa0]
000953ca  add     r1, sp, #0x108
000953cc  blx     #0xdd53c ; -> ZNSsC1ERKSs
000953d0  ldr.w   r1, [pc, #0x94c]
000953d4  movs    r3, #3
000953d6  add     r0, sp, #0x104
000953d8  add     r1, pc ; -> 0x00175f40  '\n'
000953da  str     r3, [sp, #0xa0]
000953dc  movs    r2, #1
000953de  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
000953e2  movs    r3, #8
000953e4  add     r0, sp, #0x10c
000953e6  str     r3, [sp, #0xa0]
000953e8  add     r1, sp, #0x104
000953ea  blx     #0xdd500 ; -> ZNSs6appendERKSs
000953ee  ldr     r3, [sp, #0x104]
000953f0  ldr     r2, [sp, #0x88]
000953f2  sub.w   r0, r3, #0xc
000953f6  cmp     r2, r0
000953f8  bne.w   #0x958a2
000953fc  ldr     r3, [sp, #0x108]
000953fe  ldr     r1, [sp, #0x88]
00095400  sub.w   r0, r3, #0xc
00095404  cmp     r1, r0
00095406  bne.w   #0x95876
0009540a  ldr.w   r1, [pc, #0x918]
0009540e  movs    r3, #0xa
00095410  add     r0, sp, #0x100
00095412  add     r1, pc ; -> 0x00175f44  'value='
00095414  str     r3, [sp, #0xa0]
00095416  add     r2, sp, #0x110
00095418  bl      #0x9ba4c ; -> ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EPKS3_RKS6_
0009541c  movs    r3, #7
0009541e  add     r0, sp, #0xfc
00095420  str     r3, [sp, #0xa0]
00095422  add     r1, sp, #0x100
00095424  blx     #0xdd53c ; -> ZNSsC1ERKSs
00095428  ldr.w   r1, [pc, #0x8fc]
0009542c  movs    r3, #2
0009542e  add     r0, sp, #0xfc
00095430  add     r1, pc ; -> 0x00175f4c  '\n'
00095432  str     r3, [sp, #0xa0]
00095434  movs    r2, #1
00095436  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
0009543a  movs    r3, #6
0009543c  add     r0, sp, #0x10c
0009543e  str     r3, [sp, #0xa0]
00095440  add     r1, sp, #0xfc
00095442  blx     #0xdd500 ; -> ZNSs6appendERKSs
00095446  ldr     r3, [sp, #0xfc]
00095448  ldr     r2, [sp, #0x88]
0009544a  sub.w   r0, r3, #0xc
0009544e  cmp     r2, r0
00095450  bne.w   #0x95848
00095454  ldr     r3, [sp, #0x100]
00095456  ldr     r1, [sp, #0x88]
00095458  sub.w   r0, r3, #0xc
0009545c  cmp     r1, r0
0009545e  bne.w   #0x9581c
00095462  ldr.w   r1, [pc, #0x8c8]
00095466  movs    r3, #0xa
00095468  add     r0, sp, #0xf8
0009546a  add     r1, pc ; -> 0x00175f50  'csm='
0009546c  str     r3, [sp, #0xa0]
0009546e  add     r2, sp, #0x114
00095470  bl      #0x9ba4c ; -> ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EPKS3_RKS6_
00095474  movs    r3, #5
00095476  add     r0, sp, #0xf4
00095478  str     r3, [sp, #0xa0]
0009547a  add     r1, sp, #0xf8
0009547c  blx     #0xdd53c ; -> ZNSsC1ERKSs
00095480  ldr.w   r1, [pc, #0x8ac]
00095484  movs    r2, #1
00095486  add     r0, sp, #0xf4
00095488  add     r1, pc ; -> 0x00175f58  '\n'
0009548a  str     r2, [sp, #0xa0]
0009548c  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
00095490  movs    r3, #4
00095492  add     r0, sp, #0x10c
00095494  str     r3, [sp, #0xa0]
00095496  add     r1, sp, #0xf4
00095498  blx     #0xdd500 ; -> ZNSs6appendERKSs
0009549c  ldr     r3, [sp, #0xf4]
0009549e  ldr     r2, [sp, #0x88]
000954a0  sub.w   r0, r3, #0xc
000954a4  cmp     r2, r0
000954a6  bne.w   #0x95764
000954aa  ldr     r3, [sp, #0xf8]
000954ac  ldr     r1, [sp, #0x88]
000954ae  sub.w   r0, r3, #0xc
000954b2  cmp     r1, r0
000954b4  bne.w   #0x95736
000954b8  movs    r3, #0xa
000954ba  add     r0, sp, #0xd0
000954bc  str     r3, [sp, #0xa0]
000954be  add     r1, sp, #0x10c
000954c0  bl      #0x8b3dc ; -> ZN6Mayhem11HTTPRequest7SetBodyERKSs
000954c4  add     r0, sp, #0xd0
000954c6  bl      #0x8f6f0 ; -> ZN6Mayhem11HTTPRequest9DoRequestEv
000954ca  str     r0, [sp, #0x34]
000954cc  ldr.w   r1, [pc, #0x864]
000954d0  ldr.w   r0, [pc, #0x864]
000954d4  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000954d6  add     r0, pc ; -> 0x000fdc00  
000954d8  ldr     r1, [r1]
000954da  ldr     r0, [r0]
000954dc  blx     #0xddbfc ; -> objc_msgSend
000954e0  ldr.w   r1, [pc, #0x858]
000954e4  ldr     r2, [sp, #0x34]
000954e6  add     r1, pc ; -> 0x000fce64  '\x0b=\x0e'
000954e8  ldr     r1, [r1]
000954ea  blx     #0xddbfc ; -> objc_msgSend
000954ee  ldr.w   r1, [pc, #0x850]
000954f2  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000954f4  ldr     r1, [r1]
000954f6  blx     #0xddbfc ; -> objc_msgSend
000954fa  ldr     r1, [sp, #0x14]
000954fc  str     r0, [sp, #0x38]
000954fe  ldr     r1, [r1, #0x18]
00095500  str     r1, [sp, #0x3c]
00095502  ldr.w   r1, [pc, #0x840]
00095506  ldr     r0, [sp, #0x3c]
00095508  add     r1, pc ; -> 0x000fcfa4  
0009550a  ldr     r1, [r1]
0009550c  blx     #0xddbfc ; -> objc_msgSend
00095510  ldr.w   r1, [pc, #0x834]
00095514  ldr     r0, [sp, #0x38]
00095516  ldr     r2, [sp, #0x3c]
00095518  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
0009551a  ldr     r1, [r1]
0009551c  blx     #0xddbfc ; -> objc_msgSend
00095520  ldr.w   r1, [pc, #0x828]
00095524  ldr     r0, [sp, #0x38]
00095526  add     r1, pc ; -> 0x000fce60  '8U\x0e'
00095528  ldr     r1, [r1]
0009552a  blx     #0xddbfc ; -> objc_msgSend
0009552e  tst.w   r0, #0xff
00095532  bne     #0x955b6
00095534  ldr     r1, [sp, #0x14]
00095536  movs    r3, #0xa
00095538  ldr     r0, [sp, #0x3c]
0009553a  adds    r1, #8
0009553c  str     r1, [sp, #0x98]
0009553e  ldr.w   r1, [pc, #0x810]
00095542  str     r3, [sp, #0xa0]
00095544  add     r1, pc ; -> 0x000fcf9c  
00095546  ldr     r1, [r1]
00095548  blx     #0xddbfc ; -> objc_msgSend
0009554c  mov     r1, r0
0009554e  movs    r3, #0xa
00095550  ldr     r0, [sp, #0x98]
00095552  str     r3, [sp, #0xa0]
00095554  bl      #0x8b870 ; -> ZN6Mayhem7Request11HandleErrorEPv
00095558  bl      #0x7f2cc ; -> EASOC_StatPostFailed
0009555c  ldr     r3, [sp, #0x14]
0009555e  movs    r1, #2
00095560  add.w   r0, r3, #8
00095564  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00095568  ldr     r3, [sp, #0x10c]
0009556a  ldr     r1, [sp, #0x88]
0009556c  sub.w   r0, r3, #0xc
00095570  cmp     r1, r0
00095572  bne.w   #0x957ee
00095576  ldr     r3, [sp, #0x110]
00095578  ldr     r1, [sp, #0x88]
0009557a  sub.w   r0, r3, #0xc
0009557e  cmp     r1, r0
00095580  bne.w   #0x957c0
00095584  ldr     r3, [sp, #0x114]
00095586  ldr     r1, [sp, #0x88]
00095588  sub.w   r0, r3, #0xc
0009558c  cmp     r1, r0
0009558e  bne.w   #0x95792
00095592  add     r0, sp, #0xd0
00095594  mov.w   r3, #-1
00095598  str     r3, [sp, #0xa0]
0009559a  bl      #0x8d4bc ; -> ZN6Mayhem11HTTPRequestD1Ev
0009559e  add     r0, sp, #0x9c
000955a0  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
000955a4  sub.w   sp, r7, #0x58
000955a8  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
000955ac  sub.w   sp, r7, #0x18
000955b0  pop.w   {r8, sl, fp}
000955b4  pop     {r4, r5, r6, r7, pc}
000955b6  ldr.w   r1, [pc, #0x79c]
000955ba  ldr     r0, [sp, #0x3c]
000955bc  add     r1, pc ; -> 0x000fcf9c  
000955be  ldr     r1, [r1]
000955c0  blx     #0xddbfc ; -> objc_msgSend
000955c4  ldr.w   r1, [pc, #0x790]
000955c8  ldr.w   r2, [pc, #0x790]
000955cc  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000955ce  add     r2, pc ; -> 0x0017f064  
000955d0  ldr     r1, [r1]
000955d2  blx     #0xddbfc ; -> objc_msgSend
000955d6  cmp     r0, #0
000955d8  bne     #0x95534
000955da  bl      #0x7f310 ; -> EASOC_StatPostSucceded
000955de  ldr     r2, [sp, #0x14]
000955e0  movs    r1, #1
000955e2  add.w   r0, r2, #8
000955e6  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
000955ea  b       #0x95568
000955ec  ldr.w   r0, [pc, #0x770]
000955f0  ldr.w   r1, [pc, #0x770]
000955f4  ldr.w   r3, [pc, #0x770]
000955f8  adds    r2, #0x10
000955fa  add     r0, pc ; -> 0x000e5914  ZZNK4midp27SafeReferenceCountedPointerIN6Mayhem5TokenEEptEvE8__func__
000955fc  str     r2, [sp, #0xa0]
000955fe  add     r1, pc ; -> 0x00175a60  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
00095600  add     r3, pc ; -> 0x00175ad4  'm_obj'
00095602  adds    r2, #0xff
00095604  blx     #0xdd5cc ; -> assert_rtn
00095608  subs    r2, r3, #4
0009560a  ldr     r3, [r3, #-0x4]
0009560e  subs    r1, r3, #1
00095610  dmb     ish
00095614  mov     ip, r3
00095616  ldrex   r4, [r2]
0009561a  cmp     r4, r3
0009561c  beq.w   #0x958e0
00095620  cmp     r4, ip
00095622  mov     r3, r4
00095624  bne     #0x9560e
00095626  cmp     r4, #0
00095628  bgt.w   #0x952b6
0009562c  add.w   r1, sp, #0x14a
00095630  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095634  b       #0x952b6
00095636  subs    r2, r3, #4
00095638  ldr     r3, [r3, #-0x4]
0009563c  subs    r1, r3, #1
0009563e  dmb     ish
00095642  mov     ip, r3
00095644  ldrex   r4, [r2]
00095648  cmp     r4, r3
0009564a  beq.w   #0x95904
0009564e  cmp     r4, ip
00095650  mov     r3, r4
00095652  bne     #0x9563c
00095654  cmp     r4, #0
00095656  bgt.w   #0x95288
0009565a  add     r1, sp, #0x14c
0009565c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095660  b       #0x95288
00095662  ldr     r3, [sp, #0x7c]
00095664  subs    r2, r3, #4
00095666  ldr     r3, [r3, #-0x4]
0009566a  subs    r1, r3, #1
0009566c  dmb     ish
00095670  mov     ip, r3
00095672  ldrex   r4, [r2]
00095676  cmp     r4, r3
00095678  beq.w   #0x958f2
0009567c  cmp     r4, ip
0009567e  mov     r3, r4
00095680  bne     #0x9566a
00095682  cmp     r4, #0
00095684  bgt.w   #0x95232
00095688  add.w   r1, sp, #0x14e
0009568c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095690  b       #0x95232
00095692  ldr     r3, [r4, #-0x4]
00095696  subs    r2, r4, #4
00095698  subs    r1, r3, #1
0009569a  dmb     ish
0009569e  mov     ip, r3
000956a0  ldrex   r4, [r2]
000956a4  cmp     r4, r3
000956a6  beq.w   #0x958ce
000956aa  cmp     r4, ip
000956ac  mov     r3, r4
000956ae  bne     #0x95698
000956b0  cmp     r4, #0
000956b2  bgt.w   #0x95224
000956b6  add     r1, sp, #0x150
000956b8  adds    r1, #1
000956ba  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000956be  b       #0x95224
000956c0  subs    r2, r3, #4
000956c2  ldr     r3, [r3, #-0x4]
000956c6  subs    r1, r3, #1
000956c8  dmb     ish
000956cc  mov     ip, r3
000956ce  ldrex   r4, [r2]
000956d2  cmp     r4, r3
000956d4  beq.w   #0x9593a
000956d8  cmp     r4, ip
000956da  mov     r3, r4
000956dc  bne     #0x956c6
000956de  cmp     r4, #0
000956e0  bgt.w   #0x952f0
000956e4  add     r1, sp, #0x148
000956e6  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000956ea  b       #0x952f0
000956ec  ldr.w   r0, [pc, #0x67c]
000956f0  ldr.w   r1, [pc, #0x67c]
000956f4  ldr.w   r3, [pc, #0x67c]
000956f8  movs    r2, #0x14
000956fa  add     r0, pc ; -> 0x000e5914  ZZNK4midp27SafeReferenceCountedPointerIN6Mayhem5TokenEEptEvE8__func__
000956fc  str     r2, [sp, #0xa0]
000956fe  add     r1, pc ; -> 0x00175a60  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
00095700  add     r3, pc ; -> 0x00175ad4  'm_obj'
00095702  adds    r2, #0xfb
00095704  blx     #0xdd5cc ; -> assert_rtn
00095708  subs    r2, r3, #4
0009570a  ldr     r3, [r3, #-0x4]
0009570e  subs    r1, r3, #1
00095710  dmb     ish
00095714  mov     ip, r3
00095716  ldrex   r4, [r2]
0009571a  cmp     r4, r3
0009571c  beq.w   #0x95928
00095720  cmp     r4, ip
00095722  mov     r3, r4
00095724  bne     #0x9570e
00095726  cmp     r4, #0
00095728  bgt.w   #0x95322
0009572c  add.w   r1, sp, #0x146
00095730  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095734  b       #0x95322
00095736  subs    r2, r3, #4
00095738  ldr     r3, [r3, #-0x4]
0009573c  subs    r1, r3, #1
0009573e  dmb     ish
00095742  mov     ip, r3
00095744  ldrex   r4, [r2]
00095748  cmp     r4, r3
0009574a  beq.w   #0x95916
0009574e  cmp     r4, ip
00095750  mov     r3, r4
00095752  bne     #0x9573c
00095754  cmp     r4, #0
00095756  bgt.w   #0x954b8
0009575a  add     r1, sp, #0x134
0009575c  adds    r1, #3
0009575e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095762  b       #0x954b8
00095764  subs    r2, r3, #4
00095766  ldr     r3, [r3, #-0x4]
0009576a  subs    r1, r3, #1
0009576c  dmb     ish
00095770  mov     ip, r3
00095772  ldrex   r4, [r2]
00095776  cmp     r4, r3
00095778  beq.w   #0x959c6
0009577c  cmp     r4, ip
0009577e  mov     r3, r4
00095780  bne     #0x9576a
00095782  cmp     r4, #0
00095784  bgt.w   #0x954aa
00095788  add     r1, sp, #0x138
0009578a  adds    r1, #1
0009578c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095790  b       #0x954aa
00095792  subs    r2, r3, #4
00095794  ldr     r3, [r3, #-0x4]
00095798  subs    r1, r3, #1
0009579a  dmb     ish
0009579e  mov     ip, r3
000957a0  ldrex   r4, [r2]
000957a4  cmp     r4, r3
000957a6  beq.w   #0x959b4
000957aa  cmp     r4, ip
000957ac  mov     r3, r4
000957ae  bne     #0x95798
000957b0  cmp     r4, #0
000957b2  bgt.w   #0x95592
000957b6  add     r1, sp, #0x130
000957b8  adds    r1, #1
000957ba  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000957be  b       #0x95592
000957c0  subs    r2, r3, #4
000957c2  ldr     r3, [r3, #-0x4]
000957c6  subs    r1, r3, #1
000957c8  dmb     ish
000957cc  mov     ip, r3
000957ce  ldrex   r4, [r2]
000957d2  cmp     r4, r3
000957d4  beq.w   #0x959a2
000957d8  cmp     r4, ip
000957da  mov     r3, r4
000957dc  bne     #0x957c6
000957de  cmp     r4, #0
000957e0  bgt.w   #0x95584
000957e4  add     r1, sp, #0x130
000957e6  adds    r1, #3
000957e8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000957ec  b       #0x95584
000957ee  subs    r2, r3, #4
000957f0  ldr     r3, [r3, #-0x4]
000957f4  subs    r1, r3, #1
000957f6  dmb     ish
000957fa  mov     ip, r3
000957fc  ldrex   r4, [r2]
00095800  cmp     r4, r3
00095802  beq.w   #0x95990
00095806  cmp     r4, ip
00095808  mov     r3, r4
0009580a  bne     #0x957f4
0009580c  cmp     r4, #0
0009580e  bgt.w   #0x95576
00095812  add     r1, sp, #0x134
00095814  adds    r1, #1
00095816  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009581a  b       #0x95576
0009581c  subs    r2, r3, #4
0009581e  ldr     r3, [r3, #-0x4]
00095822  subs    r1, r3, #1
00095824  dmb     ish
00095828  mov     ip, r3
0009582a  ldrex   r4, [r2]
0009582e  cmp     r4, r3
00095830  beq.w   #0x9597e
00095834  cmp     r4, ip
00095836  mov     r3, r4
00095838  bne     #0x95822
0009583a  cmp     r4, #0
0009583c  bgt.w   #0x95462
00095840  add     r1, sp, #0x13c
00095842  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095846  b       #0x95462
00095848  subs    r2, r3, #4
0009584a  ldr     r3, [r3, #-0x4]
0009584e  subs    r1, r3, #1
00095850  dmb     ish
00095854  mov     ip, r3
00095856  ldrex   r4, [r2]
0009585a  cmp     r4, r3
0009585c  beq.w   #0x9596c
00095860  cmp     r4, ip
00095862  mov     r3, r4
00095864  bne     #0x9584e
00095866  cmp     r4, #0
00095868  bgt.w   #0x95454
0009586c  add.w   r1, sp, #0x13e
00095870  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095874  b       #0x95454
00095876  subs    r2, r3, #4
00095878  ldr     r3, [r3, #-0x4]
0009587c  subs    r1, r3, #1
0009587e  dmb     ish
00095882  mov     ip, r3
00095884  ldrex   r4, [r2]
00095888  cmp     r4, r3
0009588a  beq     #0x9595c
0009588c  cmp     r4, ip
0009588e  mov     r3, r4
00095890  bne     #0x9587c
00095892  cmp     r4, #0
00095894  bgt.w   #0x9540a
00095898  add     r1, sp, #0x140
0009589a  adds    r1, #1
0009589c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000958a0  b       #0x9540a
000958a2  subs    r2, r3, #4
000958a4  ldr     r3, [r3, #-0x4]
000958a8  subs    r1, r3, #1
000958aa  dmb     ish
000958ae  mov     ip, r3
000958b0  ldrex   r4, [r2]
000958b4  cmp     r4, r3
000958b6  beq     #0x9594c
000958b8  cmp     r4, ip
000958ba  mov     r3, r4
000958bc  bne     #0x958a8
000958be  cmp     r4, #0
000958c0  bgt.w   #0x953fc
000958c4  add     r1, sp, #0x140
000958c6  adds    r1, #3
000958c8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000958cc  b       #0x953fc
000958ce  strex   lr, r1, [r2]
000958d2  cmp.w   lr, #0
000958d6  bne.w   #0x956a0
000958da  dmb     ish
000958de  b       #0x956aa
000958e0  strex   lr, r1, [r2]
000958e4  cmp.w   lr, #0
000958e8  bne.w   #0x95616
000958ec  dmb     ish
000958f0  b       #0x95620
000958f2  strex   lr, r1, [r2]
000958f6  cmp.w   lr, #0
000958fa  bne.w   #0x95672
000958fe  dmb     ish
00095902  b       #0x9567c
00095904  strex   lr, r1, [r2]
00095908  cmp.w   lr, #0
0009590c  bne.w   #0x95644
00095910  dmb     ish
00095914  b       #0x9564e
00095916  strex   lr, r1, [r2]
0009591a  cmp.w   lr, #0
0009591e  bne.w   #0x95744
00095922  dmb     ish
00095926  b       #0x9574e
00095928  strex   lr, r1, [r2]
0009592c  cmp.w   lr, #0
00095930  bne.w   #0x95716
00095934  dmb     ish
00095938  b       #0x95720
0009593a  strex   lr, r1, [r2]
0009593e  cmp.w   lr, #0
00095942  bne.w   #0x956ce
00095946  dmb     ish
0009594a  b       #0x956d8
0009594c  strex   lr, r1, [r2]
00095950  cmp.w   lr, #0
00095954  bne     #0x958b0
00095956  dmb     ish
0009595a  b       #0x958b8
0009595c  strex   lr, r1, [r2]
00095960  cmp.w   lr, #0
00095964  bne     #0x95884
00095966  dmb     ish
0009596a  b       #0x9588c
0009596c  strex   lr, r1, [r2]
00095970  cmp.w   lr, #0
00095974  bne.w   #0x95856
00095978  dmb     ish
0009597c  b       #0x95860
0009597e  strex   lr, r1, [r2]
00095982  cmp.w   lr, #0
00095986  bne.w   #0x9582a
0009598a  dmb     ish
0009598e  b       #0x95834
00095990  strex   lr, r1, [r2]
00095994  cmp.w   lr, #0
00095998  bne.w   #0x957fc
0009599c  dmb     ish
000959a0  b       #0x95806
000959a2  strex   lr, r1, [r2]
000959a6  cmp.w   lr, #0
000959aa  bne.w   #0x957ce
000959ae  dmb     ish
000959b2  b       #0x957d8
000959b4  strex   lr, r1, [r2]
000959b8  cmp.w   lr, #0
000959bc  bne.w   #0x957a0
000959c0  dmb     ish
000959c4  b       #0x957aa
000959c6  strex   lr, r1, [r2]
000959ca  cmp.w   lr, #0
000959ce  bne.w   #0x95772
000959d2  dmb     ish
000959d6  b       #0x9577c
000959d8  ldr     r3, [sp, #0xa0]
000959da  ldr     r1, [sp, #0xa4]
000959dc  cmp     r3, #1
000959de  str     r1, [sp, #0xc]
000959e0  beq.w   #0x95dbe
000959e4  cmp     r3, #2
000959e6  beq.w   #0x95c76
000959ea  cmp     r3, #3
000959ec  beq.w   #0x95ff6
000959f0  cmp     r3, #4
000959f2  beq     #0x95a62
000959f4  cmp     r3, #5
000959f6  beq.w   #0x95de8
000959fa  cmp     r3, #6
000959fc  beq.w   #0x95dd2
00095a00  cmp     r3, #7
00095a02  beq.w   #0x95ca2
00095a06  cmp     r3, #8
00095a08  beq.w   #0x95c8c
00095a0c  cmp     r3, #9
00095a0e  beq     #0x95a78
00095a10  cmp     r3, #0xa
00095a12  beq     #0x95aa0
00095a14  cmp     r3, #0xb
00095a16  beq     #0x95aa0
00095a18  cmp     r3, #0xc
00095a1a  beq     #0x95ab6
00095a1c  cmp     r3, #0xd
00095a1e  beq.w   #0x95c24
00095a22  cmp     r3, #0xe
00095a24  beq     #0x95ab6
00095a26  cmp     r3, #0xf
00095a28  beq     #0x95af8
00095a2a  cmp     r3, #0x10
00095a2c  beq     #0x95ab6
00095a2e  cmp     r3, #0x11
00095a30  beq     #0x95ae2
00095a32  cmp     r3, #0x12
00095a34  beq     #0x95ab6
00095a36  cmp     r3, #0x13
00095a38  beq     #0x95ab6
00095a3a  cmp     r3, #0x14
00095a3c  beq     #0x95acc
00095a3e  cmp     r3, #0x15
00095a40  beq     #0x95ac0
00095a42  cmp     r3, #0x16
00095a44  beq.w   #0x95f54
00095a48  cmp     r3, #0x17
00095a4a  beq.w   #0x95f6c
00095a4e  ldr     r3, [sp, #0xf4]
00095a50  ldr     r2, [sp, #0x88]
00095a52  str     r1, [sp, #0x94]
00095a54  sub.w   r0, r3, #0xc
00095a58  cmp     r2, r0
00095a5a  bne.w   #0x95e82
00095a5e  ldr     r1, [sp, #0x94]
00095a60  str     r1, [sp, #0xc]
00095a62  ldr     r3, [sp, #0xf8]
00095a64  ldr     r4, [sp, #0x88]
00095a66  ldr     r2, [sp, #0xc]
00095a68  sub.w   r0, r3, #0xc
00095a6c  cmp     r4, r0
00095a6e  str     r2, [sp, #0x6c]
00095a70  bne.w   #0x95f16
00095a74  ldr     r1, [sp, #0x6c]
00095a76  str     r1, [sp, #0xc]
00095a78  ldr     r3, [sp, #0x10c]
00095a7a  ldr     r1, [sp, #0x88]
00095a7c  ldr     r4, [sp, #0xc]
00095a7e  sub.w   r0, r3, #0xc
00095a82  cmp     r1, r0
00095a84  str     r4, [sp, #0x70]
00095a86  bne.w   #0x95eea
00095a8a  ldr     r3, [sp, #0x110]
00095a8c  ldr     r4, [sp, #0x88]
00095a8e  ldr     r2, [sp, #0x70]
00095a90  sub.w   r0, r3, #0xc
00095a94  cmp     r4, r0
00095a96  str     r2, [sp, #0x74]
00095a98  bne.w   #0x95bea
00095a9c  ldr     r1, [sp, #0x74]
00095a9e  str     r1, [sp, #0xc]
00095aa0  ldr     r3, [sp, #0x114]
00095aa2  ldr     r4, [sp, #0x88]
00095aa4  ldr     r2, [sp, #0xc]
00095aa6  sub.w   r0, r3, #0xc
00095aaa  cmp     r4, r0
00095aac  str     r2, [sp, #0x78]
00095aae  bne.w   #0x95bbc
00095ab2  ldr     r1, [sp, #0x78]
00095ab4  str     r1, [sp, #0xc]
00095ab6  add     r0, sp, #0xd0
00095ab8  movs    r3, #0
00095aba  str     r3, [sp, #0xa0]
00095abc  bl      #0x8d4bc ; -> ZN6Mayhem11HTTPRequestD1Ev
00095ac0  ldr     r0, [sp, #0xc]
00095ac2  mov.w   r3, #-1
00095ac6  str     r3, [sp, #0xa0]
00095ac8  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00095acc  ldr     r3, [sp, #0x124]
00095ace  ldr     r2, [sp, #0x88]
00095ad0  ldr     r1, [sp, #0xc]
00095ad2  sub.w   r0, r3, #0xc
00095ad6  cmp     r2, r0
00095ad8  str     r1, [sp, #0x48]
00095ada  bne     #0x95b0e
00095adc  ldr     r1, [sp, #0x48]
00095ade  str     r1, [sp, #0xc]
00095ae0  b       #0x95ac0
00095ae2  ldr     r3, [sp, #0x120]
00095ae4  ldr     r2, [sp, #0x88]
00095ae6  ldr     r1, [sp, #0xc]
00095ae8  sub.w   r0, r3, #0xc
00095aec  cmp     r2, r0
00095aee  str     r1, [sp, #0x4c]
00095af0  bne     #0x95b38
00095af2  ldr     r1, [sp, #0x4c]
00095af4  str     r1, [sp, #0xc]
00095af6  b       #0x95ab6
00095af8  ldr     r3, [sp, #0x11c]
00095afa  ldr     r4, [sp, #0x88]
00095afc  ldr     r2, [sp, #0xc]
00095afe  sub.w   r0, r3, #0xc
00095b02  cmp     r4, r0
00095b04  str     r2, [sp, #0x50]
00095b06  bne     #0x95b62
00095b08  ldr     r1, [sp, #0x50]
00095b0a  str     r1, [sp, #0xc]
00095b0c  b       #0x95ab6
00095b0e  subs    r2, r3, #4
00095b10  ldr     r3, [r3, #-0x4]
00095b14  subs    r1, r3, #1
00095b16  dmb     ish
00095b1a  mov     ip, r3
00095b1c  ldrex   r4, [r2]
00095b20  cmp     r4, r3
00095b22  beq     #0x95b9e
00095b24  cmp     r4, ip
00095b26  mov     r3, r4
00095b28  bne     #0x95b14
00095b2a  cmp     r4, #0
00095b2c  bgt     #0x95adc
00095b2e  add     r1, sp, #0x14c
00095b30  adds    r1, #1
00095b32  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095b36  b       #0x95adc
00095b38  subs    r2, r3, #4
00095b3a  ldr     r3, [r3, #-0x4]
00095b3e  subs    r1, r3, #1
00095b40  dmb     ish
00095b44  mov     ip, r3
00095b46  ldrex   r4, [r2]
00095b4a  cmp     r4, r3
00095b4c  beq     #0x95b8e
00095b4e  cmp     r4, ip
00095b50  mov     r3, r4
00095b52  bne     #0x95b3e
00095b54  cmp     r4, #0
00095b56  bgt     #0x95af2
00095b58  add     r1, sp, #0x148
00095b5a  adds    r1, #3
00095b5c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095b60  b       #0x95af2
00095b62  subs    r2, r3, #4
00095b64  ldr     r3, [r3, #-0x4]
00095b68  subs    r1, r3, #1
00095b6a  dmb     ish
00095b6e  mov     ip, r3
00095b70  ldrex   lr, [r2]
00095b74  cmp     lr, r3
00095b76  beq     #0x95bae
00095b78  cmp     lr, ip
00095b7a  mov     r3, lr
00095b7c  bne     #0x95b68
00095b7e  cmp.w   lr, #0
00095b82  bgt     #0x95b08
00095b84  add     r1, sp, #0x148
00095b86  adds    r1, #1
00095b88  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095b8c  b       #0x95b08
00095b8e  strex   lr, r1, [r2]
00095b92  cmp.w   lr, #0
00095b96  bne     #0x95b46
00095b98  dmb     ish
00095b9c  b       #0x95b4e
00095b9e  strex   lr, r1, [r2]
00095ba2  cmp.w   lr, #0
00095ba6  bne     #0x95b1c
00095ba8  dmb     ish
00095bac  b       #0x95b24
00095bae  strex   r4, r1, [r2]
00095bb2  cmp     r4, #0
00095bb4  bne     #0x95b70
00095bb6  dmb     ish
00095bba  b       #0x95b78
00095bbc  subs    r2, r3, #4
00095bbe  ldr     r3, [r3, #-0x4]
00095bc2  subs    r1, r3, #1
00095bc4  dmb     ish
00095bc8  mov     ip, r3
00095bca  ldrex   lr, [r2]
00095bce  cmp     lr, r3
00095bd0  beq     #0x95c16
00095bd2  cmp     lr, ip
00095bd4  mov     r3, lr
00095bd6  bne     #0x95bc2
00095bd8  cmp.w   lr, #0
00095bdc  bgt.w   #0x95ab2
00095be0  add.w   r1, sp, #0x132
00095be4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095be8  b       #0x95ab2
00095bea  subs    r2, r3, #4
00095bec  ldr     r3, [r3, #-0x4]
00095bf0  subs    r1, r3, #1
00095bf2  dmb     ish
00095bf6  mov     ip, r3
00095bf8  ldrex   lr, [r2]
00095bfc  cmp     lr, r3
00095bfe  beq     #0x95c3a
00095c00  cmp     lr, ip
00095c02  mov     r3, lr
00095c04  bne     #0x95bf0
00095c06  cmp.w   lr, #0
00095c0a  bgt.w   #0x95a9c
00095c0e  add     r1, sp, #0x134
00095c10  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095c14  b       #0x95a9c
00095c16  strex   r4, r1, [r2]
00095c1a  cmp     r4, #0
00095c1c  bne     #0x95bca
00095c1e  dmb     ish
00095c22  b       #0x95bd2
00095c24  ldr     r3, [sp, #0x118]
00095c26  ldr     r4, [sp, #0x88]
00095c28  ldr     r2, [sp, #0xc]
00095c2a  sub.w   r0, r3, #0xc
00095c2e  cmp     r4, r0
00095c30  str     r2, [sp, #0x54]
00095c32  bne     #0x95c48
00095c34  ldr     r1, [sp, #0x54]
00095c36  str     r1, [sp, #0xc]
00095c38  b       #0x95ab6
00095c3a  strex   r4, r1, [r2]
00095c3e  cmp     r4, #0
00095c40  bne     #0x95bf8
00095c42  dmb     ish
00095c46  b       #0x95c00
00095c48  subs    r2, r3, #4
00095c4a  ldr     r3, [r3, #-0x4]
00095c4e  subs    r1, r3, #1
00095c50  dmb     ish
00095c54  mov     ip, r3
00095c56  ldrex   lr, [r2]
00095c5a  cmp     lr, r3
00095c5c  beq.w   #0x95e64
00095c60  cmp     lr, ip
00095c62  mov     r3, lr
00095c64  bne     #0x95c4e
00095c66  cmp.w   lr, #0
00095c6a  bgt     #0x95c34
00095c6c  add     r1, sp, #0x144
00095c6e  adds    r1, #3
00095c70  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095c74  b       #0x95c34
00095c76  ldr     r3, [sp, #0x104]
00095c78  ldr     r4, [sp, #0x88]
00095c7a  ldr     r2, [sp, #0xc]
00095c7c  sub.w   r0, r3, #0xc
00095c80  cmp     r4, r0
00095c82  str     r2, [sp, #0x8c]
00095c84  bne.w   #0x96038
00095c88  ldr     r1, [sp, #0x8c]
00095c8a  str     r1, [sp, #0xc]
00095c8c  ldr     r3, [sp, #0x108]
00095c8e  ldr     r4, [sp, #0x88]
00095c90  ldr     r2, [sp, #0xc]
00095c92  sub.w   r0, r3, #0xc
00095c96  cmp     r4, r0
00095c98  str     r2, [sp, #0x5c]
00095c9a  bne     #0x95cb8
00095c9c  ldr     r1, [sp, #0x5c]
00095c9e  str     r1, [sp, #0xc]
00095ca0  b       #0x95a78
00095ca2  ldr     r3, [sp, #0xc]
00095ca4  ldr     r4, [sp, #0x88]
00095ca6  str     r3, [sp, #0x58]
00095ca8  ldr     r3, [sp, #0x104]
00095caa  sub.w   r0, r3, #0xc
00095cae  cmp     r4, r0
00095cb0  bne     #0x95d78
00095cb2  ldr     r1, [sp, #0x58]
00095cb4  str     r1, [sp, #0xc]
00095cb6  b       #0x95c8c
00095cb8  subs    r2, r3, #4
00095cba  ldr     r3, [r3, #-0x4]
00095cbe  subs    r1, r3, #1
00095cc0  dmb     ish
00095cc4  mov     ip, r3
00095cc6  ldrex   lr, [r2]
00095cca  cmp     lr, r3
00095ccc  beq     #0x95da2
00095cce  cmp     lr, ip
00095cd0  mov     r3, lr
00095cd2  bne     #0x95cbe
00095cd4  cmp.w   lr, #0
00095cd8  bgt     #0x95c9c
00095cda  add.w   r1, sp, #0x142
00095cde  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095ce2  b       #0x95c9c
00095ce4  b       #0x96234
00095ce6  movs    r5, r0
00095ce8  str     r3, [sp, #0xb0]
00095cea  movs    r5, r0
00095cec  lsrs    r6, r5, #0x20
00095cee  movs    r0, r0
00095cf0  ldrh    r4, [r3, #0xc]
00095cf2  movs    r6, r0
00095cf4  adr     r1, #0x388
00095cf6  movs    r6, r1
00095cf8  ldrb    r2, [r2, #3]
00095cfa  movs    r6, r0
00095cfc  b       #0x95fa8
00095cfe  movs    r5, r0
00095d00  ldrb    r4, [r5, #0x14]
00095d02  movs    r6, r0
00095d04  ldrb    r2, [r2, #0x14]
00095d06  movs    r6, r0
00095d08  lsrs    r0, r0, #0x12
00095d0a  movs    r6, r1
00095d0c  lsrs    r2, r3, #0x11
00095d0e  movs    r6, r1
00095d10  lsrs    r0, r6, #0x10
00095d12  movs    r6, r1
00095d14  adr     r0, #0x1d8
00095d16  movs    r6, r1
00095d18  str     r2, [sp, #0x118]
00095d1a  movs    r6, r1
00095d1c  lsrs    r4, r6, #0xd
00095d1e  movs    r6, r1
00095d20  lsrs    r4, r4, #0xd
00095d22  movs    r6, r1
00095d24  lsrs    r6, r5, #0xc
00095d26  movs    r6, r1
00095d28  lsrs    r0, r3, #0xc
00095d2a  movs    r6, r1
00095d2c  lsrs    r2, r4, #0xb
00095d2e  movs    r6, r1
00095d30  lsrs    r4, r1, #0xb
00095d32  movs    r6, r1
00095d34  strb    r4, [r5, #0x12]
00095d36  movs    r6, r0
00095d38  strh    r6, [r4, #0x38]
00095d3a  movs    r6, r0
00095d3c  ldrb    r2, [r7, #5]
00095d3e  movs    r6, r0
00095d40  strb    r2, [r4, #0x15]
00095d42  movs    r6, r0
00095d44  ldrb    r0, [r3, #0xa]
00095d46  movs    r6, r0
00095d48  strb    r4, [r3, #0x1d]
00095d4a  movs    r6, r0
00095d4c  ldrb    r6, [r6, #4]
00095d4e  movs    r6, r0
00095d50  ldrb    r4, [r2, #9]
00095d52  movs    r6, r0
00095d54  ldrb    r4, [r3, #7]
00095d56  movs    r6, r0
00095d58  strb    r4, [r0, #0x14]
00095d5a  movs    r6, r0
00095d5c  ldr     r2, [sp, #0x248]
00095d5e  movs    r6, r1
00095d60  lsls    r6, r2, #0xc
00095d62  movs    r5, r0
00095d64  lsls    r6, r3, #0x11
00095d66  movs    r6, r1
00095d68  lsls    r0, r2, #0x13
00095d6a  movs    r6, r1
00095d6c  lsls    r6, r2, #8
00095d6e  movs    r5, r0
00095d70  lsls    r6, r3, #0xd
00095d72  movs    r6, r1
00095d74  lsls    r0, r2, #0xf
00095d76  movs    r6, r1
00095d78  subs    r2, r3, #4
00095d7a  ldr     r3, [r3, #-0x4]
00095d7e  subs    r1, r3, #1
00095d80  dmb     ish
00095d84  mov     ip, r3
00095d86  ldrex   lr, [r2]
00095d8a  cmp     lr, r3
00095d8c  beq     #0x95db0
00095d8e  cmp     lr, ip
00095d90  mov     r3, lr
00095d92  bne     #0x95d7e
00095d94  cmp.w   lr, #0
00095d98  bgt     #0x95cb2
00095d9a  add     r1, sp, #0x144
00095d9c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095da0  b       #0x95cb2
00095da2  strex   r4, r1, [r2]
00095da6  cmp     r4, #0
00095da8  bne     #0x95cc6
00095daa  dmb     ish
00095dae  b       #0x95cce
00095db0  strex   r4, r1, [r2]
00095db4  cmp     r4, #0
00095db6  bne     #0x95d86
00095db8  dmb     ish
00095dbc  b       #0x95d8e
00095dbe  ldr     r3, [sp, #0xfc]
00095dc0  ldr     r2, [sp, #0x88]
00095dc2  ldr     r1, [sp, #0xc]
00095dc4  sub.w   r0, r3, #0xc
00095dc8  cmp     r2, r0
00095dca  str     r1, [sp, #0x90]
00095dcc  bne     #0x95eae
00095dce  ldr     r1, [sp, #0x90]
00095dd0  str     r1, [sp, #0xc]
00095dd2  ldr     r3, [sp, #0x100]
00095dd4  ldr     r4, [sp, #0x88]
00095dd6  ldr     r2, [sp, #0xc]
00095dd8  sub.w   r0, r3, #0xc
00095ddc  cmp     r4, r0
00095dde  str     r2, [sp, #0x64]
00095de0  bne     #0x95dfe
00095de2  ldr     r1, [sp, #0x64]
00095de4  str     r1, [sp, #0xc]
00095de6  b       #0x95a78
00095de8  ldr     r3, [sp, #0xc]
00095dea  ldr     r4, [sp, #0x88]
00095dec  str     r3, [sp, #0x60]
00095dee  ldr     r3, [sp, #0xfc]
00095df0  sub.w   r0, r3, #0xc
00095df4  cmp     r4, r0
00095df6  bne     #0x95e2a
00095df8  ldr     r1, [sp, #0x60]
00095dfa  str     r1, [sp, #0xc]
00095dfc  b       #0x95dd2
00095dfe  subs    r2, r3, #4
00095e00  ldr     r3, [r3, #-0x4]
00095e04  subs    r1, r3, #1
00095e06  dmb     ish
00095e0a  mov     ip, r3
00095e0c  ldrex   lr, [r2]
00095e10  cmp     lr, r3
00095e12  beq     #0x95e56
00095e14  cmp     lr, ip
00095e16  mov     r3, lr
00095e18  bne     #0x95e04
00095e1a  cmp.w   lr, #0
00095e1e  bgt     #0x95de2
00095e20  add     r1, sp, #0x13c
00095e22  adds    r1, #1
00095e24  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095e28  b       #0x95de2
00095e2a  subs    r2, r3, #4
00095e2c  ldr     r3, [r3, #-0x4]
00095e30  subs    r1, r3, #1
00095e32  dmb     ish
00095e36  mov     ip, r3
00095e38  ldrex   lr, [r2]
00095e3c  cmp     lr, r3
00095e3e  beq     #0x95e74
00095e40  cmp     lr, ip
00095e42  mov     r3, lr
00095e44  bne     #0x95e30
00095e46  cmp.w   lr, #0
00095e4a  bgt     #0x95df8
00095e4c  add     r1, sp, #0x13c
00095e4e  adds    r1, #3
00095e50  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095e54  b       #0x95df8
00095e56  strex   r4, r1, [r2]
00095e5a  cmp     r4, #0
00095e5c  bne     #0x95e0c
00095e5e  dmb     ish
00095e62  b       #0x95e14
00095e64  strex   r4, r1, [r2]
00095e68  cmp     r4, #0
00095e6a  bne.w   #0x95c56
00095e6e  dmb     ish
00095e72  b       #0x95c60
00095e74  strex   r4, r1, [r2]
00095e78  cmp     r4, #0
00095e7a  bne     #0x95e38
00095e7c  dmb     ish
00095e80  b       #0x95e40
00095e82  subs    r2, r3, #4
00095e84  ldr     r3, [r3, #-0x4]
00095e88  subs    r1, r3, #1
00095e8a  dmb     ish
00095e8e  mov     ip, r3
00095e90  ldrex   r4, [r2]
00095e94  cmp     r4, r3
00095e96  beq     #0x95eda
00095e98  cmp     r4, ip
00095e9a  mov     r3, r4
00095e9c  bne     #0x95e88
00095e9e  cmp     r4, #0
00095ea0  bgt.w   #0x95a5e
00095ea4  add     r1, sp, #0x138
00095ea6  adds    r1, #3
00095ea8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095eac  b       #0x95a5e
00095eae  subs    r2, r3, #4
00095eb0  ldr     r3, [r3, #-0x4]
00095eb4  subs    r1, r3, #1
00095eb6  dmb     ish
00095eba  mov     ip, r3
00095ebc  ldrex   r4, [r2]
00095ec0  cmp     r4, r3
00095ec2  beq.w   #0x96074
00095ec6  cmp     r4, ip
00095ec8  mov     r3, r4
00095eca  bne     #0x95eb4
00095ecc  cmp     r4, #0
00095ece  bgt.w   #0x95dce
00095ed2  add     r1, sp, #0x140
00095ed4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095ed8  b       #0x95dce
00095eda  strex   lr, r1, [r2]
00095ede  cmp.w   lr, #0
00095ee2  bne     #0x95e90
00095ee4  dmb     ish
00095ee8  b       #0x95e98
00095eea  subs    r2, r3, #4
00095eec  ldr     r3, [r3, #-0x4]
00095ef0  subs    r1, r3, #1
00095ef2  dmb     ish
00095ef6  mov     ip, r3
00095ef8  ldrex   r4, [r2]
00095efc  cmp     r4, r3
00095efe  beq     #0x95f44
00095f00  cmp     r4, ip
00095f02  mov     r3, r4
00095f04  bne     #0x95ef0
00095f06  cmp     r4, #0
00095f08  bgt.w   #0x95a8a
00095f0c  add.w   r1, sp, #0x136
00095f10  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095f14  b       #0x95a8a
00095f16  subs    r2, r3, #4
00095f18  ldr     r3, [r3, #-0x4]
00095f1c  subs    r1, r3, #1
00095f1e  dmb     ish
00095f22  mov     ip, r3
00095f24  ldrex   lr, [r2]
00095f28  cmp     lr, r3
00095f2a  beq.w   #0x96094
00095f2e  cmp     lr, ip
00095f30  mov     r3, lr
00095f32  bne     #0x95f1c
00095f34  cmp.w   lr, #0
00095f38  bgt.w   #0x95a74
00095f3c  add     r1, sp, #0x138
00095f3e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095f42  b       #0x95a74
00095f44  strex   lr, r1, [r2]
00095f48  cmp.w   lr, #0
00095f4c  bne     #0x95ef8
00095f4e  dmb     ish
00095f52  b       #0x95f00
00095f54  ldr     r3, [sp, #0xc]
00095f56  ldr     r4, [sp, #0x84]
00095f58  str     r3, [sp, #0x40]
00095f5a  ldr     r3, [pc, #0x158]
00095f5c  sub.w   r0, r4, #0xc
00095f60  add     r3, pc ; -> 0x000f3370  0x0
00095f62  ldr     r3, [r3]
00095f64  cmp     r0, r3
00095f66  bne     #0x95fbe
00095f68  ldr     r1, [sp, #0x40]
00095f6a  str     r1, [sp, #0xc]
00095f6c  ldr     r3, [sp, #0x7c]
00095f6e  ldr     r2, [sp, #0xc]
00095f70  sub.w   r0, r3, #0xc
00095f74  ldr     r3, [pc, #0x140]
00095f76  str     r2, [sp, #0x44]
00095f78  add     r3, pc ; -> 0x000f3370  0x0
00095f7a  ldr     r3, [r3]
00095f7c  cmp     r0, r3
00095f7e  bne     #0x95f90
00095f80  ldr     r1, [sp, #0x44]
00095f82  mov.w   r3, #-1
00095f86  str     r3, [sp, #0xa0]
00095f88  mov     r0, r1
00095f8a  str     r1, [sp, #0xc]
00095f8c  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00095f90  ldr     r4, [sp, #0x7c]
00095f92  subs    r2, r4, #4
00095f94  ldr     r3, [r4, #-0x4]
00095f98  subs    r1, r3, #1
00095f9a  dmb     ish
00095f9e  mov     ip, r3
00095fa0  ldrex   lr, [r2]
00095fa4  cmp     lr, r3
00095fa6  beq     #0x95fe8
00095fa8  cmp     lr, ip
00095faa  mov     r3, lr
00095fac  bne     #0x95f98
00095fae  cmp.w   lr, #0
00095fb2  bgt     #0x95f80
00095fb4  add     r1, sp, #0x14c
00095fb6  adds    r1, #3
00095fb8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095fbc  b       #0x95f80
00095fbe  ldr     r3, [r4, #-0x4]
00095fc2  subs    r2, r4, #4
00095fc4  subs    r1, r3, #1
00095fc6  dmb     ish
00095fca  mov     ip, r3
00095fcc  ldrex   lr, [r2]
00095fd0  cmp     lr, r3
00095fd2  beq     #0x96086
00095fd4  cmp     lr, ip
00095fd6  mov     r3, lr
00095fd8  bne     #0x95fc4
00095fda  cmp.w   lr, #0
00095fde  bgt     #0x95f68
00095fe0  add     r1, sp, #0x150
00095fe2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095fe6  b       #0x95f68
00095fe8  strex   r4, r1, [r2]
00095fec  cmp     r4, #0
00095fee  bne     #0x95fa0
00095ff0  dmb     ish
00095ff4  b       #0x95fa8
00095ff6  ldr     r3, [sp, #0xc]
00095ff8  ldr     r4, [sp, #0x88]
00095ffa  str     r3, [sp, #0x68]
00095ffc  ldr     r3, [sp, #0xf4]
00095ffe  sub.w   r0, r3, #0xc
00096002  cmp     r4, r0
00096004  bne     #0x9600c
00096006  ldr     r1, [sp, #0x68]
00096008  str     r1, [sp, #0xc]
0009600a  b       #0x95a62
0009600c  subs    r2, r3, #4
0009600e  ldr     r3, [r3, #-0x4]
00096012  subs    r1, r3, #1
00096014  dmb     ish
00096018  mov     ip, r3
0009601a  ldrex   lr, [r2]
0009601e  cmp     lr, r3
00096020  beq     #0x96066
00096022  cmp     lr, ip
00096024  mov     r3, lr
00096026  bne     #0x96012
00096028  cmp.w   lr, #0
0009602c  bgt     #0x96006
0009602e  add.w   r1, sp, #0x13a
00096032  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00096036  b       #0x96006
00096038  subs    r2, r3, #4
0009603a  ldr     r3, [r3, #-0x4]
0009603e  subs    r1, r3, #1
00096040  dmb     ish
00096044  mov     ip, r3
00096046  ldrex   lr, [r2]
0009604a  cmp     lr, r3
0009604c  beq     #0x960a4
0009604e  cmp     lr, ip
00096050  mov     r3, lr
00096052  bne     #0x9603e
00096054  cmp.w   lr, #0
00096058  bgt.w   #0x95c88
0009605c  add     r1, sp, #0x144
0009605e  adds    r1, #1
00096060  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00096064  b       #0x95c88
00096066  strex   r4, r1, [r2]
0009606a  cmp     r4, #0
0009606c  bne     #0x9601a
0009606e  dmb     ish
00096072  b       #0x96022
00096074  strex   lr, r1, [r2]
00096078  cmp.w   lr, #0
0009607c  bne.w   #0x95ebc
00096080  dmb     ish
00096084  b       #0x95ec6
00096086  strex   r4, r1, [r2]
0009608a  cmp     r4, #0
0009608c  bne     #0x95fcc
0009608e  dmb     ish
00096092  b       #0x95fd4
00096094  strex   r4, r1, [r2]
00096098  cmp     r4, #0
0009609a  bne.w   #0x95f24
0009609e  dmb     ish
000960a2  b       #0x95f2e
000960a4  strex   r4, r1, [r2]
000960a8  cmp     r4, #0
000960aa  bne     #0x96046
000960ac  dmb     ish
000960b0  b       #0x9604e
000960b2  nop     
000960b4  bmi     #0x960d0
000960b6  movs    r5, r0
000960b8  blo     #0x960a4
000960ba  movs    r5, r0
