========================================================================
-[FacebookAgent askPermission  0x000dc158  132 bytes   FacebookAgent.mm
========================================================================

000dc158  push    {r4, r7, lr}
000dc15a  add     r7, sp, #4
000dc15c  cmp     r2, #1
000dc15e  mov     r4, r0
000dc160  bne     #0xdc17c
000dc162  ldr     r3, [pc, #0x50]
000dc164  adds    r2, #4
000dc166  ldr     r1, [pc, #0x50]
000dc168  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dc16a  ldr     r3, [r3]
000dc16c  add     r1, pc ; -> 0x000fd168  
000dc16e  str     r2, [r0, r3]
000dc170  ldr     r0, [pc, #0x48]
000dc172  ldr     r2, [pc, #0x4c]
000dc174  add     r0, pc ; -> 0x000fdb70  
000dc176  add     r2, pc ; -> 0x0017eab4  
000dc178  ldr     r0, [r0]
000dc17a  b       #0xdc194
000dc17c  ldr     r3, [pc, #0x44]
000dc17e  movs    r2, #4
000dc180  ldr     r1, [pc, #0x44]
000dc182  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dc184  ldr     r3, [r3]
000dc186  add     r1, pc ; -> 0x000fd168  
000dc188  str     r2, [r0, r3]
000dc18a  ldr     r0, [pc, #0x40]
000dc18c  ldr     r2, [pc, #0x40]
000dc18e  add     r0, pc ; -> 0x000fdb70  
000dc190  add     r2, pc ; -> 0x00182554  
000dc192  ldr     r0, [r0]
000dc194  ldr     r1, [r1]
000dc196  blx     #0xddbfc ; -> objc_msgSend
000dc19a  ldr     r3, [pc, #0x38]
000dc19c  ldr     r1, [pc, #0x38]
000dc19e  add     r3, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dc1a0  add     r1, pc ; -> 0x000fd9dc  
000dc1a2  ldr     r3, [r3]
000dc1a4  ldr     r1, [r1]
000dc1a6  mov     r2, r0
000dc1a8  ldr     r0, [r4, r3]
000dc1aa  mov     r3, r4
000dc1ac  blx     #0xddbfc ; -> objc_msgSend
000dc1b0  pop     {r4, r7, pc}
000dc1b2  nop     
000dc1b4  lsls    r4, r3, #0x1d
000dc1b6  movs    r2, r0
000dc1b8  lsrs    r0, r7, #0x1f
000dc1ba  movs    r2, r0
000dc1bc  adds    r0, r7, r7
000dc1be  movs    r2, r0
000dc1c0  cmp     r1, #0x3a
000dc1c2  movs    r2, r1
000dc1c4  lsls    r2, r0, #0x1d
000dc1c6  movs    r2, r0
000dc1c8  lsrs    r6, r3, #0x1f
000dc1ca  movs    r2, r0
000dc1cc  adds    r6, r3, r7
000dc1ce  movs    r2, r0
000dc1d0  str     r0, [r0, #0x3c]
000dc1d2  movs    r2, r1
000dc1d4  lsls    r6, r2, #0x1c
000dc1d6  movs    r2, r0
000dc1d8  adds    r0, r7, r0
000dc1da  movs    r2, r0
