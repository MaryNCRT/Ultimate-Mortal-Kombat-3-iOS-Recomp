========================================================================
t_ct_jax_dash  0x0006b7cc  228 bytes   mkdrone.c
========================================================================

0006b7cc  ldr.w   r3, [r0, #0xa4]
0006b7d0  movw    r1, #0x1271
0006b7d4  adds    r3, #1
0006b7d6  ldr.w   ip, [r0, #0x108]
0006b7da  ldr.w   r2, [r0, r3, lsl #3]
0006b7de  cmp     r2, r1
0006b7e0  beq     #0x6b84e
0006b7e2  ble     #0x6b7fa
0006b7e4  movw    r1, #0x1274
0006b7e8  cmp     r2, r1
0006b7ea  beq     #0x6b856
0006b7ec  movw    r3, #0x1275
0006b7f0  cmp     r2, r3
0006b7f2  beq     #0x6b82a
0006b7f4  mvn     r0, #2
0006b7f8  bx      lr
0006b7fa  cmp     r2, #0
0006b7fc  bne     #0x6b7f4
0006b7fe  str.w   r1, [r0, r3, lsl #3]
0006b802  ldr.w   r3, [r0, #0xa4]
0006b806  adds    r1, r3, #1
0006b808  ldr     r3, [pc, #0x98]
0006b80a  str.w   r1, [r0, #0xa4]
0006b80e  add     r3, pc ; -> 0x000f3884  t_do_duck
0006b810  ldr.w   ip, [r3]
0006b814  lsls    r3, r1, #3
0006b816  adds    r3, r3, r0
0006b818  str.w   ip, [r3, #4]
0006b81c  ldr.w   r3, [r0, #0xa4]
0006b820  adds    r3, #1
0006b822  str.w   r2, [r0, r3, lsl #3]
0006b826  mov     r0, r2
0006b828  b       #0x6b7f8
0006b82a  ldr.w   r3, [ip, #0x44]
0006b82e  subs    r2, r3, #1
0006b830  str.w   r2, [ip, #0x44]
0006b834  cbz     r2, #0x6b882
0006b836  ldr.w   r3, [r0, #0xa4]
0006b83a  movw    r2, #0x1274
0006b83e  adds    r3, #1
0006b840  str.w   r2, [r0, r3, lsl #3]
0006b844  movs    r2, #1
0006b846  str.w   r2, [r0, #0xfc]
0006b84a  mov     r0, r2
0006b84c  b       #0x6b7f8
0006b84e  movs    r3, #0x40
0006b850  str.w   r3, [ip, #0x44]
0006b854  b       #0x6b836
0006b856  movw    r2, #0x1275
0006b85a  str.w   r2, [r0, r3, lsl #3]
0006b85e  ldr.w   r3, [r0, #0xa4]
0006b862  ldr     r2, [pc, #0x44]
0006b864  adds    r3, #1
0006b866  str.w   r3, [r0, #0xa4]
0006b86a  lsls    r3, r3, #3
0006b86c  adds    r3, r3, r0
0006b86e  add     r2, pc ; -> 0x0006c40d  t_d_beware
0006b870  str     r2, [r3, #4]
0006b872  ldr.w   r3, [r0, #0xa4]
0006b876  movs    r2, #0
0006b878  adds    r3, #1
0006b87a  str.w   r2, [r0, r3, lsl #3]
0006b87e  mov     r0, r2
0006b880  b       #0x6b7f8
0006b882  ldr.w   r3, [pc, #0x28]
0006b886  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006b888  ldr     r1, [r3]
0006b88a  ldr.w   r3, [r0, #0xa4]
0006b88e  lsls    r3, r3, #3
0006b890  adds    r3, r3, r0
0006b892  str     r1, [r3, #4]
0006b894  ldr.w   r3, [r0, #0xa4]
0006b898  adds    r3, #1
0006b89a  str.w   r2, [r0, r3, lsl #3]
0006b89e  mov     r0, r2
0006b8a0  b       #0x6b7f8
0006b8a2  nop     
0006b8a4  strh    r2, [r6, #2]
0006b8a6  movs    r0, r1
0006b8a8  lsrs    r3, r3, #0xe
0006b8aa  movs    r0, r0
0006b8ac  ldrb    r6, [r7, #0x19]
0006b8ae  movs    r0, r1
