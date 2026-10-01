========================================================================
SendQueuedResponse  0x000c24a4  688 bytes   EAMTX_Main.mm
========================================================================

000c24a4  push    {r4, r5, r6, r7, lr}
000c24a6  add     r7, sp, #0xc
000c24a8  push.w  {r8, sl, fp}
000c24ac  sub     sp, #0x2c
000c24ae  ldr     r1, [pc, #0x228]
000c24b0  mov     r6, r0
000c24b2  ldr     r0, [pc, #0x228]
000c24b4  add     r1, pc ; -> 0x000fd4b8  
000c24b6  movs    r2, #1
000c24b8  ldr     r1, [r1]
000c24ba  add     r0, pc ; -> 0x0038c0e4  mtxController
000c24bc  ldr     r0, [r0]
000c24be  str     r1, [sp, #0xc]
000c24c0  blx     #0xddbfc ; -> objc_msgSend
000c24c4  ldr     r1, [pc, #0x218]
000c24c6  ldr     r2, [pc, #0x21c]
000c24c8  mov     r0, r6
000c24ca  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000c24cc  add     r2, pc ; -> 0x00180604  
000c24ce  ldr     r5, [r1]
000c24d0  mov     r1, r5
000c24d2  blx     #0xddbfc ; -> objc_msgSend
000c24d6  ldr     r1, [pc, #0x210]
000c24d8  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000c24da  ldr.w   r8, [r1]
000c24de  mov     r1, r8
000c24e0  blx     #0xddbfc ; -> objc_msgSend
000c24e4  ldr     r2, [pc, #0x204]
000c24e6  mov     r1, r5
000c24e8  add     r2, pc ; -> 0x00180634  
000c24ea  mov     sl, r0
000c24ec  mov     r0, r6
000c24ee  blx     #0xddbfc ; -> objc_msgSend
000c24f2  mov     r1, r8
000c24f4  blx     #0xddbfc ; -> objc_msgSend
000c24f8  ldr     r2, [pc, #0x1f4]
000c24fa  mov     r1, r5
000c24fc  add     r2, pc ; -> 0x00180644  
000c24fe  str     r0, [sp, #0x1c]
000c2500  mov     r0, r6
000c2502  blx     #0xddbfc ; -> objc_msgSend
000c2506  mov     r1, r8
000c2508  blx     #0xddbfc ; -> objc_msgSend
000c250c  ldr     r2, [pc, #0x1e4]
000c250e  mov     r1, r5
000c2510  add     r2, pc ; -> 0x00180614  
000c2512  str     r0, [sp, #0x20]
000c2514  mov     r0, r6
000c2516  blx     #0xddbfc ; -> objc_msgSend
000c251a  mov     r1, r8
000c251c  blx     #0xddbfc ; -> objc_msgSend
000c2520  ldr     r2, [pc, #0x1d4]
000c2522  mov     r1, r5
000c2524  add     r2, pc ; -> 0x0017f064  
000c2526  str     r0, [sp, #0x24]
000c2528  mov     r0, r6
000c252a  blx     #0xddbfc ; -> objc_msgSend
000c252e  ldr     r1, [pc, #0x1cc]
000c2530  add     r1, pc ; -> 0x000fd6d0  
000c2532  ldr     r4, [r1]
000c2534  mov     r1, r4
000c2536  blx     #0xddbfc ; -> objc_msgSend
000c253a  ldr     r2, [pc, #0x1c4]
000c253c  mov     r1, r5
000c253e  add     r2, pc ; -> 0x00181044  
000c2540  uxtb    r0, r0
000c2542  str     r0, [sp, #0x10]
000c2544  mov     r0, r6
000c2546  blx     #0xddbfc ; -> objc_msgSend
000c254a  mov     r1, r4
000c254c  blx     #0xddbfc ; -> objc_msgSend
000c2550  ldr     r4, [pc, #0x1b0]
000c2552  mov     r1, r5
000c2554  add     r4, pc ; -> 0x00180484  
000c2556  mov     r2, r4
000c2558  uxtb    r0, r0
000c255a  str     r0, [sp, #0x14]
000c255c  mov     r0, r6
000c255e  blx     #0xddbfc ; -> objc_msgSend
000c2562  cbz     r0, #0xc256e
000c2564  mov     r0, r6
000c2566  mov     r1, r5
000c2568  mov     r2, r4
000c256a  blx     #0xddbfc ; -> objc_msgSend
000c256e  ldr     r2, [pc, #0x198]
000c2570  str     r0, [sp, #0x28]
000c2572  mov     r1, r5
000c2574  add     r2, pc ; -> 0x00180434  
000c2576  mov     r0, r6
000c2578  blx     #0xddbfc ; -> objc_msgSend
000c257c  mov     r1, r8
000c257e  blx     #0xddbfc ; -> objc_msgSend
000c2582  ldr     r3, [pc, #0x188]
000c2584  add     r3, pc ; -> 0x0038c168  iItemSellId
000c2586  str     r0, [r3]
000c2588  ldr     r0, [pc, #0x184]
000c258a  add     r0, pc ; -> 0x00181054  
000c258c  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c2590  ldr     r1, [pc, #0x180]
000c2592  ldr     r0, [pc, #0x184]
000c2594  ldr     r2, [pc, #0x184]
000c2596  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c2598  add     r0, pc ; -> 0x000fdb5c  
000c259a  ldr.w   fp, [r1]
000c259e  ldr     r0, [r0]
000c25a0  ldr     r3, [sp, #0x24]
000c25a2  add     r2, pc ; -> 0x00181064  
000c25a4  mov     r1, fp
000c25a6  str     r0, [sp, #0x18]
000c25a8  blx     #0xddbfc ; -> objc_msgSend
000c25ac  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c25b0  ldr     r3, [sp, #0x10]
000c25b2  cbz     r3, #0xc25c2
000c25b4  mov     r0, sl
000c25b6  ldr     r1, [sp, #0x24]
000c25b8  ldr     r2, [sp, #0x1c]
000c25ba  ldr     r3, [sp, #0x20]
000c25bc  bl      #0xbb2e8 ; -> Z28NetworkHandler_ErrorCallBackiiii
000c25c0  b       #0xc2628
000c25c2  ldr     r3, [sp, #0x14]
000c25c4  cbz     r3, #0xc25f8
000c25c6  ldr     r2, [pc, #0x158]
000c25c8  mov     r1, r5
000c25ca  mov     r0, r6
000c25cc  add     r2, pc ; -> 0x00180624  
000c25ce  blx     #0xddbfc ; -> objc_msgSend
000c25d2  ldr     r1, [pc, #0x150]
000c25d4  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000c25d6  ldr     r1, [r1]
000c25d8  mov     r4, r0
000c25da  blx     #0xddbfc ; -> objc_msgSend
000c25de  ldr     r3, [sp, #0x1c]
000c25e0  mov     r1, r4
000c25e2  str     r3, [sp]
000c25e4  ldr     r3, [sp, #0x20]
000c25e6  str     r3, [sp, #4]
000c25e8  ldr     r3, [sp, #0x28]
000c25ea  str     r3, [sp, #8]
000c25ec  ldr     r3, [sp, #0x24]
000c25ee  mov     r2, r0
000c25f0  mov     r0, sl
000c25f2  bl      #0xbb540 ; -> Z31NetworkHandler_DownloadCallBackiP6NSDataiiiiP8NSString
000c25f6  b       #0xc2628
000c25f8  ldr     r2, [pc, #0x12c]
000c25fa  mov     r1, r5
000c25fc  mov     r0, r6
000c25fe  add     r2, pc ; -> 0x00180624  
000c2600  blx     #0xddbfc ; -> objc_msgSend
000c2604  ldr     r1, [pc, #0x124]
000c2606  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000c2608  ldr     r1, [r1]
000c260a  mov     r4, r0
000c260c  blx     #0xddbfc ; -> objc_msgSend
000c2610  ldr     r3, [sp, #0x1c]
000c2612  mov     r1, r4
000c2614  str     r3, [sp]
000c2616  ldr     r3, [sp, #0x20]
000c2618  str     r3, [sp, #4]
000c261a  ldr     r3, [sp, #0x28]
000c261c  str     r3, [sp, #8]
000c261e  ldr     r3, [sp, #0x24]
000c2620  mov     r2, r0
000c2622  mov     r0, sl
000c2624  bl      #0xbf680 ; -> Z23NetworkHandler_CallBackiP8NSStringiiiiS0_
000c2628  cmp.w   sl, #0x26
000c262c  beq     #0xc266a
000c262e  ldr     r0, [pc, #0x100]
000c2630  ldr     r1, [sp, #0xc]
000c2632  movs    r2, #0
000c2634  add     r0, pc ; -> 0x0038c0e4  mtxController
000c2636  ldr     r0, [r0]
000c2638  blx     #0xddbfc ; -> objc_msgSend
000c263c  cmp.w   sl, #3
000c2640  ite     ne
000c2642  movne   r3, #0
000c2644  moveq   r3, #1
000c2646  cmp.w   sl, #6
000c264a  it      eq
000c264c  orreq   r3, r3, #1
000c2650  cbnz    r3, #0xc2658
000c2652  cmp.w   sl, #1
000c2656  bne     #0xc266a
000c2658  ldr     r0, [pc, #0xd8]
000c265a  ldr     r1, [pc, #0xdc]
000c265c  movs    r2, #0
000c265e  add     r0, pc ; -> 0x0038c0e4  mtxController
000c2660  add     r1, pc ; -> 0x000fd4e8  
000c2662  ldr     r0, [r0]
000c2664  ldr     r1, [r1]
000c2666  blx     #0xddbfc ; -> objc_msgSend
000c266a  ldr     r4, [pc, #0xd0]
000c266c  ldr     r1, [pc, #0xd0]
000c266e  ldr     r5, [pc, #0xd4]
000c2670  add     r4, pc ; -> 0x0038c0e4  mtxController
000c2672  add     r1, pc ; -> 0x000fd694  
000c2674  ldr     r0, [r4]
000c2676  ldr     r1, [r1]
000c2678  blx     #0xddbfc ; -> objc_msgSend
000c267c  ldr     r1, [pc, #0xc8]
000c267e  add     r5, pc ; -> 0x0017e5c4  
000c2680  ldr     r3, [sp, #0x24]
000c2682  add     r1, pc ; -> 0x000fcefc  '\x11B\x0e'
000c2684  mov     r2, r5
000c2686  ldr.w   r8, [r1]
000c268a  mov     r1, fp
000c268c  mov     r6, r0
000c268e  ldr     r0, [sp, #0x18]
000c2690  blx     #0xddbfc ; -> objc_msgSend
000c2694  mov     r1, r8
000c2696  mov     r2, r0
000c2698  mov     r0, r6
000c269a  blx     #0xddbfc ; -> objc_msgSend
000c269e  ldr     r1, [pc, #0xac]
000c26a0  ldr     r0, [r4]
000c26a2  add     r1, pc ; -> 0x000fd68c  
000c26a4  ldr     r1, [r1]
000c26a6  blx     #0xddbfc ; -> objc_msgSend
000c26aa  ldr     r3, [sp, #0x24]
000c26ac  mov     r1, fp
000c26ae  mov     r2, r5
000c26b0  mov     r4, r0
000c26b2  ldr     r0, [sp, #0x18]
000c26b4  blx     #0xddbfc ; -> objc_msgSend
000c26b8  mov     r1, r8
000c26ba  mov     r2, r0
000c26bc  mov     r0, r4
000c26be  blx     #0xddbfc ; -> objc_msgSend
000c26c2  ldr     r0, [pc, #0x8c]
000c26c4  add     r0, pc ; -> 0x00181074  
000c26c6  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c26ca  movs    r0, #1
000c26cc  sub.w   sp, r7, #0x18
000c26d0  pop.w   {r8, sl, fp}
000c26d4  pop     {r4, r5, r6, r7, pc}
000c26d6  nop     
000c26d8  add     sp, #0
000c26da  movs    r3, r0
000c26dc  ldr     r4, [sp, #0x98]
000c26de  movs    r4, r5
000c26e0  adr     r6, #0x88
000c26e2  movs    r3, r0
000c26e4  b       #0xc2950
000c26e6  movs    r3, r1
000c26e8  adr     r6, #0x30
000c26ea  movs    r3, r0
000c26ec  b       #0xc2980
000c26ee  movs    r3, r1
000c26f0  b       #0xc297c
000c26f2  movs    r3, r1
000c26f4  b       #0xc28f8
000c26f6  movs    r3, r1
000c26f8  ldm     r3, {r2, r3, r4, r5}
000c26fa  movs    r3, r1
000c26fc  cbz     r4, #0xc2726
000c26fe  movs    r3, r0
000c2700  add.w   r0, r2, fp
000c2704  svc     #0x2c
000c2706  movs    r3, r1
000c2708  udf     #0xbc
000c270a  movs    r3, r1
000c270c  ldr     r3, [sp, #0x380]
000c270e  movs    r4, r5
000c2710  pkhbt   r0, r6, fp
000c2714  adr     r5, #0x18
000c2716  movs    r3, r0
000c2718  push    {r6, r7, lr}
000c271a  movs    r3, r0
