========================================================================
t_r_tusk_saw  0x000455ac  220 bytes   mkreact.c
========================================================================

000455ac  push    {r4, r5, r7, lr}
000455ae  add     r7, sp, #8
000455b0  ldr.w   r2, [r0, #0xa4]
000455b4  mov     r4, r0
000455b6  ldr.w   r5, [r0, #0x108]
000455ba  adds    r3, r2, #1
000455bc  movw    r1, #0x41f
000455c0  ldr.w   r0, [r0, r3, lsl #3]
000455c4  cmp     r0, r1
000455c6  beq     #0x45624
000455c8  movw    r3, #0x42e
000455cc  cmp     r0, r3
000455ce  beq     #0x45608
000455d0  cbz     r0, #0x455d8
000455d2  mvn     r0, #2
000455d6  pop     {r4, r5, r7, pc}
000455d8  str     r0, [r5, #0x30]
000455da  str     r0, [r5, #0x34]
000455dc  str     r0, [r5, #0x38]
000455de  ldr.w   r3, [r4, #0xa4]
000455e2  ldr     r2, [pc, #0x90]
000455e4  adds    r3, #1
000455e6  add     r2, pc ; -> 0x00044b85  t_reaction_start
000455e8  str.w   r1, [r4, r3, lsl #3]
000455ec  ldr.w   r3, [r4, #0xa4]
000455f0  adds    r3, #1
000455f2  str.w   r3, [r4, #0xa4]
000455f6  lsls    r3, r3, #3
000455f8  adds    r3, r3, r4
000455fa  str     r2, [r3, #4]
000455fc  ldr.w   r3, [r4, #0xa4]
00045600  adds    r3, #1
00045602  str.w   r0, [r4, r3, lsl #3]
00045606  b       #0x455d6
00045608  ldr.w   r3, [pc, #0x6c]
0004560c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0004560e  ldr     r1, [r3]
00045610  lsls    r3, r2, #3
00045612  adds    r3, r3, r4
00045614  movs    r0, #0
00045616  str     r1, [r3, #4]
00045618  ldr.w   r3, [r4, #0xa4]
0004561c  adds    r3, #1
0004561e  str.w   r0, [r4, r3, lsl #3]
00045622  b       #0x455d6
00045624  mov     r0, r5
00045626  movs    r3, #9
00045628  str     r3, [r5, #0x1c]
0004562a  bl      #0x5877c ; -> create_blood_proc
0004562e  mov     r0, r5
00045630  movs    r3, #2
00045632  str     r3, [r5, #0x1c]
00045634  bl      #0x580a4 ; -> group_sound
00045638  mov     r0, r5
0004563a  movs    r3, #0x20
0004563c  str     r3, [r5, #0x40]
0004563e  bl      #0x55474 ; -> find_ani_part2
00045642  ldr.w   r3, [pc, #0x38]
00045646  mov     r0, r5
00045648  str     r3, [r5, #0x48]
0004564a  bl      #0x581e0 ; -> shake_a11
0004564e  ldr.w   r3, [pc, #0x30]
00045652  movw    r2, #0x42e
00045656  str     r3, [r5, #0x1c]
00045658  ldr.w   r3, [r4, #0xa4]
0004565c  adds    r3, #1
0004565e  str.w   r2, [r4, r3, lsl #3]
00045662  ldr.w   r3, [r4, #0xa4]
00045666  adds    r2, r3, #1
00045668  ldr     r3, [pc, #0x18]
0004566a  str.w   r2, [r4, #0xa4]
0004566e  add     r3, pc ; -> 0x000f36b8  t_animate_a0_frames
00045670  b       #0x4560e
00045672  nop     
00045674  bl      #0xffde1676
00045678  b       #0x4586c
0004567a  movs    r2, r1
0004567c  movs    r4, r1
0004567e  movs    r3, r0
00045680  movs    r5, r1
00045682  movs    r4, r0
00045684  b       #0x45714
00045686  movs    r2, r1
