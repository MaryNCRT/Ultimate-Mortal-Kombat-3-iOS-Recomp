========================================================================
t_football_proc  0x000a68f8  132 bytes   mkfriend.c
========================================================================

000a68f8  push    {r4, r5, r7, lr}
000a68fa  add     r7, sp, #8
000a68fc  ldr.w   r3, [r0, #0xa4]
000a6900  mov     r5, r0
000a6902  ldr.w   r4, [r0, #0x108]
000a6906  adds    r3, #1
000a6908  ldr.w   r3, [r0, r3, lsl #3]
000a690c  cmp     r3, #0
000a690e  bne     #0xa695e
000a6910  ldr     r2, [r4, #8]
000a6912  mov.w   r3, #0xa0000
000a6916  str     r3, [r4, #0x1c]
000a6918  mov     r0, r4
000a691a  ldr     r3, [r2, #0x28]
000a691c  tst.w   r3, #0x10
000a6920  str     r3, [r4, #0x2c]
000a6922  itt     ne
000a6924  ldrne   r3, [pc, #0x4c]
000a6926  strne   r3, [r4, #0x1c]
000a6928  ldr     r3, [r4, #0x1c]
000a692a  str     r3, [r2, #0x18]
000a692c  ldr     r2, [pc, #0x44]
000a692e  ldr     r3, [r4, #8]
000a6930  str     r2, [r4, #0x1c]
000a6932  str     r2, [r3, #0x1c]
000a6934  ldr     r3, [pc, #0x40]
000a6936  add     r3, pc ; -> 0x00177ba4  a_football
000a6938  str     r3, [r4, #0x40]
000a693a  bl      #0x55450 ; -> find_part2
000a693e  mov     r0, r4
000a6940  movs    r3, #2
000a6942  str     r3, [r4, #0x1c]
000a6944  bl      #0x553a0 ; -> init_anirate
000a6948  ldr.w   r3, [r5, #0xa4]
000a694c  movw    r2, #0x3b5
000a6950  movs    r0, #1
000a6952  adds    r3, #1
000a6954  str.w   r2, [r5, r3, lsl #3]
000a6958  str.w   r0, [r5, #0xfc]
000a695c  pop     {r4, r5, r7, pc}
000a695e  movw    r2, #0x3b5
000a6962  cmp     r3, r2
000a6964  it      ne
000a6966  mvnne   r0, #2
000a696a  bne     #0xa695c
000a696c  mov     r0, r4
000a696e  bl      #0x5a680 ; -> next_anirate
000a6972  b       #0xa6948
000a6974  movs    r0, r0
000a6976  vqmovun.s32 d17, q13
000a697a  movs    r5, r1
