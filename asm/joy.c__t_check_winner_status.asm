========================================================================
t_check_winner_status  0x0002ecd4  172 bytes   joy.c
========================================================================

0002ecd4  push    {r4}
0002ecd6  ldr.w   r3, [r0, #0xa4]
0002ecda  ldr.w   r1, [r0, #0x108]
0002ecde  adds    r3, #1
0002ece0  ldr.w   r4, [r0, r3, lsl #3]
0002ece4  cbz     r4, #0x2ecee
0002ece6  mvn     r0, #2
0002ecea  pop     {r4}
0002ecec  bx      lr
0002ecee  ldr     r3, [pc, #0x78]
0002ecf0  add     r3, pc ; -> 0x0016564c  bt_jump+0x28
0002ecf2  ldr     r3, [r3]
0002ecf4  ldrh.w  r2, [r3, #0x45c]
0002ecf8  sxth    r3, r2
0002ecfa  str     r3, [r1, #0x1c]
0002ecfc  cbnz    r2, #0x2ed10
0002ecfe  ldr.w   r3, [r0, #0xa4]
0002ed02  cmp     r3, #0
0002ed04  ble     #0x2ed60
0002ed06  subs    r3, #1
0002ed08  str.w   r3, [r0, #0xa4]
0002ed0c  mov     r0, r4
0002ed0e  b       #0x2ecea
0002ed10  cmp     r3, #2
0002ed12  beq     #0x2ed54
0002ed14  cmp     r3, #3
0002ed16  beq     #0x2ed2a
0002ed18  cmp     r3, #1
0002ed1a  beq     #0x2ed48
0002ed1c  ldr.w   r3, [r0, #0xa4]
0002ed20  cmp     r3, #0
0002ed22  bgt     #0x2ed06
0002ed24  ldr     r2, [pc, #0x44]
0002ed26  add     r2, pc ; -> 0x00030061  t_local_reaction_exit
0002ed28  b       #0x2ed34
0002ed2a  ldr     r3, [pc, #0x44]
0002ed2c  add     r3, pc ; -> 0x000f384c  t_finish_him
0002ed2e  ldr     r2, [r3]
0002ed30  ldr.w   r3, [r0, #0xa4]
0002ed34  lsls    r3, r3, #3
0002ed36  adds    r3, r3, r0
0002ed38  str     r2, [r3, #4]
0002ed3a  ldr.w   r3, [r0, #0xa4]
0002ed3e  adds    r3, #1
0002ed40  str.w   r4, [r0, r3, lsl #3]
0002ed44  mov     r0, r4
0002ed46  b       #0x2ecea
0002ed48  ldr     r3, [pc, #0x28]
0002ed4a  add     r3, pc ; -> 0x000f3840  t_player_1_wins
0002ed4c  ldr     r2, [r3]
0002ed4e  ldr.w   r3, [r0, #0xa4]
0002ed52  b       #0x2ed34
0002ed54  ldr     r3, [pc, #0x20]
0002ed56  add     r3, pc ; -> 0x000f3850  t_player_2_wins
0002ed58  ldr     r2, [r3]
0002ed5a  ldr.w   r3, [r0, #0xa4]
0002ed5e  b       #0x2ed34
0002ed60  ldr.w   r2, [pc, #0x18]
0002ed64  add     r2, pc ; -> 0x00030061  t_local_reaction_exit
0002ed66  b       #0x2ed34
0002ed68  ldr     r0, [r3, #0x14]
0002ed6a  movs    r3, r2
0002ed6c  asrs    r7, r6, #0xc
0002ed6e  movs    r0, r0
0002ed70  ldr     r3, [pc, #0x70]
0002ed72  movs    r4, r1
0002ed74  ldr     r2, [pc, #0x3c8]
0002ed76  movs    r4, r1
0002ed78  ldr     r2, [pc, #0x3d8]
0002ed7a  movs    r4, r1
0002ed7c  asrs    r1, r7, #0xb
0002ed7e  movs    r0, r0
