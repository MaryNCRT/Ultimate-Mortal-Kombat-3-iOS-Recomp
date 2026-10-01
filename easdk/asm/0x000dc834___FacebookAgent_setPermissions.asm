========================================================================
-[FacebookAgent setPermissions  0x000dc834  92 bytes   FacebookAgent.mm
========================================================================

000dc834  push    {r4, r5, r6, r7, lr}
000dc836  add     r7, sp, #0xc
000dc838  ldr     r3, [pc, #0x3c]
000dc83a  mov     r5, r0
000dc83c  mov     r6, r2
000dc83e  add     r3, pc ; -> 0x000fc8bc  OBJC_IVAR_$_FacebookAgent.permissions
000dc840  ldr     r0, [r3]
000dc842  ldr     r0, [r5, r0]
000dc844  cbz     r0, #0xdc850
000dc846  ldr     r1, [pc, #0x34]
000dc848  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000dc84a  ldr     r1, [r1]
000dc84c  blx     #0xddbfc ; -> objc_msgSend
000dc850  ldr     r0, [pc, #0x2c]
000dc852  ldr     r1, [pc, #0x30]
000dc854  ldr     r3, [pc, #0x30]
000dc856  add     r0, pc ; -> 0x000fdb70  
000dc858  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000dc85a  add     r3, pc ; -> 0x000fc8bc  OBJC_IVAR_$_FacebookAgent.permissions
000dc85c  ldr     r1, [r1]
000dc85e  ldr     r0, [r0]
000dc860  ldr     r4, [r3]
000dc862  blx     #0xddbfc ; -> objc_msgSend
000dc866  ldr     r1, [pc, #0x24]
000dc868  mov     r2, r6
000dc86a  add     r1, pc ; -> 0x000fd3bc  
000dc86c  ldr     r1, [r1]
000dc86e  blx     #0xddbfc ; -> objc_msgSend
000dc872  str     r0, [r5, r4]
000dc874  pop     {r4, r5, r6, r7, pc}
000dc876  nop     
000dc878  lsls    r2, r7, #1
000dc87a  movs    r2, r0
000dc87c  lsls    r0, r6, #4
000dc87e  movs    r2, r0
000dc880  asrs    r6, r2, #0xc
000dc882  movs    r2, r0
000dc884  lsls    r0, r5, #4
000dc886  movs    r2, r0
000dc888  lsls    r6, r3, #1
000dc88a  movs    r2, r0
000dc88c  lsrs    r6, r1, #0xd
000dc88e  movs    r2, r0
