========================================================================
t_drfp4  0x000688a0  228 bytes   mkdrone.c
========================================================================

000688a0  push    {lr}
000688a2  ldr.w   lr, [r0, #0xa4]
000688a6  ldr.w   ip, [r0, #0x108]
000688aa  add.w   r3, lr, #1
000688ae  ldr.w   r2, [r0, r3, lsl #3]
000688b2  cbnz    r2, #0x688f0
000688b4  movs    r3, #3
000688b6  str.w   r3, [ip, #0x1c]
000688ba  ldr.w   r3, [r0, #0xa4]
000688be  movw    r1, #0x72d
000688c2  adds    r3, #1
000688c4  str.w   r1, [r0, r3, lsl #3]
000688c8  ldr.w   r3, [r0, #0xa4]
000688cc  adds    r1, r3, #1
000688ce  ldr     r3, [pc, #0xac]
000688d0  str.w   r1, [r0, #0xa4]
000688d4  add     r3, pc ; -> 0x000f37cc  t_mframew
000688d6  ldr.w   ip, [r3]
000688da  lsls    r3, r1, #3
000688dc  adds    r3, r3, r0
000688de  str.w   ip, [r3, #4]
000688e2  ldr.w   r3, [r0, #0xa4]
000688e6  adds    r3, #1
000688e8  str.w   r2, [r0, r3, lsl #3]
000688ec  mov     r0, r2
000688ee  pop     {pc}
000688f0  movw    r3, #0x72d
000688f4  cmp     r2, r3
000688f6  it      ne
000688f8  mvnne   r0, #2
000688fc  bne     #0x688ee
000688fe  ldr.w   r1, [r0, #0xf8]
00068902  ldr.w   r2, [ip, #0x40]
00068906  lsls    r3, r1, #2
00068908  adds    r3, r3, r0
0006890a  str.w   r2, [r3, #0xa8]
0006890e  adds    r3, r1, #1
00068910  str.w   r3, [r0, #0xf8]
00068914  ldr.w   r1, [ip, #0x2c]
00068918  lsls    r2, r3, #2
0006891a  adds    r2, r2, r0
0006891c  adds    r3, #1
0006891e  str.w   r1, [r2, #0xa8]
00068922  str.w   r3, [r0, #0xf8]
00068926  ldr.w   r1, [ip, #0x28]
0006892a  lsls    r2, r3, #2
0006892c  adds    r2, r2, r0
0006892e  adds    r3, #1
00068930  str.w   r1, [r2, #0xa8]
00068934  lsls    r2, r3, #2
00068936  str.w   r3, [r0, #0xf8]
0006893a  add.w   r1, r2, r0
0006893e  ldr.w   r2, [ip, #0x24]
00068942  adds    r3, #1
00068944  cmp.w   lr, #0
00068948  str.w   r3, [r0, #0xf8]
0006894c  str.w   r2, [r1, #0xa8]
00068950  ble     #0x6895e
00068952  add.w   r3, lr, #-1
00068956  str.w   r3, [r0, #0xa4]
0006895a  movs    r0, #0
0006895c  b       #0x688ee
0006895e  ldr     r3, [pc, #0x20]
00068960  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00068962  ldr     r2, [r3]
00068964  lsl.w   r3, lr, #3
00068968  adds    r3, r3, r0
0006896a  str     r2, [r3, #4]
0006896c  ldr.w   r3, [r0, #0xa4]
00068970  movs    r2, #0
00068972  adds    r3, #1
00068974  str.w   r2, [r0, r3, lsl #3]
00068978  mov     r0, r2
0006897a  b       #0x688ee
0006897c  add     r6, sp, #0x3d0
0006897e  movs    r0, r1
00068980  add     r5, sp, #0x290
00068982  movs    r0, r1
