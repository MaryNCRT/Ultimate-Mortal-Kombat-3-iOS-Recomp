========================================================================
t_do_friendship  0x000a5730  132 bytes   mkfriend.c
========================================================================

000a5730  push    {r4, r5, r7, lr}
000a5732  add     r7, sp, #8
000a5734  ldr.w   r3, [r0, #0xa4]
000a5738  mov     r4, r0
000a573a  ldr.w   r5, [r0, #0x108]
000a573e  adds    r3, #1
000a5740  ldr.w   r0, [r0, r3, lsl #3]
000a5744  cbnz    r0, #0xa576e
000a5746  movw    r2, #0x805
000a574a  str.w   r2, [r4, r3, lsl #3]
000a574e  ldr.w   r3, [r4, #0xa4]
000a5752  ldr     r2, [pc, #0x58]
000a5754  adds    r3, #1
000a5756  str.w   r3, [r4, #0xa4]
000a575a  lsls    r3, r3, #3
000a575c  adds    r3, r3, r4
000a575e  add     r2, pc ; -> 0x000a71f1  t_friendship_start_pause
000a5760  str     r2, [r3, #4]
000a5762  ldr.w   r3, [r4, #0xa4]
000a5766  adds    r3, #1
000a5768  str.w   r0, [r4, r3, lsl #3]
000a576c  pop     {r4, r5, r7, pc}
000a576e  movw    r3, #0x805
000a5772  cmp     r0, r3
000a5774  it      ne
000a5776  mvnne   r0, #2
000a577a  bne     #0xa576c
000a577c  mov     r0, r5
000a577e  bl      #0x587c8 ; -> init_special
000a5782  ldr     r3, [r5, #8]
000a5784  ldr.w   r2, [pc, #0x28]
000a5788  movs    r0, #0
000a578a  ldr     r3, [r3, #0x24]
000a578c  add     r2, pc ; -> 0x00177f24  ochar_friendships
000a578e  ldr.w   r2, [r2, r3, lsl #2]
000a5792  str     r2, [r5, #0x1c]
000a5794  ldr.w   r3, [r4, #0xa4]
000a5798  lsls    r3, r3, #3
000a579a  adds    r3, r3, r4
000a579c  str     r2, [r3, #4]
000a579e  ldr.w   r3, [r4, #0xa4]
000a57a2  adds    r3, #1
000a57a4  str.w   r0, [r4, r3, lsl #3]
000a57a8  b       #0xa576c
000a57aa  nop     
000a57ac  subs    r7, r1, r2
000a57ae  movs    r0, r0
000a57b0  movs    r7, #0x94
000a57b2  movs    r5, r1
