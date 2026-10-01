========================================================================
t_lao_dog_sounds  0x000a65b0  124 bytes   mkfriend.c
========================================================================

000a65b0  push    {r4, r7, lr}
000a65b2  add     r7, sp, #4
000a65b4  mov     r4, r0
000a65b6  ldr.w   r3, [r4, #0xa4]
000a65ba  movw    ip, #0x446
000a65be  ldr.w   r0, [r0, #0x108]
000a65c2  adds    r1, r3, #1
000a65c4  ldr.w   r3, [r4, r1, lsl #3]
000a65c8  cmp     r3, ip
000a65ca  beq     #0xa660c
000a65cc  movw    r2, #0x44b
000a65d0  cmp     r3, r2
000a65d2  beq     #0xa65e8
000a65d4  cbz     r3, #0xa65dc
000a65d6  mvn     r0, #2
000a65da  pop     {r4, r7, pc}
000a65dc  movs    r0, #8
000a65de  str.w   ip, [r4, r1, lsl #3]
000a65e2  str.w   r0, [r4, #0xfc]
000a65e6  b       #0xa65da
000a65e8  ldr     r3, [r0, #0x44]
000a65ea  subs    r3, #1
000a65ec  str     r3, [r0, #0x44]
000a65ee  cbz     r3, #0xa6612
000a65f0  movs    r1, #0x8a
000a65f2  bl      #0x57dd0 ; -> tsound_func
000a65f6  ldr.w   r3, [r4, #0xa4]
000a65fa  movs    r0, #0x10
000a65fc  movw    r2, #0x44b
000a6600  adds    r3, #1
000a6602  str.w   r2, [r4, r3, lsl #3]
000a6606  str.w   r0, [r4, #0xfc]
000a660a  b       #0xa65da
000a660c  movs    r3, #5
000a660e  str     r3, [r0, #0x44]
000a6610  b       #0xa65f0
000a6612  ldr.w   r3, [r4, #0xa4]
000a6616  ldr     r0, [pc, #0x10]
000a6618  movw    r2, #0x44f
000a661c  adds    r3, #1
000a661e  str.w   r2, [r4, r3, lsl #3]
000a6622  str.w   r0, [r4, #0xfc]
000a6626  b       #0xa65da
000a6628  str     r2, [r4, #0x44]
000a662a  movs    r1, r0
