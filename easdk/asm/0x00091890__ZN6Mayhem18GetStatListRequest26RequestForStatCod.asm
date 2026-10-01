========================================================================
ZN6Mayhem18GetStatListRequest26RequestForStatCodeExtendedEv  0x00091890  2096 bytes   Mayhem.mm
========================================================================

00091890  push    {r4, r5, r6, r7, lr}
00091892  add     r7, sp, #0xc
00091894  push.w  {r8, sl, fp}
00091898  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009189c  sub     sp, #0x124
0009189e  ldr.w   r3, [pc, #0x78c]
000918a2  str     r0, [sp, #0x20]
000918a4  add     r0, sp, #0x9c
000918a6  add     r3, pc ; -> 0x000f3438  0x0
000918a8  str     r7, [sp, #0xbc]
000918aa  ldr     r3, [r3]
000918ac  str.w   sp, [sp, #0xc4]
000918b0  str     r3, [sp, #0xb4]
000918b2  ldr.w   r3, [pc, #0x77c]
000918b6  add     r3, pc ; -> 0x000ee414  GCC_except_table75
000918b8  str     r3, [sp, #0xb8]
000918ba  ldr.w   r3, [pc, #0x778]
000918be  add     r3, pc ; -> 0x00091dec  
000918c0  orr     r3, r3, #1
000918c4  str     r3, [sp, #0xc0]
000918c6  blx     #0xdd4ac ; -> Unwind_SjLj_Register
000918ca  ldr.w   r0, [pc, #0x76c]
000918ce  mov.w   r3, #-1
000918d2  str     r3, [sp, #0xa0]
000918d4  add     r0, pc ; -> 0x0017f174  
000918d6  blx     #0xdd3e0 ; -> NSLog
000918da  ldr.w   r3, [pc, #0x760]
000918de  ldr.w   r1, [pc, #0x760]
000918e2  add     r0, sp, #0x110
000918e4  add     r3, pc ; -> 0x000fdb5c  
000918e6  add     r1, pc ; -> 0x0017f184  
000918e8  ldr     r3, [r3]
000918ea  str     r1, [sp, #0x1c]
000918ec  str     r3, [sp, #0x24]
000918ee  ldr.w   r3, [pc, #0x754]
000918f2  add     r3, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000918f4  ldr     r3, [r3]
000918f6  str     r3, [sp, #0x28]
000918f8  bl      #0x8bb28 ; -> ZN6Mayhem12getMayhemURLEv
000918fc  ldr     r2, [sp, #0x110]
000918fe  movs    r3, #0xc
00091900  add     r0, sp, #0x10c
00091902  str     r3, [sp, #0xa0]
00091904  str     r2, [sp, #0x7c]
00091906  bl      #0x8be80 ; -> ZN6Mayhem17getMayhemGameNameEv
0009190a  ldr     r3, [sp, #0x10c]
0009190c  ldr     r4, [sp, #0x20]
0009190e  str     r3, [sp, #0x80]
00091910  ldr     r2, [r4, #0x54]
00091912  ldr     r3, [r4, #0x7c]
00091914  ldr     r0, [r4, #0x74]
00091916  ldr     r1, [r4, #0x78]
00091918  ldr.w   ip, [r4, #0x58]
0009191c  ldr     r4, [sp, #0x80]
0009191e  str     r2, [sp, #4]
00091920  str     r3, [sp, #0xc]
00091922  str     r0, [sp, #0x10]
00091924  movs    r3, #0xb
00091926  str     r1, [sp, #0x14]
00091928  str     r3, [sp, #0xa0]
0009192a  str     r4, [sp]
0009192c  str.w   ip, [sp, #8]
00091930  ldr     r0, [sp, #0x24]
00091932  ldr     r1, [sp, #0x28]
00091934  ldr     r2, [sp, #0x1c]
00091936  ldr     r3, [sp, #0x7c]
00091938  blx     #0xddbfc ; -> objc_msgSend
0009193c  ldr.w   r3, [pc, #0x708]
00091940  str     r0, [sp, #0x2c]
00091942  sub.w   r0, r4, #0xc
00091946  add     r3, pc ; -> 0x000f3370  0x0
00091948  ldr     r3, [r3]
0009194a  cmp     r0, r3
0009194c  str     r3, [sp, #0x84]
0009194e  bne.w   #0x91cc0
00091952  ldr     r1, [sp, #0x7c]
00091954  ldr     r2, [sp, #0x84]
00091956  sub.w   r0, r1, #0xc
0009195a  cmp     r2, r0
0009195c  bne.w   #0x91c92
00091960  ldr.w   r3, [pc, #0x6e8]
00091964  ldr.w   r1, [pc, #0x6e8]
00091968  ldr     r0, [sp, #0x24]
0009196a  add     r3, pc ; -> 0x000fcf68  
0009196c  add     r1, pc ; -> 0x000fcf58  
0009196e  ldr     r3, [r3]
00091970  ldr     r1, [r1]
00091972  str     r3, [sp, #0x30]
00091974  mov.w   r3, #-1
00091978  str     r3, [sp, #0xa0]
0009197a  blx     #0xddbfc ; -> objc_msgSend
0009197e  ldr     r1, [sp, #0x30]
00091980  mov     r2, r0
00091982  ldr     r0, [sp, #0x2c]
00091984  blx     #0xddbfc ; -> objc_msgSend
00091988  add     r2, sp, #0x120
0009198a  movs    r3, #0xa
0009198c  adds    r2, #3
0009198e  str     r3, [sp, #0xa0]
00091990  mov     r1, r0
00091992  add     r0, sp, #0x108
00091994  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00091998  movs    r3, #9
0009199a  add     r0, sp, #0xd0
0009199c  str     r3, [sp, #0xa0]
0009199e  add     r1, sp, #0x108
000919a0  bl      #0x8b474 ; -> ZN6Mayhem11HTTPRequestC1ERKSs
000919a4  ldr     r3, [sp, #0x108]
000919a6  ldr     r2, [sp, #0x84]
000919a8  sub.w   r0, r3, #0xc
000919ac  cmp     r2, r0
000919ae  bne.w   #0x91d18
000919b2  ldr.w   r1, [pc, #0x6a0]
000919b6  movs    r3, #7
000919b8  add     r0, sp, #0x104
000919ba  add     r1, pc ; -> 0x00175e20  'GET'
000919bc  str     r3, [sp, #0xa0]
000919be  add.w   r2, sp, #0x122
000919c2  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
000919c6  movs    r3, #6
000919c8  add     r0, sp, #0xd0
000919ca  str     r3, [sp, #0xa0]
000919cc  add     r1, sp, #0x104
000919ce  bl      #0x8b3e8 ; -> ZN6Mayhem11HTTPRequest9SetMethodERKSs
000919d2  ldr     r3, [sp, #0x104]
000919d4  ldr     r2, [sp, #0x84]
000919d6  sub.w   r0, r3, #0xc
000919da  cmp     r2, r0
000919dc  bne.w   #0x91cee
000919e0  ldr     r1, [sp, #0x20]
000919e2  ldr     r3, [r1, #0xc]
000919e4  cmp     r3, #0
000919e6  beq     #0x91a5a
000919e8  ldr.w   r1, [pc, #0x66c]
000919ec  add     r2, sp, #0x120
000919ee  movs    r3, #5
000919f0  add     r1, pc ; -> 0x00175e24  'mh_uid'
000919f2  str     r3, [sp, #0xa0]
000919f4  add     r0, sp, #0x100
000919f6  adds    r2, #1
000919f8  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
000919fc  ldr     r3, [sp, #0x20]
000919fe  ldr     r2, [r3, #0xc]
00091a00  cmp     r2, #0
00091a02  beq.w   #0x91c5e
00091a06  movs    r3, #4
00091a08  adds    r2, #0x50
00091a0a  str     r3, [sp, #0xa0]
00091a0c  add     r0, sp, #0xd0
00091a0e  add     r1, sp, #0x100
00091a10  bl      #0x8f0ac ; -> ZN6Mayhem11HTTPRequest9AddHeaderERKSsS2_
00091a14  ldr     r3, [sp, #0x100]
00091a16  ldr     r2, [sp, #0x84]
00091a18  sub.w   r0, r3, #0xc
00091a1c  cmp     r2, r0
00091a1e  bne.w   #0x91d44
00091a22  ldr.w   r1, [pc, #0x638]
00091a26  movs    r3, #3
00091a28  add     r0, sp, #0xfc
00091a2a  add     r1, pc ; -> 0x00175e2c  'mh_session_key'
00091a2c  str     r3, [sp, #0xa0]
00091a2e  add     r2, sp, #0x120
00091a30  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00091a34  ldr     r1, [sp, #0x20]
00091a36  ldr     r2, [r1, #0xc]
00091a38  cmp     r2, #0
00091a3a  beq.w   #0x91d70
00091a3e  movs    r3, #2
00091a40  adds    r2, #0x58
00091a42  str     r3, [sp, #0xa0]
00091a44  add     r0, sp, #0xd0
00091a46  add     r1, sp, #0xfc
00091a48  bl      #0x8f0ac ; -> ZN6Mayhem11HTTPRequest9AddHeaderERKSsS2_
00091a4c  ldr     r3, [sp, #0xfc]
00091a4e  ldr     r2, [sp, #0x84]
00091a50  sub.w   r0, r3, #0xc
00091a54  cmp     r2, r0
00091a56  bne.w   #0x91c32
00091a5a  movs    r1, #8
00091a5c  add     r0, sp, #0xd0
00091a5e  str     r1, [sp, #0xa0]
00091a60  bl      #0x8f6f0 ; -> ZN6Mayhem11HTTPRequest9DoRequestEv
00091a64  str     r0, [sp, #0x34]
00091a66  ldr.w   r1, [pc, #0x5f8]
00091a6a  ldr.w   r0, [pc, #0x5f8]
00091a6e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
00091a70  add     r0, pc ; -> 0x000fdc00  
00091a72  ldr     r1, [r1]
00091a74  ldr     r0, [r0]
00091a76  blx     #0xddbfc ; -> objc_msgSend
00091a7a  ldr.w   r1, [pc, #0x5ec]
00091a7e  ldr     r2, [sp, #0x34]
00091a80  add     r1, pc ; -> 0x000fce64  '\x0b=\x0e'
00091a82  ldr     r1, [r1]
00091a84  blx     #0xddbfc ; -> objc_msgSend
00091a88  ldr.w   r1, [pc, #0x5e0]
00091a8c  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
00091a8e  ldr     r1, [r1]
00091a90  blx     #0xddbfc ; -> objc_msgSend
00091a94  ldr     r2, [sp, #0x20]
00091a96  ldr.w   r1, [pc, #0x5d8]
00091a9a  str     r0, [sp, #0x38]
00091a9c  ldr     r2, [r2, #0x10]
00091a9e  add     r1, pc ; -> 0x000fcfa4  
00091aa0  ldr     r1, [r1]
00091aa2  str     r2, [sp, #0x3c]
00091aa4  mov     r0, r2
00091aa6  blx     #0xddbfc ; -> objc_msgSend
00091aaa  ldr.w   r1, [pc, #0x5c8]
00091aae  ldr     r0, [sp, #0x38]
00091ab0  ldr     r2, [sp, #0x3c]
00091ab2  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
00091ab4  ldr     r1, [r1]
00091ab6  blx     #0xddbfc ; -> objc_msgSend
00091aba  ldr.w   r1, [pc, #0x5bc]
00091abe  ldr     r0, [sp, #0x38]
00091ac0  add     r1, pc ; -> 0x000fce60  '8U\x0e'
00091ac2  ldr     r1, [r1]
00091ac4  blx     #0xddbfc ; -> objc_msgSend
00091ac8  tst.w   r0, #0xff
00091acc  bne     #0x91b1c
00091ace  ldr.w   r1, [pc, #0x5ac]
00091ad2  ldr     r2, [sp, #0x20]
00091ad4  movs    r3, #8
00091ad6  add     r1, pc ; -> 0x000fcf9c  
00091ad8  str     r3, [sp, #0xa0]
00091ada  str     r2, [sp, #0x90]
00091adc  ldr     r1, [r1]
00091ade  ldr     r0, [sp, #0x3c]
00091ae0  blx     #0xddbfc ; -> objc_msgSend
00091ae4  mov     r1, r0
00091ae6  movs    r3, #8
00091ae8  ldr     r0, [sp, #0x90]
00091aea  str     r3, [sp, #0xa0]
00091aec  bl      #0x8b870 ; -> ZN6Mayhem7Request11HandleErrorEPv
00091af0  ldr     r0, [sp, #0x20]
00091af2  movs    r1, #2
00091af4  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00091af8  add     r0, sp, #0xd0
00091afa  mov.w   r3, #-1
00091afe  str     r3, [sp, #0xa0]
00091b00  bl      #0x8d4bc ; -> ZN6Mayhem11HTTPRequestD1Ev
00091b04  add     r0, sp, #0x9c
00091b06  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00091b0a  sub.w   sp, r7, #0x58
00091b0e  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00091b12  sub.w   sp, r7, #0x18
00091b16  pop.w   {r8, sl, fp}
00091b1a  pop     {r4, r5, r6, r7, pc}
00091b1c  ldr.w   r3, [pc, #0x560]
00091b20  ldr     r0, [sp, #0x3c]
00091b22  add     r3, pc ; -> 0x000fcf9c  
00091b24  ldr     r3, [r3]
00091b26  str     r3, [sp, #0x40]
00091b28  mov     r1, r3
00091b2a  blx     #0xddbfc ; -> objc_msgSend
00091b2e  ldr.w   r3, [pc, #0x554]
00091b32  ldr.w   r2, [pc, #0x554]
00091b36  add     r3, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
00091b38  add     r2, pc ; -> 0x0017f064  
00091b3a  ldr     r3, [r3]
00091b3c  str     r3, [sp, #0x44]
00091b3e  mov     r1, r3
00091b40  blx     #0xddbfc ; -> objc_msgSend
00091b44  str     r0, [sp, #0x48]
00091b46  cmp     r0, #0
00091b48  bne     #0x91ace
00091b4a  ldr     r0, [sp, #0x3c]
00091b4c  ldr     r1, [sp, #0x40]
00091b4e  blx     #0xddbfc ; -> objc_msgSend
00091b52  ldr.w   r2, [pc, #0x538]
00091b56  ldr     r1, [sp, #0x44]
00091b58  add     r2, pc ; -> 0x0017f194  
00091b5a  blx     #0xddbfc ; -> objc_msgSend
00091b5e  ldr.w   r3, [pc, #0x530]
00091b62  ldr     r2, [sp, #0x48]
00091b64  add     r3, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
00091b66  ldr     r3, [r3]
00091b68  str     r3, [sp, #0x4c]
00091b6a  mov     r1, r3
00091b6c  blx     #0xddbfc ; -> objc_msgSend
00091b70  ldr.w   r1, [pc, #0x520]
00091b74  add     r1, pc ; -> 0x000fcfa0  
00091b76  ldr     r1, [r1]
00091b78  blx     #0xddbfc ; -> objc_msgSend
00091b7c  ldr.w   r2, [pc, #0x518]
00091b80  ldr     r1, [sp, #0x44]
00091b82  add     r2, pc ; -> 0x0017f094  
00091b84  blx     #0xddbfc ; -> objc_msgSend
00091b88  ldr.w   r3, [pc, #0x510]
00091b8c  str     r0, [sp, #0x50]
00091b8e  add     r3, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
00091b90  ldr     r3, [r3]
00091b92  str     r3, [sp, #0x54]
00091b94  mov     r1, r3
00091b96  blx     #0xddbfc ; -> objc_msgSend
00091b9a  str     r0, [sp, #0x58]
00091b9c  add     r0, sp, #0xf4
00091b9e  bl      #0x8ad1c ; -> ZN6Mayhem4StatC1Ev
00091ba2  ldr     r3, [sp, #0x20]
00091ba4  ldr     r4, [sp, #0x58]
00091ba6  add.w   r0, r3, #0x68
00091baa  ldr     r1, [r3, #0x6c]
00091bac  ldr     r2, [r3, #0x68]
00091bae  rsb     r3, r2, r1
00091bb2  asrs    r3, r3, #3
00091bb4  cmp     r4, r3
00091bb6  bhs     #0x91c7c
00091bb8  lsls    r3, r4, #3
00091bba  adds    r2, r2, r3
00091bbc  cmp     r2, r1
00091bbe  str     r2, [sp, #0x8c]
00091bc0  str     r0, [sp, #0x94]
00091bc2  str     r1, [sp, #0x88]
00091bc4  beq     #0x91be2
00091bc6  str     r2, [sp, #0x98]
00091bc8  ldr     r1, [sp, #0x98]
00091bca  ldr     r3, [r1]
00091bcc  mov     r0, r1
00091bce  ldr     r2, [r3]
00091bd0  movs    r3, #1
00091bd2  str     r3, [sp, #0xa0]
00091bd4  blx     r2
00091bd6  ldr     r2, [sp, #0x98]
00091bd8  ldr     r3, [sp, #0x88]
00091bda  adds    r2, #8
00091bdc  cmp     r3, r2
00091bde  str     r2, [sp, #0x98]
00091be0  bne     #0x91bc8
00091be2  ldr     r2, [sp, #0x8c]
00091be4  ldr     r1, [sp, #0x94]
00091be6  str     r2, [r1, #4]
00091be8  movs    r3, #0
00091bea  str     r3, [sp, #0x60]
00091bec  b       #0x91c16
00091bee  ldr     r4, [sp, #0x20]
00091bf0  ldr     r1, [sp, #0x60]
00091bf2  ldr     r0, [sp, #0x50]
00091bf4  ldr     r2, [r4, #0x68]
00091bf6  lsls    r3, r1, #3
00091bf8  ldr     r1, [sp, #0x4c]
00091bfa  adds    r3, r3, r2
00091bfc  movs    r2, #8
00091bfe  str     r3, [sp, #0x5c]
00091c00  str     r2, [sp, #0xa0]
00091c02  ldr     r2, [sp, #0x60]
00091c04  blx     #0xddbfc ; -> objc_msgSend
00091c08  mov     r1, r0
00091c0a  ldr     r0, [sp, #0x5c]
00091c0c  bl      #0x90eb0 ; -> ZN6Mayhem4Stat11FillFromXMLEPv
00091c10  ldr     r3, [sp, #0x60]
00091c12  adds    r3, #1
00091c14  str     r3, [sp, #0x60]
00091c16  movs    r4, #8
00091c18  ldr     r0, [sp, #0x50]
00091c1a  str     r4, [sp, #0xa0]
00091c1c  ldr     r1, [sp, #0x54]
00091c1e  blx     #0xddbfc ; -> objc_msgSend
00091c22  ldr     r1, [sp, #0x60]
00091c24  cmp     r1, r0
00091c26  blo     #0x91bee
00091c28  ldr     r0, [sp, #0x20]
00091c2a  movs    r1, #1
00091c2c  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00091c30  b       #0x91af8
00091c32  subs    r2, r3, #4
00091c34  ldr     r3, [r3, #-0x4]
00091c38  subs    r1, r3, #1
00091c3a  dmb     ish
00091c3e  mov     ip, r3
00091c40  ldrex   r4, [r2]
00091c44  cmp     r4, r3
00091c46  beq.w   #0x91dda
00091c4a  cmp     r4, ip
00091c4c  mov     r3, r4
00091c4e  bne     #0x91c38
00091c50  cmp     r4, #0
00091c52  bgt.w   #0x91a5a
00091c56  add     r1, sp, #0x114
00091c58  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091c5c  b       #0x91a5a
00091c5e  ldr.w   r0, [pc, #0x440]
00091c62  ldr.w   r1, [pc, #0x440]
00091c66  ldr.w   r3, [pc, #0x440]
00091c6a  adds    r2, #4
00091c6c  add     r0, pc ; -> 0x000e5914  ZZNK4midp27SafeReferenceCountedPointerIN6Mayhem5TokenEEptEvE8__func__
00091c6e  str     r2, [sp, #0xa0]
00091c70  add     r1, pc ; -> 0x00175a60  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
00091c72  add     r3, pc ; -> 0x00175ad4  'm_obj'
00091c74  movw    r2, #0x10f
00091c78  blx     #0xdd5cc ; -> assert_rtn
00091c7c  ldr     r4, [sp, #0x20]
00091c7e  ldr     r1, [r4, #0x6c]
00091c80  ldr     r4, [sp, #0x58]
00091c82  rsb     r2, r3, r4
00091c86  movs    r3, #8
00091c88  str     r3, [sp, #0xa0]
00091c8a  add     r3, sp, #0xf4
00091c8c  bl      #0x9ac1c ; -> ZNSt6vectorIN6Mayhem4StatESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_
00091c90  b       #0x91be8
00091c92  ldr     r3, [sp, #0x7c]
00091c94  subs    r2, r3, #4
00091c96  ldr     r3, [r3, #-0x4]
00091c9a  subs    r1, r3, #1
00091c9c  dmb     ish
00091ca0  mov     ip, r3
00091ca2  ldrex   r4, [r2]
00091ca6  cmp     r4, r3
00091ca8  beq.w   #0x91db8
00091cac  cmp     r4, ip
00091cae  mov     r3, r4
00091cb0  bne     #0x91c9a
00091cb2  cmp     r4, #0
00091cb4  bgt.w   #0x91960
00091cb8  add     r1, sp, #0x11c
00091cba  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091cbe  b       #0x91960
00091cc0  ldr     r3, [r4, #-0x4]
00091cc4  subs    r2, r4, #4
00091cc6  subs    r1, r3, #1
00091cc8  dmb     ish
00091ccc  mov     ip, r3
00091cce  ldrex   lr, [r2]
00091cd2  cmp     lr, r3
00091cd4  beq     #0x91daa
00091cd6  cmp     lr, ip
00091cd8  mov     r3, lr
00091cda  bne     #0x91cc6
00091cdc  cmp.w   lr, #0
00091ce0  bgt.w   #0x91952
00091ce4  add     r1, sp, #0x11c
00091ce6  adds    r1, #3
00091ce8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091cec  b       #0x91952
00091cee  subs    r2, r3, #4
00091cf0  ldr     r3, [r3, #-0x4]
00091cf4  subs    r1, r3, #1
00091cf6  dmb     ish
00091cfa  mov     ip, r3
00091cfc  ldrex   r4, [r2]
00091d00  cmp     r4, r3
00091d02  beq     #0x91d9a
00091d04  cmp     r4, ip
00091d06  mov     r3, r4
00091d08  bne     #0x91cf4
00091d0a  cmp     r4, #0
00091d0c  bgt.w   #0x919e0
00091d10  add     r1, sp, #0x118
00091d12  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091d16  b       #0x919e0
00091d18  subs    r2, r3, #4
00091d1a  ldr     r3, [r3, #-0x4]
00091d1e  subs    r1, r3, #1
00091d20  dmb     ish
00091d24  mov     ip, r3
00091d26  ldrex   r4, [r2]
00091d2a  cmp     r4, r3
00091d2c  beq     #0x91d8a
00091d2e  cmp     r4, ip
00091d30  mov     r3, r4
00091d32  bne     #0x91d1e
00091d34  cmp     r4, #0
00091d36  bgt.w   #0x919b2
00091d3a  add.w   r1, sp, #0x11a
00091d3e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091d42  b       #0x919b2
00091d44  subs    r2, r3, #4
00091d46  ldr     r3, [r3, #-0x4]
00091d4a  subs    r1, r3, #1
00091d4c  dmb     ish
00091d50  mov     ip, r3
00091d52  ldrex   r4, [r2]
00091d56  cmp     r4, r3
00091d58  beq     #0x91dca
00091d5a  cmp     r4, ip
00091d5c  mov     r3, r4
00091d5e  bne     #0x91d4a
00091d60  cmp     r4, #0
00091d62  bgt.w   #0x91a22
00091d66  add.w   r1, sp, #0x116
00091d6a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091d6e  b       #0x91a22
00091d70  ldr     r0, [pc, #0x338]
00091d72  ldr.w   r1, [pc, #0x33c]
00091d76  ldr     r3, [pc, #0x33c]
00091d78  adds    r2, #2
00091d7a  add     r0, pc ; -> 0x000e5914  ZZNK4midp27SafeReferenceCountedPointerIN6Mayhem5TokenEEptEvE8__func__
00091d7c  str     r2, [sp, #0xa0]
00091d7e  add     r1, pc ; -> 0x00175a60  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
00091d80  add     r3, pc ; -> 0x00175ad4  'm_obj'
00091d82  movw    r2, #0x10f
00091d86  blx     #0xdd5cc ; -> assert_rtn
00091d8a  strex   lr, r1, [r2]
00091d8e  cmp.w   lr, #0
00091d92  bne     #0x91d26
00091d94  dmb     ish
00091d98  b       #0x91d2e
00091d9a  strex   lr, r1, [r2]
00091d9e  cmp.w   lr, #0
00091da2  bne     #0x91cfc
00091da4  dmb     ish
00091da8  b       #0x91d04
00091daa  strex   r4, r1, [r2]
00091dae  cmp     r4, #0
00091db0  bne     #0x91cce
00091db2  dmb     ish
00091db6  b       #0x91cd6
00091db8  strex   lr, r1, [r2]
00091dbc  cmp.w   lr, #0
00091dc0  bne.w   #0x91ca2
00091dc4  dmb     ish
00091dc8  b       #0x91cac
00091dca  strex   lr, r1, [r2]
00091dce  cmp.w   lr, #0
00091dd2  bne     #0x91d52
00091dd4  dmb     ish
00091dd8  b       #0x91d5a
00091dda  strex   lr, r1, [r2]
00091dde  cmp.w   lr, #0
00091de2  bne.w   #0x91c40
00091de6  dmb     ish
00091dea  b       #0x91c4a
00091dec  ldr     r3, [sp, #0xa0]
00091dee  ldr     r4, [sp, #0xa4]
00091df0  cmp     r3, #1
00091df2  str     r4, [sp, #0x18]
00091df4  beq     #0x91eea
00091df6  cmp     r3, #2
00091df8  beq     #0x91e22
00091dfa  cmp     r3, #3
00091dfc  beq.w   #0x91f90
00091e00  cmp     r3, #4
00091e02  beq     #0x91e22
00091e04  cmp     r3, #5
00091e06  beq.w   #0x91f7a
00091e0a  cmp     r3, #6
00091e0c  beq     #0x91e22
00091e0e  cmp     r3, #7
00091e10  beq     #0x91e22
00091e12  cmp     r3, #8
00091e14  beq     #0x91f00
00091e16  cmp     r3, #9
00091e18  beq     #0x91e2c
00091e1a  cmp     r3, #0xa
00091e1c  beq     #0x91e38
00091e1e  cmp     r3, #0xb
00091e20  beq     #0x91e50
00091e22  add     r0, sp, #0xd0
00091e24  movs    r3, #0
00091e26  str     r3, [sp, #0xa0]
00091e28  bl      #0x8d4bc ; -> ZN6Mayhem11HTTPRequestD1Ev
00091e2c  ldr     r0, [sp, #0x18]
00091e2e  mov.w   r3, #-1
00091e32  str     r3, [sp, #0xa0]
00091e34  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00091e38  ldr     r3, [sp, #0x18]
00091e3a  ldr     r4, [sp, #0x80]
00091e3c  str     r3, [sp, #0x64]
00091e3e  ldr     r3, [pc, #0x278]
00091e40  sub.w   r0, r4, #0xc
00091e44  add     r3, pc ; -> 0x000f3370  0x0
00091e46  ldr     r3, [r3]
00091e48  cmp     r0, r3
00091e4a  bne     #0x91ea2
00091e4c  ldr     r1, [sp, #0x64]
00091e4e  str     r1, [sp, #0x18]
00091e50  ldr     r3, [sp, #0x7c]
00091e52  ldr     r2, [sp, #0x18]
00091e54  sub.w   r0, r3, #0xc
00091e58  ldr     r3, [pc, #0x260]
00091e5a  str     r2, [sp, #0x68]
00091e5c  add     r3, pc ; -> 0x000f3370  0x0
00091e5e  ldr     r3, [r3]
00091e60  cmp     r0, r3
00091e62  bne     #0x91e74
00091e64  ldr     r1, [sp, #0x68]
00091e66  mov.w   r3, #-1
00091e6a  str     r3, [sp, #0xa0]
00091e6c  mov     r0, r1
00091e6e  str     r1, [sp, #0x18]
00091e70  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00091e74  ldr     r4, [sp, #0x7c]
00091e76  subs    r2, r4, #4
00091e78  ldr     r3, [r4, #-0x4]
00091e7c  subs    r1, r3, #1
00091e7e  dmb     ish
00091e82  mov     ip, r3
00091e84  ldrex   lr, [r2]
00091e88  cmp     lr, r3
00091e8a  beq     #0x91ece
00091e8c  cmp     lr, ip
00091e8e  mov     r3, lr
00091e90  bne     #0x91e7c
00091e92  cmp.w   lr, #0
00091e96  bgt     #0x91e64
00091e98  add     r1, sp, #0x11c
00091e9a  adds    r1, #1
00091e9c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091ea0  b       #0x91e64
00091ea2  ldr     r3, [r4, #-0x4]
00091ea6  subs    r2, r4, #4
00091ea8  subs    r1, r3, #1
00091eaa  dmb     ish
00091eae  mov     ip, r3
00091eb0  ldrex   lr, [r2]
00091eb4  cmp     lr, r3
00091eb6  beq     #0x91edc
00091eb8  cmp     lr, ip
00091eba  mov     r3, lr
00091ebc  bne     #0x91ea8
00091ebe  cmp.w   lr, #0
00091ec2  bgt     #0x91e4c
00091ec4  add.w   r1, sp, #0x11e
00091ec8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091ecc  b       #0x91e4c
00091ece  strex   r4, r1, [r2]
00091ed2  cmp     r4, #0
00091ed4  bne     #0x91e84
00091ed6  dmb     ish
00091eda  b       #0x91e8c
00091edc  strex   r4, r1, [r2]
00091ee0  cmp     r4, #0
00091ee2  bne     #0x91eb0
00091ee4  dmb     ish
00091ee8  b       #0x91eb8
00091eea  ldr     r3, [sp, #0xfc]
00091eec  ldr     r4, [sp, #0x84]
00091eee  ldr     r2, [sp, #0x18]
00091ef0  sub.w   r0, r3, #0xc
00091ef4  cmp     r4, r0
00091ef6  str     r2, [sp, #0x78]
00091ef8  bne     #0x91f16
00091efa  ldr     r1, [sp, #0x78]
00091efc  str     r1, [sp, #0x18]
00091efe  b       #0x91e22
00091f00  ldr     r3, [sp, #0x108]
00091f02  ldr     r2, [sp, #0x84]
00091f04  ldr     r1, [sp, #0x18]
00091f06  sub.w   r0, r3, #0xc
00091f0a  cmp     r2, r0
00091f0c  str     r1, [sp, #0x6c]
00091f0e  bne     #0x91f42
00091f10  ldr     r1, [sp, #0x6c]
00091f12  str     r1, [sp, #0x18]
00091f14  b       #0x91e2c
00091f16  subs    r2, r3, #4
00091f18  ldr     r3, [r3, #-0x4]
00091f1c  subs    r1, r3, #1
00091f1e  dmb     ish
00091f22  mov     ip, r3
00091f24  ldrex   lr, [r2]
00091f28  cmp     lr, r3
00091f2a  beq     #0x91f6c
00091f2c  cmp     lr, ip
00091f2e  mov     r3, lr
00091f30  bne     #0x91f1c
00091f32  cmp.w   lr, #0
00091f36  bgt     #0x91efa
00091f38  add     r1, sp, #0x114
00091f3a  adds    r1, #1
00091f3c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091f40  b       #0x91efa
00091f42  subs    r2, r3, #4
00091f44  ldr     r3, [r3, #-0x4]
00091f48  subs    r1, r3, #1
00091f4a  dmb     ish
00091f4e  mov     ip, r3
00091f50  ldrex   r4, [r2]
00091f54  cmp     r4, r3
00091f56  beq     #0x9200a
00091f58  cmp     r4, ip
00091f5a  mov     r3, r4
00091f5c  bne     #0x91f48
00091f5e  cmp     r4, #0
00091f60  bgt     #0x91f10
00091f62  add     r1, sp, #0x118
00091f64  adds    r1, #3
00091f66  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091f6a  b       #0x91f10
00091f6c  strex   r4, r1, [r2]
00091f70  cmp     r4, #0
00091f72  bne     #0x91f24
00091f74  dmb     ish
00091f78  b       #0x91f2c
00091f7a  ldr     r3, [sp, #0x104]
00091f7c  ldr     r2, [sp, #0x84]
00091f7e  ldr     r1, [sp, #0x18]
00091f80  sub.w   r0, r3, #0xc
00091f84  cmp     r2, r0
00091f86  str     r1, [sp, #0x70]
00091f88  bne     #0x91fa6
00091f8a  ldr     r1, [sp, #0x70]
00091f8c  str     r1, [sp, #0x18]
00091f8e  b       #0x91e22
00091f90  ldr     r3, [sp, #0x100]
00091f92  ldr     r1, [sp, #0x84]
00091f94  ldr     r4, [sp, #0x18]
00091f96  sub.w   r0, r3, #0xc
00091f9a  cmp     r1, r0
00091f9c  str     r4, [sp, #0x74]
00091f9e  bne     #0x91fd0
00091fa0  ldr     r1, [sp, #0x74]
00091fa2  str     r1, [sp, #0x18]
00091fa4  b       #0x91e22
00091fa6  subs    r2, r3, #4
00091fa8  ldr     r3, [r3, #-0x4]
00091fac  subs    r1, r3, #1
00091fae  dmb     ish
00091fb2  mov     ip, r3
00091fb4  ldrex   r4, [r2]
00091fb8  cmp     r4, r3
00091fba  beq     #0x91ffa
00091fbc  cmp     r4, ip
00091fbe  mov     r3, r4
00091fc0  bne     #0x91fac
00091fc2  cmp     r4, #0
00091fc4  bgt     #0x91f8a
00091fc6  add     r1, sp, #0x118
00091fc8  adds    r1, #1
00091fca  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091fce  b       #0x91f8a
00091fd0  subs    r2, r3, #4
00091fd2  ldr     r3, [r3, #-0x4]
00091fd6  subs    r1, r3, #1
00091fd8  dmb     ish
00091fdc  mov     ip, r3
00091fde  ldrex   r4, [r2]
00091fe2  cmp     r4, r3
00091fe4  beq     #0x9201a
00091fe6  cmp     r4, ip
00091fe8  mov     r3, r4
00091fea  bne     #0x91fd6
00091fec  cmp     r4, #0
00091fee  bgt     #0x91fa0
00091ff0  add     r1, sp, #0x114
00091ff2  adds    r1, #3
00091ff4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091ff8  b       #0x91fa0
00091ffa  strex   lr, r1, [r2]
00091ffe  cmp.w   lr, #0
00092002  bne     #0x91fb4
00092004  dmb     ish
00092008  b       #0x91fbc
0009200a  strex   lr, r1, [r2]
0009200e  cmp.w   lr, #0
00092012  bne     #0x91f50
00092014  dmb     ish
00092018  b       #0x91f58
0009201a  strex   lr, r1, [r2]
0009201e  cmp.w   lr, #0
00092022  bne     #0x91fde
00092024  dmb     ish
00092028  b       #0x91fe6
0009202a  nop     
0009202c  subs    r6, r1, r6
0009202e  movs    r6, r0
00092030  ldm     r3, {r1, r3, r4, r6}
00092032  movs    r5, r0
00092034  lsls    r2, r5, #0x14
00092036  movs    r0, r0
00092038  bhi     #0x91f74
0009203a  movs    r6, r1
0009203c  stm     r2!, {r2, r4, r5, r6}
0009203e  movs    r6, r0
00092040  bhi     #0x91f78
00092042  movs    r6, r1
00092044  cbz     r2, #0x92072
00092046  movs    r6, r0
00092048  subs    r6, r4, r0
0009204a  movs    r6, r0
0009204c  push    {r1, r3, r4, r5, r6, r7, lr}
0009204e  movs    r6, r0
00092050  push    {r3, r5, r6, r7, lr}
00092052  movs    r6, r0
00092054  add     r2, ip
00092056  movs    r6, r1
00092058  add     r0, r6
0009205a  movs    r6, r1
0009205c  mvns    r6, r7
0009205e  movs    r6, r1
00092060  add     r7, sp, #0x48
00092062  movs    r6, r0
00092064  stm     r1!, {r2, r3, r7}
00092066  movs    r6, r0
00092068  cbz     r0, #0x920e4
0009206a  movs    r6, r0
0009206c  add     r7, sp, #0x320
0009206e  movs    r6, r0
00092070  push    {r1, lr}
00092072  movs    r6, r0
00092074  cbz     r2, #0x920a8
00092076  movs    r6, r0
00092078  cbz     r4, #0x920e2
0009207a  movs    r6, r0
0009207c  push    {r1, r6, r7}
0009207e  movs    r6, r0
00092080  push    {r1, r2, r4, r5, r6}
00092082  movs    r6, r0
00092084  add     r7, sp, #0x268
00092086  movs    r6, r0
00092088  bpl     #0x920dc
0009208a  movs    r6, r1
0009208c  bvs     #0x92100
0009208e  movs    r6, r1
00092090  add     r7, sp, #0x50
00092092  movs    r6, r0
00092094  push    {r3, r5}
00092096  movs    r6, r0
00092098  bpl     #0x920b8
0009209a  movs    r6, r1
0009209c  add     r6, sp, #0x3b8
0009209e  movs    r6, r0
000920a0  subs    r4, #0xa4
000920a2  movs    r5, r0
000920a4  subs    r5, #0xec
000920a6  movs    r6, r1
000920a8  subs    r6, #0x5e
000920aa  movs    r6, r1
000920ac  subs    r3, #0x96
000920ae  movs    r5, r0
000920b0  subs    r4, #0xde
000920b2  movs    r6, r1
000920b4  subs    r5, #0x50
000920b6  movs    r6, r1
000920b8  asrs    r0, r5, #0x14
000920ba  movs    r6, r0
000920bc  asrs    r0, r2, #0x14
000920be  movs    r6, r0
