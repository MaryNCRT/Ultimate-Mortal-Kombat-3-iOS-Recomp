========================================================================
-[Social_Info dialogWillAppear]  0x000d6f70  28 bytes   Social_Info.mm
========================================================================

000d6f70  push    {r7, lr}
000d6f72  add     r7, sp, #0
000d6f74  ldr     r0, [pc, #0x10]
000d6f76  add     r0, pc ; -> 0x00181cf4  
000d6f78  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d6f7c  movs    r1, #0
000d6f7e  movs    r0, #0x40
000d6f80  mov     r2, r1
000d6f82  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000d6f86  pop     {r7, pc}
000d6f88  add     r5, sp, #0x1e8
000d6f8a  movs    r2, r1
