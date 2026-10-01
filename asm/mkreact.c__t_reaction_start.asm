========================================================================
t_reaction_start  0x00044b84  108 bytes   mkreact.c
========================================================================

00044b84  push    {r4, r5, r6, r7, lr}
00044b86  add     r7, sp, #0xc
00044b88  push.w  {r8, sl, fp}
00044b8c  ldr.w   r3, [r0, #0xa4]
00044b90  mov     r5, r0
00044b92  ldr.w   r4, [r0, #0x108]
00044b96  adds    r3, #1
00044b98  ldr.w   r6, [r0, r3, lsl #3]
00044b9c  cbnz    r6, #0x44be6
00044b9e  ldr     r2, [r4]
00044ba0  movw    r3, #0x503
00044ba4  str     r3, [r4, #0x1c]
00044ba6  mov     r0, r4
00044ba8  str     r3, [r2, #0x18]
00044baa  ldr.w   fp, [r4, #0x30]
00044bae  ldr.w   sl, [r4, #0x34]
00044bb2  ldr.w   r8, [r4, #0x38]
00044bb6  bl      #0x44b0c ; -> reaction_start_chores
00044bba  str.w   fp, [r4, #0x30]
00044bbe  str.w   sl, [r4, #0x34]
00044bc2  str.w   r8, [r4, #0x38]
00044bc6  ldr.w   r3, [r5, #0xa4]
00044bca  ldr     r2, [pc, #0x20]
00044bcc  mov     r0, r6
00044bce  lsls    r3, r3, #3
00044bd0  adds    r3, r3, r5
00044bd2  add     r2, pc ; -> 0x000473d1  t_rst5
00044bd4  str     r2, [r3, #4]
00044bd6  ldr.w   r3, [r5, #0xa4]
00044bda  adds    r3, #1
00044bdc  str.w   r6, [r5, r3, lsl #3]
00044be0  pop.w   {r8, sl, fp}
00044be4  pop     {r4, r5, r6, r7, pc}
00044be6  mvn     r0, #2
00044bea  b       #0x44be0
00044bec  movs    r7, #0xfb
00044bee  movs    r0, r0
