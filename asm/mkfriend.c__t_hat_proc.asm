========================================================================
t_hat_proc  0x000a662c  108 bytes   mkfriend.c
========================================================================

000a662c  push    {r4, r5, r6, r7, lr}
000a662e  add     r7, sp, #0xc
000a6630  ldr.w   r3, [r0, #0xa4]
000a6634  mov     r5, r0
000a6636  ldr.w   r4, [r0, #0x108]
000a663a  adds    r3, #1
000a663c  ldr.w   r6, [r0, r3, lsl #3]
000a6640  cmp     r6, #0
000a6642  bne     #0xa668a
000a6644  ldr     r2, [r4, #8]
000a6646  movw    r3, #0x1b39
000a664a  mov     r0, r4
000a664c  str     r3, [r2, #0x2c]
000a664e  movs    r3, #0x60
000a6650  str     r3, [r4, #0x1c]
000a6652  subs    r3, #0x50
000a6654  str     r3, [r4, #0x20]
000a6656  bl      #0x570ac ; -> multi_adjust_xy
000a665a  ldr     r2, [r4, #8]
000a665c  ldr     r3, [pc, #0x30]
000a665e  mov     r0, r4
000a6660  str     r3, [r2, #0x1c]
000a6662  add.w   r3, r3, #0xe0000
000a6666  str     r3, [r4, #0x1c]
000a6668  bl      #0x75d6c ; -> set_proj_vel
000a666c  ldr     r3, [pc, #0x24]
000a666e  mov     r0, r6
000a6670  add     r3, pc ; -> 0x000f3724  t_wait_forever
000a6672  ldr     r2, [r3]
000a6674  ldr.w   r3, [r5, #0xa4]
000a6678  lsls    r3, r3, #3
000a667a  adds    r3, r3, r5
000a667c  str     r2, [r3, #4]
000a667e  ldr.w   r3, [r5, #0xa4]
000a6682  adds    r3, #1
000a6684  str.w   r6, [r5, r3, lsl #3]
000a6688  pop     {r4, r5, r6, r7, pc}
000a668a  mvn     r0, #2
000a668e  b       #0xa6688
000a6690  movs    r0, r0
000a6692  vshr.u64 d29, d16, #4
000a6696  movs    r4, r0
