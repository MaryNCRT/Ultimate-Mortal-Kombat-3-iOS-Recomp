========================================================================
-[FacebookAgent getPermission  0x000db4e4  32 bytes   FacebookAgent.mm
========================================================================

000db4e4  cmp     r2, #1
000db4e6  mov     r1, r0
000db4e8  bne     #0xdb4f0
000db4ea  ldr     r3, [pc, #0x10]
000db4ec  add     r3, pc ; -> 0x000fc8c4  OBJC_IVAR_$_FacebookAgent.hasOfflinePermission
000db4ee  b       #0xdb4f4
000db4f0  ldr     r3, [pc, #0xc]
000db4f2  add     r3, pc ; -> 0x000fc8c0  OBJC_IVAR_$_FacebookAgent.hasPublishPermission
000db4f4  ldr     r0, [r3]
000db4f6  ldrsb   r0, [r1, r0]
000db4f8  bx      lr
000db4fa  nop     
000db4fc  asrs    r4, r2, #0xf
000db4fe  movs    r2, r0
000db500  asrs    r2, r1, #0xf
000db502  movs    r2, r0
