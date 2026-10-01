========================================================================
t_friendship_start_pause  0x000a71f0  184 bytes   mkfriend.c
========================================================================

000a71f0  push    {r4, r7, lr}
000a71f2  add     r7, sp, #4
000a71f4  ldr.w   r3, [r0, #0xa4]
000a71f8  mov     r4, r0
000a71fa  ldr.w   r2, [r0, #0x108]
000a71fe  adds    r3, #1
000a7200  ldr.w   r0, [r0, r3, lsl #3]
000a7204  cmp     r0, #0x64
000a7206  beq     #0xa725a
000a7208  ble     #0xa7214
000a720a  cmp     r0, #0x67
000a720c  beq     #0xa7268
000a720e  mvn     r0, #2
000a7212  pop     {r4, r7, pc}
000a7214  cbz     r0, #0xa7228
000a7216  cmp     r0, #0x63
000a7218  bne     #0xa720e
000a721a  movs    r2, #0x64
000a721c  movs    r0, #0x30
000a721e  str.w   r2, [r4, r3, lsl #3]
000a7222  str.w   r0, [r4, #0xfc]
000a7226  b       #0xa7212
000a7228  movs    r3, #4
000a722a  str     r3, [r2, #0x20]
000a722c  ldr.w   r3, [r4, #0xa4]
000a7230  movs    r2, #0x63
000a7232  adds    r3, #1
000a7234  str.w   r2, [r4, r3, lsl #3]
000a7238  ldr.w   r3, [r4, #0xa4]
000a723c  adds    r2, r3, #1
000a723e  ldr     r3, [pc, #0x60]
000a7240  str.w   r2, [r4, #0xa4]
000a7244  add     r3, pc ; -> 0x000f3194  t_init_death_blow
000a7246  ldr     r1, [r3]
000a7248  lsls    r3, r2, #3
000a724a  adds    r3, r3, r4
000a724c  str     r1, [r3, #4]
000a724e  ldr.w   r3, [r4, #0xa4]
000a7252  adds    r3, #1
000a7254  str.w   r0, [r4, r3, lsl #3]
000a7258  b       #0xa7212
000a725a  movs    r2, #0x67
000a725c  movs    r0, #1
000a725e  str.w   r2, [r4, r3, lsl #3]
000a7262  str.w   r0, [r4, #0xfc]
000a7266  b       #0xa7212
000a7268  mov     r0, r2
000a726a  movs    r3, #0x42
000a726c  str     r3, [r2, #0x28]
000a726e  bl      #0x57ad0 ; -> send_code_a3
000a7272  ldr.w   r3, [r4, #0xa4]
000a7276  cmp     r3, #0
000a7278  ble     #0xa7284
000a727a  subs    r3, #1
000a727c  movs    r0, #0
000a727e  str.w   r3, [r4, #0xa4]
000a7282  b       #0xa7212
000a7284  ldr.w   r2, [pc, #0x1c]
000a7288  lsls    r3, r3, #3
000a728a  adds    r3, r3, r4
000a728c  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000a728e  movs    r0, #0
000a7290  ldr     r2, [r2]
000a7292  str     r2, [r3, #4]
000a7294  ldr.w   r3, [r4, #0xa4]
000a7298  adds    r3, #1
000a729a  str.w   r0, [r4, r3, lsl #3]
000a729e  b       #0xa7212
000a72a0  ite     mi
000a72a2  movs    r4, r0
000a72a4  stmpl   r4!, {r3, r4, r5, r6}
000a72a6  movs    r4, r0
