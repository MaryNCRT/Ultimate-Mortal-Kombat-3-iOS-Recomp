========================================================================
t_fflip_watchout  0x000705fc  120 bytes   mkdrone.c
========================================================================

000705fc  push    {r4, r5, r6, r7, lr}
000705fe  add     r7, sp, #0xc
00070600  ldr.w   r3, [r0, #0xa4]
00070604  mov     r4, r0
00070606  ldr.w   r6, [r0, #0x108]
0007060a  adds    r3, #1
0007060c  ldr.w   r5, [r0, r3, lsl #3]
00070610  cbnz    r5, #0x7061e
00070612  mov     r0, r6
00070614  bl      #0x2f3a0 ; -> get_x_dist
00070618  ldr     r3, [r6, #0x28]
0007061a  cmp     r3, #0xa0
0007061c  ble     #0x70624
0007061e  mvn     r0, #2
00070622  pop     {r4, r5, r6, r7, pc}
00070624  mov     r0, r4
00070626  bl      #0x2ebdc ; -> reset_proc_stack
0007062a  mov     r0, r6
0007062c  bl      #0x55060 ; -> is_he_airborn
00070630  ldr     r0, [r6, #0x5c]
00070632  cbz     r0, #0x70650
00070634  ldr.w   r3, [r4, #0xa4]
00070638  ldr     r2, [pc, #0x30]
0007063a  mov     r0, r5
0007063c  lsls    r3, r3, #3
0007063e  adds    r3, r3, r4
00070640  add     r2, pc ; -> 0x00068335  t_watch_flip_punch
00070642  str     r2, [r3, #4]
00070644  ldr.w   r3, [r4, #0xa4]
00070648  adds    r3, #1
0007064a  str.w   r5, [r4, r3, lsl #3]
0007064e  b       #0x70622
00070650  ldr.w   r3, [r4, #0xa4]
00070654  ldr.w   r2, [pc, #0x18]
00070658  lsls    r3, r3, #3
0007065a  adds    r3, r3, r4
0007065c  add     r2, pc ; -> 0x000683a5  t_watch_flip_kick
0007065e  str     r2, [r3, #4]
00070660  ldr.w   r3, [r4, #0xa4]
00070664  adds    r3, #1
00070666  str.w   r0, [r4, r3, lsl #3]
0007066a  b       #0x70622
0007066c  ldrb    r1, [r6, #0x13]
