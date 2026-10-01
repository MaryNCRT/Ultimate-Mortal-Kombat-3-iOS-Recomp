========================================================================
t_f_lao  0x000a644c  356 bytes   mkfriend.c
========================================================================

000a644c  push    {r4, r5, r6, r7, lr}
000a644e  add     r7, sp, #0xc
000a6450  str     r8, [sp, #-0x4]!
000a6454  ldr.w   r3, [r0, #0xa4]
000a6458  movw    r8, #0x4b3
000a645c  mov     r4, r0
000a645e  adds    r2, r3, #1
000a6460  ldr.w   r6, [r0, #0x108]
000a6464  ldr.w   r5, [r0, r2, lsl #3]
000a6468  cmp     r5, r8
000a646a  beq     #0xa6522
000a646c  ble     #0xa6490
000a646e  movw    r0, #0x4b7
000a6472  cmp     r5, r0
000a6474  beq     #0xa6548
000a6476  movw    r1, #0x4ba
000a647a  cmp     r5, r1
000a647c  beq     #0xa650a
000a647e  movw    r3, #0x4b6
000a6482  cmp     r5, r3
000a6484  beq     #0xa657e
000a6486  mvn     r0, #2
000a648a  ldr     r8, [sp], #4
000a648e  pop     {r4, r5, r6, r7, pc}
000a6490  cbz     r5, #0xa64b6
000a6492  movw    r3, #0x4b1
000a6496  cmp     r5, r3
000a6498  bne     #0xa6486
000a649a  ldr     r1, [pc, #0xf0]
000a649c  mov     r0, r6
000a649e  add     r1, pc ; -> 0x000a662d  t_hat_proc
000a64a0  bl      #0x58a10 ; -> NewThread
000a64a4  ldr.w   r3, [r4, #0xa4]
000a64a8  movs    r0, #0x60
000a64aa  adds    r3, #1
000a64ac  str.w   r8, [r4, r3, lsl #3]
000a64b0  str.w   r0, [r4, #0xfc]
000a64b4  b       #0xa648a
000a64b6  ldr     r1, [pc, #0xd8]
000a64b8  mov     r0, r6
000a64ba  add     r1, pc ; -> 0x000a5809  t_end_friend_proc
000a64bc  bl      #0x58a10 ; -> NewThread
000a64c0  ldr     r1, [pc, #0xd0]
000a64c2  mov     r0, r6
000a64c4  add     r1, pc ; -> 0x000a5495  t_cute_lil_doggy
000a64c6  bl      #0x58a10 ; -> NewThread
000a64ca  ldr     r1, [pc, #0xcc]
000a64cc  mov     r0, r6
000a64ce  add     r1, pc ; -> 0x000a65b1  t_lao_dog_sounds
000a64d0  bl      #0x58a10 ; -> NewThread
000a64d4  ldr     r3, [pc, #0xc4]
000a64d6  movw    r2, #0x4b1
000a64da  mov     r0, r5
000a64dc  add     r3, pc ; -> 0x00177cc8  a_lao_friend
000a64de  str     r3, [r6, #0x40]
000a64e0  ldr.w   r3, [r4, #0xa4]
000a64e4  adds    r3, #1
000a64e6  str.w   r2, [r4, r3, lsl #3]
000a64ea  ldr.w   r3, [r4, #0xa4]
000a64ee  ldr     r2, [pc, #0xb0]
000a64f0  adds    r3, #1
000a64f2  str.w   r3, [r4, #0xa4]
000a64f6  lsls    r3, r3, #3
000a64f8  adds    r3, r3, r4
000a64fa  add     r2, pc ; -> 0x000a5615  t_mframew_4
000a64fc  str     r2, [r3, #4]
000a64fe  ldr.w   r3, [r4, #0xa4]
000a6502  adds    r3, #1
000a6504  str.w   r5, [r4, r3, lsl #3]
000a6508  b       #0xa648a
000a650a  ldr     r2, [pc, #0x98]
000a650c  add     r2, pc ; -> 0x000a5991  t_friendship_complete
000a650e  lsls    r3, r3, #3
000a6510  adds    r3, r3, r4
000a6512  movs    r0, #0
000a6514  str     r2, [r3, #4]
000a6516  ldr.w   r3, [r4, #0xa4]
000a651a  adds    r3, #1
000a651c  str.w   r0, [r4, r3, lsl #3]
000a6520  b       #0xa648a
000a6522  mov     r0, r6
000a6524  movs    r1, #0x8b
000a6526  bl      #0x57dd0 ; -> tsound_func
000a652a  ldr.w   r3, [r4, #0xa4]
000a652e  movw    r2, #0x4b6
000a6532  adds    r3, #1
000a6534  str.w   r2, [r4, r3, lsl #3]
000a6538  ldr     r2, [pc, #0x6c]
000a653a  ldr.w   r3, [r4, #0xa4]
000a653e  add     r2, pc ; -> 0x000a5615  t_mframew_4
000a6540  adds    r3, #1
000a6542  str.w   r3, [r4, #0xa4]
000a6546  b       #0xa650e
000a6548  movs    r3, #8
000a654a  str     r3, [r6, #0x1c]
000a654c  ldr.w   r3, [r4, #0xa4]
000a6550  movw    r2, #0x4ba
000a6554  movs    r0, #0
000a6556  adds    r3, #1
000a6558  str.w   r2, [r4, r3, lsl #3]
000a655c  ldr.w   r3, [r4, #0xa4]
000a6560  adds    r2, r3, #1
000a6562  ldr     r3, [pc, #0x48]
000a6564  str.w   r2, [r4, #0xa4]
000a6568  add     r3, pc ; -> 0x000f37cc  t_mframew
000a656a  ldr     r1, [r3]
000a656c  lsls    r3, r2, #3
000a656e  adds    r3, r3, r4
000a6570  str     r1, [r3, #4]
000a6572  ldr.w   r3, [r4, #0xa4]
000a6576  adds    r3, #1
000a6578  str.w   r0, [r4, r3, lsl #3]
000a657c  b       #0xa648a
000a657e  str.w   r0, [r4, r2, lsl #3]
000a6582  movs    r0, #0x30
000a6584  str.w   r0, [r4, #0xfc]
000a6588  b       #0xa648a
000a658a  nop     
000a658c  lsls    r3, r1, #6
000a658e  movs    r0, r0
000a6590  bl      #0x3f2592
