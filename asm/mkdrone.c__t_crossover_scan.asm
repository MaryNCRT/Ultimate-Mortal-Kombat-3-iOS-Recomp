========================================================================
t_crossover_scan  0x00068640  132 bytes   mkdrone.c
========================================================================

00068640  push    {r4, lr}
00068642  ldr.w   r3, [r0, #0xa4]
00068646  ldr.w   r2, [r0, #0x108]
0006864a  adds    r3, #1
0006864c  ldr.w   r4, [r0, r3, lsl #3]
00068650  cbz     r4, #0x68658
00068652  mvn     r0, #2
00068656  pop     {r4, pc}
00068658  ldr.w   ip, [r2, #8]
0006865c  ldr     r3, [r2]
0006865e  ldrsh.w lr, [ip, #0xe]
00068662  str.w   lr, [r2, #0x20]
00068666  ldr     r3, [r3, #4]
00068668  ldrsh.w r1, [r3, #0xe]
0006866c  str     r1, [r2, #0x24]
0006866e  ldr.w   r3, [ip, #0x18]
00068672  cmp     r3, #0
00068674  str     r3, [r2, #0x28]
00068676  itt     le
00068678  strle   r1, [r2, #0x20]
0006867a  strle.w lr, [r2, #0x24]
0006867e  ldr     r1, [r2, #0x20]
00068680  ldr     r3, [r2, #0x24]
00068682  cmp     r1, r3
00068684  bge     #0x68698
00068686  ldr.w   r3, [r0, #0xa4]
0006868a  cmp     r3, #0
0006868c  ble     #0x686b4
0006868e  subs    r3, #1
00068690  str.w   r3, [r0, #0xa4]
00068694  mov     r0, r4
00068696  b       #0x68656
00068698  ldr     r2, [pc, #0x20]
0006869a  ldr.w   r3, [r0, #0xa4]
0006869e  add     r2, pc ; -> 0x00070409  t_scan_flip_kick
000686a0  lsls    r3, r3, #3
000686a2  adds    r3, r3, r0
000686a4  str     r2, [r3, #4]
000686a6  ldr.w   r3, [r0, #0xa4]
000686aa  adds    r3, #1
000686ac  str.w   r4, [r0, r3, lsl #3]
000686b0  mov     r0, r4
000686b2  b       #0x68656
000686b4  ldr     r2, [pc, #8]
000686b6  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000686b8  ldr     r2, [r2]
000686ba  b       #0x686a0
000686bc  ldrb    r7, [r4, #0x15]
000686be  movs    r0, r0
000686c0  add     sp, #0x138
000686c2  movs    r0, r1
