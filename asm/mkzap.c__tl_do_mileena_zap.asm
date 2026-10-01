========================================================================
tl_do_mileena_zap  0x0007ca14  284 bytes   mkzap.c
========================================================================

0007ca14  push    {r4, r5, r6, r7, lr}
0007ca16  add     r7, sp, #0xc
0007ca18  str     r8, [sp, #-0x4]!
0007ca1c  ldr.w   r2, [r0, #0xa4]
0007ca20  movw    r8, #0x1fb
0007ca24  mov     r4, r0
0007ca26  adds    r3, r2, #1
0007ca28  ldr.w   r5, [r0, #0x108]
0007ca2c  ldr.w   r6, [r0, r3, lsl #3]
0007ca30  cmp     r6, r8
0007ca32  beq     #0x7ca9a
0007ca34  ble     #0x7ca4c
0007ca36  cmp.w   r6, #0x1fe
0007ca3a  beq     #0x7cad0
0007ca3c  cmp.w   r6, #0x208
0007ca40  beq     #0x7ca8c
0007ca42  mvn     r0, #2
0007ca46  ldr     r8, [sp], #4
0007ca4a  pop     {r4, r5, r6, r7, pc}
0007ca4c  cmp     r6, #0
0007ca4e  bne     #0x7ca42
0007ca50  mov     r0, r5
0007ca52  movs    r3, #8
0007ca54  str     r3, [r5, #0x1c]
0007ca56  bl      #0x57be4 ; -> ochar_sound
0007ca5a  mov     r0, r5
0007ca5c  bl      #0x55070 ; -> am_i_airborn
0007ca60  cmp     r0, #0
0007ca62  bne     #0x7cb04
0007ca64  movs    r3, #0x24
0007ca66  str     r0, [r5, #0x44]
0007ca68  str     r3, [r5, #0x20]
0007ca6a  mov     r0, r5
0007ca6c  bl      #0x79590 ; -> zap_init_special_act
0007ca70  mov     r0, r5
0007ca72  movs    r3, #0x14
0007ca74  str     r3, [r5, #0x40]
0007ca76  bl      #0x5a000 ; -> pose2_a9_manual
0007ca7a  ldr.w   r3, [r4, #0xa4]
0007ca7e  movs    r0, #7
0007ca80  adds    r3, #1
0007ca82  str.w   r8, [r4, r3, lsl #3]
0007ca86  str.w   r0, [r4, #0xfc]
0007ca8a  b       #0x7ca46
0007ca8c  cmp     r2, #0
0007ca8e  ble     #0x7cafe
0007ca90  subs    r3, r2, #1
0007ca92  str.w   r3, [r0, #0xa4]
0007ca96  movs    r0, #0
0007ca98  b       #0x7ca46
0007ca9a  movs    r3, #3
0007ca9c  str     r3, [r5, #0x1c]
0007ca9e  ldr.w   r3, [r0, #0xa4]
0007caa2  mov.w   r2, #0x1fe
0007caa6  adds    r3, #1
0007caa8  str.w   r2, [r0, r3, lsl #3]
0007caac  ldr.w   r3, [r0, #0xa4]
0007cab0  adds    r2, r3, #1
0007cab2  ldr     r3, [pc, #0x6c]
0007cab4  str.w   r2, [r0, #0xa4]
0007cab8  add     r3, pc ; -> 0x000f37cc  t_mframew
0007caba  ldr     r1, [r3]
0007cabc  lsls    r3, r2, #3
0007cabe  adds    r3, r3, r4
0007cac0  movs    r0, #0
0007cac2  str     r1, [r3, #4]
0007cac4  ldr.w   r3, [r4, #0xa4]
0007cac8  adds    r3, #1
0007caca  str.w   r0, [r4, r3, lsl #3]
0007cace  b       #0x7ca46
0007cad0  ldr.w   r3, [pc, #0x50]
0007cad4  mov     r0, r5
0007cad6  add     r3, pc ; -> 0x00074cfd  t_sai_proc
0007cad8  str     r3, [r5, #0x38]
0007cada  bl      #0x75964 ; -> create_proj_proc
0007cade  ldr     r0, [r5]
0007cae0  movw    r3, #0x604
0007cae4  str     r3, [r5, #0x1c]
0007cae6  mov.w   r2, #0x208
0007caea  str     r3, [r0, #0x18]
0007caec  ldr.w   r3, [r4, #0xa4]
0007caf0  movs    r0, #0x25
0007caf2  adds    r3, #1
0007caf4  str.w   r2, [r4, r3, lsl #3]
0007caf8  str.w   r0, [r4, #0xfc]
0007cafc  b       #0x7ca46
0007cafe  ldr     r3, [pc, #0x28]
0007cb00  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0007cb02  b       #0x7caba
0007cb04  ldr.w   r3, [r4, #0xa4]
0007cb08  ldr     r2, [pc, #0x20]
0007cb0a  mov     r0, r6
0007cb0c  lsls    r3, r3, #3
0007cb0e  adds    r3, r3, r4
0007cb10  add     r2, pc ; -> 0x0007b731  tl_mileena_air_zap
0007cb12  str     r2, [r3, #4]
0007cb14  ldr.w   r3, [r4, #0xa4]
0007cb18  adds    r3, #1
0007cb1a  str.w   r6, [r4, r3, lsl #3]
0007cb1e  b       #0x7ca46
0007cb20  ldr     r0, [r2, #0x50]
0007cb22  movs    r7, r0
0007cb24  strh    r3, [r4, #0x10]
0007cb26  vdup.8  d22, d4[7]
0007cb2a  movs    r7, r0
