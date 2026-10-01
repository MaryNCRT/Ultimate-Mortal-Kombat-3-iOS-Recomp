========================================================================
-[EAMTX_Controller getNextRequestId]  0x000ca6cc  188 bytes   EAMTX_Controller.mm
========================================================================

000ca6cc  push    {r4, r5, r6, r7, lr}
000ca6ce  add     r7, sp, #0xc
000ca6d0  push.w  {r8, sl, fp}
000ca6d4  sub     sp, #0x14
000ca6d6  ldr     r1, [pc, #0x98]
000ca6d8  str     r0, [sp, #8]
000ca6da  ldr     r0, [pc, #0x98]
000ca6dc  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000ca6de  ldr     r3, [pc, #0x98]
000ca6e0  ldr     r1, [r1]
000ca6e2  add     r0, pc ; -> 0x000fdb5c  
000ca6e4  movs    r6, #0
000ca6e6  str     r3, [sp, #4]
000ca6e8  str     r1, [sp, #0xc]
000ca6ea  ldr     r1, [pc, #0x90]
000ca6ec  ldr     r3, [pc, #0x90]
000ca6ee  ldr.w   fp, [r0]
000ca6f2  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000ca6f4  ldr.w   sl, [r1]
000ca6f8  str     r3, [sp]
000ca6fa  ldr     r3, [sp, #4]
000ca6fc  ldr     r5, [sp]
000ca6fe  mov     r1, sl
000ca700  add     r3, pc
000ca702  add     r5, pc
000ca704  ldr     r0, [r3]
000ca706  mov     r8, r3
000ca708  ldr     r3, [sp, #8]
000ca70a  mov     r2, r5
000ca70c  ldr     r4, [r3, r0]
000ca70e  mov     r0, fp
000ca710  mov     r3, r6
000ca712  blx     #0xddbfc ; -> objc_msgSend
000ca716  ldr     r1, [sp, #0xc]
000ca718  mov     r2, r0
000ca71a  mov     r0, r4
000ca71c  blx     #0xddbfc ; -> objc_msgSend
000ca720  cbnz    r0, #0xca75c
000ca722  ldr     r3, [sp, #8]
000ca724  ldr.w   r0, [r8]
000ca728  ldr     r1, [pc, #0x58]
000ca72a  mov     r2, r5
000ca72c  ldr     r0, [r3, r0]
000ca72e  add     r1, pc ; -> 0x000fd5e0  
000ca730  mov     r3, r6
000ca732  ldr.w   r8, [r1]
000ca736  str     r0, [sp, #0x10]
000ca738  mov     r1, sl
000ca73a  mov     r0, fp
000ca73c  blx     #0xddbfc ; -> objc_msgSend
000ca740  mov     r1, sl
000ca742  mov     r2, r5
000ca744  mov     r3, r6
000ca746  mov     r4, r0
000ca748  mov     r0, fp
000ca74a  blx     #0xddbfc ; -> objc_msgSend
000ca74e  mov     r1, r8
000ca750  mov     r2, r4
000ca752  mov     r3, r0
000ca754  ldr     r0, [sp, #0x10]
000ca756  blx     #0xddbfc ; -> objc_msgSend
000ca75a  b       #0xca764
000ca75c  adds    r6, #1
000ca75e  cmp     r6, #0x64
000ca760  bne     #0xca6fa
000ca762  subs    r6, #0x64
000ca764  mov     r0, r6
000ca766  sub.w   sp, r7, #0x18
000ca76a  pop.w   {r8, sl, fp}
000ca76e  pop     {r4, r5, r6, r7, pc}
000ca770  movs    r4, #0x10
000ca772  movs    r3, r0
000ca774  adds    r4, #0x76
000ca776  movs    r3, r0
000ca778  b       #0xca1ac
000ca77a  movs    r2, r0
000ca77c  movs    r3, #0xaa
000ca77e  movs    r3, r0
000ca780  subs    r6, #0xbe
000ca782  movs    r3, r1
000ca784  cmp     r6, #0xae
000ca786  movs    r3, r0
