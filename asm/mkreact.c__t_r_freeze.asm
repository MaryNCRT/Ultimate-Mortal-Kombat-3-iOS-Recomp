========================================================================
t_r_freeze  0x00045fac  512 bytes   mkreact.c
========================================================================

00045fac  push    {r4, r5, r7, lr}
00045fae  add     r7, sp, #8
00045fb0  ldr.w   r1, [r0, #0xa4]
00045fb4  mov     r5, r0
00045fb6  ldr.w   r4, [r0, #0x108]
00045fba  adds    r2, r1, #1
00045fbc  ldr.w   r3, [r0, r2, lsl #3]
00045fc0  movw    r0, #0x11bb
00045fc4  cmp     r3, r0
00045fc6  beq.w   #0x4615c
00045fca  ble     #0x45fe2
00045fcc  movw    r2, #0x11bd
00045fd0  cmp     r3, r2
00045fd2  beq     #0x4608c
00045fd4  adds    r2, #0xe
00045fd6  cmp     r3, r2
00045fd8  beq.w   #0x46144
00045fdc  mvn     r0, #2
00045fe0  pop     {r4, r5, r7, pc}
00045fe2  cmp     r3, #0
00045fe4  bne     #0x460ba
00045fe6  mov     r0, r4
00045fe8  bl      #0x579fc ; -> lights_on_slam
00045fec  ldr     r3, [r4]
00045fee  movs    r2, #6
00045ff0  mov     r0, r4
00045ff2  str     r2, [r4, #0x20]
00045ff4  str     r2, [r3, #0x48]
00045ff6  bl      #0x44b0c ; -> reaction_start_chores
00045ffa  mov     r0, r4
00045ffc  bl      #0x54dec ; -> dec_my_p_hit
00046000  ldr     r3, [r4]
00046002  ldr     r3, [r3, #0x18]
00046004  cmp.w   r3, #0x610
00046008  str     r3, [r4, #0x1c]
0004600a  beq     #0x4607e
0004600c  mov     r0, r4
0004600e  bl      #0x55c04 ; -> stop_me_player
00046012  mov     r0, r4
00046014  bl      #0x54f20 ; -> set_no_block
00046018  mov     r0, r4
0004601a  bl      #0x2ec38 ; -> me_in_back
0004601e  mov     r0, r4
00046020  bl      #0x550b0 ; -> get_my_strength
00046024  ldr     r3, [r4, #0x1c]
00046026  cmp     r3, #8
00046028  ble.w   #0x4616c
0004602c  ldr     r3, [r4]
0004602e  mov.w   r2, #0x610
00046032  str     r2, [r4, #0x1c]
00046034  mov     r0, r4
00046036  str     r2, [r3, #0x18]
00046038  ldr     r2, [r4, #8]
0004603a  ldr     r3, [r2, #0x30]
0004603c  bic     r3, r3, #8
00046040  str     r3, [r4, #0x2c]
00046042  str     r3, [r2, #0x30]
00046044  bl      #0x575a4 ; -> player_froze_pal
00046048  ldr     r2, [r4, #8]
0004604a  ldr     r3, [r2, #0x24]
0004604c  cmp     r3, #0xa
0004604e  str     r3, [r4, #0x1c]
00046050  beq.w   #0x46178
00046054  movs    r3, #4
00046056  str     r3, [r4, #0x1c]
00046058  subs    r3, #1
0004605a  str     r3, [r4, #0x20]
0004605c  subs    r3, #1
0004605e  str     r3, [r4, #0x24]
00046060  ldr.w   r3, [r5, #0xa4]
00046064  movw    r2, #0x11b6
00046068  adds    r3, #1
0004606a  str.w   r2, [r5, r3, lsl #3]
0004606e  ldr.w   r3, [r5, #0xa4]
00046072  adds    r2, r3, #1
00046074  ldr     r3, [pc, #0x11c]
00046076  str.w   r2, [r5, #0xa4]
0004607a  add     r3, pc ; -> 0x000f36f8  t_shake_ob_up
0004607c  b       #0x460e6
0004607e  ldr.w   r3, [pc, #0x118]
00046082  mov     r0, r4
00046084  add     r3, pc ; -> 0x00045fad  t_r_freeze
00046086  str     r3, [r4, #0x38]
00046088  bl      #0x58954 ; -> takeover_him
0004608c  mov     r0, r4
0004608e  bl      #0x57488 ; -> player_normpal
00046092  mov     r0, r4
00046094  bl      #0x55070 ; -> am_i_airborn
00046098  ldr     r0, [r4, #0x5c]
0004609a  cbnz    r0, #0x460fc
0004609c  ldr.w   r3, [pc, #0xfc]
000460a0  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000460a2  ldr     r2, [r3]
000460a4  ldr.w   r3, [r5, #0xa4]
000460a8  lsls    r3, r3, #3
000460aa  adds    r3, r3, r5
000460ac  str     r2, [r3, #4]
000460ae  ldr.w   r3, [r5, #0xa4]
000460b2  adds    r3, #1
000460b4  str.w   r0, [r5, r3, lsl #3]
000460b8  b       #0x45fe0
000460ba  movw    r2, #0x11b6
000460be  cmp     r3, r2
000460c0  bne     #0x45fdc
000460c2  movs    r3, #4
000460c4  str     r3, [r4, #0x1c]
000460c6  subs    r3, #1
000460c8  str     r3, [r4, #0x20]
000460ca  adds    r3, #5
000460cc  str     r3, [r4, #0x24]
000460ce  ldr.w   r3, [r5, #0xa4]
000460d2  adds    r3, #1
000460d4  str.w   r0, [r5, r3, lsl #3]
000460d8  ldr.w   r3, [r5, #0xa4]
000460dc  adds    r2, r3, #1
000460de  ldr     r3, [pc, #0xc0]
000460e0  str.w   r2, [r5, #0xa4]
000460e4  add     r3, pc ; -> 0x000f36f8  t_shake_ob_up
000460e6  ldr     r1, [r3]
000460e8  lsls    r3, r2, #3
000460ea  adds    r3, r3, r5
000460ec  movs    r0, #0
000460ee  str     r1, [r3, #4]
000460f0  ldr.w   r3, [r5, #0xa4]
000460f4  adds    r3, #1
000460f6  str.w   r0, [r5, r3, lsl #3]
000460fa  b       #0x45fe0
000460fc  mov.w   r3, #0x10000
00046100  str     r3, [r4, #0x20]
00046102  sub.w   r3, r3, #0x8000
00046106  str     r3, [r4, #0x24]
00046108  movs    r3, #5
0004610a  movs    r0, #0
0004610c  str     r3, [r4, #0x28]
0004610e  str     r0, [r4, #0x1c]
00046110  adds    r3, #0x19
00046112  str     r3, [r4, #0x40]
00046114  ldr.w   r3, [r5, #0xa4]
00046118  movw    r2, #0x11cb
0004611c  adds    r3, #1
0004611e  str.w   r2, [r5, r3, lsl #3]
00046122  ldr.w   r3, [r5, #0xa4]
00046126  adds    r2, r3, #1
00046128  ldr     r3, [pc, #0x78]
0004612a  str.w   r2, [r5, #0xa4]
0004612e  add     r3, pc ; -> 0x000f3720  t_flight
00046130  ldr     r1, [r3]
00046132  lsls    r3, r2, #3
00046134  adds    r3, r3, r5
00046136  str     r1, [r3, #4]
00046138  ldr.w   r3, [r5, #0xa4]
0004613c  adds    r3, #1
0004613e  str.w   r0, [r5, r3, lsl #3]
00046142  b       #0x45fe0
00046144  ldr     r2, [pc, #0x60]
00046146  lsls    r3, r1, #3
00046148  adds    r3, r3, r5
0004614a  add     r2, pc ; -> 0x00042519  t_land_on_my_back
0004614c  str     r2, [r3, #4]
0004614e  ldr.w   r3, [r5, #0xa4]
00046152  movs    r0, #0
00046154  adds    r3, #1
00046156  str.w   r0, [r5, r3, lsl #3]
0004615a  b       #0x45fe0
0004615c  movs    r0, #0x60
0004615e  movw    r3, #0x11bd
00046162  str.w   r3, [r5, r2, lsl #3]
00046166  str.w   r0, [r5, #0xfc]
0004616a  b       #0x45fe0
0004616c  mov     r0, r4
0004616e  movs    r3, #0x17
00046170  str     r3, [r4, #0x1c]
00046172  bl      #0x58d70 ; -> create_fx
00046176  b       #0x4602c
00046178  ldr     r3, [r2, #0x2c]
0004617a  str     r3, [r4, #0x1c]
0004617c  sub.w   r3, r3, #0x800
00046180  subs    r3, #0x11
00046182  cmp     r3, #3
00046184  bhi.w   #0x46054
00046188  mov     r0, r4
0004618a  movs    r3, #1
0004618c  str     r3, [r4, #0x40]
0004618e  bl      #0x5a000 ; -> pose2_a9_manual
00046192  b       #0x46054
00046194  bvs     #0x4628c
00046196  movs    r2, r1
