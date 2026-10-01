========================================================================
t_tusk_jup_scan  0x00070758  116 bytes   mkdrone.c
========================================================================

00070758  push    {r4, r5, r6, r7, lr}
0007075a  add     r7, sp, #0xc
0007075c  ldr.w   r3, [r0, #0xa4]
00070760  mov     r4, r0
00070762  ldr.w   r5, [r0, #0x108]
00070766  adds    r3, #1
00070768  ldr.w   r6, [r0, r3, lsl #3]
0007076c  cbnz    r6, #0x7079c
0007076e  mov     r0, r5
00070770  bl      #0x55164 ; -> distance_off_ground
00070774  ldr     r3, [r5, #0x1c]
00070776  cmp     r3, #0x3f
00070778  ble     #0x707a2
0007077a  mov     r0, r4
0007077c  bl      #0x2ebdc ; -> reset_proc_stack
00070780  ldr     r2, [pc, #0x40]
00070782  ldr.w   r3, [r4, #0xa4]
00070786  add     r2, pc ; -> 0x00067fe1  t_d_zap_now
00070788  lsls    r3, r3, #3
0007078a  adds    r3, r3, r4
0007078c  mov     r0, r6
0007078e  str     r2, [r3, #4]
00070790  ldr.w   r3, [r4, #0xa4]
00070794  adds    r3, #1
00070796  str.w   r6, [r4, r3, lsl #3]
0007079a  b       #0x707a0
0007079c  mvn     r0, #2
000707a0  pop     {r4, r5, r6, r7, pc}
000707a2  mov     r0, r5
000707a4  bl      #0x67524 ; -> q_no
000707a8  ldr.w   r3, [r4, #0xa4]
000707ac  cmp     r3, #0
000707ae  ble     #0x707ba
000707b0  subs    r3, #1
000707b2  mov     r0, r6
000707b4  str.w   r3, [r4, #0xa4]
000707b8  b       #0x707a0
000707ba  ldr     r2, [pc, #0xc]
000707bc  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000707be  ldr     r2, [r2]
000707c0  b       #0x70788
000707c2  nop     
000707c4  ldrb    r7, [r2, #1]
