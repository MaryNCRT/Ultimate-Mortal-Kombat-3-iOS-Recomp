========================================================================
-[DMGViewController showBackButton]  0x000d208c  416 bytes   DMGViewController.mm
========================================================================

000d208c  push    {r4, r5, r6, r7, lr}
000d208e  add     r7, sp, #0xc
000d2090  push.w  {r8, sl, fp}
000d2094  sub     sp, #0x34
000d2096  ldr     r3, [pc, #0x140]
000d2098  ldr     r1, [pc, #0x140]
000d209a  mov     r5, r0
000d209c  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d209e  add     r1, pc ; -> 0x000fda8c  'g\x14\x0f'
000d20a0  ldr     r3, [r3]
000d20a2  ldr     r1, [r1]
000d20a4  ldr     r0, [r0, r3]
000d20a6  blx     #0xddbfc ; -> objc_msgSend
000d20aa  cmp     r0, #1
000d20ac  str     r0, [sp, #0xc]
000d20ae  bne.w   #0xd21ce
000d20b2  ldr     r4, [pc, #0x12c]
000d20b4  add     r4, pc ; -> 0x000fa2c4  OBJC_IVAR_$_DMGViewController.backBt
000d20b6  ldr     r0, [r4]
000d20b8  ldr     r0, [r5, r0]
000d20ba  cbz     r0, #0xd20d6
000d20bc  ldr.w   r1, [pc, #0x124]
000d20c0  add     r1, pc ; -> 0x000fccf0  '<-\x0e'
000d20c2  ldr     r1, [r1]
000d20c4  blx     #0xddbfc ; -> objc_msgSend
000d20c8  ldr     r1, [pc, #0x11c]
000d20ca  ldr     r3, [r4]
000d20cc  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d20ce  ldr     r0, [r5, r3]
000d20d0  ldr     r1, [r1]
000d20d2  blx     #0xddbfc ; -> objc_msgSend
000d20d6  ldr     r0, [pc, #0x114]
000d20d8  ldr     r1, [pc, #0x114]
000d20da  ldr     r2, [pc, #0x118]
000d20dc  add     r0, pc ; -> 0x000fdba8  
000d20de  add     r1, pc ; -> 0x000fccb8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x340
000d20e0  ldr     r0, [r0]
000d20e2  ldr     r1, [r1]
000d20e4  add     r2, pc ; -> 0x001828e4  
000d20e6  str     r0, [sp, #0x10]
000d20e8  str     r1, [sp, #0x14]
000d20ea  blx     #0xddbfc ; -> objc_msgSend
000d20ee  mov     r6, r0
000d20f0  cmp     r0, #0
000d20f2  beq     #0xd21ce
000d20f4  ldr.w   sl, [pc, #0x100]
000d20f8  ldr     r0, [pc, #0x100]
000d20fa  ldr     r1, [pc, #0x104]
000d20fc  add     sl, pc ; -> 0x000fa2c4  OBJC_IVAR_$_DMGViewController.backBt
000d20fe  add     r0, pc ; -> 0x000fdbcc  
000d2100  ldr.w   r3, [sl]
000d2104  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d2106  ldr     r0, [r0]
000d2108  ldr     r1, [r1]
000d210a  str     r3, [sp, #8]
000d210c  blx     #0xddbfc ; -> objc_msgSend
000d2110  ldr     r2, [pc, #0xf0]
000d2112  ldr     r1, [pc, #0xf4]
000d2114  add     r2, pc ; -> 0x000fc9d4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x5c
000d2116  add     r1, pc ; -> 0x000fccd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x35c
000d2118  ldr     r4, [r2]
000d211a  ldr.w   fp, [r1]
000d211e  mov     r1, r6
000d2120  mov     r2, r4
000d2122  str     r0, [sp, #0x18]
000d2124  add     r0, sp, #0x1c
000d2126  blx     #0xddc14 ; -> objc_msgSend_stret
000d212a  mov     r2, r4
000d212c  add     r0, sp, #0x1c
000d212e  mov     r1, r6
000d2130  ldr.w   r8, [sp, #0x1c]
000d2134  blx     #0xddc14 ; -> objc_msgSend_stret
000d2138  ldr     r3, [pc, #0xd0]
000d213a  add     r0, sp, #0x2c
000d213c  str.w   r8, [sp, #0x2c]
000d2140  add     r2, sp, #0x24
000d2142  str     r3, [sp, #0x24]
000d2144  ldr     r3, [pc, #0xc8]
000d2146  str     r3, [sp, #0x28]
000d2148  ldr     r3, [sp, #0x20]
000d214a  str     r3, [sp, #0x30]
000d214c  ldm     r0, {r0, r1}
000d214e  stm.w   sp, {r0, r1}
000d2152  mov     r1, fp
000d2154  ldm     r2, {r2, r3}
000d2156  ldr     r0, [sp, #0x18]
000d2158  blx     #0xddbfc ; -> objc_msgSend
000d215c  ldr     r1, [pc, #0xb4]
000d215e  ldr     r3, [sp, #8]
000d2160  mov     r2, r6
000d2162  add     r1, pc ; -> 0x000fda58  
000d2164  ldr.w   r8, [r1]
000d2168  mov     r1, r8
000d216a  str     r0, [r5, r3]
000d216c  ldr.w   r3, [sl]
000d2170  ldr     r0, [r5, r3]
000d2172  movs    r3, #0
000d2174  blx     #0xddbfc ; -> objc_msgSend
000d2178  ldr.w   r0, [sl]
000d217c  ldr     r2, [pc, #0x98]
000d217e  ldr     r1, [sp, #0x14]
000d2180  ldr     r4, [r5, r0]
000d2182  add     r2, pc ; -> 0x001828f4  
000d2184  ldr     r0, [sp, #0x10]
000d2186  blx     #0xddbfc ; -> objc_msgSend
000d218a  mov     r1, r8
000d218c  ldr     r3, [sp, #0xc]
000d218e  mov     r2, r0
000d2190  mov     r0, r4
000d2192  blx     #0xddbfc ; -> objc_msgSend
000d2196  ldr.w   r3, [sl]
000d219a  ldr     r1, [pc, #0x80]
000d219c  movs    r2, #0x40
000d219e  str     r2, [sp]
000d21a0  ldr     r0, [r5, r3]
000d21a2  ldr     r3, [pc, #0x7c]
000d21a4  add     r1, pc ; -> 0x000fcc98  'j2\x0e'
000d21a6  mov     r2, r5
000d21a8  add     r3, pc ; -> 0x000fda54  'U \x0f'
000d21aa  ldr     r1, [r1]
000d21ac  ldr     r3, [r3]
000d21ae  blx     #0xddbfc ; -> objc_msgSend
000d21b2  ldr     r1, [pc, #0x70]
000d21b4  mov     r0, r5
000d21b6  add     r1, pc ; -> 0x000fcb34  't\x1e\x0e'
000d21b8  ldr     r1, [r1]
000d21ba  blx     #0xddbfc ; -> objc_msgSend
000d21be  ldr     r1, [pc, #0x68]
000d21c0  ldr.w   r2, [sl]
000d21c4  add     r1, pc ; -> 0x000fcb44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1cc
000d21c6  ldr     r2, [r5, r2]
000d21c8  ldr     r1, [r1]
000d21ca  blx     #0xddbfc ; -> objc_msgSend
000d21ce  sub.w   sp, r7, #0x18
000d21d2  pop.w   {r8, sl, fp}
000d21d6  pop     {r4, r5, r6, r7, pc}
000d21d8  strh    r4, [r0, #0x10]
000d21da  movs    r2, r0
000d21dc  cbnz    r2, #0xd221a
000d21de  movs    r2, r0
000d21e0  strh    r4, [r1, #0x10]
000d21e2  movs    r2, r0
000d21e4  add     r4, sp, #0xb0
000d21e6  movs    r2, r0
000d21e8  add     r0, sp, #0x2b0
000d21ea  movs    r2, r0
000d21ec  revsh   r0, r1
000d21ee  movs    r2, r0
000d21f0  add     r3, sp, #0x358
000d21f2  movs    r2, r0
000d21f4  lsls    r4, r7, #0x1f
000d21f6  movs    r3, r1
000d21f8  strh    r4, [r0, #0xe]
000d21fa  movs    r2, r0
000d21fc  revsh   r2, r1
000d21fe  movs    r2, r0
000d2200  add     r0, sp, #0x1f0
000d2202  movs    r2, r0
000d2204  add     r0, sp, #0x2f0
000d2206  movs    r2, r0
000d2208  add     r3, sp, #0x2e8
000d220a  movs    r2, r0
000d220c  movs    r0, r0
000d220e  lsls    r0, r4
000d2210  movs    r0, r0
000d2212  rors    r0, r6
