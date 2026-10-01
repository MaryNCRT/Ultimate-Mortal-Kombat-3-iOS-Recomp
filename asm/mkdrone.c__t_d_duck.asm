========================================================================
t_d_duck  0x00068ab8  164 bytes   mkdrone.c
========================================================================

00068ab8  push    {lr}
00068aba  ldr.w   ip, [r0, #0xa4]
00068abe  movw    lr, #0x7f5
00068ac2  ldr.w   r3, [r0, #0x108]
00068ac6  add.w   r1, ip, #1
00068aca  ldr.w   r2, [r0, r1, lsl #3]
00068ace  cmp     r2, lr
00068ad0  beq     #0x68b2a
00068ad2  movw    r3, #0x7f7
00068ad6  cmp     r2, r3
00068ad8  beq     #0x68b0e
00068ada  cbz     r2, #0x68ae2
00068adc  mvn     r0, #2
00068ae0  pop     {pc}
00068ae2  str.w   lr, [r0, r1, lsl #3]
00068ae6  ldr.w   r3, [r0, #0xa4]
00068aea  adds    r1, r3, #1
00068aec  ldr     r3, [pc, #0x60]
00068aee  str.w   r1, [r0, #0xa4]
00068af2  add     r3, pc ; -> 0x000f3884  t_do_duck
00068af4  ldr.w   ip, [r3]
00068af8  lsls    r3, r1, #3
00068afa  adds    r3, r3, r0
00068afc  str.w   ip, [r3, #4]
00068b00  ldr.w   r3, [r0, #0xa4]
00068b04  adds    r3, #1
00068b06  str.w   r2, [r0, r3, lsl #3]
00068b0a  mov     r0, r2
00068b0c  b       #0x68ae0
00068b0e  ldr     r2, [pc, #0x44]
00068b10  lsl.w   r3, ip, #3
00068b14  add     r2, pc ; -> 0x000678e9  t_d_backup_jump
00068b16  adds    r3, r3, r0
00068b18  str     r2, [r3, #4]
00068b1a  ldr.w   r3, [r0, #0xa4]
00068b1e  movs    r2, #0
00068b20  adds    r3, #1
00068b22  str.w   r2, [r0, r3, lsl #3]
00068b26  mov     r0, r2
00068b28  b       #0x68ae0
00068b2a  movs    r2, #0x80
00068b2c  str     r2, [r3, #0x1c]
00068b2e  ldr.w   r3, [r0, #0xa4]
00068b32  movw    r2, #0x7f7
00068b36  adds    r3, #1
00068b38  str.w   r2, [r0, r3, lsl #3]
00068b3c  ldr.w   r3, [r0, #0xa4]
00068b40  ldr     r2, [pc, #0x14]
00068b42  adds    r3, #1
00068b44  add     r2, pc ; -> 0x0006c77d  t_d_wait_nonattack
00068b46  str.w   r3, [r0, #0xa4]
00068b4a  lsls    r3, r3, #3
00068b4c  b       #0x68b16
00068b4e  nop     
00068b50  add     r5, sp, #0x238
00068b52  movs    r0, r1
00068b54  ldcl    p15, c15, [r1, #0x3fc]
00068b58  subs    r4, #0x35
00068b5a  movs    r0, r0
