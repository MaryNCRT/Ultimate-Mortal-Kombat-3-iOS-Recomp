========================================================================
c_jaxdash_sd  0x0006da30  104 bytes   mkdrone.c
========================================================================

0006da30  push    {r4, r5, r6, r7, lr}
0006da32  add     r7, sp, #0xc
0006da34  ldr.w   r3, [r0, #0xa4]
0006da38  mov     r4, r0
0006da3a  ldr.w   r5, [r0, #0x108]
0006da3e  adds    r3, #1
0006da40  ldr.w   r6, [r0, r3, lsl #3]
0006da44  cbnz    r6, #0x6da6c
0006da46  mov     r0, r5
0006da48  bl      #0x6c9f4 ; -> should_i_promove
0006da4c  ldr     r3, [r5, #0x5c]
0006da4e  cbnz    r3, #0x6da72
0006da50  ldr     r2, [pc, #0x38]
0006da52  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006da54  ldr.w   r3, [r4, #0xa4]
0006da58  mov     r0, r6
0006da5a  lsls    r3, r3, #3
0006da5c  adds    r3, r3, r4
0006da5e  str     r2, [r3, #4]
0006da60  ldr.w   r3, [r4, #0xa4]
0006da64  adds    r3, #1
0006da66  str.w   r6, [r4, r3, lsl #3]
0006da6a  b       #0x6da70
0006da6c  mvn     r0, #2
0006da70  pop     {r4, r5, r6, r7, pc}
0006da72  mov     r0, r5
0006da74  bl      #0x2f3a0 ; -> get_x_dist
0006da78  ldr     r0, [r5, #0x28]
0006da7a  cmp     r0, #0x56
0006da7c  ble     #0x6da84
0006da7e  ldr     r2, [pc, #0x10]
0006da80  add     r2, pc ; -> 0x00067895  t_run_in_close
0006da82  b       #0x6da54
0006da84  ldr     r2, [pc, #0xc]
0006da86  add     r2, pc ; -> 0x0006f5c1  t_d_knee
0006da88  b       #0x6da54
0006da8a  nop     
0006da8c  b       #0x6d8ee
0006da8e  vcvt.f32.u32 d25, d1, #1
