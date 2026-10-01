========================================================================
t_mc_sg_pounce_sd  0x000aba5c  232 bytes   mkboss.c
========================================================================

000aba5c  push    {r4, r5, r6, r7, lr}
000aba5e  add     r7, sp, #0xc
000aba60  ldr.w   r3, [r0, #0xa4]
000aba64  mov     r5, r0
000aba66  ldr.w   r4, [r0, #0x108]
000aba6a  adds    r3, #1
000aba6c  ldr.w   r6, [r0, r3, lsl #3]
000aba70  cbnz    r6, #0xabaa2
000aba72  movw    r3, #0x2ee
000aba76  mov     r0, r4
000aba78  str     r3, [r4, #0x1c]
000aba7a  bl      #0xab6bc ; -> bossrandper
000aba7e  ldr     r3, [r4, #0x5c]
000aba80  cmp     r3, #0
000aba82  bne     #0xabad4
000aba84  ldr     r3, [pc, #0xa8]
000aba86  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000aba88  ldr     r2, [r3]
000aba8a  ldr.w   r3, [r5, #0xa4]
000aba8e  mov     r0, r6
000aba90  lsls    r3, r3, #3
000aba92  adds    r3, r3, r5
000aba94  str     r2, [r3, #4]
000aba96  ldr.w   r3, [r5, #0xa4]
000aba9a  adds    r3, #1
000aba9c  str.w   r6, [r5, r3, lsl #3]
000abaa0  pop     {r4, r5, r6, r7, pc}
000abaa2  movw    r3, #0x6c7
000abaa6  cmp     r6, r3
000abaa8  it      ne
000abaaa  mvnne   r0, #2
000abaae  bne     #0xabaa0
000abab0  mov     r0, r4
000abab2  bl      #0x55388 ; -> face_opponent
000abab6  ldr     r3, [r4, #0x44]
000abab8  subs    r6, r3, #1
000ababa  str     r6, [r4, #0x44]
000ababc  cbz     r6, #0xabae6
000ababe  ldr.w   r3, [r5, #0xa4]
000abac2  movs    r0, #1
000abac4  movw    r2, #0x6c7
000abac8  adds    r3, #1
000abaca  str.w   r2, [r5, r3, lsl #3]
000abace  str.w   r0, [r5, #0xfc]
000abad2  b       #0xabaa0
000abad4  mov     r0, r4
000abad6  bl      #0x2f3a0 ; -> get_x_dist
000abada  ldr     r3, [r4, #0x28]
000abadc  cmp     r3, #0x90
000abade  ble     #0xabb16
000abae0  ldr     r3, [pc, #0x50]
000abae2  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000abae4  b       #0xaba88
000abae6  mov.w   r3, #0x1f4
000abaea  mov     r0, r4
000abaec  str     r3, [r4, #0x1c]
000abaee  bl      #0xab6bc ; -> bossrandper
000abaf2  ldr     r0, [r4, #0x5c]
000abaf4  cbz     r0, #0xabafc
000abaf6  ldr     r2, [pc, #0x40]
000abaf8  add     r2, pc ; -> 0x000a8ead  t_motaro_grab_punch
000abafa  b       #0xaba8a
000abafc  ldr.w   r3, [r5, #0xa4]
000abb00  ldr     r2, [pc, #0x38]
000abb02  lsls    r3, r3, #3
000abb04  adds    r3, r3, r5
000abb06  add     r2, pc ; -> 0x000aa051  t_motaro_punch
000abb08  str     r2, [r3, #4]
000abb0a  ldr.w   r3, [r5, #0xa4]
000abb0e  adds    r3, #1
000abb10  str.w   r0, [r5, r3, lsl #3]
000abb14  b       #0xabaa0
000abb16  mov     r0, r4
000abb18  bl      #0x2f3a0 ; -> get_x_dist
000abb1c  ldr     r3, [r4, #0x28]
000abb1e  cmp     r3, #0x70
000abb20  ble     #0xabb2a
000abb22  ldr.w   r2, [pc, #0x1c]
000abb26  add     r2, pc ; -> 0x000aa869  t_motaro_kick
000abb28  b       #0xaba8a
000abb2a  movs    r3, #8
000abb2c  str     r3, [r4, #0x44]
000abb2e  b       #0xababe
000abb30  ldrb    r6, [r3, #6]
000abb32  movs    r4, r0
000abb34  ldrb    r2, [r0, #5]
000abb36  movs    r4, r0
000abb38  blo     #0xaba9e
