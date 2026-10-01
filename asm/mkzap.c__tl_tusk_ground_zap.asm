========================================================================
tl_tusk_ground_zap  0x0007a09c  276 bytes   mkzap.c
========================================================================

0007a09c  push    {r4, r5, r6, r7, lr}
0007a09e  add     r7, sp, #0xc
0007a0a0  str     r8, [sp, #-0x4]!
0007a0a4  ldr.w   r3, [r0, #0xa4]
0007a0a8  movw    r8, #0xbb9
0007a0ac  mov     r5, r0
0007a0ae  adds    r3, #1
0007a0b0  ldr.w   r4, [r0, #0x108]
0007a0b4  ldr.w   r6, [r0, r3, lsl #3]
0007a0b8  cmp     r6, r8
0007a0ba  beq     #0x7a136
0007a0bc  movw    r3, #0xbd7
0007a0c0  cmp     r6, r3
0007a0c2  beq     #0x7a10e
0007a0c4  cbz     r6, #0x7a0d0
0007a0c6  mvn     r0, #2
0007a0ca  ldr     r8, [sp], #4
0007a0ce  pop     {r4, r5, r6, r7, pc}
0007a0d0  movs    r3, #0xe
0007a0d2  mov     r0, r4
0007a0d4  str     r3, [r4, #0x20]
0007a0d6  str     r6, [r4, #0x44]
0007a0d8  bl      #0x79590 ; -> zap_init_special_act
0007a0dc  ldr     r3, [pc, #0xbc]
0007a0de  mov     r0, r6
0007a0e0  str     r3, [r4, #0x40]
0007a0e2  ldr.w   r3, [r5, #0xa4]
0007a0e6  adds    r3, #1
0007a0e8  str.w   r8, [r5, r3, lsl #3]
0007a0ec  ldr.w   r3, [r5, #0xa4]
0007a0f0  adds    r2, r3, #1
0007a0f2  ldr     r3, [pc, #0xac]
0007a0f4  str.w   r2, [r5, #0xa4]
0007a0f8  add     r3, pc ; -> 0x000f36d0  t_animate_a9
0007a0fa  ldr     r1, [r3]
0007a0fc  lsls    r3, r2, #3
0007a0fe  adds    r3, r3, r5
0007a100  str     r1, [r3, #4]
0007a102  ldr.w   r3, [r5, #0xa4]
0007a106  adds    r3, #1
0007a108  str.w   r6, [r5, r3, lsl #3]
0007a10c  b       #0x7a0ca
0007a10e  mov     r0, r4
0007a110  bl      #0x56d20 ; -> delete_slave
0007a114  movs    r3, #5
0007a116  str     r3, [r4, #0x1c]
0007a118  ldr     r3, [pc, #0x88]
0007a11a  movs    r0, #0
0007a11c  add     r3, pc ; -> 0x000f37cc  t_mframew
0007a11e  ldr     r2, [r3]
0007a120  ldr.w   r3, [r5, #0xa4]
0007a124  lsls    r3, r3, #3
0007a126  adds    r3, r3, r5
0007a128  str     r2, [r3, #4]
0007a12a  ldr.w   r3, [r5, #0xa4]
0007a12e  adds    r3, #1
0007a130  str.w   r0, [r5, r3, lsl #3]
0007a134  b       #0x7a0ca
0007a136  ldr     r3, [pc, #0x70]
0007a138  mov     r0, r4
0007a13a  add     r3, pc ; -> 0x000769b1  t_photon_proc
0007a13c  str     r3, [r4, #0x38]
0007a13e  bl      #0x75964 ; -> create_proj_proc
0007a142  cbz     r0, #0x7a156
0007a144  ldr     r0, [r0, #8]
0007a146  movs    r3, #0x10
0007a148  str     r3, [r4, #0x1c]
0007a14a  adds    r3, #0x2f
0007a14c  str     r0, [r4, #0x30]
0007a14e  mov     r0, r4
0007a150  str     r3, [r4, #0x20]
0007a152  bl      #0x570bc ; -> adjust_xy_a5
0007a156  mov     r0, r4
0007a158  movs    r3, #1
0007a15a  str     r3, [r4, #0x1c]
0007a15c  bl      #0x57be4 ; -> ochar_sound
0007a160  mov     r0, r4
0007a162  bl      #0x758b0 ; -> i_am_a_sitting_duck
0007a166  movs    r3, #4
0007a168  str     r3, [r4, #0x1c]
0007a16a  ldr.w   r3, [r5, #0xa4]
0007a16e  movw    r2, #0xbd7
0007a172  movs    r0, #0
0007a174  adds    r3, #1
0007a176  str.w   r2, [r5, r3, lsl #3]
0007a17a  ldr.w   r3, [r5, #0xa4]
0007a17e  adds    r2, r3, #1
0007a180  ldr     r3, [pc, #0x28]
0007a182  str.w   r2, [r5, #0xa4]
0007a186  add     r3, pc ; -> 0x000f37cc  t_mframew
0007a188  ldr     r1, [r3]
0007a18a  lsls    r3, r2, #3
0007a18c  adds    r3, r3, r5
0007a18e  str     r1, [r3, #4]
0007a190  ldr.w   r3, [r5, #0xa4]
0007a194  adds    r3, #1
0007a196  str.w   r0, [r5, r3, lsl #3]
0007a19a  b       #0x7a0ca
0007a19c  movs    r4, r4
0007a19e  movs    r3, r0
0007a1a0  str     r5, [sp, #0x350]
0007a1a2  movs    r7, r0
0007a1a4  str     r6, [sp, #0x2b0]
0007a1a6  movs    r7, r0
0007a1a8  ldm     r0, {r0, r1, r4, r5, r6}
