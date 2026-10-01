========================================================================
t_slammed_shake_up  0x00047af4  92 bytes   mkreact.c
========================================================================

00047af4  push    {r4, r5, r6, r7, lr}
00047af6  add     r7, sp, #0xc
00047af8  ldr.w   r3, [r0, #0xa4]
00047afc  mov     r4, r0
00047afe  ldr.w   r5, [r0, #0x108]
00047b02  adds    r3, #1
00047b04  ldr.w   r6, [r0, r3, lsl #3]
00047b08  cbnz    r6, #0x47b42
00047b0a  mov     r0, r5
00047b0c  bl      #0x47ad8 ; -> pose_stumble_frame_1
00047b10  ldr     r2, [r5, #8]
00047b12  ldr     r3, [pc, #0x34]
00047b14  mov     r0, r6
00047b16  str     r3, [r2, #0x1c]
00047b18  mov.w   r3, #0x30003
00047b1c  str     r3, [r5, #0x1c]
00047b1e  movs    r3, #2
00047b20  str     r3, [r5, #0x20]
00047b22  adds    r3, r3, r3
00047b24  str     r3, [r5, #0x24]
00047b26  ldr     r3, [pc, #0x24]
00047b28  add     r3, pc ; -> 0x000f36f8  t_shake_ob_up
00047b2a  ldr     r2, [r3]
00047b2c  ldr.w   r3, [r4, #0xa4]
00047b30  lsls    r3, r3, #3
00047b32  adds    r3, r3, r4
00047b34  str     r2, [r3, #4]
00047b36  ldr.w   r3, [r4, #0xa4]
00047b3a  adds    r3, #1
00047b3c  str.w   r6, [r4, r3, lsl #3]
00047b40  pop     {r4, r5, r6, r7, pc}
00047b42  mvn     r0, #2
00047b46  b       #0x47b40
00047b48  movs    r0, r0
00047b4a  vtbx.8  d27, {d30, d31, fpinst2, mvfr0}, d12
00047b4e  movs    r2, r1
