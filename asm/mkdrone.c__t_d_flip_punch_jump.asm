========================================================================
t_d_flip_punch_jump  0x00070ea0  136 bytes   mkdrone.c
========================================================================

00070ea0  push    {r4, r5, r6, r7, lr}
00070ea2  add     r7, sp, #0xc
00070ea4  ldr.w   r2, [r0, #0xa4]
00070ea8  mov     r4, r0
00070eaa  ldr.w   r6, [r0, #0x108]
00070eae  adds    r3, r2, #1
00070eb0  ldr.w   r5, [r0, r3, lsl #3]
00070eb4  cbnz    r5, #0x70ef2
00070eb6  mov     r0, r6
00070eb8  bl      #0x70cf8 ; -> frontflip_setup
00070ebc  ldr     r3, [pc, #0x5c]
00070ebe  movw    r2, #0x4c3
00070ec2  mov     r0, r5
00070ec4  add     r3, pc ; -> 0x00070485  t_flipp_scan
00070ec6  str     r3, [r6, #0x34]
00070ec8  ldr.w   r3, [r4, #0xa4]
00070ecc  adds    r3, #1
00070ece  str.w   r2, [r4, r3, lsl #3]
00070ed2  ldr.w   r3, [r4, #0xa4]
00070ed6  ldr     r2, [pc, #0x48]
00070ed8  adds    r3, #1
00070eda  str.w   r3, [r4, #0xa4]
00070ede  lsls    r3, r3, #3
00070ee0  adds    r3, r3, r4
00070ee2  add     r2, pc ; -> 0x00070e4d  t_d_fflip_scan_jsrp
00070ee4  str     r2, [r3, #4]
00070ee6  ldr.w   r3, [r4, #0xa4]
00070eea  adds    r3, #1
00070eec  str.w   r5, [r4, r3, lsl #3]
00070ef0  pop     {r4, r5, r6, r7, pc}
00070ef2  movw    r3, #0x4c3
00070ef6  cmp     r5, r3
00070ef8  it      ne
00070efa  mvnne   r0, #2
00070efe  bne     #0x70ef0
00070f00  ldr     r3, [pc, #0x20]
00070f02  movs    r0, #0
00070f04  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00070f06  ldr     r1, [r3]
00070f08  lsls    r3, r2, #3
00070f0a  adds    r3, r3, r4
00070f0c  str     r1, [r3, #4]
00070f0e  ldr.w   r3, [r4, #0xa4]
00070f12  adds    r3, #1
00070f14  str.w   r0, [r4, r3, lsl #3]
00070f18  b       #0x70ef0
00070f1a  nop     
00070f1c  bl      #0xffe2ef1e
