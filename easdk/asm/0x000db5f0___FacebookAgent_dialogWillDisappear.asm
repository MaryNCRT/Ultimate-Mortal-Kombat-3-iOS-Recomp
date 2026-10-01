========================================================================
-[FacebookAgent dialogWillDisappear  0x000db5f0  64 bytes   FacebookAgent.mm
========================================================================

000db5f0  push    {r4, r5, r6, r7, lr}
000db5f2  add     r7, sp, #0xc
000db5f4  ldr     r1, [pc, #0x2c]
000db5f6  ldr     r4, [pc, #0x30]
000db5f8  mov     r6, r0
000db5fa  add     r1, pc ; -> 0x000fccec  '\x164\x0e'
000db5fc  add     r4, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000db5fe  ldr     r5, [r1]
000db600  ldr     r1, [pc, #0x28]
000db602  ldr     r3, [r4]
000db604  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000db606  mov     r2, r5
000db608  ldr     r0, [r0, r3]
000db60a  ldr     r1, [r1]
000db60c  blx     #0xddbfc ; -> objc_msgSend
000db610  tst.w   r0, #0xff
000db614  beq     #0xdb620
000db616  ldr     r0, [r4]
000db618  mov     r1, r5
000db61a  ldr     r0, [r6, r0]
000db61c  blx     #0xddbfc ; -> objc_msgSend
000db620  pop     {r4, r5, r6, r7, pc}
000db622  nop     
000db624  asrs    r6, r5, #0x1b
000db626  movs    r2, r0
000db628  asrs    r0, r6, #0xa
000db62a  movs    r2, r0
000db62c  asrs    r0, r1, #0x1a
000db62e  movs    r2, r0
