========================================================================
FBCreateNonRetainingArray  0x000824c0  72 bytes   FBConnectGlobal.m
========================================================================

000824c0  push    {r4, r7, lr}
000824c2  add     r7, sp, #4
000824c4  sub     sp, #0x14
000824c6  ldr     r0, [pc, #0x34]
000824c8  mov     ip, sp
000824ca  add     r0, pc ; -> 0x000f3384  0x0
000824cc  ldr.w   lr, [r0]
000824d0  mov     r4, lr
000824d2  ldm     r4!, {r0, r1, r2, r3}
000824d4  stm.w   ip!, {r0, r1, r2, r3}
000824d8  ldr.w   r0, [lr, #0x10]
000824dc  ldr     r3, [pc, #0x20]
000824de  mov     r2, sp
000824e0  str.w   r0, [ip]
000824e4  add     r3, pc ; -> 0x000824b9  RetainNoOp
000824e6  movs    r0, #0
000824e8  str     r3, [sp, #4]
000824ea  ldr     r3, [pc, #0x18]
000824ec  mov     r1, r0
000824ee  add     r3, pc ; -> 0x000824bd  ReleaseNoOp
000824f0  str     r3, [sp, #8]
000824f2  blx     #0xdd0e0 ; -> CFArrayCreateMutable
000824f6  sub.w   sp, r7, #4
000824fa  pop     {r4, r7, pc}
000824fc  lsrs    r6, r6, #0x1a
000824fe  movs    r7, r0
