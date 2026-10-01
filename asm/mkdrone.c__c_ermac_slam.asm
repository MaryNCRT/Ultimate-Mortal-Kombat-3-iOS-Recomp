========================================================================
c_ermac_slam  0x0006ddc8  128 bytes   mkdrone.c
========================================================================

0006ddc8  push    {r4, r5, r6, r7, lr}
0006ddca  add     r7, sp, #0xc
0006ddcc  ldr.w   r3, [r0, #0xa4]
0006ddd0  mov     r4, r0
0006ddd2  ldr.w   r5, [r0, #0x108]
0006ddd6  adds    r3, #1
0006ddd8  ldr.w   r6, [r0, r3, lsl #3]
0006dddc  cbnz    r6, #0x6de0a
0006ddde  ldr     r3, [pc, #0x54]
0006dde0  mov     r0, r5
0006dde2  add     r3, pc ; -> 0x00171fe4  rpt_promoves
0006dde4  str     r3, [r5, #0x1c]
0006dde6  bl      #0x6c9c8 ; -> ask_mr_diff
0006ddea  ldr     r3, [r5, #0x5c]
0006ddec  cbnz    r3, #0x6de10
0006ddee  ldr     r2, [pc, #0x48]
0006ddf0  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006ddf2  ldr.w   r3, [r4, #0xa4]
0006ddf6  mov     r0, r6
0006ddf8  lsls    r3, r3, #3
0006ddfa  adds    r3, r3, r4
0006ddfc  str     r2, [r3, #4]
0006ddfe  ldr.w   r3, [r4, #0xa4]
0006de02  adds    r3, #1
0006de04  str.w   r6, [r4, r3, lsl #3]
0006de08  b       #0x6de0e
0006de0a  mvn     r0, #2
0006de0e  pop     {r4, r5, r6, r7, pc}
0006de10  mov     r0, r5
0006de12  bl      #0x2f3a0 ; -> get_x_dist
0006de16  ldr     r0, [r5, #0x28]
0006de18  cmp     r0, #0x6f
0006de1a  bgt     #0x6de22
0006de1c  ldr     r2, [pc, #0x1c]
0006de1e  add     r2, pc ; -> 0x00067895  t_run_in_close
0006de20  b       #0x6ddf2
0006de22  cmp     r0, #0xf0
0006de24  ble     #0x6de2c
0006de26  ldr     r2, [pc, #0x18]
0006de28  add     r2, pc ; -> 0x00067fe1  t_d_zap_now
0006de2a  b       #0x6ddf2
0006de2c  ldr     r2, [pc, #0x14]
0006de2e  add     r2, pc ; -> 0x0006fa21  t_d_block
0006de30  b       #0x6ddf2
0006de32  nop     
0006de34  rors    r6, r7
0006de36  movs    r0, r2
0006de38  b       #0x6e55e
