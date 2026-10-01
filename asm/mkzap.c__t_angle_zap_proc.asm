========================================================================
t_angle_zap_proc  0x00076158  368 bytes   mkzap.c
========================================================================

00076158  push    {r4, r5, r6, r7, lr}
0007615a  add     r7, sp, #0xc
0007615c  str     r8, [sp, #-0x4]!
00076160  ldr.w   r2, [r0, #0xa4]
00076164  movw    r1, #0xdce
00076168  mov     r4, r0
0007616a  adds    r3, r2, #1
0007616c  ldr.w   r6, [r0, #0x108]
00076170  ldr.w   r5, [r0, r3, lsl #3]
00076174  cmp     r5, r1
00076176  beq     #0x76224
00076178  ble     #0x7619a
0007617a  movw    r8, #0xdd4
0007617e  cmp     r5, r8
00076180  beq     #0x76246
00076182  movw    r3, #0xddc
00076186  cmp     r5, r3
00076188  beq     #0x7620a
0007618a  cmp.w   r5, #0xdd0
0007618e  beq     #0x76282
00076190  mvn     r0, #2
00076194  ldr     r8, [sp], #4
00076198  pop     {r4, r5, r6, r7, pc}
0007619a  cbz     r5, #0x761ca
0007619c  movw    r2, #0xdcd
000761a0  cmp     r5, r2
000761a2  bne     #0x76190
000761a4  ldr     r2, [pc, #0x104]
000761a6  str.w   r1, [r0, r3, lsl #3]
000761aa  ldr.w   r3, [r0, #0xa4]
000761ae  add     r2, pc ; -> 0x00077011  t_angle_zap_jsrp
000761b0  adds    r3, #1
000761b2  str.w   r3, [r0, #0xa4]
000761b6  lsls    r3, r3, #3
000761b8  adds    r3, r3, r4
000761ba  movs    r0, #0
000761bc  str     r2, [r3, #4]
000761be  ldr.w   r3, [r4, #0xa4]
000761c2  adds    r3, #1
000761c4  str.w   r0, [r4, r3, lsl #3]
000761c8  b       #0x76194
000761ca  mov     r0, r6
000761cc  movs    r3, #0x3f
000761ce  str     r3, [r6, #0x40]
000761d0  bl      #0x5520c ; -> get_char_ani
000761d4  movs    r3, #0x12
000761d6  str     r3, [r6, #0x48]
000761d8  ldr.w   r3, [r4, #0xa4]
000761dc  movw    r2, #0xdcd
000761e0  mov     r0, r5
000761e2  adds    r3, #1
000761e4  str.w   r2, [r4, r3, lsl #3]
000761e8  ldr.w   r3, [r4, #0xa4]
000761ec  ldr.w   r2, [pc, #0xc0]
000761f0  adds    r3, #1
000761f2  str.w   r3, [r4, #0xa4]
000761f6  lsls    r3, r3, #3
000761f8  adds    r3, r3, r4
000761fa  add     r2, pc ; -> 0x00077011  t_angle_zap_jsrp
000761fc  str     r2, [r3, #4]
000761fe  ldr.w   r3, [r4, #0xa4]
00076202  adds    r3, #1
00076204  str.w   r5, [r4, r3, lsl #3]
00076208  b       #0x76194
0007620a  ldr.w   r1, [pc, #0xa8]
0007620e  lsls    r3, r2, #3
00076210  adds    r3, r3, r0
00076212  add     r1, pc ; -> 0x00078e25  t_angle_zap_hit
00076214  str     r1, [r3, #4]
00076216  ldr.w   r3, [r0, #0xa4]
0007621a  movs    r0, #0
0007621c  adds    r3, #1
0007621e  str.w   r0, [r4, r3, lsl #3]
00076222  b       #0x76194
00076224  movs    r3, #0x13
00076226  str     r3, [r6, #0x48]
00076228  ldr.w   r3, [r0, #0xa4]
0007622c  mov.w   r2, #0xdd0
00076230  adds    r3, #1
00076232  str.w   r2, [r0, r3, lsl #3]
00076236  ldr     r2, [pc, #0x80]
00076238  ldr.w   r3, [r0, #0xa4]
0007623c  add     r2, pc ; -> 0x00077011  t_angle_zap_jsrp
0007623e  adds    r3, #1
00076240  str.w   r3, [r0, #0xa4]
00076244  b       #0x761b6
00076246  movs    r3, #0x14
00076248  str     r3, [r6, #0x48]
0007624a  ldr     r3, [r6, #8]
0007624c  mov.w   r2, #0x80000
00076250  mov     r0, r6
00076252  str     r2, [r6, #0x1c]
00076254  str     r2, [r3, #0x1c]
00076256  movs    r3, #4
00076258  str     r3, [r6, #0x20]
0007625a  bl      #0x75d6c ; -> set_proj_vel
0007625e  ldr     r3, [pc, #0x5c]
00076260  movw    r2, #0xddc
00076264  add     r3, pc ; -> 0x00076389  t_angle_zap_call
00076266  str     r3, [r6, #0x34]
00076268  ldr.w   r3, [r4, #0xa4]
0007626c  adds    r3, #1
0007626e  str.w   r2, [r4, r3, lsl #3]
00076272  ldr     r2, [pc, #0x4c]
00076274  ldr.w   r3, [r4, #0xa4]
00076278  add     r2, pc ; -> 0x00075919  tl_projectile_flight_call
0007627a  adds    r3, #1
0007627c  str.w   r3, [r4, #0xa4]
00076280  b       #0x761b6
00076282  mov     r0, r6
00076284  movs    r3, #9
00076286  str     r3, [r6, #0x1c]
00076288  str     r3, [r6, #0x20]
0007628a  bl      #0x570ac ; -> multi_adjust_xy
0007628e  ldr.w   r3, [r4, #0xa4]
00076292  ldr.w   r2, [pc, #0x30]
00076296  adds    r3, #1
00076298  add     r2, pc ; -> 0x00077011  t_angle_zap_jsrp
0007629a  str.w   r8, [r4, r3, lsl #3]
0007629e  ldr.w   r3, [r4, #0xa4]
000762a2  adds    r3, #1
000762a4  str.w   r3, [r4, #0xa4]
000762a8  b       #0x761b6
000762aa  nop     
000762ac  lsrs    r7, r3, #0x19
000762ae  movs    r0, r0
000762b0  lsrs    r3, r2, #0x18
000762b2  movs    r0, r0
000762b4  cmp     r4, #0xf
000762b6  movs    r0, r0
000762b8  lsrs    r1, r2, #0x17
000762ba  movs    r0, r0
000762bc  lsls    r1, r4, #4
000762be  movs    r0, r0
000762c0  bl      #0xfff142c2
000762c4  lsrs    r5, r6, #0x15
000762c6  movs    r0, r0
