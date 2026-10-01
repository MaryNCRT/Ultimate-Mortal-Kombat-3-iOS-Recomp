========================================================================
t_f_smoke_ninja  0x000a5fc8  388 bytes   mkfriend.c
========================================================================

000a5fc8  push    {r4, r5, r6, r7, lr}
000a5fca  add     r7, sp, #0xc
000a5fcc  str     r8, [sp, #-0x4]!
000a5fd0  mov     r4, r0
000a5fd2  ldr.w   r3, [r4, #0xa4]
000a5fd6  movw    r6, #0x5d3
000a5fda  ldr.w   r0, [r0, #0x108]
000a5fde  adds    r3, #1
000a5fe0  ldr.w   r5, [r4, r3, lsl #3]
000a5fe4  cmp     r5, r6
000a5fe6  beq.w   #0xa611c
000a5fea  ble     #0xa600c
000a5fec  movw    r1, #0x5d6
000a5ff0  cmp     r5, r1
000a5ff2  beq     #0xa60bc
000a5ff4  cmp.w   r5, #0x5d8
000a5ff8  beq     #0xa605a
000a5ffa  movw    r2, #0x5d5
000a5ffe  cmp     r5, r2
000a6000  beq     #0xa60e0
000a6002  mvn     r0, #2
000a6006  ldr     r8, [sp], #4
000a600a  pop     {r4, r5, r6, r7, pc}
000a600c  movw    r8, #0x5cd
000a6010  cmp     r5, r8
000a6012  beq     #0xa60f6
000a6014  movw    r3, #0x5cf
000a6018  cmp     r5, r3
000a601a  beq     #0xa6086
000a601c  cmp     r5, #0
000a601e  bne     #0xa6002
000a6020  ldr.w   r1, [pc, #0x108]
000a6024  add     r1, pc ; -> 0x000a5809  t_end_friend_proc
000a6026  bl      #0x58a10 ; -> NewThread
000a602a  ldr.w   r3, [r4, #0xa4]
000a602e  mov     r0, r5
000a6030  adds    r3, #1
000a6032  str.w   r8, [r4, r3, lsl #3]
000a6036  ldr.w   r3, [r4, #0xa4]
000a603a  adds    r2, r3, #1
000a603c  ldr.w   r3, [pc, #0xf0]
000a6040  str.w   r2, [r4, #0xa4]
000a6044  add     r3, pc ; -> 0x000f36c4  t_robo_open_chest
000a6046  ldr     r1, [r3]
000a6048  lsls    r3, r2, #3
000a604a  adds    r3, r3, r4
000a604c  str     r1, [r3, #4]
000a604e  ldr.w   r3, [r4, #0xa4]
000a6052  adds    r3, #1
000a6054  str.w   r5, [r4, r3, lsl #3]
000a6058  b       #0xa6006
000a605a  movw    r2, #0x5d9
000a605e  str.w   r2, [r4, r3, lsl #3]
000a6062  ldr.w   r3, [r4, #0xa4]
000a6066  adds    r2, r3, #1
000a6068  ldr     r3, [pc, #0xc8]
000a606a  str.w   r2, [r4, #0xa4]
000a606e  add     r3, pc ; -> 0x000f36e4  t_victory_animation
000a6070  ldr     r1, [r3]
000a6072  lsls    r3, r2, #3
000a6074  adds    r3, r3, r4
000a6076  movs    r0, #0
000a6078  str     r1, [r3, #4]
000a607a  ldr.w   r3, [r4, #0xa4]
000a607e  adds    r3, #1
000a6080  str.w   r0, [r4, r3, lsl #3]
000a6084  b       #0xa6006
000a6086  movs    r3, #0x22
000a6088  str     r3, [r0, #0x1c]
000a608a  bl      #0x57be4 ; -> ochar_sound
000a608e  ldr.w   r3, [r4, #0xa4]
000a6092  ldr.w   r2, [pc, #0xa4]
000a6096  adds    r3, #1
000a6098  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a609a  str.w   r6, [r4, r3, lsl #3]
000a609e  ldr.w   r3, [r4, #0xa4]
000a60a2  adds    r3, #1
000a60a4  str.w   r3, [r4, #0xa4]
000a60a8  lsls    r3, r3, #3
000a60aa  adds    r3, r3, r4
000a60ac  movs    r0, #0
000a60ae  str     r2, [r3, #4]
000a60b0  ldr.w   r3, [r4, #0xa4]
000a60b4  adds    r3, #1
000a60b6  str.w   r0, [r4, r3, lsl #3]
000a60ba  b       #0xa6006
000a60bc  bl      #0x56d20 ; -> delete_slave
000a60c0  ldr.w   r3, [r4, #0xa4]
000a60c4  mov.w   r2, #0x5d8
000a60c8  adds    r3, #1
000a60ca  str.w   r2, [r4, r3, lsl #3]
000a60ce  ldr.w   r3, [r4, #0xa4]
000a60d2  adds    r2, r3, #1
000a60d4  ldr.w   r3, [pc, #0x64]
000a60d8  str.w   r2, [r4, #0xa4]
000a60dc  add     r3, pc ; -> 0x000f36bc  t_robo_close_chest
000a60de  b       #0xa6070
000a60e0  str.w   r1, [r4, r3, lsl #3]
000a60e4  ldr.w   r2, [pc, #0x58]
000a60e8  ldr.w   r3, [r4, #0xa4]
000a60ec  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a60ee  adds    r3, #1
000a60f0  str.w   r3, [r4, #0xa4]
000a60f4  b       #0xa60a8
000a60f6  ldr.w   r3, [pc, #0x4c]
000a60fa  movw    r2, #0x5cf
000a60fe  add     r3, pc ; -> 0x00177e90  a_smoke_friend
000a6100  str     r3, [r0, #0x40]
000a6102  ldr.w   r3, [r4, #0xa4]
000a6106  adds    r3, #1
000a6108  str.w   r2, [r4, r3, lsl #3]
000a610c  ldr     r2, [pc, #0x38]
000a610e  ldr.w   r3, [r4, #0xa4]
000a6112  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a6114  adds    r3, #1
000a6116  str.w   r3, [r4, #0xa4]
000a611a  b       #0xa60a8
000a611c  movs    r0, #0x10
000a611e  movw    r2, #0x5d5
000a6122  str.w   r2, [r4, r3, lsl #3]
000a6126  str.w   r0, [r4, #0xfc]
000a612a  b       #0xa6006
000a612c  bl      #0x8812e
000a6130  bvs     #0xa622c ; -> t_f_shang
000a6132  movs    r4, r0
000a6134  bvs     #0xa621c
000a6136  movs    r4, r0
000a6138  bl      #0xffeac13a
000a613c  bpl     #0xa60f8
000a613e  movs    r4, r0
000a6140  bl      #0xffe58142
000a6144  adds    r6, r1, #6
000a6146  movs    r5, r1
000a6148  bl      #0xffe3214a
