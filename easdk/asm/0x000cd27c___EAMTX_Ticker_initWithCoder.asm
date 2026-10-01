========================================================================
-[EAMTX_Ticker initWithCoder  0x000cd27c  248 bytes   EAMTX_Ticker.mm
========================================================================

000cd27c  push    {r4, r5, r6, r7, lr}
000cd27e  add     r7, sp, #0xc
000cd280  sub     sp, #8
000cd282  ldr     r3, [pc, #0xb8]
000cd284  ldr     r1, [pc, #0xb8]
000cd286  str     r0, [sp]
000cd288  add     r3, pc ; -> 0x000fddb0  
000cd28a  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000cd28c  ldr     r3, [r3]
000cd28e  ldr     r1, [r1]
000cd290  mov     r0, sp
000cd292  mov     r6, r2
000cd294  str     r3, [sp, #4]
000cd296  blx     #0xddc08 ; -> objc_msgSendSuper2
000cd29a  mov     r4, r0
000cd29c  cmp     r0, #0
000cd29e  beq     #0xcd332
000cd2a0  ldr     r1, [pc, #0xa0]
000cd2a2  ldr     r2, [pc, #0xa4]
000cd2a4  mov     r0, r6
000cd2a6  add     r1, pc ; -> 0x000fd214  
000cd2a8  add     r2, pc ; -> 0x0017fe14  
000cd2aa  ldr     r5, [r1]
000cd2ac  mov     r1, r5
000cd2ae  blx     #0xddbfc ; -> objc_msgSend
000cd2b2  ldr     r1, [pc, #0x98]
000cd2b4  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000cd2b6  ldr     r1, [r1]
000cd2b8  blx     #0xddbfc ; -> objc_msgSend
000cd2bc  ldr     r1, [pc, #0x90]
000cd2be  add     r1, pc ; -> 0x000fd210  
000cd2c0  ldr     r1, [r1]
000cd2c2  mov     r2, r0
000cd2c4  mov     r0, r4
000cd2c6  blx     #0xddbfc ; -> objc_msgSend
000cd2ca  ldr     r2, [pc, #0x88]
000cd2cc  mov     r1, r5
000cd2ce  mov     r0, r6
000cd2d0  add     r2, pc ; -> 0x0017fe24  
000cd2d2  blx     #0xddbfc ; -> objc_msgSend
000cd2d6  ldr     r1, [pc, #0x80]
000cd2d8  add     r1, pc ; -> 0x000fd20c  
000cd2da  ldr     r1, [r1]
000cd2dc  mov     r2, r0
000cd2de  mov     r0, r4
000cd2e0  blx     #0xddbfc ; -> objc_msgSend
000cd2e4  ldr     r2, [pc, #0x74]
000cd2e6  mov     r1, r5
000cd2e8  mov     r0, r6
000cd2ea  add     r2, pc ; -> 0x0017fe34  
000cd2ec  blx     #0xddbfc ; -> objc_msgSend
000cd2f0  ldr     r1, [pc, #0x6c]
000cd2f2  add     r1, pc ; -> 0x000fd208  
000cd2f4  ldr     r1, [r1]
000cd2f6  mov     r2, r0
000cd2f8  mov     r0, r4
000cd2fa  blx     #0xddbfc ; -> objc_msgSend
000cd2fe  ldr     r2, [pc, #0x64]
000cd300  mov     r1, r5
000cd302  mov     r0, r6
000cd304  add     r2, pc ; -> 0x0017fe44  
000cd306  blx     #0xddbfc ; -> objc_msgSend
000cd30a  ldr     r1, [pc, #0x5c]
000cd30c  add     r1, pc ; -> 0x000fd204  
000cd30e  ldr     r1, [r1]
000cd310  mov     r2, r0
000cd312  mov     r0, r4
000cd314  blx     #0xddbfc ; -> objc_msgSend
000cd318  ldr     r2, [pc, #0x50]
000cd31a  mov     r1, r5
000cd31c  mov     r0, r6
000cd31e  add     r2, pc ; -> 0x0017e754  
000cd320  blx     #0xddbfc ; -> objc_msgSend
000cd324  ldr     r1, [pc, #0x48]
000cd326  add     r1, pc ; -> 0x000fd200  
000cd328  ldr     r1, [r1]
000cd32a  mov     r2, r0
000cd32c  mov     r0, r4
000cd32e  blx     #0xddbfc ; -> objc_msgSend
000cd332  mov     r0, r4
000cd334  sub.w   sp, r7, #0xc
000cd338  pop     {r4, r5, r6, r7, pc}
000cd33a  nop     
000cd33c  lsrs    r4, r4, #0xc
000cd33e  movs    r3, r0
