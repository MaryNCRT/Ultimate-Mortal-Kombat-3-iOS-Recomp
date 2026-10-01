========================================================================
zero_turbo_bar  0x0003087c  72 bytes   joy.c
========================================================================

0003087c  push    {r4, r5, r7, lr}
0003087e  add     r7, sp, #8
00030880  ldr     r3, [pc, #0x38]
00030882  mov     r5, r0
00030884  add     r3, pc ; -> 0x00165650  bt_jump+0x2c
00030886  ldr     r3, [r3]
00030888  ldrh    r4, [r3, #0x18]
0003088a  sxth    r3, r4
0003088c  str     r3, [r0, #0x20]
0003088e  cbnz    r4, #0x308ba
00030890  bl      #0x2f3e4 ; -> turbo_bar_setup
00030894  ldr     r2, [r5, #0x34]
00030896  movs    r3, #0x28
00030898  str     r3, [r2]
0003089a  ldr     r3, [r5, #0x30]
0003089c  str     r4, [r5, #0x1c]
0003089e  ldr     r2, [pc, #0x20]
000308a0  str     r4, [r3]
000308a2  ldr     r0, [r5]
000308a4  add     r2, pc ; -> 0x0016564c  bt_jump+0x28
000308a6  ldr     r1, [r2]
000308a8  ldr     r3, [r0, #8]
000308aa  movs    r0, #3
000308ac  lsls    r2, r3, #2
000308ae  adds    r2, r2, r1
000308b0  movs    r1, #5
000308b2  ldr.w   r2, [r2, #0x378]
000308b6  bl      #0x31a28 ; -> MKEvent_Add
000308ba  pop     {r4, r5, r7, pc}
000308bc  ldr     r5, [pc, #0x320]
000308be  movs    r3, r2
000308c0  ldr     r5, [pc, #0x290]
000308c2  movs    r3, r2
