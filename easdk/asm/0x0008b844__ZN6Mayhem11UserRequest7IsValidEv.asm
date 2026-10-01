========================================================================
ZN6Mayhem11UserRequest7IsValidEv  0x0008b844  44 bytes   Mayhem.mm
========================================================================

0008b844  push    {r4, r7, lr}
0008b846  add     r7, sp, #4
0008b848  mov     r4, r0
0008b84a  add.w   r0, r0, #8
0008b84e  bl      #0x8b410 ; -> ZN6Mayhem7Request9GetResultEv
0008b852  cmp     r0, #1
0008b854  beq     #0x8b85a
0008b856  movs    r0, #0
0008b858  pop     {r4, r7, pc}
0008b85a  ldr     r3, [r4]
0008b85c  mov     r0, r4
0008b85e  ldr     r3, [r3, #8]
0008b860  blx     r3
0008b862  ldr     r0, [r0]
0008b864  ldr     r0, [r0, #-0xc]
0008b868  subs    r0, #0
0008b86a  it      ne
0008b86c  movne   r0, #1
0008b86e  b       #0x8b858
