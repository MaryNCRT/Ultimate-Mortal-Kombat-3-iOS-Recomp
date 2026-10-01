========================================================================
t_r_ind_charge  0x00042b14  224 bytes   mkreact.c
========================================================================

00042b14  push    {r4, r5, r7, lr}
00042b16  add     r7, sp, #8
00042b18  ldr.w   r2, [r0, #0xa4]
00042b1c  mov     r4, r0
00042b1e  ldr.w   r5, [r0, #0x108]
00042b22  adds    r3, r2, #1
00042b24  movw    r1, #0xee4
00042b28  ldr.w   r0, [r0, r3, lsl #3]
00042b2c  cmp     r0, r1
00042b2e  beq     #0x42b8c
00042b30  movw    r3, #0xef1
00042b34  cmp     r0, r3
00042b36  beq     #0x42b72
00042b38  cbz     r0, #0x42b40
00042b3a  mvn     r0, #2
00042b3e  pop     {r4, r5, r7, pc}
00042b40  str     r0, [r5, #0x30]
00042b42  str     r0, [r5, #0x38]
00042b44  movs    r3, #3
00042b46  str     r3, [r5, #0x34]
00042b48  ldr.w   r3, [r4, #0xa4]
00042b4c  ldr     r2, [pc, #0x98]
00042b4e  adds    r3, #1
00042b50  add     r2, pc ; -> 0x00044b85  t_reaction_start
00042b52  str.w   r1, [r4, r3, lsl #3]
00042b56  ldr.w   r3, [r4, #0xa4]
00042b5a  adds    r3, #1
00042b5c  str.w   r3, [r4, #0xa4]
00042b60  lsls    r3, r3, #3
00042b62  adds    r3, r3, r4
00042b64  str     r2, [r3, #4]
00042b66  ldr.w   r3, [r4, #0xa4]
00042b6a  adds    r3, #1
00042b6c  str.w   r0, [r4, r3, lsl #3]
00042b70  b       #0x42b3e
00042b72  ldr.w   r1, [pc, #0x78]
00042b76  add     r1, pc ; -> 0x00042519  t_land_on_my_back
00042b78  lsls    r3, r2, #3
00042b7a  adds    r3, r3, r4
00042b7c  movs    r0, #0
00042b7e  str     r1, [r3, #4]
00042b80  ldr.w   r3, [r4, #0xa4]
00042b84  adds    r3, #1
00042b86  str.w   r0, [r4, r3, lsl #3]
00042b8a  b       #0x42b3e
00042b8c  mov     r0, r5
00042b8e  mov.w   r3, #0x60006
00042b92  str     r3, [r5, #0x48]
00042b94  bl      #0x581e0 ; -> shake_a11
00042b98  mov     r0, r5
00042b9a  movs    r3, #2
00042b9c  str     r3, [r5, #0x1c]
00042b9e  bl      #0x580a4 ; -> group_sound
00042ba2  movs    r1, #0xa
00042ba4  mov     r0, r5
00042ba6  bl      #0x57dbc ; -> rsnd_func
00042baa  mov.w   r3, #0x40000
00042bae  str     r3, [r5, #0x1c]
00042bb0  sub.w   r3, r3, #0x70000
00042bb4  str     r3, [r5, #0x20]
00042bb6  add.w   r3, r3, #0x36000
00042bba  str     r3, [r5, #0x24]
00042bbc  movs    r3, #5
00042bbe  str     r3, [r5, #0x28]
00042bc0  adds    r3, #0x19
00042bc2  str     r3, [r5, #0x40]
00042bc4  ldr.w   r3, [r4, #0xa4]
00042bc8  movw    r2, #0xef1
00042bcc  adds    r3, #1
00042bce  str.w   r2, [r4, r3, lsl #3]
00042bd2  ldr.w   r3, [r4, #0xa4]
00042bd6  adds    r2, r3, #1
00042bd8  ldr.w   r3, [pc, #0x14]
00042bdc  str.w   r2, [r4, #0xa4]
00042be0  add     r3, pc ; -> 0x000f3720  t_flight
00042be2  ldr     r1, [r3]
00042be4  b       #0x42b78
00042be6  nop     
00042be8  movs    r0, #0x31
00042bea  movs    r0, r0
00042bec  pli     [pc, #0xfff]
00042bf0  lsrs    r4, r7, #0xc
00042bf2  movs    r3, r1
