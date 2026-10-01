========================================================================
t_boss_counter_angle  0x000ab778  124 bytes   mkboss.c
========================================================================

000ab778  push    {r4, r5, r6, r7, lr}
000ab77a  add     r7, sp, #0xc
000ab77c  ldr.w   r3, [r0, #0xa4]
000ab780  mov     r4, r0
000ab782  ldr.w   r5, [r0, #0x108]
000ab786  adds    r3, #1
000ab788  ldr.w   r6, [r0, r3, lsl #3]
000ab78c  cbnz    r6, #0xab7b4
000ab78e  mov     r0, r5
000ab790  bl      #0x70940 ; -> is_towards_me
000ab794  ldr     r3, [r5, #0x5c]
000ab796  cbnz    r3, #0xab7ba
000ab798  ldr     r2, [pc, #0x48]
000ab79a  add     r2, pc ; -> 0x000a86fd  t_boss_wait_land
000ab79c  ldr.w   r3, [r4, #0xa4]
000ab7a0  mov     r0, r6
000ab7a2  lsls    r3, r3, #3
000ab7a4  adds    r3, r3, r4
000ab7a6  str     r2, [r3, #4]
000ab7a8  ldr.w   r3, [r4, #0xa4]
000ab7ac  adds    r3, #1
000ab7ae  str.w   r6, [r4, r3, lsl #3]
000ab7b2  b       #0xab7b8
000ab7b4  mvn     r0, #2
000ab7b8  pop     {r4, r5, r6, r7, pc}
000ab7ba  mov     r0, r5
000ab7bc  bl      #0xab6e8 ; -> motaro_easy_randper
000ab7c0  ldr     r3, [r5, #0x5c]
000ab7c2  cbnz    r3, #0xab7ca
000ab7c4  ldr     r2, [pc, #0x20]
000ab7c6  add     r2, pc ; -> 0x000a86fd  t_boss_wait_land
000ab7c8  b       #0xab79c
000ab7ca  mov     r0, r5
000ab7cc  bl      #0x2f3a0 ; -> get_x_dist
000ab7d0  ldr     r0, [r5, #0x28]
000ab7d2  cmp     r0, #0x80
000ab7d4  ble     #0xab7dc
000ab7d6  ldr     r2, [pc, #0x14]
000ab7d8  add     r2, pc ; -> 0x000a86fd  t_boss_wait_land
000ab7da  b       #0xab79c
000ab7dc  ldr     r2, [pc, #0x10]
000ab7de  add     r2, pc ; -> 0x000aa051  t_motaro_punch
000ab7e0  b       #0xab79c
000ab7e2  nop     
000ab7e4  ldm     r7!, {r0, r1, r2, r3, r4, r6}
000ab7e6  vcvt.u32.f32 d28, d19, #1
