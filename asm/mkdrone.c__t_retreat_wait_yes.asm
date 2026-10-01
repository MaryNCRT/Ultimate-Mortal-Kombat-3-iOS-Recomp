========================================================================
t_retreat_wait_yes  0x000726e8  320 bytes   mkdrone.c
========================================================================

000726e8  push    {r4, r5, r7, lr}
000726ea  add     r7, sp, #8
000726ec  ldr.w   r3, [r0, #0xa4]
000726f0  movw    r2, #0x60b
000726f4  mov     r4, r0
000726f6  adds    r3, #1
000726f8  ldr.w   r5, [r0, #0x108]
000726fc  ldr.w   r3, [r0, r3, lsl #3]
00072700  cmp     r3, r2
00072702  beq     #0x7275a
00072704  adds    r2, #2
00072706  cmp     r3, r2
00072708  beq     #0x72744
0007270a  cbnz    r3, #0x7273e
0007270c  mov     r0, r5
0007270e  bl      #0x55388 ; -> face_opponent
00072712  mov     r0, r5
00072714  bl      #0x724c4 ; -> d_walkb_setup
00072718  mov     r0, r5
0007271a  bl      #0x551f0 ; -> am_i_facing_him
0007271e  ldr     r0, [r5, #0x5c]
00072720  cmp     r0, #0
00072722  bne     #0x72790
00072724  ldr     r2, [pc, #0xec]
00072726  ldr.w   r3, [r4, #0xa4]
0007272a  add     r2, pc ; -> 0x00070675  t_d_turnaround
0007272c  lsls    r3, r3, #3
0007272e  adds    r3, r3, r4
00072730  str     r2, [r3, #4]
00072732  ldr.w   r3, [r4, #0xa4]
00072736  adds    r3, #1
00072738  str.w   r0, [r4, r3, lsl #3]
0007273c  b       #0x72742
0007273e  mvn     r0, #2
00072742  pop     {r4, r5, r7, pc}
00072744  mov     r0, r5
00072746  bl      #0x71328 ; -> d_either_edge_a5
0007274a  ldr     r3, [r5, #0x30]
0007274c  cmp     r3, #0x4f
0007274e  bgt     #0x727a6
00072750  ldr     r2, [pc, #0xc4]
00072752  ldr.w   r3, [r4, #0xa4]
00072756  add     r2, pc ; -> 0x00067e5d  t_d_cornered
00072758  b       #0x7277c
0007275a  mov     r0, r5
0007275c  bl      #0x5a680 ; -> next_anirate
00072760  ldr.w   r3, [r4, #0xa4]
00072764  movw    r2, #0x60d
00072768  adds    r3, #1
0007276a  str.w   r2, [r4, r3, lsl #3]
0007276e  ldr     r2, [pc, #0xac]
00072770  ldr.w   r3, [r4, #0xa4]
00072774  add     r2, pc ; -> 0x0006c40d  t_d_beware
00072776  adds    r3, #1
00072778  str.w   r3, [r4, #0xa4]
0007277c  lsls    r3, r3, #3
0007277e  adds    r3, r3, r4
00072780  movs    r0, #0
00072782  str     r2, [r3, #4]
00072784  ldr.w   r3, [r4, #0xa4]
00072788  adds    r3, #1
0007278a  str.w   r0, [r4, r3, lsl #3]
0007278e  b       #0x72742
00072790  ldr.w   r3, [r4, #0xa4]
00072794  movs    r0, #1
00072796  movw    r2, #0x60b
0007279a  adds    r3, #1
0007279c  str.w   r2, [r4, r3, lsl #3]
000727a0  str.w   r0, [r4, #0xfc]
000727a4  b       #0x72742
000727a6  ldr.w   r1, [r4, #0xf8]
000727aa  ldr     r2, [r5, #0x44]
000727ac  mov     r0, r5
000727ae  lsls    r3, r1, #2
000727b0  adds    r3, r3, r4
000727b2  str.w   r2, [r3, #0xa8]
000727b6  adds    r3, r1, #1
000727b8  str.w   r3, [r4, #0xf8]
000727bc  ldr     r3, [r5, #0x48]
000727be  blx     r3
000727c0  ldr.w   r3, [r4, #0xf8]
000727c4  subs    r3, #1
000727c6  str.w   r3, [r4, #0xf8]
000727ca  lsls    r3, r3, #2
000727cc  adds    r3, r3, r4
000727ce  ldr.w   r2, [r3, #0xa8]
000727d2  ldr     r3, [r5, #0x5c]
000727d4  str     r2, [r5, #0x44]
000727d6  cbnz    r3, #0x727f0
000727d8  subs    r0, r2, #1
000727da  str     r0, [r5, #0x44]
000727dc  cmp     r0, #0
000727de  bne     #0x72718
000727e0  ldr.w   r3, [r4, #0xa4]
000727e4  cmp     r3, #0
000727e6  ble     #0x7280a
000727e8  subs    r3, #1
000727ea  str.w   r3, [r4, #0xa4]
000727ee  b       #0x72742
000727f0  ldr.w   r3, [r4, #0xa4]
000727f4  cmp     r3, #0
000727f6  ble     #0x72802
000727f8  subs    r3, #1
000727fa  movs    r0, #0
000727fc  str.w   r3, [r4, #0xa4]
00072800  b       #0x72742
00072802  ldr     r2, [pc, #0x1c]
00072804  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00072806  ldr     r2, [r2]
00072808  b       #0x7277c
0007280a  ldr.w   r2, [pc, #0x18]
0007280e  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00072810  ldr     r2, [r2]
00072812  b       #0x7272c
00072814  svc     #0x47
