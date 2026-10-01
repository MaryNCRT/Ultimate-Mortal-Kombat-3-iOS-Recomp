========================================================================
-[XMLElement addChild  0x0008af70  156 bytes   Mayhem.mm
========================================================================

0008af70  push    {r4, r5, r6, r7, lr}
0008af72  add     r7, sp, #0xc
0008af74  str     r8, [sp, #-0x4]!
0008af78  mov     r8, r3
0008af7a  ldr     r3, [pc, #0x6c]
0008af7c  ldr     r1, [pc, #0x6c]
0008af7e  mov     r5, r0
0008af80  add     r3, pc ; -> 0x000f6440  OBJC_IVAR_$_XMLElement.m_children
0008af82  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
0008af84  ldr     r3, [r3]
0008af86  ldr     r1, [r1]
0008af88  mov     r6, r2
0008af8a  ldr     r0, [r0, r3]
0008af8c  blx     #0xddbfc ; -> objc_msgSend
0008af90  cbz     r0, #0x8afca
0008af92  ldr     r1, [pc, #0x5c]
0008af94  mov     r2, r8
0008af96  mov     r4, r0
0008af98  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
0008af9a  ldr     r1, [r1]
0008af9c  blx     #0xddbfc ; -> objc_msgSend
0008afa0  ldr     r3, [pc, #0x50]
0008afa2  ldr     r1, [pc, #0x54]
0008afa4  mov     r2, r4
0008afa6  add     r3, pc ; -> 0x000f6440  OBJC_IVAR_$_XMLElement.m_children
0008afa8  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
0008afaa  ldr     r3, [r3]
0008afac  ldr     r1, [r1]
0008afae  ldr     r0, [r5, r3]
0008afb0  mov     r3, r6
0008afb2  blx     #0xddbfc ; -> objc_msgSend
0008afb6  ldr     r1, [pc, #0x44]
0008afb8  mov     r0, r8
0008afba  mov     r2, r5
0008afbc  add     r1, pc ; -> 0x000fcfe0  '\\S\x0e'
0008afbe  ldr     r1, [r1]
0008afc0  blx     #0xddbfc ; -> objc_msgSend
0008afc4  ldr     r8, [sp], #4
0008afc8  pop     {r4, r5, r6, r7, pc}
0008afca  ldr     r0, [pc, #0x34]
0008afcc  ldr     r1, [pc, #0x34]
0008afce  add     r0, pc ; -> 0x000fdb70  
0008afd0  add     r1, pc ; -> 0x000fcfe8  
0008afd2  ldr     r0, [r0]
0008afd4  ldr     r1, [r1]
0008afd6  blx     #0xddbfc ; -> objc_msgSend
0008afda  ldr     r1, [pc, #0x2c]
0008afdc  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0008afde  ldr     r1, [r1]
0008afe0  blx     #0xddbfc ; -> objc_msgSend
0008afe4  b       #0x8af92
0008afe6  nop     
0008afe8  push    {r2, r3, r4, r5, r7}
0008afea  movs    r6, r0
0008afec  subs    r6, r1, r5
0008afee  movs    r7, r0
0008aff0  subs    r0, r5, r3
0008aff2  movs    r7, r0
0008aff4  push    {r1, r2, r4, r7}
0008aff6  movs    r6, r0
0008aff8  subs    r4, r5, r4
0008affa  movs    r7, r0
0008affc  movs    r0, #0x20
0008affe  movs    r7, r0
0008b000  cmp     r3, #0x9e
0008b002  movs    r7, r0
0008b004  movs    r0, #0x14
0008b006  movs    r7, r0
0008b008  subs    r0, r7, r1
0008b00a  movs    r7, r0
