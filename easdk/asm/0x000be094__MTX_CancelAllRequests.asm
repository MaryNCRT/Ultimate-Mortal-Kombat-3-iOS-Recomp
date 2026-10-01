========================================================================
MTX_CancelAllRequests  0x000be094  272 bytes   EAMTX_Main.mm
========================================================================

000be094  push    {r4, r5, r6, r7, lr}
000be096  add     r7, sp, #0xc
000be098  push.w  {r8, sl, fp}
000be09c  sub     sp, #0x68
000be09e  bl      #0xbd408 ; -> Z18CheckMTXControllerv
000be0a2  ldr     r1, [pc, #0xd8]
000be0a4  ldr     r0, [pc, #0xd8]
000be0a6  add     r1, pc ; -> 0x000fd694  
000be0a8  add     r0, pc ; -> 0x0038c0e4  mtxController
000be0aa  ldr     r1, [r1]
000be0ac  ldr     r0, [r0]
000be0ae  str     r1, [sp, #4]
000be0b0  blx     #0xddbfc ; -> objc_msgSend
000be0b4  ldr     r1, [pc, #0xcc]
000be0b6  add     r1, pc ; -> 0x000fce70  'F=\x0e'
000be0b8  ldr     r1, [r1]
000be0ba  blx     #0xddbfc ; -> objc_msgSend
000be0be  ldr     r1, [pc, #0xc8]
000be0c0  movs    r3, #0
000be0c2  add     r2, sp, #0x48
000be0c4  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000be0c6  str     r3, [sp, #0x48]
000be0c8  ldr.w   fp, [r1]
000be0cc  str     r3, [sp, #0x4c]
000be0ce  str     r3, [sp, #0x50]
000be0d0  str     r3, [sp, #0x54]
000be0d2  str     r3, [sp, #0x58]
000be0d4  str     r3, [sp, #0x5c]
000be0d6  str     r3, [sp, #0x60]
000be0d8  str     r3, [sp, #0x64]
000be0da  mov     r1, fp
000be0dc  adds    r3, #0x10
000be0de  str     r3, [sp]
000be0e0  add     r3, sp, #8
000be0e2  mov     sl, r0
000be0e4  blx     #0xddbfc ; -> objc_msgSend
000be0e8  cbz     r0, #0xbe13a
000be0ea  ldr     r1, [pc, #0xa0]
000be0ec  ldr     r3, [sp, #0x50]
000be0ee  mov     r5, r0
000be0f0  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000be0f2  ldr.w   r8, [r3]
000be0f6  ldr     r6, [r1]
000be0f8  b       #0xbe0fc
000be0fa  ldr     r3, [sp, #0x50]
000be0fc  movs    r4, #0
000be0fe  b       #0xbe102
000be100  ldr     r3, [sp, #0x50]
000be102  ldr     r3, [r3]
000be104  cmp     r3, r8
000be106  beq     #0xbe10e
000be108  mov     r0, sl
000be10a  blx     #0xddbe4 ; -> objc_enumerationMutation
000be10e  ldr     r3, [sp, #0x4c]
000be110  mov     r1, r6
000be112  ldr.w   r0, [r3, r4, lsl #2]
000be116  blx     #0xddbfc ; -> objc_msgSend
000be11a  adds    r4, #1
000be11c  bl      #0xbb64c ; -> Z24MTX_CancelNetworkRequesti
000be120  cmp     r5, r4
000be122  bhi     #0xbe100
000be124  movs    r3, #0x10
000be126  mov     r0, sl
000be128  str     r3, [sp]
000be12a  mov     r1, fp
000be12c  add     r2, sp, #0x48
000be12e  add     r3, sp, #8
000be130  blx     #0xddbfc ; -> objc_msgSend
000be134  mov     r5, r0
000be136  cmp     r0, #0
000be138  bne     #0xbe0fa
000be13a  ldr     r0, [pc, #0x54]
000be13c  ldr     r1, [sp, #4]
000be13e  ldr     r4, [pc, #0x54]
000be140  add     r0, pc ; -> 0x0038c0e4  mtxController
000be142  ldr     r0, [r0]
000be144  blx     #0xddbfc ; -> objc_msgSend
000be148  ldr     r1, [pc, #0x4c]
000be14a  add     r4, pc ; -> 0x0038c0c4  mtxtransObserver
000be14c  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000be14e  ldr     r1, [r1]
000be150  blx     #0xddbfc ; -> objc_msgSend
000be154  ldr     r0, [r4]
000be156  cbz     r0, #0xbe172
000be158  ldr     r1, [pc, #0x40]
000be15a  movs    r2, #2
000be15c  add     r1, pc ; -> 0x000fd69c  
000be15e  ldr     r1, [r1]
000be160  blx     #0xddbfc ; -> objc_msgSend
000be164  ldr     r1, [pc, #0x38]
000be166  ldr     r0, [r4]
000be168  movs    r2, #2
000be16a  add     r1, pc ; -> 0x000fd698  
000be16c  ldr     r1, [r1]
000be16e  blx     #0xddbfc ; -> objc_msgSend
000be172  sub.w   sp, r7, #0x18
000be176  pop.w   {r8, sl, fp}
000be17a  pop     {r4, r5, r6, r7, pc}
