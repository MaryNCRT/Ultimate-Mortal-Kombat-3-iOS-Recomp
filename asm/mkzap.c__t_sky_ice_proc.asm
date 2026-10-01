========================================================================
t_sky_ice_proc  0x000776b0  356 bytes   mkzap.c
========================================================================

000776b0  push    {r4, r5, r6, r7, lr}
000776b2  add     r7, sp, #0xc
000776b4  ldr.w   r1, [r0, #0xa4]
000776b8  movw    r6, #0x11df
000776bc  mov     r5, r0
000776be  adds    r3, r1, #1
000776c0  ldr.w   r4, [r0, #0x108]
000776c4  ldr.w   r3, [r0, r3, lsl #3]
000776c8  cmp     r3, r6
000776ca  beq     #0x77742
000776cc  ble     #0x776e2
000776ce  movw    r2, #0x11ee
000776d2  cmp     r3, r2
000776d4  beq     #0x77788
000776d6  adds    r2, #0x1a
000776d8  cmp     r3, r2
000776da  beq     #0x7772a
000776dc  mvn     r0, #2
000776e0  pop     {r4, r5, r6, r7, pc}
000776e2  cmp     r3, #0
000776e4  bne     #0x776dc
000776e6  mov     r0, r4
000776e8  bl      #0x55450 ; -> find_part2
000776ec  ldr     r3, [r4]
000776ee  ldr     r2, [r4, #0x48]
000776f0  mov     r0, r4
000776f2  ldr     r3, [r3, #4]
000776f4  ldrsh.w r3, [r3, #0xe]
000776f8  adds    r3, r3, r2
000776fa  ldr     r2, [r4, #8]
000776fc  str     r3, [r4, #0x1c]
000776fe  strh    r3, [r2, #0xe]
00077700  bl      #0x59e24 ; -> do_next_a9_frame
00077704  ldr     r3, [pc, #0xf8]
00077706  ldr     r0, [r4, #8]
00077708  add     r3, pc ; -> 0x000f357c  G
0007770a  ldr     r3, [r3]
0007770c  ldr.w   r3, [r3, #0x464]
00077710  sub.w   r3, r3, #0x1b0
00077714  str     r3, [r4, #0x1c]
00077716  strh    r3, [r0, #0x12]
00077718  ldr.w   r3, [r5, #0xa4]
0007771c  movs    r0, #8
0007771e  adds    r3, #1
00077720  str.w   r6, [r5, r3, lsl #3]
00077724  str.w   r0, [r5, #0xfc]
00077728  b       #0x776e0
0007772a  ldr     r2, [pc, #0xd8]
0007772c  lsls    r3, r1, #3
0007772e  adds    r3, r3, r0
00077730  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
00077732  str     r2, [r3, #4]
00077734  ldr.w   r3, [r0, #0xa4]
00077738  movs    r0, #0
0007773a  adds    r3, #1
0007773c  str.w   r0, [r5, r3, lsl #3]
00077740  b       #0x776e0
00077742  mov     r0, r4
00077744  movs    r3, #1
00077746  str     r3, [r4, #0x1c]
00077748  bl      #0x57be4 ; -> ochar_sound
0007774c  ldr     r2, [r4, #8]
0007774e  ldrsh.w r3, [r2, #0x12]
00077752  add.w   r3, r3, #0x100
00077756  strh    r3, [r2, #0x12]
00077758  ldr     r3, [r4, #8]
0007775a  mov.w   r2, #0xb0000
0007775e  str     r2, [r4, #0x1c]
00077760  str     r2, [r3, #0x1c]
00077762  ldr.w   r3, [pc, #0xa4]
00077766  add     r3, pc ; -> 0x000f357c  G
00077768  ldr     r3, [r3]
0007776a  ldr.w   r3, [r3, #0xac]
0007776e  subs    r3, #0xc0
00077770  str     r3, [r4, #0x44]
00077772  ldr.w   r3, [r5, #0xa4]
00077776  movs    r0, #1
00077778  movw    r2, #0x11ee
0007777c  adds    r3, #1
0007777e  str.w   r2, [r5, r3, lsl #3]
00077782  str.w   r0, [r5, #0xfc]
00077786  b       #0x776e0
00077788  movs    r3, #0x12
0007778a  mov     r0, r4
0007778c  str     r3, [r4, #0x1c]
0007778e  bl      #0x75f5c ; -> proj_strike_check
00077792  ldr     r3, [r4, #0x5c]
00077794  cbnz    r3, #0x777b2
00077796  ldr     r0, [r4, #8]
00077798  ldr     r2, [r4, #0x44]
0007779a  ldrsh.w r3, [r0, #0x12]
0007779e  cmp     r3, r2
000777a0  str     r3, [r4, #0x1c]
000777a2  blt     #0x77772
000777a4  bl      #0x55a60 ; -> stop_a8
000777a8  ldr     r3, [r4, #8]
000777aa  ldrh.w  r2, [r4, #0x44]
000777ae  strh    r2, [r3, #0x12]
000777b0  b       #0x777c8
000777b2  ldr.w   r3, [pc, #0x58]
000777b6  mov     r0, r4
000777b8  str     r3, [r4, #0x1c]
000777ba  bl      #0x57c18 ; -> hob_ochar_sound
000777be  ldr     r3, [r4, #8]
000777c0  mov.w   r2, #0x40000
000777c4  str     r2, [r4, #0x1c]
000777c6  str     r2, [r3, #0x1c]
000777c8  movs    r3, #3
000777ca  str     r3, [r4, #0x1c]
000777cc  ldr.w   r3, [r5, #0xa4]
000777d0  movw    r2, #0x1208
000777d4  movs    r0, #0
000777d6  adds    r3, #1
000777d8  str.w   r2, [r5, r3, lsl #3]
000777dc  ldr.w   r3, [r5, #0xa4]
000777e0  adds    r2, r3, #1
000777e2  ldr     r3, [pc, #0x2c]
000777e4  str.w   r2, [r5, #0xa4]
000777e8  add     r3, pc ; -> 0x000f37cc  t_mframew
000777ea  ldr     r1, [r3]
000777ec  lsls    r3, r2, #3
000777ee  adds    r3, r3, r5
000777f0  str     r1, [r3, #4]
000777f2  ldr.w   r3, [r5, #0xa4]
000777f6  adds    r3, #1
000777f8  str.w   r0, [r5, r3, lsl #3]
000777fc  b       #0x776e0
000777fe  nop     
00077800  bkpt    #0x70
00077802  movs    r7, r0
00077804  svc     #0x31
00077806  vcvt.f32.u32 d27, d2, #1
0007780a  movs    r7, r0
0007780c  movs    r3, r0
0007780e  movs    r2, r0
00077810  hint    #0xe
00077812  movs    r7, r0
