========================================================================
-[EAMTX_Network setItemIdentifier  0x000c73f8  40 bytes   EAMTX_Network.mm
========================================================================

000c73f8  push    {r7, lr}
000c73fa  add     r7, sp, #0
000c73fc  sub     sp, #8
000c73fe  mov     r3, r2
000c7400  ldr     r2, [pc, #0x18]
000c7402  mov.w   ip, #0
000c7406  add     r2, pc ; -> 0x000f7a48  OBJC_IVAR_$_EAMTX_Network.itemIdentifier
000c7408  ldr     r2, [r2]
000c740a  str.w   ip, [sp]
000c740e  str.w   ip, [sp, #4]
000c7412  blx     #0xddc20 ; -> objc_setProperty
000c7416  sub.w   sp, r7, #0
000c741a  pop     {r7, pc}
000c741c  lsls    r6, r7, #0x18
000c741e  movs    r3, r0
