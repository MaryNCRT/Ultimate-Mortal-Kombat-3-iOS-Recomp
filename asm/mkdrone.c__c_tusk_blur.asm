========================================================================
c_tusk_blur  0x0006cac8  164 bytes   mkdrone.c
========================================================================

0006cac8  push    {r4, r5, r6, r7, lr}
0006caca  add     r7, sp, #0xc
0006cacc  str     r8, [sp, #-0x4]!
0006cad0  ldr.w   r3, [r0, #0xa4]
0006cad4  mov     r4, r0
0006cad6  ldr.w   r5, [r0, #0x108]
0006cada  adds    r3, #1
0006cadc  ldr.w   r6, [r0, r3, lsl #3]
0006cae0  cbnz    r6, #0x6cb14
0006cae2  movw    r3, #0x213
0006cae6  mov     r0, r5
0006cae8  str     r3, [r5, #0x20]
0006caea  bl      #0x6c8e0 ; -> count_q_repeats
0006caee  ldr.w   r8, [r5, #0x28]
0006caf2  cmp.w   r8, #0
0006caf6  beq     #0x6cb1e
0006caf8  ldr.w   r3, [r4, #0xa4]
0006cafc  ldr     r2, [pc, #0x60]
0006cafe  mov     r0, r6
0006cb00  lsls    r3, r3, #3
0006cb02  adds    r3, r3, r4
0006cb04  add     r2, pc ; -> 0x0006fa21  t_d_block
0006cb06  str     r2, [r3, #4]
0006cb08  ldr.w   r3, [r4, #0xa4]
0006cb0c  adds    r3, #1
0006cb0e  str.w   r6, [r4, r3, lsl #3]
0006cb12  b       #0x6cb18
0006cb14  mvn     r0, #2
0006cb18  ldr     r8, [sp], #4
0006cb1c  pop     {r4, r5, r6, r7, pc}
0006cb1e  mov     r0, r5
0006cb20  bl      #0x6c9f4 ; -> should_i_promove
0006cb24  ldr     r0, [r5, #0x5c]
0006cb26  cbz     r0, #0x6cb46
0006cb28  ldr.w   r3, [r4, #0xa4]
0006cb2c  ldr.w   r2, [pc, #0x34]
0006cb30  mov     r0, r8
0006cb32  lsls    r3, r3, #3
0006cb34  adds    r3, r3, r4
0006cb36  add     r2, pc ; -> 0x0006fa21  t_d_block
0006cb38  str     r2, [r3, #4]
0006cb3a  ldr.w   r3, [r4, #0xa4]
0006cb3e  adds    r3, #1
0006cb40  str.w   r8, [r4, r3, lsl #3]
0006cb44  b       #0x6cb18
0006cb46  ldr.w   r3, [r4, #0xa4]
0006cb4a  ldr     r2, [pc, #0x1c]
0006cb4c  lsls    r3, r3, #3
0006cb4e  adds    r3, r3, r4
0006cb50  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006cb52  str     r2, [r3, #4]
0006cb54  ldr.w   r3, [r4, #0xa4]
0006cb58  adds    r3, #1
0006cb5a  str.w   r0, [r4, r3, lsl #3]
0006cb5e  b       #0x6cb18
0006cb60  cmp     r7, #0x19
0006cb62  movs    r0, r0
0006cb64  cmp     r6, #0xe7
0006cb66  movs    r0, r0
0006cb68  bl      #0xffe9eb6a
