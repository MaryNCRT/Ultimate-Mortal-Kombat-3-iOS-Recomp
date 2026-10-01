========================================================================
t_run_in_close  0x00067894  84 bytes   mkdrone.c
========================================================================

00067894  ldr.w   r3, [r0, #0xa4]
00067898  ldr.w   r2, [r0, #0x108]
0006789c  adds    r3, #1
0006789e  ldr.w   r1, [r0, r3, lsl #3]
000678a2  cbz     r1, #0x678aa
000678a4  mvn     r0, #2
000678a8  bx      lr
000678aa  ldr     r3, [pc, #0x30]
000678ac  add     r3, pc ; -> 0x000f357c  G
000678ae  ldr     r3, [r3]
000678b0  ldrsh.w r3, [r3, #0x44c]
000678b4  cmp     r3, #1
000678b6  str     r3, [r2, #0x1c]
000678b8  ble     #0x678d6
000678ba  ldr     r2, [pc, #0x24]
000678bc  add     r2, pc ; -> 0x000722c9  t_run_in_close_now
000678be  ldr.w   r3, [r0, #0xa4]
000678c2  lsls    r3, r3, #3
000678c4  adds    r3, r3, r0
000678c6  str     r2, [r3, #4]
000678c8  ldr.w   r3, [r0, #0xa4]
000678cc  adds    r3, #1
000678ce  str.w   r1, [r0, r3, lsl #3]
000678d2  mov     r0, r1
000678d4  b       #0x678a8
000678d6  ldr     r2, [pc, #0xc]
000678d8  add     r2, pc ; -> 0x00070d31  t_perhaps_flipk
000678da  b       #0x678be
000678dc  pop     {r2, r3, r6, r7}
000678de  movs    r0, r1
000678e0  add     r2, sp, #0x24
000678e2  movs    r0, r0
000678e4  str     r4, [sp, #0x154]
000678e6  movs    r0, r0
