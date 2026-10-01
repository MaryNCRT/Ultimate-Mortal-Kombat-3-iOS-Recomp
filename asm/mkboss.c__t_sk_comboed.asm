========================================================================
t_sk_comboed  0x000a909c  284 bytes   mkboss.c
========================================================================

000a909c  push    {r4, r5, r6, r7, lr}
000a909e  add     r7, sp, #0xc
000a90a0  str     r8, [sp, #-0x4]!
000a90a4  ldr.w   r2, [r0, #0xa4]
000a90a8  movw    r8, #0x893
000a90ac  mov     r4, r0
000a90ae  adds    r3, r2, #1
000a90b0  ldr.w   r6, [r0, #0x108]
000a90b4  ldr.w   r5, [r0, r3, lsl #3]
000a90b8  cmp     r5, r8
000a90ba  beq     #0xa9170
000a90bc  ble     #0xa90d6
000a90be  movw    r3, #0x894
000a90c2  cmp     r5, r3
000a90c4  beq     #0xa9180
000a90c6  adds    r3, #2
000a90c8  cmp     r5, r3
000a90ca  beq     #0xa916a
000a90cc  mvn     r0, #2
000a90d0  ldr     r8, [sp], #4
000a90d4  pop     {r4, r5, r6, r7, pc}
000a90d6  cbz     r5, #0xa9132
000a90d8  movw    r3, #0x889
000a90dc  cmp     r5, r3
000a90de  bne     #0xa90cc
000a90e0  mov     r0, r6
000a90e2  movs    r3, #6
000a90e4  str     r3, [r6, #0x1c]
000a90e6  bl      #0x580a4 ; -> group_sound
000a90ea  mov     r0, r6
000a90ec  mov.w   r3, #0x30000
000a90f0  str     r3, [r6, #0x1c]
000a90f2  bl      #0x55ab0 ; -> away_x_vel
000a90f6  mov     r0, r6
000a90f8  movs    r3, #0x1c
000a90fa  str     r3, [r6, #0x40]
000a90fc  bl      #0x5520c ; -> get_char_ani
000a9100  ldr     r3, [pc, #0xa0]
000a9102  str     r3, [r6, #0x1c]
000a9104  ldr.w   r3, [r4, #0xa4]
000a9108  adds    r3, #1
000a910a  str.w   r8, [r4, r3, lsl #3]
000a910e  ldr.w   r3, [r4, #0xa4]
000a9112  adds    r2, r3, #1
000a9114  ldr     r3, [pc, #0x90]
000a9116  str.w   r2, [r4, #0xa4]
000a911a  add     r3, pc ; -> 0x000f36b8  t_animate_a0_frames
000a911c  ldr     r1, [r3]
000a911e  lsls    r3, r2, #3
000a9120  adds    r3, r3, r4
000a9122  movs    r0, #0
000a9124  str     r1, [r3, #4]
000a9126  ldr.w   r3, [r4, #0xa4]
000a912a  adds    r3, #1
000a912c  str.w   r0, [r4, r3, lsl #3]
000a9130  b       #0xa90d0
000a9132  mov     r0, r6
000a9134  movs    r1, #0xa
000a9136  bl      #0x57dbc ; -> rsnd_func
000a913a  ldr.w   r3, [r4, #0xa4]
000a913e  movw    r2, #0x889
000a9142  mov     r0, r5
000a9144  adds    r3, #1
000a9146  str.w   r2, [r4, r3, lsl #3]
000a914a  ldr.w   r3, [r4, #0xa4]
000a914e  ldr     r2, [pc, #0x5c]
000a9150  adds    r3, #1
000a9152  str.w   r3, [r4, #0xa4]
000a9156  lsls    r3, r3, #3
000a9158  adds    r3, r3, r4
000a915a  add     r2, pc ; -> 0x000a8f15  t_sk_airborn_check
000a915c  str     r2, [r3, #4]
000a915e  ldr.w   r3, [r4, #0xa4]
000a9162  adds    r3, #1
000a9164  str.w   r5, [r4, r3, lsl #3]
000a9168  b       #0xa90d0
000a916a  ldr     r3, [pc, #0x44]
000a916c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a916e  b       #0xa911c
000a9170  movw    r2, #0x894
000a9174  str.w   r2, [r0, r3, lsl #3]
000a9178  movs    r0, #6
000a917a  str.w   r0, [r4, #0xfc]
000a917e  b       #0xa90d0
000a9180  movs    r3, #3
000a9182  str     r3, [r6, #0x1c]
000a9184  ldr.w   r3, [r0, #0xa4]
000a9188  movw    r2, #0x896
000a918c  adds    r3, #1
000a918e  str.w   r2, [r0, r3, lsl #3]
000a9192  ldr.w   r3, [r0, #0xa4]
000a9196  adds    r2, r3, #1
000a9198  ldr     r3, [pc, #0x18]
000a919a  str.w   r2, [r0, #0xa4]
000a919e  add     r3, pc ; -> 0x000f37cc  t_mframew
000a91a0  b       #0xa911c
000a91a2  nop     
000a91a4  movs    r2, r0
000a91a6  movs    r3, r0
000a91a8  adr     r5, #0x268
000a91aa  movs    r4, r0
000a91ac  ldc2    p15, c15, [r7, #0x3fc]!
000a91b0  adr     r5, #0x260
000a91b2  movs    r4, r0
000a91b4  adr     r6, #0xa8
000a91b6  movs    r4, r0
