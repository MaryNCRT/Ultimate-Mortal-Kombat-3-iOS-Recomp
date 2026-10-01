========================================================================
t_joy_duck_block_loop  0x00031838  396 bytes   joy.c
========================================================================

00031838  push    {r4, r5, r6, r7, lr}
0003183a  add     r7, sp, #0xc
0003183c  ldr.w   r2, [r0, #0xa4]
00031840  movw    r6, #0x25a
00031844  mov     r4, r0
00031846  adds    r1, r2, #1
00031848  ldr.w   r5, [r0, #0x108]
0003184c  ldr.w   r3, [r0, r1, lsl #3]
00031850  cmp     r3, r6
00031852  beq     #0x31914
00031854  ble     #0x31870
00031856  movw    r2, #0x263
0003185a  cmp     r3, r2
0003185c  beq     #0x3192e
0003185e  adds    r2, #0xb
00031860  cmp     r3, r2
00031862  beq     #0x318be
00031864  subs    r2, #0x11
00031866  cmp     r3, r2
00031868  beq     #0x318ea
0003186a  mvn     r0, #2
0003186e  pop     {r4, r5, r6, r7, pc}
00031870  cbz     r3, #0x318ae
00031872  movw    r2, #0x256
00031876  cmp     r3, r2
00031878  bne     #0x3186a
0003187a  mov     r0, r5
0003187c  bl      #0x551f0 ; -> am_i_facing_him
00031880  cbnz    r0, #0x318ea
00031882  ldr.w   r3, [r4, #0xa4]
00031886  adds    r3, #1
00031888  str.w   r6, [r4, r3, lsl #3]
0003188c  ldr.w   r3, [r4, #0xa4]
00031890  adds    r2, r3, #1
00031892  ldr     r3, [pc, #0x114]
00031894  str.w   r2, [r4, #0xa4]
00031898  add     r3, pc ; -> 0x000f38a4  t_duck_turnaround
0003189a  ldr     r1, [r3]
0003189c  lsls    r3, r2, #3
0003189e  adds    r3, r3, r4
000318a0  str     r1, [r3, #4]
000318a2  ldr.w   r3, [r4, #0xa4]
000318a6  adds    r3, #1
000318a8  str.w   r0, [r4, r3, lsl #3]
000318ac  b       #0x3186e
000318ae  movw    r3, #0x256
000318b2  str.w   r3, [r0, r1, lsl #3]
000318b6  movs    r0, #1
000318b8  str.w   r0, [r4, #0xfc]
000318bc  b       #0x3186e
000318be  mov     r0, r5
000318c0  movs    r3, #4
000318c2  str     r3, [r5, #0x40]
000318c4  bl      #0x5543c ; -> find_ani_last_frame
000318c8  mov     r0, r5
000318ca  bl      #0x59e24 ; -> do_next_a9_frame
000318ce  ldr     r2, [pc, #0xdc]
000318d0  ldr.w   r3, [r4, #0xa4]
000318d4  add     r2, pc ; -> 0x0002ee31  t_joyd3
000318d6  lsls    r3, r3, #3
000318d8  adds    r3, r3, r4
000318da  movs    r0, #0
000318dc  str     r2, [r3, #4]
000318de  ldr.w   r3, [r4, #0xa4]
000318e2  adds    r3, #1
000318e4  str.w   r0, [r4, r3, lsl #3]
000318e8  b       #0x3186e
000318ea  mov     r0, r5
000318ec  bl      #0x55d94 ; -> joystick_in_a0
000318f0  ldr     r3, [r5, #0x1c]
000318f2  ands    r0, r3, #2
000318f6  bne     #0x31980
000318f8  ldr.w   r3, [r4, #0xa4]
000318fc  ldr.w   r2, [pc, #0xb0]
00031900  lsls    r3, r3, #3
00031902  adds    r3, r3, r4
00031904  add     r2, pc ; -> 0x000305b1  t_joy_back_up
00031906  str     r2, [r3, #4]
00031908  ldr.w   r3, [r4, #0xa4]
0003190c  adds    r3, #1
0003190e  str.w   r0, [r4, r3, lsl #3]
00031912  b       #0x3186e
00031914  ldr.w   r1, [pc, #0x9c]
00031918  lsls    r3, r2, #3
0003191a  adds    r3, r3, r0
0003191c  add     r1, pc ; -> 0x0002f261  t_jdblk2
0003191e  str     r1, [r3, #4]
00031920  ldr.w   r3, [r0, #0xa4]
00031924  movs    r0, #0
00031926  adds    r3, #1
00031928  str.w   r0, [r4, r3, lsl #3]
0003192c  b       #0x3186e
0003192e  ldr     r2, [r5]
00031930  movw    r3, #0x701
00031934  mov     r0, r5
00031936  str     r3, [r5, #0x1c]
00031938  str     r3, [r2, #0x18]
0003193a  bl      #0x2eca8 ; -> check_block_bit
0003193e  cbz     r0, #0x3194c
00031940  ldr.w   r2, [pc, #0x74]
00031944  ldr.w   r3, [r4, #0xa4]
00031948  add     r2, pc ; -> 0x00031839  t_joy_duck_block_loop
0003194a  b       #0x318d6
0003194c  ldr     r2, [r5]
0003194e  movw    r3, #0x302
00031952  str     r3, [r5, #0x20]
00031954  str     r3, [r2, #0x18]
00031956  sub.w   r3, r3, #0x2fc
0003195a  str     r3, [r5, #0x40]
0003195c  subs    r3, #3
0003195e  str     r3, [r5, #0x1c]
00031960  ldr.w   r3, [r4, #0xa4]
00031964  movw    r2, #0x26e
00031968  adds    r3, #1
0003196a  str.w   r2, [r4, r3, lsl #3]
0003196e  ldr.w   r3, [r4, #0xa4]
00031972  adds    r2, r3, #1
00031974  ldr.w   r3, [pc, #0x44]
00031978  str.w   r2, [r4, #0xa4]
0003197c  add     r3, pc ; -> 0x000f37c4  t_backwards_ani
0003197e  b       #0x3189a
00031980  mov     r0, r5
00031982  bl      #0x2ec94 ; -> inc_downcount
00031986  ldr.w   r3, [r4, #0xa4]
0003198a  movw    r2, #0x263
0003198e  adds    r3, #1
00031990  str.w   r2, [r4, r3, lsl #3]
00031994  ldr.w   r2, [pc, #0x28]
00031998  ldr.w   r3, [r4, #0xa4]
0003199c  add     r2, pc ; -> 0x0002ecd5  t_check_winner_status
0003199e  adds    r3, #1
000319a0  str.w   r3, [r4, #0xa4]
000319a4  b       #0x318d6
000319a6  nop     
000319a8  movs    r0, #8
000319aa  movs    r4, r1
000319ac  bpl     #0x31a62
