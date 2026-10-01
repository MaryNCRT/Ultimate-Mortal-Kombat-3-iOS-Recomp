========================================================================
t_avoid_corner_trap  0x00047b50  116 bytes   mkreact.c
========================================================================

00047b50  push    {r4, r5, r7, lr}
00047b52  add     r7, sp, #8
00047b54  ldr.w   r3, [r0, #0xa4]
00047b58  mov     r5, r0
00047b5a  ldr.w   r4, [r0, #0x108]
00047b5e  adds    r3, #1
00047b60  ldr.w   r3, [r0, r3, lsl #3]
00047b64  cbnz    r3, #0x47b82
00047b66  mov     r0, r4
00047b68  bl      #0x5718c ; -> am_i_close_to_edge
00047b6c  ldr     r3, [r4, #0x5c]
00047b6e  cbnz    r3, #0x47b88
00047b70  ldr.w   r3, [r5, #0xa4]
00047b74  cmp     r3, #0
00047b76  ble     #0x47ba2
00047b78  subs    r3, #1
00047b7a  movs    r0, #0
00047b7c  str.w   r3, [r5, #0xa4]
00047b80  b       #0x47b86
00047b82  mvn     r0, #2
00047b86  pop     {r4, r5, r7, pc}
00047b88  ldr     r3, [r4]
00047b8a  ldr     r2, [r4, #0x20]
00047b8c  ldr     r3, [r3, #0x44]
00047b8e  cmp     r3, r2
00047b90  str     r3, [r4, #0x1c]
00047b92  blt     #0x47b70
00047b94  ldr     r3, [pc, #0x24]
00047b96  mov     r0, r4
00047b98  add     r3, pc ; -> 0x00047635  t_ken_masters_xfer
00047b9a  str     r3, [r4, #0x38]
00047b9c  bl      #0x55130 ; -> xfer_otherguy
00047ba0  b       #0x47b70
00047ba2  ldr     r2, [pc, #0x1c]
00047ba4  lsls    r3, r3, #3
00047ba6  adds    r3, r3, r5
00047ba8  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00047baa  movs    r0, #0
00047bac  ldr     r2, [r2]
00047bae  str     r2, [r3, #4]
00047bb0  ldr.w   r3, [r5, #0xa4]
00047bb4  adds    r3, #1
00047bb6  str.w   r0, [r5, r3, lsl #3]
00047bba  b       #0x47b86
