========================================================================
tl_do_lao_zap  0x00079e5c  244 bytes   mkzap.c
========================================================================

00079e5c  push    {r4, r5, r6, r7, lr}
00079e5e  add     r7, sp, #0xc
00079e60  str     r8, [sp, #-0x4]!
00079e64  ldr.w   r3, [r0, #0xa4]
00079e68  movw    r8, #0xdaa
00079e6c  mov     r4, r0
00079e6e  adds    r3, #1
00079e70  ldr.w   r5, [r0, #0x108]
00079e74  ldr.w   r6, [r0, r3, lsl #3]
00079e78  cmp     r6, r8
00079e7a  beq     #0x79efa
00079e7c  movw    r3, #0xdaf
00079e80  cmp     r6, r3
00079e82  beq     #0x79ed8
00079e84  cbz     r6, #0x79e90
00079e86  mvn     r0, #2
00079e8a  ldr     r8, [sp], #4
00079e8e  pop     {r4, r5, r6, r7, pc}
00079e90  movs    r3, #0xc
00079e92  mov     r0, r5
00079e94  str     r3, [r5, #0x20]
00079e96  str     r6, [r5, #0x44]
00079e98  bl      #0x79590 ; -> zap_init_special_act
00079e9c  mov     r0, r5
00079e9e  movs    r3, #1
00079ea0  str     r3, [r5, #0x1c]
00079ea2  bl      #0x57be4 ; -> ochar_sound
00079ea6  ldr     r3, [pc, #0x94]
00079ea8  mov     r0, r6
00079eaa  str     r3, [r5, #0x40]
00079eac  ldr.w   r3, [r4, #0xa4]
00079eb0  adds    r3, #1
00079eb2  str.w   r8, [r4, r3, lsl #3]
00079eb6  ldr.w   r3, [r4, #0xa4]
00079eba  adds    r2, r3, #1
00079ebc  ldr     r3, [pc, #0x80]
00079ebe  str.w   r2, [r4, #0xa4]
00079ec2  add     r3, pc ; -> 0x000f36d0  t_animate_a9
00079ec4  ldr     r1, [r3]
00079ec6  lsls    r3, r2, #3
00079ec8  adds    r3, r3, r4
00079eca  str     r1, [r3, #4]
00079ecc  ldr.w   r3, [r4, #0xa4]
00079ed0  adds    r3, #1
00079ed2  str.w   r6, [r4, r3, lsl #3]
00079ed6  b       #0x79e8a
00079ed8  movs    r3, #5
00079eda  str     r3, [r5, #0x1c]
00079edc  ldr     r3, [pc, #0x64]
00079ede  add     r3, pc ; -> 0x000f37cc  t_mframew
00079ee0  ldr     r2, [r3]
00079ee2  ldr.w   r3, [r0, #0xa4]
00079ee6  lsls    r3, r3, #3
00079ee8  adds    r3, r3, r0
00079eea  str     r2, [r3, #4]
00079eec  ldr.w   r3, [r0, #0xa4]
00079ef0  movs    r0, #0
00079ef2  adds    r3, #1
00079ef4  str.w   r0, [r4, r3, lsl #3]
00079ef8  b       #0x79e8a
00079efa  ldr     r3, [pc, #0x4c]
00079efc  mov     r0, r5
00079efe  add     r3, pc ; -> 0x00078a65  t_lao_hat_proc
00079f00  str     r3, [r5, #0x38]
00079f02  bl      #0x75964 ; -> create_proj_proc
00079f06  movs    r3, #3
00079f08  str     r3, [r5, #0x1c]
00079f0a  ldr.w   r3, [r4, #0xa4]
00079f0e  movw    r2, #0xdaf
00079f12  movs    r0, #0
00079f14  adds    r3, #1
00079f16  str.w   r2, [r4, r3, lsl #3]
00079f1a  ldr.w   r3, [r4, #0xa4]
00079f1e  adds    r2, r3, #1
00079f20  ldr     r3, [pc, #0x28]
00079f22  str.w   r2, [r4, #0xa4]
00079f26  add     r3, pc ; -> 0x000f37cc  t_mframew
00079f28  ldr     r1, [r3]
00079f2a  lsls    r3, r2, #3
00079f2c  adds    r3, r3, r4
00079f2e  str     r1, [r3, #4]
00079f30  ldr.w   r3, [r4, #0xa4]
00079f34  adds    r3, #1
00079f36  str.w   r0, [r4, r3, lsl #3]
00079f3a  b       #0x79e8a
00079f3c  movs    r4, r4
00079f3e  movs    r3, r0
00079f40  ldr     r0, [sp, #0x28]
00079f42  movs    r7, r0
00079f44  ldr     r0, [sp, #0x3a8]
00079f46  movs    r7, r0
00079f48  sbc.w   pc, r3, pc, ror #31
00079f4c  ldr     r0, [sp, #0x288]
00079f4e  movs    r7, r0
