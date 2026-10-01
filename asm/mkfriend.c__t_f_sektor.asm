========================================================================
t_f_sektor  0x000a6698  156 bytes   mkfriend.c
========================================================================

000a6698  push    {r4, r5, r7, lr}
000a669a  add     r7, sp, #8
000a669c  ldr.w   r1, [r0, #0xa4]
000a66a0  mov     r4, r0
000a66a2  ldr.w   r5, [r0, #0x108]
000a66a6  adds    r2, r1, #1
000a66a8  ldr.w   r3, [r0, r2, lsl #3]
000a66ac  cmp.w   r3, #0x410
000a66b0  beq     #0xa6708
000a66b2  movw    r2, #0x411
000a66b6  cmp     r3, r2
000a66b8  beq     #0xa66f0
000a66ba  cbz     r3, #0xa66c2
000a66bc  mvn     r0, #2
000a66c0  pop     {r4, r5, r7, pc}
000a66c2  ldr     r1, [pc, #0x60]
000a66c4  mov     r0, r5
000a66c6  add     r1, pc ; -> 0x000a5d9d  t_dinger_proc
000a66c8  bl      #0x58a10 ; -> NewThread
000a66cc  ldr.w   r3, [pc, #0x58]
000a66d0  mov     r0, r5
000a66d2  add     r3, pc ; -> 0x00177c88  a_robo1_friend
000a66d4  str     r3, [r5, #0x40]
000a66d6  bl      #0x59e24 ; -> do_next_a9_frame
000a66da  ldr.w   r3, [r4, #0xa4]
000a66de  movs    r0, #0x50
000a66e0  mov.w   r2, #0x410
000a66e4  adds    r3, #1
000a66e6  str.w   r2, [r4, r3, lsl #3]
000a66ea  str.w   r0, [r4, #0xfc]
000a66ee  b       #0xa66c0
000a66f0  ldr     r2, [pc, #0x38]
000a66f2  lsls    r3, r1, #3
000a66f4  add     r2, pc ; -> 0x000a5991  t_friendship_complete
000a66f6  adds    r3, r3, r4
000a66f8  movs    r0, #0
000a66fa  str     r2, [r3, #4]
000a66fc  ldr.w   r3, [r4, #0xa4]
000a6700  adds    r3, #1
000a6702  str.w   r0, [r4, r3, lsl #3]
000a6706  b       #0xa66c0
000a6708  movw    r3, #0x411
000a670c  str.w   r3, [r0, r2, lsl #3]
000a6710  ldr.w   r3, [r0, #0xa4]
000a6714  ldr     r2, [pc, #0x18]
000a6716  adds    r3, #1
000a6718  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a671a  str.w   r3, [r0, #0xa4]
000a671e  lsls    r3, r3, #3
000a6720  b       #0xa66f6
000a6722  nop     
000a6724  bl      #0xfff7a726
000a6728  asrs    r2, r6, #0x16
000a672a  movs    r5, r1
000a672c  bl      #0x34072e
