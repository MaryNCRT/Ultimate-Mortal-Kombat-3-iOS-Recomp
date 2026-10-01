========================================================================
tl_bomb33  0x0007b844  332 bytes   mkzap.c
========================================================================

0007b844  push    {r4, r5, r6, r7, lr}
0007b846  add     r7, sp, #0xc
0007b848  push.w  {r8, sl}
0007b84c  ldr.w   r3, [r0, #0xa4]
0007b850  movw    r8, #0x8f2
0007b854  mov     r6, r0
0007b856  adds    r3, #1
0007b858  ldr.w   r4, [r0, #0x108]
0007b85c  ldr.w   r5, [r0, r3, lsl #3]
0007b860  cmp     r5, r8
0007b862  beq     #0x7b8e4
0007b864  ble     #0x7b880
0007b866  movw    r2, #0x921
0007b86a  cmp     r5, r2
0007b86c  beq     #0x7b96e
0007b86e  movw    r3, #0x922
0007b872  cmp     r5, r3
0007b874  beq     #0x7b8c0
0007b876  mvn     r0, #2
0007b87a  pop.w   {r8, sl}
0007b87e  pop     {r4, r5, r6, r7, pc}
0007b880  cmp     r5, #0
0007b882  bne     #0x7b876
0007b884  mov     r0, r4
0007b886  str     r5, [r4, #0x40]
0007b888  bl      #0x55228 ; -> get_char_ani2
0007b88c  mov.w   r3, #0x30003
0007b890  str     r3, [r4, #0x1c]
0007b892  ldr.w   r3, [r6, #0xa4]
0007b896  mov     r0, r5
0007b898  adds    r3, #1
0007b89a  str.w   r8, [r6, r3, lsl #3]
0007b89e  ldr.w   r3, [r6, #0xa4]
0007b8a2  adds    r2, r3, #1
0007b8a4  ldr     r3, [pc, #0xd8]
0007b8a6  str.w   r2, [r6, #0xa4]
0007b8aa  add     r3, pc ; -> 0x000f36b8  t_animate_a0_frames
0007b8ac  ldr     r1, [r3]
0007b8ae  lsls    r3, r2, #3
0007b8b0  adds    r3, r3, r6
0007b8b2  str     r1, [r3, #4]
0007b8b4  ldr.w   r3, [r6, #0xa4]
0007b8b8  adds    r3, #1
0007b8ba  str.w   r5, [r6, r3, lsl #3]
0007b8be  b       #0x7b87a
0007b8c0  movs    r3, #3
0007b8c2  str     r3, [r4, #0x1c]
0007b8c4  ldr     r3, [pc, #0xbc]
0007b8c6  movs    r0, #0
0007b8c8  str     r0, [r4, #0x40]
0007b8ca  add     r3, pc ; -> 0x000f3704  t_backwards_ani2
0007b8cc  ldr     r2, [r3]
0007b8ce  ldr.w   r3, [r6, #0xa4]
0007b8d2  lsls    r3, r3, #3
0007b8d4  adds    r3, r3, r6
0007b8d6  str     r2, [r3, #4]
0007b8d8  ldr.w   r3, [r6, #0xa4]
0007b8dc  adds    r3, #1
0007b8de  str.w   r0, [r6, r3, lsl #3]
0007b8e2  b       #0x7b87a
0007b8e4  mov     r0, r4
0007b8e6  mov.w   sl, #0
0007b8ea  str.w   sl, [r4, #0x1c]
0007b8ee  bl      #0x580a4 ; -> group_sound
0007b8f2  mov     r0, r4
0007b8f4  movs    r3, #1
0007b8f6  str     r3, [r4, #0x1c]
0007b8f8  bl      #0x57be4 ; -> ochar_sound
0007b8fc  ldr     r3, [pc, #0x88]
0007b8fe  mov     r0, r4
0007b900  ldr.w   r8, [r4, #0x40]
0007b904  add     r3, pc ; -> 0x00078755  t_swat_bomb_proc
0007b906  str     r3, [r4, #0x38]
0007b908  bl      #0x75964 ; -> create_proj_proc
0007b90c  mov     r5, r0
0007b90e  cbz     r0, #0x7b92e
0007b910  mov     r0, r4
0007b912  str.w   sl, [r4, #0x40]
0007b916  bl      #0x55460 ; -> find_ani2_part2
0007b91a  ldr     r0, [r5, #8]
0007b91c  ldr     r3, [r4, #0x40]
0007b91e  str     r0, [r4, #0x30]
0007b920  mov     r0, r4
0007b922  str     r3, [r5, #0x40]
0007b924  movs    r3, #0x20
0007b926  str     r3, [r4, #0x1c]
0007b928  str     r3, [r4, #0x20]
0007b92a  bl      #0x570bc ; -> adjust_xy_a5
0007b92e  mov     r0, r4
0007b930  str.w   r8, [r4, #0x40]
0007b934  bl      #0x758b0 ; -> i_am_a_sitting_duck
0007b938  movs    r3, #4
0007b93a  str     r3, [r4, #0x1c]
0007b93c  ldr.w   r3, [r6, #0xa4]
0007b940  movw    r2, #0x921
0007b944  mov     r0, sl
0007b946  adds    r3, #1
0007b948  str.w   r2, [r6, r3, lsl #3]
0007b94c  ldr.w   r3, [r6, #0xa4]
0007b950  adds    r2, r3, #1
0007b952  ldr     r3, [pc, #0x38]
0007b954  str.w   r2, [r6, #0xa4]
0007b958  add     r3, pc ; -> 0x000f37cc  t_mframew
0007b95a  ldr     r1, [r3]
0007b95c  lsls    r3, r2, #3
0007b95e  adds    r3, r3, r6
0007b960  str     r1, [r3, #4]
0007b962  ldr.w   r3, [r6, #0xa4]
0007b966  adds    r3, #1
0007b968  str.w   sl, [r6, r3, lsl #3]
0007b96c  b       #0x7b87a
0007b96e  movw    r2, #0x922
0007b972  str.w   r2, [r0, r3, lsl #3]
0007b976  movs    r0, #0x10
0007b978  str.w   r0, [r6, #0xfc]
0007b97c  b       #0x7b87a
0007b97e  nop     
0007b980  ldrb    r2, [r1, #0x18]
0007b982  movs    r7, r0
0007b984  ldrb    r6, [r6, #0x18]
0007b986  movs    r7, r0
0007b988  ldm     r6, {r0, r2, r3, r6}
