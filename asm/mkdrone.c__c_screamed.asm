========================================================================
c_screamed  0x0006ad84  188 bytes   mkdrone.c
========================================================================

0006ad84  push    {lr}
0006ad86  ldr.w   ip, [r0, #0xa4]
0006ad8a  movw    lr, #0x108f
0006ad8e  ldr.w   r1, [r0, #0x108]
0006ad92  add.w   r3, ip, #1
0006ad96  ldr.w   r2, [r0, r3, lsl #3]
0006ad9a  cmp     r2, lr
0006ad9c  beq     #0x6adfe
0006ad9e  movw    r3, #0x1093
0006ada2  cmp     r2, r3
0006ada4  beq     #0x6ade2
0006ada6  cbz     r2, #0x6adae
0006ada8  mvn     r0, #2
0006adac  pop     {pc}
0006adae  movs    r3, #0x30
0006adb0  str     r3, [r1, #0x44]
0006adb2  adds    r3, #0x15
0006adb4  str     r3, [r1, #0x48]
0006adb6  ldr.w   r3, [r0, #0xa4]
0006adba  ldr     r1, [pc, #0x74]
0006adbc  adds    r3, #1
0006adbe  add     r1, pc ; -> 0x00072b95  t_d_stalk_a11
0006adc0  str.w   lr, [r0, r3, lsl #3]
0006adc4  ldr.w   r3, [r0, #0xa4]
0006adc8  adds    r3, #1
0006adca  str.w   r3, [r0, #0xa4]
0006adce  lsls    r3, r3, #3
0006add0  adds    r3, r3, r0
0006add2  str     r1, [r3, #4]
0006add4  ldr.w   r3, [r0, #0xa4]
0006add8  adds    r3, #1
0006adda  str.w   r2, [r0, r3, lsl #3]
0006adde  mov     r0, r2
0006ade0  b       #0x6adac
0006ade2  ldr     r2, [pc, #0x50]
0006ade4  lsl.w   r3, ip, #3
0006ade8  add     r2, pc ; -> 0x000723cd  t_d_elbow
0006adea  adds    r3, r3, r0
0006adec  str     r2, [r3, #4]
0006adee  ldr.w   r3, [r0, #0xa4]
0006adf2  movs    r2, #0
0006adf4  adds    r3, #1
0006adf6  str.w   r2, [r0, r3, lsl #3]
0006adfa  mov     r0, r2
0006adfc  b       #0x6adac
0006adfe  movs    r3, #0x30
0006ae00  str     r3, [r1, #0x44]
0006ae02  ldr.w   r3, [pc, #0x34]
0006ae06  movw    r2, #0x1093
0006ae0a  add     r3, pc ; -> 0x000f3030  is_he_airborn
0006ae0c  ldr     r3, [r3]
0006ae0e  str     r3, [r1, #0x48]
0006ae10  ldr.w   r3, [r0, #0xa4]
0006ae14  adds    r3, #1
0006ae16  str.w   r2, [r0, r3, lsl #3]
0006ae1a  ldr.w   r3, [r0, #0xa4]
0006ae1e  ldr.w   r2, [pc, #0x1c]
0006ae22  adds    r3, #1
0006ae24  add     r2, pc ; -> 0x00071ee5  t_stance_wait_no
0006ae26  str.w   r3, [r0, #0xa4]
0006ae2a  lsls    r3, r3, #3
0006ae2c  b       #0x6adea
0006ae2e  nop     
0006ae30  ldrb    r3, [r2, #0x17]
0006ae32  movs    r0, r0
0006ae34  strb    r1, [r4, #0x17]
0006ae36  movs    r0, r0
0006ae38  strh    r2, [r4, #0x10]
0006ae3a  movs    r0, r1
0006ae3c  strb    r5, [r7, #2]
0006ae3e  movs    r0, r0
