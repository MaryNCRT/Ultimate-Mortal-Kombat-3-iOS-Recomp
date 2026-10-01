========================================================================
t_boomerang_proc  0x000780e8  324 bytes   mkzap.c
========================================================================

000780e8  push    {r4, r5, r6, r7, lr}
000780ea  add     r7, sp, #0xc
000780ec  push.w  {r8, sl}
000780f0  ldr.w   r3, [r0, #0xa4]
000780f4  movw    sl, #0x54e
000780f8  mov     r5, r0
000780fa  adds    r3, #1
000780fc  ldr.w   r4, [r0, #0x108]
00078100  ldr.w   r6, [r0, r3, lsl #3]
00078104  cmp     r6, sl
00078106  beq     #0x781aa
00078108  ble     #0x78122
0007810a  movw    r3, #0x559
0007810e  cmp     r6, r3
00078110  beq     #0x781ca
00078112  adds    r3, #0x11
00078114  cmp     r6, r3
00078116  beq     #0x78184
00078118  mvn     r0, #2
0007811c  pop.w   {r8, sl}
00078120  pop     {r4, r5, r6, r7, pc}
00078122  cmp     r6, #0
00078124  bne     #0x78118
00078126  ldr     r3, [r4]
00078128  mov     r0, r4
0007812a  mov.w   r8, #2
0007812e  str.w   r8, [r4, #0x1c]
00078132  str.w   r8, [r3, #0x2c]
00078136  movs    r3, #4
00078138  str     r3, [r4, #0x40]
0007813a  bl      #0x55228 ; -> get_char_ani2
0007813e  mov.w   r3, #0x90000
00078142  mov     r0, r4
00078144  str     r3, [r4, #0x1c]
00078146  str.w   r8, [r4, #0x20]
0007814a  bl      #0x75d6c ; -> set_proj_vel
0007814e  movs    r3, #0x14
00078150  str     r3, [r4, #0x48]
00078152  ldr     r3, [pc, #0xc4]
00078154  ldr     r2, [pc, #0xc4]
00078156  mov     r0, r6
00078158  add     r3, pc ; -> 0x00074fa9  t_boomerang_call
0007815a  str     r3, [r4, #0x34]
0007815c  ldr.w   r3, [r5, #0xa4]
00078160  add     r2, pc ; -> 0x00075919  tl_projectile_flight_call
00078162  adds    r3, #1
00078164  str.w   sl, [r5, r3, lsl #3]
00078168  ldr.w   r3, [r5, #0xa4]
0007816c  adds    r3, #1
0007816e  str.w   r3, [r5, #0xa4]
00078172  lsls    r3, r3, #3
00078174  adds    r3, r3, r5
00078176  str     r2, [r3, #4]
00078178  ldr.w   r3, [r5, #0xa4]
0007817c  adds    r3, #1
0007817e  str.w   r6, [r5, r3, lsl #3]
00078182  b       #0x7811c
00078184  mov     r0, r4
00078186  bl      #0x75714 ; -> proj_onscreen_test
0007818a  ldr     r0, [r4, #0x5c]
0007818c  cbz     r0, #0x781f0
0007818e  mov     r0, r4
00078190  bl      #0x5a680 ; -> next_anirate
00078194  ldr.w   r3, [r5, #0xa4]
00078198  movs    r0, #1
0007819a  movw    r2, #0x56a
0007819e  adds    r3, #1
000781a0  str.w   r2, [r5, r3, lsl #3]
000781a4  str.w   r0, [r5, #0xfc]
000781a8  b       #0x7811c
000781aa  ldr     r3, [r4, #0x18]
000781ac  cbnz    r3, #0x781f6
000781ae  mov     r0, r4
000781b0  bl      #0x5a680 ; -> next_anirate
000781b4  ldr.w   r3, [r5, #0xa4]
000781b8  movs    r0, #1
000781ba  movw    r2, #0x559
000781be  adds    r3, #1
000781c0  str.w   r2, [r5, r3, lsl #3]
000781c4  str.w   r0, [r5, #0xfc]
000781c8  b       #0x7811c
000781ca  mov     r0, r4
000781cc  bl      #0x75714 ; -> proj_onscreen_test
000781d0  ldr     r0, [r4, #0x5c]
000781d2  cmp     r0, #0
000781d4  bne     #0x781ae
000781d6  ldr     r2, [pc, #0x48]
000781d8  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
000781da  ldr.w   r3, [r5, #0xa4]
000781de  lsls    r3, r3, #3
000781e0  adds    r3, r3, r5
000781e2  str     r2, [r3, #4]
000781e4  ldr.w   r3, [r5, #0xa4]
000781e8  adds    r3, #1
000781ea  str.w   r0, [r5, r3, lsl #3]
000781ee  b       #0x7811c
000781f0  ldr     r2, [pc, #0x30]
000781f2  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
000781f4  b       #0x781da
000781f6  mov     r0, r4
000781f8  movs    r3, #2
000781fa  str     r3, [r4, #0x1c]
000781fc  bl      #0x553a0 ; -> init_anirate
00078200  ldr     r2, [pc, #0x24]
00078202  ldr     r3, [r4, #8]
00078204  str     r2, [r4, #0x20]
00078206  str     r2, [r3, #0x1c]
00078208  ldr     r2, [r4, #8]
0007820a  ldr     r3, [r2, #0x18]
0007820c  rsb.w   r3, r3, #0
00078210  str     r3, [r4, #0x1c]
00078212  str     r3, [r2, #0x18]
00078214  b       #0x7818e
00078216  nop     
00078218  ldm     r6, {r0, r2, r3, r6}
0007821a  vqshl.u64 d29, d21, #0x3f
