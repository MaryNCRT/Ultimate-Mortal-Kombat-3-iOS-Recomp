========================================================================
findIfAlreadyInLeaderboard  0x0007f69c  124 bytes   EASDK_Handler.mm
========================================================================

0007f69c  push    {r4, r5, r6, r7, lr}
0007f69e  add     r7, sp, #0xc
0007f6a0  push.w  {r8, sl, fp}
0007f6a4  sub     sp, #4
0007f6a6  ldr     r3, [pc, #0x68]
0007f6a8  str     r0, [sp]
0007f6aa  add     r3, pc ; -> 0x00175888  leaderboardMonthlyNum
0007f6ac  ldr.w   sl, [r3]
0007f6b0  cmp.w   sl, #0
0007f6b4  ble     #0x7f6f6
0007f6b6  ldr.w   fp, [pc, #0x5c]
0007f6ba  movs    r4, #0
0007f6bc  add.w   r8, r0, #0x28
0007f6c0  b       #0x7f6c8
0007f6c2  adds    r4, #1
0007f6c4  cmp     r4, sl
0007f6c6  beq     #0x7f6f6
0007f6c8  lsls    r0, r4, #6
0007f6ca  lsls    r3, r4, #3
0007f6cc  add.w   r6, r3, r0
0007f6d0  add.w   r0, r6, #0x28
0007f6d4  mov     r5, fp
0007f6d6  add     r5, pc
0007f6d8  adds    r0, r0, r5
0007f6da  mov     r1, r8
0007f6dc  blx     #0xddddc ; -> strcmp
0007f6e0  cmp     r0, #0
0007f6e2  bne     #0x7f6c2
0007f6e4  ldr     r1, [sp]
0007f6e6  add.w   r0, r6, r5
0007f6ea  ldr     r2, [r0, #4]
0007f6ec  ldr     r3, [r1, #4]
0007f6ee  cmp     r2, r3
0007f6f0  blt     #0x7f702
0007f6f2  movs    r0, #1
0007f6f4  b       #0x7f6f8
0007f6f6  movs    r0, #0
0007f6f8  sub.w   sp, r7, #0x18
0007f6fc  pop.w   {r8, sl, fp}
0007f700  pop     {r4, r5, r6, r7, pc}
0007f702  ldr     r1, [sp]
0007f704  movs    r2, #0x48
0007f706  blx     #0xddb9c ; -> memcpy
0007f70a  movs    r0, #1
0007f70c  b       #0x7f6f8
0007f70e  nop     
0007f710  str     r2, [r3, #0x1c]
0007f712  movs    r7, r1
0007f714  subs    r2, r1, #0
0007f716  movs    r7, r5
