========================================================================
t_d_beware  0x0006c40c  416 bytes   mkdrone.c
========================================================================

0006c40c  push    {r4, r5, r6, r7, lr}
0006c40e  add     r7, sp, #0xc
0006c410  ldr.w   r3, [r0, #0xa4]
0006c414  mov     r4, r0
0006c416  ldr.w   r5, [r0, #0x108]
0006c41a  adds    r3, #1
0006c41c  ldr.w   r0, [r0, r3, lsl #3]
0006c420  cbz     r0, #0x6c428
0006c422  mvn     r0, #2
0006c426  pop     {r4, r5, r6, r7, pc}
0006c428  ldr     r3, [pc, #0x160]
0006c42a  add     r3, pc ; -> 0x000f357c  G
0006c42c  ldr     r3, [r3]
0006c42e  ldrh.w  r6, [r3, #0x45c]
0006c432  sxth    r3, r6
0006c434  str     r3, [r5, #0x1c]
0006c436  cbz     r6, #0x6c448
0006c438  ldr.w   r3, [r4, #0xa4]
0006c43c  cmp     r3, #0
0006c43e  ble     #0x6c4c6
0006c440  subs    r3, #1
0006c442  str.w   r3, [r4, #0xa4]
0006c446  b       #0x6c426
0006c448  mov     r0, r5
0006c44a  bl      #0x54e38 ; -> get_his_action
0006c44e  ldr     r3, [r5, #0x1c]
0006c450  cbnz    r3, #0x6c464
0006c452  ldr.w   r3, [r4, #0xa4]
0006c456  cmp     r3, #0
0006c458  ble     #0x6c4fe
0006c45a  subs    r3, #1
0006c45c  mov     r0, r6
0006c45e  str.w   r3, [r4, #0xa4]
0006c462  b       #0x6c426
0006c464  ldr     r1, [r5]
0006c466  ldr     r2, [r5, #0x20]
0006c468  ldr     r3, [r1, #0x5c]
0006c46a  cmp     r3, r2
0006c46c  str     r3, [r5, #0x1c]
0006c46e  beq     #0x6c4f0
0006c470  str     r2, [r1, #0x5c]
0006c472  ldr     r0, [r5, #0x20]
0006c474  ldr.w   ip, [r5, #8]
0006c478  ldr     r3, [pc, #0x114]
0006c47a  asrs    r1, r0, #8
0006c47c  str     r1, [r5, #0x24]
0006c47e  ldr.w   r2, [ip, #0x24]
0006c482  add     r3, pc ; -> 0x00172300  ochar_cat_tables
0006c484  str     r2, [r5, #0x1c]
0006c486  ldr.w   r3, [r3, r2, lsl #2]
0006c48a  str     r3, [r5, #0x28]
0006c48c  ldr.w   r3, [r3, r1, lsl #2]
0006c490  str     r3, [r5, #0x24]
0006c492  cbz     r3, #0x6c4e0
0006c494  and     r2, r0, #0xff
0006c498  str     r2, [r5, #0x20]
0006c49a  ldr.w   r3, [r3, r2, lsl #2]
0006c49e  str     r3, [r5, #0x20]
0006c4a0  cbnz    r3, #0x6c506
0006c4a2  ldr.w   r3, [r4, #0xa4]
0006c4a6  cmp     r3, #0
0006c4a8  bgt     #0x6c45a
0006c4aa  ldr.w   r2, [pc, #0xe8]
0006c4ae  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006c4b0  ldr     r2, [r2]
0006c4b2  lsls    r3, r3, #3
0006c4b4  adds    r3, r3, r4
0006c4b6  mov     r0, r6
0006c4b8  str     r2, [r3, #4]
0006c4ba  ldr.w   r3, [r4, #0xa4]
0006c4be  adds    r3, #1
0006c4c0  str.w   r6, [r4, r3, lsl #3]
0006c4c4  b       #0x6c426
0006c4c6  ldr.w   r2, [pc, #0xd0]
0006c4ca  lsls    r3, r3, #3
0006c4cc  adds    r3, r3, r4
0006c4ce  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006c4d0  ldr     r2, [r2]
0006c4d2  str     r2, [r3, #4]
0006c4d4  ldr.w   r3, [r4, #0xa4]
0006c4d8  adds    r3, #1
0006c4da  str.w   r0, [r4, r3, lsl #3]
0006c4de  b       #0x6c426
0006c4e0  ldr.w   r3, [r4, #0xa4]
0006c4e4  cmp     r3, #0
0006c4e6  bgt     #0x6c45a
0006c4e8  ldr.w   r2, [pc, #0xb0]
0006c4ec  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006c4ee  b       #0x6c4b0
0006c4f0  ldr.w   r3, [r4, #0xa4]
0006c4f4  cmp     r3, #0
0006c4f6  bgt     #0x6c45a
0006c4f8  ldr     r2, [pc, #0xa4]
0006c4fa  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006c4fc  b       #0x6c4b0
0006c4fe  ldr.w   r2, [pc, #0xa4]
0006c502  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006c504  b       #0x6c4b0
0006c506  ldr.w   r3, [ip, #0x24]
0006c50a  str     r3, [r5, #0x28]
0006c50c  ldr.w   r3, [r4, #0xa4]
0006c510  cmp     r3, #0
0006c512  ble     #0x6c572
0006c514  subs    r3, #1
0006c516  str.w   r3, [r4, #0xa4]
0006c51a  ldr.w   r0, [r4, #0xa4]
0006c51e  ldr     r1, [r5]
0006c520  lsls    r3, r0, #3
0006c522  adds    r3, r3, r4
0006c524  ldr     r2, [r3, #4]
0006c526  adds    r3, r0, #1
0006c528  ldr.w   r3, [r4, r3, lsl #3]
0006c52c  str     r2, [r1, #0x6c]
0006c52e  str     r3, [r1, #0x70]
0006c530  ldr.w   r1, [r4, #0xa4]
0006c534  adds    r3, r1, #1
0006c536  lsls    r2, r3, #3
0006c538  adds    r2, r2, r4
0006c53a  ldr     r0, [r2, #4]
0006c53c  adds    r2, r3, #1
0006c53e  ldr.w   r2, [r4, r2, lsl #3]
0006c542  str.w   r2, [r4, r3, lsl #3]
0006c546  lsls    r3, r1, #3
0006c548  adds    r3, r3, r4
0006c54a  str     r0, [r3, #4]
0006c54c  ldr     r2, [r5]
0006c54e  ldr     r3, [r5, #0x44]
0006c550  str     r3, [r2, #0x74]
0006c552  ldr     r3, [r5, #0x48]
0006c554  ldr     r2, [r5]
0006c556  str     r3, [r2, #0x78]
0006c558  ldr.w   r3, [r4, #0xa4]
0006c55c  ldr     r0, [r5, #0x20]
0006c55e  lsls    r3, r3, #3
0006c560  adds    r3, r3, r4
0006c562  str     r0, [r3, #4]
0006c564  ldr.w   r3, [r4, #0xa4]
0006c568  movs    r0, #0
0006c56a  adds    r3, #1
0006c56c  str.w   r0, [r4, r3, lsl #3]
0006c570  b       #0x6c426
0006c572  ldr     r2, [pc, #0x34]
0006c574  lsls    r3, r3, #3
0006c576  adds    r3, r3, r4
0006c578  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006c57a  ldr     r2, [r2]
0006c57c  str     r2, [r3, #4]
0006c57e  ldr.w   r3, [r4, #0xa4]
0006c582  adds    r3, #1
0006c584  str.w   r6, [r4, r3, lsl #3]
0006c588  b       #0x6c51a
0006c58a  nop     
0006c58c  strb    r6, [r1, #5]
0006c58e  movs    r0, r1
0006c590  ldrsh   r2, [r7, r1]
0006c592  movs    r0, r2
0006c594  strb    r6, [r2, #9]
0006c596  movs    r0, r1
0006c598  strb    r6, [r6, #8]
0006c59a  movs    r0, r1
0006c59c  strb    r0, [r3, #8]
0006c59e  movs    r0, r1
0006c5a0  strb    r2, [r1, #8]
0006c5a2  movs    r0, r1
0006c5a4  strb    r2, [r0, #8]
0006c5a6  movs    r0, r1
0006c5a8  strb    r4, [r1, #6]
0006c5aa  movs    r0, r1
