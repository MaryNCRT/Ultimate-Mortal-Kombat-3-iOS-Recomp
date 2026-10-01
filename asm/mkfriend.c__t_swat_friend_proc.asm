========================================================================
t_swat_friend_proc  0x000a57b4  84 bytes   mkfriend.c
========================================================================

000a57b4  push    {r4, r7, lr}
000a57b6  add     r7, sp, #4
000a57b8  mov     r4, r0
000a57ba  ldr.w   r3, [r4, #0xa4]
000a57be  ldr.w   r0, [r0, #0x108]
000a57c2  adds    r2, r3, #1
000a57c4  ldr.w   r3, [r4, r2, lsl #3]
000a57c8  cbnz    r3, #0xa57da
000a57ca  movw    r3, #0x34f
000a57ce  movs    r0, #0xa0
000a57d0  str.w   r3, [r4, r2, lsl #3]
000a57d4  str.w   r0, [r4, #0xfc]
000a57d8  pop     {r4, r7, pc}
000a57da  movw    r2, #0x34f
000a57de  cmp     r3, r2
000a57e0  it      ne
000a57e2  mvnne   r0, #2
000a57e6  bne     #0xa57d8
000a57e8  bl      #0x336e8 ; -> death_blow_complete
000a57ec  ldr.w   r3, [r4, #0xa4]
000a57f0  ldr     r0, [pc, #0x10]
000a57f2  movw    r2, #0x351
000a57f6  adds    r3, #1
000a57f8  str.w   r2, [r4, r3, lsl #3]
000a57fc  str.w   r0, [r4, #0xfc]
000a5800  b       #0xa57d8
000a5802  nop     
000a5804  str     r2, [r4, #0x44]
000a5806  movs    r1, r0
