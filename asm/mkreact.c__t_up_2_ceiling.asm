========================================================================
t_up_2_ceiling  0x00047fe8  248 bytes   mkreact.c
========================================================================

00047fe8  push    {r4, r5, r7, lr}
00047fea  add     r7, sp, #8
00047fec  ldr.w   r3, [r0, #0xa4]
00047ff0  mov     r5, r0
00047ff2  ldr.w   r4, [r0, #0x108]
00047ff6  adds    r2, r3, #1
00047ff8  movw    r3, #0xafc
00047ffc  ldr.w   r2, [r0, r2, lsl #3]
00048000  cmp     r2, r3
00048002  beq     #0x48080
00048004  adds    r3, #0xb
00048006  cmp     r2, r3
00048008  beq     #0x4805a
0004800a  cbnz    r2, #0x48054
0004800c  ldr     r3, [r4]
0004800e  movs    r1, #0x39
00048010  movs    r0, #4
00048012  ldr     r3, [r3, #8]
00048014  bl      #0x31a28 ; -> MKEvent_Add
00048018  mov     r0, r4
0004801a  movs    r3, #9
0004801c  str     r3, [r4, #0x1c]
0004801e  bl      #0x580a4 ; -> group_sound
00048022  ldr     r2, [pc, #0xb4]
00048024  ldr     r3, [r4, #8]
00048026  mov     r0, r4
00048028  str     r2, [r4, #0x1c]
0004802a  str     r2, [r3, #0x1c]
0004802c  movs    r3, #0x1e
0004802e  str     r3, [r4, #0x40]
00048030  bl      #0x5520c ; -> get_char_ani
00048034  mov     r0, r4
00048036  movs    r3, #6
00048038  str     r3, [r4, #0x1c]
0004803a  bl      #0x553a0 ; -> init_anirate
0004803e  ldr.w   r3, [r5, #0xa4]
00048042  movs    r0, #1
00048044  movw    r2, #0xafc
00048048  adds    r3, #1
0004804a  str.w   r2, [r5, r3, lsl #3]
0004804e  str.w   r0, [r5, #0xfc]
00048052  b       #0x48058
00048054  mvn     r0, #2
00048058  pop     {r4, r5, r7, pc}
0004805a  mov     r0, r4
0004805c  bl      #0x57488 ; -> player_normpal
00048060  ldr     r0, [r4]
00048062  movs    r1, #0x3a
00048064  movs    r2, #0
00048066  ldr     r3, [r0, #8]
00048068  movs    r0, #4
0004806a  bl      #0x31a28 ; -> MKEvent_Add
0004806e  ldr.w   r3, [r5, #0xa4]
00048072  cmp     r3, #0
00048074  ble     #0x480be
00048076  subs    r3, #1
00048078  movs    r0, #0
0004807a  str.w   r3, [r5, #0xa4]
0004807e  b       #0x48058
00048080  mov     r0, r4
00048082  bl      #0x5a680 ; -> next_anirate
00048086  mov     r0, r4
00048088  bl      #0x55164 ; -> distance_off_ground
0004808c  ldr     r3, [r4, #0x1c]
0004808e  cmp     r3, #0xff
00048090  ble     #0x4803e
00048092  mov     r0, r4
00048094  bl      #0x55c04 ; -> stop_me_player
00048098  mov     r0, r4
0004809a  bl      #0x54f60 ; -> clear_shadow_bit
0004809e  mov     r0, r4
000480a0  movs    r3, #0x29
000480a2  str     r3, [r4, #0x1c]
000480a4  bl      #0x58d70 ; -> create_fx
000480a8  ldr.w   r3, [r5, #0xa4]
000480ac  movs    r0, #0x50
000480ae  movw    r2, #0xb07
000480b2  adds    r3, #1
000480b4  str.w   r2, [r5, r3, lsl #3]
000480b8  str.w   r0, [r5, #0xfc]
000480bc  b       #0x48058
000480be  ldr     r2, [pc, #0x1c]
000480c0  lsls    r3, r3, #3
000480c2  adds    r3, r3, r5
000480c4  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000480c6  movs    r0, #0
000480c8  ldr     r2, [r2]
000480ca  str     r2, [r3, #4]
000480cc  ldr.w   r3, [r5, #0xa4]
000480d0  adds    r3, #1
000480d2  str.w   r0, [r5, r3, lsl #3]
000480d6  b       #0x48058
000480d8  movs    r0, r0
