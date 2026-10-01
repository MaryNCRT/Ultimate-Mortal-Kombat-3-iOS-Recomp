========================================================================
EASOC_FBGetFriendsNum  0x0007f838  20 bytes   EASDK_Handler.mm
========================================================================

0007f838  ldr     r3, [pc, #0xc]
0007f83a  add     r3, pc ; -> 0x00379bbc  friendsList
0007f83c  ldr     r0, [r3, #4]
0007f83e  ldr     r3, [r3]
0007f840  subs    r0, r0, r3
0007f842  asrs    r0, r0, #3
0007f844  bx      lr
0007f846  nop     
0007f848  adr     r3, #0x1f8
0007f84a  movs    r7, r5
