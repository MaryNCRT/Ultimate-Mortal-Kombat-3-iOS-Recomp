========================================================================
t_ct_propell  0x0006b638  132 bytes   mkdrone.c
========================================================================

0006b638  ldr.w   r1, [r0, #0xa4]
0006b63c  ldr.w   ip, [r0, #0x108]
0006b640  adds    r3, r1, #1
0006b642  ldr.w   r2, [r0, r3, lsl #3]
0006b646  cbnz    r2, #0x6b688
0006b648  ldr     r3, [pc, #0x64]
0006b64a  movw    r1, #0x1263
0006b64e  add     r3, pc ; -> 0x0006e729  is_propell_close
0006b650  str.w   r3, [ip, #0x48]
0006b654  movs    r3, #0x30
0006b656  str.w   r3, [ip, #0x44]
0006b65a  ldr.w   r3, [r0, #0xa4]
0006b65e  adds    r3, #1
0006b660  str.w   r1, [r0, r3, lsl #3]
0006b664  ldr.w   r3, [r0, #0xa4]
0006b668  ldr.w   r1, [pc, #0x48]
0006b66c  adds    r3, #1
0006b66e  str.w   r3, [r0, #0xa4]
0006b672  lsls    r3, r3, #3
0006b674  adds    r3, r3, r0
0006b676  add     r1, pc ; -> 0x00071fe5  t_stance_wait_yes
0006b678  str     r1, [r3, #4]
0006b67a  ldr.w   r3, [r0, #0xa4]
0006b67e  adds    r3, #1
0006b680  str.w   r2, [r0, r3, lsl #3]
0006b684  mov     r0, r2
0006b686  bx      lr
0006b688  movw    r3, #0x1263
0006b68c  cmp     r2, r3
0006b68e  it      ne
0006b690  mvnne   r0, #2
0006b694  bne     #0x6b686
0006b696  ldr     r2, [pc, #0x20]
0006b698  lsls    r3, r1, #3
0006b69a  adds    r3, r3, r0
0006b69c  add     r2, pc ; -> 0x0006fa21  t_d_block
0006b69e  str     r2, [r3, #4]
0006b6a0  ldr.w   r3, [r0, #0xa4]
0006b6a4  movs    r2, #0
0006b6a6  adds    r3, #1
0006b6a8  str.w   r2, [r0, r3, lsl #3]
0006b6ac  mov     r0, r2
0006b6ae  b       #0x6b686
0006b6b0  adds    r0, #0xd7
0006b6b2  movs    r0, r0
0006b6b4  ldr     r3, [r5, #0x14]
0006b6b6  movs    r0, r0
0006b6b8  bics    r1, r0
0006b6ba  movs    r0, r0
