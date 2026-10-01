========================================================================
c_er_slam_sd  0x0006d940  104 bytes   mkdrone.c
========================================================================

0006d940  push    {r4, r5, r6, r7, lr}
0006d942  add     r7, sp, #0xc
0006d944  ldr.w   r3, [r0, #0xa4]
0006d948  mov     r4, r0
0006d94a  ldr.w   r5, [r0, #0x108]
0006d94e  adds    r3, #1
0006d950  ldr.w   r6, [r0, r3, lsl #3]
0006d954  cbnz    r6, #0x6d97c
0006d956  mov     r0, r5
0006d958  bl      #0x6c9f4 ; -> should_i_promove
0006d95c  ldr     r3, [r5, #0x5c]
0006d95e  cbnz    r3, #0x6d982
0006d960  ldr     r2, [pc, #0x38]
0006d962  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006d964  ldr.w   r3, [r4, #0xa4]
0006d968  mov     r0, r6
0006d96a  lsls    r3, r3, #3
0006d96c  adds    r3, r3, r4
0006d96e  str     r2, [r3, #4]
0006d970  ldr.w   r3, [r4, #0xa4]
0006d974  adds    r3, #1
0006d976  str.w   r6, [r4, r3, lsl #3]
0006d97a  b       #0x6d980
0006d97c  mvn     r0, #2
0006d980  pop     {r4, r5, r6, r7, pc}
0006d982  mov     r0, r5
0006d984  bl      #0x2f3a0 ; -> get_x_dist
0006d988  ldr     r0, [r5, #0x28]
0006d98a  cmp     r0, #0x9f
0006d98c  bgt     #0x6d994
0006d98e  ldr     r2, [pc, #0x10]
0006d990  add     r2, pc ; -> 0x0006aedd  t_attack_closeup_sd
0006d992  b       #0x6d964
0006d994  ldr     r2, [pc, #0xc]
0006d996  add     r2, pc ; -> 0x00067895  t_run_in_close
0006d998  b       #0x6d964
0006d99a  nop     
