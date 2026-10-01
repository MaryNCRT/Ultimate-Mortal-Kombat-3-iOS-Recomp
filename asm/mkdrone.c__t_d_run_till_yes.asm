========================================================================
t_d_run_till_yes  0x0006fbc0  308 bytes   mkdrone.c
========================================================================

0006fbc0  push    {r4, r5, r7, lr}
0006fbc2  add     r7, sp, #8
0006fbc4  ldr.w   r3, [r0, #0xa4]
0006fbc8  movw    r2, #0x4a5
0006fbcc  mov     r4, r0
0006fbce  adds    r3, #1
0006fbd0  ldr.w   r5, [r0, #0x108]
0006fbd4  ldr.w   r3, [r0, r3, lsl #3]
0006fbd8  cmp     r3, r2
0006fbda  beq     #0x6fc36
0006fbdc  ble     #0x6fbf2
0006fbde  movw    r2, #0x4a7
0006fbe2  cmp     r3, r2
0006fbe4  beq     #0x6fc6e
0006fbe6  adds    r2, #2
0006fbe8  cmp     r3, r2
0006fbea  beq     #0x6fc18
0006fbec  mvn     r0, #2
0006fbf0  pop     {r4, r5, r7, pc}
0006fbf2  cmp     r3, #0
0006fbf4  bne     #0x6fbec
0006fbf6  mov     r0, r5
0006fbf8  bl      #0x30fbc ; -> run_setup
0006fbfc  mov     r0, r5
0006fbfe  bl      #0x55388 ; -> face_opponent
0006fc02  ldr.w   r3, [r4, #0xa4]
0006fc06  movs    r0, #1
0006fc08  movw    r2, #0x4a5
0006fc0c  adds    r3, #1
0006fc0e  str.w   r2, [r4, r3, lsl #3]
0006fc12  str.w   r0, [r4, #0xfc]
0006fc16  b       #0x6fbf0
0006fc18  mov     r0, r5
0006fc1a  ldr     r3, [r5, #0x48]
0006fc1c  blx     r3
0006fc1e  ldr     r0, [r5, #0x5c]
0006fc20  cmp     r0, #0
0006fc22  beq     #0x6fca4
0006fc24  ldr.w   r3, [r4, #0xa4]
0006fc28  cmp     r3, #0
0006fc2a  ble     #0x6fcbe
0006fc2c  subs    r3, #1
0006fc2e  movs    r0, #0
0006fc30  str.w   r3, [r4, #0xa4]
0006fc34  b       #0x6fbf0
0006fc36  mov     r0, r5
0006fc38  bl      #0x30820 ; -> reduce_turbo_bar
0006fc3c  ldr.w   r3, [r4, #0xa4]
0006fc40  movw    r2, #0x4a7
0006fc44  movs    r0, #0
0006fc46  adds    r3, #1
0006fc48  str.w   r2, [r4, r3, lsl #3]
0006fc4c  ldr.w   r3, [r4, #0xa4]
0006fc50  adds    r2, r3, #1
0006fc52  ldr     r3, [pc, #0x90]
0006fc54  str.w   r2, [r4, #0xa4]
0006fc58  add     r3, pc ; -> 0x000f37a8  t_check_winner_status
0006fc5a  ldr     r1, [r3]
0006fc5c  lsls    r3, r2, #3
0006fc5e  adds    r3, r3, r4
0006fc60  str     r1, [r3, #4]
0006fc62  ldr.w   r3, [r4, #0xa4]
0006fc66  adds    r3, #1
0006fc68  str.w   r0, [r4, r3, lsl #3]
0006fc6c  b       #0x6fbf0
0006fc6e  mov     r0, r5
0006fc70  bl      #0x5a680 ; -> next_anirate
0006fc74  ldr.w   r3, [r4, #0xa4]
0006fc78  movw    r2, #0x4a9
0006fc7c  adds    r3, #1
0006fc7e  str.w   r2, [r4, r3, lsl #3]
0006fc82  ldr     r2, [pc, #0x64]
0006fc84  ldr.w   r3, [r4, #0xa4]
0006fc88  add     r2, pc ; -> 0x0006c40d  t_d_beware
0006fc8a  adds    r3, #1
0006fc8c  str.w   r3, [r4, #0xa4]
0006fc90  lsls    r3, r3, #3
0006fc92  adds    r3, r3, r4
0006fc94  movs    r0, #0
0006fc96  str     r2, [r3, #4]
0006fc98  ldr.w   r3, [r4, #0xa4]
0006fc9c  adds    r3, #1
0006fc9e  str.w   r0, [r4, r3, lsl #3]
0006fca2  b       #0x6fbf0
0006fca4  ldr     r3, [r5, #0x44]
0006fca6  subs    r3, #1
0006fca8  cmp     r3, #0
0006fcaa  str     r3, [r5, #0x44]
0006fcac  bgt     #0x6fc02
0006fcae  ldr.w   r3, [r4, #0xa4]
0006fcb2  cmp     r3, #0
0006fcb4  ble     #0x6fcc8
0006fcb6  subs    r3, #1
0006fcb8  str.w   r3, [r4, #0xa4]
0006fcbc  b       #0x6fbf0
0006fcbe  ldr.w   r2, [pc, #0x2c]
0006fcc2  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006fcc4  ldr     r2, [r2]
0006fcc6  b       #0x6fc90
0006fcc8  ldr.w   r2, [pc, #0x24]
0006fccc  lsls    r3, r3, #3
0006fcce  adds    r3, r3, r4
0006fcd0  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006fcd2  ldr     r2, [r2]
0006fcd4  str     r2, [r3, #4]
0006fcd6  ldr.w   r3, [r4, #0xa4]
0006fcda  adds    r3, #1
0006fcdc  str.w   r0, [r4, r3, lsl #3]
0006fce0  b       #0x6fbf0
0006fce2  nop     
0006fce4  subs    r3, #0x4c
0006fce6  movs    r0, r1
0006fce8  stm     r7!, {r0, r7}
0006fcea  vtbx.8  d19, {d15, d16, d17}, d2
0006fcee  movs    r0, r1
0006fcf0  subs    r2, #0x34
0006fcf2  movs    r0, r1
