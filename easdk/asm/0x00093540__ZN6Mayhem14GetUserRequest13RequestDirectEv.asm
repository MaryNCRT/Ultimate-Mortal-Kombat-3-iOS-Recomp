========================================================================
ZN6Mayhem14GetUserRequest13RequestDirectEv  0x00093540  1116 bytes   Mayhem.mm
========================================================================

00093540  push    {r4, r5, r6, r7, lr}
00093542  add     r7, sp, #0xc
00093544  push.w  {r8, sl, fp}
00093548  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009354c  sub     sp, #0xbc
0009354e  ldr     r3, [pc, #0x3ec]
00093550  str     r0, [sp, #0xc]
00093552  add     r0, sp, #0x50
00093554  add     r3, pc ; -> 0x000f3438  0x0
00093556  str     r7, [sp, #0x70]
00093558  ldr     r3, [r3]
0009355a  str.w   sp, [sp, #0x78]
0009355e  str     r3, [sp, #0x68]
00093560  ldr     r3, [pc, #0x3dc]
00093562  add     r3, pc ; -> 0x000ee46e  GCC_except_table82
00093564  str     r3, [sp, #0x6c]
00093566  ldr     r3, [pc, #0x3dc]
00093568  add     r3, pc ; -> 0x00093810  
0009356a  orr     r3, r3, #1
0009356e  str     r3, [sp, #0x74]
00093570  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00093574  ldr     r3, [pc, #0x3d0]
00093576  ldr     r1, [pc, #0x3d4]
00093578  add     r0, sp, #0xb0
0009357a  add     r3, pc ; -> 0x000fdb5c  
0009357c  add     r1, pc ; -> 0x0017f234  
0009357e  ldr     r3, [r3]
00093580  str     r1, [sp, #8]
00093582  str     r3, [sp, #0x10]
00093584  ldr     r3, [pc, #0x3c8]
00093586  add     r3, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
00093588  ldr     r3, [r3]
0009358a  str     r3, [sp, #0x14]
0009358c  mov.w   r3, #-1
00093590  str     r3, [sp, #0x54]
00093592  bl      #0x8bb28 ; -> ZN6Mayhem12getMayhemURLEv
00093596  ldr     r2, [sp, #0xb0]
00093598  ldr     r4, [sp, #0xc]
0009359a  ldr     r0, [sp, #0x10]
0009359c  ldr     r1, [sp, #0x14]
0009359e  str     r2, [sp, #0x44]
000935a0  ldr     r3, [r4, #0x58]
000935a2  ldr     r2, [sp, #8]
000935a4  str     r3, [sp]
000935a6  movs    r3, #6
000935a8  str     r3, [sp, #0x54]
000935aa  ldr     r3, [sp, #0x44]
000935ac  blx     #0xddbfc ; -> objc_msgSend
000935b0  ldr     r3, [pc, #0x3a0]
000935b2  ldr     r1, [sp, #0x44]
000935b4  str     r0, [sp, #0x18]
000935b6  add     r3, pc ; -> 0x000f3370  0x0
000935b8  sub.w   r0, r1, #0xc
000935bc  ldr     r3, [r3]
000935be  cmp     r0, r3
000935c0  str     r3, [sp, #0x48]
000935c2  bne.w   #0x937b4
000935c6  ldr     r3, [pc, #0x390]
000935c8  ldr     r1, [pc, #0x390]
000935ca  ldr     r0, [sp, #0x10]
000935cc  add     r3, pc ; -> 0x000fcf68  
000935ce  add     r1, pc ; -> 0x000fcf58  
000935d0  ldr     r3, [r3]
000935d2  ldr     r1, [r1]
000935d4  str     r3, [sp, #0x1c]
000935d6  mov.w   r3, #-1
000935da  str     r3, [sp, #0x54]
000935dc  blx     #0xddbfc ; -> objc_msgSend
000935e0  ldr     r1, [sp, #0x1c]
000935e2  mov     r2, r0
000935e4  ldr     r0, [sp, #0x18]
000935e6  blx     #0xddbfc ; -> objc_msgSend
000935ea  movs    r3, #5
000935ec  add.w   r2, sp, #0xbb
000935f0  str     r3, [sp, #0x54]
000935f2  mov     r1, r0
000935f4  add     r0, sp, #0xac
000935f6  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
000935fa  movs    r3, #4
000935fc  add     r0, sp, #0x84
000935fe  str     r3, [sp, #0x54]
00093600  add     r1, sp, #0xac
00093602  bl      #0x8b474 ; -> ZN6Mayhem11HTTPRequestC1ERKSs
00093606  ldr     r3, [sp, #0xac]
00093608  ldr     r2, [sp, #0x48]
0009360a  sub.w   r0, r3, #0xc
0009360e  cmp     r2, r0
00093610  bne.w   #0x93788
00093614  ldr.w   r1, [pc, #0x348]
00093618  movs    r3, #2
0009361a  add     r0, sp, #0xa8
0009361c  add     r1, pc ; -> 0x00175e5c  'GET'
0009361e  str     r3, [sp, #0x54]
00093620  add.w   r2, sp, #0xba
00093624  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00093628  movs    r3, #1
0009362a  add     r0, sp, #0x84
0009362c  str     r3, [sp, #0x54]
0009362e  add     r1, sp, #0xa8
00093630  bl      #0x8b3e8 ; -> ZN6Mayhem11HTTPRequest9SetMethodERKSs
00093634  ldr     r3, [sp, #0xa8]
00093636  ldr     r2, [sp, #0x48]
00093638  sub.w   r0, r3, #0xc
0009363c  cmp     r2, r0
0009363e  bne.w   #0x9375e
00093642  movs    r1, #3
00093644  add     r0, sp, #0x84
00093646  str     r1, [sp, #0x54]
00093648  bl      #0x8f6f0 ; -> ZN6Mayhem11HTTPRequest9DoRequestEv
0009364c  str     r0, [sp, #0x20]
0009364e  ldr     r1, [pc, #0x314]
00093650  ldr     r0, [pc, #0x314]
00093652  movs    r2, #3
00093654  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
00093656  add     r0, pc ; -> 0x000fdc00  
00093658  ldr     r1, [r1]
0009365a  ldr     r0, [r0]
0009365c  str     r2, [sp, #0x54]
0009365e  blx     #0xddbfc ; -> objc_msgSend
00093662  ldr     r1, [pc, #0x308]
00093664  ldr     r2, [sp, #0x20]
00093666  add     r1, pc ; -> 0x000fce64  '\x0b=\x0e'
00093668  ldr     r1, [r1]
0009366a  blx     #0xddbfc ; -> objc_msgSend
0009366e  ldr     r1, [pc, #0x300]
00093670  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
00093672  ldr     r1, [r1]
00093674  blx     #0xddbfc ; -> objc_msgSend
00093678  ldr     r3, [sp, #0xc]
0009367a  ldr     r1, [pc, #0x2f8]
0009367c  str     r0, [sp, #0x24]
0009367e  ldr     r3, [r3, #0x18]
00093680  add     r1, pc ; -> 0x000fcfa4  
00093682  ldr     r1, [r1]
00093684  str     r3, [sp, #0x28]
00093686  mov     r0, r3
00093688  blx     #0xddbfc ; -> objc_msgSend
0009368c  ldr     r1, [pc, #0x2e8]
0009368e  ldr     r0, [sp, #0x24]
00093690  ldr     r2, [sp, #0x28]
00093692  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
00093694  ldr     r1, [r1]
00093696  blx     #0xddbfc ; -> objc_msgSend
0009369a  ldr     r1, [pc, #0x2e0]
0009369c  ldr     r0, [sp, #0x24]
0009369e  add     r1, pc ; -> 0x000fce60  '8U\x0e'
000936a0  ldr     r1, [r1]
000936a2  blx     #0xddbfc ; -> objc_msgSend
000936a6  tst.w   r0, #0xff
000936aa  beq     #0x936d4
000936ac  ldr     r3, [pc, #0x2d0]
000936ae  ldr     r0, [sp, #0x28]
000936b0  add     r3, pc ; -> 0x000fcf9c  
000936b2  ldr     r3, [r3]
000936b4  str     r3, [sp, #0x2c]
000936b6  mov     r1, r3
000936b8  blx     #0xddbfc ; -> objc_msgSend
000936bc  ldr     r3, [pc, #0x2c4]
000936be  ldr     r2, [pc, #0x2c8]
000936c0  add     r3, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000936c2  add     r2, pc ; -> 0x0017f064  
000936c4  ldr     r3, [r3]
000936c6  str     r3, [sp, #0x30]
000936c8  mov     r1, r3
000936ca  blx     #0xddbfc ; -> objc_msgSend
000936ce  str     r0, [sp, #0x34]
000936d0  cmp     r0, #0
000936d2  beq     #0x93726
000936d4  ldr     r1, [pc, #0x2b4]
000936d6  ldr     r2, [sp, #0xc]
000936d8  movs    r3, #3
000936da  add     r1, pc ; -> 0x000fcf9c  
000936dc  adds    r2, #8
000936de  ldr     r1, [r1]
000936e0  str     r2, [sp, #0x4c]
000936e2  str     r3, [sp, #0x54]
000936e4  ldr     r0, [sp, #0x28]
000936e6  blx     #0xddbfc ; -> objc_msgSend
000936ea  mov     r1, r0
000936ec  movs    r3, #3
000936ee  ldr     r0, [sp, #0x4c]
000936f0  str     r3, [sp, #0x54]
000936f2  bl      #0x8b870 ; -> ZN6Mayhem7Request11HandleErrorEPv
000936f6  ldr     r1, [sp, #0xc]
000936f8  add.w   r0, r1, #8
000936fc  movs    r1, #2
000936fe  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00093702  add     r0, sp, #0x84
00093704  mov.w   r3, #-1
00093708  str     r3, [sp, #0x54]
0009370a  bl      #0x8d4bc ; -> ZN6Mayhem11HTTPRequestD1Ev
0009370e  add     r0, sp, #0x50
00093710  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00093714  sub.w   sp, r7, #0x58
00093718  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009371c  sub.w   sp, r7, #0x18
00093720  pop.w   {r8, sl, fp}
00093724  pop     {r4, r5, r6, r7, pc}
00093726  ldr     r0, [sp, #0x28]
00093728  ldr     r1, [sp, #0x2c]
0009372a  blx     #0xddbfc ; -> objc_msgSend
0009372e  ldr     r2, [pc, #0x260]
00093730  ldr     r1, [sp, #0x30]
00093732  add     r2, pc ; -> 0x0017f244  
00093734  blx     #0xddbfc ; -> objc_msgSend
00093738  ldr     r1, [pc, #0x258]
0009373a  ldr     r2, [sp, #0x34]
0009373c  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
0009373e  ldr     r1, [r1]
00093740  blx     #0xddbfc ; -> objc_msgSend
00093744  ldr     r4, [sp, #0xc]
00093746  mov     r1, r0
00093748  add.w   r2, r4, #0x58
0009374c  mov     r0, r4
0009374e  bl      #0x929d8 ; -> ZN6Mayhem4User11FillFromXMLEPvRKSs
00093752  add.w   r0, r4, #8
00093756  movs    r1, #1
00093758  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
0009375c  b       #0x93702
0009375e  subs    r2, r3, #4
00093760  ldr     r3, [r3, #-0x4]
00093764  subs    r1, r3, #1
00093766  dmb     ish
0009376a  mov     ip, r3
0009376c  ldrex   r4, [r2]
00093770  cmp     r4, r3
00093772  beq     #0x93800
00093774  cmp     r4, ip
00093776  mov     r3, r4
00093778  bne     #0x93764
0009377a  cmp     r4, #0
0009377c  bgt.w   #0x93642
00093780  add     r1, sp, #0xb4
00093782  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00093786  b       #0x93642
00093788  subs    r2, r3, #4
0009378a  ldr     r3, [r3, #-0x4]
0009378e  subs    r1, r3, #1
00093790  dmb     ish
00093794  mov     ip, r3
00093796  ldrex   r4, [r2]
0009379a  cmp     r4, r3
0009379c  beq     #0x937f0
0009379e  cmp     r4, ip
000937a0  mov     r3, r4
000937a2  bne     #0x9378e
000937a4  cmp     r4, #0
000937a6  bgt.w   #0x93614
000937aa  add.w   r1, sp, #0xb6
000937ae  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000937b2  b       #0x93614
000937b4  ldr     r3, [r1, #-0x4]
000937b8  subs    r2, r1, #4
000937ba  subs    r1, r3, #1
000937bc  dmb     ish
000937c0  mov     ip, r3
000937c2  ldrex   r4, [r2]
000937c6  cmp     r4, r3
000937c8  beq     #0x937e0
000937ca  cmp     r4, ip
000937cc  mov     r3, r4
000937ce  bne     #0x937ba
000937d0  cmp     r4, #0
000937d2  bgt.w   #0x935c6
000937d6  add.w   r1, sp, #0xb9
000937da  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000937de  b       #0x935c6
000937e0  strex   lr, r1, [r2]
000937e4  cmp.w   lr, #0
000937e8  bne     #0x937c2
000937ea  dmb     ish
000937ee  b       #0x937ca
000937f0  strex   lr, r1, [r2]
000937f4  cmp.w   lr, #0
000937f8  bne     #0x93796
000937fa  dmb     ish
000937fe  b       #0x9379e
00093800  strex   lr, r1, [r2]
00093804  cmp.w   lr, #0
00093808  bne     #0x9376c
0009380a  dmb     ish
0009380e  b       #0x93774
00093810  ldr     r3, [sp, #0x54]
00093812  ldr     r1, [sp, #0x58]
00093814  cmp     r3, #1
00093816  str     r1, [sp, #4]
00093818  beq     #0x9383c
0009381a  cmp     r3, #2
0009381c  beq     #0x9383c
0009381e  cmp     r3, #3
00093820  beq     #0x93852
00093822  cmp     r3, #4
00093824  beq     #0x93846
00093826  cmp     r3, #5
00093828  beq     #0x93892
0009382a  ldr     r3, [sp, #0xa8]
0009382c  ldr     r2, [sp, #0x48]
0009382e  str     r1, [sp, #0x40]
00093830  sub.w   r0, r3, #0xc
00093834  cmp     r2, r0
00093836  bne     #0x93868
00093838  ldr     r1, [sp, #0x40]
0009383a  str     r1, [sp, #4]
0009383c  add     r0, sp, #0x84
0009383e  movs    r3, #0
00093840  str     r3, [sp, #0x54]
00093842  bl      #0x8d4bc ; -> ZN6Mayhem11HTTPRequestD1Ev
00093846  ldr     r0, [sp, #4]
00093848  mov.w   r3, #-1
0009384c  str     r3, [sp, #0x54]
0009384e  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00093852  ldr     r3, [sp, #0xac]
00093854  ldr     r4, [sp, #0x48]
00093856  ldr     r2, [sp, #4]
00093858  sub.w   r0, r3, #0xc
0009385c  cmp     r4, r0
0009385e  str     r2, [sp, #0x3c]
00093860  bne     #0x938b6
00093862  ldr     r1, [sp, #0x3c]
00093864  str     r1, [sp, #4]
00093866  b       #0x93846
00093868  subs    r2, r3, #4
0009386a  ldr     r3, [r3, #-0x4]
0009386e  subs    r1, r3, #1
00093870  dmb     ish
00093874  mov     ip, r3
00093876  ldrex   r4, [r2]
0009387a  cmp     r4, r3
0009387c  beq     #0x9391c
0009387e  cmp     r4, ip
00093880  mov     r3, r4
00093882  bne     #0x9386e
00093884  cmp     r4, #0
00093886  bgt     #0x93838
00093888  add.w   r1, sp, #0xb5
0009388c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00093890  b       #0x93838
00093892  ldr     r3, [pc, #0x104]
00093894  ldr     r2, [sp, #0x44]
00093896  ldr     r1, [sp, #4]
00093898  add     r3, pc ; -> 0x000f3370  0x0
0009389a  sub.w   r0, r2, #0xc
0009389e  ldr     r3, [r3]
000938a0  str     r1, [sp, #0x38]
000938a2  cmp     r0, r3
000938a4  bne     #0x938e2
000938a6  ldr     r1, [sp, #0x38]
000938a8  mov.w   r3, #-1
000938ac  str     r3, [sp, #0x54]
000938ae  mov     r0, r1
000938b0  str     r1, [sp, #4]
000938b2  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
000938b6  subs    r2, r3, #4
000938b8  ldr     r3, [r3, #-0x4]
000938bc  subs    r1, r3, #1
000938be  dmb     ish
000938c2  mov     ip, r3
000938c4  ldrex   lr, [r2]
000938c8  cmp     lr, r3
000938ca  beq     #0x9390e
000938cc  cmp     lr, ip
000938ce  mov     r3, lr
000938d0  bne     #0x938bc
000938d2  cmp.w   lr, #0
000938d6  bgt     #0x93862
000938d8  add.w   r1, sp, #0xb7
000938dc  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000938e0  b       #0x93862
000938e2  ldr     r4, [sp, #0x44]
000938e4  subs    r2, #4
000938e6  ldr     r3, [r4, #-0x4]
000938ea  subs    r1, r3, #1
000938ec  dmb     ish
000938f0  mov     ip, r3
000938f2  ldrex   lr, [r2]
000938f6  cmp     lr, r3
000938f8  beq     #0x9392c
000938fa  cmp     lr, ip
000938fc  mov     r3, lr
000938fe  bne     #0x938ea
00093900  cmp.w   lr, #0
00093904  bgt     #0x938a6
00093906  add     r1, sp, #0xb8
00093908  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009390c  b       #0x938a6
0009390e  strex   r4, r1, [r2]
00093912  cmp     r4, #0
00093914  bne     #0x938c4
00093916  dmb     ish
0009391a  b       #0x938cc
0009391c  strex   lr, r1, [r2]
00093920  cmp.w   lr, #0
00093924  bne     #0x93876
00093926  dmb     ish
0009392a  b       #0x9387e
0009392c  strex   r4, r1, [r2]
00093930  cmp     r4, #0
00093932  bne     #0x938f2
00093934  dmb     ish
00093938  b       #0x938fa
0009393a  nop     
0009393c  cdp2    p0, #0xe, c0, c0, c5, #0
00093940  add     r7, sp, #0x20
00093942  movs    r5, r0
00093944  lsls    r4, r4, #0xa
00093946  movs    r0, r0
00093948  adr     r5, #0x378
0009394a  movs    r6, r0
0009394c  pop     {r2, r4, r5, r7}
0009394e  movs    r6, r1
00093950  str     r5, [sp, #0x58]
00093952  movs    r6, r0
00093954  ldc2    p0, c0, [r6, #0x14]!
00093958  ldr     r1, [sp, #0x260]
0009395a  movs    r6, r0
0009395c  ldr     r1, [sp, #0x218]
0009395e  movs    r6, r0
00093960  cmp     r0, #0x3c
00093962  movs    r6, r1
00093964  str     r3, [sp, #0xb0]
00093966  movs    r6, r0
00093968  adr     r5, #0x298
0009396a  movs    r6, r0
0009396c  str     r7, [sp, #0x3e8]
0009396e  movs    r6, r0
00093970  str     r3, [sp, #0x390]
00093972  movs    r6, r0
00093974  ldr     r1, [sp, #0x80]
00093976  movs    r6, r0
00093978  str     r5, [sp, #0x388]
0009397a  movs    r6, r0
0009397c  str     r7, [sp, #0x2f8]
0009397e  movs    r6, r0
00093980  ldr     r0, [sp, #0x3a0]
00093982  movs    r6, r0
00093984  str     r4, [sp, #0x40]
00093986  movs    r6, r0
00093988  cbnz    r6, #0x939b2
0009398a  movs    r6, r1
0009398c  ldr     r0, [sp, #0x2f8]
0009398e  movs    r6, r0
00093990  cbnz    r6, #0x939d6
00093992  movs    r6, r1
00093994  str     r3, [sp, #0xf0]
00093996  movs    r6, r0
