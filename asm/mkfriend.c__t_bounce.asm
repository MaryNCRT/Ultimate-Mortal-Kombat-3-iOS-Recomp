========================================================================
t_bounce  0x000a6374  216 bytes   mkfriend.c
========================================================================

000a6374  push    {r4, r5, r6, r7, lr}
000a6376  add     r7, sp, #0xc
000a6378  ldr.w   r2, [r0, #0xa4]
000a637c  movw    r6, #0x524
000a6380  mov     r5, r0
000a6382  adds    r3, r2, #1
000a6384  ldr.w   r4, [r0, #0x108]
000a6388  ldr.w   r3, [r0, r3, lsl #3]
000a638c  cmp     r3, r6
000a638e  beq     #0xa63fc
000a6390  movw    r2, #0x526
000a6394  cmp     r3, r2
000a6396  beq     #0xa63cc
000a6398  cbz     r3, #0xa63a0
000a639a  mvn     r0, #2
000a639e  pop     {r4, r5, r6, r7, pc}
000a63a0  mov     r0, r4
000a63a2  mov.w   r3, #0x40000
000a63a6  str     r3, [r4, #0x1c]
000a63a8  str     r3, [r4, #0x20]
000a63aa  bl      #0x58764 ; -> randu_minimum
000a63ae  ldr     r0, [r4, #8]
000a63b0  ldr     r3, [r4, #0x1c]
000a63b2  rsb.w   r3, r3, #0
000a63b6  str     r3, [r4, #0x48]
000a63b8  str     r3, [r0, #0x1c]
000a63ba  ldr.w   r3, [r5, #0xa4]
000a63be  movs    r0, #2
000a63c0  adds    r3, #1
000a63c2  str.w   r6, [r5, r3, lsl #3]
000a63c6  str.w   r0, [r5, #0xfc]
000a63ca  b       #0xa639e
000a63cc  ldr     r3, [r4, #0x48]
000a63ce  ldr     r2, [r4, #8]
000a63d0  str     r3, [r2, #0x1c]
000a63d2  ldr     r3, [r4, #0x48]
000a63d4  add.w   r3, r3, #0x8000
000a63d8  str     r3, [r4, #0x48]
000a63da  ldr     r3, [r4, #8]
000a63dc  ldrsh.w r3, [r3, #0x12]
000a63e0  add.w   r2, r3, #0x20
000a63e4  ldr     r3, [pc, #0x5c]
000a63e6  str     r2, [r4, #0x1c]
000a63e8  add     r3, pc ; -> 0x000f357c  G
000a63ea  ldr     r3, [r3]
000a63ec  ldr.w   r3, [r3, #0xac]
000a63f0  cmp     r3, r2
000a63f2  str     r3, [r4, #0x20]
000a63f4  it      gt
000a63f6  ldrgt.w r2, [r0, #0xa4]
000a63fa  ble     #0xa640e
000a63fc  adds    r3, r2, #1
000a63fe  movs    r0, #1
000a6400  movw    r2, #0x526
000a6404  str.w   r2, [r5, r3, lsl #3]
000a6408  str.w   r0, [r5, #0xfc]
000a640c  b       #0xa639e
000a640e  movs    r1, #0x71
000a6410  mov     r0, r4
000a6412  bl      #0x57dd0 ; -> tsound_func
000a6416  ldr.w   r3, [r5, #0xa4]
000a641a  cmp     r3, #0
000a641c  ble     #0xa6428
000a641e  subs    r3, #1
000a6420  movs    r0, #0
000a6422  str.w   r3, [r5, #0xa4]
000a6426  b       #0xa639e
000a6428  ldr     r2, [pc, #0x1c]
000a642a  lsls    r3, r3, #3
000a642c  adds    r3, r3, r5
000a642e  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000a6430  movs    r0, #0
000a6432  ldr     r2, [r2]
000a6434  str     r2, [r3, #4]
000a6436  ldr.w   r3, [r5, #0xa4]
000a643a  adds    r3, #1
000a643c  str.w   r0, [r5, r3, lsl #3]
000a6440  b       #0xa639e
000a6442  nop     
000a6444  bne     #0xa6368
000a6446  movs    r4, r0
000a6448  bhs     #0xa63f8
000a644a  movs    r4, r0
