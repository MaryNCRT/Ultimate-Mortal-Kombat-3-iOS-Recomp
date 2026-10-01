========================================================================
t_d_propell_attack_now  0x00067f18  92 bytes   mkdrone.c
========================================================================

00067f18  ldr.w   r3, [r0, #0xa4]
00067f1c  ldr.w   ip, [r0, #0x108]
00067f20  adds    r3, #1
00067f22  ldr.w   r1, [r0, r3, lsl #3]
00067f26  cbz     r1, #0x67f2e
00067f28  mvn     r0, #2
00067f2c  bx      lr
00067f2e  ldr.w   r3, [ip, #8]
00067f32  ldr     r2, [pc, #0x34]
00067f34  ldr     r3, [r3, #0x24]
00067f36  add     r2, pc ; -> 0x00171c70  ochar_props
00067f38  ldr.w   r3, [r2, r3, lsl #2]
00067f3c  cmp     r3, #0
00067f3e  str.w   r3, [ip, #0x1c]
00067f42  blt     #0x67f62
00067f44  ldr.w   r2, [pc, #0x24]
00067f48  add     r2, pc ; -> 0x0006c265  t_d_body_propell
00067f4a  ldr.w   r3, [r0, #0xa4]
00067f4e  lsls    r3, r3, #3
00067f50  adds    r3, r3, r0
00067f52  str     r2, [r3, #4]
00067f54  ldr.w   r3, [r0, #0xa4]
00067f58  adds    r3, #1
00067f5a  str.w   r1, [r0, r3, lsl #3]
00067f5e  mov     r0, r1
00067f60  b       #0x67f2c
00067f62  ldr     r2, [pc, #0xc]
00067f64  add     r2, pc ; -> 0x000677b9  t_stalk_in_close
00067f66  b       #0x67f4a
00067f68  ldr     r5, [sp, #0xd8]
00067f6a  movs    r0, r2
00067f6c  orrs    r1, r3
00067f6e  movs    r0, r0
00067f70  ldr     pc, [r1, #0xff]!
