========================================================================
-[EAMTX_Category setM_SelImgData  0x000cd04c  40 bytes   EAMTX_Category.mm
========================================================================

000cd04c  push    {r7, lr}
000cd04e  add     r7, sp, #0
000cd050  sub     sp, #8
000cd052  mov     r3, r2
000cd054  ldr     r2, [pc, #0x18]
000cd056  mov.w   ip, #0
000cd05a  add     r2, pc ; -> 0x000f9304  OBJC_IVAR_$_EAMTX_Category.m_SelImgData
000cd05c  ldr     r2, [r2]
000cd05e  str.w   ip, [sp]
000cd062  str.w   ip, [sp, #4]
000cd066  blx     #0xddc20 ; -> objc_setProperty
000cd06a  sub.w   sp, r7, #0
000cd06e  pop     {r7, pc}
000cd070  stm     r2!, {r1, r2, r5, r7}
000cd072  movs    r2, r0
