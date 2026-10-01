========================================================================
t_friend_ender  0x000a58b0  80 bytes   mkfriend.c
========================================================================

000a58b0  push    {r4, r7, lr}
000a58b2  add     r7, sp, #4
000a58b4  mov     r4, r0
000a58b6  ldr.w   r3, [r4, #0xa4]
000a58ba  ldr.w   r0, [r0, #0x108]
000a58be  adds    r2, r3, #1
000a58c0  ldr.w   r3, [r4, r2, lsl #3]
000a58c4  cbnz    r3, #0xa58d6
000a58c6  mov.w   r3, #0x130
000a58ca  movs    r0, #0x80
000a58cc  str.w   r3, [r4, r2, lsl #3]
000a58d0  str.w   r0, [r4, #0xfc]
000a58d4  pop     {r4, r7, pc}
000a58d6  cmp.w   r3, #0x130
000a58da  it      ne
000a58dc  mvnne   r0, #2
000a58e0  bne     #0xa58d4
000a58e2  bl      #0x336e8 ; -> death_blow_complete
000a58e6  ldr.w   r3, [r4, #0xa4]
000a58ea  ldr     r0, [pc, #0x10]
000a58ec  mov.w   r2, #0x132
000a58f0  adds    r3, #1
000a58f2  str.w   r2, [r4, r3, lsl #3]
000a58f6  str.w   r0, [r4, #0xfc]
000a58fa  b       #0xa58d4
000a58fc  str     r2, [r4, #0x44]
000a58fe  movs    r1, r0
