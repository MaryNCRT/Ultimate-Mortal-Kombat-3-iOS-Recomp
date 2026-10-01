========================================================================
tl_do_kano_zap  0x000795a4  288 bytes   mkzap.c
========================================================================

000795a4  push    {r4, r5, r6, r7, lr}
000795a6  add     r7, sp, #0xc
000795a8  ldr.w   r3, [r0, #0xa4]
000795ac  mov     r5, r0
000795ae  ldr.w   r4, [r0, #0x108]
000795b2  adds    r3, #1
000795b4  ldr.w   r3, [r0, r3, lsl #3]
000795b8  cmp.w   r3, #0x1320
000795bc  beq     #0x79640
000795be  ble     #0x795d4
000795c0  movw    r2, #0x1324
000795c4  cmp     r3, r2
000795c6  beq     #0x7967e
000795c8  adds    r2, #5
000795ca  cmp     r3, r2
000795cc  beq     #0x7960c
000795ce  mvn     r0, #2
000795d2  pop     {r4, r5, r6, r7, pc}
000795d4  cmp     r3, #0
000795d6  bne     #0x795ce
000795d8  str     r3, [r4, #0x44]
000795da  movs    r6, #1
000795dc  mov     r0, r4
000795de  str     r6, [r4, #0x20]
000795e0  bl      #0x79590 ; -> zap_init_special_act
000795e4  mov     r0, r4
000795e6  str     r6, [r4, #0x1c]
000795e8  bl      #0x57be4 ; -> ochar_sound
000795ec  mov     r0, r4
000795ee  movs    r3, #0x24
000795f0  str     r3, [r4, #0x40]
000795f2  bl      #0x5a028 ; -> pose_a9_manual
000795f6  ldr.w   r3, [r5, #0xa4]
000795fa  movs    r0, #3
000795fc  mov.w   r2, #0x1320
00079600  adds    r3, r3, r6
00079602  str.w   r2, [r5, r3, lsl #3]
00079606  str.w   r0, [r5, #0xfc]
0007960a  b       #0x795d2
0007960c  ldr     r3, [pc, #0xa0]
0007960e  mov     r0, r4
00079610  add     r3, pc ; -> 0x000f357c  G
00079612  ldr     r3, [r3]
00079614  add.w   r3, r3, #0x440
00079618  str     r3, [r4, #0x1c]
0007961a  bl      #0x5742c ; -> update_tsl
0007961e  movs    r3, #0x18
00079620  str     r3, [r4, #0x20]
00079622  ldr.w   r3, [r5, #0xa4]
00079626  ldr.w   r2, [pc, #0x8c]
0007962a  movs    r0, #0
0007962c  lsls    r3, r3, #3
0007962e  adds    r3, r3, r5
00079630  add     r2, pc ; -> 0x00075699  tl_do_proj_sitting_duck
00079632  str     r2, [r3, #4]
00079634  ldr.w   r3, [r5, #0xa4]
00079638  adds    r3, #1
0007963a  str.w   r0, [r5, r3, lsl #3]
0007963e  b       #0x795d2
00079640  mov     r0, r4
00079642  bl      #0x78250 ; -> setup_proj_obj
00079646  movs    r3, #3
00079648  str     r3, [r4, #0x1c]
0007964a  ldr.w   r3, [r5, #0xa4]
0007964e  movw    r2, #0x1324
00079652  adds    r3, #1
00079654  str.w   r2, [r5, r3, lsl #3]
00079658  ldr.w   r3, [r5, #0xa4]
0007965c  adds    r2, r3, #1
0007965e  ldr.w   r3, [pc, #0x58]
00079662  str.w   r2, [r5, #0xa4]
00079666  add     r3, pc ; -> 0x000f36a8  t_double_mframew
00079668  ldr     r1, [r3]
0007966a  lsls    r3, r2, #3
0007966c  adds    r3, r3, r5
0007966e  movs    r0, #0
00079670  str     r1, [r3, #4]
00079672  ldr.w   r3, [r5, #0xa4]
00079676  adds    r3, #1
00079678  str.w   r0, [r5, r3, lsl #3]
0007967c  b       #0x795d2
0007967e  ldr.w   r3, [pc, #0x3c]
00079682  mov     r0, r4
00079684  add     r3, pc ; -> 0x0007667d  t_kano_zap_proc
00079686  str     r3, [r4, #0x38]
00079688  bl      #0x75964 ; -> create_proj_proc
0007968c  movs    r3, #4
0007968e  str     r3, [r4, #0x1c]
00079690  ldr.w   r3, [r5, #0xa4]
00079694  movw    r2, #0x1329
00079698  adds    r3, #1
0007969a  str.w   r2, [r5, r3, lsl #3]
0007969e  ldr.w   r3, [r5, #0xa4]
000796a2  adds    r2, r3, #1
000796a4  ldr     r3, [pc, #0x18]
000796a6  str.w   r2, [r5, #0xa4]
000796aa  add     r3, pc ; -> 0x000f37cc  t_mframew
000796ac  b       #0x79668
000796ae  nop     
000796b0  ldr     r7, [sp, #0x1a0]
000796b2  movs    r7, r0
000796b4  stm     r0!, {r0, r2, r5, r6}
000796b6  vshr.u32 d26, d30, #1
000796ba  movs    r7, r0
000796bc  ldm     r7, {r0, r2, r4, r5, r6, r7}
000796be  vsra.u32 d26, d14, #1
000796c2  movs    r7, r0
