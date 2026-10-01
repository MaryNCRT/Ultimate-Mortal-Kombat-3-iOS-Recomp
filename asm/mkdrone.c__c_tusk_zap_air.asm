========================================================================
c_tusk_zap_air  0x0006ef24  84 bytes   mkdrone.c
========================================================================

0006ef24  push    {r4, r5, r6, r7, lr}
0006ef26  add     r7, sp, #0xc
0006ef28  ldr.w   r3, [r0, #0xa4]
0006ef2c  mov     r4, r0
0006ef2e  ldr.w   r5, [r0, #0x108]
0006ef32  adds    r3, #1
0006ef34  ldr.w   r6, [r0, r3, lsl #3]
0006ef38  cbnz    r6, #0x6ef62
0006ef3a  mov     r0, r5
0006ef3c  bl      #0x57828 ; -> get_his_dog
0006ef40  ldr     r0, [r5, #0x1c]
0006ef42  cmp     r0, #0x18
0006ef44  bgt     #0x6ef68
0006ef46  ldr     r2, [pc, #0x28]
0006ef48  add     r2, pc ; -> 0x00070309  t_duck_under_proj
0006ef4a  ldr.w   r3, [r4, #0xa4]
0006ef4e  mov     r0, r6
0006ef50  lsls    r3, r3, #3
0006ef52  adds    r3, r3, r4
0006ef54  str     r2, [r3, #4]
0006ef56  ldr.w   r3, [r4, #0xa4]
0006ef5a  adds    r3, #1
0006ef5c  str.w   r6, [r4, r3, lsl #3]
0006ef60  b       #0x6ef66
0006ef62  mvn     r0, #2
0006ef66  pop     {r4, r5, r6, r7, pc}
0006ef68  ldr     r2, [pc, #8]
0006ef6a  add     r2, pc ; -> 0x00067fe1  t_d_zap_now
0006ef6c  b       #0x6ef4a
0006ef6e  nop     
0006ef70  asrs    r5, r7, #0xe
0006ef72  movs    r0, r0
0006ef74  str     r0, [sp, #0x1cc]
