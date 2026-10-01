========================================================================
c_caught_net  0x0006f420  196 bytes   mkdrone.c
========================================================================

0006f420  push    {r4, r5, r6, r7, lr}
0006f422  add     r7, sp, #0xc
0006f424  ldr.w   r3, [r0, #0xa4]
0006f428  mov     r4, r0
0006f42a  ldr.w   r5, [r0, #0x108]
0006f42e  adds    r3, #1
0006f430  ldr.w   r6, [r0, r3, lsl #3]
0006f434  cbnz    r6, #0x6f45e
0006f436  mov     r0, r5
0006f438  bl      #0x6c9f4 ; -> should_i_promove
0006f43c  ldr     r3, [r5, #0x5c]
0006f43e  cmp     r3, #0
0006f440  bne     #0x6f4ae
0006f442  ldr     r2, [pc, #0x90]
0006f444  ldr.w   r3, [r4, #0xa4]
0006f448  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006f44a  lsls    r3, r3, #3
0006f44c  adds    r3, r3, r4
0006f44e  mov     r0, r6
0006f450  str     r2, [r3, #4]
0006f452  ldr.w   r3, [r4, #0xa4]
0006f456  adds    r3, #1
0006f458  str.w   r6, [r4, r3, lsl #3]
0006f45c  pop     {r4, r5, r6, r7, pc}
0006f45e  movw    r3, #0x10ec
0006f462  cmp     r6, r3
0006f464  it      ne
0006f466  mvnne   r0, #2
0006f46a  bne     #0x6f45c
0006f46c  mov     r0, r5
0006f46e  bl      #0x55060 ; -> is_he_airborn
0006f472  ldr     r0, [r5, #0x5c]
0006f474  cbz     r0, #0x6f492
0006f476  ldr.w   r3, [r4, #0xa4]
0006f47a  ldr     r2, [pc, #0x5c]
0006f47c  movs    r0, #0
0006f47e  lsls    r3, r3, #3
0006f480  adds    r3, r3, r4
0006f482  add     r2, pc ; -> 0x000676a1  t_d_uppercut
0006f484  str     r2, [r3, #4]
0006f486  ldr.w   r3, [r4, #0xa4]
0006f48a  adds    r3, #1
0006f48c  str.w   r0, [r4, r3, lsl #3]
0006f490  b       #0x6f45c
0006f492  ldr.w   r3, [r4, #0xa4]
0006f496  ldr.w   r2, [pc, #0x44]
0006f49a  lsls    r3, r3, #3
0006f49c  adds    r3, r3, r4
0006f49e  add     r2, pc ; -> 0x000722c9  t_run_in_close_now
0006f4a0  str     r2, [r3, #4]
0006f4a2  ldr.w   r3, [r4, #0xa4]
0006f4a6  adds    r3, #1
0006f4a8  str.w   r0, [r4, r3, lsl #3]
0006f4ac  b       #0x6f45c
0006f4ae  movs    r3, #0x30
0006f4b0  str     r3, [r5, #0x44]
0006f4b2  adds    r3, #0x10
0006f4b4  str     r3, [r5, #0x48]
0006f4b6  ldr.w   r3, [r4, #0xa4]
0006f4ba  movw    r2, #0x10ec
0006f4be  adds    r3, #1
0006f4c0  str.w   r2, [r4, r3, lsl #3]
0006f4c4  ldr     r2, [pc, #0x18]
0006f4c6  ldr.w   r3, [r4, #0xa4]
0006f4ca  add     r2, pc ; -> 0x0006fcf5  t_d_run_a11
0006f4cc  adds    r3, #1
0006f4ce  str.w   r3, [r4, #0xa4]
0006f4d2  b       #0x6f44a
0006f4d4  ldm     r5, {r0, r3, r4, r5}
0006f4d6  vrshr.u32 d24, d11, #1
