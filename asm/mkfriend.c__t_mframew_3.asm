========================================================================
t_mframew_3  0x000a5584  144 bytes   mkfriend.c
========================================================================

000a5584  ldr.w   r2, [r0, #0xa4]
000a5588  ldr.w   ip, [r0, #0x108]
000a558c  adds    r3, r2, #1
000a558e  ldr.w   r1, [r0, r3, lsl #3]
000a5592  cbnz    r1, #0xa55d0
000a5594  movs    r3, #3
000a5596  str.w   r3, [ip, #0x1c]
000a559a  ldr.w   r3, [r0, #0xa4]
000a559e  movw    r2, #0x7ca
000a55a2  adds    r3, #1
000a55a4  str.w   r2, [r0, r3, lsl #3]
000a55a8  ldr.w   r3, [r0, #0xa4]
000a55ac  adds    r2, r3, #1
000a55ae  ldr     r3, [pc, #0x5c]
000a55b0  str.w   r2, [r0, #0xa4]
000a55b4  add     r3, pc ; -> 0x000f37cc  t_mframew
000a55b6  ldr.w   ip, [r3]
000a55ba  lsls    r3, r2, #3
000a55bc  adds    r3, r3, r0
000a55be  str.w   ip, [r3, #4]
000a55c2  ldr.w   r3, [r0, #0xa4]
000a55c6  adds    r3, #1
000a55c8  str.w   r1, [r0, r3, lsl #3]
000a55cc  mov     r0, r1
000a55ce  bx      lr
000a55d0  movw    r3, #0x7ca
000a55d4  cmp     r1, r3
000a55d6  it      ne
000a55d8  mvnne   r0, #2
000a55dc  bne     #0xa55ce
000a55de  cmp     r2, #0
000a55e0  ble     #0xa55ec
000a55e2  subs    r3, r2, #1
000a55e4  str.w   r3, [r0, #0xa4]
000a55e8  movs    r0, #0
000a55ea  b       #0xa55ce
000a55ec  ldr.w   r3, [pc, #0x20]
000a55f0  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a55f2  ldr     r1, [r3]
000a55f4  lsls    r3, r2, #3
000a55f6  adds    r3, r3, r0
000a55f8  str     r1, [r3, #4]
000a55fa  ldr.w   r3, [r0, #0xa4]
000a55fe  movs    r1, #0
000a5600  adds    r3, #1
000a5602  str.w   r1, [r0, r3, lsl #3]
000a5606  mov     r0, r1
000a5608  b       #0xa55ce
000a560a  nop     
000a560c  b       #0xa5a38
000a560e  movs    r4, r0
000a5610  b       #0xa583c
000a5612  movs    r4, r0
