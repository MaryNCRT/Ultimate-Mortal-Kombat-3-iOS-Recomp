========================================================================
t_check_stay_down  0x00042004  224 bytes   mkreact.c
========================================================================

00042004  push    {r4}
00042006  ldr.w   r3, [r0, #0xa4]
0004200a  ldr.w   r2, [r0, #0x108]
0004200e  adds    r3, #1
00042010  ldr.w   r4, [r0, r3, lsl #3]
00042014  cbz     r4, #0x4201e
00042016  mvn     r0, #2
0004201a  pop     {r4}
0004201c  bx      lr
0004201e  ldr.w   ip, [r2]
00042022  ldr.w   r3, [ip, #0x10]
00042026  tst.w   r3, #0x40
0004202a  str     r3, [r2, #0x2c]
0004202c  beq     #0x4207c
0004202e  ldr.w   r3, [r0, #0xa4]
00042032  cmp     r3, #0
00042034  ble     #0x420b8
00042036  subs    r3, #1
00042038  str.w   r3, [r0, #0xa4]
0004203c  ldr.w   r1, [r0, #0xa4]
00042040  adds    r3, r1, #1
00042042  lsls    r2, r3, #3
00042044  adds    r2, r2, r0
00042046  ldr.w   ip, [r2, #4]
0004204a  adds    r2, r3, #1
0004204c  ldr.w   r2, [r0, r2, lsl #3]
00042050  str.w   r2, [r0, r3, lsl #3]
00042054  lsls    r3, r1, #3
00042056  adds    r3, r3, r0
00042058  str.w   ip, [r3, #4]
0004205c  ldr     r3, [pc, #0x74]
0004205e  add     r3, pc ; -> 0x000f3724  t_wait_forever
00042060  ldr     r2, [r3]
00042062  ldr.w   r3, [r0, #0xa4]
00042066  lsls    r3, r3, #3
00042068  adds    r3, r3, r0
0004206a  str     r2, [r3, #4]
0004206c  ldr.w   r3, [r0, #0xa4]
00042070  movs    r2, #0
00042072  adds    r3, #1
00042074  str.w   r2, [r0, r3, lsl #3]
00042078  mov     r0, r2
0004207a  b       #0x4201a
0004207c  ldr.w   r3, [pc, #0x58]
00042080  add     r3, pc ; -> 0x000f357c  G
00042082  ldr     r3, [r3]
00042084  ldrh.w  r3, [r3, #0x45c]
00042088  sxth    r1, r3
0004208a  str     r1, [r2, #0x1c]
0004208c  cbz     r3, #0x4209e
0004208e  cmp     r1, #3
00042090  beq     #0x4209e
00042092  ldr.w   r3, [ip, #8]
00042096  adds    r3, #1
00042098  cmp     r3, r1
0004209a  str     r3, [r2, #0x20]
0004209c  bne     #0x4202e
0004209e  ldr.w   r3, [r0, #0xa4]
000420a2  cmp     r3, #0
000420a4  ble     #0x420b0
000420a6  subs    r3, #1
000420a8  str.w   r3, [r0, #0xa4]
000420ac  movs    r0, #0
000420ae  b       #0x4201a
000420b0  ldr     r2, [pc, #0x28]
000420b2  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000420b4  ldr     r2, [r2]
000420b6  b       #0x42066
000420b8  ldr.w   r2, [pc, #0x24]
000420bc  lsls    r3, r3, #3
000420be  adds    r3, r3, r0
000420c0  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000420c2  ldr     r2, [r2]
000420c4  str     r2, [r3, #4]
000420c6  ldr.w   r3, [r0, #0xa4]
000420ca  adds    r3, #1
000420cc  str.w   r4, [r0, r3, lsl #3]
000420d0  b       #0x4203c
000420d2  nop     
000420d4  asrs    r2, r0, #0x1b
000420d6  movs    r3, r1
000420d8  asrs    r0, r7, #0x13
000420da  movs    r3, r1
000420dc  asrs    r2, r2, #0x19
000420de  movs    r3, r1
000420e0  asrs    r4, r0, #0x19
000420e2  movs    r3, r1
