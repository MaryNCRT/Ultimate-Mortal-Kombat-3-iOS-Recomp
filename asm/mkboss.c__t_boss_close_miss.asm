========================================================================
t_boss_close_miss  0x000a895c  140 bytes   mkboss.c
========================================================================

000a895c  ldr.w   ip, [r0, #0xa4]
000a8960  ldr.w   r2, [r0, #0x108]
000a8964  add.w   r1, ip, #1
000a8968  ldr.w   r3, [r0, r1, lsl #3]
000a896c  cmp.w   r3, #0x588
000a8970  beq     #0xa89b2
000a8972  movw    r2, #0x58a
000a8976  cmp     r3, r2
000a8978  beq     #0xa8994
000a897a  cbz     r3, #0xa8982
000a897c  mvn     r0, #2
000a8980  bx      lr
000a8982  movs    r2, #8
000a8984  mov.w   r3, #0x588
000a8988  str.w   r3, [r0, r1, lsl #3]
000a898c  str.w   r2, [r0, #0xfc]
000a8990  mov     r0, r2
000a8992  b       #0xa8980
000a8994  ldr     r3, [pc, #0x48]
000a8996  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a8998  ldr     r2, [r3]
000a899a  lsl.w   r3, ip, #3
000a899e  adds    r3, r3, r0
000a89a0  str     r2, [r3, #4]
000a89a2  ldr.w   r3, [r0, #0xa4]
000a89a6  movs    r2, #0
000a89a8  adds    r3, #1
000a89aa  str.w   r2, [r0, r3, lsl #3]
000a89ae  mov     r0, r2
000a89b0  b       #0xa8980
000a89b2  movs    r3, #3
000a89b4  str     r3, [r2, #0x1c]
000a89b6  ldr.w   r3, [r0, #0xa4]
000a89ba  movw    r2, #0x58a
000a89be  adds    r3, #1
000a89c0  str.w   r2, [r0, r3, lsl #3]
000a89c4  ldr.w   r3, [r0, #0xa4]
000a89c8  adds    r2, r3, #1
000a89ca  ldr.w   r3, [pc, #0x18]
000a89ce  str.w   r2, [r0, #0xa4]
000a89d2  add     r3, pc ; -> 0x000f37cc  t_mframew
000a89d4  ldr     r1, [r3]
000a89d6  lsls    r3, r2, #3
000a89d8  adds    r3, r3, r0
000a89da  str     r1, [r3, #4]
000a89dc  b       #0xa89a2
000a89de  nop     
000a89e0  add     r5, sp, #0x1b8
000a89e2  movs    r4, r0
000a89e4  add     r5, sp, #0x3d8
000a89e6  movs    r4, r0
