========================================================================
-[Social_Info fbTokenExpired]  0x000d6e80  28 bytes   Social_Info.mm
========================================================================

000d6e80  push    {r7, lr}
000d6e82  add     r7, sp, #0
000d6e84  ldr     r0, [pc, #0x10]
000d6e86  add     r0, pc ; -> 0x00181cd4  
000d6e88  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d6e8c  movs    r1, #0
000d6e8e  movs    r0, #0x5a
000d6e90  mov     r2, r1
000d6e92  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000d6e96  pop     {r7, pc}
000d6e98  add     r6, sp, #0x128
000d6e9a  movs    r2, r1
