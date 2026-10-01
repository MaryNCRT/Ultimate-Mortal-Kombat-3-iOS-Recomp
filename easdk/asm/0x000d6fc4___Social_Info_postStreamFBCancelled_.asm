========================================================================
-[Social_Info postStreamFBCancelled]  0x000d6fc4  28 bytes   Social_Info.mm
========================================================================

000d6fc4  push    {r7, lr}
000d6fc6  add     r7, sp, #0
000d6fc8  ldr     r3, [pc, #0x10]
000d6fca  movs    r2, #0
000d6fcc  add     r3, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d6fce  ldr     r3, [r3]
000d6fd0  ldr     r1, [r0, r3]
000d6fd2  movs    r0, #0x54
000d6fd4  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000d6fd8  pop     {r7, pc}
000d6fda  nop     
000d6fdc  blxns   r4
000d6fde  movs    r2, r0
