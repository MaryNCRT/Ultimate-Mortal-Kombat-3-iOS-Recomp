========================================================================
SetBadgesForItems  0x000b574c  184 bytes   EAMTX_Main.mm
========================================================================

000b574c  push    {r4, r5, r6, r7, lr}
000b574e  add     r7, sp, #0xc
000b5750  push.w  {r8, sl, fp}
000b5754  sub     sp, #8
000b5756  mov     r6, r0
000b5758  cmp     r0, #0
000b575a  beq     #0xb57de
000b575c  ldr     r1, [pc, #0x90]
000b575e  movs    r5, #0
000b5760  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000b5762  ldr.w   fp, [r1]
000b5766  ldr     r1, [pc, #0x8c]
000b5768  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000b576a  ldr     r1, [r1]
000b576c  str     r1, [sp]
000b576e  ldr     r1, [pc, #0x88]
000b5770  add     r1, pc ; -> 0x000fd3c0  
000b5772  ldr.w   r8, [r1]
000b5776  ldr     r1, [pc, #0x84]
000b5778  add     r1, pc ; -> 0x000fcef4  
000b577a  ldr     r1, [r1]
000b577c  str     r1, [sp, #4]
000b577e  ldr     r1, [pc, #0x80]
000b5780  add     r1, pc ; -> 0x000fd3c4  
000b5782  ldr.w   sl, [r1]
000b5786  b       #0xb57c8
000b5788  ldr     r1, [sp]
000b578a  mov     r0, r6
000b578c  mov     r2, r5
000b578e  blx     #0xddbfc ; -> objc_msgSend
000b5792  mov     r1, r8
000b5794  mov     r4, r0
000b5796  blx     #0xddbfc ; -> objc_msgSend
000b579a  cbz     r0, #0xb57bc
000b579c  mov     r1, r8
000b579e  mov     r0, r4
000b57a0  blx     #0xddbfc ; -> objc_msgSend
000b57a4  ldr     r1, [sp, #4]
000b57a6  blx     #0xddbfc ; -> objc_msgSend
000b57aa  vldr    d6, [pc, #0x3c]
000b57ae  vmov    d7, r0, r1
000b57b2  vcmpe.f64 d7, d6
000b57b6  vmrs    apsr_nzcv, fpscr
000b57ba  ble     #0xb57d6
000b57bc  movs    r2, #1
000b57be  mov     r0, r4
000b57c0  mov     r1, sl
000b57c2  blx     #0xddbfc ; -> objc_msgSend
000b57c6  adds    r5, #1
000b57c8  mov     r0, r6
000b57ca  mov     r1, fp
000b57cc  blx     #0xddbfc ; -> objc_msgSend
000b57d0  cmp     r0, r5
000b57d2  bhi     #0xb5788
000b57d4  b       #0xb57de
000b57d6  movs    r2, #0
000b57d8  mov     r0, r4
000b57da  mov     r1, sl
000b57dc  b       #0xb57c2
000b57de  sub.w   sp, r7, #0x18
000b57e2  pop.w   {r8, sl, fp}
000b57e6  pop     {r4, r5, r6, r7, pc}
000b57e8  movs    r0, r0
000b57ea  movs    r0, r0
000b57ec  stm     r6!, {r7}
000b57ee  stm     r1!, {r0, r1, r4, r5}
000b57f0  strb    r4, [r3, #0xc]
000b57f2  movs    r4, r0
000b57f4  strb    r0, [r2, #0xc]
000b57f6  movs    r4, r0
000b57f8  ldrb    r4, [r1, #0x11]
000b57fa  movs    r4, r0
000b57fc  strb    r0, [r7, #0x1d]
000b57fe  movs    r4, r0
000b5800  ldrb    r0, [r0, #0x11]
000b5802  movs    r4, r0
