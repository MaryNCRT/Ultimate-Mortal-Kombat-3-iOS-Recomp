========================================================================
t_f_shang  0x000a622c  328 bytes   mkfriend.c
========================================================================

000a622c  push    {r4, r5, r7, lr}
000a622e  add     r7, sp, #8
000a6230  ldr.w   r3, [r0, #0xa4]
000a6234  movw    r1, #0x54a
000a6238  mov     r4, r0
000a623a  adds    r2, r3, #1
000a623c  ldr.w   r5, [r0, #0x108]
000a6240  ldr.w   r3, [r0, r2, lsl #3]
000a6244  cmp     r3, r1
000a6246  beq     #0xa6306
000a6248  ble     #0xa6266
000a624a  movw    r0, #0x54d
000a624e  cmp     r3, r0
000a6250  beq     #0xa6320
000a6252  movw    r1, #0x555
000a6256  cmp     r3, r1
000a6258  beq     #0xa62ca
000a625a  subs    r1, #9
000a625c  cmp     r3, r1
000a625e  beq     #0xa6332
000a6260  mvn     r0, #2
000a6264  pop     {r4, r5, r7, pc}
000a6266  cbz     r3, #0xa629a
000a6268  movw    r2, #0x539
000a626c  cmp     r3, r2
000a626e  bne     #0xa6260
000a6270  ldr     r2, [r5, #8]
000a6272  movw    r3, #0x1b31
000a6276  str     r3, [r2, #0x2c]
000a6278  ldr     r3, [pc, #0xe0]
000a627a  ldr     r0, [r5, #8]
000a627c  add     r3, pc ; -> 0x000f357c  G
000a627e  ldr     r3, [r3]
000a6280  ldr.w   r3, [r3, #0xac]
000a6284  subs    r3, #0x20
000a6286  strh    r3, [r0, #0x12]
000a6288  ldr.w   r3, [r4, #0xa4]
000a628c  movs    r0, #0x40
000a628e  adds    r3, #1
000a6290  str.w   r1, [r4, r3, lsl #3]
000a6294  str.w   r0, [r4, #0xfc]
000a6298  b       #0xa6264
000a629a  ldr     r1, [pc, #0xc4]
000a629c  mov     r0, r5
000a629e  add     r1, pc ; -> 0x000a5809  t_end_friend_proc
000a62a0  bl      #0x58a10 ; -> NewThread
000a62a4  mov     r0, r5
000a62a6  bl      #0x33450 ; -> sans_repell_for_good
000a62aa  mov     r0, r5
000a62ac  movs    r3, #0x1e
000a62ae  str     r3, [r5, #0x1c]
000a62b0  bl      #0x58d70 ; -> create_fx
000a62b4  ldr.w   r3, [r4, #0xa4]
000a62b8  movs    r0, #8
000a62ba  movw    r2, #0x539
000a62be  adds    r3, #1
000a62c0  str.w   r2, [r4, r3, lsl #3]
000a62c4  str.w   r0, [r4, #0xfc]
000a62c8  b       #0xa6264
000a62ca  ldr     r3, [r5, #0x44]
000a62cc  subs    r3, #1
000a62ce  cmp     r3, #0
000a62d0  str     r3, [r5, #0x44]
000a62d2  blt     #0xa6348
000a62d4  ldr.w   r3, [r4, #0xa4]
000a62d8  movw    r2, #0x555
000a62dc  adds    r3, #1
000a62de  str.w   r2, [r4, r3, lsl #3]
000a62e2  ldr.w   r2, [pc, #0x80]
000a62e6  ldr.w   r3, [r4, #0xa4]
000a62ea  add     r2, pc ; -> 0x000a6375  t_bounce
000a62ec  adds    r3, #1
000a62ee  str.w   r3, [r4, #0xa4]
000a62f2  lsls    r3, r3, #3
000a62f4  adds    r3, r3, r4
000a62f6  movs    r0, #0
000a62f8  str     r2, [r3, #4]
000a62fa  ldr.w   r3, [r4, #0xa4]
000a62fe  adds    r3, #1
000a6300  str.w   r0, [r4, r3, lsl #3]
000a6304  b       #0xa6264
000a6306  movw    r3, #0x54c
000a630a  str.w   r3, [r0, r2, lsl #3]
000a630e  ldr.w   r2, [pc, #0x58]
000a6312  ldr.w   r3, [r0, #0xa4]
000a6316  add     r2, pc ; -> 0x000a6375  t_bounce
000a6318  adds    r3, #1
000a631a  str.w   r3, [r0, #0xa4]
000a631e  b       #0xa62f2
000a6320  mov     r0, r5
000a6322  mov.w   r3, #0x30000
000a6326  str     r3, [r5, #0x1c]
000a6328  bl      #0x55a94 ; -> towards_x_vel
000a632c  movs    r3, #5
000a632e  str     r3, [r5, #0x44]
000a6330  b       #0xa62d4
000a6332  str.w   r0, [r4, r2, lsl #3]
000a6336  ldr.w   r2, [pc, #0x34]
000a633a  ldr.w   r3, [r4, #0xa4]
000a633e  add     r2, pc ; -> 0x000a6375  t_bounce
000a6340  adds    r3, #1
000a6342  str.w   r3, [r4, #0xa4]
000a6346  b       #0xa62f2
000a6348  mov     r0, r5
000a634a  bl      #0x55c04 ; -> stop_me_player
000a634e  ldr     r3, [pc, #0x20]
000a6350  add     r3, pc ; -> 0x000f3724  t_wait_forever
000a6352  ldr     r2, [r3]
000a6354  ldr.w   r3, [r4, #0xa4]
000a6358  b       #0xa62f2
000a635a  nop     
000a635c  bhs     #0xa6358
000a635e  movs    r4, r0
000a6360  bl      #0xffe0e362
000a6364  lsls    r7, r0, #2
000a6366  movs    r0, r0
000a6368  lsls    r3, r3, #1
000a636a  movs    r0, r0
000a636c  movs    r3, r6
000a636e  movs    r0, r0
000a6370  blo     #0xa6314
000a6372  movs    r4, r0
