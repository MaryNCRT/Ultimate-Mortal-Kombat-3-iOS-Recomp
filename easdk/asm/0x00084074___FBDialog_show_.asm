========================================================================
-[FBDialog show]  0x00084074  1232 bytes   FBDialog.m
========================================================================

00084074  push    {r4, r5, r6, r7, lr}
00084076  add     r7, sp, #0xc
00084078  push.w  {r8, sl, fp}
0008407c  vpush   {d8, d9, d10, d11, d12}
00084080  sub     sp, #0x1c4
00084082  ldr.w   r1, [pc, #0x434]
00084086  mov     r4, r0
00084088  ldr.w   r8, [pc, #0x430]
0008408c  add     r1, pc ; -> 0x000fcc24  'xC\x0e'
0008408e  ldr.w   sl, [pc, #0x430]
00084092  ldr     r1, [r1]
00084094  blx     #0xddbfc ; -> objc_msgSend
00084098  ldr.w   r1, [pc, #0x428]
0008409c  mov     r0, r4
0008409e  movs    r2, #0
000840a0  add     r1, pc ; -> 0x000fcc30  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2b8
000840a2  add     r8, pc ; -> 0x000f51d0  OBJC_IVAR_$_FBDialog._iconView
000840a4  ldr     r1, [r1]
000840a6  blx     #0xddbfc ; -> objc_msgSend
000840aa  ldr.w   r2, [pc, #0x41c]
000840ae  add     r0, sp, #0x174
000840b0  mov     r1, r4
000840b2  add     r2, pc ; -> 0x000fc9bc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x44
000840b4  add     sl, pc ; -> 0x000f51d4  OBJC_IVAR_$_FBDialog._titleLabel
000840b6  ldr     r5, [r2]
000840b8  vmov.f32 s22, #1.800000e+01
000840bc  mov     r2, r5
000840be  blx     #0xddc14 ; -> objc_msgSend_stret
000840c2  ldr.w   r1, [pc, #0x408]
000840c6  ldr.w   r3, [r8]
000840ca  vldr    s14, [sp, #0x17c]
000840ce  add     r1, pc ; -> 0x000fcc20  '`2\x0e'
000840d0  vmov.f32 s12, #-2.200000e+01
000840d4  ldr     r1, [r1]
000840d6  ldr     r0, [r4, r3]
000840d8  str     r1, [sp, #0x18]
000840da  vadd.f32 d12, d7, d6
000840de  blx     #0xddbfc ; -> objc_msgSend
000840e2  ldr.w   r3, [sl]
000840e6  ldr     r1, [sp, #0x18]
000840e8  vmov.f32 s20, #8.000000e+00
000840ec  ldr     r0, [r4, r3]
000840ee  blx     #0xddbfc ; -> objc_msgSend
000840f2  ldr     r2, [pc, #0x3dc]
000840f4  ldr     r1, [sp, #0x18]
000840f6  add     r2, pc ; -> 0x000f51d8  OBJC_IVAR_$_FBDialog._closeButton
000840f8  str     r2, [sp, #0x14]
000840fa  ldr     r3, [r2]
000840fc  ldr     r0, [r4, r3]
000840fe  blx     #0xddbfc ; -> objc_msgSend
00084102  ldr.w   r3, [r8]
00084106  mov     r2, r5
00084108  add     r0, sp, #0x164
0008410a  ldr     r1, [r4, r3]
0008410c  blx     #0xddc14 ; -> objc_msgSend_stret
00084110  ldr.w   r3, [sl]
00084114  mov     r2, r5
00084116  vldr    s14, [sp, #0x16c]
0008411a  add     r0, sp, #0x154
0008411c  vadd.f32 d7, d7, d11
00084120  ldr     r1, [r4, r3]
00084122  vadd.f32 d9, d7, d10
00084126  blx     #0xddc14 ; -> objc_msgSend_stret
0008412a  ldr.w   r3, [r8]
0008412e  mov     r2, r5
00084130  add     r0, sp, #0x144
00084132  vldr    s16, [sp, #0x160]
00084136  ldr     r1, [r4, r3]
00084138  blx     #0xddc14 ; -> objc_msgSend_stret
0008413c  vmov.f32 s12, #1.600000e+01
00084140  ldr.w   r3, [sl]
00084144  vldr    s14, [sp, #0x14c]
00084148  vadd.f32 d7, d8, d7
0008414c  mov     r2, r5
0008414e  ldr     r1, [r4, r3]
00084150  add     r0, sp, #0x134
00084152  vadd.f32 d7, d7, d6
00084156  vsub.f32 d8, d12, d7
0008415a  blx     #0xddc14 ; -> objc_msgSend_stret
0008415e  ldr.w   r0, [sl]
00084162  vldr    s14, [sp, #0x140]
00084166  vadd.f32 d7, d7, d10
0008416a  vmov.f32 s20, #1.000000e+01
0008416e  ldr     r1, [pc, #0x364]
00084170  ldr.w   ip, [r4, r0]
00084174  add     r0, sp, #0x1bc
00084176  add     r1, pc ; -> 0x000fcd50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d8
00084178  vstr    s14, [sp, #0x1c0]
0008417c  ldr.w   fp, [r1]
00084180  vstr    s16, [sp, #0x1bc]
00084184  ldm     r0, {r0, r1}
00084186  add     r2, sp, #0x1b4
00084188  vstr    s18, [sp, #0x1b4]
0008418c  vstr    s20, [sp, #0x1b8]
00084190  stm.w   sp, {r0, r1}
00084194  mov     r0, ip
00084196  ldm     r2, {r2, r3}
00084198  mov     r1, fp
0008419a  blx     #0xddbfc ; -> objc_msgSend
0008419e  ldr.w   r3, [sl]
000841a2  mov     r2, r5
000841a4  add     r0, sp, #0x124
000841a6  ldr     r1, [r4, r3]
000841a8  blx     #0xddc14 ; -> objc_msgSend_stret
000841ac  vmov.f32 s12, #5.000000e-01
000841b0  ldr.w   r3, [r8]
000841b4  mov     r2, r5
000841b6  add     r0, sp, #0x114
000841b8  vldr    s14, [sp, #0x130]
000841bc  ldr     r1, [r4, r3]
000841be  vmul.f32 d8, d7, d6
000841c2  blx     #0xddc14 ; -> objc_msgSend_stret
000841c6  vmov.f32 s12, #-5.000000e-01
000841ca  vldr    s14, [sp, #0x120]
000841ce  vmul.f32 d7, d7, d6
000841d2  vadd.f32 d7, d8, d7
000841d6  vmov    r0, s14
000841da  blx     #0xdd7a0 ; -> floorf
000841de  ldr.w   r3, [r8]
000841e2  mov     r2, r5
000841e4  ldr     r1, [r4, r3]
000841e6  vmov    s14, r0
000841ea  add     r0, sp, #0x104
000841ec  vadd.f32 d8, d7, d10
000841f0  blx     #0xddc14 ; -> objc_msgSend_stret
000841f4  ldr.w   r3, [r8]
000841f8  mov     r2, r5
000841fa  add     r0, sp, #0xf4
000841fc  ldr     r6, [sp, #0x10c]
000841fe  ldr     r1, [r4, r3]
00084200  blx     #0xddc14 ; -> objc_msgSend_stret
00084204  ldr.w   r0, [r8]
00084208  ldr     r3, [sp, #0x100]
0008420a  str     r6, [sp, #0x1ac]
0008420c  add     r2, sp, #0x1a4
0008420e  ldr.w   ip, [r4, r0]
00084212  add     r0, sp, #0x1ac
00084214  str     r3, [sp, #0x1b0]
00084216  ldm     r0, {r0, r1}
00084218  vstr    s16, [sp, #0x1a8]
0008421c  vstr    s22, [sp, #0x1a4]
00084220  stm.w   sp, {r0, r1}
00084224  mov     r0, ip
00084226  ldm     r2, {r2, r3}
00084228  mov     r1, fp
0008422a  blx     #0xddbfc ; -> objc_msgSend
0008422e  mov     r2, r5
00084230  add     r0, sp, #0xe4
00084232  mov     r1, r4
00084234  blx     #0xddc14 ; -> objc_msgSend_stret
00084238  ldr.w   r3, [sl]
0008423c  mov     r2, r5
0008423e  add     r0, sp, #0xd4
00084240  vldr    s16, [sp, #0xec]
00084244  ldr     r1, [r4, r3]
00084246  blx     #0xddc14 ; -> objc_msgSend_stret
0008424a  ldr.w   r3, [sl]
0008424e  mov     r2, r5
00084250  vldr    s14, [sp, #0xe0]
00084254  add     r0, sp, #0xc4
00084256  vadd.f32 d7, d7, d10
0008425a  ldr     r1, [r4, r3]
0008425c  vsub.f32 d8, d8, d7
00084260  blx     #0xddc14 ; -> objc_msgSend_stret
00084264  ldr.w   r3, [sl]
00084268  mov     r2, r5
0008426a  add     r0, sp, #0xb4
0008426c  ldr     r6, [sp, #0xd0]
0008426e  ldr     r1, [r4, r3]
00084270  blx     #0xddc14 ; -> objc_msgSend_stret
00084274  add     r3, sp, #0xb4
00084276  str     r6, [sp, #0x19c]
00084278  ldr     r3, [r3, #0xc]
0008427a  add     r2, sp, #0x194
0008427c  vstr    s16, [sp, #0x194]
00084280  vstr    s20, [sp, #0x198]
00084284  str     r3, [sp, #0x1a0]
00084286  ldr     r3, [sp, #0x14]
00084288  ldr     r6, [pc, #0x24c]
0008428a  ldr     r0, [r3]
0008428c  add     r6, pc ; -> 0x000f51c8  OBJC_IVAR_$_FBDialog._webView
0008428e  ldr.w   ip, [r4, r0]
00084292  add     r0, sp, #0x19c
00084294  ldm     r0, {r0, r1}
00084296  stm.w   sp, {r0, r1}
0008429a  mov     r0, ip
0008429c  ldm     r2, {r2, r3}
0008429e  mov     r1, fp
000842a0  blx     #0xddbfc ; -> objc_msgSend
000842a4  ldr.w   r3, [sl]
000842a8  mov     r2, r5
000842aa  add     r0, sp, #0xa4
000842ac  ldr     r1, [r4, r3]
000842ae  blx     #0xddc14 ; -> objc_msgSend_stret
000842b2  mov     r2, r5
000842b4  add     r0, sp, #0x94
000842b6  mov     r1, r4
000842b8  add     r3, sp, #0xa4
000842ba  vldr    s14, [r3, #0xc]
000842be  vadd.f32 d9, d7, d10
000842c2  blx     #0xddc14 ; -> objc_msgSend_stret
000842c6  add     r3, sp, #0x94
000842c8  vldr    s16, [r3, #0xc]
000842cc  ldr.w   r3, [sl]
000842d0  mov     r2, r5
000842d2  add     r0, sp, #0x84
000842d4  ldr     r5, [pc, #0x204]
000842d6  ldr     r1, [r4, r3]
000842d8  blx     #0xddc14 ; -> objc_msgSend_stret
000842dc  vmov.f32 s12, #1.000000e+00
000842e0  add     r3, sp, #0x84
000842e2  vldr    s14, [r3, #0xc]
000842e6  ldr     r0, [r6]
000842e8  vstr    s24, [sp, #0x18c]
000842ec  ldr     r3, [pc, #0x1f0]
000842ee  add     r2, sp, #0x184
000842f0  ldr.w   ip, [r4, r0]
000842f4  add     r0, sp, #0x18c
000842f6  add     r5, pc ; -> 0x000f51cc  OBJC_IVAR_$_FBDialog._spinner
000842f8  vadd.f32 d7, d7, d6
000842fc  vmov.f32 s12, #2.000000e+01
00084300  vstr    s18, [sp, #0x188]
00084304  str     r3, [sp, #0x184]
00084306  vadd.f32 d7, d7, d6
0008430a  vsub.f32 d7, d8, d7
0008430e  vstr    s14, [sp, #0x190]
00084312  ldm     r0, {r0, r1}
00084314  stm.w   sp, {r0, r1}
00084318  mov     r0, ip
0008431a  ldm     r2, {r2, r3}
0008431c  mov     r1, fp
0008431e  blx     #0xddbfc ; -> objc_msgSend
00084322  ldr     r3, [r5]
00084324  ldr     r1, [sp, #0x18]
00084326  ldr     r0, [r4, r3]
00084328  blx     #0xddbfc ; -> objc_msgSend
0008432c  ldr     r1, [pc, #0x1b4]
0008432e  ldr     r3, [r5]
00084330  add     r1, pc ; -> 0x000fcc1c  'b+\x0e'
00084332  ldr     r0, [r4, r3]
00084334  ldr     r1, [r1]
00084336  blx     #0xddbfc ; -> objc_msgSend
0008433a  ldr     r2, [pc, #0x1ac]
0008433c  ldr     r3, [r6]
0008433e  add     r0, sp, #0x1c
00084340  add     r2, pc ; -> 0x000fcc0c  'X+\x0e'
00084342  ldr     r1, [r4, r3]
00084344  ldr     r2, [r2]
00084346  blx     #0xddc14 ; -> objc_msgSend_stret
0008434a  ldr     r1, [r5]
0008434c  add     r2, sp, #0x1c
0008434e  ldm     r2, {r2, r3}
00084350  ldr     r0, [r4, r1]
00084352  ldr     r1, [pc, #0x198]
00084354  add     r1, pc ; -> 0x000fcd4c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d4
00084356  ldr     r1, [r1]
00084358  blx     #0xddbfc ; -> objc_msgSend
0008435c  ldr     r0, [pc, #0x190]
0008435e  ldr     r1, [pc, #0x194]
00084360  add     r0, pc ; -> 0x000fdb80  
00084362  add     r1, pc ; -> 0x000fcb00  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x188
00084364  ldr.w   r8, [r0]
00084368  ldr     r6, [r1]
0008436a  mov     r0, r8
0008436c  mov     r1, r6
0008436e  blx     #0xddbfc ; -> objc_msgSend
00084372  ldr     r1, [pc, #0x184]
00084374  add     r1, pc ; -> 0x000fcc08  'N+\x0e'
00084376  ldr     r1, [r1]
00084378  blx     #0xddbfc ; -> objc_msgSend
0008437c  mov     r5, r0
0008437e  cmp     r0, #0
00084380  beq.w   #0x84496
00084384  ldr     r1, [pc, #0x174]
00084386  mov     r2, r4
00084388  mov     r0, r5
0008438a  add     r1, pc ; -> 0x000fcb44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1cc
0008438c  add     r5, sp, #0x3c
0008438e  ldr     r1, [r1]
00084390  blx     #0xddbfc ; -> objc_msgSend
00084394  ldr.w   r1, [pc, #0x168]
00084398  mov     r0, r4
0008439a  add     r6, sp, #0x6c
0008439c  add     r1, pc ; -> 0x000fcc18  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2a0
0008439e  ldr     r1, [r1]
000843a0  blx     #0xddbfc ; -> objc_msgSend
000843a4  ldr     r2, [pc, #0x15c]
000843a6  add     r0, sp, #0x3c
000843a8  mov     r1, r4
000843aa  add     r2, pc ; -> 0x000fcd48  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d0
000843ac  ldr.w   r8, [r2]
000843b0  mov     r2, r8
000843b2  blx     #0xddc14 ; -> objc_msgSend_stret
000843b6  ldr     r3, [pc, #0x150]
000843b8  add     r0, sp, #0x48
000843ba  str     r3, [sp, #0xc]
000843bc  str     r3, [sp, #0x10]
000843be  ldm     r0, {r0, r1, r2}
000843c0  stm.w   sp, {r0, r1, r2}
000843c4  add     r0, sp, #0x6c
000843c6  ldm.w   r5, {r1, r2, r3}
000843ca  blx     #0xdd224 ; -> CGAffineTransformScale
000843ce  ldr     r1, [pc, #0x13c]
000843d0  add     r0, sp, #0x74
000843d2  add     r5, sp, #0x24
000843d4  add     r1, pc ; -> 0x000fcd54  '\x12}\x0e'
000843d6  ldr.w   sl, [r1]
000843da  ldm     r0, {r0, r1, r2, r3}
000843dc  stm.w   sp, {r0, r1, r2, r3}
000843e0  mov     r0, r4
000843e2  ldm.w   r6, {r2, r3}
000843e6  mov     r1, sl
000843e8  blx     #0xddbfc ; -> objc_msgSend
000843ec  ldr     r0, [pc, #0x120]
000843ee  ldr     r1, [pc, #0x124]
000843f0  movs    r2, #0
000843f2  add     r0, pc ; -> 0x000fdbb8  
000843f4  add     r1, pc ; -> 0x000fcd3c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3c4
000843f6  ldr     r6, [r0]
000843f8  mov     r3, r2
000843fa  ldr     r1, [r1]
000843fc  mov     r0, r6
000843fe  blx     #0xddbfc ; -> objc_msgSend
00084402  ldr     r1, [pc, #0x114]
00084404  ldr     r3, [pc, #0x114]
00084406  mov     r0, r6
00084408  add     r1, pc ; -> 0x000fcd38  'k.\x0e'
0008440a  ldr     r2, [pc, #0x114]
0008440c  ldr     r1, [r1]
0008440e  blx     #0xddbfc ; -> objc_msgSend
00084412  ldr     r1, [pc, #0x110]
00084414  mov     r0, r6
00084416  mov     r2, r4
00084418  add     r1, pc ; -> 0x000fcd34  'U.\x0e'
0008441a  ldr     r1, [r1]
0008441c  blx     #0xddbfc ; -> objc_msgSend
00084420  ldr     r1, [pc, #0x104]
00084422  ldr     r2, [pc, #0x108]
00084424  mov     r0, r6
00084426  add     r1, pc ; -> 0x000fcd2c  '8.\x0e'
00084428  add     r2, pc ; -> 0x000fcc14  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x29c
0008442a  ldr     r1, [r1]
0008442c  ldr     r2, [r2]
0008442e  blx     #0xddbfc ; -> objc_msgSend
00084432  add     r0, sp, #0x24
00084434  mov     r1, r4
00084436  mov     r2, r8
00084438  blx     #0xddc14 ; -> objc_msgSend_stret
0008443c  ldr     r3, [pc, #0xf0]
0008443e  add     r0, sp, #0x30
00084440  add.w   r8, sp, #0x54
00084444  str     r3, [sp, #0xc]
00084446  str     r3, [sp, #0x10]
00084448  ldm     r0, {r0, r1, r2}
0008444a  stm.w   sp, {r0, r1, r2}
0008444e  add     r0, sp, #0x54
00084450  ldm.w   r5, {r1, r2, r3}
00084454  blx     #0xdd224 ; -> CGAffineTransformScale
00084458  add     r0, sp, #0x5c
0008445a  ldm     r0, {r0, r1, r2, r3}
0008445c  stm.w   sp, {r0, r1, r2, r3}
00084460  mov     r0, r4
00084462  ldm.w   r8, {r2, r3}
00084466  mov     r1, sl
00084468  blx     #0xddbfc ; -> objc_msgSend
0008446c  ldr     r1, [pc, #0xc4]
0008446e  mov     r0, r6
00084470  add     r1, pc ; -> 0x000fcd28  "'.\x0e"
00084472  ldr     r1, [r1]
00084474  blx     #0xddbfc ; -> objc_msgSend
00084478  ldr     r1, [pc, #0xbc]
0008447a  mov     r0, r4
0008447c  add     r1, pc ; -> 0x000fcc10  'Z(\x0e'
0008447e  ldr     r1, [r1]
00084480  blx     #0xddbfc ; -> objc_msgSend
00084484  sub.w   sp, r7, #0x40
00084488  vpop    {d8, d9, d10, d11, d12}
0008448c  sub.w   sp, r7, #0x18
00084490  pop.w   {r8, sl, fp}
00084494  pop     {r4, r5, r6, r7, pc}
00084496  mov     r1, r6
00084498  mov     r0, r8
0008449a  blx     #0xddbfc ; -> objc_msgSend
0008449e  ldr     r1, [pc, #0x9c]
000844a0  add     r1, pc ; -> 0x000fcc04  'F+\x0e'
000844a2  ldr     r1, [r1]
000844a4  blx     #0xddbfc ; -> objc_msgSend
000844a8  ldr     r1, [pc, #0x94]
000844aa  mov     r2, r5
000844ac  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000844ae  ldr     r1, [r1]
000844b0  blx     #0xddbfc ; -> objc_msgSend
000844b4  mov     r5, r0
000844b6  b       #0x84384
000844b8  ldrh    r4, [r2, #0x1c]
000844ba  movs    r7, r0
000844bc  asrs    r2, r5, #4
000844be  movs    r7, r0
000844c0  asrs    r4, r3, #4
000844c2  movs    r7, r0
000844c4  ldrh    r4, [r1, #0x1c]
000844c6  movs    r7, r0
000844c8  ldrh    r6, [r0, #8]
000844ca  movs    r7, r0
000844cc  ldrh    r6, [r1, #0x1a]
000844ce  movs    r7, r0
000844d0  asrs    r6, r3, #3
000844d2  movs    r7, r0
000844d4  ldrh    r6, [r2, #0x1e]
000844d6  movs    r7, r0
000844d8  lsrs    r0, r7, #0x1c
000844da  movs    r7, r0
000844dc  lsrs    r2, r2, #0x1b
000844de  movs    r7, r0
000844e0  movs    r0, r0
000844e2  asrs    r0, r6
000844e4  ldrh    r0, [r5, #6]
000844e6  movs    r7, r0
000844e8  ldrh    r0, [r1, #6]
000844ea  movs    r7, r0
000844ec  ldrh    r4, [r6, #0xe]
000844ee  movs    r7, r0
000844f0  ldr     r0, [sp, #0x70]
000844f2  movs    r7, r0
000844f4  strh    r2, [r3, #0x3c]
000844f6  movs    r7, r0
000844f8  ldrh    r0, [r2, #4]
000844fa  movs    r7, r0
000844fc  strh    r6, [r6, #0x3c]
000844fe  movs    r7, r0
00084500  ldrh    r0, [r7, #2]
00084502  movs    r7, r0
00084504  ldrh    r2, [r3, #0xc]
00084506  movs    r7, r0
00084508  asrs    r7, r5, #9
0008450a  subs    r2, #0x83
0008450c  ldrh    r4, [r7, #0xa]
0008450e  movs    r7, r0
00084510  str     r7, [sp, #0x308]
00084512  movs    r7, r0
00084514  ldrh    r4, [r0, #0xa]
00084516  movs    r7, r0
00084518  ldrh    r4, [r5, #8]
0008451a  movs    r7, r0
0008451c  ldr     r1, [sp, #0x264]
0008451e  subs    r7, #0xc9
00084520  add     r2, sp, #0x2ac
00084522  add     r2, sp, #0x2a8
00084524  ldrh    r0, [r3, #8]
00084526  movs    r7, r0
00084528  ldrh    r2, [r0, #8]
0008452a  movs    r7, r0
0008452c  strh    r0, [r5, #0x3e]
0008452e  movs    r7, r0
00084530  ldm     r4!, {r0, r2, r3, r6, r7}
00084532  subs    r7, #0x8c
00084534  ldrh    r4, [r6, #4]
00084536  movs    r7, r0
00084538  strh    r0, [r2, #0x3c]
0008453a  movs    r7, r0
0008453c  strh    r0, [r4, #0x3a]
0008453e  movs    r7, r0
00084540  strh    r4, [r1, #0x2e]
00084542  movs    r7, r0
