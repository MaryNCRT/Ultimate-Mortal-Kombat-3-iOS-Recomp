========================================================================
t_drone_friendship  0x000691a4  208 bytes   mkdrone.c
========================================================================

000691a4  push    {lr}
000691a6  ldr.w   lr, [r0, #0xa4]
000691aa  movw    sb, #0x9c7
000691ae  ldr.w   ip, [r0, #0x108]
000691b2  add.w   r1, lr, #1
000691b6  ldr.w   r2, [r0, r1, lsl #3]
000691ba  cmp     r2, sb
000691bc  beq     #0x6920c
000691be  movw    r3, #0x9cb
000691c2  cmp     r2, r3
000691c4  beq     #0x69216
000691c6  cbz     r2, #0x691ce
000691c8  mvn     r0, #2
000691cc  pop     {pc}
000691ce  ldr.w   r3, [ip, #8]
000691d2  ldr     r1, [pc, #0x90]
000691d4  ldr     r3, [r3, #0x24]
000691d6  add     r1, pc ; -> 0x00171d38  ochar_friendship_distances
000691d8  ldr.w   r3, [r1, r3, lsl #2]
000691dc  ldr     r1, [pc, #0x88]
000691de  str.w   r3, [ip, #0x1c]
000691e2  ldr.w   r3, [r0, #0xa4]
000691e6  add     r1, pc ; -> 0x000724d9  t_fatality_align
000691e8  adds    r3, #1
000691ea  str.w   sb, [r0, r3, lsl #3]
000691ee  ldr.w   r3, [r0, #0xa4]
000691f2  adds    r3, #1
000691f4  str.w   r3, [r0, #0xa4]
000691f8  lsls    r3, r3, #3
000691fa  adds    r3, r3, r0
000691fc  str     r1, [r3, #4]
000691fe  ldr.w   r3, [r0, #0xa4]
00069202  adds    r3, #1
00069204  str.w   r2, [r0, r3, lsl #3]
00069208  mov     r0, r2
0006920a  b       #0x691cc
0006920c  ldr.w   r3, [ip, #8]
00069210  ldr     r3, [r3, #0x24]
00069212  cmp     r3, #1
00069214  beq     #0x69234
00069216  ldr     r3, [pc, #0x54]
00069218  add     r3, pc ; -> 0x000f3160  t_do_friendship
0006921a  ldr     r2, [r3]
0006921c  lsl.w   r3, lr, #3
00069220  adds    r3, r3, r0
00069222  str     r2, [r3, #4]
00069224  ldr.w   r3, [r0, #0xa4]
00069228  movs    r2, #0
0006922a  adds    r3, #1
0006922c  str.w   r2, [r0, r3, lsl #3]
00069230  mov     r0, r2
00069232  b       #0x691cc
00069234  ldr.w   r3, [ip]
00069238  ldr     r2, [r3, #0x18]
0006923a  movw    r3, #0x302
0006923e  cmp     r2, r3
00069240  beq     #0x69216
00069242  movw    r3, #0x9cb
00069246  str.w   r3, [r0, r1, lsl #3]
0006924a  ldr.w   r3, [r0, #0xa4]
0006924e  adds    r2, r3, #1
00069250  ldr     r3, [pc, #0x1c]
00069252  str.w   r2, [r0, #0xa4]
00069256  add     r3, pc ; -> 0x000f3884  t_do_duck
00069258  ldr     r1, [r3]
0006925a  lsls    r3, r2, #3
0006925c  adds    r3, r3, r0
0006925e  str     r1, [r3, #4]
00069260  b       #0x69224
00069262  nop     
00069264  ldrh    r6, [r3, #0x1a]
00069266  movs    r0, r2
00069268  str     r2, [sp, #0x3bc]
0006926a  movs    r0, r0
0006926c  ldr     r7, [sp, #0x110]
0006926e  movs    r0, r1
00069270  adr     r6, #0xa8
00069272  movs    r0, r1
