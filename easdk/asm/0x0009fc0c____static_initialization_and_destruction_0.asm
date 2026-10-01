========================================================================
__static_initialization_and_destruction_0  0x0009fc0c  56 bytes   LocaleManager.mm
========================================================================

0009fc0c  push    {r7, lr}
0009fc0e  add     r7, sp, #0
0009fc10  cmp     r0, #1
0009fc12  beq     #0x9fc16
0009fc14  pop     {r7, pc}
0009fc16  movw    r3, #0xffff
0009fc1a  cmp     r1, r3
0009fc1c  bne     #0x9fc14
0009fc1e  ldr     r0, [pc, #0x18]
0009fc20  add     r0, pc ; -> 0x00379c1c  ZN13LocaleManager10s_instanceE
0009fc22  bl      #0x9f608 ; -> ZN13LocaleManagerC1Ev
0009fc26  ldr     r2, [pc, #0x14]
0009fc28  ldr     r0, [pc, #0x14]
0009fc2a  movs    r1, #0
0009fc2c  add     r2, pc ; -> 0x000f3378  0x1000
0009fc2e  add     r0, pc ; -> 0x0009ee1d  tcf_0
0009fc30  ldr     r2, [r2]
0009fc32  blx     #0xdd5d8 ; -> cxa_atexit
0009fc36  b       #0x9fc14
0009fc38  ldr     r7, [sp, #0x3e0]
0009fc3a  movs    r5, r5
0009fc3c  adds    r7, #0x48
0009fc3e  movs    r5, r0
0009fc40  bl      #0x28bc42
