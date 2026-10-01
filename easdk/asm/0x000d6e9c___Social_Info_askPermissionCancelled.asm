========================================================================
-[Social_Info askPermissionCancelled  0x000d6e9c  64 bytes   Social_Info.mm
========================================================================

000d6e9c  push    {r4, r7, lr}
000d6e9e  add     r7, sp, #4
000d6ea0  mov     r3, r2
000d6ea2  ldr     r2, [pc, #0x28]
000d6ea4  add     r2, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d6ea6  ldr     r1, [r2]
000d6ea8  ldr     r2, [pc, #0x24]
000d6eaa  ldr     r4, [r0, r1]
000d6eac  ldr     r0, [pc, #0x24]
000d6eae  ldr     r1, [pc, #0x28]
000d6eb0  add     r2, pc ; -> 0x0017e5c4  
000d6eb2  add     r0, pc ; -> 0x000fdb5c  
000d6eb4  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d6eb6  ldr     r0, [r0]
000d6eb8  ldr     r1, [r1]
000d6eba  blx     #0xddbfc ; -> objc_msgSend
000d6ebe  mov     r1, r4
000d6ec0  mov     r2, r0
000d6ec2  movs    r0, #0x59
000d6ec4  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000d6ec8  pop     {r4, r7, pc}
000d6eca  nop     
000d6ecc  ldr     r0, [pc, #0x330]
000d6ece  movs    r2, r0
000d6ed0  strb    r0, [r2, #0x1c]
000d6ed2  movs    r2, r1
000d6ed4  ldr     r6, [r4, #0x48]
000d6ed6  movs    r2, r0
000d6ed8  ldrh    r0, [r5, r7]
000d6eda  movs    r2, r0
