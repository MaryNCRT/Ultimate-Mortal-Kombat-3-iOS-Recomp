========================================================================
t_summon_proc  0x00078ed8  388 bytes   mkzap.c
========================================================================

00078ed8  push    {r4, r5, r6, r7, lr}
00078eda  add     r7, sp, #0xc
00078edc  str     r8, [sp, #-0x4]!
00078ee0  ldr.w   r3, [r0, #0xa4]
00078ee4  movw    r8, #0xb26
00078ee8  mov     r5, r0
00078eea  adds    r3, #1
00078eec  ldr.w   r4, [r0, #0x108]
00078ef0  ldr.w   r6, [r0, r3, lsl #3]
00078ef4  cmp     r6, r8
00078ef6  beq     #0x78fc2
00078ef8  movw    r3, #0xb4c
00078efc  cmp     r6, r3
00078efe  beq     #0x78f88
00078f00  cbz     r6, #0x78f0c
00078f02  mvn     r0, #2
00078f06  ldr     r8, [sp], #4
00078f0a  pop     {r4, r5, r6, r7, pc}
00078f0c  ldr.w   r1, [r0, #0xf8]
00078f10  ldr     r2, [r4, #0x48]
00078f12  lsls    r3, r1, #2
00078f14  adds    r3, r3, r0
00078f16  str.w   r2, [r3, #0xa8]
00078f1a  adds    r3, r1, #1
00078f1c  str.w   r3, [r0, #0xf8]
00078f20  mov     r0, r4
00078f22  movs    r3, #0x1a
00078f24  str     r3, [r4, #0x40]
00078f26  bl      #0x55228 ; -> get_char_ani2
00078f2a  ldr     r3, [r4, #0x40]
00078f2c  mov     r0, r6
00078f2e  str     r3, [r4, #0x48]
00078f30  ldr.w   r3, [r5, #0xf8]
00078f34  subs    r3, #1
00078f36  str.w   r3, [r5, #0xf8]
00078f3a  lsls    r3, r3, #2
00078f3c  adds    r3, r3, r5
00078f3e  ldr     r2, [r4, #8]
00078f40  ldr.w   r3, [r3, #0xa8]
00078f44  str     r3, [r4, #0x48]
00078f46  strh    r3, [r2, #0xe]
00078f48  ldr     r3, [pc, #0xfc]
00078f4a  ldr     r2, [r4, #8]
00078f4c  add     r3, pc ; -> 0x000f357c  G
00078f4e  ldr     r3, [r3]
00078f50  ldr.w   r3, [r3, #0xac]
00078f54  subs    r3, #0x10
00078f56  strh    r3, [r2, #0x12]
00078f58  movs    r3, #4
00078f5a  str     r3, [r4, #0x1c]
00078f5c  ldr.w   r3, [r5, #0xa4]
00078f60  adds    r3, #1
00078f62  str.w   r8, [r5, r3, lsl #3]
00078f66  ldr.w   r3, [r5, #0xa4]
00078f6a  adds    r2, r3, #1
00078f6c  ldr     r3, [pc, #0xdc]
00078f6e  str.w   r2, [r5, #0xa4]
00078f72  add     r3, pc ; -> 0x000f37cc  t_mframew
00078f74  ldr     r1, [r3]
00078f76  lsls    r3, r2, #3
00078f78  adds    r3, r3, r5
00078f7a  str     r1, [r3, #4]
00078f7c  ldr.w   r3, [r5, #0xa4]
00078f80  adds    r3, #1
00078f82  str.w   r6, [r5, r3, lsl #3]
00078f86  b       #0x78f06
00078f88  ldr     r3, [r4]
00078f8a  ldr     r3, [r3, #0x28]
00078f8c  str     r3, [r4, #0x1c]
00078f8e  cmp     r3, #0
00078f90  beq     #0x79020
00078f92  mov     r0, r4
00078f94  bl      #0x5a680 ; -> next_anirate
00078f98  mov     r0, r4
00078f9a  ldr     r1, [r4, #8]
00078f9c  bl      #0x55820 ; -> lowest_mpart_ob
00078fa0  ldr     r0, [r4, #0x20]
00078fa2  mvn     r3, #0xc7
00078fa6  str     r3, [r4, #0x1c]
00078fa8  cmp     r0, r3
00078faa  ble     #0x79004
00078fac  ldr.w   r3, [r5, #0xa4]
00078fb0  movs    r0, #1
00078fb2  movw    r2, #0xb4c
00078fb6  adds    r3, #1
00078fb8  str.w   r2, [r5, r3, lsl #3]
00078fbc  str.w   r0, [r5, #0xfc]
00078fc0  b       #0x78f06
00078fc2  ldr.w   r1, [pc, #0x8c]
00078fc6  mov     r0, r4
00078fc8  add     r1, pc ; -> 0x000774a5  t_summon_flame_animator
00078fca  bl      #0x58b54 ; -> NewThreadProc
00078fce  mov     r0, r4
00078fd0  movs    r3, #0x1a
00078fd2  str     r3, [r4, #0x40]
00078fd4  bl      #0x55228 ; -> get_char_ani2
00078fd8  mov     r0, r4
00078fda  bl      #0x55450 ; -> find_part2
00078fde  mov     r0, r4
00078fe0  bl      #0x55450 ; -> find_part2
00078fe4  ldr     r2, [r4]
00078fe6  movs    r3, #0xf
00078fe8  mov     r0, r4
00078fea  str     r3, [r2, #0x18]
00078fec  ldr     r3, [pc, #0x64]
00078fee  ldr     r2, [r4, #8]
00078ff0  str     r3, [r2, #0x1c]
00078ff2  movs    r3, #4
00078ff4  str     r3, [r4, #0x1c]
00078ff6  bl      #0x553a0 ; -> init_anirate
00078ffa  ldr     r0, [r4]
00078ffc  movs    r3, #0
00078ffe  str     r3, [r4, #0x1c]
00079000  str     r3, [r0, #0x28]
00079002  b       #0x78fac
00079004  ldr.w   r3, [r5, #0xa4]
00079008  ldr     r2, [pc, #0x4c]
0007900a  movs    r0, #0
0007900c  lsls    r3, r3, #3
0007900e  adds    r3, r3, r5
00079010  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
00079012  str     r2, [r3, #4]
00079014  ldr.w   r3, [r5, #0xa4]
00079018  adds    r3, #1
0007901a  str.w   r0, [r5, r3, lsl #3]
0007901e  b       #0x78f06
00079020  mov     r0, r4
00079022  bl      #0x68e20 ; -> q_is_he_a_boss
00079026  ldr     r3, [r4, #0x5c]
00079028  cmp     r3, #0
0007902a  bne     #0x78f92
0007902c  mov     r0, r4
0007902e  adds    r3, #0x12
00079030  str     r3, [r4, #0x1c]
00079032  bl      #0x594c8 ; -> strike_check_a0
00079036  ldr     r3, [r4, #0x5c]
00079038  cmp     r3, #0
0007903a  beq     #0x78f92
0007903c  ldr     r3, [r4]
0007903e  movs    r2, #1
00079040  str     r2, [r4, #0x1c]
00079042  str     r2, [r3, #0x28]
00079044  b       #0x78f92
00079046  nop     
00079048  adr     r6, #0xb0
0007904a  movs    r7, r0
0007904c  add     r0, sp, #0x158
0007904e  movs    r7, r0
00079050  b       #0x78a06
