========================================================================
t_r_tusk_elbow  0x00044e90  100 bytes   mkreact.c
========================================================================

00044e90  push    {r4, r5, r6, r7, lr}
00044e92  add     r7, sp, #0xc
00044e94  str     r8, [sp, #-0x4]!
00044e98  ldr.w   r3, [r0, #0xa4]
00044e9c  mov     r4, r0
00044e9e  ldr.w   r5, [r0, #0x108]
00044ea2  adds    r3, #1
00044ea4  ldr.w   r6, [r0, r3, lsl #3]
00044ea8  cbnz    r6, #0x44eea
00044eaa  mov     r0, r5
00044eac  mov.w   r8, #4
00044eb0  str.w   r8, [r5, #0x1c]
00044eb4  bl      #0x5877c ; -> create_blood_proc
00044eb8  mov     r0, r5
00044eba  str.w   r8, [r5, #0x1c]
00044ebe  bl      #0x5877c ; -> create_blood_proc
00044ec2  mov     r0, r5
00044ec4  movs    r1, #3
00044ec6  bl      #0x57dbc ; -> rsnd_func
00044eca  ldr.w   r3, [r4, #0xa4]
00044ece  ldr     r2, [pc, #0x20]
00044ed0  mov     r0, r6
00044ed2  lsls    r3, r3, #3
00044ed4  adds    r3, r3, r4
00044ed6  add     r2, pc ; -> 0x00045879  t_rek3
00044ed8  str     r2, [r3, #4]
00044eda  ldr.w   r3, [r4, #0xa4]
00044ede  adds    r3, #1
00044ee0  str.w   r6, [r4, r3, lsl #3]
00044ee4  ldr     r8, [sp], #4
00044ee8  pop     {r4, r5, r6, r7, pc}
00044eea  mvn     r0, #2
00044eee  b       #0x44ee4
00044ef0  lsrs    r7, r3, #6
00044ef2  movs    r0, r0
