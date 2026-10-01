========================================================================
t_spear0  0x000464d8  216 bytes   mkreact.c
========================================================================

000464d8  push    {r4, r5, r6, r7, lr}
000464da  add     r7, sp, #0xc
000464dc  str     r8, [sp, #-0x4]!
000464e0  ldr.w   r3, [r0, #0xa4]
000464e4  movw    r8, #0x404
000464e8  mov     r4, r0
000464ea  adds    r3, #1
000464ec  ldr.w   r6, [r0, #0x108]
000464f0  ldr.w   r5, [r0, r3, lsl #3]
000464f4  cmp     r5, r8
000464f6  beq     #0x4657c
000464f8  movw    r3, #0x40c
000464fc  cmp     r5, r3
000464fe  beq     #0x4654c
00046500  cbz     r5, #0x4650c
00046502  mvn     r0, #2
00046506  ldr     r8, [sp], #4
0004650a  pop     {r4, r5, r6, r7, pc}
0004650c  mov     r0, r6
0004650e  bl      #0x57b94 ; -> his_ochar_sound
00046512  ldr     r3, [r6]
00046514  movs    r2, #0x1d
00046516  str     r2, [r6, #0x1c]
00046518  mov     r0, r5
0004651a  str     r2, [r3, #0x48]
0004651c  str     r5, [r6, #0x30]
0004651e  str     r5, [r6, #0x34]
00046520  str     r5, [r6, #0x38]
00046522  ldr.w   r3, [r4, #0xa4]
00046526  ldr     r2, [pc, #0x80]
00046528  adds    r3, #1
0004652a  add     r2, pc ; -> 0x00044b85  t_reaction_start
0004652c  str.w   r8, [r4, r3, lsl #3]
00046530  ldr.w   r3, [r4, #0xa4]
00046534  adds    r3, #1
00046536  str.w   r3, [r4, #0xa4]
0004653a  lsls    r3, r3, #3
0004653c  adds    r3, r3, r4
0004653e  str     r2, [r3, #4]
00046540  ldr.w   r3, [r4, #0xa4]
00046544  adds    r3, #1
00046546  str.w   r5, [r4, r3, lsl #3]
0004654a  b       #0x46506
0004654c  ldr     r3, [r6]
0004654e  ldr     r3, [r3]
00046550  ldr     r3, [r3]
00046552  ldr     r3, [r3, #0x18]
00046554  cmp.w   r3, #0x11a
00046558  str     r3, [r6, #0x1c]
0004655a  beq     #0x46590
0004655c  ldr.w   r3, [pc, #0x4c]
00046560  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00046562  ldr     r2, [r3]
00046564  ldr.w   r3, [r0, #0xa4]
00046568  lsls    r3, r3, #3
0004656a  adds    r3, r3, r0
0004656c  str     r2, [r3, #4]
0004656e  ldr.w   r3, [r0, #0xa4]
00046572  movs    r0, #0
00046574  adds    r3, #1
00046576  str.w   r0, [r4, r3, lsl #3]
0004657a  b       #0x46506
0004657c  mov     r0, r6
0004657e  movs    r3, #2
00046580  str     r3, [r6, #0x1c]
00046582  bl      #0x580a4 ; -> group_sound
00046586  mov     r0, r6
00046588  movs    r3, #0xc
0004658a  str     r3, [r6, #0x1c]
0004658c  bl      #0x5877c ; -> create_blood_proc
00046590  ldr.w   r3, [r4, #0xa4]
00046594  movs    r0, #2
00046596  movw    r2, #0x40c
0004659a  adds    r3, #1
0004659c  str.w   r2, [r4, r3, lsl #3]
000465a0  str.w   r0, [r4, #0xfc]
000465a4  b       #0x46506
000465a6  nop     
000465a8  b       #0x4625a
