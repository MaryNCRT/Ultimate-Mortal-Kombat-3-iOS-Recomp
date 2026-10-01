========================================================================
t_r_mileena_roll  0x00046f4c  248 bytes   mkreact.c
========================================================================

00046f4c  push    {r4, r5, r7, lr}
00046f4e  add     r7, sp, #8
00046f50  ldr.w   r2, [r0, #0xa4]
00046f54  mov     r4, r0
00046f56  ldr.w   r5, [r0, #0x108]
00046f5a  adds    r3, r2, #1
00046f5c  movw    r1, #0x2d6
00046f60  ldr.w   r0, [r0, r3, lsl #3]
00046f64  cmp     r0, r1
00046f66  beq     #0x46fce
00046f68  movw    r3, #0x2e2
00046f6c  cmp     r0, r3
00046f6e  beq     #0x46fb4
00046f70  cbz     r0, #0x46f78
00046f72  mvn     r0, #2
00046f76  pop     {r4, r5, r7, pc}
00046f78  ldr     r3, [r5]
00046f7a  movw    r2, #0x219
00046f7e  str     r2, [r5, #0x20]
00046f80  str     r2, [r3, #0x48]
00046f82  str     r0, [r5, #0x30]
00046f84  str     r0, [r5, #0x38]
00046f86  movs    r3, #1
00046f88  str     r3, [r5, #0x34]
00046f8a  ldr.w   r3, [r4, #0xa4]
00046f8e  ldr     r2, [pc, #0xa4]
00046f90  adds    r3, #1
00046f92  add     r2, pc ; -> 0x00044b85  t_reaction_start
00046f94  str.w   r1, [r4, r3, lsl #3]
00046f98  ldr.w   r3, [r4, #0xa4]
00046f9c  adds    r3, #1
00046f9e  str.w   r3, [r4, #0xa4]
00046fa2  lsls    r3, r3, #3
00046fa4  adds    r3, r3, r4
00046fa6  str     r2, [r3, #4]
00046fa8  ldr.w   r3, [r4, #0xa4]
00046fac  adds    r3, #1
00046fae  str.w   r0, [r4, r3, lsl #3]
00046fb2  b       #0x46f76
00046fb4  ldr.w   r1, [pc, #0x80]
00046fb8  lsls    r3, r2, #3
00046fba  adds    r3, r3, r4
00046fbc  add     r1, pc ; -> 0x00042519  t_land_on_my_back
00046fbe  str     r1, [r3, #4]
00046fc0  ldr.w   r3, [r4, #0xa4]
00046fc4  movs    r0, #0
00046fc6  adds    r3, #1
00046fc8  str.w   r0, [r4, r3, lsl #3]
00046fcc  b       #0x46f76
00046fce  mov     r0, r5
00046fd0  bl      #0x420e4 ; -> rsnd_react_voice
00046fd4  mov     r0, r5
00046fd6  bl      #0x54f40 ; -> set_half_damage
00046fda  mov     r0, r5
00046fdc  movs    r1, #0xa
00046fde  bl      #0x57dbc ; -> rsnd_func
00046fe2  ldr.w   r3, [pc, #0x58]
00046fe6  movs    r0, #0
00046fe8  str     r0, [r5, #0x34]
00046fea  movw    r2, #0x2e2
00046fee  str     r3, [r5, #0x1c]
00046ff0  sub.w   r3, r3, #0x48000
00046ff4  str     r3, [r5, #0x20]
00046ff6  add.w   r3, r3, #0x86000
00046ffa  str     r3, [r5, #0x24]
00046ffc  movs    r3, #4
00046ffe  str     r3, [r5, #0x28]
00047000  adds    r3, #0x3f
00047002  str     r3, [r5, #0x40]
00047004  ldr.w   r3, [r4, #0xa4]
00047008  adds    r3, #1
0004700a  str.w   r2, [r4, r3, lsl #3]
0004700e  ldr.w   r3, [r4, #0xa4]
00047012  adds    r2, r3, #1
00047014  ldr.w   r3, [pc, #0x28]
00047018  str.w   r2, [r4, #0xa4]
0004701c  add     r3, pc ; -> 0x000f3720  t_flight
0004701e  ldr     r1, [r3]
00047020  lsls    r3, r2, #3
00047022  adds    r3, r3, r4
00047024  str     r1, [r3, #4]
00047026  ldr.w   r3, [r4, #0xa4]
0004702a  adds    r3, #1
0004702c  str.w   r0, [r4, r3, lsl #3]
00047030  b       #0x46f76
00047032  nop     
00047034  blt     #0x47016
