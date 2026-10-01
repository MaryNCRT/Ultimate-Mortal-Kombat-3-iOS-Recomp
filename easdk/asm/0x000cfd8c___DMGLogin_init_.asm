========================================================================
-[DMGLogin init]  0x000cfd8c  44 bytes   DMGLogin.mm
========================================================================

000cfd8c  push    {r7, lr}
000cfd8e  add     r7, sp, #0
000cfd90  sub     sp, #8
000cfd92  ldr     r3, [pc, #0x1c]
000cfd94  ldr     r1, [pc, #0x1c]
000cfd96  str     r0, [sp]
000cfd98  add     r3, pc ; -> 0x000fddc4  
000cfd9a  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000cfd9c  ldr     r3, [r3]
000cfd9e  ldr     r1, [r1]
000cfda0  mov     r0, sp
000cfda2  str     r3, [sp, #4]
000cfda4  blx     #0xddc08 ; -> objc_msgSendSuper2
000cfda8  sub.w   sp, r7, #0
000cfdac  pop     {r7, pc}
000cfdae  nop     
000cfdb0  b       #0xcfe04
000cfdb2  movs    r2, r0
000cfdb4  ldm     r3!, {r1, r5, r6, r7}
000cfdb6  movs    r2, r0
