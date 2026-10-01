========================================================================
-[DMGNavBar dealloc]  0x000cf060  44 bytes   DMGNavBar.mm
========================================================================

000cf060  push    {r7, lr}
000cf062  add     r7, sp, #0
000cf064  sub     sp, #8
000cf066  ldr     r3, [pc, #0x1c]
000cf068  ldr     r1, [pc, #0x1c]
000cf06a  str     r0, [sp]
000cf06c  add     r3, pc ; -> 0x000fddc0  
000cf06e  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000cf070  ldr     r3, [r3]
000cf072  ldr     r1, [r1]
000cf074  mov     r0, sp
000cf076  str     r3, [sp, #4]
000cf078  blx     #0xddc08 ; -> objc_msgSendSuper2
000cf07c  sub.w   sp, r7, #0
000cf080  pop     {r7, pc}
000cf082  nop     
000cf084  ldcl    p0, c0, [r0, #-8]
000cf088  bls     #0xcf0e8
000cf08a  movs    r2, r0
