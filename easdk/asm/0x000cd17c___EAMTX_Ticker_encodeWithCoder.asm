========================================================================
-[EAMTX_Ticker encodeWithCoder  0x000cd17c  256 bytes   EAMTX_Ticker.mm
========================================================================

000cd17c  push    {r4, r5, r6, r7, lr}
000cd17e  add     r7, sp, #0xc
000cd180  push.w  {r8, sl, fp}
000cd184  ldr     r1, [pc, #0xbc]
000cd186  mov     r4, r0
000cd188  ldr     r0, [pc, #0xbc]
000cd18a  add     r1, pc ; -> 0x000fd1fc  
000cd18c  mov     r6, r2
000cd18e  ldr     r5, [r1]
000cd190  ldr     r1, [pc, #0xb8]
000cd192  add     r0, pc ; -> 0x000fdb5c  
000cd194  ldr.w   r8, [pc, #0xb8]
000cd198  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cd19a  ldr.w   fp, [r0]
000cd19e  ldr.w   sl, [r1]
000cd1a2  ldr     r1, [pc, #0xb0]
000cd1a4  mov     r0, r4
000cd1a6  add     r8, pc ; -> 0x0017e5c4  
000cd1a8  add     r1, pc ; -> 0x000fd1f8  
000cd1aa  ldr     r1, [r1]
000cd1ac  blx     #0xddbfc ; -> objc_msgSend
000cd1b0  mov     r1, sl
000cd1b2  mov     r2, r8
000cd1b4  mov     r3, r0
000cd1b6  mov     r0, fp
000cd1b8  blx     #0xddbfc ; -> objc_msgSend
000cd1bc  ldr     r3, [pc, #0x98]
000cd1be  mov     r1, r5
000cd1c0  add     r3, pc ; -> 0x0017fe14  
000cd1c2  mov     r2, r0
000cd1c4  mov     r0, r6
000cd1c6  blx     #0xddbfc ; -> objc_msgSend
000cd1ca  ldr     r1, [pc, #0x90]
000cd1cc  mov     r0, r4
000cd1ce  add     r1, pc ; -> 0x000fd1f4  
000cd1d0  ldr     r1, [r1]
000cd1d2  blx     #0xddbfc ; -> objc_msgSend
000cd1d6  ldr     r3, [pc, #0x88]
000cd1d8  mov     r1, r5
000cd1da  add     r3, pc ; -> 0x0017fe24  
000cd1dc  mov     r2, r0
000cd1de  mov     r0, r6
000cd1e0  blx     #0xddbfc ; -> objc_msgSend
000cd1e4  ldr     r1, [pc, #0x7c]
000cd1e6  mov     r0, r4
000cd1e8  add     r1, pc ; -> 0x000fd1f0  
000cd1ea  ldr     r1, [r1]
000cd1ec  blx     #0xddbfc ; -> objc_msgSend
000cd1f0  ldr     r3, [pc, #0x74]
000cd1f2  mov     r1, r5
000cd1f4  add     r3, pc ; -> 0x0017fe34  
000cd1f6  mov     r2, r0
000cd1f8  mov     r0, r6
000cd1fa  blx     #0xddbfc ; -> objc_msgSend
000cd1fe  ldr     r1, [pc, #0x6c]
000cd200  mov     r0, r4
000cd202  add     r1, pc ; -> 0x000fd1ec  
000cd204  ldr     r1, [r1]
000cd206  blx     #0xddbfc ; -> objc_msgSend
000cd20a  ldr     r3, [pc, #0x64]
000cd20c  mov     r1, r5
000cd20e  add     r3, pc ; -> 0x0017fe44  
000cd210  mov     r2, r0
000cd212  mov     r0, r6
000cd214  blx     #0xddbfc ; -> objc_msgSend
000cd218  ldr     r1, [pc, #0x58]
000cd21a  mov     r0, r4
000cd21c  add     r1, pc ; -> 0x000fd1e8  
000cd21e  ldr     r1, [r1]
000cd220  blx     #0xddbfc ; -> objc_msgSend
000cd224  mov     r1, sl
000cd226  mov     r2, r8
000cd228  mov     r3, r0
000cd22a  mov     r0, fp
000cd22c  blx     #0xddbfc ; -> objc_msgSend
000cd230  ldr     r3, [pc, #0x44]
000cd232  mov     r1, r5
000cd234  add     r3, pc ; -> 0x0017e754  
000cd236  mov     r2, r0
000cd238  mov     r0, r6
000cd23a  blx     #0xddbfc ; -> objc_msgSend
000cd23e  pop.w   {r8, sl, fp}
000cd242  pop     {r4, r5, r6, r7, pc}
000cd244  lsls    r6, r5, #1
000cd246  movs    r3, r0
000cd248  lsrs    r6, r0, #7
000cd24a  movs    r3, r0
000cd24c  vst4.8  {d0, d1, d2, d3}, [r4], r2
000cd250  asrs    r2, r3, #0x10
000cd252  movs    r3, r1
000cd254  lsls    r4, r1, #1
000cd256  movs    r3, r0
000cd258  cmp     r4, #0x50
000cd25a  movs    r3, r1
000cd25c  movs    r2, r4
000cd25e  movs    r3, r0
000cd260  cmp     r4, #0x46
000cd262  movs    r3, r1
000cd264  movs    r4, r0
000cd266  movs    r3, r0
000cd268  cmp     r4, #0x3c
000cd26a  movs    r3, r1
000cd26c  vaddl.u32 q8, d6, d2
000cd270  cmp     r4, #0x32
000cd272  movs    r3, r1
000cd274  vaddl.u8 q8, d8, d2
000cd278  asrs    r4, r3, #0x14
000cd27a  movs    r3, r1
