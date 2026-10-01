========================================================================
t_nr_drone_zone  0x0006cdac  300 bytes   mkdrone.c
========================================================================

0006cdac  push    {r4, r5, r6, r7, lr}
0006cdae  add     r7, sp, #0xc
0006cdb0  ldr.w   r2, [r0, #0xa4]
0006cdb4  mov     r4, r0
0006cdb6  ldr.w   r6, [r0, #0x108]
0006cdba  adds    r3, r2, #1
0006cdbc  ldr.w   r5, [r0, r3, lsl #3]
0006cdc0  cbnz    r5, #0x6cde4
0006cdc2  ldr     r3, [pc, #0xfc]
0006cdc4  add     r3, pc ; -> 0x000f357c  G
0006cdc6  ldr     r3, [r3]
0006cdc8  ldrsh.w r3, [r3, #0x460]
0006cdcc  cmp     r3, #3
0006cdce  str     r3, [r6, #0x1c]
0006cdd0  bgt     #0x6ce0a
0006cdd2  ldr.w   r3, [r0, #0xa4]
0006cdd6  cmp     r3, #0
0006cdd8  ble     #0x6ce8a
0006cdda  mov     r0, r5
0006cddc  subs    r3, #1
0006cdde  str.w   r3, [r4, #0xa4]
0006cde2  pop     {r4, r5, r6, r7, pc}
0006cde4  movw    r3, #0x476
0006cde8  cmp     r5, r3
0006cdea  it      ne
0006cdec  mvnne   r0, #2
0006cdf0  bne     #0x6cde2
0006cdf2  ldr     r1, [pc, #0xd0]
0006cdf4  lsls    r3, r2, #3
0006cdf6  adds    r3, r3, r4
0006cdf8  add     r1, pc ; -> 0x0006e8b5  t_drone_zone
0006cdfa  str     r1, [r3, #4]
0006cdfc  ldr.w   r3, [r4, #0xa4]
0006ce00  movs    r0, #0
0006ce02  adds    r3, #1
0006ce04  str.w   r0, [r4, r3, lsl #3]
0006ce08  b       #0x6cde2
0006ce0a  mov     r0, r6
0006ce0c  mov.w   r3, #0x12c
0006ce10  str     r3, [r6, #0x1c]
0006ce12  bl      #0x586dc ; -> randper
0006ce16  ldr     r3, [r6, #0x5c]
0006ce18  cbnz    r3, #0x6ce28
0006ce1a  ldr.w   r3, [r4, #0xa4]
0006ce1e  cmp     r3, #0
0006ce20  bgt     #0x6cdda
0006ce22  ldr     r2, [pc, #0xa4]
0006ce24  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006ce26  b       #0x6ce90
0006ce28  ldr.w   r3, [r4, #0xa4]
0006ce2c  cmp     r3, #0
0006ce2e  ble     #0x6cea6
0006ce30  subs    r3, #1
0006ce32  str.w   r3, [r4, #0xa4]
0006ce36  ldr.w   r1, [r4, #0xa4]
0006ce3a  adds    r3, r1, #1
0006ce3c  lsls    r2, r3, #3
0006ce3e  adds    r2, r2, r4
0006ce40  ldr     r0, [r2, #4]
0006ce42  adds    r2, r3, #1
0006ce44  ldr.w   r2, [r4, r2, lsl #3]
0006ce48  str.w   r2, [r4, r3, lsl #3]
0006ce4c  lsls    r3, r1, #3
0006ce4e  adds    r3, r3, r4
0006ce50  movw    r2, #0x476
0006ce54  str     r0, [r3, #4]
0006ce56  movs    r3, #0xc0
0006ce58  str     r3, [r6, #0x1c]
0006ce5a  adds    r3, #0x10
0006ce5c  str     r3, [r6, #0x48]
0006ce5e  ldr.w   r3, [r4, #0xa4]
0006ce62  movs    r0, #0
0006ce64  adds    r3, #1
0006ce66  str.w   r2, [r4, r3, lsl #3]
0006ce6a  ldr.w   r3, [r4, #0xa4]
0006ce6e  ldr     r2, [pc, #0x5c]
0006ce70  adds    r3, #1
0006ce72  str.w   r3, [r4, #0xa4]
0006ce76  lsls    r3, r3, #3
0006ce78  adds    r3, r3, r4
0006ce7a  add     r2, pc ; -> 0x00072829  t_d_retreat_a11
0006ce7c  str     r2, [r3, #4]
0006ce7e  ldr.w   r3, [r4, #0xa4]
0006ce82  adds    r3, #1
0006ce84  str.w   r0, [r4, r3, lsl #3]
0006ce88  b       #0x6cde2
0006ce8a  ldr.w   r2, [pc, #0x44]
0006ce8e  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006ce90  ldr     r2, [r2]
0006ce92  lsls    r3, r3, #3
0006ce94  adds    r3, r3, r4
0006ce96  mov     r0, r5
0006ce98  str     r2, [r3, #4]
0006ce9a  ldr.w   r3, [r4, #0xa4]
0006ce9e  adds    r3, #1
0006cea0  str.w   r5, [r4, r3, lsl #3]
0006cea4  b       #0x6cde2
0006cea6  ldr     r2, [pc, #0x2c]
0006cea8  lsls    r3, r3, #3
0006ceaa  adds    r3, r3, r4
0006ceac  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006ceae  ldr     r2, [r2]
0006ceb0  str     r2, [r3, #4]
0006ceb2  ldr.w   r3, [r4, #0xa4]
0006ceb6  adds    r3, #1
0006ceb8  str.w   r5, [r4, r3, lsl #3]
0006cebc  b       #0x6ce36
0006cebe  nop     
0006cec0  str     r4, [r6, #0x78]
0006cec2  movs    r0, r1
0006cec4  subs    r1, r7, r2
0006cec6  movs    r0, r0
0006cec8  ldr     r0, [r4, #0xc]
0006ceca  movs    r0, r1
0006cecc  ldr     r3, [r5, r6]
0006cece  movs    r0, r0
0006ced0  ldr     r6, [r6, #4]
0006ced2  movs    r0, r1
0006ced4  ldr     r0, [r3, #4]
0006ced6  movs    r0, r1
