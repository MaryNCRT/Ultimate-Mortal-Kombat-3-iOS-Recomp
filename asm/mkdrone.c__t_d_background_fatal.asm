========================================================================
t_d_background_fatal  0x000690d0  212 bytes   mkdrone.c
========================================================================

000690d0  push    {lr}
000690d2  ldr.w   r1, [r0, #0xa4]
000690d6  movw    sb, #0x988
000690da  ldr.w   lr, [r0, #0x108]
000690de  add.w   ip, r1, #1
000690e2  ldr.w   r2, [r0, ip, lsl #3]
000690e6  cmp     r2, sb
000690e8  beq     #0x69142
000690ea  movw    r3, #0x98b
000690ee  cmp     r2, r3
000690f0  beq     #0x69120
000690f2  cbz     r2, #0x690fa
000690f4  mvn     r0, #2
000690f8  pop     {pc}
000690fa  str.w   sb, [r0, ip, lsl #3]
000690fe  ldr.w   r3, [r0, #0xa4]
00069102  ldr     r1, [pc, #0x8c]
00069104  adds    r3, #1
00069106  str.w   r3, [r0, #0xa4]
0006910a  lsls    r3, r3, #3
0006910c  adds    r3, r3, r0
0006910e  add     r1, pc ; -> 0x0006e69d  t_d_get_close_2_u
00069110  str     r1, [r3, #4]
00069112  ldr.w   r3, [r0, #0xa4]
00069116  adds    r3, #1
00069118  str.w   r2, [r0, r3, lsl #3]
0006911c  mov     r0, r2
0006911e  b       #0x690f8
00069120  ldr.w   r2, [lr, #0x5c]
00069124  cbnz    r2, #0x69184
00069126  ldr.w   ip, [pc, #0x6c]
0006912a  lsls    r3, r1, #3
0006912c  adds    r3, r3, r0
0006912e  add     ip, pc ; -> 0x000703c9  t_d_fatality_abort
00069130  str.w   ip, [r3, #4]
00069134  ldr.w   r3, [r0, #0xa4]
00069138  adds    r3, #1
0006913a  str.w   r2, [r0, r3, lsl #3]
0006913e  mov     r0, r2
00069140  b       #0x690f8
00069142  ldr     r3, [pc, #0x54]
00069144  movw    r2, #0x98b
00069148  add     r3, pc ; -> 0x00068ea1  q_is_he_dizzy
0006914a  str.w   r3, [lr, #0x48]
0006914e  movs    r3, #0x40
00069150  str.w   r3, [lr, #0x44]
00069154  ldr.w   r3, [r0, #0xa4]
00069158  adds    r3, #1
0006915a  str.w   r2, [r0, r3, lsl #3]
0006915e  ldr.w   r3, [r0, #0xa4]
00069162  ldr.w   r2, [pc, #0x38]
00069166  adds    r3, #1
00069168  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
0006916a  str.w   r3, [r0, #0xa4]
0006916e  lsls    r3, r3, #3
00069170  adds    r3, r3, r0
00069172  str     r2, [r3, #4]
00069174  ldr.w   r3, [r0, #0xa4]
00069178  movs    r2, #0
0006917a  adds    r3, #1
0006917c  str.w   r2, [r0, r3, lsl #3]
00069180  mov     r0, r2
00069182  b       #0x690f8
00069184  ldr     r3, [pc, #0x18]
00069186  add     r3, pc ; -> 0x000f3130  t_do_pit_fatality
00069188  ldr     r2, [r3]
0006918a  lsls    r3, r1, #3
0006918c  b       #0x69170
0006918e  nop     
00069190  strb    r3, [r1, r6]
00069192  movs    r0, r0
00069194  strb    r7, [r2, #0xa]
00069196  movs    r0, r0
00069198  ldc2l   p15, c15, [r5, #-0x3fc]
0006919c  ldrh    r1, [r7, #0x32]
0006919e  movs    r0, r0
000691a0  ldr     r7, [sp, #0x298]
000691a2  movs    r0, r1
