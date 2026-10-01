========================================================================
t_skull_proc  0x00076b0c  240 bytes   mkzap.c
========================================================================

00076b0c  push    {r4, r5, r6, r7, lr}
00076b0e  add     r7, sp, #0xc
00076b10  ldr.w   r3, [r0, #0xa4]
00076b14  mov     r5, r0
00076b16  ldr.w   r4, [r0, #0x108]
00076b1a  adds    r3, #1
00076b1c  ldr.w   r3, [r0, r3, lsl #3]
00076b20  cbnz    r3, #0x76b6c
00076b22  mov     r0, r4
00076b24  movs    r3, #0x3f
00076b26  movs    r6, #0x11
00076b28  str     r3, [r4, #0x40]
00076b2a  bl      #0x5520c ; -> get_char_ani
00076b2e  str     r6, [r4, #0x1c]
00076b30  mov     r0, r4
00076b32  bl      #0x75900 ; -> tell_world_stk
00076b36  ldr     r3, [r4]
00076b38  ldr     r3, [r3, #4]
00076b3a  ldr     r3, [r3, #0x24]
00076b3c  cmp     r3, #0x18
00076b3e  beq     #0x76bac
00076b40  mov     r0, r4
00076b42  bl      #0x54e38 ; -> get_his_action
00076b46  ldr     r2, [r4, #0x20]
00076b48  movw    r3, #0x402
00076b4c  cmp     r2, r3
00076b4e  beq     #0x76bac
00076b50  ldr     r3, [pc, #0x8c]
00076b52  str     r6, [r4, #0x1c]
00076b54  mov     r0, r4
00076b56  str     r3, [r4, #0x20]
00076b58  ldr     r3, [pc, #0x88]
00076b5a  str     r3, [r4, #0x24]
00076b5c  bl      #0x75f1c ; -> local_strike_check_box
00076b60  ldr     r3, [r4, #0x5c]
00076b62  cmp     r3, #0
00076b64  beq     #0x76bac
00076b66  ldr     r3, [pc, #0x80]
00076b68  str     r3, [r4, #0x48]
00076b6a  b       #0x76b7e
00076b6c  cmp.w   r3, #0xaa0
00076b70  it      ne
00076b72  mvnne   r0, #2
00076b76  beq     #0x76b7a
00076b78  pop     {r4, r5, r6, r7, pc}
00076b7a  ldr     r3, [pc, #0x70]
00076b7c  str     r3, [r4, #0x48]
00076b7e  mov     r0, r4
00076b80  bl      #0x76ac4 ; -> make_lineup_explode
00076b84  ldr.w   r3, [pc, #0x68]
00076b88  mov     r0, r4
00076b8a  str     r3, [r4, #0x1c]
00076b8c  bl      #0x57c18 ; -> hob_ochar_sound
00076b90  ldr     r2, [pc, #0x60]
00076b92  ldr.w   r3, [r5, #0xa4]
00076b96  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
00076b98  lsls    r3, r3, #3
00076b9a  adds    r3, r3, r5
00076b9c  movs    r0, #0
00076b9e  str     r2, [r3, #4]
00076ba0  ldr.w   r3, [r5, #0xa4]
00076ba4  adds    r3, #1
00076ba6  str.w   r0, [r5, r3, lsl #3]
00076baa  b       #0x76b78
00076bac  mov.w   r3, #0x80000
00076bb0  mov     r0, r4
00076bb2  str     r3, [r4, #0x1c]
00076bb4  movs    r3, #4
00076bb6  str     r3, [r4, #0x20]
00076bb8  bl      #0x75d6c ; -> set_proj_vel
00076bbc  movs    r3, #0x11
00076bbe  str     r3, [r4, #0x48]
00076bc0  ldr.w   r3, [r5, #0xa4]
00076bc4  mov.w   r2, #0xaa0
00076bc8  adds    r3, #1
00076bca  str.w   r2, [r5, r3, lsl #3]
00076bce  ldr     r2, [pc, #0x28]
00076bd0  ldr.w   r3, [r5, #0xa4]
00076bd4  add     r2, pc ; -> 0x0007562d  tl_projectile_flight
00076bd6  adds    r3, #1
00076bd8  str.w   r3, [r5, #0xa4]
00076bdc  b       #0x76b98
00076bde  nop     
00076be0  lsls    r7, r2, #1
00076be2  movs    r5, r2
00076be4  lsls    r2, r2, #1
00076be6  movs    r6, r2
00076be8  lsls    r2, r0, #1
00076bea  movs    r3, r4
00076bec  lsls    r2, r2, #2
00076bee  movs    r3, r4
00076bf0  movs    r6, r0
00076bf2  movs    r2, r0
