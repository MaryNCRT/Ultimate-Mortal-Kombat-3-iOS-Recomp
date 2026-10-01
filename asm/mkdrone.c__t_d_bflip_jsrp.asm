========================================================================
t_d_bflip_jsrp  0x00071250  96 bytes   mkdrone.c
========================================================================

00071250  push    {r4, r5, r6, r7, lr}
00071252  add     r7, sp, #0xc
00071254  ldr.w   r3, [r0, #0xa4]
00071258  mov     r4, r0
0007125a  ldr.w   r5, [r0, #0x108]
0007125e  adds    r3, #1
00071260  ldr.w   r6, [r0, r3, lsl #3]
00071264  cbnz    r6, #0x71294
00071266  mov     r0, r5
00071268  bl      #0x70f44 ; -> d_behind_me_a5
0007126c  ldr     r3, [r5, #0x30]
0007126e  cmp     r3, #0x6f
00071270  ble     #0x7129a
00071272  mov     r0, r5
00071274  bl      #0x70c6c ; -> backflip_setup
00071278  ldr     r2, [pc, #0x2c]
0007127a  add     r2, pc ; -> 0x00068209  t_d_bflip_noscan_jsrp
0007127c  ldr.w   r3, [r4, #0xa4]
00071280  mov     r0, r6
00071282  lsls    r3, r3, #3
00071284  adds    r3, r3, r4
00071286  str     r2, [r3, #4]
00071288  ldr.w   r3, [r4, #0xa4]
0007128c  adds    r3, #1
0007128e  str.w   r6, [r4, r3, lsl #3]
00071292  b       #0x71298
00071294  mvn     r0, #2
00071298  pop     {r4, r5, r6, r7, pc}
0007129a  mov     r0, r4
0007129c  bl      #0x2ebdc ; -> reset_proc_stack
000712a0  ldr     r2, [pc, #8]
000712a2  add     r2, pc ; -> 0x000711a5  t_d_attack
000712a4  b       #0x7127c
000712a6  nop     
000712a8  ldr     r3, [r1, #0x78]
