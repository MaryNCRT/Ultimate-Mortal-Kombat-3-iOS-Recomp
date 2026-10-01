========================================================================
t_d_unblock  0x000717d4  552 bytes   mkdrone.c
========================================================================

000717d4  push    {r4, r5, r6, r7, lr}
000717d6  add     r7, sp, #0xc
000717d8  str     r8, [sp, #-0x4]!
000717dc  ldr.w   r3, [r0, #0xa4]
000717e0  movw    r2, #0x7a6
000717e4  mov     r4, r0
000717e6  adds    r3, #1
000717e8  ldr.w   r6, [r0, #0x108]
000717ec  ldr.w   r5, [r0, r3, lsl #3]
000717f0  cmp     r5, r2
000717f2  beq.w   #0x7199e
000717f6  ble     #0x71834
000717f8  movw    r2, #0x7ae
000717fc  cmp     r5, r2
000717fe  beq.w   #0x71954
00071802  ble     #0x7185a
00071804  cmp.w   r5, #0x7b0
00071808  beq.w   #0x7193c
0007180c  it      lt
0007180e  movlt.w r2, #0x7b0
00071812  blt     #0x7184a
00071814  movw    r3, #0x7b1
00071818  cmp     r5, r3
0007181a  bne     #0x71892
0007181c  mov     r0, r6
0007181e  bl      #0x55808 ; -> am_i_short
00071822  ldr     r0, [r6, #0x5c]
00071824  cmp     r0, #0
00071826  beq.w   #0x719bc
0007182a  ldr     r2, [pc, #0x1ac]
0007182c  ldr.w   r3, [r4, #0xa4]
00071830  add     r2, pc ; -> 0x000678e9  t_d_backup_jump
00071832  b       #0x71928
00071834  movw    r1, #0x7a2
00071838  cmp     r5, r1
0007183a  beq.w   #0x71986
0007183e  ble     #0x7188a
00071840  movw    r1, #0x7a4
00071844  cmp     r5, r1
00071846  beq     #0x71910
00071848  ble     #0x71898
0007184a  str.w   r2, [r4, r3, lsl #3]
0007184e  movs    r0, #1
00071850  str.w   r0, [r4, #0xfc]
00071854  ldr     r8, [sp], #4
00071858  pop     {r4, r5, r6, r7, pc}
0007185a  movw    r8, #0x7ac
0007185e  cmp     r5, r8
00071860  beq.w   #0x7196e
00071864  bgt     #0x7184a
00071866  movw    r3, #0x7a7
0007186a  cmp     r5, r3
0007186c  bne     #0x71892
0007186e  ldr     r3, [r6, #0x44]
00071870  mov     r0, r6
00071872  str     r3, [r6, #0x40]
00071874  bl      #0x59e24 ; -> do_next_a9_frame
00071878  ldr.w   r3, [r4, #0xa4]
0007187c  movs    r0, #1
0007187e  adds    r3, #1
00071880  str.w   r8, [r4, r3, lsl #3]
00071884  str.w   r0, [r4, #0xfc]
00071888  b       #0x71854
0007188a  cbz     r5, #0x718b4
0007188c  subs    r2, #5
0007188e  cmp     r5, r2
00071890  beq     #0x718a8
00071892  mvn     r0, #2
00071896  b       #0x71854
00071898  movw    r2, #0x7a4
0007189c  str.w   r2, [r0, r3, lsl #3]
000718a0  movs    r0, #1
000718a2  str.w   r0, [r4, #0xfc]
000718a6  b       #0x71854
000718a8  str.w   r1, [r0, r3, lsl #3]
000718ac  movs    r0, #1
000718ae  str.w   r0, [r4, #0xfc]
000718b2  b       #0x71854
000718b4  ldr     r3, [r6]
000718b6  mov     r0, r6
000718b8  str     r5, [r6, #0x20]
000718ba  str     r5, [r3, #0x18]
000718bc  movs    r3, #0xc
000718be  str     r3, [r6, #0x40]
000718c0  bl      #0x55808 ; -> am_i_short
000718c4  ldr     r3, [r6, #0x5c]
000718c6  cmp     r3, #0
000718c8  bne     #0x719b6
000718ca  mov     r0, r6
000718cc  bl      #0x5520c ; -> get_char_ani
000718d0  ldr     r3, [r6, #0x40]
000718d2  mov     r0, r6
000718d4  str     r3, [r6, #0x44]
000718d6  adds    r3, #4
000718d8  str     r3, [r6, #0x40]
000718da  bl      #0x59e24 ; -> do_next_a9_frame
000718de  ldr.w   r3, [r4, #0xa4]
000718e2  movw    r2, #0x7a1
000718e6  mov     r0, r5
000718e8  adds    r3, #1
000718ea  str.w   r2, [r4, r3, lsl #3]
000718ee  ldr.w   r3, [r4, #0xa4]
000718f2  ldr.w   r2, [pc, #0xe8]
000718f6  adds    r3, #1
000718f8  str.w   r3, [r4, #0xa4]
000718fc  lsls    r3, r3, #3
000718fe  adds    r3, r3, r4
00071900  add     r2, pc ; -> 0x0006c40d  t_d_beware
00071902  str     r2, [r3, #4]
00071904  ldr.w   r3, [r4, #0xa4]
00071908  adds    r3, #1
0007190a  str.w   r5, [r4, r3, lsl #3]
0007190e  b       #0x71854
00071910  movw    r2, #0x7a5
00071914  str.w   r2, [r0, r3, lsl #3]
00071918  ldr.w   r2, [pc, #0xc4]
0007191c  ldr.w   r3, [r0, #0xa4]
00071920  add     r2, pc ; -> 0x0006c40d  t_d_beware
00071922  adds    r3, #1
00071924  str.w   r3, [r0, #0xa4]
00071928  lsls    r3, r3, #3
0007192a  adds    r3, r3, r4
0007192c  movs    r0, #0
0007192e  str     r2, [r3, #4]
00071930  ldr.w   r3, [r4, #0xa4]
00071934  adds    r3, #1
00071936  str.w   r0, [r4, r3, lsl #3]
0007193a  b       #0x71854
0007193c  movw    r2, #0x7b1
00071940  str.w   r2, [r0, r3, lsl #3]
00071944  ldr     r2, [pc, #0x9c]
00071946  ldr.w   r3, [r0, #0xa4]
0007194a  add     r2, pc ; -> 0x0006c40d  t_d_beware
0007194c  adds    r3, #1
0007194e  str.w   r3, [r0, #0xa4]
00071952  b       #0x71928
00071954  movw    r2, #0x7af
00071958  str.w   r2, [r0, r3, lsl #3]
0007195c  ldr.w   r2, [pc, #0x88]
00071960  ldr.w   r3, [r0, #0xa4]
00071964  add     r2, pc ; -> 0x0006c40d  t_d_beware
00071966  adds    r3, #1
00071968  str.w   r3, [r0, #0xa4]
0007196c  b       #0x71928
0007196e  movw    r2, #0x7ad
00071972  str.w   r2, [r0, r3, lsl #3]
00071976  ldr     r2, [pc, #0x74]
00071978  ldr.w   r3, [r0, #0xa4]
0007197c  add     r2, pc ; -> 0x0006c40d  t_d_beware
0007197e  adds    r3, #1
00071980  str.w   r3, [r0, #0xa4]
00071984  b       #0x71928
00071986  movw    r2, #0x7a3
0007198a  str.w   r2, [r0, r3, lsl #3]
0007198e  ldr     r2, [pc, #0x60]
00071990  ldr.w   r3, [r0, #0xa4]
00071994  add     r2, pc ; -> 0x0006c40d  t_d_beware
00071996  adds    r3, #1
00071998  str.w   r3, [r0, #0xa4]
0007199c  b       #0x71928
0007199e  movw    r2, #0x7a7
000719a2  str.w   r2, [r0, r3, lsl #3]
000719a6  ldr     r2, [pc, #0x4c]
000719a8  ldr.w   r3, [r0, #0xa4]
000719ac  add     r2, pc ; -> 0x0006c40d  t_d_beware
000719ae  adds    r3, #1
000719b0  str.w   r3, [r0, #0xa4]
000719b4  b       #0x71928
000719b6  movs    r3, #6
000719b8  str     r3, [r6, #0x40]
000719ba  b       #0x718ca
000719bc  ldr     r3, [pc, #0x38]
000719be  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000719c0  ldr     r2, [r3]
000719c2  ldr.w   r3, [r4, #0xa4]
000719c6  lsls    r3, r3, #3
000719c8  adds    r3, r3, r4
000719ca  str     r2, [r3, #4]
000719cc  ldr.w   r3, [r4, #0xa4]
000719d0  adds    r3, #1
000719d2  str.w   r0, [r4, r3, lsl #3]
000719d6  b       #0x71854
000719d8  str     r5, [r6, #8]
000719da  vtbl.8  d26, {d15, d16, d17, d18}, d9
000719de  vtbx.8  d26, {d31, fpinst2, mvfr0}, d25
