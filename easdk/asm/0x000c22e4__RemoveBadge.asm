========================================================================
RemoveBadge  0x000c22e4  448 bytes   EAMTX_Main.mm
========================================================================

000c22e4  push    {r4, r5, r6, r7, lr}
000c22e6  add     r7, sp, #0xc
000c22e8  push.w  {r8, sl, fp}
000c22ec  sub     sp, #0x1c
000c22ee  mov     r8, r0
000c22f0  cmp     r0, #0
000c22f2  beq.w   #0xc2452
000c22f6  ldr     r3, [pc, #0x164]
000c22f8  add     r3, pc ; -> 0x0038c194  m_BadgesDict
000c22fa  ldr     r3, [r3]
000c22fc  cmp     r3, #0
000c22fe  beq.w   #0xc2452
000c2302  ldr     r1, [pc, #0x15c]
000c2304  ldr     r0, [pc, #0x15c]
000c2306  ldr.w   r4, [pc, #0x160]
000c230a  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c230c  add     r0, pc ; -> 0x000fdb5c  
000c230e  ldr     r1, [r1]
000c2310  ldr     r0, [r0]
000c2312  add     r4, pc ; -> 0x00181034  
000c2314  movs    r6, #0
000c2316  str     r1, [sp, #4]
000c2318  ldr.w   r1, [pc, #0x150]
000c231c  str     r0, [sp]
000c231e  mov     r0, r8
000c2320  add     r1, pc ; -> 0x000fd3c8  
000c2322  ldr     r5, [r1]
000c2324  mov     r1, r5
000c2326  blx     #0xddbfc ; -> objc_msgSend
000c232a  mov     r2, r4
000c232c  ldr     r1, [sp, #4]
000c232e  mov     r3, r0
000c2330  ldr     r0, [sp]
000c2332  blx     #0xddbfc ; -> objc_msgSend
000c2336  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c233a  mov     r1, r5
000c233c  mov     r0, r8
000c233e  blx     #0xddbfc ; -> objc_msgSend
000c2342  ldr     r1, [pc, #0x12c]
000c2344  ldr     r2, [pc, #0x12c]
000c2346  add     r1, pc ; -> 0x000fcf98  '\x1bU\x0e'
000c2348  add     r2, pc ; -> 0x0017fe54  
000c234a  ldr     r1, [r1]
000c234c  blx     #0xddbfc ; -> objc_msgSend
000c2350  ldr     r1, [pc, #0x124]
000c2352  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000c2354  ldr     r1, [r1]
000c2356  str     r1, [sp, #8]
000c2358  ldr     r1, [pc, #0x120]
000c235a  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000c235c  ldr     r1, [r1]
000c235e  str     r1, [sp, #0xc]
000c2360  ldr     r1, [pc, #0x11c]
000c2362  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000c2364  ldr     r1, [r1]
000c2366  str     r1, [sp, #0x10]
000c2368  ldr     r1, [pc, #0x118]
000c236a  mov     sl, r0
000c236c  add     r1, pc ; -> 0x000fd6e0  
000c236e  ldr     r1, [r1]
000c2370  str     r1, [sp, #0x14]
000c2372  ldr     r1, [pc, #0x114]
000c2374  add     r1, pc ; -> 0x000fd3d8  
000c2376  ldr.w   fp, [r1]
000c237a  ldr     r1, [pc, #0x110]
000c237c  add     r1, pc ; -> 0x000fcd7c  'lz\x0e'
000c237e  ldr     r1, [r1]
000c2380  str     r1, [sp, #0x18]
000c2382  b       #0xc23ea
000c2384  ldr     r1, [sp, #0xc]
000c2386  mov     r2, r6
000c2388  mov     r0, sl
000c238a  blx     #0xddbfc ; -> objc_msgSend
000c238e  ldr     r1, [sp, #0x10]
000c2390  mov     r2, r0
000c2392  ldr     r0, [pc, #0xfc]
000c2394  add     r0, pc ; -> 0x0038c194  m_BadgesDict
000c2396  ldr     r0, [r0]
000c2398  blx     #0xddbfc ; -> objc_msgSend
000c239c  mov     r4, r0
000c239e  cbz     r0, #0xc23e8
000c23a0  mov     r1, fp
000c23a2  mov     r0, r8
000c23a4  blx     #0xddbfc ; -> objc_msgSend
000c23a8  ldr     r5, [pc, #0xe8]
000c23aa  ldr     r1, [sp, #4]
000c23ac  add     r5, pc ; -> 0x0017e5c4  
000c23ae  mov     r2, r5
000c23b0  mov     r3, r0
000c23b2  ldr     r0, [sp]
000c23b4  blx     #0xddbfc ; -> objc_msgSend
000c23b8  ldr     r1, [sp, #0x14]
000c23ba  mov     r2, r0
000c23bc  mov     r0, r4
000c23be  blx     #0xddbfc ; -> objc_msgSend
000c23c2  mvn     r3, #0x80000000
000c23c6  cmp     r0, r3
000c23c8  beq     #0xc23e8
000c23ca  mov     r1, fp
000c23cc  mov     r0, r8
000c23ce  blx     #0xddbfc ; -> objc_msgSend
000c23d2  ldr     r1, [sp, #4]
000c23d4  mov     r2, r5
000c23d6  mov     r3, r0
000c23d8  ldr     r0, [sp]
000c23da  blx     #0xddbfc ; -> objc_msgSend
000c23de  ldr     r1, [sp, #0x18]
000c23e0  mov     r2, r0
000c23e2  mov     r0, r4
000c23e4  blx     #0xddbfc ; -> objc_msgSend
000c23e8  adds    r6, #1
000c23ea  mov     r0, sl
000c23ec  ldr     r1, [sp, #8]
000c23ee  blx     #0xddbfc ; -> objc_msgSend
000c23f2  cmp     r0, r6
000c23f4  bhi     #0xc2384
000c23f6  ldr     r0, [pc, #0xa0]
000c23f8  ldr     r2, [pc, #0xa0]
000c23fa  ldr     r1, [sp, #0x10]
000c23fc  add     r0, pc ; -> 0x0038c194  m_BadgesDict
000c23fe  add     r2, pc ; -> 0x0017fe64  
000c2400  ldr     r0, [r0]
000c2402  blx     #0xddbfc ; -> objc_msgSend
000c2406  mov     r4, r0
000c2408  cbz     r0, #0xc2452
000c240a  mov     r1, fp
000c240c  mov     r0, r8
000c240e  blx     #0xddbfc ; -> objc_msgSend
000c2412  ldr     r5, [pc, #0x8c]
000c2414  ldr     r1, [sp, #4]
000c2416  add     r5, pc ; -> 0x0017e5c4  
000c2418  mov     r2, r5
000c241a  mov     r3, r0
000c241c  ldr     r0, [sp]
000c241e  blx     #0xddbfc ; -> objc_msgSend
000c2422  ldr     r1, [sp, #0x14]
000c2424  mov     r2, r0
000c2426  mov     r0, r4
000c2428  blx     #0xddbfc ; -> objc_msgSend
000c242c  mvn     r3, #0x80000000
000c2430  cmp     r0, r3
000c2432  beq     #0xc2452
000c2434  mov     r1, fp
000c2436  mov     r0, r8
000c2438  blx     #0xddbfc ; -> objc_msgSend
000c243c  ldr     r1, [sp, #4]
000c243e  mov     r2, r5
000c2440  mov     r3, r0
000c2442  ldr     r0, [sp]
000c2444  blx     #0xddbfc ; -> objc_msgSend
000c2448  ldr     r1, [sp, #0x18]
000c244a  mov     r2, r0
000c244c  mov     r0, r4
000c244e  blx     #0xddbfc ; -> objc_msgSend
000c2452  sub.w   sp, r7, #0x18
000c2456  pop.w   {r8, sl, fp}
000c245a  pop     {r4, r5, r6, r7, pc}
000c245c  ldr     r6, [sp, #0x260]
000c245e  movs    r4, r5
000c2460  adr     r7, #0x248
000c2462  movs    r3, r0
