========================================================================
t_av_flyattack  0x00070974  164 bytes   mkdrone.c
========================================================================

00070974  push    {r4, r5, r6, r7, lr}
00070976  add     r7, sp, #0xc
00070978  str     r8, [sp, #-0x4]!
0007097c  ldr.w   r3, [r0, #0xa4]
00070980  mov     r4, r0
00070982  ldr.w   r6, [r0, #0x108]
00070986  adds    r3, #1
00070988  ldr.w   r5, [r0, r3, lsl #3]
0007098c  cbnz    r5, #0x709ba
0007098e  mov     r0, r6
00070990  bl      #0x70940 ; -> is_towards_me
00070994  ldr.w   r8, [r6, #0x5c]
00070998  cmp.w   r8, #0
0007099c  beq     #0x709c4
0007099e  ldr.w   r3, [r4, #0xa4]
000709a2  ldr     r2, [pc, #0x64]
000709a4  mov     r0, r5
000709a6  lsls    r3, r3, #3
000709a8  adds    r3, r3, r4
000709aa  add     r2, pc ; -> 0x0006f221  t_flykick_towards_me
000709ac  str     r2, [r3, #4]
000709ae  ldr.w   r3, [r4, #0xa4]
000709b2  adds    r3, #1
000709b4  str.w   r5, [r4, r3, lsl #3]
000709b8  b       #0x709be
000709ba  mvn     r0, #2
000709be  ldr     r8, [sp], #4
000709c2  pop     {r4, r5, r6, r7, pc}
000709c4  mov     r0, r6
000709c6  bl      #0x2f3a0 ; -> get_x_dist
000709ca  ldr     r3, [r6, #0x28]
000709cc  cmp     r3, #0x3f
000709ce  bgt     #0x709ee
000709d0  ldr.w   r2, [pc, #0x38]
000709d4  add     r2, pc ; -> 0x0006fa21  t_d_block
000709d6  ldr.w   r3, [r4, #0xa4]
000709da  mov     r0, r8
000709dc  lsls    r3, r3, #3
000709de  adds    r3, r3, r4
000709e0  str     r2, [r3, #4]
000709e2  ldr.w   r3, [r4, #0xa4]
000709e6  adds    r3, #1
000709e8  str.w   r8, [r4, r3, lsl #3]
000709ec  b       #0x709be
000709ee  mov     r0, r6
000709f0  bl      #0x6e9c4 ; -> q_will_he_reach_me
000709f4  ldr     r0, [r6, #0x5c]
000709f6  cbnz    r0, #0x70a00
000709f8  ldr.w   r2, [pc, #0x14]
000709fc  add     r2, pc ; -> 0x00067fe1  t_d_zap_now
000709fe  b       #0x709d6
00070a00  ldr     r2, [pc, #0x10]
00070a02  add     r2, pc ; -> 0x0006fa21  t_d_block
00070a04  b       #0x709d6
00070a06  nop     
00070a08  ldrd    pc, pc, [r3], #-0x3fc
00070a0c  bl      #0xbaa0e
00070a10  strb    r1, [r4, #0x17]
00070a12  vshr.u32 d31, d11, #1
