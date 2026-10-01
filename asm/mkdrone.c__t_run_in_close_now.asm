========================================================================
t_run_in_close_now  0x000722c8  260 bytes   mkdrone.c
========================================================================

000722c8  push    {r4, r5, r6, r7, lr}
000722ca  add     r7, sp, #0xc
000722cc  ldr.w   r3, [r0, #0xa4]
000722d0  mov     r4, r0
000722d2  ldr.w   r5, [r0, #0x108]
000722d6  adds    r3, #1
000722d8  ldr.w   r0, [r0, r3, lsl #3]
000722dc  cbnz    r0, #0x72312
000722de  movs    r3, #0x40
000722e0  str     r3, [r5, #0x44]
000722e2  str     r3, [r5, #0x48]
000722e4  ldr.w   r3, [r4, #0xa4]
000722e8  movw    r2, #0x236
000722ec  adds    r3, #1
000722ee  str.w   r2, [r4, r3, lsl #3]
000722f2  ldr     r2, [pc, #0xbc]
000722f4  ldr.w   r3, [r4, #0xa4]
000722f8  add     r2, pc ; -> 0x0006fcf5  t_d_run_a11
000722fa  adds    r3, #1
000722fc  str.w   r3, [r4, #0xa4]
00072300  lsls    r3, r3, #3
00072302  adds    r3, r3, r4
00072304  str     r2, [r3, #4]
00072306  ldr.w   r3, [r4, #0xa4]
0007230a  adds    r3, #1
0007230c  str.w   r0, [r4, r3, lsl #3]
00072310  pop     {r4, r5, r6, r7, pc}
00072312  movw    r3, #0x236
00072316  cmp     r0, r3
00072318  it      ne
0007231a  mvnne   r0, #2
0007231e  bne     #0x72310
00072320  mov     r0, r5
00072322  bl      #0x55060 ; -> is_he_airborn
00072326  ldr     r6, [r5, #0x5c]
00072328  cbnz    r6, #0x7235a
0007232a  ldr.w   r3, [pc, #0x88]
0007232e  add     r3, pc ; -> 0x000f357c  G
00072330  ldr     r3, [r3]
00072332  ldrsh.w r3, [r3, #0x44c]
00072336  cmp     r3, #4
00072338  str     r3, [r5, #0x1c]
0007233a  ble     #0x72376
0007233c  ldr.w   r2, [pc, #0x78]
00072340  add     r2, pc ; -> 0x0006783d  t_run_in_close_hard
00072342  ldr.w   r3, [r4, #0xa4]
00072346  mov     r0, r6
00072348  lsls    r3, r3, #3
0007234a  adds    r3, r3, r4
0007234c  str     r2, [r3, #4]
0007234e  ldr.w   r3, [r4, #0xa4]
00072352  adds    r3, #1
00072354  str.w   r6, [r4, r3, lsl #3]
00072358  b       #0x72310
0007235a  ldr.w   r3, [r4, #0xa4]
0007235e  ldr     r2, [pc, #0x5c]
00072360  movs    r0, #0
00072362  lsls    r3, r3, #3
00072364  adds    r3, r3, r4
00072366  add     r2, pc ; -> 0x00068415  t_d_fflip_jump
00072368  str     r2, [r3, #4]
0007236a  ldr.w   r3, [r4, #0xa4]
0007236e  adds    r3, #1
00072370  str.w   r0, [r4, r3, lsl #3]
00072374  b       #0x72310
00072376  mov     r0, r5
00072378  bl      #0x557cc ; -> is_he_short
0007237c  cbz     r0, #0x72386
0007237e  ldr.w   r2, [pc, #0x40]
00072382  add     r2, pc ; -> 0x0006f5c1  t_d_knee
00072384  b       #0x72342
00072386  ldr.w   r3, [pc, #0x3c]
0007238a  mov.w   r2, #0x24c
0007238e  add     r3, pc ; -> 0x00172510  funcs.7715
00072390  str     r3, [r5, #0x68]
00072392  movs    r3, #4
00072394  str     r3, [r5, #0x64]
00072396  ldr.w   r3, [r4, #0xa4]
0007239a  adds    r3, #1
0007239c  str.w   r2, [r4, r3, lsl #3]
000723a0  ldr     r2, [pc, #0x24]
000723a2  ldr.w   r3, [r4, #0xa4]
000723a6  add     r2, pc ; -> 0x00072e4d  t_random_do
000723a8  adds    r3, #1
000723aa  str.w   r3, [r4, #0xa4]
000723ae  b       #0x72300
000723b0  bls     #0x723a6
