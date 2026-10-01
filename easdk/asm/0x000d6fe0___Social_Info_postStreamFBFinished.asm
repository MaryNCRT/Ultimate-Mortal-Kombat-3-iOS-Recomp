========================================================================
-[Social_Info postStreamFBFinished  0x000d6fe0  48 bytes   Social_Info.mm
========================================================================

000d6fe0  push    {r7, lr}
000d6fe2  add     r7, sp, #0
000d6fe4  sxtb    r2, r2
000d6fe6  mov     r1, r0
000d6fe8  cbz     r2, #0xd6ff8
000d6fea  ldr     r3, [pc, #0x1c]
000d6fec  movs    r2, #0
000d6fee  add     r3, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d6ff0  ldr     r0, [r3]
000d6ff2  ldr     r1, [r1, r0]
000d6ff4  movs    r0, #0x52
000d6ff6  b       #0xd7002
000d6ff8  ldr     r3, [pc, #0x10]
000d6ffa  add     r3, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d6ffc  ldr     r0, [r3]
000d6ffe  ldr     r1, [r1, r0]
000d7000  movs    r0, #0x53
000d7002  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000d7006  pop     {r7, pc}
