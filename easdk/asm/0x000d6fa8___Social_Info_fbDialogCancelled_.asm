========================================================================
-[Social_Info fbDialogCancelled]  0x000d6fa8  28 bytes   Social_Info.mm
========================================================================

000d6fa8  push    {r7, lr}
000d6faa  add     r7, sp, #0
000d6fac  ldr     r0, [pc, #0x10]
000d6fae  add     r0, pc ; -> 0x00181d14  
000d6fb0  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d6fb4  movs    r1, #0
000d6fb6  movs    r0, #0x3e
000d6fb8  mov     r2, r1
000d6fba  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000d6fbe  pop     {r7, pc}
000d6fc0  add     r5, sp, #0x188
000d6fc2  movs    r2, r1
