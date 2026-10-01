========================================================================
-[FBLoginButton session]  0x000846dc  16 bytes   FBLoginButton.m
========================================================================

000846dc  ldr     r3, [pc, #8]
000846de  add     r3, pc ; -> 0x000f53e8  OBJC_IVAR_$_FBLoginButton._session
000846e0  ldr     r3, [r3]
000846e2  ldr     r0, [r0, r3]
000846e4  bx      lr
000846e6  nop     
000846e8  lsrs    r6, r0, #0x14
000846ea  movs    r7, r0
