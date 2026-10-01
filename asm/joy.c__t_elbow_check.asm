========================================================================
t_elbow_check  0x0002f8ac  296 bytes   joy.c
========================================================================

0002f8ac  push    {r4, r5, r6, r7, lr}
0002f8ae  add     r7, sp, #0xc
0002f8b0  str     r8, [sp, #-0x4]!
0002f8b4  ldr.w   r2, [r0, #0xa4]
0002f8b8  mov     r4, r0
0002f8ba  ldr.w   r5, [r0, #0x108]
0002f8be  adds    r3, r2, #1
0002f8c0  ldr.w   r6, [r0, r3, lsl #3]
0002f8c4  cbnz    r6, #0x2f8e6
0002f8c6  mov     r0, r5
0002f8c8  bl      #0x55060 ; -> is_he_airborn
0002f8cc  mov     r8, r0
0002f8ce  cbz     r0, #0x2f90c
0002f8d0  ldr.w   r3, [r4, #0xa4]
0002f8d4  cmp     r3, #0
0002f8d6  ble     #0x2f974
0002f8d8  mov     r0, r6
0002f8da  subs    r3, #1
0002f8dc  str.w   r3, [r4, #0xa4]
0002f8e0  ldr     r8, [sp], #4
0002f8e4  pop     {r4, r5, r6, r7, pc}
0002f8e6  movw    r3, #0x6ae
0002f8ea  cmp     r6, r3
0002f8ec  it      ne
0002f8ee  mvnne   r0, #2
0002f8f2  bne     #0x2f8e0
0002f8f4  ldr     r1, [pc, #0xc8]
0002f8f6  add     r1, pc ; -> 0x00030061  t_local_reaction_exit
0002f8f8  lsls    r3, r2, #3
0002f8fa  adds    r3, r3, r4
0002f8fc  movs    r0, #0
0002f8fe  str     r1, [r3, #4]
0002f900  ldr.w   r3, [r4, #0xa4]
0002f904  adds    r3, #1
0002f906  str.w   r0, [r4, r3, lsl #3]
0002f90a  b       #0x2f8e0
0002f90c  mov     r0, r5
0002f90e  bl      #0x2f3a0 ; -> get_x_dist
0002f912  ldr     r0, [r5, #0x28]
0002f914  cmp     r0, #0x4a
0002f916  ble     #0x2f92a
0002f918  ldr.w   r3, [r4, #0xa4]
0002f91c  cmp     r3, #0
0002f91e  ble     #0x2f98c
0002f920  subs    r3, #1
0002f922  mov     r0, r8
0002f924  str.w   r3, [r4, #0xa4]
0002f928  b       #0x2f8e0
0002f92a  ldr.w   r3, [r4, #0xa4]
0002f92e  cmp     r3, #0
0002f930  ble     #0x2f9a6
0002f932  subs    r3, #1
0002f934  str.w   r3, [r4, #0xa4]
0002f938  ldr.w   r1, [r4, #0xa4]
0002f93c  adds    r3, r1, #1
0002f93e  lsls    r2, r3, #3
0002f940  adds    r2, r2, r4
0002f942  ldr     r0, [r2, #4]
0002f944  adds    r2, r3, #1
0002f946  ldr.w   r2, [r4, r2, lsl #3]
0002f94a  str.w   r2, [r4, r3, lsl #3]
0002f94e  lsls    r3, r1, #3
0002f950  adds    r3, r3, r4
0002f952  movw    r2, #0x6ae
0002f956  str     r0, [r3, #4]
0002f958  ldr.w   r3, [r4, #0xa4]
0002f95c  adds    r3, #1
0002f95e  str.w   r2, [r4, r3, lsl #3]
0002f962  ldr.w   r3, [r4, #0xa4]
0002f966  adds    r2, r3, #1
0002f968  ldr     r3, [pc, #0x58]
0002f96a  str.w   r2, [r4, #0xa4]
0002f96e  add     r3, pc ; -> 0x000f3888  t_do_elbow
0002f970  ldr     r1, [r3]
0002f972  b       #0x2f8f8
0002f974  ldr     r2, [pc, #0x50]
0002f976  lsls    r3, r3, #3
0002f978  adds    r3, r3, r4
0002f97a  add     r2, pc ; -> 0x00030061  t_local_reaction_exit
0002f97c  str     r2, [r3, #4]
0002f97e  ldr.w   r3, [r4, #0xa4]
0002f982  mov     r0, r6
0002f984  adds    r3, #1
0002f986  str.w   r6, [r4, r3, lsl #3]
0002f98a  b       #0x2f8e0
0002f98c  ldr.w   r2, [pc, #0x3c]
0002f990  lsls    r3, r3, #3
0002f992  adds    r3, r3, r4
0002f994  add     r2, pc ; -> 0x00030061  t_local_reaction_exit
0002f996  str     r2, [r3, #4]
0002f998  ldr.w   r3, [r4, #0xa4]
0002f99c  mov     r0, r8
0002f99e  adds    r3, #1
0002f9a0  str.w   r8, [r4, r3, lsl #3]
0002f9a4  b       #0x2f8e0
0002f9a6  ldr.w   r2, [pc, #0x28]
0002f9aa  lsls    r3, r3, #3
0002f9ac  adds    r3, r3, r4
0002f9ae  add     r2, pc ; -> 0x00030061  t_local_reaction_exit
0002f9b0  str     r2, [r3, #4]
0002f9b2  ldr.w   r3, [r4, #0xa4]
0002f9b6  adds    r3, #1
0002f9b8  str.w   r8, [r4, r3, lsl #3]
0002f9bc  b       #0x2f938
0002f9be  nop     
0002f9c0  lsls    r7, r4, #0x1d
0002f9c2  movs    r0, r0
0002f9c4  subs    r7, #0x16
0002f9c6  movs    r4, r1
0002f9c8  lsls    r3, r4, #0x1b
0002f9ca  movs    r0, r0
0002f9cc  lsls    r1, r1, #0x1b
0002f9ce  movs    r0, r0
0002f9d0  lsls    r7, r5, #0x1a
0002f9d2  movs    r0, r0
