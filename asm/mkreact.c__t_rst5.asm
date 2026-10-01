========================================================================
t_rst5  0x000473d0  464 bytes   mkreact.c
========================================================================

000473d0  push    {r4, r5, r6, r7, lr}
000473d2  add     r7, sp, #0xc
000473d4  ldr.w   r3, [r0, #0xa4]
000473d8  mov     r4, r0
000473da  ldr.w   r6, [r0, #0x108]
000473de  adds    r3, #1
000473e0  ldr.w   r5, [r0, r3, lsl #3]
000473e4  cmp     r5, #0
000473e6  bne     #0x4743c
000473e8  mov     r0, r6
000473ea  bl      #0x57a10 ; -> lights_on_hit
000473ee  ldr     r3, [r6, #0x30]
000473f0  cmp     r3, #0
000473f2  bne     #0x474a2
000473f4  ldr     r3, [r6, #0x38]
000473f6  cmp     r3, #0
000473f8  beq     #0x4745e
000473fa  ldr.w   r1, [r4, #0xf8]
000473fe  ldr     r2, [r6, #0x34]
00047400  lsls    r3, r1, #2
00047402  adds    r3, r3, r4
00047404  str.w   r2, [r3, #0xa8]
00047408  adds    r3, r1, #1
0004740a  str.w   r3, [r4, #0xf8]
0004740e  ldr.w   r3, [r4, #0xa4]
00047412  movw    r2, #0x1038
00047416  adds    r3, #1
00047418  str.w   r2, [r4, r3, lsl #3]
0004741c  ldr.w   r3, [r4, #0xa4]
00047420  adds    r3, #1
00047422  str.w   r3, [r4, #0xa4]
00047426  ldr     r0, [r6, #0x38]
00047428  lsls    r3, r3, #3
0004742a  adds    r3, r3, r4
0004742c  str     r0, [r3, #4]
0004742e  ldr.w   r3, [r4, #0xa4]
00047432  movs    r0, #0
00047434  adds    r3, #1
00047436  str.w   r0, [r4, r3, lsl #3]
0004743a  pop     {r4, r5, r6, r7, pc}
0004743c  movw    r3, #0x1038
00047440  cmp     r5, r3
00047442  it      ne
00047444  mvnne   r0, #2
00047448  bne     #0x4743a
0004744a  ldr.w   r3, [r4, #0xf8]
0004744e  subs    r3, #1
00047450  str.w   r3, [r4, #0xf8]
00047454  lsls    r3, r3, #2
00047456  adds    r3, r3, r4
00047458  ldr.w   r3, [r3, #0xa8]
0004745c  str     r3, [r6, #0x34]
0004745e  ldr     r0, [r6, #0x34]
00047460  cbnz    r0, #0x47472
00047462  ldr.w   r3, [r4, #0xa4]
00047466  cmp     r3, #0
00047468  ble     #0x4752e
0004746a  subs    r3, #1
0004746c  str.w   r3, [r4, #0xa4]
00047470  b       #0x4743a
00047472  ldr     r3, [pc, #0x114]
00047474  add     r3, pc ; -> 0x000f3738  motaro_branches
00047476  ldr     r3, [r3]
00047478  str     r3, [r6, #0x20]
0004747a  ldr     r3, [r6, #8]
0004747c  ldr     r3, [r3, #0x24]
0004747e  cmp     r3, #0x18
00047480  str     r3, [r6, #0x38]
00047482  beq     #0x474e2
00047484  ldr     r2, [pc, #0x104]
00047486  cmp     r3, #0x19
00047488  add     r2, pc ; -> 0x000f3740  sk_branches
0004748a  ldr     r2, [r2]
0004748c  str     r2, [r6, #0x20]
0004748e  beq     #0x474e2
00047490  ldr.w   r3, [r4, #0xa4]
00047494  cmp     r3, #0
00047496  ble     #0x47560
00047498  subs    r3, #1
0004749a  movs    r0, #0
0004749c  str.w   r3, [r4, #0xa4]
000474a0  b       #0x4743a
000474a2  mov     r0, r6
000474a4  bl      #0x55070 ; -> am_i_airborn
000474a8  cmp     r0, #0
000474aa  beq     #0x473f4
000474ac  ldr.w   r3, [r4, #0xa4]
000474b0  cmp     r3, #0
000474b2  ble     #0x47546
000474b4  subs    r3, #1
000474b6  str.w   r3, [r4, #0xa4]
000474ba  ldr.w   r1, [r4, #0xa4]
000474be  adds    r3, r1, #1
000474c0  lsls    r2, r3, #3
000474c2  adds    r2, r2, r4
000474c4  ldr     r0, [r2, #4]
000474c6  adds    r2, r3, #1
000474c8  ldr.w   r2, [r4, r2, lsl #3]
000474cc  str.w   r2, [r4, r3, lsl #3]
000474d0  lsls    r3, r1, #3
000474d2  adds    r3, r3, r4
000474d4  str     r0, [r3, #4]
000474d6  ldr.w   r3, [r4, #0xa4]
000474da  ldr     r0, [r6, #0x30]
000474dc  lsls    r3, r3, #3
000474de  adds    r3, r3, r4
000474e0  b       #0x4742c
000474e2  ldr.w   r3, [r4, #0xa4]
000474e6  cmp     r3, #0
000474e8  ble     #0x4756a
000474ea  subs    r3, #1
000474ec  str.w   r3, [r4, #0xa4]
000474f0  ldr.w   r1, [r4, #0xa4]
000474f4  adds    r3, r1, #1
000474f6  lsls    r2, r3, #3
000474f8  adds    r2, r2, r4
000474fa  ldr     r0, [r2, #4]
000474fc  adds    r2, r3, #1
000474fe  ldr.w   r2, [r4, r2, lsl #3]
00047502  str.w   r2, [r4, r3, lsl #3]
00047506  lsls    r3, r1, #3
00047508  adds    r3, r3, r4
0004750a  str     r0, [r3, #4]
0004750c  ldr     r2, [r6, #0x34]
0004750e  ldr     r3, [r6, #0x20]
00047510  ldr.w   r2, [r3, r2, lsl #2]
00047514  str     r2, [r6, #0x34]
00047516  ldr.w   r3, [r4, #0xa4]
0004751a  lsls    r3, r3, #3
0004751c  adds    r3, r3, r4
0004751e  movs    r0, #0
00047520  str     r2, [r3, #4]
00047522  ldr.w   r3, [r4, #0xa4]
00047526  adds    r3, #1
00047528  str.w   r0, [r4, r3, lsl #3]
0004752c  b       #0x4743a
0004752e  ldr     r2, [pc, #0x60]
00047530  lsls    r3, r3, #3
00047532  adds    r3, r3, r4
00047534  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00047536  ldr     r2, [r2]
00047538  str     r2, [r3, #4]
0004753a  ldr.w   r3, [r4, #0xa4]
0004753e  adds    r3, #1
00047540  str.w   r0, [r4, r3, lsl #3]
00047544  b       #0x4743a
00047546  ldr.w   r2, [pc, #0x4c]
0004754a  lsls    r3, r3, #3
0004754c  adds    r3, r3, r4
0004754e  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00047550  ldr     r2, [r2]
00047552  str     r2, [r3, #4]
00047554  ldr.w   r3, [r4, #0xa4]
00047558  adds    r3, #1
0004755a  str.w   r5, [r4, r3, lsl #3]
0004755e  b       #0x474ba
00047560  ldr.w   r2, [pc, #0x34]
00047564  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00047566  ldr     r2, [r2]
00047568  b       #0x4751a
0004756a  ldr.w   r2, [pc, #0x30]
0004756e  lsls    r3, r3, #3
00047570  adds    r3, r3, r4
00047572  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00047574  ldr     r2, [r2]
00047576  str     r2, [r3, #4]
00047578  ldr.w   r3, [r4, #0xa4]
0004757c  movs    r2, #0
0004757e  adds    r3, #1
00047580  str.w   r2, [r4, r3, lsl #3]
00047584  b       #0x474f0
00047586  nop     
00047588  stm     r2!, {r6, r7}
0004758a  movs    r2, r1
0004758c  stm     r2!, {r2, r4, r5, r7}
0004758e  movs    r2, r1
00047590  stm     r1!, {r4, r6, r7}
00047592  movs    r2, r1
00047594  stm     r1!, {r1, r2, r4, r5, r7}
00047596  movs    r2, r1
00047598  stm     r1!, {r5, r7}
0004759a  movs    r2, r1
0004759c  stm     r1!, {r1, r4, r7}
0004759e  movs    r2, r1
