========================================================================
-[FacebookAgent initWithAppId  0x000dc890  524 bytes   FacebookAgent.mm
========================================================================

000dc890  push    {r4, r5, r6, r7, lr}
000dc892  add     r7, sp, #0xc
000dc894  push.w  {r8, sl, fp}
000dc898  sub     sp, #0x88
000dc89a  ldr     r1, [pc, #0x1a4]
000dc89c  str     r3, [sp, #8]
000dc89e  ldr     r3, [pc, #0x1a4]
000dc8a0  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000dc8a2  str     r0, [sp, #0x80]
000dc8a4  add     r3, pc ; -> 0x000fde04  
000dc8a6  ldr.w   r8, [r1]
000dc8aa  ldr     r3, [r3]
000dc8ac  add     r0, sp, #0x80
000dc8ae  mov     r6, r2
000dc8b0  mov     r1, r8
000dc8b2  str     r3, [sp, #0x84]
000dc8b4  blx     #0xddc08 ; -> objc_msgSendSuper2
000dc8b8  mov     sl, r0
000dc8ba  cmp     r0, #0
000dc8bc  beq.w   #0xdca32
000dc8c0  ldr     r3, [pc, #0x184]
000dc8c2  ldr.w   r1, [pc, #0x188]
000dc8c6  add     r3, pc ; -> 0x000fc54c  OBJC_IVAR_$_FacebookAgent.fbApplicationId
000dc8c8  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000dc8ca  ldr     r3, [r3]
000dc8cc  ldr     r5, [r1]
000dc8ce  str     r6, [r0, r3]
000dc8d0  ldr     r0, [pc, #0x17c]
000dc8d2  ldr     r3, [pc, #0x180]
000dc8d4  mov     r1, r5
000dc8d6  add     r0, pc ; -> 0x000fdcfc  
000dc8d8  add     r3, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dc8da  ldr     r0, [r0]
000dc8dc  ldr     r4, [r3]
000dc8de  blx     #0xddbfc ; -> objc_msgSend
000dc8e2  ldr     r1, [pc, #0x174]
000dc8e4  mov     r2, r6
000dc8e6  add     r1, pc ; -> 0x000fd9ec  '\r\x1d\x0f'
000dc8e8  ldr     r1, [r1]
000dc8ea  blx     #0xddbfc ; -> objc_msgSend
000dc8ee  mov     r1, r5
000dc8f0  str.w   r0, [sl, r4]
000dc8f4  ldr     r0, [pc, #0x164]
000dc8f6  ldr     r4, [pc, #0x168]
000dc8f8  add     r0, pc ; -> 0x000fdbe8  
000dc8fa  add     r4, pc ; -> 0x000fc8b4  OBJC_IVAR_$_FacebookAgent.fbButton
000dc8fc  ldr     r0, [r0]
000dc8fe  ldr     r6, [r4]
000dc900  blx     #0xddbfc ; -> objc_msgSend
000dc904  ldr     r1, [pc, #0x15c]
000dc906  movs    r3, #0
000dc908  str     r3, [sp, #0x70]
000dc90a  str     r3, [sp, #0x74]
000dc90c  ldr     r3, [pc, #0x158]
000dc90e  add     r1, pc ; -> 0x000fccd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x35c
000dc910  add     r2, sp, #0x70
000dc912  ldr.w   ip, [r1]
000dc916  str     r3, [sp, #0x78]
000dc918  str     r3, [sp, #0x7c]
000dc91a  mov     lr, r0
000dc91c  add     r0, sp, #0x78
000dc91e  ldm     r0, {r0, r1}
000dc920  stm.w   sp, {r0, r1}
000dc924  mov     r1, ip
000dc926  mov     r0, lr
000dc928  ldm     r2, {r2, r3}
000dc92a  blx     #0xddbfc ; -> objc_msgSend
000dc92e  ldr     r1, [pc, #0x13c]
000dc930  movs    r2, #1
000dc932  add     r1, pc ; -> 0x000fcc98  'j2\x0e'
000dc934  ldr     r1, [r1]
000dc936  str.w   r0, [sl, r6]
000dc93a  ldr     r3, [r4]
000dc93c  ldr.w   r0, [sl, r3]
000dc940  ldr     r3, [pc, #0x12c]
000dc942  str     r2, [sp]
000dc944  mov     r2, sl
000dc946  add     r3, pc ; -> 0x000fd9e8  
000dc948  ldr     r3, [r3]
000dc94a  blx     #0xddbfc ; -> objc_msgSend
000dc94e  ldr     r0, [pc, #0x124]
000dc950  ldr     r3, [pc, #0x124]
000dc952  mov     r1, r5
000dc954  add     r0, pc ; -> 0x000fdb70  
000dc956  add     r3, pc ; -> 0x000fc8bc  OBJC_IVAR_$_FacebookAgent.permissions
000dc958  ldr     r0, [r0]
000dc95a  ldr     r4, [r3]
000dc95c  blx     #0xddbfc ; -> objc_msgSend
000dc960  mov     r1, r8
000dc962  blx     #0xddbfc ; -> objc_msgSend
000dc966  str.w   r0, [sl, r4]
000dc96a  ldr     r3, [sp, #8]
000dc96c  cmp     r3, #0
000dc96e  beq     #0xdc9f8
000dc970  ldr     r1, [pc, #0x108]
000dc972  movs    r3, #0
000dc974  str     r3, [sp, #0x50]
000dc976  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000dc978  str     r3, [sp, #0x54]
000dc97a  ldr     r1, [r1]
000dc97c  str     r3, [sp, #0x58]
000dc97e  str     r3, [sp, #0x5c]
000dc980  str     r3, [sp, #0x60]
000dc982  str     r3, [sp, #0x64]
000dc984  str     r3, [sp, #0x68]
000dc986  str     r3, [sp, #0x6c]
000dc988  adds    r3, #0x10
000dc98a  ldr     r0, [sp, #8]
000dc98c  str     r3, [sp]
000dc98e  add     r2, sp, #0x50
000dc990  add     r3, sp, r3
000dc992  str     r1, [sp, #0xc]
000dc994  blx     #0xddbfc ; -> objc_msgSend
000dc998  cmp     r0, #0
000dc99a  beq     #0xdca32
000dc99c  ldr     r1, [pc, #0xe0]
000dc99e  ldr     r3, [sp, #0x58]
000dc9a0  ldr.w   fp, [pc, #0xe0]
000dc9a4  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000dc9a6  mov     r5, r0
000dc9a8  ldr.w   r8, [r3]
000dc9ac  ldr     r6, [r1]
000dc9ae  b       #0xdc9b2
000dc9b0  ldr     r3, [sp, #0x58]
000dc9b2  movs    r4, #0
000dc9b4  b       #0xdc9b8
000dc9b6  ldr     r3, [sp, #0x58]
000dc9b8  ldr     r3, [r3]
000dc9ba  cmp     r3, r8
000dc9bc  beq     #0xdc9c4
000dc9be  ldr     r0, [sp, #8]
000dc9c0  blx     #0xddbe4 ; -> objc_enumerationMutation
000dc9c4  mov     r3, fp
000dc9c6  add     r3, pc
000dc9c8  mov     r1, r6
000dc9ca  ldr     r3, [r3]
000dc9cc  ldr.w   r0, [sl, r3]
000dc9d0  ldr     r3, [sp, #0x54]
000dc9d2  ldr.w   r2, [r3, r4, lsl #2]
000dc9d6  adds    r4, #1
000dc9d8  blx     #0xddbfc ; -> objc_msgSend
000dc9dc  cmp     r5, r4
000dc9de  bhi     #0xdc9b6
000dc9e0  movs    r3, #0x10
000dc9e2  ldr     r0, [sp, #8]
000dc9e4  str     r3, [sp]
000dc9e6  ldr     r1, [sp, #0xc]
000dc9e8  add     r2, sp, #0x50
000dc9ea  add     r3, sp, r3
000dc9ec  blx     #0xddbfc ; -> objc_msgSend
000dc9f0  mov     r5, r0
000dc9f2  cmp     r0, #0
000dc9f4  bne     #0xdc9b0
000dc9f6  b       #0xdca32
000dc9f8  ldr     r5, [pc, #0x8c]
000dc9fa  ldr     r1, [pc, #0x90]
000dc9fc  ldr     r2, [pc, #0x90]
000dc9fe  add     r5, pc ; -> 0x000fc8bc  OBJC_IVAR_$_FacebookAgent.permissions
000dca00  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000dca02  ldr     r3, [r5]
000dca04  ldr     r4, [r1]
000dca06  add     r2, pc ; -> 0x00182624  
000dca08  ldr.w   r0, [sl, r3]
000dca0c  mov     r1, r4
000dca0e  blx     #0xddbfc ; -> objc_msgSend
000dca12  ldr     r3, [r5]
000dca14  ldr     r2, [pc, #0x7c]
000dca16  mov     r1, r4
000dca18  ldr.w   r0, [sl, r3]
000dca1c  add     r2, pc ; -> 0x0017eab4  
000dca1e  blx     #0xddbfc ; -> objc_msgSend
000dca22  ldr     r3, [r5]
000dca24  ldr     r2, [pc, #0x70]
000dca26  mov     r1, r4
000dca28  ldr.w   r0, [sl, r3]
000dca2c  add     r2, pc ; -> 0x00182554  
000dca2e  blx     #0xddbfc ; -> objc_msgSend
000dca32  mov     r0, sl
000dca34  sub.w   sp, r7, #0x18
000dca38  pop.w   {r8, sl, fp}
000dca3c  pop     {r4, r5, r6, r7, pc}
000dca3e  nop     
000dca40  lsls    r4, r3, #3
000dca42  movs    r2, r0
000dca44  asrs    r4, r3, #0x15
000dca46  movs    r2, r0
000dca48  stc2    p0, c0, [r2], {1}
000dca4c  lsls    r0, r7, #2
000dca4e  movs    r2, r0
000dca50  asrs    r2, r4, #0x10
000dca52  movs    r2, r0
000dca54  vaddl.u16 q8, d12, d1
000dca58  asrs    r2, r0, #4
000dca5a  movs    r2, r0
000dca5c  asrs    r4, r5, #0xb
000dca5e  movs    r2, r0
