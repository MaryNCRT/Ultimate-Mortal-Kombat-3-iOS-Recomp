========================================================================
camp_fire_sound  0x000a5d8c  16 bytes   mkfriend.c
========================================================================

000a5d8c  push    {r7, lr}
000a5d8e  add     r7, sp, #0
000a5d90  movs    r3, #0xa
000a5d92  str     r3, [r0, #0x1c]
000a5d94  bl      #0x57be4 ; -> ochar_sound
000a5d98  pop     {r7, pc}
000a5d9a  nop     
