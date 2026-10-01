========================================================================
t_blocked_start  0x000475a0  124 bytes   mkreact.c
========================================================================

000475a0  push    {r4, r5, r6, r7, lr}
000475a2  add     r7, sp, #0xc
000475a4  push.w  {r8, sl, fp}
000475a8  ldr.w   r3, [r0, #0xa4]
000475ac  mov     r5, r0
000475ae  ldr.w   r4, [r0, #0x108]
000475b2  adds    r3, #1
000475b4  ldr.w   r6, [r0, r3, lsl #3]
000475b8  cmp     r6, #0
000475ba  bne     #0x47612
000475bc  ldr     r2, [r4]
000475be  movw    r3, #0x503
000475c2  str     r3, [r4, #0x1c]
000475c4  mov     r0, r4
000475c6  str     r3, [r2, #0x18]
000475c8  ldr.w   fp, [r4, #0x30]
000475cc  ldr.w   sl, [r4, #0x34]
000475d0  ldr.w   r8, [r4, #0x38]
000475d4  bl      #0x44b0c ; -> reaction_start_chores
000475d8  mov     r0, r4
000475da  str.w   fp, [r4, #0x30]
000475de  str.w   sl, [r4, #0x34]
000475e2  str.w   r8, [r4, #0x38]
000475e6  bl      #0x54ec8 ; -> zero_my_p_hit
000475ea  mov     r0, r4
000475ec  bl      #0x41580 ; -> inc_p_block
000475f0  str     r6, [r4, #0x30]
000475f2  ldr.w   r3, [r5, #0xa4]
000475f6  ldr     r2, [pc, #0x20]
000475f8  mov     r0, r6
000475fa  lsls    r3, r3, #3
000475fc  adds    r3, r3, r5
000475fe  add     r2, pc ; -> 0x000473d1  t_rst5
00047600  str     r2, [r3, #4]
00047602  ldr.w   r3, [r5, #0xa4]
00047606  adds    r3, #1
00047608  str.w   r6, [r5, r3, lsl #3]
0004760c  pop.w   {r8, sl, fp}
00047610  pop     {r4, r5, r6, r7, pc}
00047612  mvn     r0, #2
00047616  b       #0x4760c
00047618  stc2l   p15, c15, [pc, #0x3fc]
