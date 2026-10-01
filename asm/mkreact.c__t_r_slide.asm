========================================================================
t_r_slide  0x00043b1c  236 bytes   mkreact.c
========================================================================

00043b1c  push    {r4, r5, r7, lr}
00043b1e  add     r7, sp, #8
00043b20  ldr.w   r2, [r0, #0xa4]
00043b24  mov     r4, r0
00043b26  ldr.w   r5, [r0, #0x108]
00043b2a  adds    r3, r2, #1
00043b2c  movw    r1, #0x45a
00043b30  ldr.w   r0, [r0, r3, lsl #3]
00043b34  cmp     r0, r1
00043b36  beq     #0x43b94
00043b38  movw    r3, #0x466
00043b3c  cmp     r0, r3
00043b3e  beq     #0x43b7a
00043b40  cbz     r0, #0x43b48
00043b42  mvn     r0, #2
00043b46  pop     {r4, r5, r7, pc}
00043b48  str     r0, [r5, #0x30]
00043b4a  str     r0, [r5, #0x38]
00043b4c  movs    r3, #7
00043b4e  str     r3, [r5, #0x34]
00043b50  ldr.w   r3, [r4, #0xa4]
00043b54  ldr     r2, [pc, #0xa4]
00043b56  adds    r3, #1
00043b58  add     r2, pc ; -> 0x00044b85  t_reaction_start
00043b5a  str.w   r1, [r4, r3, lsl #3]
00043b5e  ldr.w   r3, [r4, #0xa4]
00043b62  adds    r3, #1
00043b64  str.w   r3, [r4, #0xa4]
00043b68  lsls    r3, r3, #3
00043b6a  adds    r3, r3, r4
00043b6c  str     r2, [r3, #4]
00043b6e  ldr.w   r3, [r4, #0xa4]
00043b72  adds    r3, #1
00043b74  str.w   r0, [r4, r3, lsl #3]
00043b78  b       #0x43b46
00043b7a  ldr.w   r1, [pc, #0x84]
00043b7e  lsls    r3, r2, #3
00043b80  adds    r3, r3, r4
00043b82  add     r1, pc ; -> 0x00042519  t_land_on_my_back
00043b84  str     r1, [r3, #4]
00043b86  ldr.w   r3, [r4, #0xa4]
00043b8a  movs    r0, #0
00043b8c  adds    r3, #1
00043b8e  str.w   r0, [r4, r3, lsl #3]
00043b92  b       #0x43b46
00043b94  mov     r0, r5
00043b96  movs    r3, #5
00043b98  str     r3, [r5, #0x1c]
00043b9a  bl      #0x580a4 ; -> group_sound
00043b9e  mov     r0, r5
00043ba0  mov.w   r3, #0x30000
00043ba4  str     r3, [r5, #0x1c]
00043ba6  bl      #0x55ab0 ; -> away_x_vel
00043baa  mov.w   r3, #0x38000
00043bae  str     r3, [r5, #0x1c]
00043bb0  sub.w   r3, r3, #0x98000
00043bb4  str     r3, [r5, #0x20]
00043bb6  add.w   r3, r3, #0x66000
00043bba  str     r3, [r5, #0x24]
00043bbc  movs    r3, #4
00043bbe  movs    r0, #0
00043bc0  str     r3, [r5, #0x28]
00043bc2  str     r0, [r5, #0x34]
00043bc4  adds    r3, #0x1a
00043bc6  str     r3, [r5, #0x40]
00043bc8  ldr.w   r3, [r4, #0xa4]
00043bcc  movw    r2, #0x466
00043bd0  adds    r3, #1
00043bd2  str.w   r2, [r4, r3, lsl #3]
00043bd6  ldr.w   r3, [r4, #0xa4]
00043bda  adds    r2, r3, #1
00043bdc  ldr.w   r3, [pc, #0x24]
00043be0  str.w   r2, [r4, #0xa4]
00043be4  add     r3, pc ; -> 0x000f3720  t_flight
00043be6  ldr     r1, [r3]
00043be8  lsls    r3, r2, #3
00043bea  adds    r3, r3, r4
00043bec  str     r1, [r3, #4]
00043bee  ldr.w   r3, [r4, #0xa4]
00043bf2  adds    r3, #1
00043bf4  str.w   r0, [r4, r3, lsl #3]
00043bf8  b       #0x43b46
00043bfa  nop     
00043bfc  asrs    r1, r5, #0x20
00043bfe  movs    r0, r0
