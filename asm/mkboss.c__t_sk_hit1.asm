========================================================================
t_sk_hit1  0x000a9388  220 bytes   mkboss.c
========================================================================

000a9388  push    {r4, r5, r6, r7, lr}
000a938a  add     r7, sp, #0xc
000a938c  str     r8, [sp, #-0x4]!
000a9390  ldr.w   r2, [r0, #0xa4]
000a9394  movw    r8, #0x868
000a9398  mov     r4, r0
000a939a  adds    r3, r2, #1
000a939c  ldr.w   r5, [r0, #0x108]
000a93a0  ldr.w   r6, [r0, r3, lsl #3]
000a93a4  cmp     r6, r8
000a93a6  beq     #0xa9422
000a93a8  movw    r3, #0x86d
000a93ac  cmp     r6, r3
000a93ae  beq     #0xa9406
000a93b0  cbz     r6, #0xa93bc
000a93b2  mvn     r0, #2
000a93b6  ldr     r8, [sp], #4
000a93ba  pop     {r4, r5, r6, r7, pc}
000a93bc  movs    r1, #8
000a93be  mov     r0, r5
000a93c0  bl      #0x57dbc ; -> rsnd_func
000a93c4  mov     r0, r5
000a93c6  mov.w   r3, #0x40004
000a93ca  str     r3, [r5, #0x48]
000a93cc  bl      #0x581e0 ; -> shake_a11
000a93d0  mov     r0, r5
000a93d2  movs    r3, #6
000a93d4  str     r3, [r5, #0x1c]
000a93d6  bl      #0x580a4 ; -> group_sound
000a93da  ldr.w   r3, [r4, #0xa4]
000a93de  ldr     r2, [pc, #0x74]
000a93e0  mov     r0, r6
000a93e2  adds    r3, #1
000a93e4  add     r2, pc ; -> 0x000a8f15  t_sk_airborn_check
000a93e6  str.w   r8, [r4, r3, lsl #3]
000a93ea  ldr.w   r3, [r4, #0xa4]
000a93ee  adds    r3, #1
000a93f0  str.w   r3, [r4, #0xa4]
000a93f4  lsls    r3, r3, #3
000a93f6  adds    r3, r3, r4
000a93f8  str     r2, [r3, #4]
000a93fa  ldr.w   r3, [r4, #0xa4]
000a93fe  adds    r3, #1
000a9400  str.w   r6, [r4, r3, lsl #3]
000a9404  b       #0xa93b6
000a9406  ldr.w   r3, [pc, #0x50]
000a940a  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a940c  ldr     r1, [r3]
000a940e  lsls    r3, r2, #3
000a9410  adds    r3, r3, r4
000a9412  movs    r0, #0
000a9414  str     r1, [r3, #4]
000a9416  ldr.w   r3, [r4, #0xa4]
000a941a  adds    r3, #1
000a941c  str.w   r0, [r4, r3, lsl #3]
000a9420  b       #0xa93b6
000a9422  mov     r0, r5
000a9424  mov.w   r3, #0x40000
000a9428  str     r3, [r5, #0x1c]
000a942a  bl      #0x55ab0 ; -> away_x_vel
000a942e  ldr.w   r3, [pc, #0x2c]
000a9432  movw    r2, #0x86d
000a9436  str     r3, [r5, #0x40]
000a9438  ldr.w   r3, [r4, #0xa4]
000a943c  adds    r3, #1
000a943e  str.w   r2, [r4, r3, lsl #3]
000a9442  ldr.w   r3, [r4, #0xa4]
000a9446  adds    r2, r3, #1
000a9448  ldr.w   r3, [pc, #0x14]
000a944c  str.w   r2, [r4, #0xa4]
000a9450  add     r3, pc ; -> 0x000f36d0  t_animate_a9
000a9452  b       #0xa940c
