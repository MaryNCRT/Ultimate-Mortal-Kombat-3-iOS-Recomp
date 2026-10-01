========================================================================
t_slip_sleep  0x000441bc  152 bytes   mkreact.c
========================================================================

000441bc  push    {r4, r5, r7, lr}
000441be  add     r7, sp, #8
000441c0  ldr.w   r3, [r0, #0xa4]
000441c4  mov     r4, r0
000441c6  ldr.w   r5, [r0, #0x108]
000441ca  adds    r2, r3, #1
000441cc  ldr.w   r3, [r0, r2, lsl #3]
000441d0  cbnz    r3, #0x441e2
000441d2  movw    r3, #0x273
000441d6  str.w   r3, [r0, r2, lsl #3]
000441da  movs    r0, #1
000441dc  str.w   r0, [r4, #0xfc]
000441e0  pop     {r4, r5, r7, pc}
000441e2  movw    r2, #0x273
000441e6  cmp     r3, r2
000441e8  it      ne
000441ea  mvnne   r0, #2
000441ee  bne     #0x441e0
000441f0  mov     r0, r5
000441f2  bl      #0x5a680 ; -> next_anirate
000441f6  ldr     r2, [r5]
000441f8  ldr     r3, [r2, #0x3c]
000441fa  subs    r0, r3, #1
000441fc  str     r0, [r5, #0x1c]
000441fe  cbz     r0, #0x44214
00044200  str     r0, [r2, #0x3c]
00044202  ldr.w   r3, [r4, #0xa4]
00044206  cmp     r3, #0
00044208  ble     #0x44230
0004420a  subs    r3, #1
0004420c  movs    r0, #0
0004420e  str.w   r3, [r4, #0xa4]
00044212  b       #0x441e0
00044214  ldr     r3, [pc, #0x34]
00044216  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00044218  ldr     r2, [r3]
0004421a  ldr.w   r3, [r4, #0xa4]
0004421e  lsls    r3, r3, #3
00044220  adds    r3, r3, r4
00044222  str     r2, [r3, #4]
00044224  ldr.w   r3, [r4, #0xa4]
00044228  adds    r3, #1
0004422a  str.w   r0, [r4, r3, lsl #3]
0004422e  b       #0x441e0
00044230  ldr.w   r2, [pc, #0x1c]
00044234  lsls    r3, r3, #3
00044236  adds    r3, r3, r4
00044238  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0004423a  movs    r0, #0
0004423c  ldr     r2, [r2]
0004423e  str     r2, [r3, #4]
00044240  ldr.w   r3, [r4, #0xa4]
00044244  adds    r3, #1
00044246  str.w   r0, [r4, r3, lsl #3]
0004424a  b       #0x441e0
