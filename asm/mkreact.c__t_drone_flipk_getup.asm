========================================================================
t_drone_flipk_getup  0x00041410  316 bytes   mkreact.c
========================================================================

00041410  push    {lr}
00041412  ldr.w   r1, [r0, #0xa4]
00041416  movw    ip, #0xe13
0004141a  ldr.w   lr, [r0, #0x108]
0004141e  adds    r3, r1, #1
00041420  ldr.w   r2, [r0, r3, lsl #3]
00041424  cmp     r2, ip
00041426  beq     #0x41516
00041428  ble     #0x4144a
0004142a  movw    ip, #0xe15
0004142e  cmp     r2, ip
00041430  beq     #0x414f4
00041432  blt     #0x41498
00041434  add.w   ip, ip, #1
00041438  cmp     r2, ip
0004143a  beq     #0x414c0
0004143c  movw    r3, #0xe17
00041440  cmp     r2, r3
00041442  beq     #0x414a6
00041444  mvn     r0, #2
00041448  b       #0x414a4
0004144a  cmp.w   r2, #0xe10
0004144e  beq     #0x414d2
00041450  movw    r1, #0xe12
00041454  cmp     r2, r1
00041456  beq     #0x41498
00041458  cmp     r2, #0
0004145a  bne     #0x41444
0004145c  movs    r3, #3
0004145e  str.w   r3, [lr, #0x1c]
00041462  ldr.w   r3, [r0, #0xa4]
00041466  mov.w   r1, #0xe10
0004146a  adds    r3, #1
0004146c  str.w   r1, [r0, r3, lsl #3]
00041470  ldr.w   r3, [r0, #0xa4]
00041474  adds    r1, r3, #1
00041476  ldr     r3, [pc, #0xc0]
00041478  str.w   r1, [r0, #0xa4]
0004147c  add     r3, pc ; -> 0x000f37ac  t_d_beware_mframew
0004147e  ldr.w   ip, [r3]
00041482  lsls    r3, r1, #3
00041484  adds    r3, r3, r0
00041486  str.w   ip, [r3, #4]
0004148a  ldr.w   r3, [r0, #0xa4]
0004148e  adds    r3, #1
00041490  str.w   r2, [r0, r3, lsl #3]
00041494  mov     r0, r2
00041496  b       #0x414a4
00041498  movs    r2, #1
0004149a  str.w   ip, [r0, r3, lsl #3]
0004149e  str.w   r2, [r0, #0xfc]
000414a2  mov     r0, r2
000414a4  pop     {pc}
000414a6  ldr     r2, [pc, #0x94]
000414a8  lsls    r3, r1, #3
000414aa  adds    r3, r3, r0
000414ac  add     r2, pc ; -> 0x00041f8d  t_getup_reaction_exit
000414ae  str     r2, [r3, #4]
000414b0  ldr.w   r3, [r0, #0xa4]
000414b4  movs    r2, #0
000414b6  adds    r3, #1
000414b8  str.w   r2, [r0, r3, lsl #3]
000414bc  mov     r0, r2
000414be  b       #0x414a4
000414c0  movw    r2, #0xe17
000414c4  str.w   r2, [r0, r3, lsl #3]
000414c8  movs    r2, #1
000414ca  str.w   r2, [r0, #0xfc]
000414ce  mov     r0, r2
000414d0  b       #0x414a4
000414d2  movw    r2, #0xe12
000414d6  str.w   r2, [r0, r3, lsl #3]
000414da  ldr.w   r3, [r0, #0xa4]
000414de  adds    r2, r3, #1
000414e0  ldr.w   r3, [pc, #0x5c]
000414e4  str.w   r2, [r0, #0xa4]
000414e8  add     r3, pc ; -> 0x000f373c  t_d_beware
000414ea  ldr     r1, [r3]
000414ec  lsls    r3, r2, #3
000414ee  adds    r3, r3, r0
000414f0  str     r1, [r3, #4]
000414f2  b       #0x414b0
000414f4  movw    r2, #0xe16
000414f8  str.w   r2, [r0, r3, lsl #3]
000414fc  ldr.w   r3, [r0, #0xa4]
00041500  adds    r2, r3, #1
00041502  ldr.w   r3, [pc, #0x40]
00041506  str.w   r2, [r0, #0xa4]
0004150a  add     r3, pc ; -> 0x000f373c  t_d_beware
0004150c  ldr     r1, [r3]
0004150e  lsls    r3, r2, #3
00041510  adds    r3, r3, r0
00041512  str     r1, [r3, #4]
00041514  b       #0x414b0
00041516  movw    r2, #0xe14
0004151a  str.w   r2, [r0, r3, lsl #3]
0004151e  ldr.w   r3, [r0, #0xa4]
00041522  adds    r2, r3, #1
00041524  ldr     r3, [pc, #0x20]
00041526  str.w   r2, [r0, #0xa4]
0004152a  add     r3, pc ; -> 0x000f373c  t_d_beware
0004152c  ldr     r1, [r3]
0004152e  lsls    r3, r2, #3
00041530  adds    r3, r3, r0
00041532  str     r1, [r3, #4]
00041534  b       #0x414b0
00041536  nop     
00041538  movs    r3, #0x2c
0004153a  movs    r3, r1
0004153c  lsrs    r5, r3, #0xb
0004153e  movs    r0, r0
00041540  movs    r2, #0x50
00041542  movs    r3, r1
00041544  movs    r2, #0x2e
00041546  movs    r3, r1
00041548  movs    r2, #0xe
0004154a  movs    r3, r1
