========================================================================
t_r_combo6  0x00046ae4  264 bytes   mkreact.c
========================================================================

00046ae4  push    {r4, r5, r6, r7, lr}
00046ae6  add     r7, sp, #0xc
00046ae8  str     r8, [sp, #-0x4]!
00046aec  ldr.w   r2, [r0, #0xa4]
00046af0  movw    r8, #0x6e6
00046af4  mov     r5, r0
00046af6  adds    r3, r2, #1
00046af8  ldr.w   r4, [r0, #0x108]
00046afc  ldr.w   r6, [r0, r3, lsl #3]
00046b00  cmp     r6, r8
00046b02  beq     #0x46b6e
00046b04  movw    r3, #0x6fa
00046b08  cmp     r6, r3
00046b0a  beq     #0x46b56
00046b0c  cbz     r6, #0x46b18
00046b0e  mvn     r0, #2
00046b12  ldr     r8, [sp], #4
00046b16  pop     {r4, r5, r6, r7, pc}
00046b18  mov     r0, r4
00046b1a  bl      #0x54f40 ; -> set_half_damage
00046b1e  movs    r3, #4
00046b20  str     r3, [r4, #0x34]
00046b22  ldr     r3, [pc, #0xb8]
00046b24  str     r6, [r4, #0x30]
00046b26  ldr     r2, [pc, #0xb8]
00046b28  add     r3, pc ; -> 0x00041681  t_cc_ken_masters
00046b2a  str     r3, [r4, #0x38]
00046b2c  ldr.w   r3, [r5, #0xa4]
00046b30  add     r2, pc ; -> 0x00044b85  t_reaction_start
00046b32  mov     r0, r6
00046b34  adds    r3, #1
00046b36  str.w   r8, [r5, r3, lsl #3]
00046b3a  ldr.w   r3, [r5, #0xa4]
00046b3e  adds    r3, #1
00046b40  str.w   r3, [r5, #0xa4]
00046b44  lsls    r3, r3, #3
00046b46  adds    r3, r3, r5
00046b48  str     r2, [r3, #4]
00046b4a  ldr.w   r3, [r5, #0xa4]
00046b4e  adds    r3, #1
00046b50  str.w   r6, [r5, r3, lsl #3]
00046b54  b       #0x46b12
00046b56  ldr     r1, [pc, #0x8c]
00046b58  add     r1, pc ; -> 0x000425b9  t_reaction_land
00046b5a  lsls    r3, r2, #3
00046b5c  adds    r3, r3, r5
00046b5e  movs    r0, #0
00046b60  str     r1, [r3, #4]
00046b62  ldr.w   r3, [r5, #0xa4]
00046b66  adds    r3, #1
00046b68  str.w   r0, [r5, r3, lsl #3]
00046b6c  b       #0x46b12
00046b6e  mov     r0, r4
00046b70  movs    r3, #1
00046b72  str     r3, [r4, #0x1c]
00046b74  bl      #0x5877c ; -> create_blood_proc
00046b78  mov     r0, r4
00046b7a  mov.w   r3, #0x60006
00046b7e  str     r3, [r4, #0x48]
00046b80  bl      #0x581e0 ; -> shake_a11
00046b84  movs    r1, #0xa
00046b86  mov     r0, r4
00046b88  bl      #0x57dbc ; -> rsnd_func
00046b8c  mov     r0, r4
00046b8e  movs    r3, #2
00046b90  str     r3, [r4, #0x1c]
00046b92  bl      #0x580a4 ; -> group_sound
00046b96  mov     r0, r4
00046b98  movs    r3, #0xe
00046b9a  str     r3, [r4, #0x1c]
00046b9c  bl      #0x58d70 ; -> create_fx
00046ba0  mov.w   r3, #0x10000
00046ba4  str     r3, [r4, #0x1c]
00046ba6  sub.w   r3, r3, #0xd0000
00046baa  str     r3, [r4, #0x20]
00046bac  add.w   r3, r3, #0xc6000
00046bb0  str     r3, [r4, #0x24]
00046bb2  movs    r3, #5
00046bb4  str     r3, [r4, #0x28]
00046bb6  adds    r3, #0x19
00046bb8  str     r3, [r4, #0x40]
00046bba  ldr.w   r3, [r5, #0xa4]
00046bbe  movw    r2, #0x6fa
00046bc2  adds    r3, #1
00046bc4  str.w   r2, [r5, r3, lsl #3]
00046bc8  ldr.w   r3, [r5, #0xa4]
00046bcc  adds    r2, r3, #1
00046bce  ldr     r3, [pc, #0x18]
00046bd0  str.w   r2, [r5, #0xa4]
00046bd4  add     r3, pc ; -> 0x000f3720  t_flight
00046bd6  ldr     r1, [r3]
00046bd8  b       #0x46b5a
00046bda  nop     
00046bdc  add     r3, sp, #0x154
