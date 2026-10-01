========================================================================
-[FacebookAgent dialogCompleteWithUrl  0x000db8d0  140 bytes   FacebookAgent.mm
========================================================================

000db8d0  push    {r4, r5, r6, r7, lr}
000db8d2  add     r7, sp, #0xc
000db8d4  ldr     r3, [pc, #0x68]
000db8d6  mov     r4, r0
000db8d8  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000db8da  ldr     r3, [r3]
000db8dc  ldr     r3, [r0, r3]
000db8de  cmp     r3, #5
000db8e0  beq     #0xdb926
000db8e2  cmp     r3, #6
000db8e4  beq     #0xdb8ec
000db8e6  cmp     r3, #4
000db8e8  bne     #0xdb934
000db8ea  b       #0xdb91a
000db8ec  ldr     r1, [pc, #0x54]
000db8ee  ldr     r5, [pc, #0x58]
000db8f0  add     r1, pc ; -> 0x000fd988  
000db8f2  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000db8f4  ldr     r6, [r1]
000db8f6  ldr     r1, [pc, #0x54]
000db8f8  ldr     r3, [r5]
000db8fa  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000db8fc  mov     r2, r6
000db8fe  ldr     r0, [r0, r3]
000db900  ldr     r1, [r1]
000db902  blx     #0xddbfc ; -> objc_msgSend
000db906  tst.w   r0, #0xff
000db90a  beq     #0xdb934
000db90c  ldr     r3, [r5]
000db90e  mov     r1, r6
000db910  movs    r2, #1
000db912  ldr     r0, [r4, r3]
000db914  blx     #0xddbfc ; -> objc_msgSend
000db918  b       #0xdb934
000db91a  ldr     r1, [pc, #0x34]
000db91c  movs    r2, #0
000db91e  movs    r3, #1
000db920  add     r1, pc ; -> 0x000fd9ac  'i\x1b\x0f'
000db922  ldr     r1, [r1]
000db924  b       #0xdb930
000db926  ldr     r1, [pc, #0x2c]
000db928  movs    r2, #1
000db92a  add     r1, pc ; -> 0x000fd9ac  'i\x1b\x0f'
000db92c  mov     r3, r2
000db92e  ldr     r1, [r1]
000db930  blx     #0xddbfc ; -> objc_msgSend
000db934  ldr     r3, [pc, #0x20]
000db936  movs    r2, #0
000db938  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000db93a  ldr     r3, [r3]
000db93c  str     r2, [r4, r3]
000db93e  pop     {r4, r5, r6, r7, pc}
000db940  lsrs    r4, r5, #0x1f
000db942  movs    r2, r0
000db944  movs    r0, #0x94
000db946  movs    r2, r0
000db948  lsrs    r2, r7, #0x1e
000db94a  movs    r2, r0
000db94c  asrs    r2, r2, #0xe
000db94e  movs    r2, r0
000db950  movs    r0, #0x88
000db952  movs    r2, r0
000db954  movs    r0, #0x7e
000db956  movs    r2, r0
000db958  lsrs    r4, r1, #0x1e
000db95a  movs    r2, r0
