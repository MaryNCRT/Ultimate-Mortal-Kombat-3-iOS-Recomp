========================================================================
t_fflip_scan  0x0006e754  104 bytes   mkdrone.c
========================================================================

0006e754  push    {r4, r5, r6, r7, lr}
0006e756  add     r7, sp, #0xc
0006e758  ldr.w   r3, [r0, #0xa4]
0006e75c  mov     r4, r0
0006e75e  ldr.w   r5, [r0, #0x108]
0006e762  adds    r3, #1
0006e764  ldr.w   r6, [r0, r3, lsl #3]
0006e768  cbnz    r6, #0x6e792
0006e76a  mov     r0, r5
0006e76c  bl      #0x2f3a0 ; -> get_x_dist
0006e770  ldr     r0, [r5, #0x28]
0006e772  cmp     r0, #0x6f
0006e774  bgt     #0x6e798
0006e776  ldr     r2, [pc, #0x3c]
0006e778  ldr.w   r3, [r4, #0xa4]
0006e77c  add     r2, pc ; -> 0x00070409  t_scan_flip_kick
0006e77e  lsls    r3, r3, #3
0006e780  adds    r3, r3, r4
0006e782  mov     r0, r6
0006e784  str     r2, [r3, #4]
0006e786  ldr.w   r3, [r4, #0xa4]
0006e78a  adds    r3, #1
0006e78c  str.w   r6, [r4, r3, lsl #3]
0006e790  b       #0x6e796
0006e792  mvn     r0, #2
0006e796  pop     {r4, r5, r6, r7, pc}
0006e798  ldr.w   r3, [r4, #0xa4]
0006e79c  cmp     r3, #0
0006e79e  ble     #0x6e7aa
0006e7a0  subs    r3, #1
0006e7a2  mov     r0, r6
0006e7a4  str.w   r3, [r4, #0xa4]
0006e7a8  b       #0x6e796
0006e7aa  ldr     r2, [pc, #0xc]
0006e7ac  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006e7ae  ldr     r2, [r2]
0006e7b0  b       #0x6e77e
0006e7b2  nop     
0006e7b4  adds    r1, r1, #2
0006e7b6  movs    r0, r0
0006e7b8  ldr     r7, [pc, #0x160]
0006e7ba  movs    r0, r1
