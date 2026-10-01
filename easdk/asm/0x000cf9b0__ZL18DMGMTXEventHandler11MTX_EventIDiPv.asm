========================================================================
ZL18DMGMTXEventHandler11MTX_EventIDiPv  0x000cf9b0  36 bytes   EAMTX_DMGController.mm
========================================================================

000cf9b0  push    {r7, lr}
000cf9b2  add     r7, sp, #0
000cf9b4  subs    r0, #1
000cf9b6  cmp     r0, #1
000cf9b8  bhi     #0xcf9ca
000cf9ba  ldr     r0, [pc, #0x10]
000cf9bc  ldr     r1, [pc, #0x10]
000cf9be  add     r0, pc ; -> 0x0017cfdc  gpDMGController
000cf9c0  add     r1, pc ; -> 0x000fd8b8  '\x01\x13\x0f'
000cf9c2  ldr     r0, [r0]
000cf9c4  ldr     r1, [r1]
000cf9c6  blx     #0xddbfc ; -> objc_msgSend
000cf9ca  pop     {r7, pc}
000cf9cc  bvs     #0xcfa04
000cf9ce  movs    r2, r1
000cf9d0  udf     #0xf4
000cf9d2  movs    r2, r0
