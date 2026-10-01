========================================================================
-[Social_Info setTemplateId  0x000d8094  44 bytes   Social_Info.mm
========================================================================

000d8094  push    {r7, lr}
000d8096  add     r7, sp, #0
000d8098  sub     sp, #8
000d809a  mov     r3, r2
000d809c  ldr     r2, [pc, #0x1c]
000d809e  mov.w   ip, #0
000d80a2  add     r2, pc ; -> 0x000faec4  OBJC_IVAR_$_Social_Info.templateId
000d80a4  ldr     r2, [r2]
000d80a6  str.w   ip, [sp]
000d80aa  add.w   ip, ip, #1
000d80ae  str.w   ip, [sp, #4]
000d80b2  blx     #0xddc20 ; -> objc_setProperty
000d80b6  sub.w   sp, r7, #0
000d80ba  pop     {r7, pc}
000d80bc  cmp     r6, #0x1e
000d80be  movs    r2, r0
