========================================================================
t_boss_stalk  0x000ab5fc  192 bytes   mkboss.c
========================================================================

000ab5fc  push    {r4, r5, r6, r7, lr}
000ab5fe  add     r7, sp, #0xc
000ab600  str     r8, [sp, #-0x4]!
000ab604  ldr.w   r3, [r0, #0xa4]
000ab608  mov     r4, r0
000ab60a  ldr.w   r5, [r0, #0x108]
000ab60e  adds    r3, #1
000ab610  ldr.w   r6, [r0, r3, lsl #3]
000ab614  cbnz    r6, #0xab63c
000ab616  mov     r0, r5
000ab618  bl      #0xa8d64 ; -> q_is_he_car
000ab61c  ldr     r3, [r5, #0x5c]
000ab61e  cbnz    r3, #0xab646
000ab620  ldr     r2, [pc, #0x88]
000ab622  add     r2, pc ; -> 0x000ac5e1  t_boss1
000ab624  ldr.w   r3, [r4, #0xa4]
000ab628  mov     r0, r6
000ab62a  lsls    r3, r3, #3
000ab62c  adds    r3, r3, r4
000ab62e  str     r2, [r3, #4]
000ab630  ldr.w   r3, [r4, #0xa4]
000ab634  adds    r3, #1
000ab636  str.w   r6, [r4, r3, lsl #3]
000ab63a  b       #0xab640
000ab63c  mvn     r0, #2
000ab640  ldr     r8, [sp], #4
000ab644  pop     {r4, r5, r6, r7, pc}
000ab646  mov.w   r3, #0x12c
000ab64a  mov     r0, r5
000ab64c  str     r3, [r5, #0x1c]
000ab64e  bl      #0xab5f0 ; -> bossrandper_org
000ab652  ldr.w   r8, [r5, #0x5c]
000ab656  cmp.w   r8, #0
000ab65a  beq     #0xab662
000ab65c  ldr     r2, [pc, #0x50]
000ab65e  add     r2, pc ; -> 0x000aaf69  t_sk_laugh
000ab660  b       #0xab624
000ab662  mov.w   r3, #0x320
000ab666  mov     r0, r5
000ab668  str     r3, [r5, #0x1c]
000ab66a  bl      #0xab5f0 ; -> bossrandper_org
000ab66e  ldr     r0, [r5, #0x5c]
000ab670  cbz     r0, #0xab68e
000ab672  ldr.w   r3, [r4, #0xa4]
000ab676  ldr     r2, [pc, #0x3c]
000ab678  mov     r0, r8
000ab67a  lsls    r3, r3, #3
000ab67c  adds    r3, r3, r4
000ab67e  add     r2, pc ; -> 0x000aaa45  t_boss_ease_back
000ab680  str     r2, [r3, #4]
000ab682  ldr.w   r3, [r4, #0xa4]
000ab686  adds    r3, #1
000ab688  str.w   r8, [r4, r3, lsl #3]
000ab68c  b       #0xab640
000ab68e  ldr.w   r3, [r4, #0xa4]
000ab692  ldr.w   r2, [pc, #0x24]
000ab696  lsls    r3, r3, #3
000ab698  adds    r3, r3, r4
000ab69a  add     r2, pc ; -> 0x000ac5e1  t_boss1
000ab69c  str     r2, [r3, #4]
000ab69e  ldr.w   r3, [r4, #0xa4]
000ab6a2  adds    r3, #1
000ab6a4  str.w   r0, [r4, r3, lsl #3]
000ab6a8  b       #0xab640
000ab6aa  nop     
000ab6ac  lsrs    r3, r7, #0x1e
000ab6ae  movs    r0, r0
