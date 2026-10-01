========================================================================
get_his_proj_proc  0x0006ff18  28 bytes   mkdrone.c
========================================================================

0006ff18  push    {r4, r7, lr}
0006ff1a  add     r7, sp, #4
0006ff1c  ldr     r3, [r0]
0006ff1e  mov     r4, r0
0006ff20  ldr     r3, [r3]
0006ff22  ldr     r3, [r3]
0006ff24  ldr     r0, [r3, #8]
0006ff26  add.w   r0, r0, #0x700
0006ff2a  bl      #0x57664 ; -> FindThreadProc
0006ff2e  str     r0, [r4, #0x1c]
0006ff30  pop     {r4, r7, pc}
0006ff32  nop     
