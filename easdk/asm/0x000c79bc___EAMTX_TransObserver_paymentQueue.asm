========================================================================
-[EAMTX_TransObserver paymentQueue  0x000c79bc  256 bytes   EAMTX_TransObserver.mm
========================================================================

000c79bc  push    {r4, r5, r6, r7, lr}
000c79be  add     r7, sp, #0xc
000c79c0  push.w  {r8, sl, fp}
000c79c4  sub     sp, #0x78
000c79c6  str     r0, [sp, #4]
000c79c8  ldr     r0, [pc, #0xd4]
000c79ca  mov     fp, r3
000c79cc  add     r0, pc ; -> 0x00181574  
000c79ce  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c79d2  ldr     r1, [pc, #0xd0]
000c79d4  movs    r3, #0
000c79d6  mov     r0, fp
000c79d8  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000c79da  str     r3, [sp, #0x58]
000c79dc  ldr     r1, [r1]
000c79de  str     r3, [sp, #0x5c]
000c79e0  str     r3, [sp, #0x60]
000c79e2  str     r3, [sp, #0x64]
000c79e4  str     r3, [sp, #0x68]
000c79e6  str     r3, [sp, #0x6c]
000c79e8  str     r3, [sp, #0x70]
000c79ea  str     r3, [sp, #0x74]
000c79ec  add     r2, sp, #0x58
000c79ee  adds    r3, #0x10
000c79f0  str     r3, [sp]
000c79f2  add     r3, sp, #0x18
000c79f4  str     r1, [sp, #8]
000c79f6  blx     #0xddbfc ; -> objc_msgSend
000c79fa  cmp     r0, #0
000c79fc  beq     #0xc7a94
000c79fe  ldr     r1, [pc, #0xa8]
000c7a00  ldr     r3, [sp, #0x60]
000c7a02  mov     r6, r0
000c7a04  add     r1, pc ; -> 0x000fd738  
000c7a06  ldr.w   r8, [r1]
000c7a0a  ldr     r1, [pc, #0xa0]
000c7a0c  ldr.w   sl, [r3]
000c7a10  add     r1, pc ; -> 0x000fd744  '\x1e\x01\x0f'
000c7a12  ldr     r1, [r1]
000c7a14  str     r1, [sp, #0xc]
000c7a16  ldr     r1, [pc, #0x98]
000c7a18  add     r1, pc ; -> 0x000fd740  'E\x01\x0f'
000c7a1a  ldr     r1, [r1]
000c7a1c  str     r1, [sp, #0x10]
000c7a1e  ldr     r1, [pc, #0x94]
000c7a20  add     r1, pc ; -> 0x000fd73c  '2\x01\x0f'
000c7a22  ldr     r1, [r1]
000c7a24  str     r1, [sp, #0x14]
000c7a26  b       #0xc7a2a
000c7a28  ldr     r3, [sp, #0x60]
000c7a2a  movs    r5, #0
000c7a2c  b       #0xc7a30
000c7a2e  ldr     r3, [sp, #0x60]
000c7a30  ldr     r3, [r3]
000c7a32  cmp     r3, sl
000c7a34  beq     #0xc7a3c
000c7a36  mov     r0, fp
000c7a38  blx     #0xddbe4 ; -> objc_enumerationMutation
000c7a3c  ldr     r0, [sp, #0x5c]
000c7a3e  mov     r1, r8
000c7a40  ldr.w   r4, [r0, r5, lsl #2]
000c7a44  mov     r0, r4
000c7a46  blx     #0xddbfc ; -> objc_msgSend
000c7a4a  cmp     r0, #3
000c7a4c  bhi     #0xc7a78
000c7a4e  tbb     [pc, r0]
000c7a52  lsrs    r3, r0, #0xc
000c7a54  lsrs    r6, r1, #0x20
000c7a56  movs    r3, r2
000c7a58  ldr     r0, [pc, #0x5c]
000c7a5a  add     r0, pc ; -> 0x00181584  
000c7a5c  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c7a60  b       #0xc7a78
000c7a62  ldr     r0, [sp, #4]
000c7a64  ldr     r1, [sp, #0xc]
000c7a66  b       #0xc7a72
000c7a68  ldr     r0, [sp, #4]
000c7a6a  ldr     r1, [sp, #0x10]
000c7a6c  b       #0xc7a72
000c7a6e  ldr     r0, [sp, #4]
000c7a70  ldr     r1, [sp, #0x14]
000c7a72  mov     r2, r4
000c7a74  blx     #0xddbfc ; -> objc_msgSend
000c7a78  adds    r5, #1
000c7a7a  cmp     r6, r5
000c7a7c  bhi     #0xc7a2e
000c7a7e  movs    r3, #0x10
000c7a80  mov     r0, fp
000c7a82  str     r3, [sp]
000c7a84  ldr     r1, [sp, #8]
000c7a86  add     r2, sp, #0x58
000c7a88  add     r3, sp, #0x18
000c7a8a  blx     #0xddbfc ; -> objc_msgSend
000c7a8e  mov     r6, r0
000c7a90  cmp     r0, #0
000c7a92  bne     #0xc7a28
000c7a94  sub.w   sp, r7, #0x18
000c7a98  pop.w   {r8, sl, fp}
000c7a9c  pop     {r4, r5, r6, r7, pc}
000c7a9e  nop     
000c7aa0  ldr     r3, [sp, #0x290]
000c7aa2  movs    r3, r1
000c7aa4  ldr     r7, [pc, #0x2f0]
000c7aa6  movs    r3, r0
000c7aa8  ldrb    r0, [r6, r4]
000c7aaa  movs    r3, r0
000c7aac  ldrb    r0, [r6, r4]
000c7aae  movs    r3, r0
000c7ab0  ldrb    r4, [r4, r4]
000c7ab2  movs    r3, r0
000c7ab4  ldrb    r0, [r3, r4]
000c7ab6  movs    r3, r0
000c7ab8  ldr     r3, [sp, #0x98]
000c7aba  movs    r3, r1
