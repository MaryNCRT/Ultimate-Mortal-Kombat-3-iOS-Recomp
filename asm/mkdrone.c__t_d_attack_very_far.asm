========================================================================
t_d_attack_very_far  0x00070bf4  120 bytes   mkdrone.c
========================================================================

00070bf4  push    {r4, r5, r6, r7, lr}
00070bf6  add     r7, sp, #0xc
00070bf8  ldr.w   r3, [r0, #0xa4]
00070bfc  mov     r4, r0
00070bfe  ldr.w   r5, [r0, #0x108]
00070c02  adds    r3, #1
00070c04  ldr.w   r6, [r0, r3, lsl #3]
00070c08  cbnz    r6, #0x70c30
00070c0a  mov     r0, r5
00070c0c  bl      #0x70940 ; -> is_towards_me
00070c10  ldr     r3, [r5, #0x5c]
00070c12  cbnz    r3, #0x70c36
00070c14  ldr     r2, [pc, #0x48]
00070c16  add     r2, pc ; -> 0x00067bad  t_dont_zap_towards_jumper
00070c18  ldr.w   r3, [r4, #0xa4]
00070c1c  mov     r0, r6
00070c1e  lsls    r3, r3, #3
00070c20  adds    r3, r3, r4
00070c22  str     r2, [r3, #4]
00070c24  ldr.w   r3, [r4, #0xa4]
00070c28  adds    r3, #1
00070c2a  str.w   r6, [r4, r3, lsl #3]
00070c2e  b       #0x70c34
00070c30  mvn     r0, #2
00070c34  pop     {r4, r5, r6, r7, pc}
00070c36  mov     r0, r5
00070c38  bl      #0x6f660 ; -> q_airborn_counter
00070c3c  ldr     r0, [r5, #0x5c]
00070c3e  cbz     r0, #0x70c46
00070c40  ldr     r2, [pc, #0x20]
00070c42  add     r2, pc ; -> 0x00067d09  t_very_far_airborn
00070c44  b       #0x70c18
00070c46  ldr.w   r3, [r4, #0xa4]
00070c4a  ldr     r2, [pc, #0x1c]
00070c4c  lsls    r3, r3, #3
00070c4e  adds    r3, r3, r4
00070c50  add     r2, pc ; -> 0x00067bad  t_dont_zap_towards_jumper
00070c52  str     r2, [r3, #4]
00070c54  ldr.w   r3, [r4, #0xa4]
00070c58  adds    r3, #1
00070c5a  str.w   r0, [r4, r3, lsl #3]
00070c5e  b       #0x70c34
00070c60  ldr     r3, [r2, #0x78]
