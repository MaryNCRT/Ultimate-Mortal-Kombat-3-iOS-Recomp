========================================================================
t_blade_proc  0x00077f7c  364 bytes   mkzap.c
========================================================================

00077f7c  push    {r4, r5, r6, r7, lr}
00077f7e  add     r7, sp, #0xc
00077f80  str     r8, [sp, #-0x4]!
00077f84  ldr.w   r3, [r0, #0xa4]
00077f88  mov     r5, r0
00077f8a  ldr.w   r4, [r0, #0x108]
00077f8e  adds    r3, #1
00077f90  ldr.w   r6, [r0, r3, lsl #3]
00077f94  cmp.w   r6, #0x750
00077f98  beq     #0x78090
00077f9a  ble     #0x77fb6
00077f9c  movw    r2, #0x757
00077fa0  cmp     r6, r2
00077fa2  beq.w   #0x780b6
00077fa6  cmp.w   r6, #0x758
00077faa  beq     #0x7806c
00077fac  mvn     r0, #2
00077fb0  ldr     r8, [sp], #4
00077fb4  pop     {r4, r5, r6, r7, pc}
00077fb6  cbz     r6, #0x77fec
00077fb8  movw    r2, #0x74f
00077fbc  cmp     r6, r2
00077fbe  bne     #0x77fac
00077fc0  mov.w   r2, #0x750
00077fc4  str.w   r2, [r0, r3, lsl #3]
00077fc8  ldr.w   r2, [pc, #0x10c]
00077fcc  ldr.w   r3, [r0, #0xa4]
00077fd0  add     r2, pc ; -> 0x0007c399  t_saw_strike_check
00077fd2  adds    r3, #1
00077fd4  str.w   r3, [r0, #0xa4]
00077fd8  lsls    r3, r3, #3
00077fda  adds    r3, r3, r5
00077fdc  movs    r0, #0
00077fde  str     r2, [r3, #4]
00077fe0  ldr.w   r3, [r5, #0xa4]
00077fe4  adds    r3, #1
00077fe6  str.w   r0, [r5, r3, lsl #3]
00077fea  b       #0x77fb0
00077fec  ldr     r2, [r4, #4]
00077fee  movw    r3, #0x206
00077ff2  mov     r0, r4
00077ff4  str.w   r3, [r2, #0x104]
00077ff8  ldr     r3, [pc, #0xe0]
00077ffa  ldr     r2, [r4, #8]
00077ffc  add     r3, pc ; -> 0x000f357c  G
00077ffe  ldr.w   r8, [r3]
00078002  ldr.w   r3, [r8, #0xac]
00078006  str     r3, [r4, #0x20]
00078008  strh    r3, [r2, #0x12]
0007800a  bl      #0x55394 ; -> flip_multi
0007800e  ldr.w   r2, [r8, #0x470]
00078012  ldr.w   r3, [r8, #0x468]
00078016  ldr     r1, [r4, #8]
00078018  mov     r0, r4
0007801a  add     r3, r2
0007801c  add.w   r3, r3, r3, lsr #31
00078020  asrs    r3, r3, #1
00078022  strh    r3, [r1, #0xe]
00078024  mvn     r3, #0xc7
00078028  str     r6, [r4, #0x20]
0007802a  str     r3, [r4, #0x1c]
0007802c  bl      #0x570ac ; -> multi_adjust_xy
00078030  mov     r0, r4
00078032  movs    r6, #2
00078034  str     r6, [r4, #0x40]
00078036  bl      #0x55228 ; -> get_char_ani2
0007803a  mov.w   r3, #0x80000
0007803e  mov     r0, r4
00078040  str     r3, [r4, #0x1c]
00078042  str     r6, [r4, #0x20]
00078044  bl      #0x75d6c ; -> set_proj_vel
00078048  mov     r0, r4
0007804a  movs    r3, #5
0007804c  str     r3, [r4, #0x1c]
0007804e  bl      #0x57be4 ; -> ochar_sound
00078052  movs    r3, #0x10
00078054  str     r3, [r4, #0x44]
00078056  ldr.w   r3, [r5, #0xa4]
0007805a  movs    r0, #1
0007805c  movw    r2, #0x74f
00078060  adds    r3, #1
00078062  str.w   r2, [r5, r3, lsl #3]
00078066  str.w   r0, [r5, #0xfc]
0007806a  b       #0x77fb0
0007806c  mov     r0, r4
0007806e  bl      #0x75714 ; -> proj_onscreen_test
00078072  ldr     r0, [r4, #0x5c]
00078074  cbnz    r0, #0x780d0
00078076  ldr.w   r3, [r5, #0xa4]
0007807a  ldr     r2, [pc, #0x64]
0007807c  lsls    r3, r3, #3
0007807e  adds    r3, r3, r5
00078080  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
00078082  str     r2, [r3, #4]
00078084  ldr.w   r3, [r5, #0xa4]
00078088  adds    r3, #1
0007808a  str.w   r0, [r5, r3, lsl #3]
0007808e  b       #0x77fb0
00078090  mov     r0, r4
00078092  bl      #0x5a680 ; -> next_anirate
00078096  ldr     r3, [r4, #0x44]
00078098  subs    r3, #1
0007809a  cmp     r3, #0
0007809c  str     r3, [r4, #0x44]
0007809e  bgt     #0x78056
000780a0  ldr.w   r3, [r5, #0xa4]
000780a4  movs    r0, #1
000780a6  movw    r2, #0x757
000780aa  adds    r3, #1
000780ac  str.w   r2, [r5, r3, lsl #3]
000780b0  str.w   r0, [r5, #0xfc]
000780b4  b       #0x77fb0
000780b6  mov.w   r2, #0x758
000780ba  str.w   r2, [r0, r3, lsl #3]
000780be  ldr.w   r2, [pc, #0x24]
000780c2  ldr.w   r3, [r0, #0xa4]
000780c6  add     r2, pc ; -> 0x0007c399  t_saw_strike_check
000780c8  adds    r3, #1
000780ca  str.w   r3, [r0, #0xa4]
000780ce  b       #0x77fd8
000780d0  mov     r0, r4
000780d2  bl      #0x5a680 ; -> next_anirate
000780d6  b       #0x780a0
000780d8  mvns    r5, r0
000780da  movs    r0, r0
000780dc  push    {r2, r3, r4, r5, r6, lr}
000780de  movs    r7, r0
000780e0  bpl     #0x780a6
