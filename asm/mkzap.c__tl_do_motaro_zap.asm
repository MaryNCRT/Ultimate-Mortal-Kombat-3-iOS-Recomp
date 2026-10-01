========================================================================
tl_do_motaro_zap  0x0007945c  308 bytes   mkzap.c
========================================================================

0007945c  push    {r4, r5, r6, r7, lr}
0007945e  add     r7, sp, #0xc
00079460  str     r8, [sp, #-0x4]!
00079464  ldr.w   r2, [r0, #0xa4]
00079468  movw    r8, #0x692
0007946c  mov     r4, r0
0007946e  adds    r3, r2, #1
00079470  ldr.w   r5, [r0, #0x108]
00079474  ldr.w   r6, [r0, r3, lsl #3]
00079478  cmp     r6, r8
0007947a  beq     #0x794fa
0007947c  ble     #0x79496
0007947e  movw    r3, #0x693
00079482  cmp     r6, r3
00079484  beq     #0x7950a
00079486  cmp.w   r6, #0x6a0
0007948a  beq     #0x794de
0007948c  mvn     r0, #2
00079490  ldr     r8, [sp], #4
00079494  pop     {r4, r5, r6, r7, pc}
00079496  cmp     r6, #0
00079498  bne     #0x7948c
0007949a  mov     r0, r5
0007949c  str     r6, [r5, #0x44]
0007949e  bl      #0x792fc ; -> zap_init_special
000794a2  mov     r0, r5
000794a4  movs    r3, #6
000794a6  str     r3, [r5, #0x40]
000794a8  bl      #0x5520c ; -> get_char_ani
000794ac  movs    r3, #4
000794ae  str     r3, [r5, #0x1c]
000794b0  ldr.w   r3, [r4, #0xa4]
000794b4  mov     r0, r6
000794b6  adds    r3, #1
000794b8  str.w   r8, [r4, r3, lsl #3]
000794bc  ldr.w   r3, [r4, #0xa4]
000794c0  adds    r2, r3, #1
000794c2  ldr     r3, [pc, #0xbc]
000794c4  str.w   r2, [r4, #0xa4]
000794c8  add     r3, pc ; -> 0x000f37cc  t_mframew
000794ca  ldr     r1, [r3]
000794cc  lsls    r3, r2, #3
000794ce  adds    r3, r3, r4
000794d0  str     r1, [r3, #4]
000794d2  ldr.w   r3, [r4, #0xa4]
000794d6  adds    r3, #1
000794d8  str.w   r6, [r4, r3, lsl #3]
000794dc  b       #0x79490
000794de  ldr.w   r3, [pc, #0xa4]
000794e2  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000794e4  ldr     r1, [r3]
000794e6  lsls    r3, r2, #3
000794e8  adds    r3, r3, r4
000794ea  movs    r0, #0
000794ec  str     r1, [r3, #4]
000794ee  ldr.w   r3, [r4, #0xa4]
000794f2  adds    r3, #1
000794f4  str.w   r0, [r4, r3, lsl #3]
000794f8  b       #0x79490
000794fa  movw    r2, #0x693
000794fe  str.w   r2, [r0, r3, lsl #3]
00079502  movs    r0, #4
00079504  str.w   r0, [r4, #0xfc]
00079508  b       #0x79490
0007950a  ldr.w   r1, [r0, #0xf8]
0007950e  ldr     r2, [r5, #0x40]
00079510  movs    r6, #5
00079512  lsls    r3, r1, #2
00079514  adds    r3, r3, r0
00079516  str.w   r2, [r3, #0xa8]
0007951a  adds    r3, r1, #1
0007951c  str.w   r3, [r0, #0xf8]
00079520  mov     r0, r5
00079522  bl      #0x55450 ; -> find_part2
00079526  mov     r0, r5
00079528  str     r6, [r5, #0x1c]
0007952a  bl      #0x57be4 ; -> ochar_sound
0007952e  ldr     r3, [pc, #0x58]
00079530  mov     r0, r5
00079532  add     r3, pc ; -> 0x00076c39  t_motaro_zap_proc
00079534  str     r3, [r5, #0x38]
00079536  bl      #0x75964 ; -> create_proj_proc
0007953a  ldr     r3, [r5]
0007953c  ldr     r2, [r5, #0x40]
0007953e  mov     r0, r5
00079540  ldr     r3, [r3, #0x64]
00079542  str     r2, [r3, #0x40]
00079544  ldr.w   r3, [r4, #0xf8]
00079548  subs    r3, #1
0007954a  str.w   r3, [r4, #0xf8]
0007954e  lsls    r3, r3, #2
00079550  adds    r3, r3, r4
00079552  ldr.w   r3, [r3, #0xa8]
00079556  str     r3, [r5, #0x40]
00079558  bl      #0x7568c ; -> detach_proj
0007955c  str     r6, [r5, #0x1c]
0007955e  ldr.w   r3, [r4, #0xa4]
00079562  mov.w   r2, #0x6a0
00079566  adds    r3, #1
00079568  str.w   r2, [r4, r3, lsl #3]
0007956c  ldr.w   r3, [r4, #0xa4]
00079570  adds    r2, r3, #1
00079572  ldr.w   r3, [pc, #0x18]
00079576  str.w   r2, [r4, #0xa4]
0007957a  add     r3, pc ; -> 0x000f37cc  t_mframew
0007957c  b       #0x794e4
0007957e  nop     
00079580  adr     r3, #0
00079582  movs    r7, r0
00079584  adr     r2, #0x88
00079586  movs    r7, r0
00079588  bvc     #0x79592
