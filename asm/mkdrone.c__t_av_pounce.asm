========================================================================
t_av_pounce  0x0006fad8  232 bytes   mkdrone.c
========================================================================

0006fad8  push    {r4, r5, r6, r7, lr}
0006fada  add     r7, sp, #0xc
0006fadc  mov     r4, r0
0006fade  ldr.w   r5, [r0, #0x108]
0006fae2  ldr.w   r0, [r0, #0xa4]
0006fae6  movw    r2, #0x11ac
0006faea  adds    r1, r0, #1
0006faec  ldr.w   r3, [r4, r1, lsl #3]
0006faf0  cmp     r3, r2
0006faf2  beq     #0x6fb4c
0006faf4  ble     #0x6fb0a
0006faf6  movw    r2, #0x11b4
0006fafa  cmp     r3, r2
0006fafc  beq     #0x6fb98
0006fafe  adds    r2, #1
0006fb00  cmp     r3, r2
0006fb02  beq     #0x6fb34
0006fb04  mvn     r0, #2
0006fb08  pop     {r4, r5, r6, r7, pc}
0006fb0a  cmp     r3, #0
0006fb0c  bne     #0x6fb04
0006fb0e  mov     r0, r5
0006fb10  bl      #0x30fbc ; -> run_setup
0006fb14  mov     r0, r5
0006fb16  bl      #0x55388 ; -> face_opponent
0006fb1a  movs    r3, #0x10
0006fb1c  str     r3, [r5, #0x44]
0006fb1e  ldr.w   r3, [r4, #0xa4]
0006fb22  movs    r0, #1
0006fb24  movw    r2, #0x11ac
0006fb28  adds    r3, #1
0006fb2a  str.w   r2, [r4, r3, lsl #3]
0006fb2e  str.w   r0, [r4, #0xfc]
0006fb32  b       #0x6fb08
0006fb34  ldr     r2, [pc, #0x7c]
0006fb36  lsls    r3, r0, #3
0006fb38  add     r2, pc ; -> 0x000722c9  t_run_in_close_now
0006fb3a  adds    r3, r3, r4
0006fb3c  movs    r0, #0
0006fb3e  str     r2, [r3, #4]
0006fb40  ldr.w   r3, [r4, #0xa4]
0006fb44  adds    r3, #1
0006fb46  str.w   r0, [r4, r3, lsl #3]
0006fb4a  b       #0x6fb08
0006fb4c  mov     r0, r5
0006fb4e  bl      #0x30820 ; -> reduce_turbo_bar
0006fb52  mov     r0, r5
0006fb54  bl      #0x5a680 ; -> next_anirate
0006fb58  ldr     r3, [r5, #0x44]
0006fb5a  subs    r6, r3, #1
0006fb5c  str     r6, [r5, #0x44]
0006fb5e  cmp     r6, #0
0006fb60  bne     #0x6fb1e
0006fb62  mov     r0, r5
0006fb64  bl      #0x55c04 ; -> stop_me_player
0006fb68  ldr.w   r3, [r4, #0xa4]
0006fb6c  movw    r2, #0x11b4
0006fb70  mov     r0, r6
0006fb72  adds    r3, #1
0006fb74  str.w   r2, [r4, r3, lsl #3]
0006fb78  ldr.w   r3, [r4, #0xa4]
0006fb7c  ldr     r2, [pc, #0x38]
0006fb7e  adds    r3, #1
0006fb80  str.w   r3, [r4, #0xa4]
0006fb84  lsls    r3, r3, #3
0006fb86  adds    r3, r3, r4
0006fb88  add     r2, pc ; -> 0x000716d9  t_d_turnaround_jsrp
0006fb8a  str     r2, [r3, #4]
0006fb8c  ldr.w   r3, [r4, #0xa4]
0006fb90  adds    r3, #1
0006fb92  str.w   r6, [r4, r3, lsl #3]
0006fb96  b       #0x6fb08
0006fb98  movw    r3, #0x11b5
0006fb9c  str.w   r3, [r4, r1, lsl #3]
0006fba0  ldr.w   r3, [r4, #0xa4]
0006fba4  ldr.w   r2, [pc, #0x14]
0006fba8  adds    r3, #1
0006fbaa  add     r2, pc ; -> 0x0006b405  t_swait_land_jsrp
0006fbac  str.w   r3, [r4, #0xa4]
0006fbb0  lsls    r3, r3, #3
0006fbb2  b       #0x6fb3a
0006fbb4  movs    r7, #0x8d
0006fbb6  movs    r0, r0
0006fbb8  subs    r5, r1, r5
0006fbba  movs    r0, r0
