========================================================================
-[Social_Info getLikeFinished  0x000d6e40  64 bytes   Social_Info.mm
========================================================================

000d6e40  push    {r4, r7, lr}
000d6e42  add     r7, sp, #4
000d6e44  sxtb    r3, r2
000d6e46  ldr     r2, [pc, #0x28]
000d6e48  add     r2, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d6e4a  ldr     r1, [r2]
000d6e4c  ldr     r2, [pc, #0x24]
000d6e4e  ldr     r4, [r0, r1]
000d6e50  ldr     r0, [pc, #0x24]
000d6e52  ldr     r1, [pc, #0x28]
000d6e54  add     r2, pc ; -> 0x0017e5c4  
000d6e56  add     r0, pc ; -> 0x000fdb5c  
000d6e58  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d6e5a  ldr     r0, [r0]
000d6e5c  ldr     r1, [r1]
000d6e5e  blx     #0xddbfc ; -> objc_msgSend
000d6e62  mov     r1, r4
000d6e64  mov     r2, r0
000d6e66  movs    r0, #0x5b
000d6e68  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000d6e6c  pop     {r4, r7, pc}
000d6e6e  nop     
000d6e70  ldr     r1, [pc, #0xa0]
000d6e72  movs    r2, r0
000d6e74  strb    r4, [r5, #0x1d]
000d6e76  movs    r2, r1
000d6e78  ldr     r2, [r0, #0x50]
000d6e7a  movs    r2, r0
000d6e7c  ldrb    r4, [r0, r1]
000d6e7e  movs    r2, r0
