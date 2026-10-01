========================================================================
t_r_scorp_tele  0x00046ea0  172 bytes   mkreact.c
========================================================================

00046ea0  push    {r4, r5, r6, r7, lr}
00046ea2  add     r7, sp, #0xc
00046ea4  ldr.w   r3, [r0, #0xa4]
00046ea8  mov     r5, r0
00046eaa  ldr.w   r4, [r0, #0x108]
00046eae  adds    r3, #1
00046eb0  ldr.w   r6, [r0, r3, lsl #3]
00046eb4  cmp     r6, #0
00046eb6  bne     #0x46f00
00046eb8  mov     r0, r4
00046eba  movs    r1, #0xa
00046ebc  bl      #0x57dbc ; -> rsnd_func
00046ec0  mov     r0, r4
00046ec2  bl      #0x54f40 ; -> set_half_damage
00046ec6  ldr     r3, [pc, #0x78]
00046ec8  str     r6, [r4, #0x34]
00046eca  str     r6, [r4, #0x38]
00046ecc  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
00046ece  str     r3, [r4, #0x30]
00046ed0  ldr.w   r3, [r5, #0xa4]
00046ed4  movw    r2, #0x31e
00046ed8  mov     r0, r6
00046eda  adds    r3, #1
00046edc  str.w   r2, [r5, r3, lsl #3]
00046ee0  ldr.w   r3, [r5, #0xa4]
00046ee4  ldr     r2, [pc, #0x5c]
00046ee6  adds    r3, #1
00046ee8  str.w   r3, [r5, #0xa4]
00046eec  lsls    r3, r3, #3
00046eee  adds    r3, r3, r5
00046ef0  add     r2, pc ; -> 0x00044b85  t_reaction_start
00046ef2  str     r2, [r3, #4]
00046ef4  ldr.w   r3, [r5, #0xa4]
00046ef8  adds    r3, #1
00046efa  str.w   r6, [r5, r3, lsl #3]
00046efe  pop     {r4, r5, r6, r7, pc}
00046f00  movw    r3, #0x31e
00046f04  cmp     r6, r3
00046f06  it      ne
00046f08  mvnne   r0, #2
00046f0c  bne     #0x46efe
00046f0e  mov     r0, r4
00046f10  mov.w   r3, #0x30003
00046f14  str     r3, [r4, #0x48]
00046f16  bl      #0x581e0 ; -> shake_a11
00046f1a  mov     r0, r4
00046f1c  movs    r3, #2
00046f1e  str     r3, [r4, #0x1c]
00046f20  bl      #0x580a4 ; -> group_sound
00046f24  ldr.w   r3, [r5, #0xa4]
00046f28  ldr     r2, [pc, #0x1c]
00046f2a  movs    r0, #0
00046f2c  lsls    r3, r3, #3
00046f2e  adds    r3, r3, r5
00046f30  add     r2, pc ; -> 0x00041a79  t_stumble_back
00046f32  str     r2, [r3, #4]
00046f34  ldr.w   r3, [r5, #0xa4]
00046f38  adds    r3, #1
00046f3a  str.w   r0, [r5, r3, lsl #3]
00046f3e  b       #0x46efe
00046f40  cbnz    r1, #0x46f64
