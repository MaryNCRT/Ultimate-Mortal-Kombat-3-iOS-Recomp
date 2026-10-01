========================================================================
t_f_jax  0x000a6734  152 bytes   mkfriend.c
========================================================================

000a6734  push    {r4, r5, r6, r7, lr}
000a6736  add     r7, sp, #0xc
000a6738  ldr.w   r1, [r0, #0xa4]
000a673c  movw    r6, #0x23a
000a6740  mov     r4, r0
000a6742  adds    r2, r1, #1
000a6744  ldr.w   r5, [r0, #0x108]
000a6748  ldr.w   r3, [r0, r2, lsl #3]
000a674c  cmp     r3, r6
000a674e  beq     #0xa67a0
000a6750  movw    r2, #0x23b
000a6754  cmp     r3, r2
000a6756  beq     #0xa6788
000a6758  cbz     r3, #0xa6760
000a675a  mvn     r0, #2
000a675e  pop     {r4, r5, r6, r7, pc}
000a6760  ldr     r1, [pc, #0x58]
000a6762  mov     r0, r5
000a6764  add     r1, pc ; -> 0x000a5809  t_end_friend_proc
000a6766  bl      #0x58a10 ; -> NewThread
000a676a  ldr     r3, [pc, #0x54]
000a676c  mov     r0, r5
000a676e  add     r3, pc ; -> 0x00177a0c  a_jax_friend
000a6770  str     r3, [r5, #0x40]
000a6772  bl      #0x59e24 ; -> do_next_a9_frame
000a6776  ldr.w   r3, [r4, #0xa4]
000a677a  movs    r0, #0x20
000a677c  adds    r3, #1
000a677e  str.w   r6, [r4, r3, lsl #3]
000a6782  str.w   r0, [r4, #0xfc]
000a6786  b       #0xa675e
000a6788  ldr     r2, [pc, #0x38]
000a678a  lsls    r3, r1, #3
000a678c  add     r2, pc ; -> 0x000a5991  t_friendship_complete
000a678e  adds    r3, r3, r4
000a6790  movs    r0, #0
000a6792  str     r2, [r3, #4]
000a6794  ldr.w   r3, [r4, #0xa4]
000a6798  adds    r3, #1
000a679a  str.w   r0, [r4, r3, lsl #3]
000a679e  b       #0xa675e
000a67a0  movw    r3, #0x23b
000a67a4  str.w   r3, [r0, r2, lsl #3]
000a67a8  ldr.w   r3, [r0, #0xa4]
000a67ac  ldr     r2, [pc, #0x18]
000a67ae  adds    r3, #1
000a67b0  add     r2, pc ; -> 0x000a5585  t_mframew_3
000a67b2  str.w   r3, [r0, #0xa4]
000a67b6  lsls    r3, r3, #3
000a67b8  b       #0xa678e
000a67ba  nop     
000a67bc  bl      #0x1487be
000a67c0  asrs    r2, r3, #0xa
000a67c2  movs    r5, r1
000a67c4  bl      #0x2a87c6
000a67c8  ldcl    p15, c15, [r1, #0x3fc]
