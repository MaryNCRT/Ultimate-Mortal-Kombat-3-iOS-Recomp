========================================================================
-[EAMTX_Controller removeHWIDReqInQ]  0x000ca788  236 bytes   EAMTX_Controller.mm
========================================================================

000ca788  push    {r4, r5, r6, r7, lr}
000ca78a  add     r7, sp, #0xc
000ca78c  push.w  {r8, sl, fp}
000ca790  sub     sp, #4
000ca792  ldr     r3, [pc, #0xb4]
000ca794  mov     r6, r0
000ca796  add     r3, pc ; -> 0x000f8c14  OBJC_IVAR_$_EAMTX_Controller.requestsQ
000ca798  ldr     r0, [r3]
000ca79a  ldr     r0, [r6, r0]
000ca79c  cmp     r0, #0
000ca79e  beq     #0xca83e
000ca7a0  ldr     r1, [pc, #0xa8]
000ca7a2  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000ca7a4  ldr     r4, [r1]
000ca7a6  mov     r1, r4
000ca7a8  blx     #0xddbfc ; -> objc_msgSend
000ca7ac  cmp     r0, #0
000ca7ae  beq     #0xca83e
000ca7b0  b       #0xca7f4
000ca7b2  ldr     r3, [pc, #0x9c]
000ca7b4  mov     r1, r8
000ca7b6  mov     r2, r5
000ca7b8  add     r3, pc ; -> 0x000f8c14  OBJC_IVAR_$_EAMTX_Controller.requestsQ
000ca7ba  ldr     r3, [r3]
000ca7bc  ldr     r0, [r6, r3]
000ca7be  blx     #0xddbfc ; -> objc_msgSend
000ca7c2  mov     r4, r0
000ca7c4  cbz     r0, #0xca7ec
000ca7c6  ldr     r2, [pc, #0x8c]
000ca7c8  mov     r1, fp
000ca7ca  add     r2, pc ; -> 0x00180634  
000ca7cc  blx     #0xddbfc ; -> objc_msgSend
000ca7d0  mov     r1, sl
000ca7d2  blx     #0xddbfc ; -> objc_msgSend
000ca7d6  cmp     r0, #0
000ca7d8  bgt     #0xca7ec
000ca7da  b       #0xca826
000ca7dc  ldr     r3, [pc, #0x78]
000ca7de  ldr     r1, [sp]
000ca7e0  mov     r2, r5
000ca7e2  add     r3, pc ; -> 0x000f8c14  OBJC_IVAR_$_EAMTX_Controller.requestsQ
000ca7e4  ldr     r3, [r3]
000ca7e6  ldr     r0, [r6, r3]
000ca7e8  blx     #0xddbfc ; -> objc_msgSend
000ca7ec  subs    r5, #1
000ca7ee  cmp     r5, #0
000ca7f0  bge     #0xca7b2
000ca7f2  b       #0xca83e
000ca7f4  ldr     r3, [pc, #0x64]
000ca7f6  mov     r1, r4
000ca7f8  add     r3, pc ; -> 0x000f8c14  OBJC_IVAR_$_EAMTX_Controller.requestsQ
000ca7fa  ldr     r3, [r3]
000ca7fc  ldr     r0, [r6, r3]
000ca7fe  blx     #0xddbfc ; -> objc_msgSend
000ca802  ldr     r1, [pc, #0x5c]
000ca804  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000ca806  ldr.w   r8, [r1]
000ca80a  ldr     r1, [pc, #0x58]
000ca80c  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000ca80e  ldr.w   fp, [r1]
000ca812  ldr     r1, [pc, #0x54]
000ca814  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000ca816  ldr.w   sl, [r1]
000ca81a  ldr     r1, [pc, #0x50]
000ca81c  add     r1, pc ; -> 0x000fced4  
000ca81e  ldr     r1, [r1]
000ca820  str     r1, [sp]
000ca822  subs    r5, r0, #1
000ca824  b       #0xca7ee
000ca826  ldr     r2, [pc, #0x48]
000ca828  mov     r1, fp
000ca82a  mov     r0, r4
000ca82c  add     r2, pc ; -> 0x001805e4  
000ca82e  blx     #0xddbfc ; -> objc_msgSend
000ca832  mov     r1, sl
000ca834  blx     #0xddbfc ; -> objc_msgSend
000ca838  cmp     r0, #6
000ca83a  bne     #0xca7ec
000ca83c  b       #0xca7dc
000ca83e  sub.w   sp, r7, #0x18
000ca842  pop.w   {r8, sl, fp}
000ca846  pop     {r4, r5, r6, r7, pc}
000ca848  b       #0xca140
000ca84a  movs    r2, r0
000ca84c  movs    r2, #0xda
000ca84e  movs    r3, r0
000ca850  b       #0xca104
000ca852  movs    r2, r0
000ca854  ldrsh   r6, [r4, r1]
000ca856  movs    r3, r1
000ca858  b       #0xca0b8
000ca85a  movs    r2, r0
000ca85c  b       #0xca090
000ca85e  movs    r2, r0
000ca860  movs    r2, #0x74
000ca862  movs    r3, r0
000ca864  movs    r2, #0xe0
000ca866  movs    r3, r0
000ca868  movs    r2, #0xd0
000ca86a  movs    r3, r0
000ca86c  movs    r6, #0xb4
000ca86e  movs    r3, r0
000ca870  ldrb    r4, [r6, r6]
000ca872  movs    r3, r1
