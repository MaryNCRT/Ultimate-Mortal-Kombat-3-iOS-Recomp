========================================================================
bubbleSortLeaderboardMonthly  0x0007f718  288 bytes   EASDK_Handler.mm
========================================================================

0007f718  push    {r4, r5, r6, r7, lr}
0007f71a  add     r7, sp, #0xc
0007f71c  push.w  {r8, sl, fp}
0007f720  sub     sp, #0x54
0007f722  ldr     r3, [pc, #0xf0]
0007f724  add     r3, pc ; -> 0x00175888  leaderboardMonthlyNum
0007f726  ldr     r3, [r3]
0007f728  adds.w  r1, r3, #-1
0007f72c  str     r3, [sp, #4]
0007f72e  str     r1, [sp, #8]
0007f730  it      pl
0007f732  movpl.w fp, #0
0007f736  bmi     #0x7f7b4
0007f738  ldr     r1, [sp, #8]
0007f73a  cmp     r1, fp
0007f73c  ble     #0x7f7aa
0007f73e  ldr     r3, [sp, #4]
0007f740  mov     r4, r1
0007f742  lsls    r2, r3, #3
0007f744  lsls    r3, r3, #6
0007f746  add     r3, r2
0007f748  sub.w   r2, r3, #0x8c
0007f74c  ldr     r3, [pc, #0xc8]
0007f74e  add     r3, pc ; -> 0x003714e4  leaderboardMonthly
0007f750  add.w   r5, r2, r3
0007f754  b       #0x7f75e
0007f756  subs    r5, #0x48
0007f758  cmp     r6, fp
0007f75a  ble     #0x7f7aa
0007f75c  mov     r4, r6
0007f75e  ldr     r2, [r5]
0007f760  ldr     r3, [r5, #0x48]
0007f762  subs    r6, r4, #1
0007f764  cmp     r2, r3
0007f766  bge     #0x7f756
0007f768  ldr.w   r8, [pc, #0xb0]
0007f76c  lsls    r3, r6, #6
0007f76e  lsls    r2, r6, #3
0007f770  add.w   r0, r2, r3
0007f774  add     r8, pc ; -> 0x003714e4  leaderboardMonthly
0007f776  add.w   sl, r0, r8
0007f77a  movs    r2, #0x48
0007f77c  mov     r1, sl
0007f77e  add     r0, sp, #0xc
0007f780  blx     #0xddb9c ; -> memcpy
0007f784  lsls    r3, r4, #6
0007f786  lsls    r2, r4, #3
0007f788  add.w   r0, r2, r3
0007f78c  add.w   r4, r0, r8
0007f790  movs    r2, #0x48
0007f792  mov     r1, r4
0007f794  mov     r0, sl
0007f796  blx     #0xddb9c ; -> memcpy
0007f79a  movs    r2, #0x48
0007f79c  mov     r0, r4
0007f79e  add     r1, sp, #0xc
0007f7a0  blx     #0xddb9c ; -> memcpy
0007f7a4  subs    r5, #0x48
0007f7a6  cmp     r6, fp
0007f7a8  bgt     #0x7f75c
0007f7aa  ldr     r3, [sp, #4]
0007f7ac  add.w   fp, fp, #1
0007f7b0  cmp     fp, r3
0007f7b2  bne     #0x7f738
0007f7b4  ldr.w   r3, [pc, #0x68]
0007f7b8  add     r3, pc ; -> 0x00175888  leaderboardMonthlyNum
0007f7ba  ldr     r3, [r3]
0007f7bc  cmp     r3, #0
0007f7be  ble     #0x7f800
0007f7c0  ldr     r5, [pc, #0x60]
0007f7c2  ldr.w   sl, [pc, #0x64]
0007f7c6  ldr.w   r8, [pc, #0x64]
0007f7ca  ldr     r6, [pc, #0x64]
0007f7cc  add     r5, pc ; -> 0x003714e4  leaderboardMonthly
0007f7ce  movs    r3, #0
0007f7d0  b       #0x7f7d4
0007f7d2  mov     r3, r4
0007f7d4  ldr     r1, [r5, #4]
0007f7d6  adds    r4, r3, #1
0007f7d8  lsls    r2, r3, #3
0007f7da  lsls    r3, r3, #6
0007f7dc  adds    r2, r2, r3
0007f7de  adds    r2, #8
0007f7e0  mov     r3, r8
0007f7e2  add     r3, pc
0007f7e4  adds    r2, r2, r3
0007f7e6  mov     r0, sl
0007f7e8  ldr     r3, [r5]
0007f7ea  add     r0, pc
0007f7ec  str     r1, [sp]
0007f7ee  mov     r1, r4
0007f7f0  blx     #0xddc38 ; -> printf
0007f7f4  mov     r3, r6
0007f7f6  add     r3, pc
0007f7f8  adds    r5, #0x48
0007f7fa  ldr     r3, [r3]
0007f7fc  cmp     r3, r4
0007f7fe  bgt     #0x7f7d2
0007f800  ldr     r0, [pc, #0x30]
0007f802  add     r0, pc ; -> 0x0017d978  '=========================='
0007f804  blx     #0xddcb0 ; -> puts
0007f808  sub.w   sp, r7, #0x18
0007f80c  pop.w   {r8, sl, fp}
0007f810  pop     {r4, r5, r6, r7, pc}
0007f812  nop     
0007f814  str     r0, [r4, #0x14]
0007f816  movs    r7, r1
0007f818  adds    r2, r2, #6
0007f81a  movs    r7, r5
0007f81c  adds    r4, r5, #5
0007f81e  movs    r7, r5
0007f820  str     r4, [r1, #0xc]
0007f822  movs    r7, r1
0007f824  adds    r4, r2, #4
0007f826  movs    r7, r5
0007f828  ldrsh   r6, [r2, r7]
0007f82a  movs    r7, r1
0007f82c  adds    r6, r7, #3
0007f82e  movs    r7, r5
0007f830  str     r6, [r1, #8]
0007f832  movs    r7, r1
0007f834  b       #0x7fb1c
0007f836  movs    r7, r1
