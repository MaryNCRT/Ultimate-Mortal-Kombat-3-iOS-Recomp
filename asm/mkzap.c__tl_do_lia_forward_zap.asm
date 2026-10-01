========================================================================
tl_do_lia_forward_zap  0x0007a85c  288 bytes   mkzap.c
========================================================================

0007a85c  push    {r4, r5, r6, r7, lr}
0007a85e  add     r7, sp, #0xc
0007a860  str     r8, [sp, #-0x4]!
0007a864  ldr.w   r3, [r0, #0xa4]
0007a868  movw    r8, #0x7e1
0007a86c  mov     r5, r0
0007a86e  adds    r3, #1
0007a870  ldr.w   r4, [r0, #0x108]
0007a874  ldr.w   r6, [r0, r3, lsl #3]
0007a878  cmp     r6, r8
0007a87a  beq     #0x7a910
0007a87c  cmp.w   r6, #0x800
0007a880  beq     #0x7a8ea
0007a882  cbz     r6, #0x7a88e
0007a884  mvn     r0, #2
0007a888  ldr     r8, [sp], #4
0007a88c  pop     {r4, r5, r6, r7, pc}
0007a88e  movs    r3, #0x1b
0007a890  mov     r0, r4
0007a892  str     r3, [r4, #0x20]
0007a894  str     r6, [r4, #0x44]
0007a896  bl      #0x79590 ; -> zap_init_special_act
0007a89a  mov     r0, r4
0007a89c  movs    r3, #2
0007a89e  str     r3, [r4, #0x1c]
0007a8a0  bl      #0x57be4 ; -> ochar_sound
0007a8a4  ldr     r3, [pc, #0xc0]
0007a8a6  mov     r0, r4
0007a8a8  str     r6, [r4, #0x48]
0007a8aa  str     r3, [r4, #0x40]
0007a8ac  bl      #0x54e38 ; -> get_his_action
0007a8b0  ldr     r2, [r4, #0x20]
0007a8b2  movw    r3, #0x507
0007a8b6  cmp     r2, r3
0007a8b8  beq     #0x7a95e
0007a8ba  ldr.w   r3, [r5, #0xa4]
0007a8be  mov     r0, r6
0007a8c0  adds    r3, #1
0007a8c2  str.w   r8, [r5, r3, lsl #3]
0007a8c6  ldr.w   r3, [r5, #0xa4]
0007a8ca  adds    r2, r3, #1
0007a8cc  ldr.w   r3, [pc, #0x9c]
0007a8d0  str.w   r2, [r5, #0xa4]
0007a8d4  add     r3, pc ; -> 0x000f36d0  t_animate_a9
0007a8d6  ldr     r1, [r3]
0007a8d8  lsls    r3, r2, #3
0007a8da  adds    r3, r3, r5
0007a8dc  str     r1, [r3, #4]
0007a8de  ldr.w   r3, [r5, #0xa4]
0007a8e2  adds    r3, #1
0007a8e4  str.w   r6, [r5, r3, lsl #3]
0007a8e8  b       #0x7a888
0007a8ea  movs    r3, #0x24
0007a8ec  str     r3, [r4, #0x40]
0007a8ee  subs    r3, #0x20
0007a8f0  str     r3, [r4, #0x1c]
0007a8f2  ldr     r3, [pc, #0x7c]
0007a8f4  add     r3, pc ; -> 0x000f37c4  t_backwards_ani
0007a8f6  ldr     r2, [r3]
0007a8f8  ldr.w   r3, [r0, #0xa4]
0007a8fc  lsls    r3, r3, #3
0007a8fe  adds    r3, r3, r0
0007a900  str     r2, [r3, #4]
0007a902  ldr.w   r3, [r0, #0xa4]
0007a906  movs    r0, #0
0007a908  adds    r3, #1
0007a90a  str.w   r0, [r5, r3, lsl #3]
0007a90e  b       #0x7a888
0007a910  mov     r0, r4
0007a912  movs    r3, #0x24
0007a914  str     r3, [r4, #0x40]
0007a916  bl      #0x55474 ; -> find_ani_part2
0007a91a  ldr     r3, [pc, #0x58]
0007a91c  mov     r0, r4
0007a91e  add     r3, pc ; -> 0x0007c1e5  t_lia_forward_proc
0007a920  str     r3, [r4, #0x38]
0007a922  bl      #0x75964 ; -> create_proj_proc
0007a926  cbz     r0, #0x7a936
0007a928  mov.w   r3, #0x80000
0007a92c  str     r3, [r4, #0x20]
0007a92e  ldr     r3, [r4, #0x48]
0007a930  cbnz    r3, #0x7a956
0007a932  ldr     r3, [r4, #0x20]
0007a934  str     r3, [r0, #0x48]
0007a936  ldr     r0, [r4]
0007a938  movw    r3, #0x604
0007a93c  str     r3, [r4, #0x1c]
0007a93e  mov.w   r2, #0x800
0007a942  str     r3, [r0, #0x18]
0007a944  ldr.w   r3, [r5, #0xa4]
0007a948  movs    r0, #0x20
0007a94a  adds    r3, #1
0007a94c  str.w   r2, [r5, r3, lsl #3]
0007a950  str.w   r0, [r5, #0xfc]
0007a954  b       #0x7a888
0007a956  mov.w   r3, #0xa0000
0007a95a  str     r3, [r4, #0x20]
0007a95c  b       #0x7a932
0007a95e  movs    r3, #1
0007a960  str     r3, [r4, #0x48]
0007a962  ldr     r3, [pc, #0x14]
0007a964  str     r3, [r4, #0x40]
0007a966  b       #0x7a8ba
0007a968  movs    r4, r4
0007a96a  movs    r3, r0
0007a96c  ldrh    r0, [r7, #0x2e]
0007a96e  movs    r7, r0
0007a970  ldrh    r4, [r1, #0x36]
0007a972  movs    r7, r0
0007a974  adds    r3, r0, r3
0007a976  movs    r0, r0
0007a978  movs    r4, r4
0007a97a  movs    r1, r0
