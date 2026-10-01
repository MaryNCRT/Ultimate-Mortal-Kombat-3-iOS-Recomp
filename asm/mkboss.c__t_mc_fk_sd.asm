========================================================================
t_mc_fk_sd  0x000abbf4  208 bytes   mkboss.c
========================================================================

000abbf4  push    {r4, r5, r6, r7, lr}
000abbf6  add     r7, sp, #0xc
000abbf8  ldr.w   r2, [r0, #0xa4]
000abbfc  mov     r4, r0
000abbfe  ldr.w   r5, [r0, #0x108]
000abc02  adds    r3, r2, #1
000abc04  ldr.w   r6, [r0, r3, lsl #3]
000abc08  cbnz    r6, #0xabc38
000abc0a  mov.w   r3, #0x1f4
000abc0e  mov     r0, r5
000abc10  str     r3, [r5, #0x1c]
000abc12  bl      #0xab6bc ; -> bossrandper
000abc16  ldr     r3, [r5, #0x5c]
000abc18  cbnz    r3, #0xabc5c
000abc1a  ldr     r3, [pc, #0x94]
000abc1c  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000abc1e  ldr     r2, [r3]
000abc20  ldr.w   r3, [r4, #0xa4]
000abc24  mov     r0, r6
000abc26  lsls    r3, r3, #3
000abc28  adds    r3, r3, r4
000abc2a  str     r2, [r3, #4]
000abc2c  ldr.w   r3, [r4, #0xa4]
000abc30  adds    r3, #1
000abc32  str.w   r6, [r4, r3, lsl #3]
000abc36  pop     {r4, r5, r6, r7, pc}
000abc38  cmp.w   r6, #0x698
000abc3c  it      ne
000abc3e  mvnne   r0, #2
000abc42  bne     #0xabc36
000abc44  ldr     r1, [pc, #0x6c]
000abc46  lsls    r3, r2, #3
000abc48  adds    r3, r3, r4
000abc4a  add     r1, pc ; -> 0x000aa4f1  t_motaro_grab_punch_now
000abc4c  str     r1, [r3, #4]
000abc4e  ldr.w   r3, [r4, #0xa4]
000abc52  movs    r0, #0
000abc54  adds    r3, #1
000abc56  str.w   r0, [r4, r3, lsl #3]
000abc5a  b       #0xabc36
000abc5c  mov     r0, r5
000abc5e  bl      #0x2f3a0 ; -> get_x_dist
000abc62  ldr     r3, [r5, #0x28]
000abc64  cmp     r3, #0x90
000abc66  ble     #0xabc70
000abc68  ldr.w   r3, [pc, #0x4c]
000abc6c  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000abc6e  b       #0xabc1e
000abc70  movs    r3, #0x40
000abc72  str     r3, [r5, #0x44]
000abc74  ldr.w   r3, [pc, #0x44]
000abc78  mov.w   r2, #0x698
000abc7c  mov     r0, r6
000abc7e  add     r3, pc ; -> 0x000f3030  is_he_airborn
000abc80  ldr     r3, [r3]
000abc82  str     r3, [r5, #0x48]
000abc84  ldr.w   r3, [r4, #0xa4]
000abc88  adds    r3, #1
000abc8a  str.w   r2, [r4, r3, lsl #3]
000abc8e  ldr.w   r3, [r4, #0xa4]
000abc92  adds    r2, r3, #1
000abc94  ldr     r3, [pc, #0x28]
000abc96  str.w   r2, [r4, #0xa4]
000abc9a  add     r3, pc ; -> 0x000f3408  t_stance_wait_no
000abc9c  ldr     r1, [r3]
000abc9e  lsls    r3, r2, #3
000abca0  adds    r3, r3, r4
000abca2  str     r1, [r3, #4]
000abca4  ldr.w   r3, [r4, #0xa4]
000abca8  adds    r3, #1
000abcaa  str.w   r6, [r4, r3, lsl #3]
000abcae  b       #0xabc36
000abcb0  ldrb    r0, [r1]
000abcb2  movs    r4, r0
