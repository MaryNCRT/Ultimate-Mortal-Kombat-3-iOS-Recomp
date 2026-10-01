========================================================================
-[Facebook dialog  0x000da650  444 bytes   Facebook.m
========================================================================

000da650  push    {r4, r5, r6, r7, lr}
000da652  add     r7, sp, #0xc
000da654  push.w  {r8, sl, fp}
000da658  sub     sp, #4
000da65a  ldr.w   r8, [pc, #0x138]
000da65e  ldr     r1, [pc, #0x138]
000da660  mov     r5, r3
000da662  add     r8, pc ; -> 0x000fc518  OBJC_IVAR_$_Facebook._fbDialog
000da664  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000da666  ldr.w   r3, [r8]
000da66a  ldr     r1, [r1]
000da66c  mov     r6, r0
000da66e  mov     sl, r2
000da670  ldr     r0, [r0, r3]
000da672  blx     #0xddbfc ; -> objc_msgSend
000da676  ldr     r0, [pc, #0x124]
000da678  ldr     r1, [pc, #0x124]
000da67a  mov     r2, sl
000da67c  add     r0, pc ; -> 0x0017e120  kDialogBaseURL
000da67e  add     r1, pc ; -> 0x000fcfe4  
000da680  ldr     r0, [r0]
000da682  ldr     r1, [r1]
000da684  blx     #0xddbfc ; -> objc_msgSend
000da688  ldr     r1, [pc, #0x118]
000da68a  ldr     r2, [pc, #0x11c]
000da68c  ldr     r3, [pc, #0x11c]
000da68e  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000da690  add     r2, pc ; -> 0x0017e9c4  
000da692  ldr     r4, [r1]
000da694  add     r3, pc ; -> 0x0017ea74  
000da696  mov     r1, r4
000da698  mov     fp, r0
000da69a  mov     r0, r5
000da69c  blx     #0xddbfc ; -> objc_msgSend
000da6a0  ldr     r2, [pc, #0x10c]
000da6a2  ldr     r3, [pc, #0x110]
000da6a4  mov     r0, r5
000da6a6  add     r2, pc ; -> 0x0017e118  kSDKVersion
000da6a8  add     r3, pc ; -> 0x00182964  
000da6aa  ldr     r2, [r2]
000da6ac  mov     r1, r4
000da6ae  blx     #0xddbfc ; -> objc_msgSend
000da6b2  ldr     r2, [pc, #0x104]
000da6b4  ldr     r3, [pc, #0x104]
000da6b6  mov     r0, r5
000da6b8  add     r2, pc ; -> 0x0017e11c  kRedirectURL
000da6ba  add     r3, pc ; -> 0x00182974  
000da6bc  ldr     r2, [r2]
000da6be  mov     r1, r4
000da6c0  blx     #0xddbfc ; -> objc_msgSend
000da6c4  ldr     r3, [pc, #0xf8]
000da6c6  add     r3, pc ; -> 0x0017e124  kLogin
000da6c8  ldr     r3, [r3]
000da6ca  cmp     sl, r3
000da6cc  bne     #0xda6fc
000da6ce  ldr     r2, [pc, #0xf4]
000da6d0  ldr     r3, [pc, #0xf4]
000da6d2  mov     r1, r4
000da6d4  add     r2, pc ; -> 0x00182984  
000da6d6  add     r3, pc ; -> 0x0017e754  
000da6d8  mov     r0, r5
000da6da  blx     #0xddbfc ; -> objc_msgSend
000da6de  ldr     r0, [pc, #0xec]
000da6e0  ldr     r1, [pc, #0xec]
000da6e2  ldr.w   r4, [r8]
000da6e6  add     r0, pc ; -> 0x000fdbec  
000da6e8  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000da6ea  ldr     r0, [r0]
000da6ec  ldr     r1, [r1]
000da6ee  blx     #0xddbfc ; -> objc_msgSend
000da6f2  ldr     r1, [pc, #0xe0]
000da6f4  str     r6, [sp]
000da6f6  add     r1, pc ; -> 0x000fdae4  
000da6f8  ldr     r1, [r1]
000da6fa  b       #0xda76e
000da6fc  ldr     r2, [pc, #0xd8]
000da6fe  ldr     r3, [pc, #0xdc]
000da700  mov     r0, r5
000da702  add     r2, pc ; -> 0x000fc51c  OBJC_IVAR_$_Facebook._appId
000da704  add     r3, pc ; -> 0x00182994  
000da706  ldr     r2, [r2]
000da708  mov     r1, r4
000da70a  ldr     r2, [r6, r2]
000da70c  blx     #0xddbfc ; -> objc_msgSend
000da710  ldr     r1, [pc, #0xcc]
000da712  mov     r0, r6
000da714  add     r1, pc ; -> 0x000fd9e0  
000da716  ldr     r1, [r1]
000da718  blx     #0xddbfc ; -> objc_msgSend
000da71c  tst.w   r0, #0xff
000da720  beq     #0xda74e
000da722  ldr     r1, [pc, #0xc0]
000da724  mov     r0, r6
000da726  add     r1, pc ; -> 0x000fd5e0  
000da728  ldr     r4, [r1]
000da72a  ldr     r1, [pc, #0xbc]
000da72c  add     r1, pc ; -> 0x000fd9c8  '\x13\x1c\x0f'
000da72e  ldr     r1, [r1]
000da730  blx     #0xddbfc ; -> objc_msgSend
000da734  ldr     r1, [pc, #0xb4]
000da736  movs    r2, #4
000da738  add     r1, pc ; -> 0x000fd774  
000da73a  ldr     r1, [r1]
000da73c  blx     #0xddbfc ; -> objc_msgSend
000da740  ldr     r3, [pc, #0xac]
000da742  mov     r1, r4
000da744  add     r3, pc ; -> 0x001829a4  
000da746  mov     r2, r0
000da748  mov     r0, r5
000da74a  blx     #0xddbfc ; -> objc_msgSend
000da74e  ldr     r0, [pc, #0xa4]
000da750  ldr     r1, [pc, #0xa4]
000da752  ldr     r3, [pc, #0xa8]
000da754  add     r0, pc ; -> 0x000fdd14  
000da756  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000da758  add     r3, pc ; -> 0x000fc518  OBJC_IVAR_$_Facebook._fbDialog
000da75a  ldr     r1, [r1]
000da75c  ldr     r0, [r0]
000da75e  ldr     r4, [r3]
000da760  blx     #0xddbfc ; -> objc_msgSend
000da764  ldr     r1, [pc, #0x98]
000da766  ldr     r3, [sp, #0x24]
000da768  add     r1, pc ; -> 0x000fdab8  
000da76a  ldr     r1, [r1]
000da76c  str     r3, [sp]
000da76e  mov     r3, r5
000da770  mov     r2, fp
000da772  blx     #0xddbfc ; -> objc_msgSend
000da776  ldr     r3, [pc, #0x8c]
000da778  ldr     r1, [pc, #0x8c]
000da77a  add     r3, pc ; -> 0x000fc518  OBJC_IVAR_$_Facebook._fbDialog
000da77c  add     r1, pc ; -> 0x000fcd8c  
000da77e  ldr     r1, [r1]
000da780  str     r0, [r6, r4]
000da782  ldr     r0, [r3]
000da784  ldr     r0, [r6, r0]
000da786  blx     #0xddbfc ; -> objc_msgSend
000da78a  sub.w   sp, r7, #0x18
000da78e  pop.w   {r8, sl, fp}
000da792  pop     {r4, r5, r6, r7, pc}
000da794  subs    r2, r6, #2
000da796  movs    r2, r0
000da798  movs    r3, #0x14
000da79a  movs    r2, r0
000da79c  subs    r2, #0xa0
000da79e  movs    r2, r1
000da7a0  cmp     r1, #0x62
000da7a2  movs    r2, r0
000da7a4  movs    r4, #0x46
000da7a6  movs    r2, r0
000da7a8  orrs    r0, r6
000da7aa  movs    r2, r1
000da7ac  mvns    r4, r3
000da7ae  movs    r2, r1
000da7b0  subs    r2, #0x6e
000da7b2  movs    r2, r1
000da7b4  strh    r0, [r7, #0x14]
000da7b6  movs    r2, r1
000da7b8  subs    r2, #0x60
000da7ba  movs    r2, r1
000da7bc  strh    r6, [r6, #0x14]
000da7be  movs    r2, r1
000da7c0  subs    r2, #0x5a
000da7c2  movs    r2, r1
000da7c4  strh    r4, [r5, #0x14]
000da7c6  movs    r2, r1
000da7c8  eors    r2, r7
000da7ca  movs    r2, r1
000da7cc  adds    r5, #2
000da7ce  movs    r2, r0
000da7d0  movs    r2, #0x98
000da7d2  movs    r2, r0
000da7d4  adds    r3, #0xea
000da7d6  movs    r2, r0
000da7d8  subs    r6, r2, #0
000da7da  movs    r2, r0
000da7dc  strh    r4, [r1, #0x14]
000da7de  movs    r2, r1
000da7e0  adds    r2, #0xc8
000da7e2  movs    r2, r0
000da7e4  cmp     r6, #0xb6
000da7e6  movs    r2, r0
000da7e8  adds    r2, #0x98
000da7ea  movs    r2, r0
000da7ec  adds    r0, #0x38
000da7ee  movs    r2, r0
000da7f0  strh    r4, [r3, #0x12]
000da7f2  movs    r2, r1
000da7f4  adds    r5, #0xbc
000da7f6  movs    r2, r0
000da7f8  movs    r2, #0x2a
000da7fa  movs    r2, r0
000da7fc  adds    r4, r7, #6
000da7fe  movs    r2, r0
000da800  adds    r3, #0x4c
000da802  movs    r2, r0
000da804  adds    r2, r3, #6
000da806  movs    r2, r0
000da808  movs    r6, #0xc
000da80a  movs    r2, r0
