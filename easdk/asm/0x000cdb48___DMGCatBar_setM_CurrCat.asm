========================================================================
-[DMGCatBar setM_CurrCat  0x000cdb48  40 bytes   DMGCatBar.mm
========================================================================

000cdb48  push    {r7, lr}
000cdb4a  add     r7, sp, #0
000cdb4c  sub     sp, #8
000cdb4e  mov     r3, r2
000cdb50  ldr     r2, [pc, #0x18]
000cdb52  mov.w   ip, #0
000cdb56  add     r2, pc ; -> 0x000f9648  OBJC_IVAR_$_DMGCatBar.m_CurrCat
000cdb58  ldr     r2, [r2]
000cdb5a  str.w   ip, [sp]
000cdb5e  str.w   ip, [sp, #4]
000cdb62  blx     #0xddc20 ; -> objc_setProperty
000cdb66  sub.w   sp, r7, #0
000cdb6a  pop     {r7, pc}
000cdb6c  revsh   r6, r5
000cdb6e  movs    r2, r0
