========================================================================
tl_pflt3  0x00076010  328 bytes   mkzap.c
========================================================================

00076010  push    {r4, r5, r7, lr}
00076012  add     r7, sp, #8
00076014  ldr.w   r3, [r0, #0xa4]
00076018  mov     r5, r0
0007601a  ldr.w   r4, [r0, #0x108]
0007601e  adds    r1, r3, #1
00076020  ldr.w   r3, [r0, r1, lsl #3]
00076024  movw    r0, #0x1368
00076028  cmp     r3, r0
0007602a  beq     #0x76048
0007602c  movw    r2, #0x136e
00076030  cmp     r3, r2
00076032  beq     #0x76058
00076034  cbz     r3, #0x7603c
00076036  mvn     r0, #2
0007603a  pop     {r4, r5, r7, pc}
0007603c  str.w   r0, [r5, r1, lsl #3]
00076040  movs    r0, #1
00076042  str.w   r0, [r5, #0xfc]
00076046  b       #0x7603a
00076048  mov     r0, r4
0007604a  bl      #0x5a680 ; -> next_anirate
0007604e  ldr     r3, [r4]
00076050  ldr     r3, [r3, #0x28]
00076052  str     r3, [r4, #0x34]
00076054  cmp     r3, #0
00076056  bne     #0x760b4
00076058  mov     r0, r4
0007605a  bl      #0x75714 ; -> proj_onscreen_test
0007605e  cbz     r0, #0x760ac
00076060  ldr     r3, [r4]
00076062  ldr     r3, [r3, #4]
00076064  ldr     r3, [r3, #0x24]
00076066  cmp     r3, #0x18
00076068  str     r3, [r4, #0x20]
0007606a  beq     #0x760e2
0007606c  mov     r0, r4
0007606e  bl      #0x54e38 ; -> get_his_action
00076072  ldr     r2, [r4, #0x20]
00076074  movw    r3, #0x402
00076078  cmp     r2, r3
0007607a  beq     #0x760e2
0007607c  ldr     r3, [r4, #0x48]
0007607e  mov     r0, r4
00076080  str     r3, [r4, #0x1c]
00076082  bl      #0x75900 ; -> tell_world_stk
00076086  mov     r0, r4
00076088  bl      #0x75f5c ; -> proj_strike_check
0007608c  ldr     r0, [r4, #0x5c]
0007608e  cmp     r0, #0
00076090  bne     #0x7612e
00076092  ldr     r2, [pc, #0xb4]
00076094  add     r2, pc ; -> 0x00076011  tl_pflt3
00076096  ldr.w   r3, [r5, #0xa4]
0007609a  lsls    r3, r3, #3
0007609c  adds    r3, r3, r5
0007609e  str     r2, [r3, #4]
000760a0  ldr.w   r3, [r5, #0xa4]
000760a4  adds    r3, #1
000760a6  str.w   r0, [r5, r3, lsl #3]
000760aa  b       #0x7603a
000760ac  ldr.w   r2, [pc, #0x9c]
000760b0  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
000760b2  b       #0x76096
000760b4  ldr.w   r3, [r5, #0xa4]
000760b8  movw    r2, #0x136e
000760bc  adds    r3, #1
000760be  str.w   r2, [r5, r3, lsl #3]
000760c2  ldr.w   r3, [r5, #0xa4]
000760c6  adds    r3, #1
000760c8  str.w   r3, [r5, #0xa4]
000760cc  ldr     r0, [r4, #0x34]
000760ce  lsls    r3, r3, #3
000760d0  adds    r3, r3, r5
000760d2  str     r0, [r3, #4]
000760d4  ldr.w   r3, [r5, #0xa4]
000760d8  movs    r0, #0
000760da  adds    r3, #1
000760dc  str.w   r0, [r5, r3, lsl #3]
000760e0  b       #0x7603a
000760e2  ldr     r3, [r4, #0x48]
000760e4  mov     r0, r4
000760e6  str     r3, [r4, #0x1c]
000760e8  bl      #0x595d8 ; -> strike_check_a0_test
000760ec  ldr     r3, [r4, #0x5c]
000760ee  cmp     r3, #0
000760f0  beq     #0x7607c
000760f2  mov     r0, r4
000760f4  bl      #0x75f98 ; -> benedict_arnold_projectile
000760f8  ldr     r3, [r4]
000760fa  mov     r0, r4
000760fc  ldr     r3, [r3, #0x1c]
000760fe  str     r3, [r4, #0x20]
00076100  ldr     r3, [r4, #8]
00076102  ldr     r3, [r3, #0x18]
00076104  cmp     r3, #0
00076106  str     r3, [r4, #0x1c]
00076108  itt     lt
0007610a  rsblt   r3, r3, #0
0007610c  strlt   r3, [r4, #0x1c]
0007610e  bl      #0x75d6c ; -> set_proj_vel
00076112  ldr     r2, [pc, #0x3c]
00076114  ldr.w   r3, [r5, #0xa4]
00076118  add     r2, pc ; -> 0x00076011  tl_pflt3
0007611a  lsls    r3, r3, #3
0007611c  adds    r3, r3, r5
0007611e  movs    r0, #0
00076120  str     r2, [r3, #4]
00076122  ldr.w   r3, [r5, #0xa4]
00076126  adds    r3, #1
00076128  str.w   r0, [r5, r3, lsl #3]
0007612c  b       #0x7603a
0007612e  ldr.w   r3, [r5, #0xa4]
00076132  cmp     r3, #0
00076134  ble     #0x76140
00076136  subs    r3, #1
00076138  movs    r0, #0
0007613a  str.w   r3, [r5, #0xa4]
0007613e  b       #0x7603a
00076140  ldr     r2, [pc, #0x10]
00076142  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00076144  ldr     r2, [r2]
00076146  b       #0x7611a
