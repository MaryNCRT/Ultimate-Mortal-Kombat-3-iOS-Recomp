========================================================================
ZN6Mayhem5Token3runEv  0x0008fe70  2704 bytes   Mayhem.mm
========================================================================

0008fe70  push    {r4, r5, r6, r7, lr}
0008fe72  add     r7, sp, #0xc
0008fe74  push.w  {r8, sl, fp}
0008fe78  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008fe7c  sub     sp, #0x144
0008fe7e  ldr.w   r3, [pc, #0x9e0]
0008fe82  str     r0, [sp, #0x10]
0008fe84  add     r0, sp, #0xa0
0008fe86  add     r3, pc ; -> 0x000f3438  0x0
0008fe88  str     r7, [sp, #0xc0]
0008fe8a  ldr     r3, [r3]
0008fe8c  str.w   sp, [sp, #0xc8]
0008fe90  str     r3, [sp, #0xb8]
0008fe92  ldr.w   r3, [pc, #0x9d0]
0008fe96  add     r3, pc ; -> 0x000ee3cc  GCC_except_table72
0008fe98  str     r3, [sp, #0xbc]
0008fe9a  ldr.w   r3, [pc, #0x9cc]
0008fe9e  add     r3, pc ; -> 0x00090530  
0008fea0  orr     r3, r3, #1
0008fea4  str     r3, [sp, #0xc4]
0008fea6  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008feaa  ldr.w   r3, [pc, #0x9c0]
0008feae  ldr.w   r1, [pc, #0x9c0]
0008feb2  add     r0, sp, #0x128
0008feb4  add     r3, pc ; -> 0x000fdb5c  
0008feb6  add     r1, pc ; -> 0x0017f0b4  
0008feb8  ldr     r3, [r3]
0008feba  str     r1, [sp, #0xc]
0008febc  str     r3, [sp, #0x14]
0008febe  ldr.w   r3, [pc, #0x9b4]
0008fec2  add     r3, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
0008fec4  ldr     r3, [r3]
0008fec6  str     r3, [sp, #0x18]
0008fec8  mov.w   r3, #-1
0008fecc  str     r3, [sp, #0xa4]
0008fece  bl      #0x8bb28 ; -> ZN6Mayhem12getMayhemURLEv
0008fed2  ldr     r2, [sp, #0x128]
0008fed4  ldr     r3, [sp, #0x10]
0008fed6  add     r0, sp, #0x124
0008fed8  str     r2, [sp, #0x80]
0008feda  ldr     r3, [r3, #0x50]
0008fedc  str     r3, [sp, #0x84]
0008fede  movs    r3, #0xd
0008fee0  str     r3, [sp, #0xa4]
0008fee2  bl      #0x8be80 ; -> ZN6Mayhem17getMayhemGameNameEv
0008fee6  ldr     r4, [sp, #0x124]
0008fee8  ldr     r1, [sp, #0x84]
0008feea  movs    r3, #0xc
0008feec  ldr     r0, [sp, #0x14]
0008feee  str     r3, [sp, #0xa4]
0008fef0  str     r1, [sp]
0008fef2  str     r4, [sp, #0x88]
0008fef4  str     r4, [sp, #4]
0008fef6  ldr     r1, [sp, #0x18]
0008fef8  ldr     r2, [sp, #0xc]
0008fefa  ldr     r3, [sp, #0x80]
0008fefc  blx     #0xddbfc ; -> objc_msgSend
0008ff00  ldr.w   r3, [pc, #0x974]
0008ff04  str     r0, [sp, #0x1c]
0008ff06  sub.w   r0, r4, #0xc
0008ff0a  add     r3, pc ; -> 0x000f3370  0x0
0008ff0c  ldr     r3, [r3]
0008ff0e  cmp     r0, r3
0008ff10  str     r3, [sp, #0x8c]
0008ff12  bne.w   #0x903e6
0008ff16  ldr     r1, [sp, #0x80]
0008ff18  ldr     r2, [sp, #0x8c]
0008ff1a  sub.w   r0, r1, #0xc
0008ff1e  cmp     r2, r0
0008ff20  bne.w   #0x903b6
0008ff24  ldr.w   r3, [pc, #0x954]
0008ff28  ldr     r0, [sp, #0x14]
0008ff2a  add     r3, pc ; -> 0x000fcf68  
0008ff2c  ldr     r3, [r3]
0008ff2e  str     r3, [sp, #0x20]
0008ff30  ldr.w   r3, [pc, #0x94c]
0008ff34  add     r3, pc ; -> 0x000fcf58  
0008ff36  ldr     r3, [r3]
0008ff38  str     r3, [sp, #0x24]
0008ff3a  ldr     r1, [sp, #0x24]
0008ff3c  mov.w   r3, #-1
0008ff40  str     r3, [sp, #0xa4]
0008ff42  blx     #0xddbfc ; -> objc_msgSend
0008ff46  ldr     r1, [sp, #0x20]
0008ff48  mov     r2, r0
0008ff4a  ldr     r0, [sp, #0x1c]
0008ff4c  blx     #0xddbfc ; -> objc_msgSend
0008ff50  add     r2, sp, #0x140
0008ff52  movs    r3, #0xb
0008ff54  adds    r2, #3
0008ff56  str     r3, [sp, #0xa4]
0008ff58  mov     r1, r0
0008ff5a  add     r0, sp, #0x120
0008ff5c  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0008ff60  movs    r3, #0xa
0008ff62  add     r0, sp, #0xd4
0008ff64  str     r3, [sp, #0xa4]
0008ff66  add     r1, sp, #0x120
0008ff68  bl      #0x8b474 ; -> ZN6Mayhem11HTTPRequestC1ERKSs
0008ff6c  ldr     r3, [sp, #0x120]
0008ff6e  ldr     r2, [sp, #0x8c]
0008ff70  sub.w   r0, r3, #0xc
0008ff74  cmp     r2, r0
0008ff76  bne.w   #0x90388
0008ff7a  ldr.w   r1, [pc, #0x908]
0008ff7e  movs    r3, #9
0008ff80  add     r0, sp, #0x11c
0008ff82  add     r1, pc ; -> 0x00175df0  'GET'
0008ff84  str     r3, [sp, #0xa4]
0008ff86  add.w   r2, sp, #0x142
0008ff8a  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0008ff8e  movs    r3, #8
0008ff90  add     r0, sp, #0xd4
0008ff92  str     r3, [sp, #0xa4]
0008ff94  add     r1, sp, #0x11c
0008ff96  bl      #0x8b3e8 ; -> ZN6Mayhem11HTTPRequest9SetMethodERKSs
0008ff9a  ldr     r3, [sp, #0x11c]
0008ff9c  ldr     r2, [sp, #0x8c]
0008ff9e  sub.w   r0, r3, #0xc
0008ffa2  cmp     r2, r0
0008ffa4  bne.w   #0x9035a
0008ffa8  ldr     r1, [sp, #0x8c]
0008ffaa  ldr.w   r0, [pc, #0x8dc]
0008ffae  movs    r2, #7
0008ffb0  add.w   r3, r1, #0xc
0008ffb4  ldr.w   r1, [pc, #0x8d4]
0008ffb8  add     r0, pc ; -> 0x000fdb50  
0008ffba  str     r3, [sp, #0x118]
0008ffbc  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
0008ffbe  str     r3, [sp, #0x114]
0008ffc0  ldr     r0, [r0]
0008ffc2  ldr     r1, [r1]
0008ffc4  str     r2, [sp, #0xa4]
0008ffc6  blx     #0xddbfc ; -> objc_msgSend
0008ffca  ldr.w   r1, [pc, #0x8c4]
0008ffce  movs    r3, #7
0008ffd0  str     r3, [sp, #0xa4]
0008ffd2  add     r1, pc ; -> 0x000fcfa8  'AU\x0e'
0008ffd4  ldr     r1, [r1]
0008ffd6  blx     #0xddbfc ; -> objc_msgSend
0008ffda  str     r0, [sp, #0x28]
0008ffdc  ldr     r1, [sp, #0x24]
0008ffde  ldr     r0, [sp, #0x14]
0008ffe0  blx     #0xddbfc ; -> objc_msgSend
0008ffe4  mov     r2, r0
0008ffe6  ldr     r1, [sp, #0x20]
0008ffe8  ldr     r0, [sp, #0x28]
0008ffea  blx     #0xddbfc ; -> objc_msgSend
0008ffee  add     r2, sp, #0x140
0008fff0  mov     r1, r0
0008fff2  movs    r4, #6
0008fff4  add     r0, sp, #0x110
0008fff6  str     r4, [sp, #0xa4]
0008fff8  adds    r2, #1
0008fffa  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0008fffe  ldr     r2, [sp, #0x10]
00090000  ldr     r1, [sp, #0x10]
00090002  adds    r1, #0x54
00090004  str     r1, [sp, #0x90]
00090006  ldr     r3, [r2, #0x54]
00090008  ldr     r3, [r3, #-0xc]
0009000c  cmp     r3, #0
0009000e  beq.w   #0x901bc
00090012  ldr.w   r1, [pc, #0x880]
00090016  movs    r3, #5
00090018  add     r0, sp, #0x118
0009001a  add     r1, pc ; -> 0x000e4d98  'facebook'
0009001c  str     r3, [sp, #0xa4]
0009001e  movs    r2, #8
00090020  blx     #0xdd50c ; -> ZNSs6assignEPKcm
00090024  add     r0, sp, #0x114
00090026  ldr     r1, [sp, #0x90]
00090028  blx     #0xdd518 ; -> ZNSs6assignERKSs
0009002c  ldr.w   r1, [pc, #0x868]
00090030  movs    r3, #4
00090032  add     r0, sp, #0x10c
00090034  add     r1, pc ; -> 0x00175df4  'mh_auth_method'
00090036  str     r3, [sp, #0xa4]
00090038  add     r2, sp, #0x140
0009003a  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009003e  movs    r3, #3
00090040  add     r0, sp, #0xd4
00090042  str     r3, [sp, #0xa4]
00090044  add     r1, sp, #0x10c
00090046  add     r2, sp, #0x118
00090048  bl      #0x8f0ac ; -> ZN6Mayhem11HTTPRequest9AddHeaderERKSsS2_
0009004c  ldr     r3, [sp, #0x10c]
0009004e  ldr     r2, [sp, #0x8c]
00090050  sub.w   r0, r3, #0xc
00090054  cmp     r2, r0
00090056  bne.w   #0x9032c
0009005a  ldr.w   r1, [pc, #0x840]
0009005e  add     r2, sp, #0x13c
00090060  movs    r3, #2
00090062  add     r1, pc ; -> 0x00175e04  'mh_auth_params'
00090064  str     r3, [sp, #0xa4]
00090066  add     r0, sp, #0x108
00090068  adds    r2, #3
0009006a  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009006e  movs    r3, #1
00090070  add     r0, sp, #0xd4
00090072  str     r3, [sp, #0xa4]
00090074  add     r1, sp, #0x108
00090076  add     r2, sp, #0x114
00090078  bl      #0x8f0ac ; -> ZN6Mayhem11HTTPRequest9AddHeaderERKSsS2_
0009007c  ldr     r3, [sp, #0x108]
0009007e  ldr     r2, [sp, #0x8c]
00090080  sub.w   r0, r3, #0xc
00090084  cmp     r2, r0
00090086  bne.w   #0x902fe
0009008a  ldr.w   r0, [pc, #0x814]
0009008e  movs    r1, #5
00090090  str     r1, [sp, #0xa4]
00090092  add     r0, pc ; -> 0x0017f0c4  
00090094  blx     #0xdd3e0 ; -> NSLog
00090098  movs    r2, #5
0009009a  add     r0, sp, #0xd4
0009009c  str     r2, [sp, #0xa4]
0009009e  bl      #0x8f6f0 ; -> ZN6Mayhem11HTTPRequest9DoRequestEv
000900a2  str     r0, [sp, #0x2c]
000900a4  ldr.w   r0, [pc, #0x7fc]
000900a8  add     r0, pc ; -> 0x0017f0d4  
000900aa  blx     #0xdd3e0 ; -> NSLog
000900ae  ldr.w   r0, [pc, #0x7f8]
000900b2  ldr.w   r1, [pc, #0x7f8]
000900b6  add     r0, pc ; -> 0x000fdc00  
000900b8  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000900ba  ldr     r0, [r0]
000900bc  ldr     r1, [r1]
000900be  blx     #0xddbfc ; -> objc_msgSend
000900c2  ldr.w   r1, [pc, #0x7ec]
000900c6  ldr     r2, [sp, #0x2c]
000900c8  add     r1, pc ; -> 0x000fce64  '\x0b=\x0e'
000900ca  ldr     r1, [r1]
000900cc  blx     #0xddbfc ; -> objc_msgSend
000900d0  ldr.w   r1, [pc, #0x7e0]
000900d4  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000900d6  ldr     r1, [r1]
000900d8  blx     #0xddbfc ; -> objc_msgSend
000900dc  ldr     r3, [sp, #0x10]
000900de  ldr.w   r1, [pc, #0x7d8]
000900e2  str     r0, [sp, #0x30]
000900e4  ldr     r3, [r3, #0x10]
000900e6  add     r1, pc ; -> 0x000fcfa4  
000900e8  ldr     r1, [r1]
000900ea  str     r3, [sp, #0x34]
000900ec  mov     r0, r3
000900ee  blx     #0xddbfc ; -> objc_msgSend
000900f2  ldr.w   r1, [pc, #0x7c8]
000900f6  ldr     r0, [sp, #0x30]
000900f8  ldr     r2, [sp, #0x34]
000900fa  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
000900fc  ldr     r1, [r1]
000900fe  blx     #0xddbfc ; -> objc_msgSend
00090102  ldr.w   r1, [pc, #0x7bc]
00090106  ldr     r0, [sp, #0x30]
00090108  add     r1, pc ; -> 0x000fce60  '8U\x0e'
0009010a  ldr     r1, [r1]
0009010c  blx     #0xddbfc ; -> objc_msgSend
00090110  tst.w   r0, #0xff
00090114  beq     #0x90144
00090116  ldr.w   r3, [pc, #0x7ac]
0009011a  ldr     r0, [sp, #0x34]
0009011c  add     r3, pc ; -> 0x000fcf9c  
0009011e  ldr     r3, [r3]
00090120  str     r3, [sp, #0x38]
00090122  mov     r1, r3
00090124  blx     #0xddbfc ; -> objc_msgSend
00090128  ldr.w   r3, [pc, #0x79c]
0009012c  ldr.w   r2, [pc, #0x79c]
00090130  add     r3, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
00090132  add     r2, pc ; -> 0x0017f064  
00090134  ldr     r3, [r3]
00090136  str     r3, [sp, #0x3c]
00090138  mov     r1, r3
0009013a  blx     #0xddbfc ; -> objc_msgSend
0009013e  str     r0, [sp, #0x40]
00090140  cmp     r0, #0
00090142  beq     #0x901d8
00090144  ldr     r1, [sp, #0x10]
00090146  movs    r3, #5
00090148  ldr     r0, [sp, #0x34]
0009014a  str     r3, [sp, #0xa4]
0009014c  str     r1, [sp, #0x9c]
0009014e  ldr.w   r1, [pc, #0x780]
00090152  add     r1, pc ; -> 0x000fcf9c  
00090154  ldr     r1, [r1]
00090156  blx     #0xddbfc ; -> objc_msgSend
0009015a  mov     r1, r0
0009015c  movs    r3, #5
0009015e  ldr     r0, [sp, #0x9c]
00090160  str     r3, [sp, #0xa4]
00090162  bl      #0x8b870 ; -> ZN6Mayhem7Request11HandleErrorEPv
00090166  ldr     r0, [sp, #0x10]
00090168  movs    r1, #2
0009016a  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
0009016e  ldr     r3, [sp, #0x110]
00090170  ldr     r2, [sp, #0x8c]
00090172  sub.w   r0, r3, #0xc
00090176  cmp     r2, r0
00090178  bne.w   #0x9046c
0009017c  ldr     r3, [sp, #0x114]
0009017e  ldr     r1, [sp, #0x8c]
00090180  sub.w   r0, r3, #0xc
00090184  cmp     r1, r0
00090186  bne.w   #0x9043e
0009018a  ldr     r3, [sp, #0x118]
0009018c  ldr     r1, [sp, #0x8c]
0009018e  sub.w   r0, r3, #0xc
00090192  cmp     r1, r0
00090194  bne.w   #0x90412
00090198  add     r0, sp, #0xd4
0009019a  mov.w   r3, #-1
0009019e  str     r3, [sp, #0xa4]
000901a0  bl      #0x8d4bc ; -> ZN6Mayhem11HTTPRequestD1Ev
000901a4  add     r0, sp, #0xa0
000901a6  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
000901aa  sub.w   sp, r7, #0x58
000901ae  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
000901b2  sub.w   sp, r7, #0x18
000901b6  pop.w   {r8, sl, fp}
000901ba  pop     {r4, r5, r6, r7, pc}
000901bc  ldr.w   r1, [pc, #0x714]
000901c0  movs    r3, #5
000901c2  add     r0, sp, #0x118
000901c4  add     r1, pc ; -> 0x000e4da4  'iphone'
000901c6  str     r3, [sp, #0xa4]
000901c8  movs    r2, #6
000901ca  blx     #0xdd50c ; -> ZNSs6assignEPKcm
000901ce  add     r0, sp, #0x114
000901d0  add     r1, sp, #0x110
000901d2  blx     #0xdd518 ; -> ZNSs6assignERKSs
000901d6  b       #0x9002c
000901d8  ldr     r0, [sp, #0x34]
000901da  ldr     r1, [sp, #0x38]
000901dc  blx     #0xddbfc ; -> objc_msgSend
000901e0  ldr.w   r2, [pc, #0x6f4]
000901e4  ldr     r1, [sp, #0x3c]
000901e6  add     r2, pc ; -> 0x0017f0e4  
000901e8  blx     #0xddbfc ; -> objc_msgSend
000901ec  ldr.w   r3, [pc, #0x6ec]
000901f0  str     r0, [sp, #0x44]
000901f2  ldr     r2, [sp, #0x40]
000901f4  add     r3, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000901f6  ldr     r3, [r3]
000901f8  str     r3, [sp, #0x48]
000901fa  mov     r1, r3
000901fc  blx     #0xddbfc ; -> objc_msgSend
00090200  ldr.w   r3, [pc, #0x6dc]
00090204  add     r3, pc ; -> 0x000fcfa0  
00090206  ldr     r3, [r3]
00090208  str     r3, [sp, #0x4c]
0009020a  mov     r1, r3
0009020c  blx     #0xddbfc ; -> objc_msgSend
00090210  ldr.w   r2, [pc, #0x6d0]
00090214  ldr     r1, [sp, #0x3c]
00090216  add     r2, pc ; -> 0x0017f0f4  
00090218  blx     #0xddbfc ; -> objc_msgSend
0009021c  ldr     r1, [sp, #0x48]
0009021e  ldr     r2, [sp, #0x40]
00090220  blx     #0xddbfc ; -> objc_msgSend
00090224  ldr.w   r3, [pc, #0x6c0]
00090228  add     r3, pc ; -> 0x000fcc28  'tS\x0e'
0009022a  ldr     r3, [r3]
0009022c  str     r3, [sp, #0x50]
0009022e  mov     r1, r3
00090230  blx     #0xddbfc ; -> objc_msgSend
00090234  str     r0, [sp, #0x54]
00090236  ldr     r1, [sp, #0x48]
00090238  ldr     r0, [sp, #0x44]
0009023a  ldr     r2, [sp, #0x40]
0009023c  blx     #0xddbfc ; -> objc_msgSend
00090240  ldr     r1, [sp, #0x4c]
00090242  blx     #0xddbfc ; -> objc_msgSend
00090246  ldr.w   r2, [pc, #0x6a4]
0009024a  ldr     r1, [sp, #0x3c]
0009024c  add     r2, pc ; -> 0x0017f104  
0009024e  blx     #0xddbfc ; -> objc_msgSend
00090252  ldr     r1, [sp, #0x48]
00090254  ldr     r2, [sp, #0x40]
00090256  blx     #0xddbfc ; -> objc_msgSend
0009025a  ldr     r1, [sp, #0x50]
0009025c  blx     #0xddbfc ; -> objc_msgSend
00090260  str     r0, [sp, #0x58]
00090262  ldr     r1, [sp, #0x24]
00090264  ldr     r0, [sp, #0x14]
00090266  blx     #0xddbfc ; -> objc_msgSend
0009026a  mov     r2, r0
0009026c  ldr     r1, [sp, #0x20]
0009026e  ldr     r0, [sp, #0x54]
00090270  blx     #0xddbfc ; -> objc_msgSend
00090274  ldr     r4, [sp, #0x10]
00090276  str     r0, [sp, #0x98]
00090278  adds    r4, #0x58
0009027a  str     r4, [sp, #0x94]
0009027c  blx     #0xdde0c ; -> strlen
00090280  ldr     r1, [sp, #0x98]
00090282  mov     r2, r0
00090284  ldr     r0, [sp, #0x94]
00090286  blx     #0xdd50c ; -> ZNSs6assignEPKcm
0009028a  ldr     r0, [sp, #0x14]
0009028c  ldr     r1, [sp, #0x24]
0009028e  blx     #0xddbfc ; -> objc_msgSend
00090292  mov     r2, r0
00090294  ldr     r1, [sp, #0x20]
00090296  ldr     r0, [sp, #0x58]
00090298  blx     #0xddbfc ; -> objc_msgSend
0009029c  ldr     r1, [sp, #0x40]
0009029e  add     r3, sp, #0xfc
000902a0  add     r2, sp, #0x104
000902a2  str     r3, [sp]
000902a4  str     r1, [sp, #0xf8]
000902a6  str     r1, [sp, #0xfc]
000902a8  str     r1, [sp, #0x100]
000902aa  str     r1, [sp, #0x104]
000902ac  ldr.w   r1, [pc, #0x640]
000902b0  add     r3, sp, #0xf8
000902b2  str     r3, [sp, #4]
000902b4  add     r1, pc ; -> 0x00175e14  '%d:%d:%d:%d'
000902b6  add     r3, sp, #0x100
000902b8  blx     #0xdddc4 ; -> sscanf
000902bc  ldr     r3, [sp, #0xfc]
000902be  lsls    r2, r3, #2
000902c0  lsls    r3, r3, #6
000902c2  rsb     r1, r2, r3
000902c6  ldr     r3, [sp, #0x100]
000902c8  lsls    r2, r3, #4
000902ca  lsls    r3, r3, #8
000902cc  subs    r3, r3, r2
000902ce  lsls    r2, r3, #4
000902d0  rsb     r3, r3, r2
000902d4  ldr     r2, [sp, #0xf8]
000902d6  add     r3, r1
000902d8  add.w   r1, r3, r2
000902dc  ldr     r2, [sp, #0x104]
000902de  ldr.w   r3, [pc, #0x614]
000902e2  mla     r3, r2, r3, r1
000902e6  ldr     r2, [sp, #0x10]
000902e8  str     r3, [r2, #0x60]
000902ea  ldr     r0, [sp, #0x40]
000902ec  blx     #0xdde3c ; -> time
000902f0  ldr     r3, [sp, #0x10]
000902f2  movs    r1, #1
000902f4  str     r0, [r3, #0x5c]
000902f6  ldr     r0, [sp, #0x10]
000902f8  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
000902fc  b       #0x9016e
000902fe  subs    r2, r3, #4
00090300  ldr     r3, [r3, #-0x4]
00090304  subs    r1, r3, #1
00090306  dmb     ish
0009030a  mov     ip, r3
0009030c  ldrex   r4, [r2]
00090310  cmp     r4, r3
00090312  beq.w   #0x9051e
00090316  cmp     r4, ip
00090318  mov     r3, r4
0009031a  bne     #0x90304
0009031c  cmp     r4, #0
0009031e  bgt.w   #0x9008a
00090322  add     r1, sp, #0x130
00090324  adds    r1, #3
00090326  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009032a  b       #0x9008a
0009032c  subs    r2, r3, #4
0009032e  ldr     r3, [r3, #-0x4]
00090332  subs    r1, r3, #1
00090334  dmb     ish
00090338  mov     ip, r3
0009033a  ldrex   r4, [r2]
0009033e  cmp     r4, r3
00090340  beq.w   #0x9050c
00090344  cmp     r4, ip
00090346  mov     r3, r4
00090348  bne     #0x90332
0009034a  cmp     r4, #0
0009034c  bgt.w   #0x9005a
00090350  add     r1, sp, #0x134
00090352  adds    r1, #1
00090354  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090358  b       #0x9005a
0009035a  subs    r2, r3, #4
0009035c  ldr     r3, [r3, #-0x4]
00090360  subs    r1, r3, #1
00090362  dmb     ish
00090366  mov     ip, r3
00090368  ldrex   r4, [r2]
0009036c  cmp     r4, r3
0009036e  beq.w   #0x904fa
00090372  cmp     r4, ip
00090374  mov     r3, r4
00090376  bne     #0x90360
00090378  cmp     r4, #0
0009037a  bgt.w   #0x8ffa8
0009037e  add     r1, sp, #0x134
00090380  adds    r1, #3
00090382  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090386  b       #0x8ffa8
00090388  subs    r2, r3, #4
0009038a  ldr     r3, [r3, #-0x4]
0009038e  subs    r1, r3, #1
00090390  dmb     ish
00090394  mov     ip, r3
00090396  ldrex   r4, [r2]
0009039a  cmp     r4, r3
0009039c  beq.w   #0x904e8
000903a0  cmp     r4, ip
000903a2  mov     r3, r4
000903a4  bne     #0x9038e
000903a6  cmp     r4, #0
000903a8  bgt.w   #0x8ff7a
000903ac  add     r1, sp, #0x138
000903ae  adds    r1, #1
000903b0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000903b4  b       #0x8ff7a
000903b6  ldr     r3, [sp, #0x80]
000903b8  subs    r2, r3, #4
000903ba  ldr     r3, [r3, #-0x4]
000903be  subs    r1, r3, #1
000903c0  dmb     ish
000903c4  mov     ip, r3
000903c6  ldrex   r4, [r2]
000903ca  cmp     r4, r3
000903cc  beq.w   #0x904d6
000903d0  cmp     r4, ip
000903d2  mov     r3, r4
000903d4  bne     #0x903be
000903d6  cmp     r4, #0
000903d8  bgt.w   #0x8ff24
000903dc  add     r1, sp, #0x138
000903de  adds    r1, #3
000903e0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000903e4  b       #0x8ff24
000903e6  ldr     r3, [r4, #-0x4]
000903ea  subs    r2, r4, #4
000903ec  subs    r1, r3, #1
000903ee  dmb     ish
000903f2  mov     ip, r3
000903f4  ldrex   r4, [r2]
000903f8  cmp     r4, r3
000903fa  beq     #0x904c6
000903fc  cmp     r4, ip
000903fe  mov     r3, r4
00090400  bne     #0x903ec
00090402  cmp     r4, #0
00090404  bgt.w   #0x8ff16
00090408  add.w   r1, sp, #0x13e
0009040c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090410  b       #0x8ff16
00090412  subs    r2, r3, #4
00090414  ldr     r3, [r3, #-0x4]
00090418  subs    r1, r3, #1
0009041a  dmb     ish
0009041e  mov     ip, r3
00090420  ldrex   r4, [r2]
00090424  cmp     r4, r3
00090426  beq     #0x904b6
00090428  cmp     r4, ip
0009042a  mov     r3, r4
0009042c  bne     #0x90418
0009042e  cmp     r4, #0
00090430  bgt.w   #0x90198
00090434  add     r1, sp, #0x12c
00090436  adds    r1, #1
00090438  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009043c  b       #0x90198
0009043e  subs    r2, r3, #4
00090440  ldr     r3, [r3, #-0x4]
00090444  subs    r1, r3, #1
00090446  dmb     ish
0009044a  mov     ip, r3
0009044c  ldrex   lr, [r2]
00090450  cmp     lr, r3
00090452  beq     #0x904a8
00090454  cmp     lr, ip
00090456  mov     r3, lr
00090458  bne     #0x90444
0009045a  cmp.w   lr, #0
0009045e  bgt.w   #0x9018a
00090462  add     r1, sp, #0x12c
00090464  adds    r1, #3
00090466  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009046a  b       #0x9018a
0009046c  subs    r2, r3, #4
0009046e  ldr     r3, [r3, #-0x4]
00090472  subs    r1, r3, #1
00090474  dmb     ish
00090478  mov     ip, r3
0009047a  ldrex   r4, [r2]
0009047e  cmp     r4, r3
00090480  beq     #0x90498
00090482  cmp     r4, ip
00090484  mov     r3, r4
00090486  bne     #0x90472
00090488  cmp     r4, #0
0009048a  bgt.w   #0x9017c
0009048e  add     r1, sp, #0x130
00090490  adds    r1, #1
00090492  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090496  b       #0x9017c
00090498  strex   lr, r1, [r2]
0009049c  cmp.w   lr, #0
000904a0  bne     #0x9047a
000904a2  dmb     ish
000904a6  b       #0x90482
000904a8  strex   r4, r1, [r2]
000904ac  cmp     r4, #0
000904ae  bne     #0x9044c
000904b0  dmb     ish
000904b4  b       #0x90454
000904b6  strex   lr, r1, [r2]
000904ba  cmp.w   lr, #0
000904be  bne     #0x90420
000904c0  dmb     ish
000904c4  b       #0x90428
000904c6  strex   lr, r1, [r2]
000904ca  cmp.w   lr, #0
000904ce  bne     #0x903f4
000904d0  dmb     ish
000904d4  b       #0x903fc
000904d6  strex   lr, r1, [r2]
000904da  cmp.w   lr, #0
000904de  bne.w   #0x903c6
000904e2  dmb     ish
000904e6  b       #0x903d0
000904e8  strex   lr, r1, [r2]
000904ec  cmp.w   lr, #0
000904f0  bne.w   #0x90396
000904f4  dmb     ish
000904f8  b       #0x903a0
000904fa  strex   lr, r1, [r2]
000904fe  cmp.w   lr, #0
00090502  bne.w   #0x90368
00090506  dmb     ish
0009050a  b       #0x90372
0009050c  strex   lr, r1, [r2]
00090510  cmp.w   lr, #0
00090514  bne.w   #0x9033a
00090518  dmb     ish
0009051c  b       #0x90344
0009051e  strex   lr, r1, [r2]
00090522  cmp.w   lr, #0
00090526  bne.w   #0x9030c
0009052a  dmb     ish
0009052e  b       #0x90316
00090530  ldr     r3, [sp, #0xa4]
00090532  ldr     r1, [sp, #0xa8]
00090534  cmp     r3, #1
00090536  str     r1, [sp, #8]
00090538  beq     #0x90582
0009053a  cmp     r3, #2
0009053c  beq.w   #0x90774
00090540  cmp     r3, #3
00090542  beq     #0x90582
00090544  cmp     r3, #4
00090546  beq     #0x90582
00090548  cmp     r3, #5
0009054a  beq     #0x90598
0009054c  cmp     r3, #6
0009054e  beq     #0x90598
00090550  cmp     r3, #7
00090552  beq.w   #0x907b6
00090556  cmp     r3, #8
00090558  beq     #0x905bc
0009055a  cmp     r3, #9
0009055c  beq     #0x905d2
0009055e  cmp     r3, #0xa
00090560  beq     #0x905c6
00090562  cmp     r3, #0xb
00090564  beq.w   #0x90678
00090568  cmp     r3, #0xc
0009056a  beq.w   #0x90690
0009056e  ldr     r3, [sp, #0x108]
00090570  ldr     r2, [sp, #0x8c]
00090572  str     r1, [sp, #0x70]
00090574  sub.w   r0, r3, #0xc
00090578  cmp     r2, r0
0009057a  bne.w   #0x9074a
0009057e  ldr     r1, [sp, #0x70]
00090580  str     r1, [sp, #8]
00090582  ldr     r3, [sp, #0x110]
00090584  ldr     r1, [sp, #0x8c]
00090586  ldr     r4, [sp, #8]
00090588  sub.w   r0, r3, #0xc
0009058c  cmp     r1, r0
0009058e  str     r4, [sp, #0x74]
00090590  bne.w   #0x9078a
00090594  ldr     r1, [sp, #0x74]
00090596  str     r1, [sp, #8]
00090598  ldr     r3, [sp, #0x114]
0009059a  ldr     r4, [sp, #0x8c]
0009059c  ldr     r2, [sp, #8]
0009059e  sub.w   r0, r3, #0xc
000905a2  cmp     r4, r0
000905a4  str     r2, [sp, #0x78]
000905a6  bne     #0x90616
000905a8  ldr     r3, [sp, #0x118]
000905aa  ldr     r4, [sp, #0x8c]
000905ac  ldr     r2, [sp, #0x78]
000905ae  sub.w   r0, r3, #0xc
000905b2  cmp     r4, r0
000905b4  str     r2, [sp, #0x7c]
000905b6  bne     #0x905e8
000905b8  ldr     r1, [sp, #0x7c]
000905ba  str     r1, [sp, #8]
000905bc  add     r0, sp, #0xd4
000905be  movs    r3, #0
000905c0  str     r3, [sp, #0xa4]
000905c2  bl      #0x8d4bc ; -> ZN6Mayhem11HTTPRequestD1Ev
000905c6  ldr     r0, [sp, #8]
000905c8  mov.w   r3, #-1
000905cc  str     r3, [sp, #0xa4]
000905ce  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
000905d2  ldr     r3, [sp, #0x120]
000905d4  ldr     r2, [sp, #0x8c]
000905d6  ldr     r1, [sp, #8]
000905d8  sub.w   r0, r3, #0xc
000905dc  cmp     r2, r0
000905de  str     r1, [sp, #0x64]
000905e0  bne     #0x90640
000905e2  ldr     r1, [sp, #0x64]
000905e4  str     r1, [sp, #8]
000905e6  b       #0x905c6
000905e8  subs    r2, r3, #4
000905ea  ldr     r3, [r3, #-0x4]
000905ee  subs    r1, r3, #1
000905f0  dmb     ish
000905f4  mov     ip, r3
000905f6  ldrex   lr, [r2]
000905fa  cmp     lr, r3
000905fc  beq.w   #0x9072a
00090600  cmp     lr, ip
00090602  mov     r3, lr
00090604  bne     #0x905ee
00090606  cmp.w   lr, #0
0009060a  bgt     #0x905b8
0009060c  add.w   r1, sp, #0x12e
00090610  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090614  b       #0x905b8
00090616  subs    r2, r3, #4
00090618  ldr     r3, [r3, #-0x4]
0009061c  subs    r1, r3, #1
0009061e  dmb     ish
00090622  mov     ip, r3
00090624  ldrex   lr, [r2]
00090628  cmp     lr, r3
0009062a  beq     #0x9066a
0009062c  cmp     lr, ip
0009062e  mov     r3, lr
00090630  bne     #0x9061c
00090632  cmp.w   lr, #0
00090636  bgt     #0x905a8
00090638  add     r1, sp, #0x130
0009063a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009063e  b       #0x905a8
00090640  subs    r2, r3, #4
00090642  ldr     r3, [r3, #-0x4]
00090646  subs    r1, r3, #1
00090648  dmb     ish
0009064c  mov     ip, r3
0009064e  ldrex   r4, [r2]
00090652  cmp     r4, r3
00090654  beq     #0x9073a
00090656  cmp     r4, ip
00090658  mov     r3, r4
0009065a  bne     #0x90646
0009065c  cmp     r4, #0
0009065e  bgt     #0x905e2
00090660  add.w   r1, sp, #0x13a
00090664  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090668  b       #0x905e2
0009066a  strex   r4, r1, [r2]
0009066e  cmp     r4, #0
00090670  bne     #0x90624
00090672  dmb     ish
00090676  b       #0x9062c
00090678  ldr     r3, [sp, #8]
0009067a  ldr     r4, [sp, #0x88]
0009067c  str     r3, [sp, #0x5c]
0009067e  ldr     r3, [pc, #0x278]
00090680  sub.w   r0, r4, #0xc
00090684  add     r3, pc ; -> 0x000f3370  0x0
00090686  ldr     r3, [r3]
00090688  cmp     r0, r3
0009068a  bne     #0x906e2
0009068c  ldr     r1, [sp, #0x5c]
0009068e  str     r1, [sp, #8]
00090690  ldr     r3, [sp, #0x80]
00090692  ldr     r2, [sp, #8]
00090694  sub.w   r0, r3, #0xc
00090698  ldr.w   r3, [pc, #0x260]
0009069c  str     r2, [sp, #0x60]
0009069e  add     r3, pc ; -> 0x000f3370  0x0
000906a0  ldr     r3, [r3]
000906a2  cmp     r0, r3
000906a4  bne     #0x906b6
000906a6  ldr     r1, [sp, #0x60]
000906a8  mov.w   r3, #-1
000906ac  str     r3, [sp, #0xa4]
000906ae  mov     r0, r1
000906b0  str     r1, [sp, #8]
000906b2  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
000906b6  ldr     r4, [sp, #0x80]
000906b8  subs    r2, r4, #4
000906ba  ldr     r3, [r4, #-0x4]
000906be  subs    r1, r3, #1
000906c0  dmb     ish
000906c4  mov     ip, r3
000906c6  ldrex   lr, [r2]
000906ca  cmp     lr, r3
000906cc  beq     #0x9070e
000906ce  cmp     lr, ip
000906d0  mov     r3, lr
000906d2  bne     #0x906be
000906d4  cmp.w   lr, #0
000906d8  bgt     #0x906a6
000906da  add     r1, sp, #0x13c
000906dc  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000906e0  b       #0x906a6
000906e2  ldr     r3, [r4, #-0x4]
000906e6  subs    r2, r4, #4
000906e8  subs    r1, r3, #1
000906ea  dmb     ish
000906ee  mov     ip, r3
000906f0  ldrex   lr, [r2]
000906f4  cmp     lr, r3
000906f6  beq     #0x9071c
000906f8  cmp     lr, ip
000906fa  mov     r3, lr
000906fc  bne     #0x906e8
000906fe  cmp.w   lr, #0
00090702  bgt     #0x9068c
00090704  add     r1, sp, #0x13c
00090706  adds    r1, #1
00090708  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009070c  b       #0x9068c
0009070e  strex   r4, r1, [r2]
00090712  cmp     r4, #0
00090714  bne     #0x906c6
00090716  dmb     ish
0009071a  b       #0x906ce
0009071c  strex   r4, r1, [r2]
00090720  cmp     r4, #0
00090722  bne     #0x906f0
00090724  dmb     ish
00090728  b       #0x906f8
0009072a  strex   r4, r1, [r2]
0009072e  cmp     r4, #0
00090730  bne.w   #0x905f6
00090734  dmb     ish
00090738  b       #0x90600
0009073a  strex   lr, r1, [r2]
0009073e  cmp.w   lr, #0
00090742  bne     #0x9064e
00090744  dmb     ish
00090748  b       #0x90656
0009074a  subs    r2, r3, #4
0009074c  ldr     r3, [r3, #-0x4]
00090750  subs    r1, r3, #1
00090752  dmb     ish
00090756  mov     ip, r3
00090758  ldrex   r4, [r2]
0009075c  cmp     r4, r3
0009075e  beq     #0x907cc
00090760  cmp     r4, ip
00090762  mov     r3, r4
00090764  bne     #0x90750
00090766  cmp     r4, #0
00090768  bgt.w   #0x9057e
0009076c  add     r1, sp, #0x134
0009076e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090772  b       #0x9057e
00090774  ldr     r3, [sp, #8]
00090776  ldr     r4, [sp, #0x8c]
00090778  str     r3, [sp, #0x6c]
0009077a  ldr     r3, [sp, #0x10c]
0009077c  sub.w   r0, r3, #0xc
00090780  cmp     r4, r0
00090782  bne     #0x907dc
00090784  ldr     r1, [sp, #0x6c]
00090786  str     r1, [sp, #8]
00090788  b       #0x90582
0009078a  subs    r2, r3, #4
0009078c  ldr     r3, [r3, #-0x4]
00090790  subs    r1, r3, #1
00090792  dmb     ish
00090796  mov     ip, r3
00090798  ldrex   r4, [r2]
0009079c  cmp     r4, r3
0009079e  beq     #0x90808
000907a0  cmp     r4, ip
000907a2  mov     r3, r4
000907a4  bne     #0x90790
000907a6  cmp     r4, #0
000907a8  bgt.w   #0x90594
000907ac  add.w   r1, sp, #0x132
000907b0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000907b4  b       #0x90594
000907b6  ldr     r3, [sp, #0x11c]
000907b8  ldr     r2, [sp, #0x8c]
000907ba  ldr     r1, [sp, #8]
000907bc  sub.w   r0, r3, #0xc
000907c0  cmp     r2, r0
000907c2  str     r1, [sp, #0x68]
000907c4  bne     #0x90818
000907c6  ldr     r1, [sp, #0x68]
000907c8  str     r1, [sp, #8]
000907ca  b       #0x905bc
000907cc  strex   lr, r1, [r2]
000907d0  cmp.w   lr, #0
000907d4  bne     #0x90758
000907d6  dmb     ish
000907da  b       #0x90760
000907dc  subs    r2, r3, #4
000907de  ldr     r3, [r3, #-0x4]
000907e2  subs    r1, r3, #1
000907e4  dmb     ish
000907e8  mov     ip, r3
000907ea  ldrex   lr, [r2]
000907ee  cmp     lr, r3
000907f0  beq     #0x90840
000907f2  cmp     lr, ip
000907f4  mov     r3, lr
000907f6  bne     #0x907e2
000907f8  cmp.w   lr, #0
000907fc  bgt     #0x90784
000907fe  add.w   r1, sp, #0x136
00090802  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00090806  b       #0x90784
00090808  strex   lr, r1, [r2]
0009080c  cmp.w   lr, #0
00090810  bne     #0x90798
00090812  dmb     ish
00090816  b       #0x907a0
00090818  subs    r2, r3, #4
0009081a  ldr     r3, [r3, #-0x4]
0009081e  subs    r1, r3, #1
00090820  dmb     ish
00090824  mov     ip, r3
00090826  ldrex   r4, [r2]
0009082a  cmp     r4, r3
0009082c  beq     #0x9084e
0009082e  cmp     r4, ip
00090830  mov     r3, r4
00090832  bne     #0x9081e
00090834  cmp     r4, #0
00090836  bgt     #0x907c6
00090838  add     r1, sp, #0x138
0009083a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009083e  b       #0x907c6
00090840  strex   r4, r1, [r2]
00090844  cmp     r4, #0
00090846  bne     #0x907ea
00090848  dmb     ish
0009084c  b       #0x907f2
0009084e  strex   lr, r1, [r2]
00090852  cmp.w   lr, #0
00090856  bne     #0x90826
00090858  dmb     ish
0009085c  b       #0x9082e
0009085e  nop     
00090860  adds    r5, #0xae
00090862  movs    r6, r0
00090864  b       #0x902cc
00090866  movs    r5, r0
00090868  lsls    r6, r1, #0x1a
0009086a  movs    r0, r0
0009086c  bgt     #0x907b8
0009086e  movs    r6, r0
