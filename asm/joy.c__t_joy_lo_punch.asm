========================================================================
t_joy_lo_punch  0x0002ffd0  144 bytes   joy.c
========================================================================

0002ffd0  push    {r4, r5, r6, r7, lr}
0002ffd2  add     r7, sp, #0xc
0002ffd4  str     r8, [sp, #-0x4]!
0002ffd8  ldr.w   r3, [r0, #0xa4]
0002ffdc  mov     r5, r0
0002ffde  ldr.w   r4, [r0, #0x108]
0002ffe2  adds    r3, #1
0002ffe4  ldr.w   r6, [r0, r3, lsl #3]
0002ffe8  cbnz    r6, #0x30020
0002ffea  mov     r0, r4
0002ffec  bl      #0x55c04 ; -> stop_me_player
0002fff0  mov     r0, r4
0002fff2  bl      #0x2ec68 ; -> disable_all_buttons
0002fff6  movs    r3, #0x40
0002fff8  mov     r0, r4
0002fffa  str     r3, [r4, #0x38]
0002fffc  bl      #0x2ff04 ; -> toss_check
00030000  mov     r8, r0
00030002  cbz     r0, #0x3002a
00030004  ldr.w   r3, [r5, #0xa4]
00030008  ldr     r2, [pc, #0x4c]
0003000a  mov     r0, r6
0003000c  lsls    r3, r3, #3
0003000e  adds    r3, r3, r5
00030010  add     r2, pc ; -> 0x0002f411  t_joy_toss
00030012  str     r2, [r3, #4]
00030014  ldr.w   r3, [r5, #0xa4]
00030018  adds    r3, #1
0003001a  str.w   r6, [r5, r3, lsl #3]
0003001e  b       #0x30024
00030020  mvn     r0, #2
00030024  ldr     r8, [sp], #4
00030028  pop     {r4, r5, r6, r7, pc}
0003002a  mov     r0, r4
0003002c  bl      #0x2ec24 ; -> me_in_front
00030030  mov     r0, r4
00030032  movs    r3, #0xf
00030034  str     r3, [r4, #0x40]
00030036  bl      #0x5520c ; -> get_char_ani
0003003a  ldr.w   r3, [r5, #0xa4]
0003003e  ldr.w   r2, [pc, #0x1c]
00030042  mov     r0, r8
00030044  lsls    r3, r3, #3
00030046  adds    r3, r3, r5
00030048  add     r2, pc ; -> 0x00030a61  t_jmp4
0003004a  str     r2, [r3, #4]
0003004c  ldr.w   r3, [r5, #0xa4]
00030050  adds    r3, #1
00030052  str.w   r8, [r5, r3, lsl #3]
00030056  b       #0x30024
00030058  bl      #0x42e05a
0003005c  lsrs    r5, r2, #8
0003005e  movs    r0, r0
