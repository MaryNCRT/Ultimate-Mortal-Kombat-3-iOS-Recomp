========================================================================
t_chance_do  0x0006ced8  188 bytes   mkdrone.c
========================================================================

0006ced8  push    {r4, r5, r6, r7, lr}
0006ceda  add     r7, sp, #0xc
0006cedc  ldr.w   r3, [r0, #0xa4]
0006cee0  mov     r4, r0
0006cee2  ldr.w   r5, [r0, #0x108]
0006cee6  adds    r3, #1
0006cee8  ldr.w   r6, [r0, r3, lsl #3]
0006ceec  cbnz    r6, #0x6cf44
0006ceee  ldr     r3, [r5, #0x64]
0006cef0  mov     r0, r5
0006cef2  str     r3, [r5, #0x1c]
0006cef4  bl      #0x586dc ; -> randper
0006cef8  ldr     r0, [r5, #0x5c]
0006cefa  cmp     r0, #0
0006cefc  beq     #0x6cf4a
0006cefe  ldr.w   r3, [r4, #0xa4]
0006cf02  cmp     r3, #0
0006cf04  ble     #0x6cf72
0006cf06  subs    r3, #1
0006cf08  str.w   r3, [r4, #0xa4]
0006cf0c  ldr.w   r1, [r4, #0xa4]
0006cf10  adds    r3, r1, #1
0006cf12  lsls    r2, r3, #3
0006cf14  adds    r2, r2, r4
0006cf16  ldr     r0, [r2, #4]
0006cf18  adds    r2, r3, #1
0006cf1a  ldr.w   r2, [r4, r2, lsl #3]
0006cf1e  str.w   r2, [r4, r3, lsl #3]
0006cf22  lsls    r3, r1, #3
0006cf24  adds    r3, r3, r4
0006cf26  str     r0, [r3, #4]
0006cf28  ldr     r2, [r5, #0x68]
0006cf2a  movs    r0, #0
0006cf2c  str     r2, [r5, #0x1c]
0006cf2e  ldr.w   r3, [r4, #0xa4]
0006cf32  lsls    r3, r3, #3
0006cf34  adds    r3, r3, r4
0006cf36  str     r2, [r3, #4]
0006cf38  ldr.w   r3, [r4, #0xa4]
0006cf3c  adds    r3, #1
0006cf3e  str.w   r0, [r4, r3, lsl #3]
0006cf42  b       #0x6cf48
0006cf44  mvn     r0, #2
0006cf48  pop     {r4, r5, r6, r7, pc}
0006cf4a  ldr.w   r3, [r4, #0xa4]
0006cf4e  cmp     r3, #0
0006cf50  ble     #0x6cf5a
0006cf52  subs    r3, #1
0006cf54  str.w   r3, [r4, #0xa4]
0006cf58  b       #0x6cf48
0006cf5a  ldr     r2, [pc, #0x30]
0006cf5c  lsls    r3, r3, #3
0006cf5e  adds    r3, r3, r4
0006cf60  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006cf62  ldr     r2, [r2]
0006cf64  str     r2, [r3, #4]
0006cf66  ldr.w   r3, [r4, #0xa4]
0006cf6a  adds    r3, #1
0006cf6c  str.w   r0, [r4, r3, lsl #3]
0006cf70  b       #0x6cf48
0006cf72  ldr.w   r2, [pc, #0x1c]
0006cf76  lsls    r3, r3, #3
0006cf78  adds    r3, r3, r4
0006cf7a  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006cf7c  ldr     r2, [r2]
0006cf7e  str     r2, [r3, #4]
0006cf80  ldr.w   r3, [r4, #0xa4]
0006cf84  adds    r3, #1
0006cf86  str.w   r6, [r4, r3, lsl #3]
0006cf8a  b       #0x6cf0c
0006cf8c  str     r4, [r4, #0x78]
0006cf8e  movs    r0, r1
0006cf90  str     r2, [r1, #0x78]
0006cf92  movs    r0, r1
