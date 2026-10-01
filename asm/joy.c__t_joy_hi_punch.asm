========================================================================
t_joy_hi_punch  0x0002f7f0  188 bytes   joy.c
========================================================================

0002f7f0  push    {r4, r5, r6, r7, lr}
0002f7f2  add     r7, sp, #0xc
0002f7f4  ldr.w   r3, [r0, #0xa4]
0002f7f8  mov     r4, r0
0002f7fa  ldr.w   r5, [r0, #0x108]
0002f7fe  adds    r3, #1
0002f800  ldr.w   r6, [r0, r3, lsl #3]
0002f804  cbnz    r6, #0x2f838
0002f806  ldr     r3, [r5]
0002f808  ldrsh.w r3, [r3, #0x7c]
0002f80c  cmp     r3, #0
0002f80e  beq     #0x2f862
0002f810  mov     r0, r5
0002f812  bl      #0x2f3a0 ; -> get_x_dist
0002f816  ldr     r3, [r5, #0x28]
0002f818  cmp     r3, #0x40
0002f81a  bgt     #0x2f862
0002f81c  ldr.w   r3, [r4, #0xa4]
0002f820  ldr     r2, [pc, #0x7c]
0002f822  mov     r0, r6
0002f824  lsls    r3, r3, #3
0002f826  adds    r3, r3, r4
0002f828  add     r2, pc ; -> 0x0002ffd1  t_joy_lo_punch
0002f82a  str     r2, [r3, #4]
0002f82c  ldr.w   r3, [r4, #0xa4]
0002f830  adds    r3, #1
0002f832  str.w   r6, [r4, r3, lsl #3]
0002f836  pop     {r4, r5, r6, r7, pc}
0002f838  movw    r3, #0x72a
0002f83c  cmp     r6, r3
0002f83e  it      ne
0002f840  mvnne   r0, #2
0002f844  bne     #0x2f836
0002f846  mov     r0, r5
0002f848  bl      #0x55c04 ; -> stop_me_player
0002f84c  mov     r0, r5
0002f84e  movs    r3, #0xe
0002f850  str     r3, [r5, #0x40]
0002f852  bl      #0x5520c ; -> get_char_ani
0002f856  ldr.w   r2, [pc, #0x4c]
0002f85a  ldr.w   r3, [r4, #0xa4]
0002f85e  add     r2, pc ; -> 0x00030d69  t_jhp4
0002f860  b       #0x2f88c
0002f862  mov     r0, r5
0002f864  bl      #0x2ec68 ; -> disable_all_buttons
0002f868  mov     r0, r5
0002f86a  bl      #0x2ec24 ; -> me_in_front
0002f86e  ldr.w   r3, [r4, #0xa4]
0002f872  movw    r2, #0x72a
0002f876  adds    r3, #1
0002f878  str.w   r2, [r4, r3, lsl #3]
0002f87c  ldr.w   r2, [pc, #0x28]
0002f880  ldr.w   r3, [r4, #0xa4]
0002f884  add     r2, pc ; -> 0x0002f8ad  t_elbow_check
0002f886  adds    r3, #1
0002f888  str.w   r3, [r4, #0xa4]
0002f88c  lsls    r3, r3, #3
0002f88e  adds    r3, r3, r4
0002f890  movs    r0, #0
0002f892  str     r2, [r3, #4]
0002f894  ldr.w   r3, [r4, #0xa4]
0002f898  adds    r3, #1
0002f89a  str.w   r0, [r4, r3, lsl #3]
0002f89e  b       #0x2f836
0002f8a0  lsls    r5, r4, #0x1e
0002f8a2  movs    r0, r0
0002f8a4  asrs    r7, r0, #0x14
0002f8a6  movs    r0, r0
0002f8a8  movs    r5, r4
0002f8aa  movs    r0, r0
