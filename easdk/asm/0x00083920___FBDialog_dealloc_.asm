========================================================================
-[FBDialog dealloc]  0x00083920  200 bytes   FBDialog.m
========================================================================

00083920  push    {r4, r5, r7, lr}
00083922  add     r7, sp, #8
00083924  sub     sp, #8
00083926  ldr     r4, [pc, #0x94]
00083928  ldr     r1, [pc, #0x94]
0008392a  mov     r5, r0
0008392c  add     r4, pc ; -> 0x000f51c8  OBJC_IVAR_$_FBDialog._webView
0008392e  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
00083930  ldr     r3, [r4]
00083932  movs    r2, #0
00083934  ldr     r1, [r1]
00083936  ldr     r0, [r0, r3]
00083938  blx     #0xddbfc ; -> objc_msgSend
0008393c  ldr     r1, [pc, #0x84]
0008393e  ldr     r3, [r4]
00083940  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
00083942  ldr     r4, [r1]
00083944  ldr     r0, [r5, r3]
00083946  mov     r1, r4
00083948  blx     #0xddbfc ; -> objc_msgSend
0008394c  ldr     r3, [pc, #0x78]
0008394e  mov     r1, r4
00083950  add     r3, pc ; -> 0x000f51cc  OBJC_IVAR_$_FBDialog._spinner
00083952  ldr     r3, [r3]
00083954  ldr     r0, [r5, r3]
00083956  blx     #0xddbfc ; -> objc_msgSend
0008395a  ldr     r3, [pc, #0x70]
0008395c  mov     r1, r4
0008395e  add     r3, pc ; -> 0x000f51d4  OBJC_IVAR_$_FBDialog._titleLabel
00083960  ldr     r3, [r3]
00083962  ldr     r0, [r5, r3]
00083964  blx     #0xddbfc ; -> objc_msgSend
00083968  ldr     r3, [pc, #0x64]
0008396a  mov     r1, r4
0008396c  add     r3, pc ; -> 0x000f51d0  OBJC_IVAR_$_FBDialog._iconView
0008396e  ldr     r3, [r3]
00083970  ldr     r0, [r5, r3]
00083972  blx     #0xddbfc ; -> objc_msgSend
00083976  ldr     r3, [pc, #0x5c]
00083978  mov     r1, r4
0008397a  add     r3, pc ; -> 0x000f51d8  OBJC_IVAR_$_FBDialog._closeButton
0008397c  ldr     r3, [r3]
0008397e  ldr     r0, [r5, r3]
00083980  blx     #0xddbfc ; -> objc_msgSend
00083984  ldr     r3, [pc, #0x50]
00083986  mov     r1, r4
00083988  add     r3, pc ; -> 0x000f51c4  OBJC_IVAR_$_FBDialog._loadingURL
0008398a  ldr     r3, [r3]
0008398c  ldr     r0, [r5, r3]
0008398e  blx     #0xddbfc ; -> objc_msgSend
00083992  ldr     r3, [pc, #0x48]
00083994  mov     r1, r4
00083996  add     r3, pc ; -> 0x000f51c0  OBJC_IVAR_$_FBDialog._session
00083998  ldr     r3, [r3]
0008399a  ldr     r0, [r5, r3]
0008399c  blx     #0xddbfc ; -> objc_msgSend
000839a0  ldr     r3, [pc, #0x3c]
000839a2  ldr     r1, [pc, #0x40]
000839a4  mov     r0, sp
000839a6  add     r3, pc ; -> 0x000fdd38  
000839a8  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000839aa  ldr     r3, [r3]
000839ac  ldr     r1, [r1]
000839ae  str     r5, [sp]
000839b0  str     r3, [sp, #4]
000839b2  blx     #0xddc08 ; -> objc_msgSendSuper2
000839b6  sub.w   sp, r7, #8
000839ba  pop     {r4, r5, r7, pc}
000839bc  adds    r0, r3, r2
000839be  movs    r7, r0
000839c0  str     r3, [sp, #0x118]
000839c2  movs    r7, r0
000839c4  str     r0, [sp, #0xe0]
000839c6  movs    r7, r0
000839c8  adds    r0, r7, r1
000839ca  movs    r7, r0
000839cc  adds    r2, r6, r1
000839ce  movs    r7, r0
000839d0  adds    r0, r4, r1
000839d2  movs    r7, r0
000839d4  adds    r2, r3, r1
000839d6  movs    r7, r0
000839d8  adds    r0, r7, r0
000839da  movs    r7, r0
000839dc  adds    r6, r4, r0
000839de  movs    r7, r0
000839e0  adr     r3, #0x238
000839e2  movs    r7, r0
000839e4  ldrh    r4, [r6, #0x3e]
000839e6  movs    r7, r0
