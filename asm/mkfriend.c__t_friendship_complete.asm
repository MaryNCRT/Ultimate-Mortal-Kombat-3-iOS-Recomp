========================================================================
t_friendship_complete  0x000a5990  76 bytes   mkfriend.c
========================================================================

000a5990  push    {r4, r5, r6, r7, lr}
000a5992  add     r7, sp, #0xc
000a5994  ldr.w   r3, [r0, #0xa4]
000a5998  mov     r4, r0
000a599a  ldr.w   r6, [r0, #0x108]
000a599e  adds    r3, #1
000a59a0  ldr.w   r5, [r0, r3, lsl #3]
000a59a4  cbnz    r5, #0xa59d0
000a59a6  mov     r0, r6
000a59a8  bl      #0x336e8 ; -> death_blow_complete
000a59ac  mov     r0, r6
000a59ae  bl      #0x57488 ; -> player_normpal
000a59b2  ldr     r3, [pc, #0x24]
000a59b4  mov     r0, r5
000a59b6  add     r3, pc ; -> 0x000f3724  t_wait_forever
000a59b8  ldr     r2, [r3]
000a59ba  ldr.w   r3, [r4, #0xa4]
000a59be  lsls    r3, r3, #3
000a59c0  adds    r3, r3, r4
000a59c2  str     r2, [r3, #4]
000a59c4  ldr.w   r3, [r4, #0xa4]
000a59c8  adds    r3, #1
000a59ca  str.w   r5, [r4, r3, lsl #3]
000a59ce  pop     {r4, r5, r6, r7, pc}
000a59d0  mvn     r0, #2
000a59d4  b       #0xa59ce
000a59d6  nop     
000a59d8  ble     #0xa5ab0
000a59da  movs    r4, r0
