========================================================================
t_drone_post_duck_hit  0x00068984  164 bytes   mkdrone.c
========================================================================

00068984  ldr.w   r1, [r0, #0xa4]
00068988  ldr.w   ip, [r0, #0x108]
0006898c  adds    r3, r1, #1
0006898e  ldr.w   r2, [r0, r3, lsl #3]
00068992  cmp.w   r2, #0x770
00068996  beq     #0x689fa
00068998  movw    r3, #0x771
0006899c  cmp     r2, r3
0006899e  beq     #0x689de
000689a0  cbz     r2, #0x689a8
000689a2  mvn     r0, #2
000689a6  bx      lr
000689a8  movs    r3, #0x80
000689aa  str.w   r3, [ip, #0x1c]
000689ae  ldr.w   r3, [r0, #0xa4]
000689b2  mov.w   r1, #0x770
000689b6  adds    r3, #1
000689b8  str.w   r1, [r0, r3, lsl #3]
000689bc  ldr.w   r3, [r0, #0xa4]
000689c0  ldr     r1, [pc, #0x58]
000689c2  adds    r3, #1
000689c4  str.w   r3, [r0, #0xa4]
000689c8  lsls    r3, r3, #3
000689ca  adds    r3, r3, r0
000689cc  add     r1, pc ; -> 0x0006c77d  t_d_wait_nonattack
000689ce  str     r1, [r3, #4]
000689d0  ldr.w   r3, [r0, #0xa4]
000689d4  adds    r3, #1
000689d6  str.w   r2, [r0, r3, lsl #3]
000689da  mov     r0, r2
000689dc  b       #0x689a6
000689de  ldr     r3, [pc, #0x40]
000689e0  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000689e2  ldr     r2, [r3]
000689e4  lsls    r3, r1, #3
000689e6  adds    r3, r3, r0
000689e8  str     r2, [r3, #4]
000689ea  ldr.w   r3, [r0, #0xa4]
000689ee  movs    r2, #0
000689f0  adds    r3, #1
000689f2  str.w   r2, [r0, r3, lsl #3]
000689f6  mov     r0, r2
000689f8  b       #0x689a6
000689fa  movw    r2, #0x771
000689fe  str.w   r2, [r0, r3, lsl #3]
00068a02  ldr.w   r3, [r0, #0xa4]
00068a06  adds    r2, r3, #1
00068a08  ldr     r3, [pc, #0x18]
00068a0a  str.w   r2, [r0, #0xa4]
00068a0e  add     r3, pc ; -> 0x000f37e0  t_do_backup
00068a10  ldr     r1, [r3]
00068a12  lsls    r3, r2, #3
00068a14  adds    r3, r3, r0
00068a16  str     r1, [r3, #4]
00068a18  b       #0x689ea
00068a1a  nop     
00068a1c  subs    r5, #0xad
00068a1e  movs    r0, r0
00068a20  add     r5, sp, #0x90
00068a22  movs    r0, r1
00068a24  add     r5, sp, #0x338
00068a26  movs    r0, r1
