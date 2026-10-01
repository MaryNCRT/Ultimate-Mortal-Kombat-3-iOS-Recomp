========================================================================
t_d_wait_yes_still  0x000684c0  240 bytes   mkdrone.c
========================================================================

000684c0  push    {r4, r5, r7, lr}
000684c2  add     r7, sp, #8
000684c4  ldr.w   r3, [r0, #0xa4]
000684c8  mov     r4, r0
000684ca  ldr.w   r5, [r0, #0x108]
000684ce  adds    r2, r3, #1
000684d0  ldr.w   r3, [r0, r2, lsl #3]
000684d4  cbnz    r3, #0x684e6
000684d6  movw    r3, #0x66e
000684da  str.w   r3, [r0, r2, lsl #3]
000684de  movs    r0, #1
000684e0  str.w   r0, [r4, #0xfc]
000684e4  pop     {r4, r5, r7, pc}
000684e6  movw    r2, #0x66e
000684ea  cmp     r3, r2
000684ec  it      ne
000684ee  mvnne   r0, #2
000684f2  bne     #0x684e4
000684f4  ldr.w   r1, [r4, #0xf8]
000684f8  ldr     r2, [r5, #0x44]
000684fa  mov     r0, r5
000684fc  lsls    r3, r1, #2
000684fe  adds    r3, r3, r4
00068500  str.w   r2, [r3, #0xa8]
00068504  adds    r3, r1, #1
00068506  str.w   r3, [r4, #0xf8]
0006850a  ldr     r3, [r5, #0x48]
0006850c  blx     r3
0006850e  ldr.w   r3, [r4, #0xf8]
00068512  subs    r3, #1
00068514  str.w   r3, [r4, #0xf8]
00068518  lsls    r3, r3, #2
0006851a  adds    r3, r3, r4
0006851c  ldr     r2, [r5, #0x5c]
0006851e  ldr.w   r3, [r3, #0xa8]
00068522  str     r3, [r5, #0x44]
00068524  cbz     r2, #0x68538
00068526  ldr.w   r3, [r4, #0xa4]
0006852a  cmp     r3, #0
0006852c  ble     #0x6856c
0006852e  subs    r3, #1
00068530  movs    r0, #0
00068532  str.w   r3, [r4, #0xa4]
00068536  b       #0x684e4
00068538  subs    r1, r3, #1
0006853a  str     r1, [r5, #0x44]
0006853c  cbz     r1, #0x6855a
0006853e  ldr.w   r3, [r4, #0xa4]
00068542  ldr     r1, [pc, #0x60]
00068544  mov     r0, r2
00068546  lsls    r3, r3, #3
00068548  adds    r3, r3, r4
0006854a  add     r1, pc ; -> 0x000684c1  t_d_wait_yes_still
0006854c  str     r1, [r3, #4]
0006854e  ldr.w   r3, [r4, #0xa4]
00068552  adds    r3, #1
00068554  str.w   r2, [r4, r3, lsl #3]
00068558  b       #0x684e4
0006855a  ldr.w   r3, [r4, #0xa4]
0006855e  cmp     r3, #0
00068560  ble     #0x68586
00068562  subs    r3, #1
00068564  mov     r0, r1
00068566  str.w   r3, [r4, #0xa4]
0006856a  b       #0x684e4
0006856c  ldr     r2, [pc, #0x38]
0006856e  lsls    r3, r3, #3
00068570  adds    r3, r3, r4
00068572  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00068574  movs    r0, #0
00068576  ldr     r2, [r2]
00068578  str     r2, [r3, #4]
0006857a  ldr.w   r3, [r4, #0xa4]
0006857e  adds    r3, #1
00068580  str.w   r0, [r4, r3, lsl #3]
00068584  b       #0x684e4
00068586  ldr.w   r2, [pc, #0x24]
0006858a  lsls    r3, r3, #3
0006858c  adds    r3, r3, r4
0006858e  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00068590  mov     r0, r1
00068592  ldr     r2, [r2]
00068594  str     r2, [r3, #4]
00068596  ldr.w   r3, [r4, #0xa4]
0006859a  adds    r3, #1
0006859c  str.w   r1, [r4, r3, lsl #3]
000685a0  b       #0x684e4
000685a2  nop     
