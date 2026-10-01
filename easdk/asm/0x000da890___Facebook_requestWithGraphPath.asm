========================================================================
-[Facebook requestWithGraphPath  0x000da890  48 bytes   Facebook.m
========================================================================

000da890  push    {r7, lr}
000da892  add     r7, sp, #0
000da894  sub     sp, #8
000da896  ldr.w   ip, [pc, #0x20]
000da89a  ldr     r1, [pc, #0x20]
000da89c  add     ip, pc ; -> 0x0017ea14  
000da89e  str.w   ip, [sp]
000da8a2  ldr.w   ip, [sp, #0x10]
000da8a6  add     r1, pc ; -> 0x000fdabc  
000da8a8  ldr     r1, [r1]
000da8aa  str.w   ip, [sp, #4]
000da8ae  blx     #0xddbfc ; -> objc_msgSend
000da8b2  sub.w   sp, r7, #0
000da8b6  pop     {r7, pc}
000da8b8  adcs    r4, r6
000da8ba  movs    r2, r1
000da8bc  adds    r2, #0x12
000da8be  movs    r2, r0
