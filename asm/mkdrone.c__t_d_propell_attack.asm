========================================================================
t_d_propell_attack  0x00067ec4  84 bytes   mkdrone.c
========================================================================

00067ec4  ldr.w   r3, [r0, #0xa4]
00067ec8  ldr.w   r1, [r0, #0x108]
00067ecc  adds    r3, #1
00067ece  ldr.w   r2, [r0, r3, lsl #3]
00067ed2  cbz     r2, #0x67eda
00067ed4  mvn     r0, #2
00067ed8  bx      lr
00067eda  ldr     r3, [pc, #0x30]
00067edc  add     r3, pc ; -> 0x000f357c  G
00067ede  ldr     r3, [r3]
00067ee0  ldrsh.w r3, [r3, #0x44c]
00067ee4  cmp     r3, #2
00067ee6  str     r3, [r1, #0x1c]
00067ee8  ble     #0x67f06
00067eea  ldr     r1, [pc, #0x24]
00067eec  add     r1, pc ; -> 0x00067f19  t_d_propell_attack_now
00067eee  ldr.w   r3, [r0, #0xa4]
00067ef2  lsls    r3, r3, #3
00067ef4  adds    r3, r3, r0
00067ef6  str     r1, [r3, #4]
00067ef8  ldr.w   r3, [r0, #0xa4]
00067efc  adds    r3, #1
00067efe  str.w   r2, [r0, r3, lsl #3]
00067f02  mov     r0, r2
00067f04  b       #0x67ed8
00067f06  ldr     r1, [pc, #0xc]
00067f08  add     r1, pc ; -> 0x0006e7bd  t_diff_no_propell
00067f0a  b       #0x67eee
