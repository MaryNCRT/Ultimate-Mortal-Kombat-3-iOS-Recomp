========================================================================
c_lia_zap  0x00070fd8  356 bytes   mkdrone.c
========================================================================

00070fd8  push    {r4, r5, r6, r7, lr}
00070fda  add     r7, sp, #0xc
00070fdc  ldr.w   r2, [r0, #0xa4]
00070fe0  movw    r1, #0xdf3
00070fe4  mov     r4, r0
00070fe6  adds    r3, r2, #1
00070fe8  ldr.w   r5, [r0, #0x108]
00070fec  ldr.w   r6, [r0, r3, lsl #3]
00070ff0  cmp     r6, r1
00070ff2  beq     #0x71088
00070ff4  ble     #0x7100a
00070ff6  movw    r3, #0xdf6
00070ffa  cmp     r6, r3
00070ffc  beq     #0x710be
00070ffe  adds    r3, #6
00071000  cmp     r6, r3
00071002  beq     #0x71070
00071004  mvn     r0, #2
00071008  pop     {r4, r5, r6, r7, pc}
0007100a  cbnz    r6, #0x71038
0007100c  mov     r0, r5
0007100e  bl      #0x2f3a0 ; -> get_x_dist
00071012  ldr     r3, [r5, #0x28]
00071014  cmp     r3, #0xbf
00071016  ble     #0x710c8
00071018  cmp     r3, #0xf0
0007101a  ble     #0x710ec
0007101c  ldr     r2, [pc, #0xfc]
0007101e  add     r2, pc ; -> 0x00068745  t_d_fflip_kick_jump
00071020  ldr.w   r3, [r4, #0xa4]
00071024  lsls    r3, r3, #3
00071026  adds    r3, r3, r4
00071028  mov     r0, r6
0007102a  str     r2, [r3, #4]
0007102c  ldr.w   r3, [r4, #0xa4]
00071030  adds    r3, #1
00071032  str.w   r6, [r4, r3, lsl #3]
00071036  b       #0x71008
00071038  movw    r3, #0xdf1
0007103c  cmp     r6, r3
0007103e  bne     #0x71004
00071040  movs    r0, #0
00071042  str     r0, [r5, #0x48]
00071044  ldr.w   r3, [r4, #0xa4]
00071048  adds    r3, #1
0007104a  str.w   r1, [r4, r3, lsl #3]
0007104e  ldr.w   r3, [r4, #0xa4]
00071052  adds    r2, r3, #1
00071054  ldr     r3, [pc, #0xc8]
00071056  str.w   r2, [r4, #0xa4]
0007105a  add     r3, pc ; -> 0x000f3854  t_do_jump_up
0007105c  ldr     r1, [r3]
0007105e  lsls    r3, r2, #3
00071060  adds    r3, r3, r4
00071062  str     r1, [r3, #4]
00071064  ldr.w   r3, [r4, #0xa4]
00071068  adds    r3, #1
0007106a  str.w   r0, [r4, r3, lsl #3]
0007106e  b       #0x71008
00071070  ldr     r1, [pc, #0xb0]
00071072  add     r1, pc ; -> 0x000676a1  t_d_uppercut
00071074  lsls    r3, r2, #3
00071076  adds    r3, r3, r4
00071078  movs    r0, #0
0007107a  str     r1, [r3, #4]
0007107c  ldr.w   r3, [r4, #0xa4]
00071080  adds    r3, #1
00071082  str.w   r0, [r4, r3, lsl #3]
00071086  b       #0x71008
00071088  movs    r3, #0x40
0007108a  str     r3, [r5, #0x44]
0007108c  str     r3, [r5, #0x48]
0007108e  ldr.w   r3, [r0, #0xa4]
00071092  movw    r2, #0xdf6
00071096  adds    r3, #1
00071098  str.w   r2, [r0, r3, lsl #3]
0007109c  ldr.w   r3, [r0, #0xa4]
000710a0  ldr     r2, [pc, #0x84]
000710a2  adds    r3, #1
000710a4  str.w   r3, [r0, #0xa4]
000710a8  lsls    r3, r3, #3
000710aa  adds    r3, r3, r0
000710ac  add     r2, pc ; -> 0x0006fcf5  t_d_run_a11
000710ae  str     r2, [r3, #4]
000710b0  ldr.w   r3, [r0, #0xa4]
000710b4  movs    r0, #0
000710b6  adds    r3, #1
000710b8  str.w   r0, [r4, r3, lsl #3]
000710bc  b       #0x71008
000710be  ldr.w   r3, [pc, #0x6c]
000710c2  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000710c4  ldr     r1, [r3]
000710c6  b       #0x71074
000710c8  movs    r3, #0x40
000710ca  str     r3, [r5, #0x44]
000710cc  str     r3, [r5, #0x48]
000710ce  ldr.w   r3, [r4, #0xa4]
000710d2  movw    r2, #0xdfc
000710d6  adds    r3, #1
000710d8  str.w   r2, [r4, r3, lsl #3]
000710dc  ldr     r2, [pc, #0x50]
000710de  ldr.w   r3, [r4, #0xa4]
000710e2  add     r2, pc ; -> 0x0006fcf5  t_d_run_a11
000710e4  adds    r3, #1
000710e6  str.w   r3, [r4, #0xa4]
000710ea  b       #0x71024
000710ec  mov     r0, r5
000710ee  bl      #0x70f58 ; -> q_am_i_cornered
000710f2  ldr     r0, [r5, #0x5c]
000710f4  cbnz    r0, #0x710fe
000710f6  ldr.w   r2, [pc, #0x3c]
000710fa  add     r2, pc ; -> 0x000680fd  t_d_bflip_jump
000710fc  b       #0x71020
000710fe  ldr.w   r3, [r4, #0xa4]
00071102  movw    r2, #0xdf1
00071106  adds    r3, #1
00071108  str.w   r2, [r4, r3, lsl #3]
0007110c  ldr     r2, [pc, #0x28]
0007110e  ldr.w   r3, [r4, #0xa4]
00071112  add     r2, pc ; -> 0x0006847d  t_stw_proj_proc
00071114  adds    r3, #1
00071116  str.w   r3, [r4, #0xa4]
0007111a  b       #0x71024
0007111c  strb    r3, [r4, #0x1c]
0007111e  vqshl.u64 q9, q11, #0x3f
00071122  movs    r0, r1
00071124  str     r3, [r5, #0x60]
00071126  vdup.8  q15, d5[7]
