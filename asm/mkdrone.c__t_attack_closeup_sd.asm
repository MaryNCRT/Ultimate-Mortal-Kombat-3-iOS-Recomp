========================================================================
t_attack_closeup_sd  0x0006aedc  68 bytes   mkdrone.c
========================================================================

0006aedc  ldr.w   r3, [r0, #0xa4]
0006aee0  ldr.w   ip, [r0, #0x108]
0006aee4  adds    r3, #1
0006aee6  ldr.w   r1, [r0, r3, lsl #3]
0006aeea  cbz     r1, #0x6aef2
0006aeec  mvn     r0, #2
0006aef0  bx      lr
0006aef2  ldr.w   r3, [ip, #8]
0006aef6  ldr     r2, [pc, #0x24]
0006aef8  ldr     r3, [r3, #0x24]
0006aefa  add     r2, pc ; -> 0x00171e5c  tab_react_flipk
0006aefc  ldr.w   r2, [r2, r3, lsl #2]
0006af00  str.w   r2, [ip, #0x1c]
0006af04  ldr.w   r3, [r0, #0xa4]
0006af08  lsls    r3, r3, #3
0006af0a  adds    r3, r3, r0
0006af0c  str     r2, [r3, #4]
0006af0e  ldr.w   r3, [r0, #0xa4]
0006af12  adds    r3, #1
0006af14  str.w   r1, [r0, r3, lsl #3]
0006af18  mov     r0, r1
0006af1a  b       #0x6aef0
0006af1c  ldr     r6, [r3, #0x74]
0006af1e  movs    r0, r2
