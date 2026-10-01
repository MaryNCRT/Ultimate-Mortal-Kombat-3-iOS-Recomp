========================================================================
t_floor_ice_proc  0x0007bcfc  428 bytes   mkzap.c
========================================================================

0007bcfc  push    {r4, r5, r6, r7, lr}
0007bcfe  add     r7, sp, #0xc
0007bd00  str     r8, [sp, #-0x4]!
0007bd04  ldr.w   r2, [r0, #0xa4]
0007bd08  mov     r5, r0
0007bd0a  ldr.w   r6, [r0, #0x108]
0007bd0e  adds    r3, r2, #1
0007bd10  ldr.w   r4, [r0, r3, lsl #3]
0007bd14  cmp.w   r4, #0x124
0007bd18  beq     #0x7bdc0
0007bd1a  ble     #0x7bd34
0007bd1c  cmp.w   r4, #0x156
0007bd20  beq     #0x7be0c
0007bd22  movw    r3, #0x161
0007bd26  cmp     r4, r3
0007bd28  beq     #0x7bda6
0007bd2a  mvn     r0, #2
0007bd2e  ldr     r8, [sp], #4
0007bd32  pop     {r4, r5, r6, r7, pc}
0007bd34  cbz     r4, #0x7bd56
0007bd36  cmp.w   r4, #0x120
0007bd3a  bne     #0x7bd2a
0007bd3c  movs    r3, #0x50
0007bd3e  str     r3, [r6, #0x48]
0007bd40  ldr.w   r3, [r5, #0xa4]
0007bd44  movs    r0, #1
0007bd46  mov.w   r2, #0x124
0007bd4a  adds    r3, #1
0007bd4c  str.w   r2, [r5, r3, lsl #3]
0007bd50  str.w   r0, [r5, #0xfc]
0007bd54  b       #0x7bd2e
0007bd56  ldr     r3, [r6]
0007bd58  mov     r0, r6
0007bd5a  mov.w   r8, #3
0007bd5e  str     r4, [r6, #0x1c]
0007bd60  str     r4, [r3, #0x18]
0007bd62  movs    r3, #0x10
0007bd64  str.w   r8, [r6, #0x54]
0007bd68  str     r3, [r6, #0x40]
0007bd6a  bl      #0x554c0 ; -> find_ani2_part_a14
0007bd6e  str.w   r8, [r6, #0x1c]
0007bd72  ldr.w   r3, [r5, #0xa4]
0007bd76  mov.w   r2, #0x120
0007bd7a  mov     r0, r4
0007bd7c  adds    r3, #1
0007bd7e  str.w   r2, [r5, r3, lsl #3]
0007bd82  ldr.w   r3, [r5, #0xa4]
0007bd86  adds    r2, r3, #1
0007bd88  ldr     r3, [pc, #0x104]
0007bd8a  str.w   r2, [r5, #0xa4]
0007bd8e  add     r3, pc ; -> 0x000f37cc  t_mframew
0007bd90  ldr     r1, [r3]
0007bd92  lsl.w   r3, r2, r8
0007bd96  adds    r3, r3, r5
0007bd98  str     r1, [r3, #4]
0007bd9a  ldr.w   r3, [r5, #0xa4]
0007bd9e  adds    r3, #1
0007bda0  str.w   r4, [r5, r3, lsl #3]
0007bda4  b       #0x7bd2e
0007bda6  ldr.w   r1, [pc, #0xec]
0007bdaa  add     r1, pc ; -> 0x00075665  tl_delete_proj_and_die
0007bdac  lsls    r3, r2, #3
0007bdae  adds    r3, r3, r5
0007bdb0  movs    r0, #0
0007bdb2  str     r1, [r3, #4]
0007bdb4  ldr.w   r3, [r5, #0xa4]
0007bdb8  adds    r3, #1
0007bdba  str.w   r0, [r5, r3, lsl #3]
0007bdbe  b       #0x7bd2e
0007bdc0  mov     r0, r6
0007bdc2  bl      #0x68e20 ; -> q_is_he_a_boss
0007bdc6  ldr     r3, [r6, #0x5c]
0007bdc8  cbnz    r3, #0x7be30
0007bdca  ldr     r3, [pc, #0xcc]
0007bdcc  add     r3, pc ; -> 0x000f357c  G
0007bdce  ldr     r3, [r3]
0007bdd0  ldrh.w  r2, [r3, #0x45c]
0007bdd4  sxth    r3, r2
0007bdd6  str     r3, [r6, #0x1c]
0007bdd8  cbz     r2, #0x7be3c
0007bdda  mov     r0, r6
0007bddc  movs    r3, #0x10
0007bdde  movs    r4, #4
0007bde0  str     r3, [r6, #0x40]
0007bde2  str     r4, [r6, #0x54]
0007bde4  bl      #0x554c0 ; -> find_ani2_part_a14
0007bde8  str     r4, [r6, #0x1c]
0007bdea  ldr.w   r3, [r5, #0xa4]
0007bdee  movw    r2, #0x161
0007bdf2  adds    r3, #1
0007bdf4  str.w   r2, [r5, r3, lsl #3]
0007bdf8  ldr.w   r3, [r5, #0xa4]
0007bdfc  adds    r2, r3, #1
0007bdfe  ldr.w   r3, [pc, #0x9c]
0007be02  str.w   r2, [r5, #0xa4]
0007be06  add     r3, pc ; -> 0x000f37cc  t_mframew
0007be08  ldr     r1, [r3]
0007be0a  b       #0x7bdac
0007be0c  mov     r0, r6
0007be0e  bl      #0x54e38 ; -> get_his_action
0007be12  ldr     r3, [r6, #0x20]
0007be14  cmp.w   r3, #0x628
0007be18  bne     #0x7bdda
0007be1a  ldr.w   r3, [r5, #0xa4]
0007be1e  movs    r0, #3
0007be20  mov.w   r2, #0x156
0007be24  adds    r3, #1
0007be26  str.w   r2, [r5, r3, lsl #3]
0007be2a  str.w   r0, [r5, #0xfc]
0007be2e  b       #0x7bd2e
0007be30  ldr     r3, [r6, #0x48]
0007be32  subs    r3, #1
0007be34  str     r3, [r6, #0x48]
0007be36  cmp     r3, #0
0007be38  bne     #0x7bd40
0007be3a  b       #0x7bdda
0007be3c  movs    r3, #0x18
0007be3e  mov     r0, r6
0007be40  str     r3, [r6, #0x1c]
0007be42  bl      #0x75f5c ; -> proj_strike_check
0007be46  ldr     r3, [r6, #0x5c]
0007be48  cmp     r3, #0
0007be4a  beq     #0x7be30
0007be4c  ldr.w   r2, [r5, #0x104]
0007be50  movw    r3, #0x707
0007be54  cmp     r2, r3
0007be56  beq     #0x7be84
0007be58  ldr.w   r1, [pc, #0x44]
0007be5c  add     r1, pc ; -> 0x000f320c  GrObj
0007be5e  ldr     r1, [r1]
0007be60  add.w   r4, r1, #0x4c
0007be64  mov     r0, r6
0007be66  mov     r1, r4
0007be68  bl      #0x5582c ; -> leftmost_mpart_ob
0007be6c  mov     r0, r6
0007be6e  mov     r1, r4
0007be70  bl      #0x55850 ; -> rightmost_mpart_ob
0007be74  ldr     r1, [r6]
0007be76  ldr     r3, [r6, #0x24]
0007be78  ldr     r0, [r6, #0x28]
0007be7a  ldr     r2, [r1]
0007be7c  str     r3, [r2, #0x44]
0007be7e  ldr     r3, [r1]
0007be80  str     r0, [r3, #0x48]
0007be82  b       #0x7be1a
0007be84  ldr.w   r1, [pc, #0x1c]
0007be88  add     r1, pc ; -> 0x000f320c  GrObj
0007be8a  ldr     r4, [r1]
0007be8c  b       #0x7be64
0007be8e  nop     
0007be90  ldrb    r2, [r7, #8]
0007be92  movs    r7, r0
0007be94  ldr     r0, [sp, #0x2dc]
