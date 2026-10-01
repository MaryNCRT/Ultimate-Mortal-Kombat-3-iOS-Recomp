========================================================================
-[SBJSON init]  0x000d3924  136 bytes   SBJSON.m
========================================================================

000d3924  push    {r4, r5, r6, r7, lr}
000d3926  add     r7, sp, #0xc
000d3928  sub     sp, #8
000d392a  ldr     r3, [pc, #0x60]
000d392c  ldr     r1, [pc, #0x60]
000d392e  str     r0, [sp]
000d3930  add     r3, pc ; -> 0x000fddd4  
000d3932  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d3934  ldr     r3, [r3]
000d3936  ldr     r1, [r1]
000d3938  mov     r0, sp
000d393a  str     r3, [sp, #4]
000d393c  blx     #0xddc08 ; -> objc_msgSendSuper2
000d3940  mov     r4, r0
000d3942  cbz     r0, #0xd3982
000d3944  ldr     r1, [pc, #0x4c]
000d3946  ldr     r0, [pc, #0x50]
000d3948  ldr     r3, [pc, #0x50]
000d394a  add     r1, pc ; -> 0x000fcfe8  
000d394c  add     r0, pc ; -> 0x000fdcc8  
000d394e  ldr     r6, [r1]
000d3950  add     r3, pc ; -> 0x000fa88c  OBJC_IVAR_$_SBJSON.jsonWriter
000d3952  ldr     r0, [r0]
000d3954  ldr     r5, [r3]
000d3956  mov     r1, r6
000d3958  blx     #0xddbfc ; -> objc_msgSend
000d395c  ldr     r3, [pc, #0x40]
000d395e  mov     r1, r6
000d3960  add     r3, pc ; -> 0x000fa888  OBJC_IVAR_$_SBJSON.jsonParser
000d3962  str     r0, [r4, r5]
000d3964  ldr     r0, [pc, #0x3c]
000d3966  ldr     r5, [r3]
000d3968  add     r0, pc ; -> 0x000fdccc  
000d396a  ldr     r0, [r0]
000d396c  blx     #0xddbfc ; -> objc_msgSend
000d3970  ldr     r1, [pc, #0x34]
000d3972  mov.w   r2, #0x200
000d3976  add     r1, pc ; -> 0x000fd770  
000d3978  ldr     r1, [r1]
000d397a  str     r0, [r4, r5]
000d397c  mov     r0, r4
000d397e  blx     #0xddbfc ; -> objc_msgSend
000d3982  mov     r0, r4
000d3984  sub.w   sp, r7, #0xc
000d3988  pop     {r4, r5, r6, r7, pc}
000d398a  nop     
000d398c  adr     r4, #0x280
000d398e  movs    r2, r0
000d3990  str     r0, [sp, #0x128]
000d3992  movs    r2, r0
000d3994  str     r6, [sp, #0x268]
000d3996  movs    r2, r0
000d3998  adr     r3, #0x1e0
000d399a  movs    r2, r0
000d399c  ldr     r0, [r7, #0x70]
000d399e  movs    r2, r0
000d39a0  ldr     r4, [r4, #0x70]
000d39a2  movs    r2, r0
000d39a4  adr     r3, #0x180
000d39a6  movs    r2, r0
000d39a8  ldr     r5, [sp, #0x3d8]
000d39aa  movs    r2, r0
