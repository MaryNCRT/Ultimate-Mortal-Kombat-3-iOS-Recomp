========================================================================
t_walk_flip_check  0x0002fb88  212 bytes   joy.c
========================================================================

0002fb88  push    {r4, r7, lr}
0002fb8a  add     r7, sp, #4
0002fb8c  mov     r4, r0
0002fb8e  ldr.w   r2, [r4, #0xa4]
0002fb92  ldr.w   r0, [r0, #0x108]
0002fb96  adds    r3, r2, #1
0002fb98  ldr.w   r3, [r4, r3, lsl #3]
0002fb9c  cmp.w   r3, #0x114
0002fba0  beq     #0x2fc12
0002fba2  cmp.w   r3, #0x116
0002fba6  beq     #0x2fc04
0002fba8  cbz     r3, #0x2fbb0
0002fbaa  mvn     r0, #2
0002fbae  pop     {r4, r7, pc}
0002fbb0  bl      #0x551f0 ; -> am_i_facing_him
0002fbb4  cbnz    r0, #0x2fc00
0002fbb6  ldr.w   r3, [r4, #0xa4]
0002fbba  cmp     r3, #0
0002fbbc  ble     #0x2fc34
0002fbbe  subs    r3, #1
0002fbc0  str.w   r3, [r4, #0xa4]
0002fbc4  ldr.w   r1, [r4, #0xa4]
0002fbc8  adds    r3, r1, #1
0002fbca  lsls    r2, r3, #3
0002fbcc  adds    r2, r2, r4
0002fbce  ldr     r0, [r2, #4]
0002fbd0  adds    r2, r3, #1
0002fbd2  ldr.w   r2, [r4, r2, lsl #3]
0002fbd6  str.w   r2, [r4, r3, lsl #3]
0002fbda  lsls    r3, r1, #3
0002fbdc  adds    r3, r3, r4
0002fbde  mov.w   r2, #0x114
0002fbe2  str     r0, [r3, #4]
0002fbe4  ldr.w   r3, [r4, #0xa4]
0002fbe8  adds    r3, #1
0002fbea  str.w   r2, [r4, r3, lsl #3]
0002fbee  ldr.w   r3, [r4, #0xa4]
0002fbf2  adds    r2, r3, #1
0002fbf4  ldr     r3, [pc, #0x54]
0002fbf6  str.w   r2, [r4, #0xa4]
0002fbfa  add     r3, pc ; -> 0x000f3844  t_turn_around
0002fbfc  ldr     r1, [r3]
0002fbfe  b       #0x2fc18
0002fc00  ldr.w   r2, [r4, #0xa4]
0002fc04  cmp     r2, #0
0002fc06  ble     #0x2fc2c
0002fc08  subs    r3, r2, #1
0002fc0a  movs    r0, #0
0002fc0c  str.w   r3, [r4, #0xa4]
0002fc10  b       #0x2fbae
0002fc12  ldr.w   r1, [pc, #0x3c]
0002fc16  add     r1, pc ; -> 0x00030061  t_local_reaction_exit
0002fc18  lsls    r3, r2, #3
0002fc1a  adds    r3, r3, r4
0002fc1c  movs    r0, #0
0002fc1e  str     r1, [r3, #4]
0002fc20  ldr.w   r3, [r4, #0xa4]
0002fc24  adds    r3, #1
0002fc26  str.w   r0, [r4, r3, lsl #3]
0002fc2a  b       #0x2fbae
0002fc2c  ldr.w   r1, [pc, #0x24]
0002fc30  add     r1, pc ; -> 0x00030061  t_local_reaction_exit
0002fc32  b       #0x2fc18
0002fc34  ldr.w   r2, [pc, #0x20]
0002fc38  lsls    r3, r3, #3
0002fc3a  adds    r3, r3, r4
0002fc3c  add     r2, pc ; -> 0x00030061  t_local_reaction_exit
0002fc3e  str     r2, [r3, #4]
0002fc40  ldr.w   r3, [r4, #0xa4]
0002fc44  adds    r3, #1
0002fc46  str.w   r0, [r4, r3, lsl #3]
0002fc4a  b       #0x2fbc4
0002fc4c  subs    r4, #0x46
0002fc4e  movs    r4, r1
0002fc50  lsls    r7, r0, #0x11
0002fc52  movs    r0, r0
0002fc54  lsls    r5, r5, #0x10
0002fc56  movs    r0, r0
0002fc58  lsls    r1, r4, #0x10
0002fc5a  movs    r0, r0
