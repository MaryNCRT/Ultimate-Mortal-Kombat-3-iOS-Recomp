========================================================================
-[SocialUser picture]  0x000d890c  52 bytes   SocialUser.m
========================================================================

000d890c  push    {r7, lr}
000d890e  add     r7, sp, #0
000d8910  ldr     r3, [pc, #0x1c]
000d8912  add     r3, pc ; -> 0x000fbd80  OBJC_IVAR_$_SocialUser.picture
000d8914  ldr     r3, [r3]
000d8916  ldr     r0, [r0, r3]
000d8918  cbnz    r0, #0xd892e
000d891a  ldr     r0, [pc, #0x18]
000d891c  ldr     r1, [pc, #0x18]
000d891e  ldr     r2, [pc, #0x1c]
000d8920  add     r0, pc ; -> 0x000fdba8  
000d8922  add     r1, pc ; -> 0x000fccb8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x340
000d8924  ldr     r0, [r0]
000d8926  add     r2, pc ; -> 0x00181f74  
000d8928  ldr     r1, [r1]
000d892a  blx     #0xddbfc ; -> objc_msgSend
000d892e  pop     {r7, pc}
000d8930  adds    r4, #0x6a
000d8932  movs    r2, r0
000d8934  strh    r4, [r0, r2]
000d8936  movs    r2, r0
000d8938  bics    r2, r2
000d893a  movs    r2, r0
000d893c  str     r6, [sp, #0x128]
000d893e  movs    r2, r1
