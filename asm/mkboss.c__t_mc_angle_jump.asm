========================================================================
t_mc_angle_jump  0x000ab6f8  128 bytes   mkboss.c
========================================================================

000ab6f8  push    {r4, r5, r6, r7, lr}
000ab6fa  add     r7, sp, #0xc
000ab6fc  ldr.w   r3, [r0, #0xa4]
000ab700  mov     r4, r0
000ab702  ldr.w   r5, [r0, #0x108]
000ab706  adds    r3, #1
000ab708  ldr.w   r6, [r0, r3, lsl #3]
000ab70c  cbnz    r6, #0xab736
000ab70e  mov     r0, r5
000ab710  bl      #0x70940 ; -> is_towards_me
000ab714  ldr     r3, [r5, #0x5c]
000ab716  cbnz    r3, #0xab73c
000ab718  ldr     r3, [pc, #0x4c]
000ab71a  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000ab71c  ldr     r2, [r3]
000ab71e  ldr.w   r3, [r4, #0xa4]
000ab722  mov     r0, r6
000ab724  lsls    r3, r3, #3
000ab726  adds    r3, r3, r4
000ab728  str     r2, [r3, #4]
000ab72a  ldr.w   r3, [r4, #0xa4]
000ab72e  adds    r3, #1
000ab730  str.w   r6, [r4, r3, lsl #3]
000ab734  b       #0xab73a
000ab736  mvn     r0, #2
000ab73a  pop     {r4, r5, r6, r7, pc}
000ab73c  mov     r0, r5
000ab73e  bl      #0xab6e8 ; -> motaro_easy_randper
000ab742  ldr     r3, [r5, #0x5c]
000ab744  cbnz    r3, #0xab74e
000ab746  ldr     r3, [pc, #0x24]
000ab748  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000ab74a  ldr     r2, [r3]
000ab74c  b       #0xab71e
000ab74e  mov     r0, r5
000ab750  bl      #0x2f3a0 ; -> get_x_dist
000ab754  ldr     r0, [r5, #0x28]
000ab756  cmp     r0, #0x80
000ab758  ble     #0xab762
000ab75a  ldr     r3, [pc, #0x14]
000ab75c  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000ab75e  ldr     r2, [r3]
000ab760  b       #0xab71e
000ab762  ldr     r2, [pc, #0x10]
000ab764  add     r2, pc ; -> 0x000aa051  t_motaro_punch
000ab766  b       #0xab71e
000ab768  ldrb    r2, [r1, #0x14]
000ab76a  movs    r4, r0
000ab76c  ldrb    r4, [r3, #0x13]
000ab76e  movs    r4, r0
000ab770  ldrb    r0, [r1, #0x13]
000ab772  movs    r4, r0
000ab774  strd    pc, pc, [sb], #0x3fc
