========================================================================
his_proj_front_x  0x0006ff34  76 bytes   mkdrone.c
========================================================================

0006ff34  push    {r4, r7, lr}
0006ff36  add     r7, sp, #4
0006ff38  mov     r4, r0
0006ff3a  bl      #0x6ff18 ; -> get_his_proj_proc
0006ff3e  ldr     r3, [r4, #0x1c]
0006ff40  ldr     r2, [r3]
0006ff42  str     r3, [r4, #0x38]
0006ff44  ldr     r1, [r3, #8]
0006ff46  ldr.w   r2, [r2, #0x84]
0006ff4a  str     r1, [r4, #0x30]
0006ff4c  str     r2, [r4, #0x1c]
0006ff4e  ldrsh.w r3, [r1, #0xe]
0006ff52  str     r3, [r4, #0x28]
0006ff54  cbz     r2, #0x6ff7e
0006ff56  ldr     r0, [r2]
0006ff58  str     r0, [r4, #0x24]
0006ff5a  ldr     r2, [r2, #8]
0006ff5c  str     r2, [r4, #0x2c]
0006ff5e  ldr     r3, [r1, #0x28]
0006ff60  tst.w   r3, #0x10
0006ff64  str     r3, [r4, #0x34]
0006ff66  ittt    ne
0006ff68  rsbne   r3, r0, #0
0006ff6a  strne   r3, [r4, #0x24]
0006ff6c  rsbne   r3, r2, #0
0006ff6e  ldr     r2, [r4, #0x28]
0006ff70  it      ne
0006ff72  strne   r3, [r4, #0x2c]
0006ff74  ldr     r3, [r4, #0x24]
0006ff76  add     r3, r2
0006ff78  ldr     r2, [r4, #0x2c]
0006ff7a  adds    r3, r3, r2
0006ff7c  str     r3, [r4, #0x28]
0006ff7e  pop     {r4, r7, pc}
