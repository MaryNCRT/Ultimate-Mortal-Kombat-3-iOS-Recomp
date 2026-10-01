========================================================================
q_is_tracker_close  0x000701d8  68 bytes   mkdrone.c
========================================================================

000701d8  push    {r4, r7, lr}
000701da  add     r7, sp, #4
000701dc  mov     r4, r0
000701de  bl      #0x6ff18 ; -> get_his_proj_proc
000701e2  ldr     r3, [r4, #0x1c]
000701e4  cbz     r3, #0x7020a
000701e6  ldr     r3, [r3, #8]
000701e8  ldrsh.w r2, [r3, #0xe]
000701ec  ldr     r3, [r4, #8]
000701ee  str     r2, [r4, #0x20]
000701f0  ldrsh.w r3, [r3, #0xe]
000701f4  str     r3, [r4, #0x24]
000701f6  rsb     r3, r3, r2
000701fa  cmp     r3, #0
000701fc  str     r3, [r4, #0x20]
000701fe  itt     lt
00070200  rsblt   r3, r3, #0
00070202  strlt   r3, [r4, #0x20]
00070204  ldr     r3, [r4, #0x20]
00070206  cmp     r3, #0x6f
00070208  bgt     #0x70212
0007020a  mov     r0, r4
0007020c  bl      #0x6751c ; -> vq_yes
00070210  pop     {r4, r7, pc}
00070212  mov     r0, r4
00070214  bl      #0x67514 ; -> vq_no
00070218  b       #0x70210
0007021a  nop     
