========================================================================
t_pop_up_my_toy  0x000a7174  124 bytes   mkfriend.c
========================================================================

000a7174  push    {r4, r5, r6, r7, lr}
000a7176  add     r7, sp, #0xc
000a7178  ldr.w   r3, [r0, #0xa4]
000a717c  mov     r5, r0
000a717e  ldr.w   r4, [r0, #0x108]
000a7182  adds    r3, #1
000a7184  ldr.w   r6, [r0, r3, lsl #3]
000a7188  cmp     r6, #0
000a718a  bne     #0xa71dc
000a718c  ldr     r1, [pc, #0x54]
000a718e  mov     r0, r4
000a7190  add     r1, pc ; -> 0x000a5901  t_popup
000a7192  bl      #0x58b54 ; -> NewThreadProc
000a7196  ldr     r2, [r4, #0x30]
000a7198  movs    r1, #0x92
000a719a  ldr     r3, [r0, #8]
000a719c  mov     r0, r4
000a719e  str     r2, [r3, #0x2c]
000a71a0  bl      #0x57dd0 ; -> tsound_func
000a71a4  mov     r0, r4
000a71a6  mov.w   r3, #0x60006
000a71aa  str     r3, [r4, #0x48]
000a71ac  bl      #0x581e0 ; -> shake_a11
000a71b0  ldr     r3, [pc, #0x34]
000a71b2  mov     r0, r4
000a71b4  add     r3, pc ; -> 0x000f33f0  t_r_scared_of_monkey
000a71b6  ldr     r3, [r3]
000a71b8  str     r3, [r4, #0x38]
000a71ba  bl      #0x58954 ; -> takeover_him
000a71be  ldr     r3, [pc, #0x2c]
000a71c0  mov     r0, r6
000a71c2  add     r3, pc ; -> 0x000f3724  t_wait_forever
000a71c4  ldr     r2, [r3]
000a71c6  ldr.w   r3, [r5, #0xa4]
000a71ca  lsls    r3, r3, #3
000a71cc  adds    r3, r3, r5
000a71ce  str     r2, [r3, #4]
000a71d0  ldr.w   r3, [r5, #0xa4]
000a71d4  adds    r3, #1
000a71d6  str.w   r6, [r5, r3, lsl #3]
000a71da  pop     {r4, r5, r6, r7, pc}
000a71dc  mvn     r0, #2
000a71e0  b       #0xa71da
000a71e2  nop     
000a71e4  b       #0xa70c2
000a71e6  vrshr.u32 d28, d24, #1
000a71ea  movs    r4, r0
000a71ec  stm     r5!, {r1, r2, r3, r4, r6}
000a71ee  movs    r4, r0
