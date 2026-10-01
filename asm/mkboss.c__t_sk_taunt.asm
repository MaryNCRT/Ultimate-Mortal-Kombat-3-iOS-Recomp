========================================================================
t_sk_taunt  0x000aabb0  328 bytes   mkboss.c
========================================================================

000aabb0  push    {r4, r5, r6, r7, lr}
000aabb2  add     r7, sp, #0xc
000aabb4  ldr.w   r2, [r0, #0xa4]
000aabb8  movw    r6, #0x3f7
000aabbc  mov     r5, r0
000aabbe  adds    r3, r2, #1
000aabc0  ldr.w   r4, [r0, #0x108]
000aabc4  ldr.w   r3, [r0, r3, lsl #3]
000aabc8  cmp     r3, r6
000aabca  beq     #0xaac66
000aabcc  ble     #0xaabe2
000aabce  cmp.w   r3, #0x400
000aabd2  beq     #0xaacb6
000aabd4  movw    r1, #0x406
000aabd8  cmp     r3, r1
000aabda  beq     #0xaac60
000aabdc  mvn     r0, #2
000aabe0  pop     {r4, r5, r6, r7, pc}
000aabe2  cbnz    r3, #0xaac34
000aabe4  ldr     r3, [pc, #0xfc]
000aabe6  mov     r0, r4
000aabe8  str     r3, [r4, #0x1c]
000aabea  bl      #0x5873c ; -> rsnd_ochar_sound
000aabee  mov     r0, r4
000aabf0  movs    r3, #0x18
000aabf2  str     r3, [r4, #0x40]
000aabf4  bl      #0x5520c ; -> get_char_ani
000aabf8  movs    r3, #2
000aabfa  str     r3, [r4, #0x44]
000aabfc  movs    r3, #3
000aabfe  str     r3, [r4, #0x1c]
000aac00  ldr.w   r3, [r5, #0xa4]
000aac04  movw    r2, #0x3f2
000aac08  adds    r3, #1
000aac0a  str.w   r2, [r5, r3, lsl #3]
000aac0e  ldr.w   r3, [r5, #0xa4]
000aac12  adds    r2, r3, #1
000aac14  ldr.w   r3, [pc, #0xd0]
000aac18  str.w   r2, [r5, #0xa4]
000aac1c  add     r3, pc ; -> 0x000f37cc  t_mframew
000aac1e  ldr     r1, [r3]
000aac20  lsls    r3, r2, #3
000aac22  adds    r3, r3, r5
000aac24  movs    r0, #0
000aac26  str     r1, [r3, #4]
000aac28  ldr.w   r3, [r5, #0xa4]
000aac2c  adds    r3, #1
000aac2e  str.w   r0, [r5, r3, lsl #3]
000aac32  b       #0xaabe0
000aac34  movw    r2, #0x3f2
000aac38  cmp     r3, r2
000aac3a  bne     #0xaabdc
000aac3c  mov     r0, r4
000aac3e  movs    r3, #6
000aac40  str     r3, [r4, #0x1c]
000aac42  bl      #0x58714 ; -> randu
000aac46  ldr     r3, [r4, #0x1c]
000aac48  adds    r3, #0xa
000aac4a  str     r3, [r4, #0x1c]
000aac4c  ldr.w   r3, [r5, #0xa4]
000aac50  adds    r3, #1
000aac52  str.w   r6, [r5, r3, lsl #3]
000aac56  ldr     r3, [r4, #0x1c]
000aac58  str.w   r3, [r5, #0xfc]
000aac5c  ldr     r0, [r4, #0x1c]
000aac5e  b       #0xaabe0
000aac60  ldr     r3, [pc, #0x88]
000aac62  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000aac64  b       #0xaac1e
000aac66  ldr     r3, [r4, #0x44]
000aac68  subs    r6, r3, #1
000aac6a  str     r6, [r4, #0x44]
000aac6c  cmp     r6, #0
000aac6e  bne     #0xaabfc
000aac70  mov     r0, r4
000aac72  movs    r3, #0x18
000aac74  str     r3, [r4, #0x40]
000aac76  bl      #0x55474 ; -> find_ani_part2
000aac7a  mov     r0, r4
000aac7c  bl      #0x55450 ; -> find_part2
000aac80  movs    r3, #3
000aac82  str     r3, [r4, #0x1c]
000aac84  ldr.w   r3, [r5, #0xa4]
000aac88  mov.w   r2, #0x400
000aac8c  mov     r0, r6
000aac8e  adds    r3, #1
000aac90  str.w   r2, [r5, r3, lsl #3]
000aac94  ldr.w   r3, [r5, #0xa4]
000aac98  adds    r2, r3, #1
000aac9a  ldr     r3, [pc, #0x54]
000aac9c  str.w   r2, [r5, #0xa4]
000aaca0  add     r3, pc ; -> 0x000f37cc  t_mframew
000aaca2  ldr     r1, [r3]
000aaca4  lsls    r3, r2, #3
000aaca6  adds    r3, r3, r5
000aaca8  str     r1, [r3, #4]
000aacaa  ldr.w   r3, [r5, #0xa4]
000aacae  adds    r3, #1
000aacb0  str.w   r6, [r5, r3, lsl #3]
000aacb4  b       #0xaabe0
000aacb6  mov     r0, r4
000aacb8  movs    r3, #0x10
000aacba  str     r3, [r4, #0x1c]
000aacbc  str     r3, [r4, #0x20]
000aacbe  bl      #0x58764 ; -> randu_minimum
000aacc2  ldr     r3, [r4, #0x1c]
000aacc4  movw    r2, #0x406
000aacc8  str     r3, [r4, #0x44]
000aacca  ldr.w   r3, [r5, #0xa4]
000aacce  adds    r3, #1
000aacd0  str.w   r2, [r5, r3, lsl #3]
000aacd4  ldr.w   r3, [r5, #0xa4]
000aacd8  adds    r2, r3, #1
000aacda  ldr     r3, [pc, #0x18]
000aacdc  str.w   r2, [r5, #0xa4]
000aace0  add     r3, pc ; -> 0x000f33fc  t_d_stance_pause
000aace2  b       #0xaac1e
000aace4  movs    r3, r0
000aace6  movs    r0, r1
000aace8  ldrh    r4, [r5, #0x1c]
000aacea  movs    r4, r0
000aacec  ldrh    r2, [r4, #0x14]
000aacee  movs    r4, r0
000aacf0  ldrh    r0, [r5, #0x18]
000aacf2  movs    r4, r0
000aacf4  strh    r0, [r3, #0x38]
000aacf6  movs    r4, r0
