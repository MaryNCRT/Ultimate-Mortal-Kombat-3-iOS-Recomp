========================================================================
-[DMGViewController initDMGView  0x000d222c  1004 bytes   DMGViewController.mm
========================================================================

000d222c  push    {r4, r5, r6, r7, lr}
000d222e  add     r7, sp, #0xc
000d2230  push.w  {r8, sl, fp}
000d2234  sub     sp, #0x30
000d2236  ldr.w   r8, [pc, #0x2f0]
000d223a  mov.w   sl, #0
000d223e  ldr     r6, [pc, #0x2ec]
000d2240  add     r8, pc ; -> 0x000fa2c0  OBJC_IVAR_$_DMGViewController.navBar
000d2242  mov     r5, r0
000d2244  ldr.w   r3, [r8]
000d2248  add     r6, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d224a  ldr     r1, [pc, #0x2e4]
000d224c  str.w   sl, [r0, r3]
000d2250  ldr     r3, [pc, #0x2e0]
000d2252  add     r1, pc ; -> 0x000fc9e4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x6c
000d2254  add     r3, pc ; -> 0x000fa2bc  OBJC_IVAR_$_DMGViewController.catBar
000d2256  ldr     r1, [r1]
000d2258  ldr     r3, [r3]
000d225a  str.w   sl, [r0, r3]
000d225e  ldr     r3, [r6]
000d2260  str     r2, [r0, r3]
000d2262  ldr     r0, [pc, #0x2d4]
000d2264  add     r0, pc ; -> 0x000fdb54  
000d2266  ldr     r0, [r0]
000d2268  blx     #0xddbfc ; -> objc_msgSend
000d226c  ldr     r2, [pc, #0x2cc]
000d226e  add     r2, pc ; -> 0x000fcd70  'L2\x0e'
000d2270  ldr     r2, [r2]
000d2272  mov     r1, r0
000d2274  add     r0, sp, #0x20
000d2276  blx     #0xddc14 ; -> objc_msgSend_stret
000d227a  ldr     r1, [pc, #0x2c4]
000d227c  ldr     r0, [pc, #0x2c4]
000d227e  add     r1, pc ; -> 0x000fda88  
000d2280  add     r0, pc ; -> 0x000fdb50  
000d2282  ldr     r4, [r1]
000d2284  ldr     r1, [pc, #0x2c0]
000d2286  ldr     r0, [r0]
000d2288  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
000d228a  ldr     r1, [r1]
000d228c  blx     #0xddbfc ; -> objc_msgSend
000d2290  ldr     r1, [pc, #0x2b8]
000d2292  add     r1, pc ; -> 0x000fda7c  ' "\x0f'
000d2294  ldr     r1, [r1]
000d2296  blx     #0xddbfc ; -> objc_msgSend
000d229a  mov     r1, r4
000d229c  mov     r2, r0
000d229e  mov     r0, r5
000d22a0  blx     #0xddbfc ; -> objc_msgSend
000d22a4  ldr     r1, [pc, #0x2a8]
000d22a6  mov     r0, r5
000d22a8  add     r1, pc ; -> 0x000fcb34  't\x1e\x0e'
000d22aa  ldr     r1, [r1]
000d22ac  blx     #0xddbfc ; -> objc_msgSend
000d22b0  ldr     r1, [pc, #0x2a0]
000d22b2  mov     r2, sl
000d22b4  add     r1, pc ; -> 0x000fcb10  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x198
000d22b6  ldr     r1, [r1]
000d22b8  mov     fp, r0
000d22ba  blx     #0xddbfc ; -> objc_msgSend
000d22be  vldr    s14, [sp, #0x28]
000d22c2  vcvt.f64.f32 d6, s14
000d22c6  vldr    s14, [sp, #0x2c]
000d22ca  ldr     r0, [pc, #0x28c]
000d22cc  ldr     r1, [pc, #0x28c]
000d22ce  ldr     r2, [pc, #0x290]
000d22d0  add     r0, pc ; -> 0x000fdb5c  
000d22d2  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d22d4  vcvt.f64.f32 d7, s14
000d22d8  vmov    r3, r4, d6
000d22dc  add     r2, pc ; -> 0x00182904  
000d22de  ldr     r1, [r1]
000d22e0  ldr     r0, [r0]
000d22e2  str     r4, [sp]
000d22e4  vstr    d7, [sp, #4]
000d22e8  blx     #0xddbfc ; -> objc_msgSend
000d22ec  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d22f0  ldr     r1, [pc, #0x270]
000d22f2  ldr     r3, [r6]
000d22f4  add     r1, pc ; -> 0x000fda8c  'g\x14\x0f'
000d22f6  ldr     r1, [r1]
000d22f8  ldr     r0, [r5, r3]
000d22fa  str     r1, [sp, #0xc]
000d22fc  blx     #0xddbfc ; -> objc_msgSend
000d2300  cmp     r0, #1
000d2302  beq     #0xd233a
000d2304  ldr     r0, [pc, #0x260]
000d2306  ldr     r1, [pc, #0x264]
000d2308  ldr.w   r4, [r8]
000d230c  add     r0, pc ; -> 0x000fdd0c  
000d230e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d2310  ldr     r0, [r0]
000d2312  ldr     r1, [r1]
000d2314  blx     #0xddbfc ; -> objc_msgSend
000d2318  ldr     r1, [pc, #0x254]
000d231a  ldr     r3, [r6]
000d231c  add     r1, pc ; -> 0x000fda98  
000d231e  ldr     r2, [r5, r3]
000d2320  ldr     r1, [r1]
000d2322  blx     #0xddbfc ; -> objc_msgSend
000d2326  ldr     r1, [pc, #0x24c]
000d2328  add     r1, pc ; -> 0x000fcb44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1cc
000d232a  ldr     r1, [r1]
000d232c  str     r0, [r5, r4]
000d232e  ldr.w   r3, [r8]
000d2332  mov     r0, fp
000d2334  ldr     r2, [r5, r3]
000d2336  blx     #0xddbfc ; -> objc_msgSend
000d233a  ldr     r3, [pc, #0x23c]
000d233c  ldr     r1, [pc, #0x23c]
000d233e  mov     r2, sl
000d2340  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d2342  add     r1, pc ; -> 0x000fda78  
000d2344  ldr     r3, [r3]
000d2346  ldr     r1, [r1]
000d2348  ldr     r0, [r5, r3]
000d234a  blx     #0xddbfc ; -> objc_msgSend
000d234e  ldr     r0, [pc, #0x230]
000d2350  ldr     r1, [pc, #0x230]
000d2352  add     r0, pc ; -> 0x000fdb60  
000d2354  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000d2356  ldr     r0, [r0]
000d2358  ldr     r1, [r1]
000d235a  blx     #0xddbfc ; -> objc_msgSend
000d235e  ldr     r1, [pc, #0x228]
000d2360  add     r1, pc ; -> 0x000fcaf4  'K\x1a\x0e'
000d2362  ldr     r1, [r1]
000d2364  blx     #0xddbfc ; -> objc_msgSend
000d2368  ldr     r1, [pc, #0x220]
000d236a  ldr     r2, [pc, #0x224]
000d236c  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000d236e  add     r2, pc ; -> 0x00182914  
000d2370  ldr     r1, [r1]
000d2372  blx     #0xddbfc ; -> objc_msgSend
000d2376  ldr     r1, [pc, #0x21c]
000d2378  add     r1, pc ; -> 0x000fd6d0  
000d237a  ldr     r1, [r1]
000d237c  blx     #0xddbfc ; -> objc_msgSend
000d2380  tst.w   r0, #0xff
000d2384  beq     #0xd2394
000d2386  ldr     r3, [pc, #0x210]
000d2388  ldr     r2, [pc, #0x210]
000d238a  add     r3, pc ; -> 0x000fa2a8  OBJC_IVAR_$_DMGViewController.connectionType
000d238c  add     r2, pc ; -> 0x00180a34  
000d238e  ldr     r3, [r3]
000d2390  str     r2, [r5, r3]
000d2392  b       #0xd23ae
000d2394  ldr     r3, [pc, #0x208]
000d2396  ldr     r1, [pc, #0x20c]
000d2398  add     r3, pc ; -> 0x000fa2a8  OBJC_IVAR_$_DMGViewController.connectionType
000d239a  add     r1, pc ; -> 0x000fda74  '\x1c\x15\x0f'
000d239c  ldr     r4, [r3]
000d239e  ldr     r3, [pc, #0x208]
000d23a0  ldr     r1, [r1]
000d23a2  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d23a4  ldr     r3, [r3]
000d23a6  ldr     r0, [r5, r3]
000d23a8  blx     #0xddbfc ; -> objc_msgSend
000d23ac  str     r0, [r5, r4]
000d23ae  ldr     r3, [pc, #0x1fc]
000d23b0  ldr     r2, [pc, #0x1fc]
000d23b2  add     r3, pc ; -> 0x000fa2a8  OBJC_IVAR_$_DMGViewController.connectionType
000d23b4  add     r2, pc ; -> 0x00180a34  
000d23b6  ldr     r3, [r3]
000d23b8  ldr     r3, [r5, r3]
000d23ba  cmp     r3, r2
000d23bc  bne     #0xd2408
000d23be  ldr     r1, [pc, #0x1f4]
000d23c0  ldr     r4, [pc, #0x1f4]
000d23c2  ldr     r2, [pc, #0x1f8]
000d23c4  add     r1, pc ; -> 0x000fda70  '# \x0f'
000d23c6  add     r4, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d23c8  ldr.w   sl, [r1]
000d23cc  ldr     r1, [pc, #0x1f0]
000d23ce  ldr     r3, [r4]
000d23d0  add     r2, pc ; -> 0x00182724  
000d23d2  add     r1, pc ; -> 0x000fda84  '5\x15\x0f'
000d23d4  ldr     r6, [r1]
000d23d6  ldr     r0, [r5, r3]
000d23d8  mov     r1, r6
000d23da  blx     #0xddbfc ; -> objc_msgSend
000d23de  ldr     r3, [r4]
000d23e0  ldr     r2, [pc, #0x1e0]
000d23e2  mov     r1, r6
000d23e4  add     r2, pc ; -> 0x001828c4  
000d23e6  mov     r8, r0
000d23e8  ldr     r0, [r5, r3]
000d23ea  blx     #0xddbfc ; -> objc_msgSend
000d23ee  mov     r1, sl
000d23f0  mov     r2, r8
000d23f2  mov     r3, r0
000d23f4  mov     r0, r5
000d23f6  blx     #0xddbfc ; -> objc_msgSend
000d23fa  ldr     r1, [pc, #0x1cc]
000d23fc  mov     r0, r5
000d23fe  add     r1, pc ; -> 0x000fda6c  'p \x0f'
000d2400  ldr     r1, [r1]
000d2402  blx     #0xddbfc ; -> objc_msgSend
000d2406  b       #0xd24f0
000d2408  ldr     r3, [pc, #0x1c0]
000d240a  ldr     r6, [pc, #0x1c4]
000d240c  movs    r2, #0
000d240e  add     r3, pc ; -> 0x000fa2b0  OBJC_IVAR_$_DMGViewController.showingLocalData
000d2410  add     r6, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d2412  ldr     r3, [r3]
000d2414  ldr     r1, [sp, #0xc]
000d2416  strb    r2, [r5, r3]
000d2418  ldr     r3, [r6]
000d241a  ldr     r0, [r5, r3]
000d241c  blx     #0xddbfc ; -> objc_msgSend
000d2420  cmp     r0, #1
000d2422  beq     #0xd24da
000d2424  ldr     r0, [pc, #0x1ac]
000d2426  ldr     r1, [pc, #0x1b0]
000d2428  ldr.w   r8, [pc, #0x1b0]
000d242c  add     r0, pc ; -> 0x000fdd10  
000d242e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d2430  add     r8, pc ; -> 0x000fa2bc  OBJC_IVAR_$_DMGViewController.catBar
000d2432  ldr     r1, [r1]
000d2434  ldr     r0, [r0]
000d2436  ldr.w   sl, [r8]
000d243a  blx     #0xddbfc ; -> objc_msgSend
000d243e  ldr     r3, [pc, #0x1a0]
000d2440  ldr     r1, [pc, #0x1a0]
000d2442  vldr    s12, [pc, #0xe0]
000d2446  add     r3, pc ; -> 0x000f3354  DMG_MAIN_SCREEN_HEIGHT
000d2448  add     r1, pc ; -> 0x000fda94  
000d244a  ldr     r3, [r3]
000d244c  vldr    s14, [r3]
000d2450  ldr     r3, [pc, #0x194]
000d2452  ldr.w   ip, [r1]
000d2456  vstr    s12, [sp, #0x1c]
000d245a  add     r3, pc ; -> 0x000f3358  DMG_MAIN_SCREEN_WIDTH
000d245c  add     r2, sp, #0x10
000d245e  ldr     r3, [r3]
000d2460  movs    r4, #0
000d2462  vsub.f32 d7, d7, d6
000d2466  str     r4, [sp, #0x10]
000d2468  ldr     r3, [r3]
000d246a  vstr    s14, [sp, #0x14]
000d246e  str     r3, [sp, #0x18]
000d2470  ldr     r3, [r6]
000d2472  ldr     r3, [r5, r3]
000d2474  str     r3, [sp, #8]
000d2476  mov     lr, r0
000d2478  add     r0, sp, #0x18
000d247a  ldm     r0, {r0, r1}
000d247c  stm.w   sp, {r0, r1}
000d2480  mov     r1, ip
000d2482  mov     r0, lr
000d2484  ldm     r2, {r2, r3}
000d2486  blx     #0xddbfc ; -> objc_msgSend
000d248a  ldr     r1, [pc, #0x160]
000d248c  add     r1, pc ; -> 0x000fcb44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1cc
000d248e  ldr     r1, [r1]
000d2490  str.w   r0, [r5, sl]
000d2494  ldr.w   r3, [r8]
000d2498  mov     r0, fp
000d249a  mov     sl, r4
000d249c  mov     fp, r4
000d249e  ldr     r2, [r5, r3]
000d24a0  blx     #0xddbfc ; -> objc_msgSend
000d24a4  ldr     r1, [pc, #0x148]
000d24a6  ldr.w   r3, [r8]
000d24aa  mov     r2, r4
000d24ac  add     r1, pc ; -> 0x000fda90  
000d24ae  ldr     r0, [r5, r3]
000d24b0  ldr     r1, [r1]
000d24b2  mov     r3, r4
000d24b4  blx     #0xddbfc ; -> objc_msgSend
000d24b8  ldr     r1, [pc, #0x138]
000d24ba  ldr     r0, [r6]
000d24bc  ldr.w   r3, [r8]
000d24c0  add     r1, pc ; -> 0x000fda68  'v\x15\x0f'
000d24c2  ldr     r4, [r1]
000d24c4  ldr     r1, [pc, #0x130]
000d24c6  ldr     r6, [r5, r0]
000d24c8  ldr     r0, [r5, r3]
000d24ca  add     r1, pc ; -> 0x000fda5c  
000d24cc  ldr     r1, [r1]
000d24ce  blx     #0xddbfc ; -> objc_msgSend
000d24d2  mov     r1, r4
000d24d4  mov     r2, r0
000d24d6  mov     r0, r6
000d24d8  b       #0xd24ec
000d24da  ldr     r3, [pc, #0x120]
000d24dc  ldr     r1, [pc, #0x120]
000d24de  ldr     r2, [pc, #0x124]
000d24e0  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d24e2  add     r1, pc ; -> 0x000fda68  'v\x15\x0f'
000d24e4  ldr     r3, [r3]
000d24e6  ldr     r1, [r1]
000d24e8  add     r2, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000d24ea  ldr     r0, [r5, r3]
000d24ec  blx     #0xddbfc ; -> objc_msgSend
000d24f0  ldr     r1, [pc, #0x114]
000d24f2  mov     r0, r5
000d24f4  add     r1, pc ; -> 0x000fda64  'a \x0f'
000d24f6  ldr     r1, [r1]
000d24f8  blx     #0xddbfc ; -> objc_msgSend
000d24fc  ldr     r3, [pc, #0x10c]
000d24fe  ldr     r1, [pc, #0x110]
000d2500  movs    r2, #0
000d2502  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d2504  add     r1, pc ; -> 0x000fda60  
000d2506  ldr     r3, [r3]
000d2508  ldr     r1, [r1]
000d250a  ldr     r0, [r5, r3]
000d250c  blx     #0xddbfc ; -> objc_msgSend
000d2510  ldr     r3, [pc, #0x100]
000d2512  movs    r2, #0
000d2514  add     r3, pc ; -> 0x000fa2b4  OBJC_IVAR_$_DMGViewController.webLoadingStarted
000d2516  ldr     r3, [r3]
000d2518  strb    r2, [r5, r3]
000d251a  sub.w   sp, r7, #0x18
000d251e  pop.w   {r8, sl, fp}
000d2522  pop     {r4, r5, r6, r7, pc}
000d2524  movs    r0, r0
000d2526  rsbs    r0, r1, #0
000d2528  strh    r4, [r7, #2]
000d252a  movs    r2, r0
000d252c  strh    r0, [r3, #2]
000d252e  movs    r2, r0
000d2530  adr     r7, #0x238
000d2532  movs    r2, r0
000d2534  strh    r4, [r4, #2]
000d2536  movs    r2, r0
