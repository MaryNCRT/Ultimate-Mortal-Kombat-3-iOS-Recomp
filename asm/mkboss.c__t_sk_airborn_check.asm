========================================================================
t_sk_airborn_check  0x000a8f14  192 bytes   mkboss.c
========================================================================

000a8f14  push    {r4, r5, r6, r7, lr}
000a8f16  add     r7, sp, #0xc
000a8f18  ldr.w   r3, [r0, #0xa4]
000a8f1c  mov     r4, r0
000a8f1e  ldr.w   r5, [r0, #0x108]
000a8f22  adds    r3, #1
000a8f24  ldr.w   r6, [r0, r3, lsl #3]
000a8f28  cbnz    r6, #0xa8f46
000a8f2a  mov     r0, r5
000a8f2c  bl      #0x55070 ; -> am_i_airborn
000a8f30  ldr     r0, [r5, #0x5c]
000a8f32  cbnz    r0, #0xa8f4c
000a8f34  ldr.w   r3, [r4, #0xa4]
000a8f38  cmp     r3, #0
000a8f3a  ble     #0xa8fac
000a8f3c  subs    r3, #1
000a8f3e  mov     r0, r6
000a8f40  str.w   r3, [r4, #0xa4]
000a8f44  b       #0xa8f4a
000a8f46  mvn     r0, #2
000a8f4a  pop     {r4, r5, r6, r7, pc}
000a8f4c  ldr.w   r3, [r4, #0xa4]
000a8f50  cmp     r3, #0
000a8f52  ble     #0xa8f92
000a8f54  subs    r3, #1
000a8f56  str.w   r3, [r4, #0xa4]
000a8f5a  ldr.w   r1, [r4, #0xa4]
000a8f5e  adds    r3, r1, #1
000a8f60  lsls    r2, r3, #3
000a8f62  adds    r2, r2, r4
000a8f64  ldr     r0, [r2, #4]
000a8f66  adds    r2, r3, #1
000a8f68  ldr.w   r2, [r4, r2, lsl #3]
000a8f6c  str.w   r2, [r4, r3, lsl #3]
000a8f70  lsls    r3, r1, #3
000a8f72  adds    r3, r3, r4
000a8f74  ldr     r2, [pc, #0x50]
000a8f76  str     r0, [r3, #4]
000a8f78  ldr.w   r3, [r4, #0xa4]
000a8f7c  add     r2, pc ; -> 0x000a8fd5  t_sk_knocked_down
000a8f7e  movs    r0, #0
000a8f80  lsls    r3, r3, #3
000a8f82  adds    r3, r3, r4
000a8f84  str     r2, [r3, #4]
000a8f86  ldr.w   r3, [r4, #0xa4]
000a8f8a  adds    r3, #1
000a8f8c  str.w   r0, [r4, r3, lsl #3]
000a8f90  b       #0xa8f4a
000a8f92  ldr.w   r2, [pc, #0x38]
000a8f96  lsls    r3, r3, #3
000a8f98  adds    r3, r3, r4
000a8f9a  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000a8f9c  ldr     r2, [r2]
000a8f9e  str     r2, [r3, #4]
000a8fa0  ldr.w   r3, [r4, #0xa4]
000a8fa4  adds    r3, #1
000a8fa6  str.w   r6, [r4, r3, lsl #3]
000a8faa  b       #0xa8f5a
000a8fac  ldr     r2, [pc, #0x20]
000a8fae  lsls    r3, r3, #3
000a8fb0  adds    r3, r3, r4
000a8fb2  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000a8fb4  mov     r0, r6
000a8fb6  ldr     r2, [r2]
000a8fb8  str     r2, [r3, #4]
000a8fba  ldr.w   r3, [r4, #0xa4]
000a8fbe  adds    r3, #1
000a8fc0  str.w   r6, [r4, r3, lsl #3]
000a8fc4  b       #0xa8f4a
000a8fc6  nop     
000a8fc8  lsls    r5, r2, #1
000a8fca  movs    r0, r0
000a8fcc  adr     r7, #0x1a8
000a8fce  movs    r4, r0
000a8fd0  adr     r7, #0x148
000a8fd2  movs    r4, r0
