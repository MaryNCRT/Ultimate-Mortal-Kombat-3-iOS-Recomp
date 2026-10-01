========================================================================
t_boss_branch  0x0006c2cc  320 bytes   mkdrone.c
========================================================================

0006c2cc  push    {lr}
0006c2ce  ldr.w   r3, [r0, #0xa4]
0006c2d2  ldr.w   r1, [r0, #0x108]
0006c2d6  adds    r3, #1
0006c2d8  ldr.w   r2, [r0, r3, lsl #3]
0006c2dc  cbz     r2, #0x6c2e4
0006c2de  mvn     r0, #2
0006c2e2  pop     {pc}
0006c2e4  ldr     r3, [r1, #0x64]
0006c2e6  str     r3, [r1, #0x1c]
0006c2e8  ldr     r3, [r1, #8]
0006c2ea  ldr     r3, [r3, #0x24]
0006c2ec  cmp     r3, #0x18
0006c2ee  str     r3, [r1, #0x20]
0006c2f0  beq     #0x6c308
0006c2f2  cmp     r3, #0x19
0006c2f4  beq     #0x6c366
0006c2f6  ldr.w   r3, [r0, #0xa4]
0006c2fa  cmp     r3, #0
0006c2fc  ble     #0x6c3a2
0006c2fe  subs    r3, #1
0006c300  str.w   r3, [r0, #0xa4]
0006c304  mov     r0, r2
0006c306  b       #0x6c2e2
0006c308  ldr.w   r3, [r0, #0xa4]
0006c30c  cmp     r3, #0
0006c30e  ble     #0x6c3bc
0006c310  subs    r3, #1
0006c312  str.w   r3, [r0, #0xa4]
0006c316  ldr.w   ip, [r0, #0xa4]
0006c31a  add.w   r3, ip, #1
0006c31e  lsls    r2, r3, #3
0006c320  adds    r2, r2, r0
0006c322  ldr.w   lr, [r2, #4]
0006c326  adds    r2, r3, #1
0006c328  ldr.w   r2, [r0, r2, lsl #3]
0006c32c  str.w   r2, [r0, r3, lsl #3]
0006c330  lsl.w   r3, ip, #3
0006c334  adds    r3, r3, r0
0006c336  str.w   lr, [r3, #4]
0006c33a  ldr     r3, [pc, #0xbc]
0006c33c  add     r3, pc ; -> 0x000f3738  motaro_branches
0006c33e  ldr     r3, [r3]
0006c340  str     r3, [r1, #0x20]
0006c342  ldr     r2, [r1, #0x1c]
0006c344  ldr     r3, [r1, #0x20]
0006c346  ldr.w   r2, [r3, r2, lsl #2]
0006c34a  str     r2, [r1, #0x1c]
0006c34c  ldr.w   r3, [r0, #0xa4]
0006c350  lsls    r3, r3, #3
0006c352  adds    r3, r3, r0
0006c354  str     r2, [r3, #4]
0006c356  ldr.w   r3, [r0, #0xa4]
0006c35a  movs    r2, #0
0006c35c  adds    r3, #1
0006c35e  str.w   r2, [r0, r3, lsl #3]
0006c362  mov     r0, r2
0006c364  b       #0x6c2e2
0006c366  ldr.w   r3, [r0, #0xa4]
0006c36a  cmp     r3, #0
0006c36c  ble     #0x6c3da
0006c36e  subs    r3, #1
0006c370  str.w   r3, [r0, #0xa4]
0006c374  ldr.w   ip, [r0, #0xa4]
0006c378  add.w   r3, ip, #1
0006c37c  lsls    r2, r3, #3
0006c37e  adds    r2, r2, r0
0006c380  ldr.w   lr, [r2, #4]
0006c384  adds    r2, r3, #1
0006c386  ldr.w   r2, [r0, r2, lsl #3]
0006c38a  str.w   r2, [r0, r3, lsl #3]
0006c38e  lsl.w   r3, ip, #3
0006c392  adds    r3, r3, r0
0006c394  str.w   lr, [r3, #4]
0006c398  ldr     r3, [pc, #0x60]
0006c39a  add     r3, pc ; -> 0x000f3740  sk_branches
0006c39c  ldr     r3, [r3]
0006c39e  str     r3, [r1, #0x20]
0006c3a0  b       #0x6c342
0006c3a2  ldr     r1, [pc, #0x5c]
0006c3a4  lsls    r3, r3, #3
0006c3a6  adds    r3, r3, r0
0006c3a8  add     r1, pc ; -> 0x000f3708  t_local_reaction_exit
0006c3aa  ldr     r1, [r1]
0006c3ac  str     r1, [r3, #4]
0006c3ae  ldr.w   r3, [r0, #0xa4]
0006c3b2  adds    r3, #1
0006c3b4  str.w   r2, [r0, r3, lsl #3]
0006c3b8  mov     r0, r2
0006c3ba  b       #0x6c2e2
0006c3bc  ldr.w   ip, [pc, #0x44]
0006c3c0  lsls    r3, r3, #3
0006c3c2  adds    r3, r3, r0
0006c3c4  add     ip, pc ; -> 0x000f3708  t_local_reaction_exit
0006c3c6  ldr.w   ip, [ip]
0006c3ca  str.w   ip, [r3, #4]
0006c3ce  ldr.w   r3, [r0, #0xa4]
0006c3d2  adds    r3, #1
0006c3d4  str.w   r2, [r0, r3, lsl #3]
0006c3d8  b       #0x6c316
0006c3da  ldr.w   ip, [pc, #0x2c]
0006c3de  lsls    r3, r3, #3
0006c3e0  adds    r3, r3, r0
0006c3e2  add     ip, pc ; -> 0x000f3708  t_local_reaction_exit
0006c3e4  ldr.w   ip, [ip]
0006c3e8  str.w   ip, [r3, #4]
0006c3ec  ldr.w   r3, [r0, #0xa4]
0006c3f0  adds    r3, #1
0006c3f2  str.w   r2, [r0, r3, lsl #3]
0006c3f6  b       #0x6c374
0006c3f8  strb    r0, [r7, #0xf]
0006c3fa  movs    r0, r1
0006c3fc  strb    r2, [r4, #0xe]
0006c3fe  movs    r0, r1
0006c400  strb    r4, [r3, #0xd]
0006c402  movs    r0, r1
0006c404  strb    r0, [r0, #0xd]
0006c406  movs    r0, r1
0006c408  strb    r2, [r4, #0xc]
0006c40a  movs    r0, r1
