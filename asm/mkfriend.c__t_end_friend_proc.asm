========================================================================
t_end_friend_proc  0x000a5808  80 bytes   mkfriend.c
========================================================================

000a5808  push    {r4, r7, lr}
000a580a  add     r7, sp, #4
000a580c  mov     r4, r0
000a580e  ldr.w   r3, [r4, #0xa4]
000a5812  ldr.w   r0, [r0, #0x108]
000a5816  adds    r2, r3, #1
000a5818  ldr.w   r3, [r4, r2, lsl #3]
000a581c  cbnz    r3, #0xa582e
000a581e  mov.w   r3, #0x240
000a5822  movs    r0, #0x80
000a5824  str.w   r3, [r4, r2, lsl #3]
000a5828  str.w   r0, [r4, #0xfc]
000a582c  pop     {r4, r7, pc}
000a582e  cmp.w   r3, #0x240
000a5832  it      ne
000a5834  mvnne   r0, #2
000a5838  bne     #0xa582c
000a583a  bl      #0x336e8 ; -> death_blow_complete
000a583e  ldr.w   r3, [r4, #0xa4]
000a5842  ldr     r0, [pc, #0x10]
000a5844  movw    r2, #0x242
000a5848  adds    r3, #1
000a584a  str.w   r2, [r4, r3, lsl #3]
000a584e  str.w   r0, [r4, #0xfc]
000a5852  b       #0xa582c
000a5854  str     r2, [r4, #0x44]
000a5856  movs    r1, r0
