========================================================================
t_wait_proj_pass  0x0006ffd4  264 bytes   mkdrone.c
========================================================================

0006ffd4  push    {r4, r5, r7, lr}
0006ffd6  add     r7, sp, #8
0006ffd8  ldr.w   r3, [r0, #0xa4]
0006ffdc  mov     r4, r0
0006ffde  ldr.w   r5, [r0, #0x108]
0006ffe2  adds    r2, r3, #1
0006ffe4  ldr.w   r3, [r0, r2, lsl #3]
0006ffe8  cbnz    r3, #0x6fffa
0006ffea  movw    r3, #0xfbf
0006ffee  str.w   r3, [r0, r2, lsl #3]
0006fff2  movs    r0, #1
0006fff4  str.w   r0, [r4, #0xfc]
0006fff8  pop     {r4, r5, r7, pc}
0006fffa  movw    r2, #0xfbf
0006fffe  cmp     r3, r2
00070000  it      ne
00070002  mvnne   r0, #2
00070006  bne     #0x6fff8
00070008  mov     r0, r5
0007000a  bl      #0x6ff18 ; -> get_his_proj_proc
0007000e  ldr     r3, [r5, #0x1c]
00070010  cmp     r3, #0
00070012  beq     #0x70096
00070014  ldr.w   lr, [r3]
00070018  ldr.w   r0, [lr, #0x84]
0007001c  cbnz    r0, #0x70038
0007001e  ldr.w   r3, [r4, #0xa4]
00070022  ldr     r2, [pc, #0xac]
00070024  lsls    r3, r3, #3
00070026  adds    r3, r3, r4
00070028  add     r2, pc ; -> 0x0006ffd5  t_wait_proj_pass
0007002a  str     r2, [r3, #4]
0007002c  ldr.w   r3, [r4, #0xa4]
00070030  adds    r3, #1
00070032  str.w   r0, [r4, r3, lsl #3]
00070036  b       #0x6fff8
00070038  ldr     r1, [r3, #8]
0007003a  ldrsh.w r3, [r1, #0xe]
0007003e  str     r3, [r5, #0x28]
00070040  ldr     r2, [r0]
00070042  str     r2, [r5, #0x24]
00070044  ldr     r0, [r0, #8]
00070046  str     r0, [r5, #0x2c]
00070048  ldr     r3, [r1, #0x28]
0007004a  tst.w   r3, #0x10
0007004e  str     r3, [r5, #0x34]
00070050  it      ne
00070052  rsbne   r2, r2, #0
00070054  ldr     r3, [r5, #0x28]
00070056  it      ne
00070058  strne   r2, [r5, #0x24]
0007005a  ldr     r2, [r5, #0x24]
0007005c  itt     ne
0007005e  rsbne   r0, r0, #0
00070060  strne   r0, [r5, #0x2c]
00070062  adds    r3, r3, r2
00070064  ldr     r2, [r5, #0x2c]
00070066  subs    r3, r3, r2
00070068  ldr     r2, [r5, #8]
0007006a  str     r3, [r5, #0x28]
0007006c  ldrsh.w r2, [r2, #0xe]
00070070  str     r2, [r5, #0x24]
00070072  ldr     r1, [r1, #0x28]
00070074  mov     r0, r2
00070076  tst.w   r1, #0x10
0007007a  itttt   ne
0007007c  strne   r2, [r5, #0x28]
0007007e  movne   r2, r3
00070080  movne   r3, r0
00070082  strne   r2, [r5, #0x24]
00070084  cmp     r2, r3
00070086  str     r1, [r5, #0x34]
00070088  ittt    le
0007008a  movwle  r3, #0x505
0007008e  strle   r3, [r5, #0x20]
00070090  strle.w r3, [lr, #0x18]
00070094  bgt     #0x700c2
00070096  ldr.w   r3, [r4, #0xa4]
0007009a  cmp     r3, #0
0007009c  ble     #0x700a8
0007009e  subs    r3, #1
000700a0  movs    r0, #0
000700a2  str.w   r3, [r4, #0xa4]
000700a6  b       #0x6fff8
000700a8  ldr     r2, [pc, #0x28]
000700aa  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000700ac  ldr     r2, [r2]
000700ae  lsls    r3, r3, #3
000700b0  adds    r3, r3, r4
000700b2  movs    r0, #0
000700b4  str     r2, [r3, #4]
000700b6  ldr.w   r3, [r4, #0xa4]
000700ba  adds    r3, #1
000700bc  str.w   r0, [r4, r3, lsl #3]
000700c0  b       #0x6fff8
000700c2  ldr.w   r2, [pc, #0x14]
000700c6  ldr.w   r3, [r4, #0xa4]
000700ca  add     r2, pc ; -> 0x0006ffd5  t_wait_proj_pass
000700cc  b       #0x700ae
000700ce  nop     
