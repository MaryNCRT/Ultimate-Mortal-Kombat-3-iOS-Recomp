========================================================================
t_rek3  0x00045878  256 bytes   mkreact.c
========================================================================

00045878  push    {r4, r5, r6, r7, lr}
0004587a  add     r7, sp, #0xc
0004587c  str     r8, [sp, #-0x4]!
00045880  ldr.w   r3, [r0, #0xa4]
00045884  movw    r8, #0xda5
00045888  mov     r4, r0
0004588a  adds    r2, r3, #1
0004588c  ldr.w   r5, [r0, #0x108]
00045890  ldr.w   r6, [r0, r2, lsl #3]
00045894  cmp     r6, r8
00045896  beq     #0x4592c
00045898  movw    r3, #0xdab
0004589c  cmp     r6, r3
0004589e  beq     #0x45900
000458a0  cbz     r6, #0x458ac
000458a2  mvn     r0, #2
000458a6  ldr     r8, [sp], #4
000458aa  pop     {r4, r5, r6, r7, pc}
000458ac  mov     r0, r5
000458ae  movs    r3, #4
000458b0  str     r3, [r5, #0x1c]
000458b2  bl      #0x5877c ; -> create_blood_proc
000458b6  mov     r0, r5
000458b8  bl      #0x420e4 ; -> rsnd_react_voice
000458bc  mov     r0, r5
000458be  mov.w   r3, #0x40004
000458c2  str     r3, [r5, #0x48]
000458c4  bl      #0x581e0 ; -> shake_a11
000458c8  ldr     r3, [pc, #0x98]
000458ca  str     r6, [r5, #0x38]
000458cc  ldr     r2, [pc, #0x98]
000458ce  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
000458d0  str     r3, [r5, #0x30]
000458d2  movs    r3, #1
000458d4  str     r3, [r5, #0x34]
000458d6  ldr.w   r3, [r4, #0xa4]
000458da  add     r2, pc ; -> 0x00044b85  t_reaction_start
000458dc  mov     r0, r6
000458de  adds    r3, #1
000458e0  str.w   r8, [r4, r3, lsl #3]
000458e4  ldr.w   r3, [r4, #0xa4]
000458e8  adds    r3, #1
000458ea  str.w   r3, [r4, #0xa4]
000458ee  lsls    r3, r3, #3
000458f0  adds    r3, r3, r4
000458f2  str     r2, [r3, #4]
000458f4  ldr.w   r3, [r4, #0xa4]
000458f8  adds    r3, #1
000458fa  str.w   r6, [r4, r3, lsl #3]
000458fe  b       #0x458a6
00045900  movw    r3, #0xdac
00045904  str.w   r3, [r0, r2, lsl #3]
00045908  ldr.w   r3, [r0, #0xa4]
0004590c  adds    r2, r3, #1
0004590e  ldr     r3, [pc, #0x5c]
00045910  str.w   r2, [r0, #0xa4]
00045914  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00045916  ldr     r1, [r3]
00045918  lsls    r3, r2, #3
0004591a  adds    r3, r3, r4
0004591c  movs    r0, #0
0004591e  str     r1, [r3, #4]
00045920  ldr.w   r3, [r4, #0xa4]
00045924  adds    r3, #1
00045926  str.w   r0, [r4, r3, lsl #3]
0004592a  b       #0x458a6
0004592c  mov     r0, r5
0004592e  bl      #0x54f20 ; -> set_no_block
00045932  mov     r0, r5
00045934  mov.w   r3, #0x10000
00045938  str     r3, [r5, #0x1c]
0004593a  bl      #0x55ab0 ; -> away_x_vel
0004593e  ldr.w   r3, [pc, #0x30]
00045942  movw    r2, #0xdab
00045946  str     r3, [r5, #0x40]
00045948  ldr.w   r3, [r4, #0xa4]
0004594c  adds    r3, #1
0004594e  str.w   r2, [r4, r3, lsl #3]
00045952  ldr.w   r3, [r4, #0xa4]
00045956  adds    r2, r3, #1
00045958  ldr     r3, [pc, #0x18]
0004595a  str.w   r2, [r4, #0xa4]
0004595e  add     r3, pc ; -> 0x000f36d0  t_animate_a9
00045960  b       #0x45916
00045962  nop     
00045964  ldm     r7!, {r0, r1, r2, r3, r4, r5, r6}
