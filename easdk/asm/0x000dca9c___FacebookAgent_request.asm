========================================================================
-[FacebookAgent request  0x000dca9c  564 bytes   FacebookAgent.mm
========================================================================

000dca9c  push    {r4, r5, r6, r7, lr}
000dca9e  add     r7, sp, #0xc
000dcaa0  str     r8, [sp, #-0x4]!
000dcaa4  ldr     r1, [pc, #0x1a4]
000dcaa6  mov     r4, r0
000dcaa8  ldr     r0, [pc, #0x1a4]
000dcaaa  ldr     r2, [pc, #0x1a8]
000dcaac  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000dcaae  add     r0, pc ; -> 0x000fdb5c  
000dcab0  add     r2, pc ; -> 0x00182634  
000dcab2  ldr     r1, [r1]
000dcab4  ldr     r0, [r0]
000dcab6  blx     #0xddbfc ; -> objc_msgSend
000dcaba  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000dcabe  ldr     r3, [pc, #0x198]
000dcac0  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dcac2  ldr     r2, [r3]
000dcac4  ldr     r3, [r4, r2]
000dcac6  cmp     r3, #1
000dcac8  bne     #0xdcae2
000dcaca  ldr     r5, [pc, #0x190]
000dcacc  ldr     r1, [pc, #0x190]
000dcace  subs    r3, #1
000dcad0  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dcad2  str     r3, [r4, r2]
000dcad4  ldr     r3, [r5]
000dcad6  add     r1, pc ; -> 0x000fd9a0  
000dcad8  ldr     r6, [r1]
000dcada  ldr     r1, [pc, #0x188]
000dcadc  ldr     r0, [r4, r3]
000dcade  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dcae0  b       #0xdcc2c
000dcae2  cmp     r3, #2
000dcae4  bne     #0xdcafe
000dcae6  ldr     r5, [pc, #0x180]
000dcae8  ldr     r1, [pc, #0x180]
000dcaea  subs    r3, #2
000dcaec  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dcaee  str     r3, [r4, r2]
000dcaf0  ldr     r3, [r5]
000dcaf2  add     r1, pc ; -> 0x000fd980  
000dcaf4  ldr     r6, [r1]
000dcaf6  ldr     r1, [pc, #0x178]
000dcaf8  ldr     r0, [r4, r3]
000dcafa  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dcafc  b       #0xdcc2c
000dcafe  cmp     r3, #3
000dcb00  bne     #0xdcb1a
000dcb02  ldr     r5, [pc, #0x170]
000dcb04  ldr     r1, [pc, #0x170]
000dcb06  subs    r3, #3
000dcb08  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dcb0a  str     r3, [r4, r2]
000dcb0c  ldr     r3, [r5]
000dcb0e  add     r1, pc ; -> 0x000fd97c  
000dcb10  ldr     r6, [r1]
000dcb12  ldr     r1, [pc, #0x168]
000dcb14  ldr     r0, [r4, r3]
000dcb16  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dcb18  b       #0xdcc2c
000dcb1a  cmp     r3, #8
000dcb1c  bne     #0xdcb78
000dcb1e  ldr     r3, [pc, #0x160]
000dcb20  movs    r6, #0
000dcb22  add     r3, pc ; -> 0x000fc8c4  OBJC_IVAR_$_FacebookAgent.hasOfflinePermission
000dcb24  ldr     r3, [r3]
000dcb26  strb    r6, [r4, r3]
000dcb28  ldr     r3, [pc, #0x158]
000dcb2a  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dcb2c  ldr     r3, [r3]
000dcb2e  str     r6, [r4, r3]
000dcb30  ldr     r3, [pc, #0x154]
000dcb32  add     r3, pc ; -> 0x000fc8cc  OBJC_IVAR_$_FacebookAgent.permissionRequested
000dcb34  ldr     r2, [r3]
000dcb36  ldrsb   r2, [r4, r2]
000dcb38  cbz     r2, #0xdcb68
000dcb3a  ldr     r1, [pc, #0x150]
000dcb3c  ldr     r5, [pc, #0x150]
000dcb3e  add     r1, pc ; -> 0x000fd9a4  '\x10\x0b\x0f'
000dcb40  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dcb42  ldr.w   r8, [r1]
000dcb46  ldr     r1, [pc, #0x14c]
000dcb48  ldr     r3, [r5]
000dcb4a  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dcb4c  mov     r2, r8
000dcb4e  ldr     r0, [r4, r3]
000dcb50  ldr     r1, [r1]
000dcb52  blx     #0xddbfc ; -> objc_msgSend
000dcb56  tst.w   r0, #0xff
000dcb5a  beq     #0xdcc44
000dcb5c  ldr     r0, [r5]
000dcb5e  movs    r3, #1
000dcb60  mov     r1, r8
000dcb62  mov     r2, r6
000dcb64  ldr     r0, [r4, r0]
000dcb66  b       #0xdcbc4
000dcb68  ldr     r1, [pc, #0x12c]
000dcb6a  mov     r0, r4
000dcb6c  mov     r3, r2
000dcb6e  add     r1, pc ; -> 0x000fd9ac  'i\x1b\x0f'
000dcb70  ldr     r1, [r1]
000dcb72  blx     #0xddbfc ; -> objc_msgSend
000dcb76  b       #0xdcc44
000dcb78  cmp     r3, #7
000dcb7a  bne     #0xdcbd8
000dcb7c  ldr     r3, [pc, #0x11c]
000dcb7e  movs    r6, #0
000dcb80  add     r3, pc ; -> 0x000fc8c0  OBJC_IVAR_$_FacebookAgent.hasPublishPermission
000dcb82  ldr     r3, [r3]
000dcb84  strb    r6, [r4, r3]
000dcb86  ldr     r3, [pc, #0x118]
000dcb88  add     r3, pc ; -> 0x000fc8cc  OBJC_IVAR_$_FacebookAgent.permissionRequested
000dcb8a  ldr     r3, [r3]
000dcb8c  ldrsb   r3, [r4, r3]
000dcb8e  cbz     r3, #0xdcbca
000dcb90  ldr     r3, [pc, #0x110]
000dcb92  ldr     r1, [pc, #0x114]
000dcb94  ldr     r5, [pc, #0x114]
000dcb96  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dcb98  add     r1, pc ; -> 0x000fd9a4  '\x10\x0b\x0f'
000dcb9a  ldr     r3, [r3]
000dcb9c  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dcb9e  ldr.w   r8, [r1]
000dcba2  ldr     r1, [pc, #0x10c]
000dcba4  str     r6, [r4, r3]
000dcba6  ldr     r3, [r5]
000dcba8  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dcbaa  mov     r2, r8
000dcbac  ldr     r1, [r1]
000dcbae  ldr     r0, [r4, r3]
000dcbb0  blx     #0xddbfc ; -> objc_msgSend
000dcbb4  tst.w   r0, #0xff
000dcbb8  beq     #0xdcc44
000dcbba  ldr     r0, [r5]
000dcbbc  mov     r1, r8
000dcbbe  mov     r2, r6
000dcbc0  mov     r3, r6
000dcbc2  ldr     r0, [r4, r0]
000dcbc4  blx     #0xddbfc ; -> objc_msgSend
000dcbc8  b       #0xdcc44
000dcbca  ldr     r1, [pc, #0xe8]
000dcbcc  mov     r0, r4
000dcbce  add     r1, pc ; -> 0x000fd98c  '}\x1b\x0f'
000dcbd0  ldr     r1, [r1]
000dcbd2  blx     #0xddbfc ; -> objc_msgSend
000dcbd6  b       #0xdcc44
000dcbd8  cmp     r3, #6
000dcbda  bne     #0xdcc12
000dcbdc  ldr     r1, [pc, #0xd8]
000dcbde  ldr     r5, [pc, #0xdc]
000dcbe0  mov.w   r8, #0
000dcbe4  add     r1, pc ; -> 0x000fd988  
000dcbe6  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dcbe8  ldr     r6, [r1]
000dcbea  ldr     r1, [pc, #0xd4]
000dcbec  str.w   r8, [r4, r2]
000dcbf0  ldr     r3, [r5]
000dcbf2  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dcbf4  mov     r2, r6
000dcbf6  ldr     r1, [r1]
000dcbf8  ldr     r0, [r4, r3]
000dcbfa  blx     #0xddbfc ; -> objc_msgSend
000dcbfe  tst.w   r0, #0xff
000dcc02  beq     #0xdcc44
000dcc04  ldr     r0, [r5]
000dcc06  mov     r1, r6
000dcc08  mov     r2, r8
000dcc0a  ldr     r0, [r4, r0]
000dcc0c  blx     #0xddbfc ; -> objc_msgSend
000dcc10  b       #0xdcc44
000dcc12  cmp     r3, #0xa
000dcc14  bne     #0xdcc44
000dcc16  ldr     r5, [pc, #0xac]
000dcc18  ldr     r1, [pc, #0xac]
000dcc1a  subs    r3, #0xa
000dcc1c  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dcc1e  str     r3, [r4, r2]
000dcc20  ldr     r3, [r5]
000dcc22  add     r1, pc ; -> 0x000fd9cc  
000dcc24  ldr     r6, [r1]
000dcc26  ldr     r1, [pc, #0xa4]
000dcc28  ldr     r0, [r4, r3]
000dcc2a  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dcc2c  ldr     r1, [r1]
000dcc2e  mov     r2, r6
000dcc30  blx     #0xddbfc ; -> objc_msgSend
000dcc34  tst.w   r0, #0xff
000dcc38  beq     #0xdcc44
000dcc3a  ldr     r0, [r5]
000dcc3c  mov     r1, r6
000dcc3e  ldr     r0, [r4, r0]
000dcc40  blx     #0xddbfc ; -> objc_msgSend
000dcc44  ldr     r8, [sp], #4
000dcc48  pop     {r4, r5, r6, r7, pc}
000dcc4a  nop     
000dcc4c  vrev64.8 d16, d1
000dcc50  asrs    r2, r5, #2
000dcc52  movs    r2, r0
000dcc54  ldrh    r0, [r0, r6]
000dcc56  movs    r2, r1
000dcc58  cdp2    p0, #0, c0, c4, c1, #0
000dcc5c  ldc2l   p0, c0, [ip, #4]
000dcc60  lsrs    r6, r0, #0x1b
000dcc62  movs    r2, r0
000dcc64  lsls    r6, r5, #6
000dcc66  movs    r2, r0
000dcc68  stc2l   p0, c0, [r0, #4]
000dcc6c  lsrs    r2, r1, #0x1a
000dcc6e  movs    r2, r0
000dcc70  lsls    r2, r2, #6
000dcc72  movs    r2, r0
000dcc74  stc2    p0, c0, [r4, #4]!
000dcc78  lsrs    r2, r5, #0x19
000dcc7a  movs    r2, r0
000dcc7c  lsls    r6, r6, #5
000dcc7e  movs    r2, r0
000dcc80  ldc2    p0, c0, [lr, #4]
000dcc84  ldc2    p0, c0, [sl, #4]
000dcc88  ldc2    p0, c0, [r6, #4]
000dcc8c  lsrs    r2, r4, #0x19
000dcc8e  movs    r2, r0
000dcc90  stc2l   p0, c0, [ip, #-4]!
000dcc94  lsls    r2, r0, #5
000dcc96  movs    r2, r0
000dcc98  lsrs    r2, r7, #0x18
000dcc9a  movs    r2, r0
000dcc9c  ldc2    p0, c0, [ip, #-4]!
000dcca0  stc2l   p0, c0, [r0, #-4]
000dcca4  stc2    p0, c0, [lr, #-4]!
000dcca8  lsrs    r0, r1, #0x18
000dccaa  movs    r2, r0
000dccac  ldc2    p0, c0, [r0, #-4]
000dccb0  lsls    r4, r4, #3
000dccb2  movs    r2, r0
000dccb4  lsrs    r2, r7, #0x16
000dccb6  movs    r2, r0
000dccb8  lsrs    r0, r4, #0x16
000dccba  movs    r2, r0
000dccbc  stc2l   p0, c0, [r6], {1}
000dccc0  lsls    r2, r3, #2
000dccc2  movs    r2, r0
000dccc4  ldc2    p0, c0, [r0], {1}
000dccc8  lsrs    r6, r4, #0x16
000dccca  movs    r2, r0
000dcccc  lsls    r2, r4, #1
000dccce  movs    r2, r0
