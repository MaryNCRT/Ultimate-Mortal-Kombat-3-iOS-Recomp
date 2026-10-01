========================================================================
t_d_backup_jsrp  0x000719fc  300 bytes   mkdrone.c
========================================================================

000719fc  push    {r4, r5, r7, lr}
000719fe  add     r7, sp, #8
00071a00  ldr.w   r2, [r0, #0xa4]
00071a04  mov     r4, r0
00071a06  ldr.w   r5, [r0, #0x108]
00071a0a  adds    r1, r2, #1
00071a0c  ldr.w   r3, [r0, r1, lsl #3]
00071a10  movw    r0, #0x25b
00071a14  cmp     r3, r0
00071a16  beq     #0x71aaa
00071a18  ble     #0x71a34
00071a1a  movw    r0, #0x261
00071a1e  cmp     r3, r0
00071a20  beq     #0x71acc
00071a22  cmp.w   r3, #0x264
00071a26  beq     #0x71a9c
00071a28  cmp.w   r3, #0x260
00071a2c  beq     #0x71aec
00071a2e  mvn     r0, #2
00071a32  pop     {r4, r5, r7, pc}
00071a34  cbz     r3, #0x71a64
00071a36  movw    r2, #0x25a
00071a3a  cmp     r3, r2
00071a3c  bne     #0x71a2e
00071a3e  ldr     r2, [pc, #0xdc]
00071a40  str.w   r0, [r4, r1, lsl #3]
00071a44  ldr.w   r3, [r4, #0xa4]
00071a48  add     r2, pc ; -> 0x0006c40d  t_d_beware
00071a4a  adds    r3, #1
00071a4c  str.w   r3, [r4, #0xa4]
00071a50  lsls    r3, r3, #3
00071a52  adds    r3, r3, r4
00071a54  movs    r0, #0
00071a56  str     r2, [r3, #4]
00071a58  ldr.w   r3, [r4, #0xa4]
00071a5c  adds    r3, #1
00071a5e  str.w   r0, [r4, r3, lsl #3]
00071a62  b       #0x71a32
00071a64  ldr     r2, [r5]
00071a66  mov     r0, r5
00071a68  movw    r3, #0x301
00071a6c  str     r3, [r5, #0x20]
00071a6e  str     r3, [r2, #0x18]
00071a70  movs    r3, #4
00071a72  str     r3, [r5, #0x40]
00071a74  bl      #0x5520c ; -> get_char_ani
00071a78  ldr     r3, [r5, #0x40]
00071a7a  mov     r0, r5
00071a7c  str     r3, [r5, #0x44]
00071a7e  adds    r3, #8
00071a80  str     r3, [r5, #0x40]
00071a82  bl      #0x59e24 ; -> do_next_a9_frame
00071a86  ldr.w   r3, [r4, #0xa4]
00071a8a  movs    r0, #2
00071a8c  movw    r2, #0x25a
00071a90  adds    r3, #1
00071a92  str.w   r2, [r4, r3, lsl #3]
00071a96  str.w   r0, [r4, #0xfc]
00071a9a  b       #0x71a32
00071a9c  cmp     r2, #0
00071a9e  ble     #0x71b00
00071aa0  subs    r3, r2, #1
00071aa2  movs    r0, #0
00071aa4  str.w   r3, [r4, #0xa4]
00071aa8  b       #0x71a32
00071aaa  ldr     r3, [r5, #0x44]
00071aac  mov     r0, r5
00071aae  adds    r3, #4
00071ab0  str     r3, [r5, #0x40]
00071ab2  bl      #0x59e24 ; -> do_next_a9_frame
00071ab6  ldr.w   r3, [r4, #0xa4]
00071aba  movs    r0, #2
00071abc  mov.w   r2, #0x260
00071ac0  adds    r3, #1
00071ac2  str.w   r2, [r4, r3, lsl #3]
00071ac6  str.w   r0, [r4, #0xfc]
00071aca  b       #0x71a32
00071acc  ldr     r3, [r5, #0x44]
00071ace  mov     r0, r5
00071ad0  str     r3, [r5, #0x40]
00071ad2  bl      #0x59e24 ; -> do_next_a9_frame
00071ad6  ldr.w   r3, [r4, #0xa4]
00071ada  movs    r0, #2
00071adc  mov.w   r2, #0x264
00071ae0  adds    r3, #1
00071ae2  str.w   r2, [r4, r3, lsl #3]
00071ae6  str.w   r0, [r4, #0xfc]
00071aea  b       #0x71a32
00071aec  str.w   r0, [r4, r1, lsl #3]
00071af0  ldr     r2, [pc, #0x2c]
00071af2  ldr.w   r3, [r4, #0xa4]
00071af6  add     r2, pc ; -> 0x0006c40d  t_d_beware
00071af8  adds    r3, #1
00071afa  str.w   r3, [r4, #0xa4]
00071afe  b       #0x71a50
00071b00  ldr     r3, [pc, #0x20]
00071b02  movs    r0, #0
00071b04  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00071b06  ldr     r1, [r3]
00071b08  lsls    r3, r2, #3
00071b0a  adds    r3, r3, r4
00071b0c  str     r1, [r3, #4]
00071b0e  ldr.w   r3, [r4, #0xa4]
00071b12  adds    r3, #1
00071b14  str.w   r0, [r4, r3, lsl #3]
00071b18  b       #0x71a32
00071b1a  nop     
00071b1c  add     r1, sp, #0x304
