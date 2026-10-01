========================================================================
t_background_death  0x00041364  120 bytes   mkreact.c
========================================================================

00041364  ldr.w   r2, [r0, #0xa4]
00041368  adds    r3, r2, #1
0004136a  ldr.w   r3, [r0, r3, lsl #3]
0004136e  cbz     r3, #0x41376
00041370  mvn     r0, #2
00041374  bx      lr
00041376  ldr     r3, [pc, #0x4c]
00041378  add     r3, pc ; -> 0x000f3534  RoundParam
0004137a  ldr     r3, [r3]
0004137c  ldr     r3, [r3, #0x24]
0004137e  subs    r3, #1
00041380  cmp     r3, #3
00041382  bhi     #0x4138e
00041384  tbb     [pc, r3]
00041388  asrs    r1, r2, #0x10
0004138a  subs    r0, r3, r4
0004138c  movs    r3, r0
0004138e  ldr.w   r1, [pc, #0x38]
00041392  add     r1, pc ; -> 0x000421d5  t_pit_abort
00041394  lsls    r3, r2, #3
00041396  adds    r3, r3, r0
00041398  movs    r2, #0
0004139a  str     r1, [r3, #4]
0004139c  ldr.w   r3, [r0, #0xa4]
000413a0  adds    r3, #1
000413a2  str.w   r2, [r0, r3, lsl #3]
000413a6  mov     r0, r2
000413a8  b       #0x41374
000413aa  ldr     r1, [pc, #0x20]
000413ac  add     r1, pc ; -> 0x0004823d  t_fall_down_pit
000413ae  b       #0x41394
000413b0  ldr.w   r1, [pc, #0x1c]
000413b4  add     r1, pc ; -> 0x0004858d  t_fall_down_bell_tower
000413b6  b       #0x41394
000413b8  ldr     r1, [pc, #0x18]
000413ba  add     r1, pc ; -> 0x000480e1  t_fall_on_trax
000413bc  b       #0x41394
000413be  ldr     r1, [pc, #0x18]
000413c0  add     r1, pc ; -> 0x0004819d  t_fall_in_lava
000413c2  b       #0x41394
000413c4  movs    r1, #0xb8
000413c6  movs    r3, r1
000413c8  lsrs    r7, r7, #0x18
000413ca  movs    r0, r0
000413cc  ldr     r5, [r1, #0x68]
000413ce  movs    r0, r0
000413d0  strb    r5, [r2, #7]
000413d2  movs    r0, r0
000413d4  ldr     r3, [r4, #0x50]
000413d6  movs    r0, r0
000413d8  ldr     r1, [r3, #0x5c]
000413da  movs    r0, r0
