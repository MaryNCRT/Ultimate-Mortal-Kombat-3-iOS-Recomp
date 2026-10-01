========================================================================
c_fast_orb  0x0006dcb4  276 bytes   mkdrone.c
========================================================================

0006dcb4  push    {r4, r5, r7, lr}
0006dcb6  add     r7, sp, #8
0006dcb8  ldr.w   r3, [r0, #0xa4]
0006dcbc  mov     r5, r0
0006dcbe  ldr.w   r4, [r0, #0x108]
0006dcc2  adds    r3, #1
0006dcc4  ldr.w   r3, [r0, r3, lsl #3]
0006dcc8  cbnz    r3, #0x6dcf4
0006dcca  ldr     r3, [pc, #0xc4]
0006dccc  mov     r0, r4
0006dcce  add     r3, pc ; -> 0x00171fe4  rpt_promoves
0006dcd0  str     r3, [r4, #0x1c]
0006dcd2  bl      #0x6c9c8 ; -> ask_mr_diff
0006dcd6  ldr     r0, [r4, #0x5c]
0006dcd8  cbnz    r0, #0x6dcfa
0006dcda  ldr.w   r3, [r5, #0xa4]
0006dcde  ldr     r2, [pc, #0xb4]
0006dce0  lsls    r3, r3, #3
0006dce2  adds    r3, r3, r5
0006dce4  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006dce6  str     r2, [r3, #4]
0006dce8  ldr.w   r3, [r5, #0xa4]
0006dcec  adds    r3, #1
0006dcee  str.w   r0, [r5, r3, lsl #3]
0006dcf2  b       #0x6dcf8
0006dcf4  mvn     r0, #2
0006dcf8  pop     {r4, r5, r7, pc}
0006dcfa  ldr     r3, [r4, #8]
0006dcfc  ldr     r3, [r3, #0x24]
0006dcfe  subs    r3, #4
0006dd00  cmp     r3, #0xe
0006dd02  bhi     #0x6dd18
0006dd04  tbb     [pc, r3]
0006dd08  lsrs    r5, r3, #0x20
0006dd0a  adds    r3, #8
0006dd0c  lsrs    r5, r5, #0x20
0006dd0e  adds    r0, #8
0006dd10  lsrs    r0, r1, #0x20
0006dd12  lsrs    r1, r4, #0x20
0006dd14  movs    r7, #0x24
0006dd16  lsrs    r2, r5, #0x20
0006dd18  mov     r0, r4
0006dd1a  bl      #0x2f3a0 ; -> get_x_dist
0006dd1e  ldr     r0, [r4, #0x28]
0006dd20  cmp     r0, #0xf0
0006dd22  ble     #0x6dd74
0006dd24  ldr.w   r2, [pc, #0x70]
0006dd28  add     r2, pc ; -> 0x0006a8f9  t_run_in_fk
0006dd2a  ldr.w   r3, [r5, #0xa4]
0006dd2e  movs    r0, #0
0006dd30  lsls    r3, r3, #3
0006dd32  adds    r3, r3, r5
0006dd34  str     r2, [r3, #4]
0006dd36  ldr.w   r3, [r5, #0xa4]
0006dd3a  adds    r3, #1
0006dd3c  str.w   r0, [r5, r3, lsl #3]
0006dd40  b       #0x6dcf8
0006dd42  ldr.w   r2, [pc, #0x58]
0006dd46  add     r2, pc ; -> 0x00067fe1  t_d_zap_now
0006dd48  b       #0x6dd2a
0006dd4a  ldr     r2, [pc, #0x54]
0006dd4c  add     r2, pc ; -> 0x00067f19  t_d_propell_attack_now
0006dd4e  b       #0x6dd2a
0006dd50  ldr     r2, [pc, #0x50]
0006dd52  add     r2, pc ; -> 0x0006a811  t_jade_anti_orb
0006dd54  b       #0x6dd2a
0006dd56  ldr     r2, [pc, #0x50]
0006dd58  add     r2, pc ; -> 0x00067f19  t_d_propell_attack_now
0006dd5a  b       #0x6dd2a
0006dd5c  ldr     r2, [pc, #0x4c]
0006dd5e  add     r2, pc ; -> 0x0006dc4d  t_scorp_anti_orb
0006dd60  b       #0x6dd2a
0006dd62  ldr     r2, [pc, #0x4c]
0006dd64  add     r2, pc ; -> 0x00067fe1  t_d_zap_now
0006dd66  b       #0x6dd2a
0006dd68  ldr     r2, [pc, #0x48]
0006dd6a  add     r2, pc ; -> 0x00067f19  t_d_propell_attack_now
0006dd6c  b       #0x6dd2a
0006dd6e  ldr     r2, [pc, #0x48]
0006dd70  add     r2, pc ; -> 0x00067f19  t_d_propell_attack_now
0006dd72  b       #0x6dd2a
0006dd74  cmp     r0, #0xaf
0006dd76  bgt     #0x6dd7e
0006dd78  ldr     r2, [pc, #0x40]
0006dd7a  add     r2, pc ; -> 0x0006a979  t_run_in_and_slam
0006dd7c  b       #0x6dd2a
0006dd7e  cmp     r0, #0xe0
0006dd80  ble     #0x6dd88
0006dd82  ldr     r2, [pc, #0x3c]
0006dd84  add     r2, pc ; -> 0x00068745  t_d_fflip_kick_jump
0006dd86  b       #0x6dd2a
0006dd88  ldr     r2, [pc, #0x38]
0006dd8a  add     r2, pc ; -> 0x0006f935  t_block_orb
0006dd8c  b       #0x6dd2a
0006dd8e  nop     
0006dd90  orrs    r2, r2
0006dd92  movs    r0, r2
0006dd94  b       #0x6d6d2
0006dd96  vtbx.8  d28, {d31, fpinst2, mvfr0, mvfr1}, d13
0006dd9a  vrshr.u64 d26, d7, #1
