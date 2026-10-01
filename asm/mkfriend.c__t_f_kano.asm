========================================================================
t_f_kano  0x000a5418  124 bytes   mkfriend.c
========================================================================

000a5418  ldr.w   r1, [r0, #0xa4]
000a541c  ldr.w   ip, [r0, #0x108]
000a5420  adds    r3, r1, #1
000a5422  ldr.w   r2, [r0, r3, lsl #3]
000a5426  cbnz    r2, #0xa5462
000a5428  ldr     r3, [pc, #0x5c]
000a542a  mov.w   r1, #0x1e0
000a542e  add     r3, pc ; -> 0x001778e8  a_kano_friend
000a5430  str.w   r3, [ip, #0x40]
000a5434  ldr.w   r3, [r0, #0xa4]
000a5438  adds    r3, #1
000a543a  str.w   r1, [r0, r3, lsl #3]
000a543e  ldr.w   r3, [r0, #0xa4]
000a5442  ldr.w   r1, [pc, #0x48]
000a5446  adds    r3, #1
000a5448  str.w   r3, [r0, #0xa4]
000a544c  lsls    r3, r3, #3
000a544e  adds    r3, r3, r0
000a5450  add     r1, pc ; -> 0x000a56a1  t_mframew_5
000a5452  str     r1, [r3, #4]
000a5454  ldr.w   r3, [r0, #0xa4]
000a5458  adds    r3, #1
000a545a  str.w   r2, [r0, r3, lsl #3]
000a545e  mov     r0, r2
000a5460  bx      lr
000a5462  cmp.w   r2, #0x1e0
000a5466  it      ne
000a5468  mvnne   r0, #2
000a546c  bne     #0xa5460
000a546e  ldr     r2, [pc, #0x20]
000a5470  lsls    r3, r1, #3
000a5472  adds    r3, r3, r0
000a5474  add     r2, pc ; -> 0x000a5991  t_friendship_complete
000a5476  str     r2, [r3, #4]
000a5478  ldr.w   r3, [r0, #0xa4]
000a547c  movs    r2, #0
000a547e  adds    r3, #1
000a5480  str.w   r2, [r0, r3, lsl #3]
000a5484  mov     r0, r2
000a5486  b       #0xa5460
000a5488  movs    r4, #0xb6
000a548a  movs    r5, r1
000a548c  lsls    r5, r1, #9
000a548e  movs    r0, r0
000a5490  lsls    r1, r3, #0x14
000a5492  movs    r0, r0
