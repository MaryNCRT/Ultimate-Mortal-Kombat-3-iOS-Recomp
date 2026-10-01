========================================================================
t_d_finish_him  0x00068ec8  140 bytes   mkdrone.c
========================================================================

00068ec8  ldr.w   r3, [r0, #0xa4]
00068ecc  ldr.w   r1, [r0, #0x108]
00068ed0  adds    r3, #1
00068ed2  ldr.w   r2, [r0, r3, lsl #3]
00068ed6  cbnz    r2, #0x68f0c
00068ed8  movs    r3, #0x11
00068eda  str     r3, [r1, #0x64]
00068edc  ldr.w   r3, [r0, #0xa4]
00068ee0  movw    r1, #0x947
00068ee4  adds    r3, #1
00068ee6  str.w   r1, [r0, r3, lsl #3]
00068eea  ldr     r1, [pc, #0x58]
00068eec  ldr.w   r3, [r0, #0xa4]
00068ef0  add     r1, pc ; -> 0x0006c2cd  t_boss_branch
00068ef2  adds    r3, #1
00068ef4  str.w   r3, [r0, #0xa4]
00068ef8  lsls    r3, r3, #3
00068efa  adds    r3, r3, r0
00068efc  str     r1, [r3, #4]
00068efe  ldr.w   r3, [r0, #0xa4]
00068f02  adds    r3, #1
00068f04  str.w   r2, [r0, r3, lsl #3]
00068f08  mov     r0, r2
00068f0a  bx      lr
00068f0c  movw    r3, #0x947
00068f10  cmp     r2, r3
00068f12  it      ne
00068f14  mvnne   r0, #2
00068f18  bne     #0x68f0a
00068f1a  movs    r3, #1
00068f1c  str     r3, [r1, #0x5c]
00068f1e  ldr.w   r3, [pc, #0x28]
00068f22  add     r3, pc ; -> 0x000f3534  RoundParam
00068f24  ldr     r3, [r3]
00068f26  ldr     r2, [r3, #0x40]
00068f28  cbz     r2, #0x68f3a
00068f2a  movs    r2, #0
00068f2c  str     r2, [r1, #0x5c]
00068f2e  ldr.w   r1, [pc, #0x1c]
00068f32  ldr.w   r3, [r0, #0xa4]
00068f36  add     r1, pc ; -> 0x00068f55  t_non_violent_finish
00068f38  b       #0x68ef8
00068f3a  ldr     r1, [pc, #0x14]
00068f3c  ldr.w   r3, [r0, #0xa4]
00068f40  add     r1, pc ; -> 0x000707cd  t_drone_execute_fatality
00068f42  b       #0x68ef8
00068f44  adds    r3, #0xd9
00068f46  movs    r0, r0
00068f48  adr     r6, #0x38
00068f4a  movs    r0, r1
00068f4c  movs    r3, r3
00068f4e  movs    r0, r0
00068f50  ldrb    r1, [r1, #2]
00068f52  movs    r0, r0
