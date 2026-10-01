========================================================================
t_jmp4  0x00030a60  388 bytes   joy.c
========================================================================

00030a60  push    {r4, r5, r6, r7, lr}
00030a62  add     r7, sp, #0xc
00030a64  push.w  {r8, sl}
00030a68  ldr.w   r2, [r0, #0xa4]
00030a6c  movw    r8, #0x7f7
00030a70  mov     r5, r0
00030a72  adds    r3, r2, #1
00030a74  ldr.w   r4, [r0, #0x108]
00030a78  ldr.w   r6, [r0, r3, lsl #3]
00030a7c  cmp     r6, r8
00030a7e  beq     #0x30b1c
00030a80  movw    r3, #0x807
00030a84  cmp     r6, r3
00030a86  beq     #0x30af4
00030a88  cbz     r6, #0x30a94
00030a8a  mvn     r0, #2
00030a8e  pop.w   {r8, sl}
00030a92  pop     {r4, r5, r6, r7, pc}
00030a94  mov     r0, r4
00030a96  bl      #0x308c4 ; -> get_last_button
00030a9a  ldr     r2, [r4]
00030a9c  ldr     r3, [r4, #0x1c]
00030a9e  mov     r0, r4
00030aa0  mov.w   sl, #3
00030aa4  str     r3, [r2, #0x30]
00030aa6  ldr     r3, [r4]
00030aa8  str.w   sl, [r3, #0x58]
00030aac  str     r6, [r4, #0x1c]
00030aae  bl      #0x580a4 ; -> group_sound
00030ab2  mov     r0, r4
00030ab4  movs    r1, #0xe
00030ab6  bl      #0x57dbc ; -> rsnd_func
00030aba  str.w   sl, [r4, #0x1c]
00030abe  mov.w   r3, #0x102
00030ac2  str     r3, [r4, #0x20]
00030ac4  ldr.w   r3, [r5, #0xa4]
00030ac8  mov     r0, r6
00030aca  adds    r3, #1
00030acc  str.w   r8, [r5, r3, lsl #3]
00030ad0  ldr.w   r3, [r5, #0xa4]
00030ad4  adds    r2, r3, #1
00030ad6  ldr     r3, [pc, #0xec]
00030ad8  str.w   r2, [r5, #0xa4]
00030adc  add     r3, pc ; -> 0x000f37e8  t_act_mframew
00030ade  ldr     r1, [r3]
00030ae0  lsl.w   r3, r2, sl
00030ae4  adds    r3, r3, r5
00030ae6  str     r1, [r3, #4]
00030ae8  ldr.w   r3, [r5, #0xa4]
00030aec  adds    r3, #1
00030aee  str.w   r6, [r5, r3, lsl #3]
00030af2  b       #0x30a8e
00030af4  ldr     r0, [r4, #0x5c]
00030af6  cbz     r0, #0x30b4c
00030af8  ldr     r3, [r4, #0x1c]
00030afa  lsrs    r0, r3, #0x10
00030afc  str     r0, [r4, #0x1c]
00030afe  cmp     r0, #0
00030b00  bne     #0x30bb2
00030b02  ldr.w   r3, [r5, #0xa4]
00030b06  ldr     r2, [pc, #0xc0]
00030b08  lsls    r3, r3, #3
00030b0a  adds    r3, r3, r5
00030b0c  add     r2, pc ; -> 0x0002f659  t_joy_punch_mth1
00030b0e  str     r2, [r3, #4]
00030b10  ldr.w   r3, [r5, #0xa4]
00030b14  adds    r3, #1
00030b16  str.w   r0, [r5, r3, lsl #3]
00030b1a  b       #0x30a8e
00030b1c  ldr.w   r3, [pc, #0xac]
00030b20  add     r3, pc ; -> 0x0016564c  bt_jump+0x28
00030b22  ldr     r3, [r3]
00030b24  ldrh.w  r6, [r3, #0x452]
00030b28  sxth    r3, r6
00030b2a  str     r3, [r4, #0x1c]
00030b2c  cbz     r6, #0x30b64
00030b2e  ldr.w   r2, [pc, #0xa0]
00030b32  add     r2, pc ; -> 0x0002f4a1  t_joy_un_lo_punch1
00030b34  ldr.w   r3, [r5, #0xa4]
00030b38  movs    r0, #0
00030b3a  lsls    r3, r3, #3
00030b3c  adds    r3, r3, r5
00030b3e  str     r2, [r3, #4]
00030b40  ldr.w   r3, [r5, #0xa4]
00030b44  adds    r3, #1
00030b46  str.w   r0, [r5, r3, lsl #3]
00030b4a  b       #0x30a8e
00030b4c  ldr.w   r1, [pc, #0x84]
00030b50  lsls    r3, r2, #3
00030b52  adds    r3, r3, r5
00030b54  add     r1, pc ; -> 0x0002f4a1  t_joy_un_lo_punch1
00030b56  str     r1, [r3, #4]
00030b58  ldr.w   r3, [r5, #0xa4]
00030b5c  adds    r3, #1
00030b5e  str.w   r0, [r5, r3, lsl #3]
00030b62  b       #0x30a8e
00030b64  movs    r3, #1
00030b66  mov     r0, r4
00030b68  str     r3, [r4, #0x44]
00030b6a  adds    r3, #2
00030b6c  str     r3, [r4, #0x48]
00030b6e  str     r3, [r4, #0x1c]
00030b70  bl      #0x594c8 ; -> strike_check_a0
00030b74  ldr     r3, [r4, #0x5c]
00030b76  cbz     r3, #0x30b7e
00030b78  mov.w   r3, #-1
00030b7c  str     r3, [r4, #0x48]
00030b7e  movs    r3, #5
00030b80  str     r3, [r4, #0x44]
00030b82  ldr.w   r3, [r5, #0xa4]
00030b86  movw    r2, #0x807
00030b8a  mov     r0, r6
00030b8c  adds    r3, #1
00030b8e  str.w   r2, [r5, r3, lsl #3]
00030b92  ldr.w   r3, [r5, #0xa4]
00030b96  ldr     r2, [pc, #0x40]
00030b98  adds    r3, #1
00030b9a  str.w   r3, [r5, #0xa4]
00030b9e  lsls    r3, r3, #3
00030ba0  adds    r3, r3, r5
00030ba2  add     r2, pc ; -> 0x00030eed  t_punch_sleep
00030ba4  str     r2, [r3, #4]
00030ba6  ldr.w   r3, [r5, #0xa4]
00030baa  adds    r3, #1
00030bac  str.w   r6, [r5, r3, lsl #3]
00030bb0  b       #0x30a8e
00030bb2  cmp     r0, #1
00030bb4  beq     #0x30bbe
00030bb6  ldr.w   r2, [pc, #0x24]
00030bba  add     r2, pc ; -> 0x0002f4a1  t_joy_un_lo_punch1
00030bbc  b       #0x30b34
00030bbe  ldr     r2, [pc, #0x20]
00030bc0  add     r2, pc ; -> 0x000308dd  t_jmp5
00030bc2  b       #0x30b34
00030bc4  cmp     r5, #8
00030bc6  movs    r4, r1
00030bc8  adc.w   pc, sb, pc, ror #31
00030bcc  ldr     r3, [pc, #0xa0]
00030bce  movs    r3, r2
00030bd0  strd    pc, pc, [fp, #-0x3fc]!
00030bd4  strd    pc, pc, [sb, #-0x3fc]
00030bd8  lsls    r7, r0, #0xd
00030bda  movs    r0, r0
00030bdc  strd    pc, pc, [r3], #0x3fc
00030be0  ldc2    p15, c15, [sb, #-0x3fc]
