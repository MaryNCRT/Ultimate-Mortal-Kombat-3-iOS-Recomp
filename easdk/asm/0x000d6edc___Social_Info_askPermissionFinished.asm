========================================================================
-[Social_Info askPermissionFinished  0x000d6edc  120 bytes   Social_Info.mm
========================================================================

000d6edc  push    {r4, r7, lr}
000d6ede  add     r7, sp, #4
000d6ee0  tst.w   r2, #0xff
000d6ee4  mov     r1, r0
000d6ee6  beq     #0xd6f0a
000d6ee8  ldr     r2, [pc, #0x48]
000d6eea  add     r2, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d6eec  ldr     r0, [r2]
000d6eee  ldr     r2, [pc, #0x48]
000d6ef0  ldr     r4, [r1, r0]
000d6ef2  ldr     r0, [pc, #0x48]
000d6ef4  ldr     r1, [pc, #0x48]
000d6ef6  add     r2, pc ; -> 0x0017e5c4  
000d6ef8  add     r0, pc ; -> 0x000fdb5c  
000d6efa  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d6efc  ldr     r0, [r0]
000d6efe  ldr     r1, [r1]
000d6f00  blx     #0xddbfc ; -> objc_msgSend
000d6f04  mov     r2, r0
000d6f06  movs    r0, #0x57
000d6f08  b       #0xd6f2a
000d6f0a  ldr     r2, [pc, #0x38]
000d6f0c  add     r2, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d6f0e  ldr     r0, [r2]
000d6f10  ldr     r2, [pc, #0x34]
000d6f12  ldr     r4, [r1, r0]
000d6f14  ldr     r0, [pc, #0x34]
000d6f16  ldr     r1, [pc, #0x38]
000d6f18  add     r2, pc ; -> 0x0017e5c4  
000d6f1a  add     r0, pc ; -> 0x000fdb5c  
000d6f1c  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d6f1e  ldr     r0, [r0]
000d6f20  ldr     r1, [r1]
000d6f22  blx     #0xddbfc ; -> objc_msgSend
000d6f26  mov     r2, r0
000d6f28  movs    r0, #0x58
000d6f2a  mov     r1, r4
000d6f2c  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000d6f30  pop     {r4, r7, pc}
000d6f32  nop     
000d6f34  ldr     r0, [pc, #0x218]
000d6f36  movs    r2, r0
000d6f38  strb    r2, [r1, #0x1b]
000d6f3a  movs    r2, r1
000d6f3c  ldr     r0, [r4, #0x44]
000d6f3e  movs    r2, r0
000d6f40  ldrh    r2, [r4, r6]
000d6f42  movs    r2, r0
000d6f44  ldr     r0, [pc, #0x190]
000d6f46  movs    r2, r0
000d6f48  strb    r0, [r5, #0x1a]
000d6f4a  movs    r2, r1
000d6f4c  ldr     r6, [r7, #0x40]
000d6f4e  movs    r2, r0
000d6f50  ldrh    r0, [r0, r6]
000d6f52  movs    r2, r0
