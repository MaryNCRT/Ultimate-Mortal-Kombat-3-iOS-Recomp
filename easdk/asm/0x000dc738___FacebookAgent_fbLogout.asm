========================================================================
-[FacebookAgent fbLogout  0x000dc738  48 bytes   FacebookAgent.mm
========================================================================

000dc738  push    {r7, lr}
000dc73a  add     r7, sp, #0
000dc73c  ldr     r3, [pc, #0x1c]
000dc73e  ldr     r1, [pc, #0x20]
000dc740  mov     ip, r0
000dc742  add     r3, pc ; -> 0x000fc8d0  OBJC_IVAR_$_FacebookAgent.bIgnoreCallback
000dc744  add     r1, pc ; -> 0x000fd9d8  
000dc746  ldr     r3, [r3]
000dc748  ldr     r1, [r1]
000dc74a  strb    r2, [r0, r3]
000dc74c  ldr     r3, [pc, #0x14]
000dc74e  mov     r2, ip
000dc750  add     r3, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dc752  ldr     r3, [r3]
000dc754  ldr     r0, [r0, r3]
000dc756  blx     #0xddbfc ; -> objc_msgSend
000dc75a  pop     {r7, pc}
000dc75c  lsls    r2, r1, #6
000dc75e  movs    r2, r0
000dc760  asrs    r0, r2, #0xa
000dc762  movs    r2, r0
000dc764  lsls    r4, r4, #5
000dc766  movs    r2, r0
