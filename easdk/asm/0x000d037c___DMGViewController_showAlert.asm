========================================================================
-[DMGViewController showAlert  0x000d037c  224 bytes   DMGViewController.mm
========================================================================

000d037c  push    {r4, r5, r6, r7, lr}
000d037e  add     r7, sp, #0xc
000d0380  push.w  {r8, sl}
000d0384  sub     sp, #0xc
000d0386  mov     sl, r3
000d0388  ldr     r3, [pc, #0x98]
000d038a  ldr     r1, [pc, #0x9c]
000d038c  mov     r5, r0
000d038e  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d0390  add     r1, pc ; -> 0x000fda8c  'g\x14\x0f'
000d0392  ldr     r3, [r3]
000d0394  ldr     r1, [r1]
000d0396  ldr     r0, [r0, r3]
000d0398  blx     #0xddbfc ; -> objc_msgSend
000d039c  cmp     r0, #1
000d039e  beq     #0xd03bc
000d03a0  ldr     r0, [pc, #0x88]
000d03a2  ldr     r1, [pc, #0x8c]
000d03a4  add     r0, pc ; -> 0x000fdb80  
000d03a6  add     r1, pc ; -> 0x000fcb00  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x188
000d03a8  ldr     r0, [r0]
000d03aa  ldr     r1, [r1]
000d03ac  blx     #0xddbfc ; -> objc_msgSend
000d03b0  ldr     r1, [pc, #0x80]
000d03b2  movs    r2, #1
000d03b4  add     r1, pc ; -> 0x000fcafc  ']\x1a\x0e'
000d03b6  ldr     r1, [r1]
000d03b8  blx     #0xddbfc ; -> objc_msgSend
000d03bc  ldr     r0, [pc, #0x78]
000d03be  ldr     r1, [pc, #0x7c]
000d03c0  ldr     r4, [pc, #0x7c]
000d03c2  add     r0, pc ; -> 0x000fdc4c  
000d03c4  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d03c6  ldr     r0, [r0]
000d03c8  ldr     r1, [r1]
000d03ca  blx     #0xddbfc ; -> objc_msgSend
000d03ce  ldr     r1, [pc, #0x74]
000d03d0  ldr     r3, [pc, #0x74]
000d03d2  ldr     r2, [pc, #0x78]
000d03d4  add     r1, pc ; -> 0x000fd160  'my\x0e'
000d03d6  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d03d8  ldr     r6, [r1]
000d03da  ldr     r1, [pc, #0x74]
000d03dc  ldr     r3, [r3]
000d03de  add     r2, pc ; -> 0x001826b4  
000d03e0  add     r1, pc ; -> 0x000fda84  '5\x15\x0f'
000d03e2  add     r4, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000d03e4  ldr     r1, [r1]
000d03e6  mov     r8, r0
000d03e8  ldr     r0, [r5, r3]
000d03ea  blx     #0xddbfc ; -> objc_msgSend
000d03ee  mov     r2, r4
000d03f0  movs    r3, #0
000d03f2  mov     r1, r6
000d03f4  str     r3, [sp, #8]
000d03f6  mov     r3, sl
000d03f8  str     r5, [sp]
000d03fa  str     r0, [sp, #4]
000d03fc  mov     r0, r8
000d03fe  blx     #0xddbfc ; -> objc_msgSend
000d0402  ldr     r1, [pc, #0x50]
000d0404  add     r1, pc ; -> 0x000fcd8c  
000d0406  ldr     r1, [r1]
000d0408  mov     r4, r0
000d040a  blx     #0xddbfc ; -> objc_msgSend
000d040e  ldr     r1, [pc, #0x48]
000d0410  mov     r0, r4
000d0412  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d0414  ldr     r1, [r1]
000d0416  blx     #0xddbfc ; -> objc_msgSend
000d041a  sub.w   sp, r7, #0x14
000d041e  pop.w   {r8, sl}
000d0422  pop     {r4, r5, r6, r7, pc}
000d0424  ldr     r7, [sp, #0x48]
000d0426  movs    r2, r0
000d0428  bvs     #0xd041c
000d042a  movs    r2, r0
000d042c  bvc     #0xd03e0
000d042e  movs    r2, r0
000d0430  stm     r7!, {r1, r2, r4, r6}
000d0432  movs    r2, r0
000d0434  stm     r7!, {r2, r6}
000d0436  movs    r2, r0
000d0438  bhi     #0xd0348
000d043a  movs    r2, r0
000d043c  stm     r5!, {r2, r3, r4, r5, r7}
000d043e  movs    r2, r0
000d0440  svc     #0xe
000d0442  movs    r2, r1
000d0444  ldm     r5!, {r3, r7}
000d0446  movs    r2, r0
000d0448  ldr     r6, [sp, #0x328]
000d044a  movs    r2, r0
000d044c  movs    r2, #0xd2
000d044e  movs    r3, r1
000d0450  bvs     #0xd0394
000d0452  movs    r2, r0
000d0454  ldm     r1!, {r2, r7}
000d0456  movs    r2, r0
000d0458  stm     r5!, {r1, r2, r5, r6}
000d045a  movs    r2, r0
