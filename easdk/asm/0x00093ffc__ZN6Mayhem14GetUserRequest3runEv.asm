========================================================================
ZN6Mayhem14GetUserRequest3runEv  0x00093ffc  24 bytes   Mayhem.mm
========================================================================

00093ffc  push    {r7, lr}
00093ffe  add     r7, sp, #0
00094000  ldr     r3, [r0, #0x58]
00094002  ldr     r3, [r3, #-0xc]
00094006  cbnz    r3, #0x9400e
00094008  bl      #0x9399c ; -> ZN6Mayhem14GetUserRequest15RequestIndirectEv
0009400c  pop     {r7, pc}
0009400e  bl      #0x93540 ; -> ZN6Mayhem14GetUserRequest13RequestDirectEv
00094012  b       #0x9400c
