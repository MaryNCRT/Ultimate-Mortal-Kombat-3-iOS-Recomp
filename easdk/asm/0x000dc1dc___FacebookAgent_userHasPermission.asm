========================================================================
-[FacebookAgent userHasPermission  0x000dc1dc  172 bytes   FacebookAgent.mm
========================================================================

000dc1dc  push    {r4, r7, lr}
000dc1de  add     r7, sp, #4
000dc1e0  sub     sp, #8
000dc1e2  ldr     r1, [pc, #0x74]
000dc1e4  cmp     r2, #1
000dc1e6  mov     r4, r0
000dc1e8  add     r1, pc ; -> 0x000fc8cc  OBJC_IVAR_$_FacebookAgent.permissionRequested
000dc1ea  ldr     r1, [r1]
000dc1ec  strb    r3, [r0, r1]
000dc1ee  bne     #0xdc200
000dc1f0  ldr     r3, [pc, #0x68]
000dc1f2  adds    r2, #7
000dc1f4  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dc1f6  ldr     r3, [r3]
000dc1f8  str     r2, [r0, r3]
000dc1fa  ldr     r2, [pc, #0x64]
000dc1fc  add     r2, pc ; -> 0x00182594  
000dc1fe  b       #0xdc20e
000dc200  ldr     r3, [pc, #0x60]
000dc202  movs    r2, #7
000dc204  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dc206  ldr     r3, [r3]
000dc208  str     r2, [r0, r3]
000dc20a  ldr     r2, [pc, #0x5c]
000dc20c  add     r2, pc ; -> 0x001825a4  
000dc20e  ldr     r0, [pc, #0x5c]
000dc210  ldr     r1, [pc, #0x5c]
000dc212  ldr     r3, [pc, #0x60]
000dc214  add     r0, pc ; -> 0x000fdbf4  
000dc216  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
000dc218  add     r3, pc ; -> 0x0017eec4  
000dc21a  ldr     r1, [r1]
000dc21c  ldr     r0, [r0]
000dc21e  mov.w   ip, #0
000dc222  str.w   ip, [sp]
000dc226  blx     #0xddbfc ; -> objc_msgSend
000dc22a  ldr     r2, [pc, #0x4c]
000dc22c  ldr     r1, [pc, #0x4c]
000dc22e  ldr.w   ip, [pc, #0x50]
000dc232  add     r2, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dc234  add     r1, pc ; -> 0x000fd9d4  '\\\x1c\x0f'
000dc236  ldr     r2, [r2]
000dc238  ldr     r1, [r1]
000dc23a  add     ip, pc ; -> 0x0017e7a4  
000dc23c  str     r4, [sp, #4]
000dc23e  str.w   ip, [sp]
000dc242  mov     r3, r0
000dc244  ldr     r0, [r4, r2]
000dc246  ldr     r2, [pc, #0x3c]
000dc248  add     r2, pc ; -> 0x001825b4  
000dc24a  blx     #0xddbfc ; -> objc_msgSend
000dc24e  movs    r0, #1
000dc250  sub.w   sp, r7, #4
000dc254  pop     {r4, r7, pc}
000dc256  nop     
000dc258  lsls    r0, r4, #0x1b
000dc25a  movs    r2, r0
000dc25c  lsls    r0, r2, #0x1b
000dc25e  movs    r2, r0
000dc260  str     r4, [r2, #0x38]
000dc262  movs    r2, r1
000dc264  lsls    r0, r0, #0x1b
000dc266  movs    r2, r0
000dc268  str     r4, [r2, #0x38]
000dc26a  movs    r2, r1
000dc26c  adds    r4, r3, r7
000dc26e  movs    r2, r0
000dc270  lsls    r2, r4, #0x1f
000dc272  movs    r2, r0
000dc274  cmp     r4, #0xa8
000dc276  movs    r2, r1
000dc278  lsls    r2, r0, #0x1a
000dc27a  movs    r2, r0
000dc27c  asrs    r4, r3, #0x1e
000dc27e  movs    r2, r0
000dc280  movs    r5, #0x66
000dc282  movs    r2, r1
000dc284  str     r0, [r5, #0x34]
000dc286  movs    r2, r1
