========================================================================
t_back_to_the_fight  0x00047bc4  296 bytes   mkreact.c
========================================================================

00047bc4  push    {r4, r5, r6, r7, lr}
00047bc6  add     r7, sp, #0xc
00047bc8  ldr.w   r2, [r0, #0xa4]
00047bcc  mov     r5, r0
00047bce  ldr.w   r4, [r0, #0x108]
00047bd2  adds    r3, r2, #1
00047bd4  ldr.w   r6, [r0, r3, lsl #3]
00047bd8  cmp.w   r6, #0xbb0
00047bdc  beq     #0x47c92
00047bde  movw    r3, #0xbb8
00047be2  cmp     r6, r3
00047be4  beq     #0x47c3e
00047be6  cbnz    r6, #0x47c38
00047be8  ldr     r3, [pc, #0xec]
00047bea  ldr     r2, [r4, #8]
00047bec  mov     r0, r4
00047bee  add     r3, pc ; -> 0x000f357c  G
00047bf0  ldr     r3, [r3]
00047bf2  ldr.w   r3, [r3, #0xac]
00047bf6  adds    r3, #0x32
00047bf8  strh    r3, [r2, #0x12]
00047bfa  movs    r3, #0x16
00047bfc  str     r3, [r4, #0x40]
00047bfe  bl      #0x5520c ; -> get_char_ani
00047c02  ldr     r3, [r4, #0x40]
00047c04  mov     r0, r4
00047c06  adds    r3, #4
00047c08  str     r3, [r4, #0x40]
00047c0a  bl      #0x59e24 ; -> do_next_a9_frame
00047c0e  mov     r0, r4
00047c10  bl      #0x55388 ; -> face_opponent
00047c14  ldr     r3, [r4, #8]
00047c16  str     r6, [r3, #0x20]
00047c18  ldr.w   r3, [pc, #0xc0]
00047c1c  ldr     r0, [r4, #8]
00047c1e  str     r3, [r4, #0x1c]
00047c20  str     r3, [r0, #0x1c]
00047c22  ldr.w   r2, [r5, #0xa4]
00047c26  adds    r3, r2, #1
00047c28  movs    r0, #1
00047c2a  mov.w   r2, #0xbb0
00047c2e  str.w   r2, [r5, r3, lsl #3]
00047c32  str.w   r0, [r5, #0xfc]
00047c36  b       #0x47c3c
00047c38  mvn     r0, #2
00047c3c  pop     {r4, r5, r6, r7, pc}
00047c3e  mov     r0, r4
00047c40  bl      #0x552a0 ; -> ground_ochar
00047c44  ldr     r0, [r4]
00047c46  movs    r2, #0
00047c48  movs    r1, #0x38
00047c4a  ldr     r3, [r0, #8]
00047c4c  movs    r0, #4
00047c4e  bl      #0x31a28 ; -> MKEvent_Add
00047c52  ldr.w   r3, [pc, #0x8c]
00047c56  movs    r0, #0
00047c58  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00047c5a  ldr     r2, [r3]
00047c5c  ldr.w   r3, [r5, #0xa4]
00047c60  lsls    r3, r3, #3
00047c62  adds    r3, r3, r5
00047c64  str     r2, [r3, #4]
00047c66  ldr.w   r3, [r5, #0xa4]
00047c6a  adds    r3, #1
00047c6c  str.w   r0, [r5, r3, lsl #3]
00047c70  ldr.w   r3, [r5, #0xa4]
00047c74  adds    r2, r3, #1
00047c76  ldr     r3, [pc, #0x6c]
00047c78  str.w   r2, [r5, #0xa4]
00047c7c  add     r3, pc ; -> 0x000f376c  t_jump_up_land_jsrp
00047c7e  ldr     r1, [r3]
00047c80  lsls    r3, r2, #3
00047c82  adds    r3, r3, r5
00047c84  str     r1, [r3, #4]
00047c86  ldr.w   r3, [r5, #0xa4]
00047c8a  adds    r3, #1
00047c8c  str.w   r0, [r5, r3, lsl #3]
00047c90  b       #0x47c3c
00047c92  ldr.w   ip, [r4, #8]
00047c96  ldr     r3, [r4]
00047c98  ldrsh.w r1, [ip, #0x12]
00047c9c  ldr     r3, [r3, #0x40]
00047c9e  cmp     r1, r3
00047ca0  bgt     #0x47c26
00047ca2  movs    r0, #0
00047ca4  str     r0, [r4, #0x1c]
00047ca6  ldr.w   r3, [ip, #0x1c]
00047caa  movw    r2, #0xbb8
00047cae  str     r3, [r4, #0x20]
00047cb0  mov.w   r3, #0x10000
00047cb4  str     r3, [r4, #0x24]
00047cb6  movw    r3, #0xfff
00047cba  str     r3, [r4, #0x28]
00047cbc  ldr.w   r3, [r5, #0xa4]
00047cc0  adds    r3, #1
00047cc2  str.w   r2, [r5, r3, lsl #3]
00047cc6  ldr.w   r3, [r5, #0xa4]
00047cca  adds    r2, r3, #1
00047ccc  ldr.w   r3, [pc, #0x18]
00047cd0  str.w   r2, [r5, #0xa4]
00047cd4  add     r3, pc ; -> 0x000f3720  t_flight
00047cd6  b       #0x47c7e
00047cd8  cbnz    r2, #0x47cfe
00047cda  movs    r2, r1
00047cdc  movs    r0, r0
00047cde  vtbl.8  d27, {d20, d21, d22}, d28
00047ce2  movs    r2, r1
00047ce4  revsh   r4, r5
00047ce6  movs    r2, r1
00047ce8  rev16   r0, r1
00047cea  movs    r2, r1
