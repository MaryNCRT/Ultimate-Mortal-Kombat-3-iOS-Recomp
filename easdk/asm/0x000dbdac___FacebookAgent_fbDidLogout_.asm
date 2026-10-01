========================================================================
-[FacebookAgent fbDidLogout]  0x000dbdac  96 bytes   FacebookAgent.mm
========================================================================

000dbdac  push    {r4, r5, r7, lr}
000dbdae  add     r7, sp, #8
000dbdb0  ldr     r4, [pc, #0x40]
000dbdb2  ldr     r1, [pc, #0x44]
000dbdb4  mov     r5, r0
000dbdb6  add     r4, pc ; -> 0x000fc8b4  OBJC_IVAR_$_FacebookAgent.fbButton
000dbdb8  add     r1, pc ; -> 0x000fd9c0  '\x04\x1c\x0f'
000dbdba  ldr     r3, [r4]
000dbdbc  ldr     r1, [r1]
000dbdbe  movs    r2, #0
000dbdc0  ldr     r0, [r0, r3]
000dbdc2  blx     #0xddbfc ; -> objc_msgSend
000dbdc6  ldr     r1, [pc, #0x34]
000dbdc8  ldr     r3, [r4]
000dbdca  add     r1, pc ; -> 0x000fcd68  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3f0
000dbdcc  ldr     r0, [r5, r3]
000dbdce  ldr     r1, [r1]
000dbdd0  blx     #0xddbfc ; -> objc_msgSend
000dbdd4  ldr     r3, [pc, #0x28]
000dbdd6  add     r3, pc ; -> 0x000fc8d0  OBJC_IVAR_$_FacebookAgent.bIgnoreCallback
000dbdd8  ldr     r3, [r3]
000dbdda  ldrsb   r3, [r5, r3]
000dbddc  cbnz    r3, #0xdbdf0
000dbdde  ldr     r3, [pc, #0x24]
000dbde0  ldr     r1, [pc, #0x24]
000dbde2  add     r3, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dbde4  add     r1, pc ; -> 0x000fd99c  
000dbde6  ldr     r0, [r3]
000dbde8  ldr     r1, [r1]
000dbdea  ldr     r0, [r5, r0]
000dbdec  blx     #0xddbfc ; -> objc_msgSend
000dbdf0  pop     {r4, r5, r7, pc}
000dbdf2  nop     
000dbdf4  lsrs    r2, r7, #0xb
000dbdf6  movs    r2, r0
000dbdf8  adds    r4, r0, #0
000dbdfa  movs    r2, r0
000dbdfc  lsrs    r2, r3, #0x1e
000dbdfe  movs    r2, r0
000dbe00  lsrs    r6, r6, #0xb
000dbe02  movs    r2, r0
000dbe04  lsrs    r2, r1, #0xb
000dbe06  movs    r2, r0
000dbe08  subs    r4, r6, r6
000dbe0a  movs    r2, r0
