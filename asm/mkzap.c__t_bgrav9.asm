========================================================================
t_bgrav9  0x0007905c  320 bytes   mkzap.c
========================================================================

0007905c  push    {r4, r5, r6, r7, lr}
0007905e  add     r7, sp, #0xc
00079060  ldr.w   r3, [r0, #0xa4]
00079064  movw    r2, #0xcc8
00079068  mov     r5, r0
0007906a  adds    r3, #1
0007906c  ldr.w   r4, [r0, #0x108]
00079070  ldr.w   r3, [r0, r3, lsl #3]
00079074  cmp     r3, r2
00079076  beq     #0x7910c
00079078  ble     #0x7908e
0007907a  cmp.w   r3, #0xcd0
0007907e  beq     #0x790e6
00079080  movw    r2, #0xce3
00079084  cmp     r3, r2
00079086  beq     #0x790b2
00079088  mvn     r0, #2
0007908c  pop     {r4, r5, r6, r7, pc}
0007908e  cmp     r3, #0
00079090  bne     #0x79088
00079092  ldr     r0, [r4, #8]
00079094  bl      #0x55a60 ; -> stop_a8
00079098  movs    r3, #0x40
0007909a  str     r3, [r4, #0x48]
0007909c  ldr.w   r3, [r5, #0xa4]
000790a0  movs    r0, #1
000790a2  movw    r2, #0xcc8
000790a6  adds    r3, #1
000790a8  str.w   r2, [r5, r3, lsl #3]
000790ac  str.w   r0, [r5, #0xfc]
000790b0  b       #0x7908c
000790b2  mov     r0, r4
000790b4  movs    r3, #0x15
000790b6  str     r3, [r4, #0x1c]
000790b8  bl      #0x594c8 ; -> strike_check_a0
000790bc  ldr     r3, [r4, #0x5c]
000790be  cmp     r3, #0
000790c0  bne     #0x79146
000790c2  ldr     r3, [r4, #0x48]
000790c4  subs    r0, r3, #1
000790c6  str     r0, [r4, #0x48]
000790c8  cmp     r0, #0
000790ca  bne     #0x79170
000790cc  ldr.w   r3, [r5, #0xa4]
000790d0  ldr     r2, [pc, #0xb4]
000790d2  lsls    r3, r3, #3
000790d4  adds    r3, r3, r5
000790d6  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
000790d8  str     r2, [r3, #4]
000790da  ldr.w   r3, [r5, #0xa4]
000790de  adds    r3, #1
000790e0  str.w   r0, [r5, r3, lsl #3]
000790e4  b       #0x7908c
000790e6  mov     r0, r4
000790e8  bl      #0x68e20 ; -> q_is_he_a_boss
000790ec  ldr     r3, [r4, #0x5c]
000790ee  cbz     r3, #0x7914c
000790f0  ldr     r2, [pc, #0x98]
000790f2  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
000790f4  ldr.w   r3, [r5, #0xa4]
000790f8  movs    r0, #0
000790fa  lsls    r3, r3, #3
000790fc  adds    r3, r3, r5
000790fe  str     r2, [r3, #4]
00079100  ldr.w   r3, [r5, #0xa4]
00079104  adds    r3, #1
00079106  str.w   r0, [r5, r3, lsl #3]
0007910a  b       #0x7908c
0007910c  mov     r0, r4
0007910e  bl      #0x5a680 ; -> next_anirate
00079112  ldr     r3, [r4, #0x48]
00079114  subs    r3, #1
00079116  str     r3, [r4, #0x48]
00079118  cmp     r3, #0
0007911a  bne     #0x7909c
0007911c  ldr.w   r3, [pc, #0x70]
00079120  add     r3, pc ; -> 0x000f357c  G
00079122  ldr     r3, [r3]
00079124  ldrh.w  r2, [r3, #0x450]
00079128  sxth    r3, r2
0007912a  str     r3, [r4, #0x1c]
0007912c  cmp     r2, #0
0007912e  beq     #0x790e6
00079130  ldr.w   r3, [r5, #0xa4]
00079134  ldr     r0, [pc, #0x5c]
00079136  mov.w   r2, #0xcd0
0007913a  adds    r3, #1
0007913c  str.w   r2, [r5, r3, lsl #3]
00079140  str.w   r0, [r5, #0xfc]
00079144  b       #0x7908c
00079146  ldr     r2, [pc, #0x50]
00079148  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
0007914a  b       #0x790f4
0007914c  mov     r0, r4
0007914e  movs    r6, #0xa
00079150  str     r6, [r4, #0x1c]
00079152  bl      #0x58d70 ; -> create_fx
00079156  mov     r0, r4
00079158  str     r6, [r4, #0x1c]
0007915a  bl      #0x57be4 ; -> ochar_sound
0007915e  mov     r0, r4
00079160  bl      #0x54f70 ; -> set_inviso
00079164  ldr     r3, [r4, #8]
00079166  movs    r2, #8
00079168  str     r2, [r4, #0x1c]
0007916a  str     r2, [r3, #0x24]
0007916c  movs    r3, #5
0007916e  str     r3, [r4, #0x48]
00079170  ldr.w   r3, [r5, #0xa4]
00079174  movs    r0, #1
00079176  movw    r2, #0xce3
0007917a  adds    r3, #1
0007917c  str.w   r2, [r5, r3, lsl #3]
00079180  str.w   r0, [r5, #0xfc]
00079184  b       #0x7908c
00079186  nop     
00079188  stm     r5!, {r0, r1, r3, r7}
