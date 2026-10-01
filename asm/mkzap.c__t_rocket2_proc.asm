========================================================================
t_rocket2_proc  0x000785d0  388 bytes   mkzap.c
========================================================================

000785d0  push    {r4, r5, r6, r7, lr}
000785d2  add     r7, sp, #0xc
000785d4  ldr.w   r2, [r0, #0xa4]
000785d8  mov     r6, r0
000785da  ldr.w   r4, [r0, #0x108]
000785de  adds    r3, r2, #1
000785e0  ldr.w   r5, [r0, r3, lsl #3]
000785e4  movw    r3, #0x1011
000785e8  cmp     r5, r3
000785ea  beq     #0x7869a
000785ec  adds    r3, #0xe
000785ee  cmp     r5, r3
000785f0  beq     #0x78682
000785f2  cmp     r5, #0
000785f4  bne     #0x78694
000785f6  mov     r0, r4
000785f8  movs    r3, #4
000785fa  str     r3, [r4, #0x1c]
000785fc  bl      #0x57be4 ; -> ochar_sound
00078600  ldr     r2, [r4]
00078602  movs    r3, #0x80
00078604  mov     r0, r4
00078606  str     r3, [r2, #0x34]
00078608  subs    r3, #0x7d
0007860a  str     r3, [r4, #0x20]
0007860c  mov.w   r3, #0x60000
00078610  str     r3, [r4, #0x1c]
00078612  bl      #0x75d6c ; -> set_proj_vel
00078616  movs    r3, #0x12
00078618  mov     r0, r4
0007861a  str     r3, [r4, #0x48]
0007861c  str     r3, [r4, #0x1c]
0007861e  str     r5, [r4, #0x44]
00078620  str     r5, [r4, #0x40]
00078622  bl      #0x75900 ; -> tell_world_stk
00078626  ldr     r3, [r4]
00078628  str     r5, [r4, #0x1c]
0007862a  mov     r0, r4
0007862c  str     r5, [r3, #0x30]
0007862e  ldr     r3, [r4, #0x1c]
00078630  ldr     r2, [r4]
00078632  str     r3, [r2, #0x2c]
00078634  ldr     r3, [pc, #0x108]
00078636  str     r5, [r4, #0x1c]
00078638  ldr     r2, [r4]
0007863a  add     r3, pc ; -> 0x00172664  rocket_routines
0007863c  ldr     r3, [r3, #8]
0007863e  str     r3, [r2, #0x28]
00078640  ldr.w   r1, [r6, #0xf8]
00078644  ldr     r2, [r4, #0x40]
00078646  lsls    r3, r1, #2
00078648  adds    r3, r3, r6
0007864a  str.w   r2, [r3, #0xa8]
0007864e  adds    r3, r1, #1
00078650  str.w   r3, [r6, #0xf8]
00078654  movs    r3, #5
00078656  str     r3, [r4, #0x40]
00078658  bl      #0x55228 ; -> get_char_ani2
0007865c  ldr     r1, [pc, #0xe4]
0007865e  mov     r0, r4
00078660  add     r1, pc ; -> 0x00078275  t_target
00078662  bl      #0x58b54 ; -> NewThreadProc
00078666  ldr     r3, [r4]
00078668  str     r0, [r3, #0x78]
0007866a  ldr.w   r3, [r6, #0xf8]
0007866e  subs    r3, #1
00078670  str.w   r3, [r6, #0xf8]
00078674  lsls    r3, r3, #2
00078676  adds    r3, r3, r6
00078678  ldr.w   r3, [r3, #0xa8]
0007867c  str     r3, [r4, #0x40]
0007867e  ldr.w   r2, [r6, #0xa4]
00078682  adds    r3, r2, #1
00078684  movs    r0, #1
00078686  movw    r2, #0x1011
0007868a  str.w   r2, [r6, r3, lsl #3]
0007868e  str.w   r0, [r6, #0xfc]
00078692  pop     {r4, r5, r6, r7, pc}
00078694  mvn     r0, #2
00078698  b       #0x78692
0007869a  mov     r0, r4
0007869c  bl      #0x782e0 ; -> point_rocket
000786a0  mov     r0, r4
000786a2  bl      #0x5a680 ; -> next_anirate
000786a6  ldr     r2, [r4]
000786a8  ldr     r3, [r2, #0x28]
000786aa  subs    r3, #1
000786ac  str     r3, [r4, #0x1c]
000786ae  str     r3, [r2, #0x28]
000786b0  ldr     r3, [r4, #0x1c]
000786b2  cbnz    r3, #0x786f0
000786b4  ldr     r2, [r4]
000786b6  ldr.w   r1, [pc, #0x90]
000786ba  ldr     r3, [r2, #0x2c]
000786bc  add     r1, pc ; -> 0x00172664  rocket_routines
000786be  adds    r3, #1
000786c0  str     r3, [r4, #0x1c]
000786c2  str     r3, [r2, #0x2c]
000786c4  ldr     r3, [r4, #0x1c]
000786c6  lsls    r2, r3, #2
000786c8  lsls    r3, r3, #4
000786ca  subs    r3, r3, r2
000786cc  adds    r3, r3, r1
000786ce  ldr     r0, [r3, #8]
000786d0  str     r0, [r4, #0x1c]
000786d2  cbnz    r0, #0x78734
000786d4  ldr.w   r3, [r6, #0xa4]
000786d8  ldr.w   r2, [pc, #0x70]
000786dc  lsls    r3, r3, #3
000786de  adds    r3, r3, r6
000786e0  add     r2, pc ; -> 0x00077ccd  t_rocket_explode
000786e2  str     r2, [r3, #4]
000786e4  ldr.w   r3, [r6, #0xa4]
000786e8  adds    r3, #1
000786ea  str.w   r0, [r6, r3, lsl #3]
000786ee  b       #0x78692
000786f0  ldr     r3, [r4]
000786f2  movw    r2, #0x101f
000786f6  ldr     r3, [r3, #0x2c]
000786f8  str     r3, [r4, #0x1c]
000786fa  ldr.w   r3, [r6, #0xa4]
000786fe  adds    r3, #1
00078700  str.w   r2, [r6, r3, lsl #3]
00078704  ldr.w   r3, [r6, #0xa4]
00078708  adds    r2, r3, #1
0007870a  str.w   r2, [r6, #0xa4]
0007870e  ldr     r0, [r4, #0x1c]
00078710  lsls    r3, r2, #3
00078712  ldr.w   r2, [pc, #0x3c]
00078716  add.w   r1, r3, r6
0007871a  lsls    r3, r0, #2
0007871c  lsls    r0, r0, #4
0007871e  subs    r0, r0, r3
00078720  add     r2, pc ; -> 0x00172664  rocket_routines
00078722  ldr     r0, [r0, r2]
00078724  str     r0, [r1, #4]
00078726  ldr.w   r3, [r6, #0xa4]
0007872a  movs    r0, #0
0007872c  adds    r3, #1
0007872e  str.w   r0, [r6, r3, lsl #3]
00078732  b       #0x78692
00078734  ldr     r3, [r4]
00078736  str     r0, [r3, #0x28]
00078738  ldr.w   r2, [r6, #0xa4]
0007873c  b       #0x78682
0007873e  nop     
00078740  adr     r0, #0x98
00078742  movs    r7, r1
