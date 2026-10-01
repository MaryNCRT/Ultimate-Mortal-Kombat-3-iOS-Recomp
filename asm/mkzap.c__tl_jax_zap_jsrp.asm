========================================================================
tl_jax_zap_jsrp  0x000772f8  272 bytes   mkzap.c
========================================================================

000772f8  push    {r4, r5, r6, r7, lr}
000772fa  add     r7, sp, #0xc
000772fc  ldr.w   r3, [r0, #0xa4]
00077300  movw    r6, #0x125b
00077304  mov     r4, r0
00077306  adds    r3, #1
00077308  ldr.w   r5, [r0, #0x108]
0007730c  ldr.w   r3, [r0, r3, lsl #3]
00077310  cmp     r3, r6
00077312  beq     #0x77362
00077314  ble     #0x7732a
00077316  cmp.w   r3, #0x1260
0007731a  beq     #0x77388
0007731c  movw    r2, #0x126c
00077320  cmp     r3, r2
00077322  beq     #0x7734a
00077324  mvn     r0, #2
00077328  pop     {r4, r5, r6, r7, pc}
0007732a  cmp     r3, #0
0007732c  bne     #0x77324
0007732e  mov     r0, r5
00077330  movs    r3, #0x24
00077332  str     r3, [r5, #0x40]
00077334  bl      #0x5a31c ; -> do_first_a9_frame
00077338  ldr.w   r3, [r4, #0xa4]
0007733c  movs    r0, #6
0007733e  adds    r3, #1
00077340  str.w   r6, [r4, r3, lsl #3]
00077344  str.w   r0, [r4, #0xfc]
00077348  b       #0x77328
0007734a  mov     r0, r5
0007734c  bl      #0x55c04 ; -> stop_me_player
00077350  ldr.w   r3, [r4, #0xa4]
00077354  cmp     r3, #0
00077356  ble     #0x773e2
00077358  subs    r3, #1
0007735a  movs    r0, #0
0007735c  str.w   r3, [r4, #0xa4]
00077360  b       #0x77328
00077362  mov     r0, r5
00077364  movs    r3, #0
00077366  str     r3, [r5, #0x1c]
00077368  bl      #0x57be4 ; -> ochar_sound
0007736c  mov     r0, r5
0007736e  bl      #0x59e24 ; -> do_next_a9_frame
00077372  ldr.w   r3, [r4, #0xa4]
00077376  movs    r0, #4
00077378  mov.w   r2, #0x1260
0007737c  adds    r3, #1
0007737e  str.w   r2, [r4, r3, lsl #3]
00077382  str.w   r0, [r4, #0xfc]
00077386  b       #0x77328
00077388  ldr     r3, [pc, #0x70]
0007738a  mov     r0, r5
0007738c  movs    r6, #0
0007738e  add     r3, pc ; -> 0x0007753d  t_jax_zap_proc
00077390  str     r3, [r5, #0x38]
00077392  bl      #0x75964 ; -> create_proj_proc
00077396  str     r6, [r5, #0x20]
00077398  cbz     r0, #0x7739e
0007739a  ldr     r0, [r0]
0007739c  str     r6, [r0, #0x34]
0007739e  mov     r0, r5
000773a0  mov.w   r3, #0x40000
000773a4  str     r3, [r5, #0x1c]
000773a6  bl      #0x55ab0 ; -> away_x_vel
000773aa  movs    r3, #4
000773ac  str     r3, [r5, #0x1c]
000773ae  ldr.w   r3, [r4, #0xa4]
000773b2  movw    r2, #0x126c
000773b6  mov     r0, r6
000773b8  adds    r3, #1
000773ba  str.w   r2, [r4, r3, lsl #3]
000773be  ldr.w   r3, [r4, #0xa4]
000773c2  adds    r2, r3, #1
000773c4  ldr.w   r3, [pc, #0x38]
000773c8  str.w   r2, [r4, #0xa4]
000773cc  add     r3, pc ; -> 0x000f37cc  t_mframew
000773ce  ldr     r1, [r3]
000773d0  lsls    r3, r2, #3
000773d2  adds    r3, r3, r4
000773d4  str     r1, [r3, #4]
000773d6  ldr.w   r3, [r4, #0xa4]
000773da  adds    r3, #1
000773dc  str.w   r6, [r4, r3, lsl #3]
000773e0  b       #0x77328
000773e2  ldr     r2, [pc, #0x20]
000773e4  lsls    r3, r3, #3
000773e6  adds    r3, r3, r4
000773e8  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000773ea  movs    r0, #0
000773ec  ldr     r2, [r2]
000773ee  str     r2, [r3, #4]
000773f0  ldr.w   r3, [r4, #0xa4]
000773f4  adds    r3, #1
000773f6  str.w   r0, [r4, r3, lsl #3]
000773fa  b       #0x77328
000773fc  lsls    r3, r5, #6
000773fe  movs    r0, r0
00077400  stm     r3!, {r2, r3, r4, r5, r6, r7}
00077402  movs    r7, r0
00077404  stm     r3!, {r2, r3, r4}
00077406  movs    r7, r0
