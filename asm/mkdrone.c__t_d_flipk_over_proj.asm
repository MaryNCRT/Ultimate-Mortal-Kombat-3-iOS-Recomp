========================================================================
t_d_flipk_over_proj  0x0006aac4  176 bytes   mkdrone.c
========================================================================

0006aac4  push    {lr}
0006aac6  ldr.w   ip, [r0, #0xa4]
0006aaca  movw    lr, #0x103c
0006aace  ldr.w   sb, [r0, #0x108]
0006aad2  add.w   r1, ip, #1
0006aad6  ldr.w   r2, [r0, r1, lsl #3]
0006aada  cmp     r2, lr
0006aadc  beq     #0x6ab32
0006aade  movw    r3, #0x103f
0006aae2  cmp     r2, r3
0006aae4  beq     #0x6ab14
0006aae6  cbz     r2, #0x6aaee
0006aae8  mvn     r0, #2
0006aaec  pop     {pc}
0006aaee  str.w   lr, [r0, r1, lsl #3]
0006aaf2  ldr.w   r3, [r0, #0xa4]
0006aaf6  ldr     r1, [pc, #0x6c]
0006aaf8  adds    r3, #1
0006aafa  str.w   r3, [r0, #0xa4]
0006aafe  lsls    r3, r3, #3
0006ab00  adds    r3, r3, r0
0006ab02  add     r1, pc ; -> 0x0006847d  t_stw_proj_proc
0006ab04  str     r1, [r3, #4]
0006ab06  ldr.w   r3, [r0, #0xa4]
0006ab0a  adds    r3, #1
0006ab0c  str.w   r2, [r0, r3, lsl #3]
0006ab10  mov     r0, r2
0006ab12  b       #0x6aaec
0006ab14  ldr.w   r2, [pc, #0x50]
0006ab18  lsl.w   r3, ip, #3
0006ab1c  add     r2, pc ; -> 0x00068745  t_d_fflip_kick_jump
0006ab1e  adds    r3, r3, r0
0006ab20  str     r2, [r3, #4]
0006ab22  ldr.w   r3, [r0, #0xa4]
0006ab26  movs    r2, #0
0006ab28  adds    r3, #1
0006ab2a  str.w   r2, [r0, r3, lsl #3]
0006ab2e  mov     r0, r2
0006ab30  b       #0x6aaec
0006ab32  ldr     r3, [pc, #0x38]
0006ab34  movw    r2, #0x103f
0006ab38  add     r3, pc ; -> 0x0006ff81  q_proj_jclose
0006ab3a  str.w   r3, [sb, #0x48]
0006ab3e  movs    r3, #0x20
0006ab40  str.w   r3, [sb, #0x44]
0006ab44  ldr.w   r3, [r0, #0xa4]
0006ab48  adds    r3, #1
0006ab4a  str.w   r2, [r0, r3, lsl #3]
0006ab4e  ldr.w   r3, [r0, #0xa4]
0006ab52  ldr.w   r2, [pc, #0x1c]
0006ab56  adds    r3, #1
0006ab58  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
0006ab5a  str.w   r3, [r0, #0xa4]
0006ab5e  lsls    r3, r3, #3
0006ab60  b       #0x6ab1e
0006ab62  nop     
0006ab64  bls     #0x6ac56
0006ab66  vdup.8  d29, d21[7]
