========================================================================
t_grab_ani  0x000aa7f4  116 bytes   mkboss.c
========================================================================

000aa7f4  push    {r4, r5, r7, lr}
000aa7f6  add     r7, sp, #8
000aa7f8  ldr.w   r2, [r0, #0xa4]
000aa7fc  mov     r4, r0
000aa7fe  ldr.w   r5, [r0, #0x108]
000aa802  adds    r3, r2, #1
000aa804  ldr.w   r3, [r0, r3, lsl #3]
000aa808  cbnz    r3, #0xaa82c
000aa80a  mov     r0, r5
000aa80c  bl      #0x57080 ; -> adjust_him_xy
000aa810  mov     r0, r5
000aa812  bl      #0x59e24 ; -> do_next_a9_frame
000aa816  ldr.w   r3, [r4, #0xa4]
000aa81a  movw    r2, #0x503
000aa81e  movs    r0, #6
000aa820  adds    r3, #1
000aa822  str.w   r2, [r4, r3, lsl #3]
000aa826  str.w   r0, [r4, #0xfc]
000aa82a  pop     {r4, r5, r7, pc}
000aa82c  movw    r1, #0x503
000aa830  cmp     r3, r1
000aa832  it      ne
000aa834  mvnne   r0, #2
000aa838  bne     #0xaa82a
000aa83a  cmp     r2, #0
000aa83c  ble     #0xaa848
000aa83e  subs    r3, r2, #1
000aa840  movs    r0, #0
000aa842  str.w   r3, [r4, #0xa4]
000aa846  b       #0xaa82a
000aa848  ldr     r3, [pc, #0x18]
000aa84a  movs    r0, #0
000aa84c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000aa84e  ldr     r1, [r3]
000aa850  lsls    r3, r2, #3
000aa852  adds    r3, r3, r4
000aa854  str     r1, [r3, #4]
000aa856  ldr.w   r3, [r4, #0xa4]
000aa85a  adds    r3, #1
000aa85c  str.w   r0, [r4, r3, lsl #3]
000aa860  b       #0xaa82a
000aa862  nop     
000aa864  ldrh    r0, [r7, #0x34]
000aa866  movs    r4, r0
