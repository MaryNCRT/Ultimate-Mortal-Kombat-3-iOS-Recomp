========================================================================
t_r_kano_swipe  0x000479ec  236 bytes   mkreact.c
========================================================================

000479ec  push    {r4, r5, r6, r7, lr}
000479ee  add     r7, sp, #0xc
000479f0  str     r8, [sp, #-0x4]!
000479f4  ldr.w   r3, [r0, #0xa4]
000479f8  mov     r4, r0
000479fa  ldr.w   r5, [r0, #0x108]
000479fe  adds    r3, #1
00047a00  ldr.w   r6, [r0, r3, lsl #3]
00047a04  cmp.w   r6, #0xf50
00047a08  beq     #0x47a9e
00047a0a  movw    r3, #0xf56
00047a0e  cmp     r6, r3
00047a10  beq     #0x47a7c
00047a12  cbz     r6, #0x47a1e
00047a14  mvn     r0, #2
00047a18  ldr     r8, [sp], #4
00047a1c  pop     {r4, r5, r6, r7, pc}
00047a1e  mov     r0, r5
00047a20  movs    r3, #2
00047a22  str     r3, [r5, #0x1c]
00047a24  bl      #0x580a4 ; -> group_sound
00047a28  mov     r0, r5
00047a2a  movs    r1, #0xf
00047a2c  bl      #0x57dd0 ; -> tsound_func
00047a30  mov     r0, r5
00047a32  mov.w   r8, #1
00047a36  str.w   r8, [r5, #0x1c]
00047a3a  bl      #0x5877c ; -> create_blood_proc
00047a3e  ldr     r3, [pc, #0x8c]
00047a40  str.w   r8, [r5, #0x34]
00047a44  str     r6, [r5, #0x38]
00047a46  add     r3, pc ; -> 0x0004176d  t_airborn_hit_no_sound
00047a48  str     r3, [r5, #0x30]
00047a4a  ldr.w   r3, [r4, #0xa4]
00047a4e  mov.w   r2, #0xf50
00047a52  mov     r0, r6
00047a54  add     r3, r8
00047a56  str.w   r2, [r4, r3, lsl #3]
00047a5a  ldr.w   r3, [r4, #0xa4]
00047a5e  ldr.w   r2, [pc, #0x70]
00047a62  add     r3, r8
00047a64  str.w   r3, [r4, #0xa4]
00047a68  lsls    r3, r3, #3
00047a6a  adds    r3, r3, r4
00047a6c  add     r2, pc ; -> 0x00044b85  t_reaction_start
00047a6e  str     r2, [r3, #4]
00047a70  ldr.w   r3, [r4, #0xa4]
00047a74  add     r3, r8
00047a76  str.w   r6, [r4, r3, lsl #3]
00047a7a  b       #0x47a18
00047a7c  mov.w   r3, #0x40000
00047a80  str     r3, [r5, #0x1c]
00047a82  ldr.w   r3, [r0, #0xa4]
00047a86  ldr     r2, [pc, #0x4c]
00047a88  lsls    r3, r3, #3
00047a8a  adds    r3, r3, r0
00047a8c  add     r2, pc ; -> 0x00043df5  t_stumble_back_vel
00047a8e  str     r2, [r3, #4]
00047a90  ldr.w   r3, [r0, #0xa4]
00047a94  movs    r0, #0
00047a96  adds    r3, #1
00047a98  str.w   r0, [r4, r3, lsl #3]
00047a9c  b       #0x47a18
00047a9e  mov     r0, r5
00047aa0  movs    r3, #0x20
00047aa2  str     r3, [r5, #0x40]
00047aa4  bl      #0x5a028 ; -> pose_a9_manual
00047aa8  mov     r0, r5
00047aaa  mov.w   r3, #0x60000
00047aae  str     r3, [r5, #0x1c]
00047ab0  bl      #0x55ab0 ; -> away_x_vel
00047ab4  ldr.w   r3, [r4, #0xa4]
00047ab8  movs    r0, #8
00047aba  movw    r2, #0xf56
00047abe  adds    r3, #1
00047ac0  str.w   r2, [r4, r3, lsl #3]
00047ac4  str.w   r0, [r4, #0xfc]
00047ac8  b       #0x47a18
00047aca  nop     
00047acc  ldr     r5, [sp, #0x8c]
00047ace  vsra.u32 d29, d5, #1
