========================================================================
t_lia_delayed_scream  0x00069b68  176 bytes   mkdrone.c
========================================================================

00069b68  push    {lr}
00069b6a  ldr.w   r1, [r0, #0xa4]
00069b6e  movw    lr, #0xd0e
00069b72  ldr.w   ip, [r0, #0x108]
00069b76  adds    r3, r1, #1
00069b78  ldr.w   r2, [r0, r3, lsl #3]
00069b7c  cmp     r2, lr
00069b7e  beq     #0x69be8
00069b80  movw    r3, #0xd0f
00069b84  cmp     r2, r3
00069b86  beq     #0x69bcc
00069b88  cbz     r2, #0x69b90
00069b8a  mvn     r0, #2
00069b8e  pop     {pc}
00069b90  movs    r3, #0x40
00069b92  str.w   r3, [ip, #0x44]
00069b96  ldr     r3, [pc, #0x70]
00069b98  ldr.w   r1, [pc, #0x70]
00069b9c  add     r3, pc ; -> 0x0006e441  q_is_he_scream_close
00069b9e  str.w   r3, [ip, #0x48]
00069ba2  ldr.w   r3, [r0, #0xa4]
00069ba6  add     r1, pc ; -> 0x00072a2d  t_stalk_wait_yes
00069ba8  adds    r3, #1
00069baa  str.w   lr, [r0, r3, lsl #3]
00069bae  ldr.w   r3, [r0, #0xa4]
00069bb2  adds    r3, #1
00069bb4  str.w   r3, [r0, #0xa4]
00069bb8  lsls    r3, r3, #3
00069bba  adds    r3, r3, r0
00069bbc  str     r1, [r3, #4]
00069bbe  ldr.w   r3, [r0, #0xa4]
00069bc2  adds    r3, #1
00069bc4  str.w   r2, [r0, r3, lsl #3]
00069bc8  mov     r0, r2
00069bca  b       #0x69b8e
00069bcc  ldr     r3, [pc, #0x40]
00069bce  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00069bd0  ldr     r2, [r3]
00069bd2  lsls    r3, r1, #3
00069bd4  adds    r3, r3, r0
00069bd6  str     r2, [r3, #4]
00069bd8  ldr.w   r3, [r0, #0xa4]
00069bdc  movs    r2, #0
00069bde  adds    r3, #1
00069be0  str.w   r2, [r0, r3, lsl #3]
00069be4  mov     r0, r2
00069be6  b       #0x69b8e
00069be8  movw    r2, #0xd0f
00069bec  str.w   r2, [r0, r3, lsl #3]
00069bf0  ldr.w   r3, [r0, #0xa4]
00069bf4  adds    r2, r3, #1
00069bf6  ldr     r3, [pc, #0x1c]
00069bf8  str.w   r2, [r0, #0xa4]
00069bfc  add     r3, pc ; -> 0x000f3028  t_do_lia_scream
00069bfe  ldr     r1, [r3]
00069c00  lsls    r3, r2, #3
00069c02  adds    r3, r3, r0
00069c04  str     r1, [r3, #4]
00069c06  b       #0x69bd8
00069c08  ldr     r0, [pc, #0x284]
00069c0a  movs    r0, r0
00069c0c  ldrh    r3, [r0, #0x34]
00069c0e  movs    r0, r0
00069c10  ldr     r3, [sp, #0xd8]
00069c12  movs    r0, r1
00069c14  str     r4, [sp, #0xa0]
00069c16  movs    r0, r1
