========================================================================
t_orb_proc  0x0007ba10  248 bytes   mkzap.c
========================================================================

0007ba10  push    {r4, r5, r6, r7, lr}
0007ba12  add     r7, sp, #0xc
0007ba14  push.w  {r8, sl}
0007ba18  ldr.w   r2, [r0, #0xa4]
0007ba1c  movw    sl, #0x4df
0007ba20  mov     r5, r0
0007ba22  adds    r3, r2, #1
0007ba24  ldr.w   r4, [r0, #0x108]
0007ba28  ldr.w   r6, [r0, r3, lsl #3]
0007ba2c  cmp     r6, sl
0007ba2e  beq     #0x7bab8
0007ba30  movw    r3, #0x4e9
0007ba34  cmp     r6, r3
0007ba36  beq     #0x7baa0
0007ba38  cbz     r6, #0x7ba44
0007ba3a  mvn     r0, #2
0007ba3e  pop.w   {r8, sl}
0007ba42  pop     {r4, r5, r6, r7, pc}
0007ba44  mov     r0, r4
0007ba46  mov.w   r8, #3
0007ba4a  movs    r3, #5
0007ba4c  str.w   r8, [r4, #0x54]
0007ba50  str     r3, [r4, #0x40]
0007ba52  bl      #0x554c0 ; -> find_ani2_part_a14
0007ba56  ldr     r3, [r4, #0x44]
0007ba58  mov     r0, r4
0007ba5a  str.w   r8, [r4, #0x20]
0007ba5e  str     r3, [r4, #0x1c]
0007ba60  bl      #0x75d6c ; -> set_proj_vel
0007ba64  movs    r3, #0x11
0007ba66  str     r3, [r4, #0x48]
0007ba68  ldr     r3, [pc, #0x8c]
0007ba6a  str.w   r8, [r4, #0x44]
0007ba6e  ldr     r2, [pc, #0x8c]
0007ba70  add     r3, pc ; -> 0x00076535  t_orb_calla
0007ba72  str     r3, [r4, #0x34]
0007ba74  ldr.w   r3, [r5, #0xa4]
0007ba78  add     r2, pc ; -> 0x00075919  tl_projectile_flight_call
0007ba7a  mov     r0, r6
0007ba7c  adds    r3, #1
0007ba7e  str.w   sl, [r5, r3, lsl #3]
0007ba82  ldr.w   r3, [r5, #0xa4]
0007ba86  adds    r3, #1
0007ba88  str.w   r3, [r5, #0xa4]
0007ba8c  lsl.w   r3, r3, r8
0007ba90  adds    r3, r3, r5
0007ba92  str     r2, [r3, #4]
0007ba94  ldr.w   r3, [r5, #0xa4]
0007ba98  adds    r3, #1
0007ba9a  str.w   r6, [r5, r3, lsl #3]
0007ba9e  b       #0x7ba3e
0007baa0  ldr     r1, [pc, #0x5c]
0007baa2  add     r1, pc ; -> 0x00075665  tl_delete_proj_and_die
0007baa4  lsls    r3, r2, #3
0007baa6  adds    r3, r3, r5
0007baa8  movs    r0, #0
0007baaa  str     r1, [r3, #4]
0007baac  ldr.w   r3, [r5, #0xa4]
0007bab0  adds    r3, #1
0007bab2  str.w   r0, [r5, r3, lsl #3]
0007bab6  b       #0x7ba3e
0007bab8  ldr     r0, [r4, #8]
0007baba  bl      #0x55a60 ; -> stop_a8
0007babe  mov     r0, r4
0007bac0  movs    r6, #5
0007bac2  str     r6, [r4, #0x1c]
0007bac4  bl      #0x57be4 ; -> ochar_sound
0007bac8  mov     r0, r4
0007baca  movs    r3, #4
0007bacc  str     r6, [r4, #0x40]
0007bace  str     r3, [r4, #0x54]
0007bad0  bl      #0x554c0 ; -> find_ani2_part_a14
0007bad4  movs    r3, #3
0007bad6  str     r3, [r4, #0x1c]
0007bad8  ldr.w   r3, [r5, #0xa4]
0007badc  movw    r2, #0x4e9
0007bae0  adds    r3, #1
0007bae2  str.w   r2, [r5, r3, lsl #3]
0007bae6  ldr.w   r3, [r5, #0xa4]
0007baea  adds    r2, r3, #1
0007baec  ldr     r3, [pc, #0x14]
0007baee  str.w   r2, [r5, #0xa4]
0007baf2  add     r3, pc ; -> 0x000f37cc  t_mframew
0007baf4  ldr     r1, [r3]
0007baf6  b       #0x7baa4
0007baf8  add     r2, sp, #0x304
