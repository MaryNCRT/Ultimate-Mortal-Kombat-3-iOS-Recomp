========================================================================
-[EAMTX_TransObserver init]  0x000c74d8  80 bytes   EAMTX_TransObserver.mm
========================================================================

000c74d8  push    {r7, lr}
000c74da  add     r7, sp, #0
000c74dc  sub     sp, #8
000c74de  ldr     r3, [pc, #0x34]
000c74e0  ldr     r1, [pc, #0x34]
000c74e2  str     r0, [sp]
000c74e4  add     r3, pc ; -> 0x000fdd98  
000c74e6  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000c74e8  ldr     r3, [r3]
000c74ea  ldr     r1, [r1]
000c74ec  mov     r0, sp
000c74ee  str     r3, [sp, #4]
000c74f0  blx     #0xddc08 ; -> objc_msgSendSuper2
000c74f4  ldr     r3, [pc, #0x24]
000c74f6  movs    r2, #0
000c74f8  add     r3, pc ; -> 0x000f7fd0  OBJC_IVAR_$_EAMTX_TransObserver.m_RestoreState
000c74fa  ldr     r3, [r3]
000c74fc  str     r2, [r0, r3]
000c74fe  ldr     r3, [pc, #0x20]
000c7500  add     r3, pc ; -> 0x000f7fd4  OBJC_IVAR_$_EAMTX_TransObserver.m_TransState
000c7502  ldr     r3, [r3]
000c7504  str     r2, [r0, r3]
000c7506  ldr     r3, [pc, #0x1c]
000c7508  add     r3, pc ; -> 0x000f7fd8  OBJC_IVAR_$_EAMTX_TransObserver.m_PurchaseState
000c750a  ldr     r3, [r3]
000c750c  str     r2, [r0, r3]
000c750e  sub.w   sp, r7, #0
000c7512  pop     {r7, pc}
000c7514  ldr     r0, [r6, #8]
000c7516  movs    r3, r0
000c7518  strb    r6, [r2, r2]
000c751a  movs    r3, r0
000c751c  lsrs    r4, r2, #0xb
000c751e  movs    r3, r0
000c7520  lsrs    r0, r2, #0xb
000c7522  movs    r3, r0
000c7524  lsrs    r4, r1, #0xb
000c7526  movs    r3, r0
