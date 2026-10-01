========================================================================
t_r_pounce  0x00043fb0  264 bytes   mkreact.c
========================================================================

00043fb0  push    {r4, r5, r6, r7, lr}
00043fb2  add     r7, sp, #0xc
00043fb4  str     r8, [sp, #-0x4]!
00043fb8  ldr.w   r2, [r0, #0xa4]
00043fbc  movw    r8, #0x48a
00043fc0  mov     r4, r0
00043fc2  adds    r3, r2, #1
00043fc4  ldr.w   r6, [r0, #0x108]
00043fc8  ldr.w   r5, [r0, r3, lsl #3]
00043fcc  cmp     r5, r8
00043fce  beq     #0x44042
00043fd0  ble     #0x43fea
00043fd2  movw    r3, #0x495
00043fd6  cmp     r5, r3
00043fd8  beq     #0x44082
00043fda  adds    r3, #2
00043fdc  cmp     r5, r3
00043fde  beq     #0x44028
00043fe0  mvn     r0, #2
00043fe4  ldr     r8, [sp], #4
00043fe8  pop     {r4, r5, r6, r7, pc}
00043fea  cmp     r5, #0
00043fec  bne     #0x43fe0
00043fee  movs    r3, #1
00043ff0  mov     r0, r6
00043ff2  str     r3, [r6, #0x34]
00043ff4  bl      #0x41354 ; -> if_shao_then_pass
00043ff8  str     r5, [r6, #0x30]
00043ffa  str     r5, [r6, #0x38]
00043ffc  ldr.w   r3, [r4, #0xa4]
00044000  ldr     r2, [pc, #0xa4]
00044002  mov     r0, r5
00044004  adds    r3, #1
00044006  add     r2, pc ; -> 0x00044b85  t_reaction_start
00044008  str.w   r8, [r4, r3, lsl #3]
0004400c  ldr.w   r3, [r4, #0xa4]
00044010  adds    r3, #1
00044012  str.w   r3, [r4, #0xa4]
00044016  lsls    r3, r3, #3
00044018  adds    r3, r3, r4
0004401a  str     r2, [r3, #4]
0004401c  ldr.w   r3, [r4, #0xa4]
00044020  adds    r3, #1
00044022  str.w   r5, [r4, r3, lsl #3]
00044026  b       #0x43fe4
00044028  ldr.w   r1, [pc, #0x80]
0004402c  add     r1, pc ; -> 0x000446bd  t_pounce4
0004402e  lsls    r3, r2, #3
00044030  adds    r3, r3, r4
00044032  movs    r0, #0
00044034  str     r1, [r3, #4]
00044036  ldr.w   r3, [r4, #0xa4]
0004403a  adds    r3, #1
0004403c  str.w   r0, [r4, r3, lsl #3]
00044040  b       #0x43fe4
00044042  ldr     r2, [r6]
00044044  mov     r0, r6
00044046  movw    r3, #0x30b
0004404a  movs    r5, #2
0004404c  str     r3, [r2, #0x18]
0004404e  str     r5, [r6, #0x1c]
00044050  bl      #0x580a4 ; -> group_sound
00044054  mov     r0, r6
00044056  movs    r3, #0x1e
00044058  str     r3, [r6, #0x40]
0004405a  bl      #0x5520c ; -> get_char_ani
0004405e  str     r5, [r6, #0x1c]
00044060  ldr.w   r3, [r4, #0xa4]
00044064  movw    r2, #0x495
00044068  adds    r3, #1
0004406a  str.w   r2, [r4, r3, lsl #3]
0004406e  ldr.w   r3, [r4, #0xa4]
00044072  adds    r2, r3, #1
00044074  ldr.w   r3, [pc, #0x38]
00044078  str.w   r2, [r4, #0xa4]
0004407c  add     r3, pc ; -> 0x000f37cc  t_mframew
0004407e  ldr     r1, [r3]
00044080  b       #0x4402e
00044082  movs    r3, #2
00044084  str     r3, [r6, #0x1c]
00044086  ldr.w   r3, [r0, #0xa4]
0004408a  movw    r2, #0x497
0004408e  adds    r3, #1
00044090  str.w   r2, [r0, r3, lsl #3]
00044094  ldr.w   r3, [r0, #0xa4]
00044098  adds    r2, r3, #1
0004409a  ldr.w   r3, [pc, #0x18]
0004409e  str.w   r2, [r0, #0xa4]
000440a2  add     r3, pc ; -> 0x000f37cc  t_mframew
000440a4  ldr     r1, [r3]
000440a6  b       #0x4402e
000440a8  lsrs    r3, r7, #0xd
000440aa  movs    r0, r0
000440ac  lsls    r5, r1, #0x1a
000440ae  movs    r0, r0
000440b0  sbfx    r0, ip, #0, #0xb
