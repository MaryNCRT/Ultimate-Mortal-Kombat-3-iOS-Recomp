========================================================================
-[SBJsonBase init]  0x000d3b98  68 bytes   SBJsonBase.m
========================================================================

000d3b98  push    {r4, r7, lr}
000d3b9a  add     r7, sp, #4
000d3b9c  sub     sp, #8
000d3b9e  ldr     r3, [pc, #0x30]
000d3ba0  ldr     r1, [pc, #0x30]
000d3ba2  str     r0, [sp]
000d3ba4  add     r3, pc ; -> 0x000fddd8  
000d3ba6  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d3ba8  ldr     r3, [r3]
000d3baa  ldr     r1, [r1]
000d3bac  mov     r0, sp
000d3bae  str     r3, [sp, #4]
000d3bb0  blx     #0xddc08 ; -> objc_msgSendSuper2
000d3bb4  mov     r4, r0
000d3bb6  cbz     r0, #0xd3bc6
000d3bb8  ldr     r1, [pc, #0x1c]
000d3bba  mov.w   r2, #0x200
000d3bbe  add     r1, pc ; -> 0x000fd770  
000d3bc0  ldr     r1, [r1]
000d3bc2  blx     #0xddbfc ; -> objc_msgSend
000d3bc6  mov     r0, r4
000d3bc8  sub.w   sp, r7, #4
000d3bcc  pop     {r4, r7, pc}
000d3bce  nop     
000d3bd0  adr     r2, #0xc0
000d3bd2  movs    r2, r0
000d3bd4  ldrh    r6, [r2, #0x2e]
000d3bd6  movs    r2, r0
000d3bd8  ldr     r3, [sp, #0x2b8]
000d3bda  movs    r2, r0
