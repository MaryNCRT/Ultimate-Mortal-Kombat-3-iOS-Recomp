========================================================================
c_robo_tele_sd  0x0006abe8  144 bytes   mkdrone.c
========================================================================

0006abe8  push    {lr}
0006abea  ldr.w   ip, [r0, #0xa4]
0006abee  movw    lr, #0x105e
0006abf2  add.w   r3, ip, #1
0006abf6  ldr.w   r1, [r0, r3, lsl #3]
0006abfa  cmp     r1, lr
0006abfc  beq     #0x6ac52
0006abfe  movw    r2, #0x105f
0006ac02  cmp     r1, r2
0006ac04  beq     #0x6ac34
0006ac06  cbz     r1, #0x6ac0e
0006ac08  mvn     r0, #2
0006ac0c  pop     {pc}
0006ac0e  str.w   lr, [r0, r3, lsl #3]
0006ac12  ldr.w   r3, [r0, #0xa4]
0006ac16  ldr     r2, [pc, #0x54]
0006ac18  adds    r3, #1
0006ac1a  str.w   r3, [r0, #0xa4]
0006ac1e  lsls    r3, r3, #3
0006ac20  adds    r3, r3, r0
0006ac22  add     r2, pc ; -> 0x0006ca09  t_nr_attack_sd
0006ac24  str     r2, [r3, #4]
0006ac26  ldr.w   r3, [r0, #0xa4]
0006ac2a  adds    r3, #1
0006ac2c  str.w   r1, [r0, r3, lsl #3]
0006ac30  mov     r0, r1
0006ac32  b       #0x6ac0c
0006ac34  ldr.w   r2, [pc, #0x38]
0006ac38  lsl.w   r3, ip, #3
0006ac3c  add     r2, pc ; -> 0x0006770d  t_d_hi_kick
0006ac3e  adds    r3, r3, r0
0006ac40  movs    r1, #0
0006ac42  str     r2, [r3, #4]
0006ac44  ldr.w   r3, [r0, #0xa4]
0006ac48  adds    r3, #1
0006ac4a  str.w   r1, [r0, r3, lsl #3]
0006ac4e  mov     r0, r1
0006ac50  b       #0x6ac0c
0006ac52  movw    r2, #0x105f
0006ac56  str.w   r2, [r0, r3, lsl #3]
0006ac5a  ldr.w   r3, [r0, #0xa4]
0006ac5e  ldr     r2, [pc, #0x14]
0006ac60  adds    r3, #1
0006ac62  add     r2, pc ; -> 0x00068c89  t_nr_uppercut_if_u_can
0006ac64  str.w   r3, [r0, #0xa4]
0006ac68  lsls    r3, r3, #3
0006ac6a  b       #0x6ac3e
0006ac6c  adds    r3, r4, #7
0006ac6e  movs    r0, r0
0006ac70  ldm     r2, {r0, r2, r3, r6, r7}
