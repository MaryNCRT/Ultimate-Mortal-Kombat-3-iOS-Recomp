========================================================================
t_joyd4  0x0002fad4  180 bytes   joy.c
========================================================================

0002fad4  push    {r4, r7, lr}
0002fad6  add     r7, sp, #4
0002fad8  mov     r4, r0
0002fada  ldr.w   r1, [r4, #0xa4]
0002fade  ldr.w   r0, [r0, #0x108]
0002fae2  adds    r3, r1, #1
0002fae4  ldr.w   r3, [r4, r3, lsl #3]
0002fae8  cmp.w   r3, #0x162
0002faec  beq     #0x2fb36
0002faee  movw    r2, #0x167
0002faf2  cmp     r3, r2
0002faf4  beq     #0x2fb1e
0002faf6  cbz     r3, #0x2fafe
0002faf8  mvn     r0, #2
0002fafc  pop     {r4, r7, pc}
0002fafe  ldr     r2, [r0]
0002fb00  movw    r3, #0x302
0002fb04  str     r3, [r2, #0x18]
0002fb06  str     r3, [r0, #0x1c]
0002fb08  ldr.w   r3, [r4, #0xa4]
0002fb0c  movs    r0, #1
0002fb0e  mov.w   r2, #0x162
0002fb12  adds    r3, #1
0002fb14  str.w   r2, [r4, r3, lsl #3]
0002fb18  str.w   r0, [r4, #0xfc]
0002fb1c  b       #0x2fafc
0002fb1e  ldr     r2, [pc, #0x5c]
0002fb20  lsls    r3, r1, #3
0002fb22  add     r2, pc ; -> 0x0002ee31  t_joyd3
0002fb24  adds    r3, r3, r4
0002fb26  movs    r0, #0
0002fb28  str     r2, [r3, #4]
0002fb2a  ldr.w   r3, [r4, #0xa4]
0002fb2e  adds    r3, #1
0002fb30  str.w   r0, [r4, r3, lsl #3]
0002fb34  b       #0x2fafc
0002fb36  bl      #0x551f0 ; -> am_i_facing_him
0002fb3a  cbz     r0, #0x2fb4a
0002fb3c  ldr.w   r3, [r4, #0xa4]
0002fb40  ldr.w   r2, [pc, #0x3c]
0002fb44  lsls    r3, r3, #3
0002fb46  add     r2, pc ; -> 0x000303f1  t_joyd5
0002fb48  b       #0x2fb24
0002fb4a  ldr.w   r3, [r4, #0xa4]
0002fb4e  movw    r2, #0x167
0002fb52  adds    r3, #1
0002fb54  str.w   r2, [r4, r3, lsl #3]
0002fb58  ldr.w   r3, [r4, #0xa4]
0002fb5c  adds    r2, r3, #1
0002fb5e  ldr     r3, [pc, #0x24]
0002fb60  str.w   r2, [r4, #0xa4]
0002fb64  add     r3, pc ; -> 0x000f38a4  t_duck_turnaround
0002fb66  ldr     r1, [r3]
0002fb68  lsls    r3, r2, #3
0002fb6a  adds    r3, r3, r4
0002fb6c  str     r1, [r3, #4]
0002fb6e  ldr.w   r3, [r4, #0xa4]
0002fb72  adds    r3, #1
0002fb74  str.w   r0, [r4, r3, lsl #3]
0002fb78  b       #0x2fafc
0002fb7a  nop     
0002fb7c  bl      #0x33bb7e
0002fb80  lsrs    r7, r4, #2
0002fb82  movs    r0, r0
0002fb84  subs    r5, #0x3c
0002fb86  movs    r4, r1
