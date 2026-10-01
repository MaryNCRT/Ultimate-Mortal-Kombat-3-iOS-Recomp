========================================================================
-[Social_Info dialogWillDisappear]  0x000d6f54  28 bytes   Social_Info.mm
========================================================================

000d6f54  push    {r7, lr}
000d6f56  add     r7, sp, #0
000d6f58  ldr     r0, [pc, #0x10]
000d6f5a  add     r0, pc ; -> 0x00181ce4  
000d6f5c  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d6f60  movs    r1, #0
000d6f62  movs    r0, #0x41
000d6f64  mov     r2, r1
000d6f66  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000d6f6a  pop     {r7, pc}
000d6f6c  add     r5, sp, #0x218
000d6f6e  movs    r2, r1
