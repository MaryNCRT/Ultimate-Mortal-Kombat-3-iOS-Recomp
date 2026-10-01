========================================================================
t_f_null_friendship  0x000a5858  88 bytes   mkfriend.c
========================================================================

000a5858  push    {r4, r7, lr}
000a585a  add     r7, sp, #4
000a585c  mov     r4, r0
000a585e  ldr.w   r3, [r4, #0xa4]
000a5862  ldr.w   r0, [r0, #0x108]
000a5866  adds    r2, r3, #1
000a5868  ldr.w   r3, [r4, r2, lsl #3]
000a586c  cbnz    r3, #0xa587e
000a586e  movw    r3, #0x155
000a5872  movs    r0, #0x80
000a5874  str.w   r3, [r4, r2, lsl #3]
000a5878  str.w   r0, [r4, #0xfc]
000a587c  pop     {r4, r7, pc}
000a587e  movw    r2, #0x155
000a5882  cmp     r3, r2
000a5884  it      ne
000a5886  mvnne   r0, #2
000a588a  bne     #0xa587c
000a588c  bl      #0x336e8 ; -> death_blow_complete
000a5890  ldr.w   r3, [r4, #0xa4]
000a5894  ldr     r2, [pc, #0x14]
000a5896  movs    r0, #0
000a5898  lsls    r3, r3, #3
000a589a  adds    r3, r3, r4
000a589c  add     r2, pc ; -> 0x000a5991  t_friendship_complete
000a589e  str     r2, [r3, #4]
000a58a0  ldr.w   r3, [r4, #0xa4]
000a58a4  adds    r3, #1
000a58a6  str.w   r0, [r4, r3, lsl #3]
000a58aa  b       #0xa587c
000a58ac  lsls    r1, r6, #3
000a58ae  movs    r0, r0
