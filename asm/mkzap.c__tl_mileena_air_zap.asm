========================================================================
tl_mileena_air_zap  0x0007b730  276 bytes   mkzap.c
========================================================================

0007b730  push    {r4, r5, r7, lr}
0007b732  add     r7, sp, #8
0007b734  ldr.w   r1, [r0, #0xa4]
0007b738  movw    r2, #0x1e1
0007b73c  mov     r4, r0
0007b73e  adds    r3, r1, #1
0007b740  ldr.w   r5, [r0, #0x108]
0007b744  ldr.w   r3, [r0, r3, lsl #3]
0007b748  cmp     r3, r2
0007b74a  beq     #0x7b7ee
0007b74c  ble     #0x7b762
0007b74e  movw    r2, #0x1e7
0007b752  cmp     r3, r2
0007b754  beq     #0x7b810
0007b756  adds    r2, #2
0007b758  cmp     r3, r2
0007b75a  beq     #0x7b7d2
0007b75c  mvn     r0, #2
0007b760  pop     {r4, r5, r7, pc}
0007b762  cbz     r3, #0x7b79c
0007b764  cmp.w   r3, #0x1de
0007b768  bne     #0x7b75c
0007b76a  movs    r3, #3
0007b76c  str     r3, [r5, #0x1c]
0007b76e  ldr.w   r3, [r0, #0xa4]
0007b772  adds    r3, #1
0007b774  str.w   r2, [r0, r3, lsl #3]
0007b778  ldr.w   r3, [r0, #0xa4]
0007b77c  adds    r2, r3, #1
0007b77e  ldr     r3, [pc, #0xb4]
0007b780  str.w   r2, [r0, #0xa4]
0007b784  add     r3, pc ; -> 0x000f37cc  t_mframew
0007b786  ldr     r1, [r3]
0007b788  lsls    r3, r2, #3
0007b78a  adds    r3, r3, r4
0007b78c  movs    r0, #0
0007b78e  str     r1, [r3, #4]
0007b790  ldr.w   r3, [r4, #0xa4]
0007b794  adds    r3, #1
0007b796  str.w   r0, [r4, r3, lsl #3]
0007b79a  b       #0x7b760
0007b79c  str     r3, [r5, #0x44]
0007b79e  ldr     r3, [r5]
0007b7a0  movs    r2, #0x25
0007b7a2  mov     r0, r5
0007b7a4  str     r2, [r5, #0x20]
0007b7a6  str     r2, [r3, #0x18]
0007b7a8  bl      #0x7b2a4 ; -> zap_air_init_special
0007b7ac  mov     r0, r5
0007b7ae  movs    r3, #0x14
0007b7b0  str     r3, [r5, #0x40]
0007b7b2  bl      #0x55460 ; -> find_ani2_part2
0007b7b6  mov     r0, r5
0007b7b8  bl      #0x59e24 ; -> do_next_a9_frame
0007b7bc  ldr.w   r3, [r4, #0xa4]
0007b7c0  movs    r0, #5
0007b7c2  mov.w   r2, #0x1de
0007b7c6  adds    r3, #1
0007b7c8  str.w   r2, [r4, r3, lsl #3]
0007b7cc  str.w   r0, [r4, #0xfc]
0007b7d0  b       #0x7b760
0007b7d2  ldr.w   r3, [pc, #0x64]
0007b7d6  add     r3, pc ; -> 0x000f33d4  t_drop_down_land
0007b7d8  ldr     r2, [r3]
0007b7da  lsls    r3, r1, #3
0007b7dc  adds    r3, r3, r0
0007b7de  str     r2, [r3, #4]
0007b7e0  ldr.w   r3, [r0, #0xa4]
0007b7e4  movs    r0, #0
0007b7e6  adds    r3, #1
0007b7e8  str.w   r0, [r4, r3, lsl #3]
0007b7ec  b       #0x7b760
0007b7ee  ldr     r3, [pc, #0x4c]
0007b7f0  mov     r0, r5
0007b7f2  add     r3, pc ; -> 0x00074cbd  t_air_sai_proc
0007b7f4  str     r3, [r5, #0x38]
0007b7f6  bl      #0x75964 ; -> create_proj_proc
0007b7fa  ldr.w   r3, [r4, #0xa4]
0007b7fe  movs    r0, #5
0007b800  movw    r2, #0x1e7
0007b804  adds    r3, #1
0007b806  str.w   r2, [r4, r3, lsl #3]
0007b80a  str.w   r0, [r4, #0xfc]
0007b80e  b       #0x7b760
0007b810  movs    r3, #3
0007b812  str     r3, [r5, #0x1c]
0007b814  ldr.w   r3, [r0, #0xa4]
0007b818  movw    r2, #0x1e9
0007b81c  adds    r3, #1
0007b81e  str.w   r2, [r0, r3, lsl #3]
0007b822  ldr.w   r3, [r0, #0xa4]
0007b826  adds    r2, r3, #1
0007b828  ldr.w   r3, [pc, #0x14]
0007b82c  str.w   r2, [r0, #0xa4]
0007b830  add     r3, pc ; -> 0x000f37cc  t_mframew
0007b832  b       #0x7b786
0007b834  strh    r4, [r0, #2]
0007b836  movs    r7, r0
0007b838  ldrb    r2, [r7, #0xf]
0007b83a  movs    r7, r0
0007b83c  str     r4, [sp, #0x31c]
