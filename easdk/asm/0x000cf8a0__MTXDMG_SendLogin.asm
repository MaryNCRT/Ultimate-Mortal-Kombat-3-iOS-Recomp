========================================================================
MTXDMG_SendLogin  0x000cf8a0  72 bytes   EAMTX_DMGController.mm
========================================================================

000cf8a0  push    {r4, r7, lr}
000cf8a2  add     r7, sp, #4
000cf8a4  ldr     r1, [pc, #0x2c]
000cf8a6  mov     r4, r0
000cf8a8  ldr     r0, [pc, #0x2c]
000cf8aa  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000cf8ac  add     r0, pc ; -> 0x000fdce8  
000cf8ae  ldr     r1, [r1]
000cf8b0  ldr     r0, [r0]
000cf8b2  blx     #0xddbfc ; -> objc_msgSend
000cf8b6  ldr     r1, [pc, #0x24]
000cf8b8  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000cf8ba  ldr     r1, [r1]
000cf8bc  blx     #0xddbfc ; -> objc_msgSend
000cf8c0  ldr     r1, [pc, #0x1c]
000cf8c2  ldr     r3, [pc, #0x20]
000cf8c4  mov     r2, r4
000cf8c6  add     r1, pc ; -> 0x000fd88c  '=\x12\x0f'
000cf8c8  add     r3, pc ; -> 0x0017cfe0  gpDMGLogin
000cf8ca  ldr     r1, [r1]
000cf8cc  str     r0, [r3]
000cf8ce  blx     #0xddbfc ; -> objc_msgSend
000cf8d2  pop     {r4, r7, pc}
000cf8d4  beq     #0xcf884
000cf8d6  movs    r2, r0
000cf8d8  b       #0xcf14c
000cf8da  movs    r2, r0
000cf8dc  beq     #0xcf868
000cf8de  movs    r2, r0
000cf8e0  svc     #0xc2
000cf8e2  movs    r2, r0
000cf8e4  bvc     #0xcf910
000cf8e6  movs    r2, r1
