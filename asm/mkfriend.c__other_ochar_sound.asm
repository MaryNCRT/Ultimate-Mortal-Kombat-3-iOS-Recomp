========================================================================
other_ochar_sound  0x000a5efc  24 bytes   mkfriend.c
========================================================================

000a5efc  push    {r4, r5, r7, lr}
000a5efe  add     r7, sp, #8
000a5f00  ldr     r2, [r0, #8]
000a5f02  ldr     r3, [r0, #0x20]
000a5f04  mov     r4, r0
000a5f06  ldr     r5, [r2, #0x24]
000a5f08  str     r3, [r2, #0x24]
000a5f0a  bl      #0x57be4 ; -> ochar_sound
000a5f0e  ldr     r0, [r4, #8]
000a5f10  str     r5, [r0, #0x24]
000a5f12  pop     {r4, r5, r7, pc}
