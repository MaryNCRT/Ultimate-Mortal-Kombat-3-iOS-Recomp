========================================================================
-[Facebook requestWithMethodName  0x000da914  68 bytes   Facebook.m
========================================================================

000da914  push    {r4, r5, r7, lr}
000da916  add     r7, sp, #8
000da918  sub     sp, #8
000da91a  ldr     r1, [pc, #0x30]
000da91c  mov     r4, r0
000da91e  ldr     r0, [pc, #0x30]
000da920  add     r1, pc ; -> 0x000fcfe4  
000da922  mov     r5, r3
000da924  add     r0, pc ; -> 0x0017e12c  kRestserverBaseURL
000da926  ldr     r1, [r1]
000da928  ldr     r0, [r0]
000da92a  blx     #0xddbfc ; -> objc_msgSend
000da92e  ldr     r3, [sp, #0x18]
000da930  ldr     r1, [pc, #0x20]
000da932  str     r3, [sp]
000da934  ldr     r3, [sp, #0x1c]
000da936  add     r1, pc ; -> 0x000fdac0  
000da938  ldr     r1, [r1]
000da93a  str     r3, [sp, #4]
000da93c  mov     r3, r5
000da93e  mov     r2, r0
000da940  mov     r0, r4
000da942  blx     #0xddbfc ; -> objc_msgSend
000da946  sub.w   sp, r7, #8
000da94a  pop     {r4, r5, r7, pc}
000da94c  movs    r6, #0xc0
000da94e  movs    r2, r0
000da950  subs    r0, #4
000da952  movs    r2, r1
000da954  adds    r1, #0x86
000da956  movs    r2, r0
