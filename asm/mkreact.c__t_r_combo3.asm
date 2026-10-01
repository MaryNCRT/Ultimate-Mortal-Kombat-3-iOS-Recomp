========================================================================
t_r_combo3  0x00046848  252 bytes   mkreact.c
========================================================================

00046848  push    {r4, r5, r6, r7, lr}
0004684a  add     r7, sp, #0xc
0004684c  str     r8, [sp, #-0x4]!
00046850  ldr.w   r2, [r0, #0xa4]
00046854  movw    r8, #0xcb8
00046858  mov     r5, r0
0004685a  adds    r3, r2, #1
0004685c  ldr.w   r4, [r0, #0x108]
00046860  ldr.w   r6, [r0, r3, lsl #3]
00046864  cmp     r6, r8
00046866  beq     #0x468d2
00046868  movw    r3, #0xcca
0004686c  cmp     r6, r3
0004686e  beq     #0x468ba
00046870  cbz     r6, #0x4687c
00046872  mvn     r0, #2
00046876  ldr     r8, [sp], #4
0004687a  pop     {r4, r5, r6, r7, pc}
0004687c  mov     r0, r4
0004687e  bl      #0x424e0 ; -> combo_setup
00046882  ldr     r3, [pc, #0xb0]
00046884  str     r6, [r4, #0x38]
00046886  ldr     r2, [pc, #0xb0]
00046888  add     r3, pc ; -> 0x0004289d  t_combo_airborn_hit
0004688a  str     r3, [r4, #0x30]
0004688c  movs    r3, #9
0004688e  str     r3, [r4, #0x34]
00046890  ldr.w   r3, [r5, #0xa4]
00046894  add     r2, pc ; -> 0x00044b85  t_reaction_start
00046896  mov     r0, r6
00046898  adds    r3, #1
0004689a  str.w   r8, [r5, r3, lsl #3]
0004689e  ldr.w   r3, [r5, #0xa4]
000468a2  adds    r3, #1
000468a4  str.w   r3, [r5, #0xa4]
000468a8  lsls    r3, r3, #3
000468aa  adds    r3, r3, r5
000468ac  str     r2, [r3, #4]
000468ae  ldr.w   r3, [r5, #0xa4]
000468b2  adds    r3, #1
000468b4  str.w   r6, [r5, r3, lsl #3]
000468b8  b       #0x46876
000468ba  ldr     r1, [pc, #0x80]
000468bc  add     r1, pc ; -> 0x00042519  t_land_on_my_back
000468be  lsls    r3, r2, #3
000468c0  adds    r3, r3, r5
000468c2  movs    r0, #0
000468c4  str     r1, [r3, #4]
000468c6  ldr.w   r3, [r5, #0xa4]
000468ca  adds    r3, #1
000468cc  str.w   r0, [r5, r3, lsl #3]
000468d0  b       #0x46876
000468d2  mov     r0, r4
000468d4  bl      #0x54f20 ; -> set_no_block
000468d8  movs    r1, #0xa
000468da  mov     r0, r4
000468dc  bl      #0x57dbc ; -> rsnd_func
000468e0  mov     r0, r4
000468e2  bl      #0x54f40 ; -> set_half_damage
000468e6  mov     r0, r4
000468e8  movs    r3, #4
000468ea  str     r3, [r4, #0x1c]
000468ec  bl      #0x5877c ; -> create_blood_proc
000468f0  mov     r0, r4
000468f2  movs    r3, #0xe
000468f4  str     r3, [r4, #0x1c]
000468f6  bl      #0x58d70 ; -> create_fx
000468fa  mov.w   r3, #0x20000
000468fe  str     r3, [r4, #0x1c]
00046900  sub.w   r3, r3, #0xa0000
00046904  str     r3, [r4, #0x20]
00046906  add.w   r3, r3, #0x88000
0004690a  str     r3, [r4, #0x24]
0004690c  movs    r3, #5
0004690e  str     r3, [r4, #0x28]
00046910  adds    r3, #0x19
00046912  str     r3, [r4, #0x40]
00046914  ldr.w   r3, [r5, #0xa4]
00046918  movw    r2, #0xcca
0004691c  adds    r3, #1
0004691e  str.w   r2, [r5, r3, lsl #3]
00046922  ldr.w   r3, [r5, #0xa4]
00046926  adds    r2, r3, #1
00046928  ldr     r3, [pc, #0x14]
0004692a  str.w   r2, [r5, #0xa4]
0004692e  add     r3, pc ; -> 0x000f3720  t_flight
00046930  ldr     r1, [r3]
00046932  b       #0x468be
00046934  stm     r0!, {r0, r4}
