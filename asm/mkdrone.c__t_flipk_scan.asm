========================================================================
t_flipk_scan  0x00070540  188 bytes   mkdrone.c
========================================================================

00070540  push    {r4, r5, r6, r7, lr}
00070542  add     r7, sp, #0xc
00070544  ldr.w   r2, [r0, #0xa4]
00070548  mov     r4, r0
0007054a  ldr.w   r5, [r0, #0x108]
0007054e  adds    r3, r2, #1
00070550  ldr.w   r6, [r0, r3, lsl #3]
00070554  cbnz    r6, #0x70574
00070556  mov     r0, r5
00070558  bl      #0x2f3a0 ; -> get_x_dist
0007055c  ldr     r0, [r5, #0x28]
0007055e  cmp     r0, #0x80
00070560  ble     #0x7059c
00070562  ldr.w   r3, [r4, #0xa4]
00070566  cmp     r3, #0
00070568  ble     #0x705d4
0007056a  mov     r0, r6
0007056c  subs    r3, #1
0007056e  str.w   r3, [r4, #0xa4]
00070572  pop     {r4, r5, r6, r7, pc}
00070574  movw    r3, #0x5b4
00070578  cmp     r6, r3
0007057a  it      ne
0007057c  mvnne   r0, #2
00070580  bne     #0x70572
00070582  ldr     r3, [pc, #0x6c]
00070584  movs    r0, #0
00070586  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00070588  ldr     r1, [r3]
0007058a  lsls    r3, r2, #3
0007058c  adds    r3, r3, r4
0007058e  str     r1, [r3, #4]
00070590  ldr.w   r3, [r4, #0xa4]
00070594  adds    r3, #1
00070596  str.w   r0, [r4, r3, lsl #3]
0007059a  b       #0x70572
0007059c  mov     r0, r4
0007059e  bl      #0x2ebdc ; -> reset_proc_stack
000705a2  ldr.w   r3, [r4, #0xa4]
000705a6  movw    r2, #0x5b4
000705aa  mov     r0, r6
000705ac  adds    r3, #1
000705ae  str.w   r2, [r4, r3, lsl #3]
000705b2  ldr.w   r3, [r4, #0xa4]
000705b6  adds    r2, r3, #1
000705b8  ldr     r3, [pc, #0x38]
000705ba  str.w   r2, [r4, #0xa4]
000705be  add     r3, pc ; -> 0x000f3890  t_do_flip_kick
000705c0  ldr     r1, [r3]
000705c2  lsls    r3, r2, #3
000705c4  adds    r3, r3, r4
000705c6  str     r1, [r3, #4]
000705c8  ldr.w   r3, [r4, #0xa4]
000705cc  adds    r3, #1
000705ce  str.w   r6, [r4, r3, lsl #3]
000705d2  b       #0x70572
000705d4  ldr.w   r2, [pc, #0x20]
000705d8  lsls    r3, r3, #3
000705da  adds    r3, r3, r4
000705dc  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000705de  mov     r0, r6
000705e0  ldr     r2, [r2]
000705e2  str     r2, [r3, #4]
000705e4  ldr.w   r3, [r4, #0xa4]
000705e8  adds    r3, #1
000705ea  str.w   r6, [r4, r3, lsl #3]
000705ee  b       #0x70572
000705f0  adds    r1, #0x7e
000705f2  movs    r0, r1
000705f4  adds    r2, #0xce
000705f6  movs    r0, r1
000705f8  adds    r1, #0x28
000705fa  movs    r0, r1
