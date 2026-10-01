========================================================================
ZN12FBConnection10deactivateEv  0x000889d0  36 bytes   FBConnection.mm
========================================================================

000889d0  push    {r4, r7, lr}
000889d2  add     r7, sp, #4
000889d4  mov     r4, r0
000889d6  ldr     r0, [pc, #0x14]
000889d8  add     r0, pc ; -> 0x0017ee14  
000889da  blx     #0xdd3e0 ; -> NSLog
000889de  ldr     r1, [pc, #0x10]
000889e0  ldr     r0, [r4, #0x14]
000889e2  add     r1, pc ; -> 0x000fcf44  
000889e4  ldr     r1, [r1]
000889e6  blx     #0xddbfc ; -> objc_msgSend
000889ea  pop     {r4, r7, pc}
000889ec  str     r0, [r7, #0x40]
000889ee  movs    r7, r1
000889f0  cmp     r6, fp
000889f2  movs    r7, r0
