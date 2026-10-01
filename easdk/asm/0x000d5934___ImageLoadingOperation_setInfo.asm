========================================================================
-[ImageLoadingOperation setInfo  0x000d5934  40 bytes   ImageLoadingOperation.m
========================================================================

000d5934  push    {r7, lr}
000d5936  add     r7, sp, #0
000d5938  sub     sp, #8
000d593a  mov     r3, r2
000d593c  ldr     r2, [pc, #0x18]
000d593e  mov.w   ip, #0
000d5942  add     r2, pc ; -> 0x000fad4c  OBJC_IVAR_$_ImageLoadingOperation.info
000d5944  ldr     r2, [r2]
000d5946  str.w   ip, [sp]
000d594a  str.w   ip, [sp, #4]
000d594e  blx     #0xddc20 ; -> objc_setProperty
000d5952  sub.w   sp, r7, #0
000d5956  pop     {r7, pc}
000d5958  strb    r6, [r0, r0]
000d595a  movs    r2, r0
