========================================================================
-[DMGViewController didReceiveMemoryWarning]  0x000d16f0  44 bytes   DMGViewController.mm
========================================================================

000d16f0  push    {r7, lr}
000d16f2  add     r7, sp, #0
000d16f4  sub     sp, #8
000d16f6  ldr     r3, [pc, #0x1c]
000d16f8  ldr     r1, [pc, #0x1c]
000d16fa  str     r0, [sp]
000d16fc  add     r3, pc ; -> 0x000fddc8  
000d16fe  add     r1, pc ; -> 0x000fd1ac  
000d1700  ldr     r3, [r3]
000d1702  ldr     r1, [r1]
000d1704  mov     r0, sp
000d1706  str     r3, [sp, #4]
000d1708  blx     #0xddc08 ; -> objc_msgSendSuper2
000d170c  sub.w   sp, r7, #0
000d1710  pop     {r7, pc}
000d1712  nop     
000d1714  stm     r6!, {r3, r6, r7}
000d1716  movs    r2, r0
