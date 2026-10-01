========================================================================
t_motaro_kick  0x000aa868  476 bytes   mkboss.c
========================================================================

000aa868  push    {r4, r5, r6, r7, lr}
000aa86a  add     r7, sp, #0xc
000aa86c  push.w  {r8, sl}
000aa870  ldr.w   r3, [r0, #0xa4]
000aa874  mov     r4, r0
000aa876  ldr.w   r5, [r0, #0x108]
000aa87a  adds    r3, #1
000aa87c  ldr.w   r6, [r0, r3, lsl #3]
000aa880  movw    r3, #0x4e3
000aa884  cmp     r6, r3
000aa886  beq     #0xaa916
000aa888  ble     #0xaa8ac
000aa88a  movw    r8, #0x4f2
000aa88e  cmp     r6, r8
000aa890  beq     #0xaa980
000aa892  movw    r3, #0x4fa
000aa896  cmp     r6, r3
000aa898  beq     #0xaa91e
000aa89a  subs    r3, #0x10
000aa89c  cmp     r6, r3
000aa89e  beq.w   #0xaa9d6
000aa8a2  mvn     r0, #2
000aa8a6  pop.w   {r8, sl}
000aa8aa  pop     {r4, r5, r6, r7, pc}
000aa8ac  movw    sl, #0x4d5
000aa8b0  cmp     r6, sl
000aa8b2  beq     #0xaa9a8
000aa8b4  subs    r3, #7
000aa8b6  cmp     r6, r3
000aa8b8  beq     #0xaa956
000aa8ba  cmp     r6, #0
000aa8bc  bne     #0xaa8a2
000aa8be  mov     r0, r5
000aa8c0  movs    r3, #0x11
000aa8c2  str     r3, [r5, #0x40]
000aa8c4  bl      #0x5520c ; -> get_char_ani
000aa8c8  mov     r0, r5
000aa8ca  mov.w   r8, #1
000aa8ce  str.w   r8, [r5, #0x1c]
000aa8d2  bl      #0x57be4 ; -> ochar_sound
000aa8d6  mov     r0, r5
000aa8d8  bl      #0x551f0 ; -> am_i_facing_him
000aa8dc  ldr     r3, [r5, #0x5c]
000aa8de  cmp     r3, #0
000aa8e0  beq     #0xaa9ae
000aa8e2  str.w   r8, [r5, #0x1c]
000aa8e6  ldr.w   r3, [r4, #0xa4]
000aa8ea  mov     r0, r6
000aa8ec  add     r3, r8
000aa8ee  str.w   sl, [r4, r3, lsl #3]
000aa8f2  ldr.w   r3, [r4, #0xa4]
000aa8f6  add.w   r2, r3, r8
000aa8fa  ldr     r3, [pc, #0x130]
000aa8fc  str.w   r2, [r4, #0xa4]
000aa900  add     r3, pc ; -> 0x000f37cc  t_mframew
000aa902  ldr     r1, [r3]
000aa904  lsls    r3, r2, #3
000aa906  adds    r3, r3, r4
000aa908  str     r1, [r3, #4]
000aa90a  ldr.w   r3, [r4, #0xa4]
000aa90e  add     r3, r8
000aa910  str.w   r6, [r4, r3, lsl #3]
000aa914  b       #0xaa8a6
000aa916  ldr     r3, [r5, #0x44]
000aa918  subs    r3, #1
000aa91a  str     r3, [r5, #0x44]
000aa91c  cbnz    r3, #0xaa95a
000aa91e  movs    r3, #3
000aa920  str     r3, [r5, #0x1c]
000aa922  ldr.w   r3, [r4, #0xa4]
000aa926  movw    r2, #0x4ea
000aa92a  adds    r3, #1
000aa92c  str.w   r2, [r4, r3, lsl #3]
000aa930  ldr.w   r3, [r4, #0xa4]
000aa934  adds    r2, r3, #1
000aa936  ldr.w   r3, [pc, #0xf8]
000aa93a  str.w   r2, [r4, #0xa4]
000aa93e  add     r3, pc ; -> 0x000f37cc  t_mframew
000aa940  ldr     r1, [r3]
000aa942  lsls    r3, r2, #3
000aa944  adds    r3, r3, r4
000aa946  movs    r0, #0
000aa948  str     r1, [r3, #4]
000aa94a  ldr.w   r3, [r4, #0xa4]
000aa94e  adds    r3, #1
000aa950  str.w   r0, [r4, r3, lsl #3]
000aa954  b       #0xaa8a6
000aa956  movs    r3, #4
000aa958  str     r3, [r5, #0x44]
000aa95a  mov     r0, r5
000aa95c  movs    r6, #1
000aa95e  str     r6, [r5, #0x1c]
000aa960  bl      #0x594c8 ; -> strike_check_a0
000aa964  ldr     r0, [r5, #0x5c]
000aa966  cmp     r0, #0
000aa968  beq     #0xaaa14
000aa96a  ldr.w   r3, [r4, #0xa4]
000aa96e  movs    r0, #0xa
000aa970  movw    r2, #0x4fa
000aa974  adds    r3, #1
000aa976  str.w   r2, [r4, r3, lsl #3]
000aa97a  str.w   r0, [r4, #0xfc]
000aa97e  b       #0xaa8a6
000aa980  mov     r0, r5
000aa982  movs    r6, #0
000aa984  str     r6, [r5, #0x40]
000aa986  bl      #0x5a028 ; -> pose_a9_manual
000aa98a  ldr     r3, [pc, #0xa8]
000aa98c  mov     r0, r6
000aa98e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000aa990  ldr     r2, [r3]
000aa992  ldr.w   r3, [r4, #0xa4]
000aa996  lsls    r3, r3, #3
000aa998  adds    r3, r3, r4
000aa99a  str     r2, [r3, #4]
000aa99c  ldr.w   r3, [r4, #0xa4]
000aa9a0  adds    r3, #1
000aa9a2  str.w   r6, [r4, r3, lsl #3]
000aa9a6  b       #0xaa8a6
000aa9a8  ldr     r3, [r5, #0x40]
000aa9aa  subs    r3, #0x10
000aa9ac  str     r3, [r5, #0x40]
000aa9ae  mov     r0, r5
000aa9b0  bl      #0x55450 ; -> find_part2
000aa9b4  movs    r3, #2
000aa9b6  str     r3, [r5, #0x1c]
000aa9b8  ldr.w   r3, [r4, #0xa4]
000aa9bc  movw    r2, #0x4dc
000aa9c0  adds    r3, #1
000aa9c2  str.w   r2, [r4, r3, lsl #3]
000aa9c6  ldr.w   r3, [r4, #0xa4]
000aa9ca  adds    r2, r3, #1
000aa9cc  ldr     r3, [pc, #0x68]
000aa9ce  str.w   r2, [r4, #0xa4]
000aa9d2  add     r3, pc ; -> 0x000f37cc  t_mframew
000aa9d4  b       #0xaa940
000aa9d6  mov     r0, r5
000aa9d8  bl      #0x551f0 ; -> am_i_facing_him
000aa9dc  ldr     r0, [r5, #0x5c]
000aa9de  cmp     r0, #0
000aa9e0  bne     #0xaa980
000aa9e2  ldr     r3, [pc, #0x58]
000aa9e4  str     r3, [r5, #0x40]
000aa9e6  ldr.w   r3, [r4, #0xa4]
000aa9ea  adds    r3, #1
000aa9ec  str.w   r8, [r4, r3, lsl #3]
000aa9f0  ldr.w   r3, [r4, #0xa4]
000aa9f4  adds    r2, r3, #1
000aa9f6  ldr.w   r3, [pc, #0x48]
000aa9fa  str.w   r2, [r4, #0xa4]
000aa9fe  add     r3, pc ; -> 0x000f36d0  t_animate_a9
000aaa00  ldr     r1, [r3]
000aaa02  lsls    r3, r2, #3
000aaa04  adds    r3, r3, r4
000aaa06  str     r1, [r3, #4]
000aaa08  ldr.w   r3, [r4, #0xa4]
000aaa0c  adds    r3, #1
000aaa0e  str.w   r0, [r4, r3, lsl #3]
000aaa12  b       #0xaa8a6
000aaa14  ldr.w   r3, [r4, #0xa4]
000aaa18  movw    r2, #0x4e3
000aaa1c  mov     r0, r6
000aaa1e  adds    r3, r3, r6
000aaa20  str.w   r2, [r4, r3, lsl #3]
000aaa24  str.w   r6, [r4, #0xfc]
000aaa28  b       #0xaa8a6
000aaa2a  nop     
000aaa2c  ldrh    r0, [r1, #0x36]
000aaa2e  movs    r4, r0
000aaa30  ldrh    r2, [r1, #0x34]
000aaa32  movs    r4, r0
000aaa34  ldrh    r6, [r6, #0x2a]
000aaa36  movs    r4, r0
000aaa38  ldrh    r6, [r6, #0x2e]
000aaa3a  movs    r4, r0
000aaa3c  movs    r1, r2
000aaa3e  movs    r3, r0
000aaa40  ldrh    r6, [r1, #0x26]
000aaa42  movs    r4, r0
