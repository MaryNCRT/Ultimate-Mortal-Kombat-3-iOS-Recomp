========================================================================
ZN6Mayhem4Stat13StatIDFromURIERKSs  0x0008b540  68 bytes   Mayhem.mm
========================================================================

0008b540  push    {r4, r5, r7, lr}
0008b542  add     r7, sp, #8
0008b544  mov     r4, r1
0008b546  ldr     r1, [pc, #0x34]
0008b548  movs    r3, #1
0008b54a  mov.w   r2, #-1
0008b54e  mov     r5, r0
0008b550  add     r1, pc ; -> 0x000e2400  '/'
0008b552  mov     r0, r4
0008b554  blx     #0xdd4d0 ; -> ZNKSs12find_last_ofEPKcmm
0008b558  ldr     r3, [r4]
0008b55a  ldr     r3, [r3, #-0xc]
0008b55e  adds    r2, r0, #1
0008b560  cmp     r2, r3
0008b562  bhi     #0x8b574
0008b564  mov     r0, r5
0008b566  mov     r1, r4
0008b568  mov.w   r3, #-1
0008b56c  blx     #0xdd548 ; -> ZNSsC1ERKSsmm
0008b570  mov     r0, r5
0008b572  pop     {r4, r5, r7, pc}
0008b574  ldr     r0, [pc, #8]
0008b576  add     r0, pc ; -> 0x00175bf0  'basic_string::substr'
0008b578  blx     #0xdd584 ; -> ZSt20__throw_out_of_rangePKc
0008b57c  ldr     r4, [r5, #0x68]
0008b57e  movs    r5, r0
0008b580  adr     r6, #0x1d8
0008b582  movs    r6, r1
