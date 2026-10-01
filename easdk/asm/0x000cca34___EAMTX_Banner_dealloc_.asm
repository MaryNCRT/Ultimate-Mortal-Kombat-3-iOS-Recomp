========================================================================
-[EAMTX_Banner dealloc]  0x000cca34  128 bytes   EAMTX_Banner.mm
========================================================================

000cca34  push    {r4, r5, r7, lr}
000cca36  add     r7, sp, #8
000cca38  sub     sp, #8
000cca3a  ldr     r3, [pc, #0x5c]
000cca3c  ldr     r1, [pc, #0x5c]
000cca3e  mov     r5, r0
000cca40  add     r3, pc ; -> 0x000f915c  OBJC_IVAR_$_EAMTX_Banner.m_Title
000cca42  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cca44  ldr     r3, [r3]
000cca46  ldr     r4, [r1]
000cca48  ldr     r0, [r0, r3]
000cca4a  mov     r1, r4
000cca4c  blx     #0xddbfc ; -> objc_msgSend
000cca50  ldr     r3, [pc, #0x4c]
000cca52  mov     r1, r4
000cca54  add     r3, pc ; -> 0x000f9160  OBJC_IVAR_$_EAMTX_Banner.m_URL
000cca56  ldr     r3, [r3]
000cca58  ldr     r0, [r5, r3]
000cca5a  blx     #0xddbfc ; -> objc_msgSend
000cca5e  ldr     r3, [pc, #0x44]
000cca60  mov     r1, r4
000cca62  add     r3, pc ; -> 0x000f9164  OBJC_IVAR_$_EAMTX_Banner.m_ImgData
000cca64  ldr     r3, [r3]
000cca66  ldr     r0, [r5, r3]
000cca68  blx     #0xddbfc ; -> objc_msgSend
000cca6c  ldr     r3, [pc, #0x38]
000cca6e  mov     r1, r4
000cca70  add     r3, pc ; -> 0x000f9168  OBJC_IVAR_$_EAMTX_Banner.m_Type
000cca72  ldr     r3, [r3]
000cca74  ldr     r0, [r5, r3]
000cca76  blx     #0xddbfc ; -> objc_msgSend
000cca7a  ldr     r3, [pc, #0x30]
000cca7c  ldr     r1, [pc, #0x30]
000cca7e  mov     r0, sp
000cca80  add     r3, pc ; -> 0x000fdda8  
000cca82  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000cca84  ldr     r3, [r3]
000cca86  ldr     r1, [r1]
000cca88  str     r5, [sp]
000cca8a  str     r3, [sp, #4]
000cca8c  blx     #0xddc08 ; -> objc_msgSendSuper2
000cca90  sub.w   sp, r7, #8
000cca94  pop     {r4, r5, r7, pc}
000cca96  nop     
000cca98  stm     r7!, {r3, r4}
000cca9a  movs    r2, r0
