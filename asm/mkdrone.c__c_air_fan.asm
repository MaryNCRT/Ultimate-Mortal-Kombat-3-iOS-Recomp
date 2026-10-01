========================================================================
c_air_fan  0x0006aa28  104 bytes   mkdrone.c
========================================================================

0006aa28  push    {r4}
0006aa2a  ldr.w   r3, [r0, #0xa4]
0006aa2e  ldr.w   r2, [r0, #0x108]
0006aa32  adds    r3, #1
0006aa34  ldr.w   r4, [r0, r3, lsl #3]
0006aa38  cbz     r4, #0x6aa42
0006aa3a  mvn     r0, #2
0006aa3e  pop     {r4}
0006aa40  bx      lr
0006aa42  ldr     r3, [r2]
0006aa44  ldr     r3, [r3, #4]
0006aa46  ldrsh.w r1, [r3, #0x12]
0006aa4a  ldr     r3, [pc, #0x38]
0006aa4c  add     r3, pc ; -> 0x000f357c  G
0006aa4e  str     r1, [r2, #0x28]
0006aa50  ldr     r3, [r3]
0006aa52  ldr.w   r3, [r3, #0xac]
0006aa56  subs    r3, r3, r1
0006aa58  cmp     r3, #0xa0
0006aa5a  str     r3, [r2, #0x1c]
0006aa5c  bgt     #0x6aa7a
0006aa5e  ldr     r2, [pc, #0x28]
0006aa60  add     r2, pc ; -> 0x00070309  t_duck_under_proj
0006aa62  ldr.w   r3, [r0, #0xa4]
0006aa66  lsls    r3, r3, #3
0006aa68  adds    r3, r3, r0
0006aa6a  str     r2, [r3, #4]
0006aa6c  ldr.w   r3, [r0, #0xa4]
0006aa70  adds    r3, #1
0006aa72  str.w   r4, [r0, r3, lsl #3]
0006aa76  mov     r0, r4
0006aa78  b       #0x6aa3e
0006aa7a  ldr.w   r2, [pc, #0x10]
0006aa7e  add     r2, pc ; -> 0x00067fe1  t_d_zap_now
0006aa80  b       #0x6aa62
0006aa82  nop     
0006aa84  ldrh    r4, [r5, #0x18]
0006aa86  movs    r0, r1
0006aa88  ldr     r5, [r4, r2]
0006aa8a  movs    r0, r0
0006aa8c  bpl     #0x6ab4e
