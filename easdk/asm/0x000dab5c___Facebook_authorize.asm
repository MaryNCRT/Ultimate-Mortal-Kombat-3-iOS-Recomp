========================================================================
-[Facebook authorize  0x000dab5c  100 bytes   Facebook.m
========================================================================

000dab5c  push    {r4, r5, r6, r7, lr}
000dab5e  add     r7, sp, #0xc
000dab60  str     r8, [sp, #-0x4]!
000dab64  ldr     r4, [pc, #0x44]
000dab66  ldr     r1, [pc, #0x48]
000dab68  mov     r8, r3
000dab6a  add     r4, pc ; -> 0x000fc520  OBJC_IVAR_$_Facebook._permissions
000dab6c  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000dab6e  ldr     r3, [r4]
000dab70  mov     r5, r0
000dab72  ldr     r1, [r1]
000dab74  mov     r6, r2
000dab76  ldr     r0, [r0, r3]
000dab78  blx     #0xddbfc ; -> objc_msgSend
000dab7c  ldr     r1, [pc, #0x34]
000dab7e  mov     r0, r6
000dab80  ldr     r4, [r4]
000dab82  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000dab84  ldr     r1, [r1]
000dab86  blx     #0xddbfc ; -> objc_msgSend
000dab8a  ldr     r3, [pc, #0x2c]
000dab8c  ldr     r1, [pc, #0x2c]
000dab8e  movs    r2, #1
000dab90  add     r3, pc ; -> 0x000fc50c  OBJC_IVAR_$_Facebook._sessionDelegate
000dab92  add     r1, pc ; -> 0x000fdae0  
000dab94  ldr     r1, [r1]
000dab96  str     r0, [r5, r4]
000dab98  ldr     r3, [r3]
000dab9a  mov     r0, r5
000dab9c  str.w   r8, [r5, r3]
000daba0  mov     r3, r2
000daba2  blx     #0xddbfc ; -> objc_msgSend
000daba6  ldr     r8, [sp], #4
000dabaa  pop     {r4, r5, r6, r7, pc}
000dabac  adds    r2, r6, r6
000dabae  movs    r2, r0
000dabb0  subs    r4, r1, #0
000dabb2  movs    r2, r0
000dabb4  movs    r1, #0x4a
000dabb6  movs    r2, r0
000dabb8  adds    r0, r7, r5
000dabba  movs    r2, r0
000dabbc  cmp     r7, #0x4a
000dabbe  movs    r2, r0
