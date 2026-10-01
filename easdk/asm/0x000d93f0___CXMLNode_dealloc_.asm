========================================================================
-[CXMLNode dealloc]  0x000d93f0  112 bytes   CXMLNode.m
========================================================================

000d93f0  push    {r4, r7, lr}
000d93f2  add     r7, sp, #4
000d93f4  sub     sp, #8
000d93f6  ldr     r3, [pc, #0x50]
000d93f8  mov     r4, r0
000d93fa  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d93fc  ldr     r3, [r3]
000d93fe  ldr     r3, [r0, r3]
000d9400  cbz     r3, #0xd942c
000d9402  ldr     r2, [r3]
000d9404  cmp     r2, r0
000d9406  bne     #0xd940c
000d9408  movs    r2, #0
000d940a  str     r2, [r3]
000d940c  ldr     r3, [pc, #0x3c]
000d940e  add     r3, pc ; -> 0x000fc02c  OBJC_IVAR_$_CXMLNode._freeNodeOnRelease
000d9410  ldr     r3, [r3]
000d9412  ldrsb   r3, [r4, r3]
000d9414  cbz     r3, #0xd9422
000d9416  ldr     r3, [pc, #0x38]
000d9418  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d941a  ldr     r3, [r3]
000d941c  ldr     r0, [r4, r3]
000d941e  blx     #0xdde84 ; -> xmlFreeNode
000d9422  ldr     r3, [pc, #0x30]
000d9424  movs    r2, #0
000d9426  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9428  ldr     r3, [r3]
000d942a  str     r2, [r4, r3]
000d942c  ldr     r3, [pc, #0x28]
000d942e  ldr     r1, [pc, #0x2c]
000d9430  mov     r0, sp
000d9432  add     r3, pc ; -> 0x000fddf8  
000d9434  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000d9436  ldr     r3, [r3]
000d9438  ldr     r1, [r1]
000d943a  str     r4, [sp]
000d943c  str     r3, [sp, #4]
000d943e  blx     #0xddc08 ; -> objc_msgSendSuper2
000d9442  sub.w   sp, r7, #4
000d9446  pop     {r4, r7, pc}
000d9448  cmp     r4, #0x2a
000d944a  movs    r2, r0
000d944c  cmp     r4, #0x1a
000d944e  movs    r2, r0
000d9450  cmp     r4, #0xc
000d9452  movs    r2, r0
000d9454  cmp     r3, #0xfe
000d9456  movs    r2, r0
000d9458  ldr     r1, [pc, #0x308]
000d945a  movs    r2, r0
000d945c  adds    r5, #0x68
000d945e  movs    r2, r0
