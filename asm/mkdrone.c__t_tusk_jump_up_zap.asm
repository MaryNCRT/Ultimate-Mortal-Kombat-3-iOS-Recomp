========================================================================
t_tusk_jump_up_zap  0x000699ac  136 bytes   mkdrone.c
========================================================================

000699ac  ldr.w   r1, [r0, #0xa4]
000699b0  ldr.w   ip, [r0, #0x108]
000699b4  adds    r3, r1, #1
000699b6  ldr.w   r2, [r0, r3, lsl #3]
000699ba  cbnz    r2, #0x699fc
000699bc  ldr     r3, [pc, #0x68]
000699be  movw    r1, #0xcd3
000699c2  add     r3, pc ; -> 0x00070759  t_tusk_jup_scan
000699c4  str.w   r3, [ip, #0x48]
000699c8  ldr.w   r3, [r0, #0xa4]
000699cc  adds    r3, #1
000699ce  str.w   r1, [r0, r3, lsl #3]
000699d2  ldr.w   r3, [r0, #0xa4]
000699d6  adds    r1, r3, #1
000699d8  ldr.w   r3, [pc, #0x50]
000699dc  str.w   r1, [r0, #0xa4]
000699e0  add     r3, pc ; -> 0x000f3854  t_do_jump_up
000699e2  ldr.w   ip, [r3]
000699e6  lsls    r3, r1, #3
000699e8  adds    r3, r3, r0
000699ea  str.w   ip, [r3, #4]
000699ee  ldr.w   r3, [r0, #0xa4]
000699f2  adds    r3, #1
000699f4  str.w   r2, [r0, r3, lsl #3]
000699f8  mov     r0, r2
000699fa  bx      lr
000699fc  movw    r3, #0xcd3
00069a00  cmp     r2, r3
00069a02  it      ne
00069a04  mvnne   r0, #2
00069a08  bne     #0x699fa
00069a0a  ldr     r3, [pc, #0x24]
00069a0c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00069a0e  ldr     r2, [r3]
00069a10  lsls    r3, r1, #3
00069a12  adds    r3, r3, r0
00069a14  str     r2, [r3, #4]
00069a16  ldr.w   r3, [r0, #0xa4]
00069a1a  movs    r2, #0
00069a1c  adds    r3, #1
00069a1e  str.w   r2, [r0, r3, lsl #3]
00069a22  mov     r0, r2
00069a24  b       #0x699fa
00069a26  nop     
00069a28  ldr     r3, [r2, #0x58]
00069a2a  movs    r0, r0
00069a2c  ldr     r6, [sp, #0x1c0]
00069a2e  movs    r0, r1
00069a30  ldr     r4, [sp, #0x3e0]
00069a32  movs    r0, r1
