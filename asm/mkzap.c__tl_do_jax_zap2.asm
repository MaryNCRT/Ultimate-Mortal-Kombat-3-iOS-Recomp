========================================================================
tl_do_jax_zap2  0x00079818  296 bytes   mkzap.c
========================================================================

00079818  push    {r4, r5, r6, r7, lr}
0007981a  add     r7, sp, #0xc
0007981c  str     r8, [sp, #-0x4]!
00079820  ldr.w   r3, [r0, #0xa4]
00079824  movw    r8, #0x1277
00079828  mov     r6, r0
0007982a  adds    r3, #1
0007982c  ldr.w   r5, [r0, #0x108]
00079830  ldr.w   r4, [r0, r3, lsl #3]
00079834  cmp     r4, r8
00079836  beq     #0x798cc
00079838  ble     #0x79852
0007983a  movw    r3, #0x127a
0007983e  cmp     r4, r3
00079840  beq     #0x798e8
00079842  adds    r3, #0xf
00079844  cmp     r4, r3
00079846  beq     #0x7988e
00079848  mvn     r0, #2
0007984c  ldr     r8, [sp], #4
00079850  pop     {r4, r5, r6, r7, pc}
00079852  cmp     r4, #0
00079854  bne     #0x79848
00079856  movs    r3, #4
00079858  mov     r0, r5
0007985a  str     r3, [r5, #0x20]
0007985c  str     r4, [r5, #0x44]
0007985e  bl      #0x79590 ; -> zap_init_special_act
00079862  ldr.w   r3, [r6, #0xa4]
00079866  ldr     r2, [pc, #0xc8]
00079868  mov     r0, r4
0007986a  adds    r3, #1
0007986c  add     r2, pc ; -> 0x000772f9  tl_jax_zap_jsrp
0007986e  str.w   r8, [r6, r3, lsl #3]
00079872  ldr.w   r3, [r6, #0xa4]
00079876  adds    r3, #1
00079878  str.w   r3, [r6, #0xa4]
0007987c  lsls    r3, r3, #3
0007987e  adds    r3, r3, r6
00079880  str     r2, [r3, #4]
00079882  ldr.w   r3, [r6, #0xa4]
00079886  adds    r3, #1
00079888  str.w   r4, [r6, r3, lsl #3]
0007988c  b       #0x7984c
0007988e  ldr.w   r3, [pc, #0xa4]
00079892  mov     r0, r5
00079894  add     r3, pc ; -> 0x000f357c  G
00079896  ldr     r3, [r3]
00079898  add.w   r3, r3, #0x410
0007989c  str     r3, [r5, #0x1c]
0007989e  bl      #0x5742c ; -> update_tsl
000798a2  mov     r0, r5
000798a4  bl      #0x55c04 ; -> stop_me_player
000798a8  movs    r3, #7
000798aa  str     r3, [r5, #0x1c]
000798ac  ldr.w   r3, [pc, #0x88]
000798b0  movs    r0, #0
000798b2  add     r3, pc ; -> 0x000f37cc  t_mframew
000798b4  ldr     r2, [r3]
000798b6  ldr.w   r3, [r6, #0xa4]
000798ba  lsls    r3, r3, #3
000798bc  adds    r3, r3, r6
000798be  str     r2, [r3, #4]
000798c0  ldr.w   r3, [r6, #0xa4]
000798c4  adds    r3, #1
000798c6  str.w   r0, [r6, r3, lsl #3]
000798ca  b       #0x7984c
000798cc  mov     r0, r5
000798ce  bl      #0x59e24 ; -> do_next_a9_frame
000798d2  ldr.w   r3, [r6, #0xa4]
000798d6  movs    r0, #6
000798d8  movw    r2, #0x127a
000798dc  adds    r3, #1
000798de  str.w   r2, [r6, r3, lsl #3]
000798e2  str.w   r0, [r6, #0xfc]
000798e6  b       #0x7984c
000798e8  mov     r0, r5
000798ea  movs    r3, #0
000798ec  str     r3, [r5, #0x1c]
000798ee  bl      #0x57be4 ; -> ochar_sound
000798f2  ldr     r3, [pc, #0x48]
000798f4  mov     r0, r5
000798f6  add     r3, pc ; -> 0x0007753d  t_jax_zap_proc
000798f8  str     r3, [r5, #0x38]
000798fa  bl      #0x75964 ; -> create_proj_proc
000798fe  movs    r3, #1
00079900  str     r3, [r5, #0x20]
00079902  cbz     r0, #0x79908
00079904  ldr     r0, [r0]
00079906  str     r3, [r0, #0x34]
00079908  mov     r0, r5
0007990a  mov.w   r3, #0x40000
0007990e  str     r3, [r5, #0x1c]
00079910  bl      #0x55ab0 ; -> away_x_vel
00079914  mov     r0, r5
00079916  bl      #0x59e24 ; -> do_next_a9_frame
0007991a  ldr.w   r3, [r6, #0xa4]
0007991e  movs    r0, #0x20
00079920  movw    r2, #0x1289
00079924  adds    r3, #1
00079926  str.w   r2, [r6, r3, lsl #3]
0007992a  str.w   r0, [r6, #0xfc]
0007992e  b       #0x7984c
00079930  bge     #0x79846
