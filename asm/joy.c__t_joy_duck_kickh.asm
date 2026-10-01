========================================================================
t_joy_duck_kickh  0x0002ee78  232 bytes   joy.c
========================================================================

0002ee78  ldr.w   r3, [r0, #0xa4]
0002ee7c  ldr.w   r1, [r0, #0x108]
0002ee80  adds    r2, r3, #1
0002ee82  ldr.w   r3, [r0, r2, lsl #3]
0002ee86  cmp.w   r3, #0x194
0002ee8a  beq     #0x2eefc
0002ee8c  ble     #0x2eea0
0002ee8e  cmp.w   r3, #0x19c
0002ee92  beq     #0x2ef28
0002ee94  cmp.w   r3, #0x19e
0002ee98  beq     #0x2eed4
0002ee9a  mvn     r0, #2
0002ee9e  bx      lr
0002eea0  cmp     r3, #0
0002eea2  bne     #0x2ee9a
0002eea4  mov.w   r1, #0x194
0002eea8  str.w   r1, [r0, r2, lsl #3]
0002eeac  ldr.w   r2, [r0, #0xa4]
0002eeb0  adds    r1, r2, #1
0002eeb2  ldr     r2, [pc, #0xa0]
0002eeb4  str.w   r1, [r0, #0xa4]
0002eeb8  add     r2, pc ; -> 0x000f3894  t_stat_do_duck_kickh
0002eeba  ldr.w   ip, [r2]
0002eebe  lsls    r2, r1, #3
0002eec0  adds    r2, r2, r0
0002eec2  str.w   ip, [r2, #4]
0002eec6  ldr.w   r2, [r0, #0xa4]
0002eeca  adds    r2, #1
0002eecc  str.w   r3, [r0, r2, lsl #3]
0002eed0  mov     r0, r3
0002eed2  b       #0x2ee9e
0002eed4  ldr     r2, [r1]
0002eed6  ldr     r3, [r2, #0x14]
0002eed8  adds    r3, #0x26
0002eeda  str     r3, [r1, #0x1c]
0002eedc  str     r3, [r2, #0x14]
0002eede  ldr.w   r3, [r0, #0xa4]
0002eee2  ldr     r2, [pc, #0x74]
0002eee4  lsls    r3, r3, #3
0002eee6  adds    r3, r3, r0
0002eee8  add     r2, pc ; -> 0x000302d5  t_post_joy_duck_kick
0002eeea  str     r2, [r3, #4]
0002eeec  ldr.w   r3, [r0, #0xa4]
0002eef0  adds    r2, r3, #1
0002eef2  movs    r3, #0
0002eef4  str.w   r3, [r0, r2, lsl #3]
0002eef8  mov     r0, r3
0002eefa  b       #0x2ee9e
0002eefc  ldr     r2, [r1]
0002eefe  movw    r3, #0x60b
0002ef02  str     r3, [r2, #0x18]
0002ef04  movs    r3, #8
0002ef06  str     r3, [r1, #0x1c]
0002ef08  ldr     r3, [r1, #0x5c]
0002ef0a  cbz     r3, #0x2ef10
0002ef0c  movs    r3, #0x10
0002ef0e  str     r3, [r1, #0x1c]
0002ef10  ldr.w   r3, [r0, #0xa4]
0002ef14  mov.w   r2, #0x19c
0002ef18  adds    r3, #1
0002ef1a  str.w   r2, [r0, r3, lsl #3]
0002ef1e  ldr     r3, [r1, #0x1c]
0002ef20  str.w   r3, [r0, #0xfc]
0002ef24  ldr     r0, [r1, #0x1c]
0002ef26  b       #0x2ee9e
0002ef28  movs    r3, #4
0002ef2a  str     r3, [r1, #0x1c]
0002ef2c  ldr.w   r3, [r0, #0xa4]
0002ef30  mov.w   r2, #0x19e
0002ef34  adds    r3, #1
0002ef36  str.w   r2, [r0, r3, lsl #3]
0002ef3a  ldr.w   r3, [r0, #0xa4]
0002ef3e  adds    r2, r3, #1
0002ef40  ldr.w   r3, [pc, #0x18]
0002ef44  str.w   r2, [r0, #0xa4]
0002ef48  add     r3, pc ; -> 0x000f38c8  t_retract_strike
0002ef4a  ldr     r1, [r3]
0002ef4c  lsls    r3, r2, #3
0002ef4e  adds    r3, r3, r0
0002ef50  str     r1, [r3, #4]
0002ef52  b       #0x2eeec
0002ef54  ldr     r1, [pc, #0x360]
0002ef56  movs    r4, r1
0002ef58  asrs    r1, r5, #0xf
0002ef5a  movs    r0, r0
0002ef5c  ldr     r1, [pc, #0x1f0]
0002ef5e  movs    r4, r1
