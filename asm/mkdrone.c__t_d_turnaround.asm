========================================================================
t_d_turnaround  0x00070674  116 bytes   mkdrone.c
========================================================================

00070674  push    {r4, r7, lr}
00070676  add     r7, sp, #4
00070678  ldr.w   r3, [r0, #0xa4]
0007067c  mov     r4, r0
0007067e  adds    r3, #1
00070680  ldr.w   r0, [r0, r3, lsl #3]
00070684  cbnz    r0, #0x706ae
00070686  movw    r2, #0x1bf
0007068a  str.w   r2, [r4, r3, lsl #3]
0007068e  ldr.w   r3, [r4, #0xa4]
00070692  ldr     r2, [pc, #0x4c]
00070694  adds    r3, #1
00070696  str.w   r3, [r4, #0xa4]
0007069a  lsls    r3, r3, #3
0007069c  adds    r3, r3, r4
0007069e  add     r2, pc ; -> 0x000716d9  t_d_turnaround_jsrp
000706a0  str     r2, [r3, #4]
000706a2  ldr.w   r3, [r4, #0xa4]
000706a6  adds    r3, #1
000706a8  str.w   r0, [r4, r3, lsl #3]
000706ac  pop     {r4, r7, pc}
000706ae  movw    r3, #0x1bf
000706b2  cmp     r0, r3
000706b4  it      ne
000706b6  mvnne   r0, #2
000706ba  bne     #0x706ac
000706bc  mov     r0, r4
000706be  bl      #0x2ebdc ; -> reset_proc_stack
000706c2  ldr     r3, [pc, #0x20]
000706c4  movs    r0, #0
000706c6  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000706c8  ldr     r2, [r3]
000706ca  ldr.w   r3, [r4, #0xa4]
000706ce  lsls    r3, r3, #3
000706d0  adds    r3, r3, r4
000706d2  str     r2, [r3, #4]
000706d4  ldr.w   r3, [r4, #0xa4]
000706d8  adds    r3, #1
000706da  str.w   r0, [r4, r3, lsl #3]
000706de  b       #0x706ac
000706e0  asrs    r7, r6, #0x20
000706e2  movs    r0, r0
000706e4  adds    r0, #0x3e
000706e6  movs    r0, r1
