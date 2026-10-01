========================================================================
tl_do_spit  0x0007ad24  276 bytes   mkzap.c
========================================================================

0007ad24  push    {r4, r5, r6, r7, lr}
0007ad26  add     r7, sp, #0xc
0007ad28  str     r8, [sp, #-0x4]!
0007ad2c  ldr.w   r2, [r0, #0xa4]
0007ad30  movw    r8, #0x4b6
0007ad34  mov     r4, r0
0007ad36  adds    r3, r2, #1
0007ad38  ldr.w   r5, [r0, #0x108]
0007ad3c  ldr.w   r6, [r0, r3, lsl #3]
0007ad40  cmp     r6, r8
0007ad42  beq     #0x7adb8
0007ad44  ble     #0x7ad5e
0007ad46  movw    r3, #0x4bd
0007ad4a  cmp     r6, r3
0007ad4c  beq     #0x7ade4
0007ad4e  adds    r3, #2
0007ad50  cmp     r6, r3
0007ad52  beq     #0x7adaa
0007ad54  mvn     r0, #2
0007ad58  ldr     r8, [sp], #4
0007ad5c  pop     {r4, r5, r6, r7, pc}
0007ad5e  cmp     r6, #0
0007ad60  bne     #0x7ad54
0007ad62  movs    r3, #0x23
0007ad64  mov     r0, r5
0007ad66  str     r3, [r5, #0x20]
0007ad68  str     r6, [r5, #0x44]
0007ad6a  bl      #0x79590 ; -> zap_init_special_act
0007ad6e  mov     r0, r5
0007ad70  movs    r3, #8
0007ad72  str     r3, [r5, #0x1c]
0007ad74  bl      #0x57be4 ; -> ochar_sound
0007ad78  ldr     r3, [pc, #0xa8]
0007ad7a  mov     r0, r6
0007ad7c  str     r3, [r5, #0x40]
0007ad7e  ldr.w   r3, [r4, #0xa4]
0007ad82  adds    r3, #1
0007ad84  str.w   r8, [r4, r3, lsl #3]
0007ad88  ldr.w   r3, [r4, #0xa4]
0007ad8c  adds    r2, r3, #1
0007ad8e  ldr     r3, [pc, #0x98]
0007ad90  str.w   r2, [r4, #0xa4]
0007ad94  add     r3, pc ; -> 0x000f36c0  t_animate2_a9
0007ad96  ldr     r1, [r3]
0007ad98  lsls    r3, r2, #3
0007ad9a  adds    r3, r3, r4
0007ad9c  str     r1, [r3, #4]
0007ad9e  ldr.w   r3, [r4, #0xa4]
0007ada2  adds    r3, #1
0007ada4  str.w   r6, [r4, r3, lsl #3]
0007ada8  b       #0x7ad58
0007adaa  cmp     r2, #0
0007adac  ble     #0x7ae1c
0007adae  subs    r3, r2, #1
0007adb0  str.w   r3, [r0, #0xa4]
0007adb4  movs    r0, #0
0007adb6  b       #0x7ad58
0007adb8  ldr     r3, [pc, #0x70]
0007adba  mov     r0, r5
0007adbc  add     r3, pc ; -> 0x0007bbcd  t_spit_proc
0007adbe  str     r3, [r5, #0x38]
0007adc0  bl      #0x75964 ; -> create_proj_proc
0007adc4  ldr     r0, [r5]
0007adc6  movw    r3, #0x604
0007adca  str     r3, [r5, #0x1c]
0007adcc  movw    r2, #0x4bd
0007add0  str     r3, [r0, #0x18]
0007add2  ldr.w   r3, [r4, #0xa4]
0007add6  movs    r0, #0x1f
0007add8  adds    r3, #1
0007adda  str.w   r2, [r4, r3, lsl #3]
0007adde  str.w   r0, [r4, #0xfc]
0007ade2  b       #0x7ad58
0007ade4  movs    r3, #4
0007ade6  str     r3, [r5, #0x1c]
0007ade8  ldr.w   r3, [r0, #0xa4]
0007adec  movw    r2, #0x4bf
0007adf0  adds    r3, #1
0007adf2  str.w   r2, [r0, r3, lsl #3]
0007adf6  ldr.w   r3, [r0, #0xa4]
0007adfa  adds    r2, r3, #1
0007adfc  ldr.w   r3, [pc, #0x30]
0007ae00  str.w   r2, [r0, #0xa4]
0007ae04  add     r3, pc ; -> 0x000f37cc  t_mframew
0007ae06  ldr     r1, [r3]
0007ae08  lsls    r3, r2, #3
0007ae0a  adds    r3, r3, r4
0007ae0c  movs    r0, #0
0007ae0e  str     r1, [r3, #4]
0007ae10  ldr.w   r3, [r4, #0xa4]
0007ae14  adds    r3, #1
0007ae16  str.w   r0, [r4, r3, lsl #3]
0007ae1a  b       #0x7ad58
0007ae1c  ldr     r3, [pc, #0x14]
0007ae1e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0007ae20  b       #0x7ae06
0007ae22  nop     
0007ae24  movs    r6, r0
0007ae26  movs    r3, r0
0007ae28  ldrh    r0, [r5, #8]
0007ae2a  movs    r7, r0
0007ae2c  lsrs    r5, r1, #0x18
0007ae2e  movs    r0, r0
0007ae30  ldrh    r4, [r0, #0xe]
0007ae32  movs    r7, r0
0007ae34  ldrh    r6, [r4, #6]
0007ae36  movs    r7, r0
