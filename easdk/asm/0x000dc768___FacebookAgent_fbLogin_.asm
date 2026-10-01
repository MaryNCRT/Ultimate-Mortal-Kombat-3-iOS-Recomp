========================================================================
-[FacebookAgent fbLogin]  0x000dc768  72 bytes   FacebookAgent.mm
========================================================================

000dc768  push    {r4, r5, r7, lr}
000dc76a  add     r7, sp, #8
000dc76c  ldr     r4, [pc, #0x30]
000dc76e  ldr     r1, [pc, #0x34]
000dc770  mov     r5, r0
000dc772  add     r4, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dc774  add     r1, pc ; -> 0x000fd9e0  
000dc776  ldr     r3, [r4]
000dc778  ldr     r1, [r1]
000dc77a  ldr     r0, [r0, r3]
000dc77c  blx     #0xddbfc ; -> objc_msgSend
000dc780  tst.w   r0, #0xff
000dc784  bne     #0xdc79e
000dc786  ldr     r3, [r4]
000dc788  ldr     r1, [pc, #0x1c]
000dc78a  ldr     r0, [r5, r3]
000dc78c  ldr     r3, [pc, #0x1c]
000dc78e  add     r1, pc ; -> 0x000fd9dc  
000dc790  add     r3, pc ; -> 0x000fc8bc  OBJC_IVAR_$_FacebookAgent.permissions
000dc792  ldr     r1, [r1]
000dc794  ldr     r3, [r3]
000dc796  ldr     r2, [r5, r3]
000dc798  mov     r3, r5
000dc79a  blx     #0xddbfc ; -> objc_msgSend
000dc79e  pop     {r4, r5, r7, pc}
000dc7a0  lsls    r2, r0, #5
000dc7a2  movs    r2, r0
000dc7a4  asrs    r0, r5, #9
000dc7a6  movs    r2, r0
000dc7a8  asrs    r2, r1, #9
000dc7aa  movs    r2, r0
000dc7ac  lsls    r0, r5, #4
000dc7ae  movs    r2, r0
