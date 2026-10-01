========================================================================
tl_do_summon  0x0007a1b0  272 bytes   mkzap.c
========================================================================

0007a1b0  push    {r4, r5, r6, r7, lr}
0007a1b2  add     r7, sp, #0xc
0007a1b4  str     r8, [sp, #-0x4]!
0007a1b8  ldr.w   r3, [r0, #0xa4]
0007a1bc  movw    r8, #0xb87
0007a1c0  mov     r4, r0
0007a1c2  adds    r3, #1
0007a1c4  ldr.w   r6, [r0, #0x108]
0007a1c8  ldr.w   r5, [r0, r3, lsl #3]
0007a1cc  cmp     r5, r8
0007a1ce  beq     #0x7a250
0007a1d0  ble     #0x7a1ea
0007a1d2  cmp.w   r5, #0xb90
0007a1d6  beq     #0x7a29a
0007a1d8  movw    r3, #0xb91
0007a1dc  cmp     r5, r3
0007a1de  beq     #0x7a22e
0007a1e0  mvn     r0, #2
0007a1e4  ldr     r8, [sp], #4
0007a1e8  pop     {r4, r5, r6, r7, pc}
0007a1ea  cmp     r5, #0
0007a1ec  bne     #0x7a1e0
0007a1ee  movs    r3, #0xf
0007a1f0  mov     r0, r6
0007a1f2  str     r3, [r6, #0x20]
0007a1f4  str     r5, [r6, #0x44]
0007a1f6  bl      #0x79590 ; -> zap_init_special_act
0007a1fa  ldr     r3, [pc, #0xb0]
0007a1fc  mov     r0, r5
0007a1fe  str     r3, [r6, #0x40]
0007a200  ldr.w   r3, [r4, #0xa4]
0007a204  adds    r3, #1
0007a206  str.w   r8, [r4, r3, lsl #3]
0007a20a  ldr.w   r3, [r4, #0xa4]
0007a20e  adds    r2, r3, #1
0007a210  ldr.w   r3, [pc, #0x9c]
0007a214  str.w   r2, [r4, #0xa4]
0007a218  add     r3, pc ; -> 0x000f36c0  t_animate2_a9
0007a21a  ldr     r1, [r3]
0007a21c  lsls    r3, r2, #3
0007a21e  adds    r3, r3, r4
0007a220  str     r1, [r3, #4]
0007a222  ldr.w   r3, [r4, #0xa4]
0007a226  adds    r3, #1
0007a228  str.w   r5, [r4, r3, lsl #3]
0007a22c  b       #0x7a1e4
0007a22e  movs    r3, #2
0007a230  str     r3, [r6, #0x1c]
0007a232  ldr     r3, [pc, #0x80]
0007a234  add     r3, pc ; -> 0x000f37cc  t_mframew
0007a236  ldr     r2, [r3]
0007a238  ldr.w   r3, [r0, #0xa4]
0007a23c  lsls    r3, r3, #3
0007a23e  adds    r3, r3, r0
0007a240  str     r2, [r3, #4]
0007a242  ldr.w   r3, [r0, #0xa4]
0007a246  movs    r0, #0
0007a248  adds    r3, #1
0007a24a  str.w   r0, [r4, r3, lsl #3]
0007a24e  b       #0x7a1e4
0007a250  mov     r0, r6
0007a252  movs    r3, #1
0007a254  str     r3, [r6, #0x1c]
0007a256  bl      #0x57be4 ; -> ochar_sound
0007a25a  ldr     r1, [pc, #0x5c]
0007a25c  mov     r0, r6
0007a25e  add     r1, pc ; -> 0x00077935  t_master_summon_proc
0007a260  bl      #0x58a10 ; -> NewThread
0007a264  movs    r3, #3
0007a266  str     r3, [r6, #0x1c]
0007a268  ldr.w   r3, [r4, #0xa4]
0007a26c  mov.w   r2, #0xb90
0007a270  movs    r0, #0
0007a272  adds    r3, #1
0007a274  str.w   r2, [r4, r3, lsl #3]
0007a278  ldr.w   r3, [r4, #0xa4]
0007a27c  adds    r2, r3, #1
0007a27e  ldr     r3, [pc, #0x3c]
0007a280  str.w   r2, [r4, #0xa4]
0007a284  add     r3, pc ; -> 0x000f37cc  t_mframew
0007a286  ldr     r1, [r3]
0007a288  lsls    r3, r2, #3
0007a28a  adds    r3, r3, r4
0007a28c  str     r1, [r3, #4]
0007a28e  ldr.w   r3, [r4, #0xa4]
0007a292  adds    r3, #1
0007a294  str.w   r0, [r4, r3, lsl #3]
0007a298  b       #0x7a1e4
0007a29a  movw    r2, #0xb91
0007a29e  str.w   r2, [r0, r3, lsl #3]
0007a2a2  movs    r0, #0x10
0007a2a4  str.w   r0, [r4, #0xfc]
0007a2a8  b       #0x7a1e4
0007a2aa  nop     
0007a2ac  movs    r1, r3
0007a2ae  movs    r3, r0
0007a2b0  str     r4, [sp, #0x290]
0007a2b2  movs    r7, r0
0007a2b4  str     r5, [sp, #0x250]
0007a2b6  movs    r7, r0
0007a2b8  bvs     #0x7a262
