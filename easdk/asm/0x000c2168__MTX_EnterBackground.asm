========================================================================
MTX_EnterBackground  0x000c2168  380 bytes   EAMTX_Main.mm
========================================================================

000c2168  push    {r4, r5, r6, r7, lr}
000c216a  add     r7, sp, #0xc
000c216c  str     r8, [sp, #-0x4]!
000c2170  sub     sp, #8
000c2172  bl      #0xbe094 ; -> Z21MTX_CancelAllRequestsv
000c2176  ldr     r0, [pc, #0x11c]
000c2178  ldr     r1, [pc, #0x11c]
000c217a  add     r0, pc ; -> 0x000fdb50  
000c217c  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
000c217e  ldr     r6, [r0]
000c2180  ldr     r5, [r1]
000c2182  mov     r0, r6
000c2184  mov     r1, r5
000c2186  blx     #0xddbfc ; -> objc_msgSend
000c218a  ldr     r1, [pc, #0x110]
000c218c  add     r1, pc ; -> 0x000fd3b0  
000c218e  ldr     r4, [r1]
000c2190  ldr     r1, [pc, #0x10c]
000c2192  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000c2194  mov     r2, r4
000c2196  ldr     r1, [r1]
000c2198  blx     #0xddbfc ; -> objc_msgSend
000c219c  tst.w   r0, #0xff
000c21a0  beq     #0xc2270
000c21a2  mov     r1, r5
000c21a4  mov     r0, r6
000c21a6  blx     #0xddbfc ; -> objc_msgSend
000c21aa  mov     r1, r4
000c21ac  blx     #0xddbfc ; -> objc_msgSend
000c21b0  tst.w   r0, #0xff
000c21b4  beq     #0xc2270
000c21b6  ldr     r4, [pc, #0xec]
000c21b8  add     r4, pc ; -> 0x0038c0e8  mtxUserInfo
000c21ba  ldr     r0, [r4]
000c21bc  cbz     r0, #0xc2212
000c21be  ldr     r1, [pc, #0xe8]
000c21c0  add     r1, pc ; -> 0x000fd66c  
000c21c2  ldr     r5, [r1]
000c21c4  mov     r1, r5
000c21c6  blx     #0xddbfc ; -> objc_msgSend
000c21ca  cbz     r0, #0xc2212
000c21cc  ldr     r1, [pc, #0xdc]
000c21ce  ldr     r0, [r4]
000c21d0  add     r1, pc ; -> 0x000fd65c  
000c21d2  ldr     r1, [r1]
000c21d4  blx     #0xddbfc ; -> objc_msgSend
000c21d8  cbz     r0, #0xc2212
000c21da  mov     r1, r5
000c21dc  ldr     r0, [r4]
000c21de  blx     #0xddbfc ; -> objc_msgSend
000c21e2  ldr     r1, [pc, #0xcc]
000c21e4  ldr     r2, [pc, #0xcc]
000c21e6  movw    r3, #0x4e20
000c21ea  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000c21ec  add     r2, pc ; -> 0x0017e5c4  
000c21ee  ldr     r5, [r1]
000c21f0  ldr     r1, [pc, #0xc4]
000c21f2  ldr     r4, [pc, #0xc8]
000c21f4  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c21f6  add     r4, pc ; -> 0x0017e374  kGraphBaseURL+0x244
000c21f8  ldr     r1, [r1]
000c21fa  mov     r6, r0
000c21fc  ldr     r0, [pc, #0xc0]
000c21fe  add     r0, pc ; -> 0x000fdb5c  
000c2200  ldr     r0, [r0]
000c2202  blx     #0xddbfc ; -> objc_msgSend
000c2206  mov     r1, r5
000c2208  mov     r2, r4
000c220a  mov     r3, r0
000c220c  mov     r0, r6
000c220e  blx     #0xddbfc ; -> objc_msgSend
000c2212  ldr     r0, [pc, #0xb0]
000c2214  ldr     r1, [pc, #0xb0]
000c2216  ldr     r3, [pc, #0xb4]
000c2218  ldr     r2, [pc, #0xb4]
000c221a  add     r0, pc ; -> 0x000fdb5c  
000c221c  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c221e  add     r3, pc ; -> 0x0038c11c  lastEventTypeId
000c2220  add     r2, pc ; -> 0x0017e5c4  
000c2222  ldr     r3, [r3]
000c2224  ldr     r1, [r1]
000c2226  ldr     r0, [r0]
000c2228  blx     #0xddbfc ; -> objc_msgSend
000c222c  ldr     r1, [pc, #0xa4]
000c222e  movs    r4, #0
000c2230  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000c2232  ldr     r5, [r1]
000c2234  mov     r1, r5
000c2236  mov     r8, r0
000c2238  ldr     r0, [pc, #0x9c]
000c223a  add     r0, pc ; -> 0x000fdbb4  
000c223c  ldr     r6, [r0]
000c223e  mov     r0, r6
000c2240  blx     #0xddbfc ; -> objc_msgSend
000c2244  mov     r2, r8
000c2246  mov     r3, r4
000c2248  movs    r1, #0xf
000c224a  str     r4, [sp]
000c224c  str     r0, [sp, #4]
000c224e  movw    r0, #0x4e23
000c2252  bl      #0xbe81c ; -> Z15MTX_LogEAServeriiP8NSStringiS0_P6NSDate
000c2256  mov     r1, r5
000c2258  mov     r0, r6
000c225a  blx     #0xddbfc ; -> objc_msgSend
000c225e  mov     r1, r4
000c2260  mov     r2, r4
000c2262  mov     r3, r4
000c2264  str     r4, [sp]
000c2266  str     r0, [sp, #4]
000c2268  movw    r0, #0x4e20
000c226c  bl      #0xbe81c ; -> Z15MTX_LogEAServeriiP8NSStringiS0_P6NSDate
000c2270  ldr     r0, [pc, #0x68]
000c2272  add     r0, pc ; -> 0x00181024  
000c2274  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c2278  bl      #0xbda00 ; -> Z16SaveProductsDatav
000c227c  bl      #0xcfbb8 ; -> Z22MTXDMG_EnterBackgroundv
000c2280  ldr     r3, [pc, #0x5c]
000c2282  movs    r2, #1
000c2284  add     r3, pc ; -> 0x0038c0b9  bRequiredToShowAlert
000c2286  strb    r2, [r3]
000c2288  sub.w   sp, r7, #0x10
000c228c  ldr     r8, [sp], #4
000c2290  pop     {r4, r5, r6, r7, pc}
000c2292  nop     
000c2294  cbnz    r2, #0xc22cc
000c2296  movs    r3, r0
000c2298  add     r0, sp, #0x1c0
000c229a  movs    r3, r0
000c229c  sxth    r0, r4
000c229e  movs    r3, r0
000c22a0  add     r2, sp, #0x3e8
000c22a2  movs    r3, r0
000c22a4  ldr     r7, [sp, #0xb0]
000c22a6  movs    r4, r5
000c22a8  push    {r3, r5, r7}
000c22aa  movs    r3, r0
000c22ac  push    {r3, r7}
000c22ae  movs    r3, r0
000c22b0  add     r0, sp, #0x3a8
000c22b2  movs    r3, r0
000c22b4  stm     r3!, {r2, r4, r6, r7}
000c22b6  movs    r3, r1
000c22b8  add     r0, sp, #0x2a0
000c22ba  movs    r3, r0
000c22bc  stm     r1!, {r1, r3, r4, r5, r6}
000c22be  movs    r3, r1
000c22c0  cbnz    r2, #0xc22da
000c22c2  movs    r3, r0
000c22c4  cbnz    r6, #0xc22d6
000c22c6  movs    r3, r0
000c22c8  add     r0, sp, #0x200
000c22ca  movs    r3, r0
000c22cc  ldr     r6, [sp, #0x3e8]
000c22ce  movs    r4, r5
000c22d0  stm     r3!, {r5, r7}
000c22d2  movs    r3, r1
000c22d4  add     r1, sp, #0x250
000c22d6  movs    r3, r0
000c22d8  cbnz    r6, #0xc22f8
000c22da  movs    r3, r0
000c22dc  stc     p0, c0, [lr, #0x2c]!
000c22e0  ldr     r6, [sp, #0xc4]
000c22e2  movs    r4, r5
