========================================================================
t_block_exit  0x000448dc  144 bytes   mkreact.c
========================================================================

000448dc  push    {r4, r5, r6, r7, lr}
000448de  add     r7, sp, #0xc
000448e0  ldr.w   r3, [r0, #0xa4]
000448e4  mov     r5, r0
000448e6  ldr.w   r4, [r0, #0x108]
000448ea  adds    r3, #1
000448ec  ldr.w   r6, [r0, r3, lsl #3]
000448f0  cbnz    r6, #0x4492c
000448f2  ldr     r3, [r4]
000448f4  str     r6, [r4, #0x1c]
000448f6  mov     r0, r4
000448f8  str     r6, [r3, #0x44]
000448fa  ldr     r3, [r4, #0x1c]
000448fc  ldr     r2, [r4]
000448fe  str     r3, [r2, #0x4c]
00044900  bl      #0x59750 ; -> back_to_normal
00044904  mov     r0, r4
00044906  bl      #0x54ce0 ; -> am_i_joy
0004490a  ldr     r3, [r4, #0x5c]
0004490c  cbnz    r3, #0x44932
0004490e  ldr     r3, [pc, #0x50]
00044910  add     r3, pc ; -> 0x000f37b0  t_d_post_block
00044912  ldr     r2, [r3]
00044914  ldr.w   r3, [r5, #0xa4]
00044918  mov     r0, r6
0004491a  lsls    r3, r3, #3
0004491c  adds    r3, r3, r5
0004491e  str     r2, [r3, #4]
00044920  ldr.w   r3, [r5, #0xa4]
00044924  adds    r3, #1
00044926  str.w   r6, [r5, r3, lsl #3]
0004492a  b       #0x44930
0004492c  mvn     r0, #2
00044930  pop     {r4, r5, r6, r7, pc}
00044932  mov     r0, r4
00044934  bl      #0x55808 ; -> am_i_short
00044938  ldr     r0, [r4, #0x5c]
0004493a  cbz     r0, #0x44942
0004493c  ldr     r3, [pc, #0x24]
0004493e  add     r3, pc ; -> 0x000f3730  t_joy_duck_block_loop
00044940  b       #0x44912
00044942  ldr     r3, [pc, #0x24]
00044944  add     r3, pc ; -> 0x000f374c  t_joy_block_loop
00044946  ldr     r2, [r3]
00044948  ldr.w   r3, [r5, #0xa4]
0004494c  lsls    r3, r3, #3
0004494e  adds    r3, r3, r5
00044950  str     r2, [r3, #4]
00044952  ldr.w   r3, [r5, #0xa4]
00044956  adds    r3, #1
00044958  str.w   r0, [r5, r3, lsl #3]
0004495c  b       #0x44930
0004495e  nop     
00044960  cdp     p0, #9, c0, c12, c10, #0
00044964  stcl    p0, c0, [lr, #0x28]!
00044968  cdp     p0, #0, c0, c4, c10, #0
