========================================================================
t_d_open_jumpover  0x00068a28  144 bytes   mkdrone.c
========================================================================

00068a28  ldr.w   r1, [r0, #0xa4]
00068a2c  movw    ip, #0x7d7
00068a30  adds    r3, r1, #1
00068a32  ldr.w   r2, [r0, r3, lsl #3]
00068a36  cmp     r2, ip
00068a38  beq     #0x68a8a
00068a3a  cmp.w   r2, #0x7d8
00068a3e  beq     #0x68a6e
00068a40  cbz     r2, #0x68a48
00068a42  mvn     r0, #2
00068a46  bx      lr
00068a48  str.w   ip, [r0, r3, lsl #3]
00068a4c  ldr.w   r3, [r0, #0xa4]
00068a50  ldr     r1, [pc, #0x58]
00068a52  adds    r3, #1
00068a54  str.w   r3, [r0, #0xa4]
00068a58  lsls    r3, r3, #3
00068a5a  adds    r3, r3, r0
00068a5c  add     r1, pc ; -> 0x00070de1  t_d_fflip_jsrp
00068a5e  str     r1, [r3, #4]
00068a60  ldr.w   r3, [r0, #0xa4]
00068a64  adds    r3, #1
00068a66  str.w   r2, [r0, r3, lsl #3]
00068a6a  mov     r0, r2
00068a6c  b       #0x68a46
00068a6e  ldr.w   r2, [pc, #0x40]
00068a72  lsls    r3, r1, #3
00068a74  adds    r3, r3, r0
00068a76  add     r2, pc ; -> 0x000680fd  t_d_bflip_jump
00068a78  str     r2, [r3, #4]
00068a7a  ldr.w   r3, [r0, #0xa4]
00068a7e  movs    r2, #0
00068a80  adds    r3, #1
00068a82  str.w   r2, [r0, r3, lsl #3]
00068a86  mov     r0, r2
00068a88  b       #0x68a46
00068a8a  mov.w   r2, #0x7d8
00068a8e  str.w   r2, [r0, r3, lsl #3]
00068a92  ldr.w   r3, [r0, #0xa4]
00068a96  adds    r2, r3, #1
00068a98  ldr     r3, [pc, #0x18]
00068a9a  str.w   r2, [r0, #0xa4]
00068a9e  add     r3, pc ; -> 0x000f37a8  t_check_winner_status
00068aa0  ldr     r1, [r3]
00068aa2  lsls    r3, r2, #3
00068aa4  adds    r3, r3, r0
00068aa6  str     r1, [r3, #4]
00068aa8  b       #0x68a7a
00068aaa  nop     
00068aac  strh    r1, [r0, #0x1c]
00068aae  movs    r0, r0
00068ab0  bl      #0xffeecab2
00068ab4  add     r5, sp, #0x18
00068ab6  movs    r0, r1
