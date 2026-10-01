========================================================================
t_decoy_zap_wait  0x0006b1f8  208 bytes   mkdrone.c
========================================================================

0006b1f8  push    {lr}
0006b1fa  ldr.w   r1, [r0, #0xa4]
0006b1fe  movw    lr, #0x117d
0006b202  ldr.w   ip, [r0, #0x108]
0006b206  adds    r3, r1, #1
0006b208  ldr.w   r2, [r0, r3, lsl #3]
0006b20c  cmp     r2, lr
0006b20e  beq     #0x6b26a
0006b210  movw    r3, #0x1182
0006b214  cmp     r2, r3
0006b216  beq     #0x6b2aa
0006b218  cbz     r2, #0x6b220
0006b21a  mvn     r0, #2
0006b21e  pop     {pc}
0006b220  ldr.w   r3, [ip, #8]
0006b224  ldr     r1, [pc, #0x8c]
0006b226  ldr     r3, [r3, #0x24]
0006b228  add     r1, pc ; -> 0x00171cd0  ochar_zaps
0006b22a  ldr.w   r3, [r1, r3, lsl #2]
0006b22e  cmp     r3, #0
0006b230  str.w   r3, [ip, #0x1c]
0006b234  blt     #0x6b26a
0006b236  ldr.w   r3, [r0, #0xa4]
0006b23a  adds    r3, #1
0006b23c  str.w   lr, [r0, r3, lsl #3]
0006b240  ldr.w   r3, [r0, #0xa4]
0006b244  adds    r1, r3, #1
0006b246  ldr.w   r3, [pc, #0x70]
0006b24a  str.w   r1, [r0, #0xa4]
0006b24e  add     r3, pc ; -> 0x000f314c  t_do_zap
0006b250  ldr.w   ip, [r3]
0006b254  lsls    r3, r1, #3
0006b256  adds    r3, r3, r0
0006b258  str.w   ip, [r3, #4]
0006b25c  ldr.w   r3, [r0, #0xa4]
0006b260  adds    r3, #1
0006b262  str.w   r2, [r0, r3, lsl #3]
0006b266  mov     r0, r2
0006b268  b       #0x6b21e
0006b26a  ldr     r3, [pc, #0x50]
0006b26c  movw    r2, #0x1182
0006b270  add     r3, pc ; -> 0x0006fe1d  q_is_decoy_alive
0006b272  str.w   r3, [ip, #0x48]
0006b276  movs    r3, #0x80
0006b278  str.w   r3, [ip, #0x44]
0006b27c  ldr.w   r3, [r0, #0xa4]
0006b280  adds    r3, #1
0006b282  str.w   r2, [r0, r3, lsl #3]
0006b286  ldr.w   r3, [r0, #0xa4]
0006b28a  ldr     r2, [pc, #0x34]
0006b28c  adds    r3, #1
0006b28e  add     r2, pc ; -> 0x00071ee5  t_stance_wait_no
0006b290  str.w   r3, [r0, #0xa4]
0006b294  lsls    r3, r3, #3
0006b296  adds    r3, r3, r0
0006b298  str     r2, [r3, #4]
0006b29a  ldr.w   r3, [r0, #0xa4]
0006b29e  movs    r2, #0
0006b2a0  adds    r3, #1
0006b2a2  str.w   r2, [r0, r3, lsl #3]
0006b2a6  mov     r0, r2
0006b2a8  b       #0x6b21e
0006b2aa  ldr     r2, [pc, #0x18]
0006b2ac  lsls    r3, r1, #3
0006b2ae  add     r2, pc ; -> 0x000722c9  t_run_in_close_now
0006b2b0  b       #0x6b296
0006b2b2  nop     
0006b2b4  ldr     r4, [r4, #0x28]
0006b2b6  movs    r0, r2
0006b2b8  ldrb    r2, [r7, #0x1b]
0006b2ba  movs    r0, r1
0006b2bc  ldr     r3, [pc, #0x2a4]
0006b2be  movs    r0, r0
0006b2c0  ldr     r3, [r2, #0x44]
0006b2c2  movs    r0, r0
0006b2c4  strb    r7, [r2]
0006b2c6  movs    r0, r0
