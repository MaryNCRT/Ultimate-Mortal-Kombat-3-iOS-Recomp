========================================================================
t_standard_zap_counter  0x0006de68  364 bytes   mkdrone.c
========================================================================

0006de68  push    {r4, r5, r7, lr}
0006de6a  add     r7, sp, #8
0006de6c  mov     r4, r0
0006de6e  ldr.w   r5, [r0, #0x108]
0006de72  ldr.w   r0, [r0, #0xa4]
0006de76  movw    r2, #0xe89
0006de7a  adds    r1, r0, #1
0006de7c  ldr.w   r3, [r4, r1, lsl #3]
0006de80  cmp     r3, r2
0006de82  beq     #0x6dec8
0006de84  adds    r2, #1
0006de86  cmp     r3, r2
0006de88  beq     #0x6deb0
0006de8a  cbz     r3, #0x6de92
0006de8c  mvn     r0, #2
0006de90  pop     {r4, r5, r7, pc}
0006de92  ldr     r3, [r5, #8]
0006de94  ldr     r3, [r3, #0x24]
0006de96  subs    r3, #3
0006de98  cmp     r3, #0xe
0006de9a  bhi     #0x6dee2
0006de9c  tbb     [pc, r3]
0006dea0  movs    r1, #0x2d
0006dea2  movs    r1, #0x21
0006dea4  eors    r0, r1
0006dea6  movs    r1, #0x21
0006dea8  movs    r1, #0x44
0006deaa  adds    r5, #0x31
0006deac  subs    r1, #0x21
0006deae  movs    r1, #0x3c
0006deb0  ldr     r2, [pc, #0xe4]
0006deb2  add     r2, pc ; -> 0x00070309  t_duck_under_proj
0006deb4  lsls    r3, r0, #3
0006deb6  adds    r3, r3, r4
0006deb8  movs    r0, #0
0006deba  str     r2, [r3, #4]
0006debc  ldr.w   r3, [r4, #0xa4]
0006dec0  adds    r3, #1
0006dec2  str.w   r0, [r4, r3, lsl #3]
0006dec6  b       #0x6de90
0006dec8  movw    r3, #0xe8a
0006decc  str.w   r3, [r4, r1, lsl #3]
0006ded0  ldr.w   r3, [r4, #0xa4]
0006ded4  ldr     r2, [pc, #0xc4]
0006ded6  adds    r3, #1
0006ded8  add     r2, pc ; -> 0x0006db75  t_nr_jump_over_proj
0006deda  str.w   r3, [r4, #0xa4]
0006dede  lsls    r3, r3, #3
0006dee0  b       #0x6deb6
0006dee2  ldr     r3, [r5]
0006dee4  ldr     r3, [r3, #4]
0006dee6  ldr     r3, [r3, #0x24]
0006dee8  cmp     r3, #8
0006deea  str     r3, [r5, #0x1c]
0006deec  bne     #0x6df38
0006deee  ldr.w   r3, [r4, #0xa4]
0006def2  ldr     r2, [pc, #0xac]
0006def4  lsls    r3, r3, #3
0006def6  add     r2, pc ; -> 0x00068ccd  t_d_block_projectile
0006def8  b       #0x6deb6
0006defa  ldr     r2, [pc, #0xa8]
0006defc  lsls    r3, r0, #3
0006defe  add     r2, pc ; -> 0x0006a695  t_indian_reflect
0006df00  b       #0x6deb6
0006df02  ldr     r2, [pc, #0xa4]
0006df04  lsls    r3, r0, #3
0006df06  add     r2, pc ; -> 0x0006a659  t_lk_zap_low
0006df08  b       #0x6deb6
0006df0a  ldr     r2, [pc, #0xa0]
0006df0c  lsls    r3, r0, #3
0006df0e  add     r2, pc ; -> 0x00067f19  t_d_propell_attack_now
0006df10  b       #0x6deb6
0006df12  ldr     r2, [pc, #0x9c]
0006df14  add     r2, pc ; -> 0x0006a845  t_jade_anti_zap
0006df16  b       #0x6deb4
0006df18  ldr     r2, [pc, #0x98]
0006df1a  lsls    r3, r0, #3
0006df1c  add     r2, pc ; -> 0x00067f19  t_d_propell_attack_now
0006df1e  b       #0x6deb6
0006df20  ldr     r2, [pc, #0x94]
0006df22  lsls    r3, r0, #3
0006df24  add     r2, pc ; -> 0x0006a795  t_cyrax_counter_zap
0006df26  b       #0x6deb6
0006df28  ldr     r2, [pc, #0x90]
0006df2a  lsls    r3, r0, #3
0006df2c  add     r2, pc ; -> 0x00067f19  t_d_propell_attack_now
0006df2e  b       #0x6deb6
0006df30  ldr     r2, [pc, #0x8c]
0006df32  lsls    r3, r0, #3
0006df34  add     r2, pc ; -> 0x00067f19  t_d_propell_attack_now
0006df36  b       #0x6deb6
0006df38  mov     r0, r5
0006df3a  bl      #0x2f3a0 ; -> get_x_dist
0006df3e  ldr     r0, [r5, #0x28]
0006df40  cmp     r0, #0x9f
0006df42  bgt     #0x6df50
0006df44  ldr.w   r3, [r4, #0xa4]
0006df48  ldr     r2, [pc, #0x78]
0006df4a  lsls    r3, r3, #3
0006df4c  add     r2, pc ; -> 0x00070309  t_duck_under_proj
0006df4e  b       #0x6deb6
0006df50  cmp     r0, #0xf0
0006df52  ble     #0x6df62
0006df54  ldr.w   r3, [r4, #0xa4]
0006df58  ldr.w   r2, [pc, #0x6c]
0006df5c  lsls    r3, r3, #3
0006df5e  add     r2, pc ; -> 0x0006a551  t_run_then_flipk
0006df60  b       #0x6deb6
0006df62  cmp     r0, #0xd0
0006df64  ble     #0x6df74
0006df66  ldr.w   r3, [r4, #0xa4]
0006df6a  ldr.w   r2, [pc, #0x60]
0006df6e  lsls    r3, r3, #3
0006df70  add     r2, pc ; -> 0x0006a5d5  t_run_then_duck_under
0006df72  b       #0x6deb6
0006df74  ldr.w   r3, [r4, #0xa4]
0006df78  movw    r2, #0xe89
0006df7c  adds    r3, #1
0006df7e  str.w   r2, [r4, r3, lsl #3]
0006df82  ldr.w   r3, [r4, #0xa4]
0006df86  ldr.w   r2, [pc, #0x48]
0006df8a  adds    r3, #1
0006df8c  add     r2, pc ; -> 0x00068c45  t_nr_sweep_if_u_can
0006df8e  str.w   r3, [r4, #0xa4]
0006df92  lsls    r3, r3, #3
0006df94  b       #0x6deb6
0006df96  nop     
0006df98  movs    r4, #0x53
0006df9a  movs    r0, r0
0006df9c  ldc2    p15, c15, [sb], {0xff}
0006dfa0  add     r5, sp, #0x34c
0006dfa2  vqshl.u64 d28, d3, #0x3f
