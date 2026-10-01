========================================================================
-[Facebook dialog  0x000da80c  64 bytes   Facebook.m
========================================================================

000da80c  push    {r4, r5, r6, r7, lr}
000da80e  add     r7, sp, #0xc
000da810  sub     sp, #4
000da812  ldr     r1, [pc, #0x2c]
000da814  mov     r5, r0
000da816  ldr     r0, [pc, #0x2c]
000da818  add     r1, pc ; -> 0x000fcf30  '\x07G\x0e'
000da81a  mov     r4, r3
000da81c  add     r0, pc ; -> 0x000fdbf4  
000da81e  ldr     r1, [r1]
000da820  ldr     r0, [r0]
000da822  mov     r6, r2
000da824  blx     #0xddbfc ; -> objc_msgSend
000da828  ldr     r1, [pc, #0x1c]
000da82a  mov     r2, r6
000da82c  str     r4, [sp]
000da82e  add     r1, pc ; -> 0x000fd9d0  '>\x1c\x0f'
000da830  ldr     r1, [r1]
000da832  mov     r3, r0
000da834  mov     r0, r5
000da836  blx     #0xddbfc ; -> objc_msgSend
000da83a  sub.w   sp, r7, #0xc
000da83e  pop     {r4, r5, r6, r7, pc}
000da840  movs    r7, #0x14
000da842  movs    r2, r0
000da844  adds    r3, #0xd4
000da846  movs    r2, r0
000da848  adds    r1, #0x9e
000da84a  movs    r2, r0
