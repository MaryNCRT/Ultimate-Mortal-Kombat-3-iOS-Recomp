========================================================================
tl_bomb3  0x00079f50  332 bytes   mkzap.c
========================================================================

00079f50  push    {r4, r5, r6, r7, lr}
00079f52  add     r7, sp, #0xc
00079f54  str     r8, [sp, #-0x4]!
00079f58  ldr.w   r2, [r0, #0xa4]
00079f5c  movw    r8, #0xc3c
00079f60  mov     r5, r0
00079f62  adds    r3, r2, #1
00079f64  ldr.w   r6, [r0, #0x108]
00079f68  ldr.w   r4, [r0, r3, lsl #3]
00079f6c  cmp     r4, r8
00079f6e  beq     #0x79fe0
00079f70  ble     #0x79f8a
00079f72  movw    r3, #0xc81
00079f76  cmp     r4, r3
00079f78  beq     #0x7a008
00079f7a  adds    r3, #5
00079f7c  cmp     r4, r3
00079f7e  beq     #0x79fc6
00079f80  mvn     r0, #2
00079f84  ldr     r8, [sp], #4
00079f88  pop     {r4, r5, r6, r7, pc}
00079f8a  cmp     r4, #0
00079f8c  bne     #0x79f80
00079f8e  movs    r3, #0xd
00079f90  mov     r0, r6
00079f92  str     r3, [r6, #0x20]
00079f94  str     r4, [r6, #0x44]
00079f96  bl      #0x79590 ; -> zap_init_special_act
00079f9a  ldr.w   r3, [r5, #0xa4]
00079f9e  ldr     r2, [pc, #0xf0]
00079fa0  mov     r0, r4
00079fa2  adds    r3, #1
00079fa4  add     r2, pc ; -> 0x00075291  t_robo_open_chest
00079fa6  str.w   r8, [r5, r3, lsl #3]
00079faa  ldr.w   r3, [r5, #0xa4]
00079fae  adds    r3, #1
00079fb0  str.w   r3, [r5, #0xa4]
00079fb4  lsls    r3, r3, #3
00079fb6  adds    r3, r3, r5
00079fb8  str     r2, [r3, #4]
00079fba  ldr.w   r3, [r5, #0xa4]
00079fbe  adds    r3, #1
00079fc0  str.w   r4, [r5, r3, lsl #3]
00079fc4  b       #0x79f84
00079fc6  ldr.w   r1, [pc, #0xcc]
00079fca  add     r1, pc ; -> 0x00077eb5  t_robo_close_chest
00079fcc  lsls    r3, r2, #3
00079fce  adds    r3, r3, r5
00079fd0  movs    r0, #0
00079fd2  str     r1, [r3, #4]
00079fd4  ldr.w   r3, [r5, #0xa4]
00079fd8  adds    r3, #1
00079fda  str.w   r0, [r5, r3, lsl #3]
00079fde  b       #0x79f84
00079fe0  movs    r0, #0x20
00079fe2  bl      #0x575e8 ; -> CountThreads
00079fe6  cmp     r0, #1
00079fe8  str     r0, [r6, #0x28]
00079fea  ble     #0x7a010
00079fec  mov     r0, r6
00079fee  bl      #0x758b0 ; -> i_am_a_sitting_duck
00079ff2  ldr.w   r3, [r5, #0xa4]
00079ff6  movs    r0, #0x20
00079ff8  movw    r2, #0xc86
00079ffc  adds    r3, #1
00079ffe  str.w   r2, [r5, r3, lsl #3]
0007a002  str.w   r0, [r5, #0xfc]
0007a006  b       #0x79f84
0007a008  ldr.w   r1, [pc, #0x8c]
0007a00c  add     r1, pc ; -> 0x00077eb5  t_robo_close_chest
0007a00e  b       #0x79fcc
0007a010  ldr     r3, [r6]
0007a012  ldr     r0, [r3, #8]
0007a014  add.w   r0, r0, #0x700
0007a018  bl      #0x575e8 ; -> CountThreads
0007a01c  cmp     r0, #0
0007a01e  bgt     #0x79fec
0007a020  ldr     r3, [r6, #0x48]
0007a022  mov     r0, r6
0007a024  str     r3, [r6, #0x38]
0007a026  bl      #0x75964 ; -> create_proj_proc
0007a02a  ldr.w   r1, [r5, #0xf8]
0007a02e  ldr     r2, [r6, #0x40]
0007a030  lsls    r3, r1, #2
0007a032  adds    r3, r3, r5
0007a034  str.w   r2, [r3, #0xa8]
0007a038  adds    r3, r1, #1
0007a03a  str.w   r3, [r5, #0xf8]
0007a03e  movs    r3, #4
0007a040  str     r3, [r6, #0x40]
0007a042  mov     r4, r0
0007a044  mov     r0, r6
0007a046  bl      #0x55228 ; -> get_char_ani2
0007a04a  ldr     r3, [r6, #0x40]
0007a04c  ldr     r0, [r4, #8]
0007a04e  str     r3, [r4, #0x40]
0007a050  str     r0, [r6, #0x30]
0007a052  movs    r3, #0
0007a054  mov     r0, r6
0007a056  str     r3, [r6, #0x1c]
0007a058  adds    r3, #0x28
0007a05a  str     r3, [r6, #0x20]
0007a05c  bl      #0x570bc ; -> adjust_xy_a5
0007a060  ldr.w   r3, [r5, #0xf8]
0007a064  mov     r0, r6
0007a066  subs    r3, #1
0007a068  str.w   r3, [r5, #0xf8]
0007a06c  lsls    r3, r3, #2
0007a06e  adds    r3, r3, r5
0007a070  ldr.w   r3, [r3, #0xa8]
0007a074  str     r3, [r6, #0x40]
0007a076  bl      #0x758b0 ; -> i_am_a_sitting_duck
0007a07a  ldr.w   r3, [r5, #0xa4]
0007a07e  movs    r0, #0x16
0007a080  movw    r2, #0xc81
0007a084  adds    r3, #1
0007a086  str.w   r2, [r5, r3, lsl #3]
0007a08a  str.w   r0, [r5, #0xfc]
0007a08e  b       #0x79f84
0007a090  uxtb    r1, r5
