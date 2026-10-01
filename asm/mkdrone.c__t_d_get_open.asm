========================================================================
t_d_get_open  0x000712b0  120 bytes   mkdrone.c
========================================================================

000712b0  push    {r4, r5, r6, r7, lr}
000712b2  add     r7, sp, #0xc
000712b4  ldr.w   r3, [r0, #0xa4]
000712b8  mov     r5, r0
000712ba  ldr.w   r4, [r0, #0x108]
000712be  adds    r3, #1
000712c0  ldr.w   r6, [r0, r3, lsl #3]
000712c4  cbnz    r6, #0x71308
000712c6  mov     r0, r4
000712c8  bl      #0x54dc0 ; -> get_my_dfe
000712cc  ldr     r0, [r4, #0x34]
000712ce  ldr     r3, [r4, #0x30]
000712d0  ldr     r1, [pc, #0x4c]
000712d2  ldr     r2, [pc, #0x50]
000712d4  cmp     r0, r3
000712d6  mov     r0, r4
000712d8  add     r1, pc ; -> 0x000680fd  t_d_bflip_jump
000712da  add     r2, pc ; -> 0x00068a29  t_d_open_jumpover
000712dc  str     r1, [r4, #0x24]
000712de  str     r2, [r4, #0x38]
000712e0  itt     le
000712e2  strle   r2, [r4, #0x24]
000712e4  strle   r1, [r4, #0x38]
000712e6  bl      #0x5517c ; -> is_he_right
000712ea  ldr     r3, [r4, #0x5c]
000712ec  cbz     r3, #0x7130e
000712ee  ldr     r2, [r4, #0x38]
000712f0  ldr.w   r3, [r5, #0xa4]
000712f4  mov     r0, r6
000712f6  lsls    r3, r3, #3
000712f8  adds    r3, r3, r5
000712fa  str     r2, [r3, #4]
000712fc  ldr.w   r3, [r5, #0xa4]
00071300  adds    r3, #1
00071302  str.w   r6, [r5, r3, lsl #3]
00071306  b       #0x7130c
00071308  mvn     r0, #2
0007130c  pop     {r4, r5, r6, r7, pc}
0007130e  ldr.w   ip, [r4, #0x24]
00071312  ldr     r2, [r4, #0x38]
00071314  str.w   ip, [r4, #0x38]
00071318  str     r2, [r4, #0x24]
0007131a  mov     r2, ip
0007131c  b       #0x712f0
0007131e  nop     
00071320  ldr     r1, [r4, #0x60]
