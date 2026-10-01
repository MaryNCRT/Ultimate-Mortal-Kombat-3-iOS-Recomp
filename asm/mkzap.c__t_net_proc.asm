========================================================================
t_net_proc  0x000788f4  368 bytes   mkzap.c
========================================================================

000788f4  push    {r4, r5, r6, r7, lr}
000788f6  add     r7, sp, #0xc
000788f8  str     r8, [sp, #-0x4]!
000788fc  ldr.w   r2, [r0, #0xa4]
00078900  movw    r8, #0xebf
00078904  mov     r5, r0
00078906  adds    r3, r2, #1
00078908  ldr.w   r4, [r0, #0x108]
0007890c  ldr.w   r6, [r0, r3, lsl #3]
00078910  cmp     r6, r8
00078912  beq     #0x7899e
00078914  ble     #0x7892e
00078916  movw    r3, #0xedc
0007891a  cmp     r6, r3
0007891c  beq     #0x789f6
0007891e  adds    r3, #0x11
00078920  cmp     r6, r3
00078922  beq     #0x78984
00078924  mvn     r0, #2
00078928  ldr     r8, [sp], #4
0007892c  pop     {r4, r5, r6, r7, pc}
0007892e  cmp     r6, #0
00078930  bne     #0x78924
00078932  mov     r0, r4
00078934  movs    r3, #1
00078936  str     r3, [r4, #0x40]
00078938  bl      #0x55228 ; -> get_char_ani2
0007893c  ldr     r2, [r4, #8]
0007893e  mov.w   r3, #0x8000
00078942  mov     r0, r4
00078944  str     r3, [r2, #0x1c]
00078946  add.w   r3, r3, #0x58000
0007894a  str     r3, [r4, #0x1c]
0007894c  movs    r3, #2
0007894e  str     r3, [r4, #0x20]
00078950  bl      #0x75d6c ; -> set_proj_vel
00078954  movs    r3, #0x11
00078956  str     r3, [r4, #0x48]
00078958  ldr.w   r3, [r5, #0xa4]
0007895c  ldr     r2, [pc, #0xf4]
0007895e  mov     r0, r6
00078960  adds    r3, #1
00078962  add     r2, pc ; -> 0x0007562d  tl_projectile_flight
00078964  str.w   r8, [r5, r3, lsl #3]
00078968  ldr.w   r3, [r5, #0xa4]
0007896c  adds    r3, #1
0007896e  str.w   r3, [r5, #0xa4]
00078972  lsls    r3, r3, #3
00078974  adds    r3, r3, r5
00078976  str     r2, [r3, #4]
00078978  ldr.w   r3, [r5, #0xa4]
0007897c  adds    r3, #1
0007897e  str.w   r6, [r5, r3, lsl #3]
00078982  b       #0x78928
00078984  ldr.w   r1, [pc, #0xd0]
00078988  add     r1, pc ; -> 0x00075665  tl_delete_proj_and_die
0007898a  lsls    r3, r2, #3
0007898c  adds    r3, r3, r5
0007898e  movs    r0, #0
00078990  str     r1, [r3, #4]
00078992  ldr.w   r3, [r5, #0xa4]
00078996  adds    r3, #1
00078998  str.w   r0, [r5, r3, lsl #3]
0007899c  b       #0x78928
0007899e  ldr     r0, [r4, #8]
000789a0  bl      #0x55a60 ; -> stop_a8
000789a4  mov     r0, r4
000789a6  movs    r3, #1
000789a8  str     r3, [r4, #0x40]
000789aa  bl      #0x55460 ; -> find_ani2_part2
000789ae  mov     r0, r4
000789b0  movs    r3, #4
000789b2  str     r3, [r4, #0x1c]
000789b4  bl      #0x553a0 ; -> init_anirate
000789b8  ldr     r3, [r4]
000789ba  ldr     r2, [r3, #4]
000789bc  str     r2, [r4, #0x1c]
000789be  ldr     r3, [r3, #4]
000789c0  ldr     r2, [r4, #8]
000789c2  mov     r0, r4
000789c4  ldrh    r3, [r3, #0xe]
000789c6  strh    r3, [r2, #0xe]
000789c8  ldr     r3, [r4]
000789ca  ldr     r2, [r4, #8]
000789cc  ldr     r3, [r3, #4]
000789ce  ldrh    r3, [r3, #0x12]
000789d0  strh    r3, [r2, #0x12]
000789d2  mvn     r3, #0x1f
000789d6  str     r3, [r4, #0x1c]
000789d8  adds    r3, #0x62
000789da  str     r3, [r4, #0x20]
000789dc  bl      #0x570ac ; -> multi_adjust_xy
000789e0  ldr.w   r3, [r5, #0xa4]
000789e4  movs    r0, #1
000789e6  movw    r2, #0xedc
000789ea  adds    r3, #1
000789ec  str.w   r2, [r5, r3, lsl #3]
000789f0  str.w   r0, [r5, #0xfc]
000789f4  b       #0x78928
000789f6  mov     r0, r4
000789f8  bl      #0x5a680 ; -> next_anirate
000789fc  ldr     r0, [r4]
000789fe  ldr     r0, [r0]
00078a00  bl      #0x575cc ; -> GetProcFunc
00078a04  ldr.w   r3, [pc, #0x54]
00078a08  add     r3, pc ; -> 0x000f33d0  t_net_sleep
00078a0a  ldr     r3, [r3]
00078a0c  cmp     r0, r3
00078a0e  beq     #0x78a50
00078a10  mov     r0, r4
00078a12  movs    r3, #0x15
00078a14  str     r3, [r4, #0x1c]
00078a16  bl      #0x57be4 ; -> ochar_sound
00078a1a  mov     r0, r4
00078a1c  movs    r3, #1
00078a1e  str     r3, [r4, #0x40]
00078a20  bl      #0x55460 ; -> find_ani2_part2
00078a24  mov     r0, r4
00078a26  bl      #0x55450 ; -> find_part2
00078a2a  movs    r3, #2
00078a2c  str     r3, [r4, #0x1c]
00078a2e  ldr.w   r3, [r5, #0xa4]
00078a32  movw    r2, #0xeed
00078a36  adds    r3, #1
00078a38  str.w   r2, [r5, r3, lsl #3]
00078a3c  ldr.w   r3, [r5, #0xa4]
00078a40  adds    r2, r3, #1
00078a42  ldr.w   r3, [pc, #0x1c]
00078a46  str.w   r2, [r5, #0xa4]
00078a4a  add     r3, pc ; -> 0x000f37cc  t_mframew
00078a4c  ldr     r1, [r3]
00078a4e  b       #0x7898a
00078a50  ldr     r3, [r4]
00078a52  b       #0x789be
00078a54  ldm     r4!, {r0, r1, r2, r6, r7}
