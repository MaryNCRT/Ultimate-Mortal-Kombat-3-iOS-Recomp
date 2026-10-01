========================================================================
t_d_backup_zap  0x00069ae4  132 bytes   mkdrone.c
========================================================================

00069ae4  ldr.w   r1, [r0, #0xa4]
00069ae8  ldr.w   ip, [r0, #0x108]
00069aec  adds    r3, r1, #1
00069aee  ldr.w   r2, [r0, r3, lsl #3]
00069af2  cbnz    r2, #0x69b34
00069af4  movs    r3, #0x40
00069af6  str.w   r3, [ip, #0x44]
00069afa  ldr     r3, [pc, #0x60]
00069afc  movw    r1, #0xcfc
00069b00  add     r3, pc ; -> 0x0006ef79  q_backup_zap
00069b02  str.w   r3, [ip, #0x48]
00069b06  ldr.w   r3, [r0, #0xa4]
00069b0a  adds    r3, #1
00069b0c  str.w   r1, [r0, r3, lsl #3]
00069b10  ldr.w   r3, [r0, #0xa4]
00069b14  ldr.w   r1, [pc, #0x48]
00069b18  adds    r3, #1
00069b1a  str.w   r3, [r0, #0xa4]
00069b1e  lsls    r3, r3, #3
00069b20  adds    r3, r3, r0
00069b22  add     r1, pc ; -> 0x000726e9  t_retreat_wait_yes
00069b24  str     r1, [r3, #4]
00069b26  ldr.w   r3, [r0, #0xa4]
00069b2a  adds    r3, #1
00069b2c  str.w   r2, [r0, r3, lsl #3]
00069b30  mov     r0, r2
00069b32  bx      lr
00069b34  movw    r3, #0xcfc
00069b38  cmp     r2, r3
00069b3a  it      ne
00069b3c  mvnne   r0, #2
00069b40  bne     #0x69b32
00069b42  ldr     r2, [pc, #0x20]
00069b44  lsls    r3, r1, #3
00069b46  adds    r3, r3, r0
00069b48  add     r2, pc ; -> 0x00067f91  t_d_zap
00069b4a  str     r2, [r3, #4]
00069b4c  ldr.w   r3, [r0, #0xa4]
00069b50  movs    r2, #0
00069b52  adds    r3, #1
00069b54  str.w   r2, [r0, r3, lsl #3]
00069b58  mov     r0, r2
00069b5a  b       #0x69b32
00069b5c  strb    r5, [r6, r1]
00069b5e  movs    r0, r0
00069b60  ldrh    r3, [r0, #0x1e]
00069b62  movs    r0, r0
00069b64  b       #0x693f2
