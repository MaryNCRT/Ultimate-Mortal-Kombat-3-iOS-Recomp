========================================================================
t_joy_hi_kick  0x0002fe34  208 bytes   joy.c
========================================================================

0002fe34  push    {r4, r5, r6, r7, lr}
0002fe36  add     r7, sp, #0xc
0002fe38  str     r8, [sp, #-0x4]!
0002fe3c  ldr.w   r2, [r0, #0xa4]
0002fe40  movw    r8, #0x21a
0002fe44  mov     r4, r0
0002fe46  adds    r3, r2, #1
0002fe48  ldr.w   r6, [r0, #0x108]
0002fe4c  ldr.w   r5, [r0, r3, lsl #3]
0002fe50  cmp     r5, r8
0002fe52  beq     #0x2feac
0002fe54  movw    r3, #0x21e
0002fe58  cmp     r5, r3
0002fe5a  beq     #0x2fe92
0002fe5c  cbz     r5, #0x2fe68
0002fe5e  mvn     r0, #2
0002fe62  ldr     r8, [sp], #4
0002fe66  pop     {r4, r5, r6, r7, pc}
0002fe68  mov     r0, r6
0002fe6a  bl      #0x2ec68 ; -> disable_all_buttons
0002fe6e  mov     r0, r6
0002fe70  bl      #0x55df0 ; -> is_stick_away
0002fe74  cbz     r0, #0x2fec8
0002fe76  ldr.w   r3, [r4, #0xa4]
0002fe7a  ldr     r2, [pc, #0x78]
0002fe7c  mov     r0, r5
0002fe7e  lsls    r3, r3, #3
0002fe80  adds    r3, r3, r4
0002fe82  add     r2, pc ; -> 0x0002f149  t_joy_roundhouse
0002fe84  str     r2, [r3, #4]
0002fe86  ldr.w   r3, [r4, #0xa4]
0002fe8a  adds    r3, #1
0002fe8c  str.w   r5, [r4, r3, lsl #3]
0002fe90  b       #0x2fe62
0002fe92  ldr.w   r1, [pc, #0x64]
0002fe96  add     r1, pc ; -> 0x00030061  t_local_reaction_exit
0002fe98  lsls    r3, r2, #3
0002fe9a  adds    r3, r3, r4
0002fe9c  movs    r0, #0
0002fe9e  str     r1, [r3, #4]
0002fea0  ldr.w   r3, [r4, #0xa4]
0002fea4  adds    r3, #1
0002fea6  str.w   r0, [r4, r3, lsl #3]
0002feaa  b       #0x2fe62
0002feac  movw    r2, #0x21e
0002feb0  str.w   r2, [r0, r3, lsl #3]
0002feb4  ldr.w   r3, [r0, #0xa4]
0002feb8  adds    r2, r3, #1
0002feba  ldr.w   r3, [pc, #0x40]
0002febe  str.w   r2, [r0, #0xa4]
0002fec2  add     r3, pc ; -> 0x000f38c4  t_stat_do_hi_kick
0002fec4  ldr     r1, [r3]
0002fec6  b       #0x2fe98
0002fec8  ldr.w   r3, [r4, #0xa4]
0002fecc  ldr     r2, [pc, #0x30]
0002fece  adds    r3, #1
0002fed0  add     r2, pc ; -> 0x0002f9d5  t_knee_check
0002fed2  str.w   r8, [r4, r3, lsl #3]
0002fed6  ldr.w   r3, [r4, #0xa4]
0002feda  adds    r3, #1
0002fedc  str.w   r3, [r4, #0xa4]
0002fee0  lsls    r3, r3, #3
0002fee2  adds    r3, r3, r4
0002fee4  str     r2, [r3, #4]
0002fee6  ldr.w   r3, [r4, #0xa4]
0002feea  adds    r3, #1
0002feec  str.w   r0, [r4, r3, lsl #3]
0002fef0  b       #0x2fe62
0002fef2  nop     
0002fef4  bl      #0x2f3ef6
0002fef8  lsls    r7, r0, #7
0002fefa  movs    r0, r0
0002fefc  subs    r1, #0xfe
0002fefe  movs    r4, r1
