========================================================================
tl_do_tusk_floor  0x0007b190  276 bytes   mkzap.c
========================================================================

0007b190  push    {r4, r5, r6, r7, lr}
0007b192  add     r7, sp, #0xc
0007b194  push.w  {r8, sl}
0007b198  ldr.w   r3, [r0, #0xa4]
0007b19c  movw    r8, #0x769
0007b1a0  mov     r4, r0
0007b1a2  adds    r3, #1
0007b1a4  ldr.w   r5, [r0, #0x108]
0007b1a8  ldr.w   r6, [r0, r3, lsl #3]
0007b1ac  cmp     r6, r8
0007b1ae  beq     #0x7b238
0007b1b0  ble     #0x7b1ca
0007b1b2  movw    r3, #0x76b
0007b1b6  cmp     r6, r3
0007b1b8  beq     #0x7b248
0007b1ba  cmp.w   r6, #0x790
0007b1be  beq     #0x7b216
0007b1c0  mvn     r0, #2
0007b1c4  pop.w   {r8, sl}
0007b1c8  pop     {r4, r5, r6, r7, pc}
0007b1ca  cmp     r6, #0
0007b1cc  bne     #0x7b1c0
0007b1ce  mov     r0, r5
0007b1d0  movs    r3, #0x1c
0007b1d2  str     r3, [r5, #0x20]
0007b1d4  bl      #0x587e0 ; -> init_special_act
0007b1d8  mov     r0, r5
0007b1da  movs    r3, #6
0007b1dc  str     r3, [r5, #0x1c]
0007b1de  bl      #0x57be4 ; -> ochar_sound
0007b1e2  ldr     r3, [pc, #0xb0]
0007b1e4  mov     r0, r6
0007b1e6  str     r3, [r5, #0x40]
0007b1e8  ldr.w   r3, [r4, #0xa4]
0007b1ec  adds    r3, #1
0007b1ee  str.w   r8, [r4, r3, lsl #3]
0007b1f2  ldr.w   r3, [r4, #0xa4]
0007b1f6  adds    r2, r3, #1
0007b1f8  ldr.w   r3, [pc, #0x9c]
0007b1fc  str.w   r2, [r4, #0xa4]
0007b200  add     r3, pc ; -> 0x000f36c0  t_animate2_a9
0007b202  ldr     r1, [r3]
0007b204  lsls    r3, r2, #3
0007b206  adds    r3, r3, r4
0007b208  str     r1, [r3, #4]
0007b20a  ldr.w   r3, [r4, #0xa4]
0007b20e  adds    r3, #1
0007b210  str.w   r6, [r4, r3, lsl #3]
0007b214  b       #0x7b1c4
0007b216  movs    r3, #3
0007b218  str     r3, [r5, #0x1c]
0007b21a  ldr     r3, [pc, #0x80]
0007b21c  add     r3, pc ; -> 0x000f37cc  t_mframew
0007b21e  ldr     r2, [r3]
0007b220  ldr.w   r3, [r0, #0xa4]
0007b224  lsls    r3, r3, #3
0007b226  adds    r3, r3, r0
0007b228  str     r2, [r3, #4]
0007b22a  ldr.w   r3, [r0, #0xa4]
0007b22e  movs    r0, #0
0007b230  adds    r3, #1
0007b232  str.w   r0, [r4, r3, lsl #3]
0007b236  b       #0x7b1c4
0007b238  movw    r2, #0x76b
0007b23c  str.w   r2, [r0, r3, lsl #3]
0007b240  movs    r0, #8
0007b242  str.w   r0, [r4, #0xfc]
0007b246  b       #0x7b1c4
0007b248  ldr     r3, [r5]
0007b24a  ldr.w   r8, [r5, #0x40]
0007b24e  movs    r2, #0
0007b250  mov     r0, r5
0007b252  ldr     r6, [r3, #0x68]
0007b254  ldr.w   sl, [r3, #0x64]
0007b258  str     r2, [r3, #0x68]
0007b25a  ldr     r3, [r5]
0007b25c  str     r2, [r3, #0x64]
0007b25e  ldr     r3, [pc, #0x40]
0007b260  add     r3, pc ; -> 0x00077f7d  t_blade_proc
0007b262  str     r3, [r5, #0x38]
0007b264  bl      #0x75964 ; -> create_proj_proc
0007b268  ldr     r3, [r5]
0007b26a  mov.w   r2, #0x790
0007b26e  ldr     r0, [r0]
0007b270  str     r3, [r0, #0x28]
0007b272  ldr     r3, [r5]
0007b274  movs    r0, #0x18
0007b276  str     r6, [r3, #0x68]
0007b278  ldr     r3, [r5]
0007b27a  str.w   sl, [r3, #0x64]
0007b27e  str.w   r8, [r5, #0x40]
0007b282  ldr.w   r3, [r4, #0xa4]
0007b286  adds    r3, #1
0007b288  str.w   r2, [r4, r3, lsl #3]
0007b28c  str.w   r0, [r4, #0xfc]
0007b290  b       #0x7b1c4
0007b292  nop     
0007b294  movs    r3, r0
0007b296  movs    r4, r0
0007b298  strh    r4, [r7, #0x24]
0007b29a  movs    r7, r0
0007b29c  strh    r4, [r5, #0x2c]
0007b29e  movs    r7, r0
0007b2a0  ldm     r5!, {r0, r3, r4}
