========================================================================
-[Social_Info fbDialogFailed]  0x000d6f8c  28 bytes   Social_Info.mm
========================================================================

000d6f8c  push    {r7, lr}
000d6f8e  add     r7, sp, #0
000d6f90  ldr     r0, [pc, #0x10]
000d6f92  add     r0, pc ; -> 0x00181d04  
000d6f94  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d6f98  movs    r1, #0
000d6f9a  movs    r0, #0x3f
000d6f9c  mov     r2, r1
000d6f9e  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000d6fa2  pop     {r7, pc}
000d6fa4  add     r5, sp, #0x1b8
000d6fa6  movs    r2, r1
